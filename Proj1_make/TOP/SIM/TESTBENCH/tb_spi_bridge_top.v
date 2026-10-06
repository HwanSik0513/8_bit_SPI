`timescale 1ns/1ps

module tb_spi_bridge_top;

localparam [7:0] ADDR_RX_DATA    = 8'h00,
                  ADDR_STATUS     = 8'h04,
                  ADDR_CONTROL    = 8'h08,
                  ADDR_FIFO_LEVEL = 8'h0C,
                  ADDR_TX_DATA    = 8'h10;

localparam N_RX_FRAMES = 6;

reg         ACLK;
reg         ARESETn;

reg  [7:0]  i_bus_addr;
reg         i_bus_wr_en;
reg  [7:0]  i_bus_wdata;
reg         i_bus_rd_en;
wire [7:0]  o_bus_rdata;

wire        o_overflow;
wire        o_rx_valid;

wire        o_dbg_sclk;
wire        o_dbg_cs_n;
wire        o_dbg_mosi;
wire        o_dbg_miso;

integer errors;

spi_bridge_top dut (
    .ACLK        (ACLK),
    .ARESETn     (ARESETn),
    .i_bus_addr  (i_bus_addr),
    .i_bus_wr_en (i_bus_wr_en),
    .i_bus_wdata (i_bus_wdata),
    .i_bus_rd_en (i_bus_rd_en),
    .o_bus_rdata (o_bus_rdata),
    .o_overflow  (o_overflow),
    .o_rx_valid  (o_rx_valid),
    .o_dbg_sclk  (o_dbg_sclk),
    .o_dbg_cs_n  (o_dbg_cs_n),
    .o_dbg_mosi  (o_dbg_mosi),
    .o_dbg_miso  (o_dbg_miso)
);

initial ACLK = 1'b0;
always  #5 ACLK = ~ACLK;   // 100 MHz

// ---------------------------------------------------------------------
// Bus access tasks
// ---------------------------------------------------------------------
task bus_write(input [7:0] addr, input [7:0] data);
begin
    @(posedge ACLK);
    i_bus_addr  = addr;
    i_bus_wdata = data;
    i_bus_wr_en = 1'b1;
    @(posedge ACLK);
    i_bus_wr_en = 1'b0;
end
endtask

task bus_read(input [7:0] addr, output [7:0] data);
begin
    @(posedge ACLK);
    i_bus_addr  = addr;
    i_bus_rd_en = 1'b1;
    #1;
    data = o_bus_rdata;
    @(posedge ACLK);
    i_bus_rd_en = 1'b0;
end
endtask

task check_eq(input [255:0] label, input [31:0] exp, input [31:0] got);
begin
    if (exp !== got) begin
        $display("[%0t] FAIL: %0s expected=%0h got=%0h", $time, label, exp, got);
        errors = errors + 1;
    end else begin
        $display("[%0t] PASS: %0s = %0h", $time, label, got);
    end
end
endtask

// ---------------------------------------------------------------------
// Background: reconstruct whatever byte is being shifted out on
// o_dbg_miso, MSB-first, sampling on the SCLK falling edge (matches
// spi_slave.v's o_miso update edge) -- captured purely from the debug
// pins, independent of anything internal.
// ---------------------------------------------------------------------
reg [7:0] miso_shift;
reg [2:0] miso_bit_idx;
reg       miso_capturing;
reg [7:0] miso_last_byte;
reg       miso_byte_ready;

initial begin
    miso_capturing  = 1'b0;
    miso_byte_ready = 1'b0;
    miso_bit_idx    = 3'd0;
end

always @(negedge o_dbg_cs_n) begin
    // New frame starting: arm the capture, first bit begins with the
    // NEXT SCLK falling edge (mirrors the LOAD/RECEIVE latency).
    miso_capturing = 1'b1;
    miso_bit_idx   = 3'd0;
end

always @(posedge o_dbg_cs_n) begin
    miso_capturing = 1'b0;
end

always @(negedge o_dbg_sclk) begin
    if (miso_capturing) begin
        miso_shift = {miso_shift[6:0], o_dbg_miso};
        if (miso_bit_idx == 3'd7) begin
            miso_last_byte  = {miso_shift[6:0], o_dbg_miso};
            miso_byte_ready = 1'b1;
            miso_bit_idx    = 3'd0;
        end else begin
            miso_bit_idx = miso_bit_idx + 3'd1;
        end
    end
end

// ---------------------------------------------------------------------
// Background: track how many RX bytes have been consumed and what they
// were, via STATUS_REG polling + RX_DATA_REG reads.
// ---------------------------------------------------------------------
integer expected_rx_byte;
integer rx_frames_checked;
reg  [7:0] status_val;
reg  [7:0] rx_val;

initial begin
    errors            = 0;
    expected_rx_byte  = 0;
    rx_frames_checked = 0;

    i_bus_addr  = 8'h00;
    i_bus_wr_en = 1'b0;
    i_bus_wdata = 8'h00;
    i_bus_rd_en = 1'b0;
    ARESETn     = 1'b0;

    repeat (10) @(posedge ACLK);
    ARESETn = 1'b1;
    repeat (10) @(posedge ACLK);

    $display("[%0t] TEST 1: RX path end-to-end, %0d frames", $time, N_RX_FRAMES);
    while (rx_frames_checked < N_RX_FRAMES) begin
        bus_read(ADDR_STATUS, status_val);
        if (status_val[3]) begin                 // RX_VALID
            bus_read(ADDR_RX_DATA, rx_val);
            check_eq("RX_DATA_REG sequential byte", expected_rx_byte[7:0], rx_val);
            expected_rx_byte  = (expected_rx_byte + 1) & 8'hFF;
            rx_frames_checked = rx_frames_checked + 1;
        end else begin
            repeat (20) @(posedge ACLK);          // give the pipeline time
        end
    end

    $display("[%0t] TEST 2: TX path end-to-end (write 0x5A to TX_DATA_REG)", $time);
    bus_write(ADDR_TX_DATA, 8'h5A);

    miso_byte_ready = 1'b0;
    wait (miso_byte_ready == 1'b1);
    check_eq("o_dbg_miso reconstructed byte == 0x5A", 8'h5A, miso_last_byte);

    if (errors == 0)
        $display("[%0t] ALL TESTS PASSED (tb_spi_bridge_top)", $time);
    else
        $display("[%0t] TESTS FAILED: %0d error(s) (tb_spi_bridge_top)", $time, errors);

    $finish;
end

initial begin
    #2000000;   // generous: master's free-running IDLE_GAP + frame time is slow relative to ACLK
    $display("[%0t] FAIL: TIMEOUT -- only %0d/%0d RX frames checked", $time, rx_frames_checked, N_RX_FRAMES);
    $finish;
end

endmodule
