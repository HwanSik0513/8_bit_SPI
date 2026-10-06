`timescale 1ns/1ps

module tb_register_block;

localparam [7:0] ADDR_RX_DATA    = 8'h00,
                  ADDR_STATUS     = 8'h04,
                  ADDR_CONTROL    = 8'h08,
                  ADDR_FIFO_LEVEL = 8'h0C,
                  ADDR_TX_DATA    = 8'h10;

reg         ACLK;
reg         rst_n;

reg  [7:0]  i_bus_addr;
reg         i_bus_wr_en;
reg  [7:0]  i_bus_wdata;
reg         i_bus_rd_en;
wire [7:0]  o_bus_rdata;

wire        o_rx_fifo_rd_en;
reg  [7:0]  i_rx_fifo_rd_data;
reg         i_rx_fifo_empty;
reg         i_rx_fifo_full;
reg  [4:0]  i_rx_fifo_level;

wire        o_tx_fifo_wr_en;
wire [7:0]  o_tx_fifo_wr_data;
reg         i_tx_fifo_full;

reg         i_spi_busy_sync;
reg         i_rx_overflow_pulse_sync;

wire        o_overflow;
wire        o_rx_valid;

integer errors;

register_block dut (
    .ACLK                       (ACLK),
    .rst_n                      (rst_n),
    .i_bus_addr                 (i_bus_addr),
    .i_bus_wr_en                (i_bus_wr_en),
    .i_bus_wdata                (i_bus_wdata),
    .i_bus_rd_en                (i_bus_rd_en),
    .o_bus_rdata                (o_bus_rdata),
    .o_rx_fifo_rd_en            (o_rx_fifo_rd_en),
    .i_rx_fifo_rd_data          (i_rx_fifo_rd_data),
    .i_rx_fifo_empty            (i_rx_fifo_empty),
    .i_rx_fifo_full             (i_rx_fifo_full),
    .i_rx_fifo_level            (i_rx_fifo_level),
    .o_tx_fifo_wr_en            (o_tx_fifo_wr_en),
    .o_tx_fifo_wr_data          (o_tx_fifo_wr_data),
    .i_tx_fifo_full             (i_tx_fifo_full),
    .i_spi_busy_sync            (i_spi_busy_sync),
    .i_rx_overflow_pulse_sync   (i_rx_overflow_pulse_sync),
    .o_overflow                 (o_overflow),
    .o_rx_valid                 (o_rx_valid)
);

initial ACLK = 1'b0;
always  #5 ACLK = ~ACLK;   // 100 MHz

// ---------------------------------------------------------------------
// Behavioral RX FIFO stub: a small shift queue driven by o_rx_fifo_rd_en.
// Test code loads bytes into rx_queue[]/rx_queue_count before/while the
// test runs; this always block pops one entry per rd_en, one-cycle
// registered read latency, matching the real async_fifo's timing.
// ---------------------------------------------------------------------
reg [7:0] rx_queue [0:63];
integer   rx_head, rx_tail;

task rx_push(input [7:0] data);
begin
    rx_queue[rx_tail] = data;
    rx_tail = rx_tail + 1;
    i_rx_fifo_empty = 1'b0;
end
endtask

always @(posedge ACLK) begin
    if (!rst_n) begin
        i_rx_fifo_rd_data <= 8'h00;
    end else if (o_rx_fifo_rd_en && !i_rx_fifo_empty) begin
        i_rx_fifo_rd_data <= rx_queue[rx_head];
        rx_head <= rx_head + 1;
        if (rx_head + 1 >= rx_tail)
            i_rx_fifo_empty <= 1'b1;
    end
end

// ---------------------------------------------------------------------
// Bus access tasks (single-cycle synchronous, matching register_block.v's
// documented bus contract).
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
    #1;                       // combinational read mux settles
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

reg [7:0] rdata;

initial begin
    errors  = 0;
    rx_head = 0;
    rx_tail = 0;

    rst_n                     = 1'b0;
    i_bus_addr                = 8'h00;
    i_bus_wr_en                = 1'b0;
    i_bus_wdata                = 8'h00;
    i_bus_rd_en                = 1'b0;
    i_rx_fifo_empty            = 1'b1;
    i_rx_fifo_full             = 1'b0;
    i_rx_fifo_level            = 5'd0;
    i_tx_fifo_full             = 1'b0;
    i_spi_busy_sync            = 1'b0;
    i_rx_overflow_pulse_sync   = 1'b0;

    repeat (4) @(posedge ACLK);
    rst_n = 1'b1;
    repeat (2) @(posedge ACLK);

    // -------------------------------------------------------------
    // Test 1: RX prefetch + pop-on-read
    // -------------------------------------------------------------
    $display("[%0t] TEST 1: RX prefetch + pop-on-read", $time);
    rx_push(8'h77);
    repeat (3) @(posedge ACLK);    // let the prefetch buffer pick it up

    check_eq("RX_VALID set after prefetch", 1'b1, o_rx_valid);

    bus_read(ADDR_RX_DATA, rdata);
    check_eq("RX_DATA_REG == 0x77", 8'h77, rdata);

    @(posedge ACLK);
    check_eq("RX_VALID clears after read (consumed)", 1'b0, o_rx_valid);

    // -------------------------------------------------------------
    // Test 2: TX_DATA_REG write-then-readback
    // -------------------------------------------------------------
    $display("[%0t] TEST 2: TX_DATA_REG write + readback", $time);
    bus_write(ADDR_TX_DATA, 8'hC3);
    @(posedge ACLK);

    check_eq("o_tx_fifo_wr_en pulsed", 1'b1, o_tx_fifo_wr_en);
    check_eq("o_tx_fifo_wr_data == 0xC3", 8'hC3, o_tx_fifo_wr_data);

    bus_read(ADDR_TX_DATA, rdata);
    check_eq("TX_DATA_REG readback == 0xC3", 8'hC3, rdata);

    // Write a DIFFERENT register afterward and confirm TX_DATA_REG did NOT
    // get corrupted (this is exactly the bug that was caught and fixed
    // during RTL authoring).
    bus_write(ADDR_CONTROL, 8'h00);
    bus_read(ADDR_TX_DATA, rdata);
    check_eq("TX_DATA_REG unaffected by unrelated write", 8'hC3, rdata);

    // -------------------------------------------------------------
    // Test 3: CONTROL_REG.FIFO_CLEAR drains the RX FIFO
    // -------------------------------------------------------------
    $display("[%0t] TEST 3: FIFO_CLEAR drain", $time);
    rx_push(8'h11);
    rx_push(8'h22);
    rx_push(8'h33);
    repeat (3) @(posedge ACLK);   // let prefetch grab the first one

    bus_write(ADDR_CONTROL, 8'h01);   // FIFO_CLEAR strobe (bit 0)
    // Wait for the drain FSM to pop everything (queue empties).
    repeat (20) @(posedge ACLK);

    check_eq("RX FIFO drained (empty)", 1'b1, i_rx_fifo_empty);
    check_eq("RX_VALID clear after drain", 1'b0, o_rx_valid);

    // -------------------------------------------------------------
    // Test 4: OVERFLOW sticky flag set/clear
    // -------------------------------------------------------------
    $display("[%0t] TEST 4: OVERFLOW sticky set/clear", $time);
    @(posedge ACLK);
    i_rx_overflow_pulse_sync = 1'b1;
    @(posedge ACLK);
    i_rx_overflow_pulse_sync = 1'b0;
    @(posedge ACLK);

    check_eq("o_overflow set after pulse", 1'b1, o_overflow);

    bus_read(ADDR_STATUS, rdata);
    check_eq("STATUS_REG.OVERFLOW bit set", 1'b1, rdata[4]);

    bus_write(ADDR_CONTROL, 8'h02);   // OVERFLOW_CLEAR strobe (bit 1)
    @(posedge ACLK);

    check_eq("o_overflow cleared after OVERFLOW_CLEAR", 1'b0, o_overflow);

    if (errors == 0)
        $display("[%0t] ALL TESTS PASSED (tb_register_block)", $time);
    else
        $display("[%0t] TESTS FAILED: %0d error(s) (tb_register_block)", $time, errors);

    $finish;
end

initial begin
    #100000;
    $display("[%0t] FAIL: TIMEOUT -- simulation did not finish", $time);
    $finish;
end

endmodule
