mescale 1ns / 1ps

// =============================================================================
// tb_spi_slave.v
// Self-Checking Testbench for SPI Slave
//
// SPI Mode : Mode 0 (CPOL = 0, CPHA = 0)
// Data     : 8-bit, MSB First
// SCLK     : 25 MHz
//
// Verification
// - SPI RX / TX
// - CS_N Frame Control
// - RX FIFO Overflow
// - TX FIFO Prefetch / Underflow
// - Multi-Byte Transfer
// - FIFO_CLEAR
// - Asynchronous Reset
// =============================================================================

module tb_spi_slave;

// =============================================================================
// Internal Register
// =============================================================================
reg             SCLK                    ;
reg             rst_n                   ;
reg             i_cs_n                  ;
reg             i_mosi                  ;

reg             i_rx_fifo_full          ;

reg     [7:0]   i_tx_fifo_rd_data       ;
reg             i_tx_fifo_empty         ;
reg             i_tx_clear_pulse        ;

// =============================================================================
// Internal Wire
// =============================================================================
wire            o_miso                  ;

wire            o_rx_wr_en              ;
wire    [7:0]   o_rx_wr_data            ;
wire            o_rx_overflow_pulse     ;

wire            o_tx_fifo_rd_en         ;
wire            o_tx_clear_done         ;

wire            o_spi_busy              ;

// =============================================================================
// Testbench Variables
// =============================================================================
integer         errors                  ;
integer         checks                  ;

integer         tq_head                 ;
integer         tq_tail                 ;
integer         tx_pops                 ;

integer         rx_cnt                  ;
integer         ovf_cnt                 ;
integer         miso_viol               ;

integer         clr_done_cnt            ;
integer         clr_wait                ;

integer         cb                      ;
integer         rx_before               ;
integer         ovf_before              ;
integer         i                       ;

reg             clr_req                 ;
reg             clr_hold                ;

reg     [7:0]   mb                      ;
reg     [7:0]   mb2                     ;
reg     [7:0]   mb3                     ;

reg     [7:0]   txq [0:63]              ;
reg     [7:0]   rx_log [0:63]           ;

// =============================================================================
// DUT Instantiation
// =============================================================================
spi_slave dut (

    .SCLK                 (SCLK                 ),
    .rst_n                (rst_n                ),

    .i_cs_n               (i_cs_n               ),
    .i_mosi               (i_mosi               ),
    .o_miso               (o_miso               ),

    .o_rx_wr_en           (o_rx_wr_en           ),
    .o_rx_wr_data         (o_rx_wr_data         ),
    .i_rx_fifo_full       (i_rx_fifo_full       ),
    .o_rx_overflow_pulse  (o_rx_overflow_pulse  ),

    .o_tx_fifo_rd_en      (o_tx_fifo_rd_en      ),
    .i_tx_fifo_rd_data    (i_tx_fifo_rd_data    ),
    .i_tx_fifo_empty      (i_tx_fifo_empty      ),

    .i_tx_clear_pulse     (i_tx_clear_pulse     ),
    .o_tx_clear_done      (o_tx_clear_done      ),

    .o_spi_busy           (o_spi_busy           )

);

// =============================================================================
// Clock Generation : 25 MHz
// =============================================================================
initial begin
    SCLK = 1'b0;
end

always #20 SCLK = ~SCLK;

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
            $display("[%0t] PASS: %0s (= 0x%0h)",
                     $time, label, got);
        end
        else begin
            $display("[%0t] FAIL: %0s expected=0x%0h got=0x%0h",
                     $time, label, exp, got);

            errors = errors + 1;
        end
    end

endtask

// =============================================================================
// Behavioral TX FIFO Model
// =============================================================================
initial begin
    tq_head             = 0          ;
    tq_tail             = 0          ;
    tx_pops             = 0          ;

    i_tx_fifo_empty     = 1'b1       ;
    i_tx_fifo_rd_data   = 8'h00      ;
end

always @(posedge SCLK or negedge rst_n) begin
    if (!rst_n) begin
        tq_head             = tq_tail    ;
        i_tx_fifo_empty     <= 1'b1      ;
        i_tx_fifo_rd_data   <= 8'h00     ;
    end
    else begin
        if (o_tx_fifo_rd_en && !i_tx_fifo_empty) begin
            i_tx_fifo_rd_data   <= txq[tq_head] ;
            tq_head             = tq_head + 1  ;
            tx_pops             = tx_pops + 1  ;
        end

        i_tx_fifo_empty <= (tq_head == tq_tail);
    end
end

// =============================================================================
// TX FIFO Push Task
// =============================================================================
task tx_push;

    input [7:0] data;

    begin
        txq[tq_tail]   = data          ;
        tq_tail        = tq_tail + 1   ;
    end

endtask

// =============================================================================
// TX Clear Done Monitor
// =============================================================================
always @(posedge SCLK) begin
    if (rst_n && o_tx_clear_done) begin
        clr_done_cnt = clr_done_cnt + 1;
    end
end

// =============================================================================
// RX Write / Overflow Monitor
// =============================================================================
always @(posedge SCLK) begin
    if (rst_n) begin

        if (o_rx_wr_en) begin
            rx_log[rx_cnt] = o_rx_wr_data ;
            rx_cnt        = rx_cnt + 1   ;
        end

        if (o_rx_overflow_pulse) begin
            ovf_cnt = ovf_cnt + 1;
        end

        if (o_rx_wr_en && o_rx_overflow_pulse) begin
            $display("[%0t] FAIL: RX write and overflow asserted together",
                     $time);

            errors = errors + 1;
        end

    end
end

// =============================================================================
// MISO Timing Monitor
// MISO must not change on SCLK rising edge.
// =============================================================================
always @(o_miso) begin
    if (($time % 40) == 20) begin
        miso_viol = miso_viol + 1;
    end
end

// =============================================================================
// Idle Edges Task
// =============================================================================
task idle_edges;

    input integer n;
    integer k;

    begin
        for (k = 0; k < n; k = k + 1) begin
            @(posedge SCLK);
        end
    end

endtask

// =============================================================================
// Frame Start Task
// =============================================================================
task frame_start;

    begin
        @(negedge SCLK);
        i_cs_n = 1'b0;

        @(posedge SCLK);
        @(posedge SCLK);
    end

endtask

// =============================================================================
// SPI Byte Transfer Task
// =============================================================================
task xfer_byte;

    input  [7:0] mosi_byte;
    output [7:0] miso_byte;

    integer b;

    begin
        for (b = 7; b >= 0; b = b - 1) begin

            @(negedge SCLK);
            i_mosi = mosi_byte[b];

            @(posedge SCLK);
            miso_byte[b] = o_miso;

        end
    end

endtask

// =============================================================================
// Frame End Early Task
// =============================================================================
task frame_end_early;

    begin
        @(negedge SCLK);
        i_cs_n = 1'b1;

        idle_edges(3);
    end

endtask

// =============================================================================
// Frame End Late Task
// =============================================================================
task frame_end_late;

    begin
        @(posedge SCLK);

        @(negedge SCLK);
        i_cs_n = 1'b1;

        idle_edges(3);
    end

endtask

// =============================================================================
// Single Frame Task
// =============================================================================
task one_frame;

    input  [7:0] mosi_byte;
    input        endmode;
    output [7:0] miso_byte;

    integer rx_before;
    reg     busy_mid;

    begin
        rx_before = rx_cnt;

        frame_start;

        busy_mid = o_spi_busy;

        xfer_byte(mosi_byte, miso_byte);

        if (endmode) begin
            frame_end_late;
        end
        else begin
            frame_end_early;
        end

        chk_eq("frame: exactly one RX write",
               rx_before + 1, rx_cnt);

        chk_eq("frame: RX byte == MOSI byte",
               mosi_byte, rx_log[rx_before]);

        chk("frame: SPI_BUSY high during frame",
            busy_mid === 1'b1);

        chk("frame: SPI_BUSY low after frame",
            o_spi_busy === 1'b0);
    end

endtask

// =============================================================================
// TX Clear Pulse Task
// =============================================================================
task clr_pulse;

    begin
        clr_req = 1'b1;

        @(negedge SCLK);
        @(negedge SCLK);
        @(negedge SCLK);
    end

endtask

// =============================================================================
// TX Clear Request Generation
// =============================================================================
initial begin
    clr_req  = 1'b0;
    clr_hold = 1'b0;
end

always @(negedge SCLK) begin
    if (clr_req) begin
        i_tx_clear_pulse <= 1'b1 ;
        clr_req           = 1'b0 ;
    end
    else if (i_tx_clear_pulse && !clr_hold) begin
        i_tx_clear_pulse <= 1'b0 ;
    end
end

// =============================================================================
// Wait TX Clear Done Task
// =============================================================================
task wait_clr_done;

    input integer base;

    begin
        clr_wait = 0;

        while (clr_done_cnt == base && clr_wait < 60) begin
            @(posedge SCLK);
            clr_wait = clr_wait + 1;
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
    errors              = 0       ;
    checks              = 0       ;
    rx_cnt              = 0       ;
    ovf_cnt             = 0       ;
    miso_viol           = 0       ;
    clr_done_cnt        = 0       ;

    i_tx_clear_pulse    = 1'b0    ;

    rst_n               = 1'b0    ;
    i_cs_n              = 1'b1    ;
    i_mosi              = 1'b0    ;
    i_rx_fifo_full      = 1'b0    ;

    idle_edges(4);

    @(negedge SCLK);
    rst_n = 1'b1;

    idle_edges(2);

    // =========================================================================
    // TEST 0 : Idle State After Reset
    // =========================================================================
    $display("[%0t] TEST 0: idle state after reset", $time);

    chk("SPI_BUSY reset", o_spi_busy === 1'b0);
    chk("RX write reset", o_rx_wr_en === 1'b0);
    chk("RX overflow reset", o_rx_overflow_pulse === 1'b0);
    chk("TX read reset", o_tx_fifo_rd_en === 1'b0);

    // =========================================================================
    // TEST 1 : RX Byte / Late CS_N Release
    // =========================================================================
    $display("[%0t] TEST 1: RX byte with late CS_N release", $time);

    one_frame(8'hA5, 1'b1, mb);

    chk_eq("MISO empty TX FIFO", 8'h00, mb);
    chk_eq("no overflow", 0, ovf_cnt);

    // =========================================================================
    // TEST 2 : RX Byte Patterns
    // =========================================================================
    $display("[%0t] TEST 2: RX byte patterns", $time);

    one_frame(8'h00, 1'b0, mb);
    one_frame(8'hFF, 1'b1, mb);
    one_frame(8'h5A, 1'b0, mb);
    one_frame(8'h81, 1'b1, mb);
    one_frame(8'h7E, 1'b0, mb);
    one_frame(8'h01, 1'b1, mb);
    one_frame(8'h80, 1'b0, mb);

    chk_eq("total RX bytes", 8, rx_cnt);

    // =========================================================================
    // TEST 3 : Multi-Byte RX
    // =========================================================================
    $display("[%0t] TEST 3: three bytes in one frame", $time);

    rx_before = rx_cnt;

    frame_start;

    xfer_byte(8'h3C, mb);
    idle_edges(1);

    xfer_byte(8'hC3, mb);
    idle_edges(1);

    xfer_byte(8'h7E, mb);
    frame_end_late;

    chk_eq("three RX writes", rx_before + 3, rx_cnt);

    chk_eq("RX byte 0", 8'h3C, rx_log[rx_before]);
    chk_eq("RX byte 1", 8'hC3, rx_log[rx_before + 1]);
    chk_eq("RX byte 2", 8'h7E, rx_log[rx_before + 2]);

    // =========================================================================
    // TEST 4 : Frame Abort / Recovery
    // =========================================================================
    $display("[%0t] TEST 4: frame abort and recovery", $time);

    rx_before = rx_cnt;

    frame_start;

    for (i = 7; i >= 4; i = i - 1) begin
        @(negedge SCLK);
        i_mosi = 1'b1;

        @(posedge SCLK);
    end

    @(negedge SCLK);
    i_cs_n = 1'b1;

    idle_edges(3);

    chk_eq("aborted byte no RX write", rx_before, rx_cnt);
    chk("FSM idle after abort", o_spi_busy === 1'b0);

    @(negedge SCLK);
    i_cs_n = 1'b0;

    @(posedge SCLK);

    @(negedge SCLK);
    i_cs_n = 1'b1;

    idle_edges(4);

    chk_eq("LOAD abort no RX write", rx_before, rx_cnt);
    chk("FSM idle after LOAD abort", o_spi_busy === 1'b0);

    one_frame(8'hB4, 1'b1, mb);

    // =========================================================================
    // TEST 5 : RX FIFO Overflow
    // =========================================================================
    $display("[%0t] TEST 5: RX FIFO overflow", $time);

    rx_before  = rx_cnt  ;
    ovf_before = ovf_cnt ;

    @(negedge SCLK);
    i_rx_fifo_full = 1'b1;

    frame_start;
    xfer_byte(8'h5A, mb);
    frame_end_late;

    chk_eq("no RX write while full", rx_before, rx_cnt);
    chk_eq("one overflow pulse", ovf_before + 1, ovf_cnt);

    @(negedge SCLK);
    i_rx_fifo_full = 1'b0;

    idle_edges(2);

    one_frame(8'hC4, 1'b0, mb);

    chk_eq("overflow count unchanged",
           ovf_before + 1, ovf_cnt);

    // =========================================================================
    // TEST 6 : TX MISO / Underflow
    // =========================================================================
    $display("[%0t] TEST 6: TX MISO and underflow", $time);

    @(negedge SCLK);
    tx_push(8'h3C);

    idle_edges(6);

    chk_eq("TX FIFO popped", 1, tx_pops);

    one_frame(8'h96, 1'b1, mb);
    chk_eq("MISO 3C", 8'h3C, mb);

    one_frame(8'h69, 1'b0, mb);
    chk_eq("underflow sends 00", 8'h00, mb);

    // =========================================================================
    // TEST 7 : TX Prefetch Timing
    // =========================================================================
    $display("[%0t] TEST 7: TX prefetch timing", $time);

    @(negedge SCLK);
    tx_push(8'hC3);

    one_frame(8'h11, 1'b1, mb);
    chk_eq("late byte sends 00", 8'h00, mb);

    one_frame(8'h22, 1'b1, mb);
    chk_eq("next frame sends C3", 8'hC3, mb);

    @(negedge SCLK);
    tx_push(8'hD4);

    idle_edges(2);

    one_frame(8'h33, 1'b1, mb);
    chk_eq("prefetched D4", 8'hD4, mb);

    // =========================================================================
    // TEST 8 : TX FIFO Ordering
    // =========================================================================
    $display("[%0t] TEST 8: TX FIFO ordering", $time);

    tx_pops = 0;

    @(negedge SCLK);
    tx_push(8'h11);

    @(negedge SCLK);
    tx_push(8'h22);

    @(negedge SCLK);
    tx_push(8'h33);

    idle_edges(8);

    chk_eq("one holding register pop", 1, tx_pops);

    one_frame(8'hF0, 1'b1, mb);
    chk_eq("TX first 11", 8'h11, mb);

    one_frame(8'hF1, 1'b1, mb);
    chk_eq("TX second 22", 8'h22, mb);

    one_frame(8'hF2, 1'b1, mb);
    chk_eq("TX third 33", 8'h33, mb);

    one_frame(8'hF3, 1'b1, mb);
    chk_eq("TX fourth 00", 8'h00, mb);

    chk_eq("three FIFO pops", 3, tx_pops);
    chk("TX FIFO empty", i_tx_fifo_empty === 1'b1);

    // =========================================================================
    // TEST 9 : Mid-Frame TX Arrival
    // =========================================================================
    $display("[%0t] TEST 9: mid-frame TX arrival", $time);

    frame_start;

    #5;
    tx_push(8'h99);

    xfer_byte(8'hAA, mb);

    chk_eq("current frame sends 00", 8'h00, mb);

    frame_end_late;

    idle_edges(4);

    one_frame(8'hAA, 1'b1, mb);
    chk_eq("next frame sends 99", 8'h99, mb);

    // =========================================================================
    // TEST 11 : Minimum CS_N High Time
    // =========================================================================
    $display("[%0t] TEST 11: minimum CS_N high time", $time);

    @(negedge SCLK);
    tx_push(8'hA5);

    idle_edges(6);

    frame_start;

    #5;
    tx_push(8'h5B);

    xfer_byte(8'h01, mb);

    @(posedge SCLK);

    @(negedge SCLK);
    i_cs_n = 1'b1;

    @(negedge SCLK);
    i_cs_n = 1'b0;

    @(posedge SCLK);
    @(posedge SCLK);

    xfer_byte(8'h02, mb2);
    frame_end_late;

    chk_eq("short gap frame 1", 8'hA5, mb);
    chk_eq("short gap frame 2", 8'h5B, mb2);

    // =========================================================================
    // TEST 12 : FIFO_CLEAR
    // =========================================================================
    $display("[%0t] TEST 12: FIFO_CLEAR", $time);

    @(negedge SCLK);
    tx_push(8'h61);

    @(negedge SCLK);
    tx_push(8'h62);

    @(negedge SCLK);
    tx_push(8'h63);

    idle_edges(8);

    cb = clr_done_cnt;

    clr_pulse;
    wait_clr_done(cb);

    chk_eq("one clear done pulse", cb + 1, clr_done_cnt);

    idle_edges(2);

    chk("TX FIFO empty after clear",
        i_tx_fifo_empty === 1'b1);

    one_frame(8'h12, 1'b1, mb);
    chk_eq("holding register flushed", 8'h00, mb);

    // =========================================================================
    // TEST 13 : FIFO_CLEAR Prefetch Phases
    // =========================================================================
    $display("[%0t] TEST 13: FIFO_CLEAR prefetch phases", $time);

    for (i = 0; i < 7; i = i + 1) begin

        @(negedge SCLK);
        tx_push(8'h50 + i);

        idle_edges(i);

        cb = clr_done_cnt;

        clr_pulse;
        wait_clr_done(cb);

        chk_eq("phase clear done", cb + 1, clr_done_cnt);

        idle_edges(3);

        one_frame(8'h77, 1'b1, mb);

        chk_eq("phase data cleared", 8'h00, mb);

    end

    // =========================================================================
    // TEST 13b : Deep FIFO Clear
    // =========================================================================
    $display("[%0t] TEST 13b: deep FIFO clear", $time);

    for (i = 0; i < 9; i = i + 1) begin
        @(negedge SCLK);
        tx_push(8'h30 + i);
    end

    idle_edges(2);

    cb = clr_done_cnt;

    clr_pulse;
    wait_clr_done(cb);

    chk("clear done seen", clr_done_cnt == cb + 1);
    chk("FIFO completely drained", tq_head == tq_tail);

    idle_edges(4);

    one_frame(8'h18, 1'b1, mb);
    chk_eq("deep FIFO cleared", 8'h00, mb);

    // =========================================================================
    // TEST 13c : Late CDC Writes During Clear
    // =========================================================================
    $display("[%0t] TEST 13c: late CDC writes", $time);

    for (i = 1; i <= 3; i = i + 1) begin

        cb = clr_done_cnt;

        clr_req = 1'b1;

        @(negedge SCLK);

        idle_edges(i);

        @(negedge SCLK);
        tx_push(8'h40 + i);

        wait_clr_done(cb);

        idle_edges(4);

        one_frame(8'h19, 1'b1, mb);

        chk_eq("late write discarded", 8'h00, mb);

    end

    // =========================================================================
    // TEST 14 : New Data After Clear
    // =========================================================================
    $display("[%0t] TEST 14: new data after clear", $time);

    @(negedge SCLK);
    tx_push(8'hE1);

    idle_edges(6);

    cb = clr_done_cnt;

    clr_pulse;
    wait_clr_done(cb);

    @(negedge SCLK);
    tx_push(8'hE2);

    idle_edges(8);

    one_frame(8'h13, 1'b1, mb);
    chk_eq("new byte E2", 8'hE2, mb);

    // =========================================================================
    // TEST 15 : FIFO_CLEAR During Active Frame
    // =========================================================================
    $display("[%0t] TEST 15: clear during active frame", $time);

    @(negedge SCLK);
    tx_push(8'hB7);

    idle_edges(6);

    @(negedge SCLK);
    tx_push(8'hB8);

    idle_edges(3);

    frame_start;

    cb = clr_done_cnt;

    #5;
    clr_req = 1'b1;

    xfer_byte(8'h14, mb);
    frame_end_late;

    wait_clr_done(cb);

    chk_eq("in-flight byte B7", 8'hB7, mb);

    idle_edges(3);

    one_frame(8'h15, 1'b1, mb);
    chk_eq("following byte cleared", 8'h00, mb);

    // =========================================================================
    // TEST 16 : Multi-Byte TX
    // =========================================================================
    $display("[%0t] TEST 16: multi-byte TX", $time);

    @(negedge SCLK);
    tx_push(8'h11);

    @(negedge SCLK);
    tx_push(8'h22);

    @(negedge SCLK);
    tx_push(8'h33);

    idle_edges(8);

    frame_start;

    xfer_byte(8'h01, mb);
    idle_edges(1);

    xfer_byte(8'h02, mb2);
    idle_edges(1);

    xfer_byte(8'h03, mb3);
    idle_edges(1);

    chk_eq("TX byte 0", 8'h11, mb);
    chk_eq("TX byte 1", 8'h22, mb2);
    chk_eq("TX byte 2", 8'h33, mb3);

    xfer_byte(8'h04, mb);
    chk_eq("TX underflow", 8'h00, mb);

    frame_end_late;

    // =========================================================================
    // TEST 10 : Asynchronous Reset Mid-Byte
    // =========================================================================
    $display("[%0t] TEST 10: asynchronous reset mid-byte", $time);

    rx_before = rx_cnt;

    frame_start;

    for (i = 7; i >= 5; i = i - 1) begin
        @(negedge SCLK);
        i_mosi = 1'b1;

        @(posedge SCLK);
    end

    #2;
    rst_n = 1'b0;

    #1;

    chk("SPI_BUSY async reset", o_spi_busy === 1'b0);
    chk("MISO async reset", o_miso === 1'b0);

    idle_edges(3);

    @(negedge SCLK);
    rst_n  = 1'b1;
    i_cs_n = 1'b1;

    idle_edges(3);

    chk_eq("reset aborted RX", rx_before, rx_cnt);

    one_frame(8'hD2, 1'b1, mb);

    // =========================================================================
    // TEST 17 : Reset With TX Holding Data
    // =========================================================================
    $display("[%0t] TEST 17: reset with TX holding data", $time);

    @(negedge SCLK);
    tx_push(8'h9E);

    idle_edges(6);

    @(negedge SCLK);
    rst_n = 1'b0;

    idle_edges(2);

    @(negedge SCLK);
    rst_n = 1'b1;

    idle_edges(3);

    one_frame(8'h16, 1'b1, mb);
    chk_eq("old holding data cleared", 8'h00, mb);

    @(negedge SCLK);
    tx_push(8'h5C);

    idle_edges(6);

    one_frame(8'h17, 1'b1, mb);
    chk_eq("first TX after reset", 8'h5C, mb);

    // =========================================================================
    // Final Result
    // =========================================================================
    chk_eq("MISO rising-edge violations", 0, miso_viol);

    if (errors == 0) begin
        $display("[%0t] ALL TESTS PASSED (tb_spi_slave, %0d checks)",
                 $time, checks);
    end
    else begin
        $display("[%0t] TESTS FAILED: %0d error(s) (tb_spi_slave)",
                 $time, errors);
    end

    $finish;

end

// =============================================================================
// Simulation Timeout
// =============================================================================
initial begin
    #500000;

    $display("[%0t] FAIL: TIMEOUT -- simulation did not finish", $time);

    $finish;
end

endmodule
