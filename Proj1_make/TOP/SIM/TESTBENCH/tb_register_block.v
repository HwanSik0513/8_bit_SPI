`timescale 1ns / 1ps

// =============================================================================
// tb_register_block.v
// Self-Checking Testbench for Register Block
//
// ACLK : 100 MHz
//
// Verification
// - Register Address Decode
// - RX FIFO Prefetch
// - TX FIFO Write / Full Boundary
// - STATUS / CONTROL Register
// - RX FIFO Clear
// - TX FIFO Clear Handshake
// - Asynchronous Reset
// =============================================================================

module tb_register_block;

// =============================================================================
// Register Address
// =============================================================================
localparam [7:0] ADDR_RX_DATA       = 8'h00  ,
                 ADDR_STATUS        = 8'h04  ,
                 ADDR_CONTROL       = 8'h08  ,
                 ADDR_FIFO_LEVEL    = 8'h0C  ,
                 ADDR_TX_DATA       = 8'h10  ;

// =============================================================================
// Internal Register
// =============================================================================
reg             ACLK                        ;
reg             rst_n                       ;

reg     [7:0]   i_bus_addr                  ;
reg             i_bus_wr_en                 ;
reg     [7:0]   i_bus_wdata                 ;
reg             i_bus_rd_en                 ;

reg     [7:0]   i_rx_fifo_rd_data           ;
reg             i_rx_fifo_empty             ;
reg             i_rx_fifo_full              ;
reg     [4:0]   i_rx_fifo_level             ;

reg             i_tx_fifo_full              ;
reg             i_tx_clear_done_pulse_sync  ;

reg             i_spi_busy_sync             ;
reg             i_rx_overflow_pulse_sync    ;

// =============================================================================
// Internal Wire
// =============================================================================
wire    [7:0]   o_bus_rdata                 ;

wire            o_rx_fifo_rd_en             ;

wire            o_tx_fifo_wr_en             ;
wire    [7:0]   o_tx_fifo_wr_data           ;
wire            o_tx_clear_req              ;

wire            o_overflow                  ;
wire            o_rx_valid                  ;

// =============================================================================
// Testbench Variables
// =============================================================================
integer         errors                      ;
integer         checks                      ;

integer         q_head                      ;
integer         q_tail                      ;
integer         q_pops                      ;

integer         tx_pulses                   ;
integer         txreq_cnt                   ;

integer         done_cnt                    ;
integer         k                           ;
integer         pops_before                 ;
integer         pulses_before               ;

reg             auto_done                   ;
reg             manual_done                 ;
reg             done_pend                   ;

reg     [7:0]   rdata                       ;
reg             seen                        ;

reg     [7:0]   rxq [0:255]                 ;
reg     [7:0]   tx_log [0:63]               ;

// =============================================================================
// DUT Instantiation
// =============================================================================
register_block dut (

    .ACLK                       (ACLK                       ),
    .rst_n                      (rst_n                      ),

    .i_bus_addr                 (i_bus_addr                 ),
    .i_bus_wr_en                (i_bus_wr_en                ),
    .i_bus_wdata                (i_bus_wdata                ),
    .i_bus_rd_en                (i_bus_rd_en                ),
    .o_bus_rdata                (o_bus_rdata                ),

    .o_rx_fifo_rd_en            (o_rx_fifo_rd_en            ),
    .i_rx_fifo_rd_data          (i_rx_fifo_rd_data          ),
    .i_rx_fifo_empty            (i_rx_fifo_empty            ),
    .i_rx_fifo_full             (i_rx_fifo_full             ),
    .i_rx_fifo_level            (i_rx_fifo_level            ),

    .o_tx_fifo_wr_en            (o_tx_fifo_wr_en            ),
    .o_tx_fifo_wr_data          (o_tx_fifo_wr_data          ),
    .i_tx_fifo_full             (i_tx_fifo_full             ),

    .o_tx_clear_req             (o_tx_clear_req             ),
    .i_tx_clear_done_pulse_sync (i_tx_clear_done_pulse_sync ),

    .i_spi_busy_sync            (i_spi_busy_sync            ),
    .i_rx_overflow_pulse_sync   (i_rx_overflow_pulse_sync   ),

    .o_overflow                 (o_overflow                 ),
    .o_rx_valid                 (o_rx_valid                 )

);

// =============================================================================
// Clock Generation : 100 MHz
// =============================================================================
initial begin
    ACLK = 1'b0;
end

always #5 ACLK = ~ACLK;

// =============================================================================
// Check Task
// =============================================================================
task chk;

    input [8*64-1:0] label;
    input            ok;

    begin
        checks = checks + 1;

        if (ok) begin
            $display("[%0t] PASS: %0s", $time, label);
        end
        else begin
            $display("[%0t] FAIL: %0s", $time, label);
            errors = errors + 1;
        end
    end

endtask

// =============================================================================
// Check Equality Task
// =============================================================================
task chk_eq;

    input [8*64-1:0] label;
    input [31:0]     exp;
    input [31:0]     got;

    begin
        checks = checks + 1;

        if (exp === got) begin
            $display("[%0t] PASS: %0s (= 0x%0h)", $time, label, got);
        end
        else begin
            $display("[%0t] FAIL: %0s expected=0x%0h got=0x%0h",
                     $time, label, exp, got);

            errors = errors + 1;
        end
    end

endtask

// =============================================================================
// Behavioral RX FIFO Model
// =============================================================================
initial begin
    q_head              = 0                 ;
    q_tail              = 0                 ;
    q_pops              = 0                 ;
    i_rx_fifo_empty     = 1'b1              ;
    i_rx_fifo_rd_data   = 8'h00             ;
end

always @(posedge ACLK or negedge rst_n) begin
    if (!rst_n) begin
        q_head              = q_tail         ;
        i_rx_fifo_empty     <= 1'b1          ;
        i_rx_fifo_rd_data   <= 8'h00         ;
    end
    else begin
        if (o_rx_fifo_rd_en && !i_rx_fifo_empty) begin
            i_rx_fifo_rd_data   <= rxq[q_head] ;
            q_head              = q_head + 1  ;
            q_pops              = q_pops + 1  ;
        end

        i_rx_fifo_empty     <= (q_head == q_tail);
    end
end

// =============================================================================
// RX FIFO Push Task
// =============================================================================
task rx_push;

    input [7:0] data;

    begin
        rxq[q_tail] = data        ;
        q_tail      = q_tail + 1  ;
    end

endtask

// =============================================================================
// TX Clear Response Model
// =============================================================================
initial begin
    manual_done                 = 1'b0  ;
    auto_done                   = 1'b1  ;
    done_cnt                    = 0     ;
    done_pend                   = 1'b0  ;
    i_tx_clear_done_pulse_sync  = 1'b0  ;
end

always @(posedge ACLK) begin
    i_tx_clear_done_pulse_sync <= manual_done;

    if (auto_done) begin
        if (o_tx_clear_req) begin
            done_pend <= 1'b1;
            done_cnt  <= 0;
        end
        else if (done_pend) begin
            done_cnt <= done_cnt + 1;

            if (done_cnt == 3) begin
                i_tx_clear_done_pulse_sync <= 1'b1;
                done_pend                  <= 1'b0;
            end
        end
    end
end

// =============================================================================
// TX Clear Request Monitor
// =============================================================================
initial begin
    txreq_cnt = 0;
end

always @(posedge ACLK) begin
    if (rst_n && o_tx_clear_req) begin
        txreq_cnt = txreq_cnt + 1;
    end
end

// =============================================================================
// TX FIFO Write Monitor
// =============================================================================
always @(posedge ACLK) begin
    if (rst_n && o_tx_fifo_wr_en) begin
        tx_log[tx_pulses] = o_tx_fifo_wr_data ;
        tx_pulses         = tx_pulses + 1    ;
    end
end

// =============================================================================
// Bus Write Task
// =============================================================================
task bus_write;

    input [7:0] addr;
    input [7:0] data;

    begin
        @(negedge ACLK);

        i_bus_addr     = addr    ;
        i_bus_wdata    = data    ;
        i_bus_wr_en    = 1'b1    ;

        @(negedge ACLK);

        i_bus_wr_en    = 1'b0    ;
    end

endtask

// =============================================================================
// Bus Read Task
// =============================================================================
task bus_read;

    input  [7:0] addr;
    output [7:0] data;

    begin
        @(negedge ACLK);

        i_bus_addr     = addr        ;
        i_bus_rd_en    = 1'b1        ;

        #1;
        data           = o_bus_rdata ;

        @(negedge ACLK);

        i_bus_rd_en    = 1'b0        ;
    end

endtask

// =============================================================================
// Idle Task
// =============================================================================
task idle;

    input integer n;
    integer k;

    begin
        for (k = 0; k < n; k = k + 1) begin
            @(negedge ACLK);
        end
    end

endtask

// =============================================================================
// Wait RX Valid Task
// =============================================================================
task wait_rx_valid;

    input  integer n;
    output         seen;

    integer k;
    reg [7:0] s;

    begin
        seen = 1'b0;

        for (k = 0; k < n && !seen; k = k + 1) begin
            bus_read(ADDR_STATUS, s);

            if (s[3]) begin
                seen = 1'b1;
            end
        end
    end

endtask

// =============================================================================
// Test Sequence
// =============================================================================
initial begin

    // -------------------------------------------------------------------------
    // Initialization
    // -------------------------------------------------------------------------
    errors                      = 0                 ;
    checks                      = 0                 ;
    tx_pulses                   = 0                 ;

    rst_n                       = 1'b0              ;
    i_bus_addr                  = 8'h00             ;
    i_bus_wr_en                 = 1'b0              ;
    i_bus_wdata                 = 8'h00             ;
    i_bus_rd_en                 = 1'b0              ;

    i_rx_fifo_full              = 1'b0              ;
    i_rx_fifo_level             = 5'd0              ;
    i_tx_fifo_full              = 1'b0              ;

    i_spi_busy_sync             = 1'b0              ;
    i_rx_overflow_pulse_sync    = 1'b0              ;

    idle(4);

    @(negedge ACLK);
    rst_n = 1'b1;

    idle(2);

    // =========================================================================
    // TEST 0 : Reset State / Address Decode
    // =========================================================================
    $display("[%0t] TEST 0: reset state + address decode", $time);

    bus_read(ADDR_STATUS, rdata);
    chk_eq("STATUS after reset", 8'h01, rdata);

    bus_read(ADDR_CONTROL, rdata);
    chk_eq("CONTROL after reset", 8'h00, rdata);

    bus_read(ADDR_RX_DATA, rdata);
    chk_eq("RX_DATA after reset", 8'h00, rdata);

    bus_read(ADDR_TX_DATA, rdata);
    chk_eq("TX_DATA after reset", 8'h00, rdata);

    bus_read(8'h14, rdata);
    chk_eq("unmapped address", 8'h00, rdata);

    bus_read(8'h11, rdata);
    chk_eq("unaligned address", 8'h00, rdata);

    bus_read(8'hFF, rdata);
    chk_eq("unmapped FF", 8'h00, rdata);

    chk("overflow reset", o_overflow === 1'b0);
    chk("rx_valid reset", o_rx_valid === 1'b0);
    chk("tx write reset", o_tx_fifo_wr_en === 1'b0);
    chk("rx read reset", o_rx_fifo_rd_en === 1'b0);

    // =========================================================================
    // TEST 1 : RX Prefetch
    // =========================================================================
    $display("[%0t] TEST 1: RX prefetch", $time);

    @(negedge ACLK);
    rx_push(8'h77);

    wait_rx_valid(10, seen);

    chk("RX_VALID set", seen);
    chk("RX_VALID output", o_rx_valid === 1'b1);
    chk_eq("one FIFO pop", 1, q_pops);

    bus_read(ADDR_STATUS, rdata);
    chk_eq("STATUS valid + empty", 8'h09, rdata);

    bus_read(ADDR_RX_DATA, rdata);
    chk_eq("RX_DATA 77", 8'h77, rdata);

    chk("RX_VALID cleared", o_rx_valid === 1'b0);

    idle(6);
    chk_eq("no extra pop", 1, q_pops);

    // =========================================================================
    // TEST 2 : Back-to-Back RX Entries
    // =========================================================================
    $display("[%0t] TEST 2: RX FIFO order", $time);

    q_pops = 0;

    for (k = 0; k < 5; k = k + 1) begin
        @(negedge ACLK);
        rx_push(8'h11 * (k + 1));
    end

    idle(12);

    chk_eq("one entry prefetched", 1, q_pops);
    chk("RX_VALID set", o_rx_valid === 1'b1);

    for (k = 0; k < 5; k = k + 1) begin
        wait_rx_valid(20, seen);

        chk("RX_VALID seen", seen);

        bus_read(ADDR_RX_DATA, rdata);

        chk_eq("RX_DATA order", 8'h11 * (k + 1), rdata);
        chk("prefetch limit", (q_pops - (k + 1)) <= 1);
    end

    idle(8);

    chk_eq("total FIFO pops", 5, q_pops);
    chk("FIFO empty", q_head == q_tail);
    chk("RX_VALID low", o_rx_valid === 1'b0);

    // =========================================================================
    // TEST 3 : RX Read While Invalid
    // =========================================================================
    $display("[%0t] TEST 3: RX read while invalid", $time);

    q_pops = 0;

    @(negedge ACLK);
    rx_push(8'hA1);

    @(negedge ACLK);
    rx_push(8'hA2);

    wait_rx_valid(10, seen);

    bus_read(ADDR_RX_DATA, rdata);
    chk_eq("first RX A1", 8'hA1, rdata);

    bus_read(ADDR_RX_DATA, rdata);

    wait_rx_valid(20, seen);
    chk("second RX valid", seen);

    bus_read(ADDR_RX_DATA, rdata);
    chk_eq("second RX A2", 8'hA2, rdata);

    idle(6);
    chk_eq("two FIFO pops", 2, q_pops);

    // =========================================================================
    // TEST 4 : TX Write / FIFO Full
    // =========================================================================
    $display("[%0t] TEST 4: TX write and FIFO full", $time);

    pulses_before = tx_pulses;

    @(negedge ACLK);

    i_bus_addr     = ADDR_TX_DATA ;
    i_bus_wdata    = 8'hC3        ;
    i_bus_wr_en    = 1'b1         ;

    #1;

    chk("same-cycle TX write", o_tx_fifo_wr_en === 1'b1);
    chk_eq("TX write data C3", 8'hC3, o_tx_fifo_wr_data);

    @(negedge ACLK);

    i_bus_wr_en    = 1'b0         ;

    #1;

    chk("TX pulse ended", o_tx_fifo_wr_en === 1'b0);
    chk_eq("one TX pulse", pulses_before + 1, tx_pulses);

    bus_read(ADDR_TX_DATA, rdata);
    chk_eq("TX readback C3", 8'hC3, rdata);

    bus_write(ADDR_CONTROL, 8'h00);

    bus_read(ADDR_TX_DATA, rdata);
    chk_eq("TX unchanged", 8'hC3, rdata);

    bus_write(8'h14, 8'h99);
    bus_write(ADDR_STATUS, 8'h99);
    bus_write(8'h11, 8'h99);

    idle(2);

    chk_eq("no invalid TX writes", pulses_before + 1, tx_pulses);

    bus_read(ADDR_TX_DATA, rdata);
    chk_eq("TX still C3", 8'hC3, rdata);

    @(negedge ACLK);
    i_tx_fifo_full = 1'b1;

    bus_write(ADDR_TX_DATA, 8'hD4);

    idle(2);

    chk_eq("full rejects write", pulses_before + 1, tx_pulses);

    bus_read(ADDR_TX_DATA, rdata);
    chk_eq("last accepted TX", 8'hC3, rdata);

    @(negedge ACLK);
    i_tx_fifo_full = 1'b0;

    bus_write(ADDR_TX_DATA, 8'hD4);

    idle(1);

    chk_eq("write accepted", pulses_before + 2, tx_pulses);
    chk_eq("TX log D4", 8'hD4, tx_log[pulses_before + 1]);

    pulses_before = tx_pulses;

    @(negedge ACLK);

    i_bus_addr     = ADDR_TX_DATA ;
    i_bus_wdata    = 8'h91        ;
    i_bus_wr_en    = 1'b1         ;

    @(negedge ACLK);
    i_bus_wdata    = 8'h92        ;

    @(negedge ACLK);
    i_bus_wr_en    = 1'b0         ;

    idle(2);

    chk_eq("two TX writes", pulses_before + 2, tx_pulses);
    chk_eq("first TX 91", 8'h91, tx_log[pulses_before]);
    chk_eq("second TX 92", 8'h92, tx_log[pulses_before + 1]);

    // =========================================================================
    // TEST 5 : STATUS / Overflow
    // =========================================================================
    $display("[%0t] TEST 5: STATUS and overflow", $time);

    @(negedge ACLK);

    i_spi_busy_sync = 1'b1 ;
    i_rx_fifo_full  = 1'b1 ;

    bus_read(ADDR_STATUS, rdata);
    chk_eq("BUSY FULL EMPTY", 8'h07, rdata);

    @(negedge ACLK);

    i_spi_busy_sync = 1'b0 ;
    i_rx_fifo_full  = 1'b0 ;

    @(negedge ACLK);
    i_rx_overflow_pulse_sync = 1'b1;

    @(negedge ACLK);
    i_rx_overflow_pulse_sync = 1'b0;

    idle(1);

    chk("overflow set", o_overflow === 1'b1);

    bus_read(ADDR_STATUS, rdata);
    chk_eq("STATUS overflow", 8'h11, rdata);

    idle(5);

    chk("overflow sticky", o_overflow === 1'b1);

    bus_write(ADDR_CONTROL, 8'h02);

    chk("overflow cleared", o_overflow === 1'b0);

    bus_read(ADDR_CONTROL, rdata);
    chk_eq("CONTROL strobes zero", 8'h00, rdata);

    @(negedge ACLK);

    i_rx_overflow_pulse_sync = 1'b1 ;
    i_bus_addr               = ADDR_CONTROL ;
    i_bus_wdata              = 8'h02 ;
    i_bus_wr_en              = 1'b1 ;

    @(negedge ACLK);

    i_rx_overflow_pulse_sync = 1'b0 ;
    i_bus_wr_en              = 1'b0 ;

    chk("overflow set priority", o_overflow === 1'b1);

    bus_write(ADDR_CONTROL, 8'h02);

    chk("overflow clear again", o_overflow === 1'b0);

    // =========================================================================
    // TEST 6 : CONTROL / FIFO LEVEL
    // =========================================================================
    $display("[%0t] TEST 6: CONTROL and FIFO level", $time);

    bus_write(ADDR_CONTROL, 8'h04);

    bus_read(ADDR_CONTROL, rdata);
    chk_eq("IRQ enable", 8'h04, rdata);

    @(negedge ACLK);
    i_rx_fifo_level = 5'd13;

    bus_read(ADDR_FIFO_LEVEL, rdata);
    chk_eq("FIFO level 13", 8'h0D, rdata);

    @(negedge ACLK);
    i_rx_fifo_level = 5'd16;

    bus_read(ADDR_FIFO_LEVEL, rdata);
    chk_eq("FIFO level 16", 8'h10, rdata);

    @(negedge ACLK);
    i_rx_fifo_level = 5'd0;

    // =========================================================================
    // TEST 7 : RX FIFO CLEAR
    // =========================================================================
    $display("[%0t] TEST 7: RX FIFO clear", $time);

    q_pops = 0;

    for (k = 0; k < 6; k = k + 1) begin
        @(negedge ACLK);
        rx_push(8'hE0 + k);
    end

    wait_rx_valid(10, seen);
    chk("buffer valid", seen);

    bus_write(ADDR_CONTROL, 8'h05);

    idle(14);

    chk("FIFO empty after clear", i_rx_fifo_empty === 1'b1);
    chk("RX_VALID cleared", o_rx_valid === 1'b0);
    chk_eq("six entries drained", 6, q_pops);

    bus_read(ADDR_CONTROL, rdata);
    chk_eq("IRQ preserved", 8'h04, rdata);

    chk("drain stopped", o_rx_fifo_rd_en === 1'b0);

    @(negedge ACLK);
    rx_push(8'h5A);

    wait_rx_valid(10, seen);
    chk("new entry valid", seen);

    bus_read(ADDR_RX_DATA, rdata);
    chk_eq("RX 5A", 8'h5A, rdata);

    bus_write(ADDR_CONTROL, 8'h01);

    idle(6);
    chk("clear empty FIFO", o_rx_valid === 1'b0);

    // =========================================================================
    // TEST 9 : TX Boundary / Clear Handshake
    // =========================================================================
    $display("[%0t] TEST 9: TX boundary and clear", $time);

    idle(8);

    auto_done = 1'b0;

    @(negedge ACLK);

    i_tx_fifo_full = 1'b0         ;
    i_bus_addr     = ADDR_TX_DATA ;
    i_bus_wdata    = 8'hE1        ;
    i_bus_wr_en    = 1'b1         ;

    #1;

    chk("full=0 accepts TX", o_tx_fifo_wr_en === 1'b1);

    @(negedge ACLK);

    i_tx_fifo_full = 1'b1 ;
    i_bus_wdata    = 8'hE2;

    #1;

    chk("full=1 rejects TX", o_tx_fifo_wr_en === 1'b0);

    @(negedge ACLK);

    i_bus_wr_en    = 1'b0 ;
    i_tx_fifo_full = 1'b0 ;

    #1;

    bus_read(ADDR_TX_DATA, rdata);
    chk_eq("E1 accepted E2 rejected", 8'hE1, rdata);

    pulses_before = tx_pulses;
    txreq_cnt     = 0;

    @(negedge ACLK);

    i_bus_addr     = ADDR_CONTROL ;
    i_bus_wdata    = 8'h01        ;
    i_bus_wr_en    = 1'b1         ;

    @(negedge ACLK);
    i_bus_wr_en    = 1'b0         ;

    bus_read(ADDR_STATUS, rdata);
    chk("TX clear busy", rdata[5] === 1'b1);

    chk_eq("one clear request", 1, txreq_cnt);

    bus_write(ADDR_TX_DATA, 8'hE3);

    chk_eq("write rejected during clear", pulses_before, tx_pulses);

    bus_write(ADDR_CONTROL, 8'h01);

    idle(2);

    chk_eq("no duplicate clear", 1, txreq_cnt);

    @(negedge ACLK);
    manual_done = 1'b1;

    @(negedge ACLK);
    manual_done = 1'b0;

    bus_read(ADDR_STATUS, rdata);
    chk("clear busy released", rdata[5] === 1'b0);

    bus_write(ADDR_TX_DATA, 8'hE4);

    chk_eq("write after clear", pulses_before + 1, tx_pulses);

    bus_read(ADDR_TX_DATA, rdata);
    chk_eq("TX E4", 8'hE4, rdata);

    auto_done = 1'b1;

    // =========================================================================
    // TEST 8 : ASYNCHRONOUS RESET
    // =========================================================================
    $display("[%0t] TEST 8: asynchronous reset", $time);

    bus_write(ADDR_CONTROL, 8'h04);
    bus_write(ADDR_TX_DATA, 8'h6B);

    @(negedge ACLK);
    i_rx_overflow_pulse_sync = 1'b1;

    @(negedge ACLK);
    i_rx_overflow_pulse_sync = 1'b0;

    @(negedge ACLK);
    rx_push(8'h3C);

    wait_rx_valid(10, seen);

    chk("pre-reset flags",
        o_overflow === 1'b1 && o_rx_valid === 1'b1);

    #2;
    rst_n = 1'b0;

    #1;

    chk("overflow async reset", o_overflow === 1'b0);
    chk("RX_VALID async reset", o_rx_valid === 1'b0);
    chk("TX write reset", o_tx_fifo_wr_en === 1'b0);

    idle(3);

    @(negedge ACLK);
    rst_n = 1'b1;

    idle(2);

    bus_read(ADDR_CONTROL, rdata);
    chk_eq("CONTROL reset", 8'h00, rdata);

    bus_read(ADDR_TX_DATA, rdata);
    chk_eq("TX_DATA reset", 8'h00, rdata);

    @(negedge ACLK);
    rx_push(8'h42);

    wait_rx_valid(10, seen);

    chk("operation resumed", seen);

    bus_read(ADDR_RX_DATA, rdata);
    chk_eq("RX 42 after reset", 8'h42, rdata);

    // =========================================================================
    // Final Result
    // =========================================================================
    if (errors == 0) begin
        $display("[%0t] ALL TESTS PASSED (tb_register_block, %0d checks)",
                 $time, checks);
    end
    else begin
        $display("[%0t] TESTS FAILED: %0d error(s) (tb_register_block)",
                 $time, errors);
    end

    $finish;

end

// =============================================================================
// Simulation Timeout
// =============================================================================
initial begin
    #200000;

    $display("[%0t] FAIL: TIMEOUT -- simulation did not finish", $time);

    $finish;
end

endmodule
