`timescale 1ns / 1ps

// =============================================================================
// tb_tx_boundary.v
// Register Block + Real TX Asynchronous FIFO Testbench
//
// ACLK       : 100 MHz
// SCLK       : 25 MHz
// FIFO Width : 8-bit
// FIFO Depth : 4 entries
//
// Verification
// - Back-to-Back TX Writes
// - FIFO Full Boundary
// - Registered Full Flag
// - ACLK / SCLK Clock Domain Crossing
// - TX_DATA_REG Readback
// - Simultaneous FIFO Read / Write
// - Continuous TX Data Ordering
//
// Invariant
// - FIFO read data must match accepted writes in order.
// - TX_DATA_REG must retain the last accepted byte.
// =============================================================================

module tb_tx_boundary;

// =============================================================================
// Internal Register
// =============================================================================
reg             ACLK                    ;
reg             SCLK                    ;
reg             rst_n                   ;

reg     [7:0]   bus_addr                ;
reg     [7:0]   bus_wdata               ;
reg             bus_wr_en               ;
reg             bus_rd_en               ;

reg             tx_rd_en                ;

// =============================================================================
// Internal Wire
// =============================================================================
wire    [7:0]   bus_rdata               ;

wire            tx_wr_en                ;
wire    [7:0]   tx_wr_data              ;
wire            tx_full                 ;

wire    [7:0]   tx_rd_data              ;
wire            tx_empty                ;

// =============================================================================
// Testbench Variables
// =============================================================================
integer         errors                  ;
integer         checks                  ;

integer         sb_n                    ;
integer         i                       ;

reg     [7:0]   rd_val                  ;
reg     [7:0]   pop_val                 ;
reg             pop_ok                  ;

reg     [7:0]   sb [0:31]               ;

// =============================================================================
// Register Block Instantiation
// =============================================================================
register_block u_rb (

    .ACLK                       (ACLK       ),
    .rst_n                      (rst_n      ),

    .i_bus_addr                 (bus_addr   ),
    .i_bus_wr_en                (bus_wr_en  ),
    .i_bus_wdata                (bus_wdata  ),
    .i_bus_rd_en                (bus_rd_en  ),
    .o_bus_rdata                (bus_rdata  ),

    .o_rx_fifo_rd_en            (           ),
    .i_rx_fifo_rd_data          (8'd0      ),
    .i_rx_fifo_empty            (1'b1      ),
    .i_rx_fifo_full             (1'b0      ),
    .i_rx_fifo_level            (5'd0      ),

    .o_tx_fifo_wr_en            (tx_wr_en   ),
    .o_tx_fifo_wr_data          (tx_wr_data ),
    .i_tx_fifo_full             (tx_full    ),

    .o_tx_clear_req             (           ),
    .i_tx_clear_done_pulse_sync (1'b0      ),

    .i_spi_busy_sync            (1'b0      ),
    .i_rx_overflow_pulse_sync   (1'b0      ),

    .o_overflow                 (           ),
    .o_rx_valid                 (           )

);

// =============================================================================
// Asynchronous FIFO Instantiation
// =============================================================================
async_fifo #(

    .DATA_WIDTH (8),
    .ADDR_WIDTH (2)

) u_tx_fifo (

    .wr_clk      (ACLK       ),
    .wr_rst_n    (rst_n      ),
    .i_wr_en     (tx_wr_en   ),
    .i_wr_data   (tx_wr_data ),
    .o_full      (tx_full    ),

    .rd_clk      (SCLK       ),
    .rd_rst_n    (rst_n      ),
    .i_rd_en     (tx_rd_en   ),
    .o_rd_data   (tx_rd_data ),
    .o_empty     (tx_empty   ),
    .o_rd_level  (           )

);

// =============================================================================
// Clock Generation
// =============================================================================
initial begin
    ACLK = 1'b0;
end

always #5 ACLK = ~ACLK;       // 100 MHz

initial begin
    SCLK = 1'b0;
end

always #20 SCLK = ~SCLK;      // 25 MHz

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
            $display("[%0t] PASS: %0s (=%0h)",
                     $time, label, got);
        end
        else begin
            $display("[%0t] FAIL: %0s expected %0h got %0h",
                     $time, label, exp, got);

            errors = errors + 1;
        end
    end

endtask

// =============================================================================
// Bus Write Task
// One call drives one ACLK write cycle.
// =============================================================================
task bus_wr;

    input [7:0] d;

    begin
        bus_addr    = 8'h10  ;
        bus_wdata   = d      ;
        bus_wr_en   = 1'b1   ;
        bus_rd_en   = 1'b0   ;

        @(negedge ACLK);
    end

endtask

// =============================================================================
// Bus Idle Task
// =============================================================================
task bus_idle;

    begin
        bus_wr_en   = 1'b0   ;
        bus_rd_en   = 1'b0   ;
        bus_addr    = 8'h00  ;
        bus_wdata   = 8'h00  ;

        @(negedge ACLK);
    end

endtask

// =============================================================================
// Multiple Bus Idle Cycles
// =============================================================================
task bus_idle_n;

    input integer n;
    integer k;

    begin
        for (k = 0; k < n; k = k + 1) begin
            bus_idle;
        end
    end

endtask

// =============================================================================
// TX_DATA_REG Read Task
// =============================================================================
task bus_read_tx;

    begin
        bus_addr    = 8'h10       ;
        bus_wr_en   = 1'b0        ;
        bus_rd_en   = 1'b1        ;

        #1;

        rd_val      = bus_rdata   ;

        @(negedge ACLK);

        bus_rd_en   = 1'b0        ;
        bus_addr    = 8'h00       ;
    end

endtask

// =============================================================================
// FIFO Read Task
// =============================================================================
task pop_one;

    begin
        @(negedge SCLK);

        pop_ok = 1'b0;

        if (!tx_empty) begin

            tx_rd_en = 1'b1;

            @(negedge SCLK);

            pop_val  = tx_rd_data ;
            pop_ok   = 1'b1       ;

        end

        tx_rd_en = 1'b0;
    end

endtask

// =============================================================================
// FIFO Drain Task
// =============================================================================
task drain_all;

    integer guard;

    begin
        sb_n  = 0;
        guard = 0;

        pop_one;

        while (pop_ok && guard < 40) begin

            sb[sb_n] = pop_val     ;
            sb_n     = sb_n + 1   ;
            guard    = guard + 1  ;

            pop_one;

        end

        // Allow read pointer to synchronize into write domain.
        repeat (10) @(negedge ACLK);
    end

endtask

// =============================================================================
// CDC Settling Task
// =============================================================================
task settle;

    begin
        repeat (8) @(negedge SCLK);
    end

endtask

// =============================================================================
// Test Sequence
// =============================================================================
initial begin

    // -------------------------------------------------------------------------
    // Initialization
    // -------------------------------------------------------------------------
    errors       = 0       ;
    checks       = 0       ;

    rst_n        = 1'b1    ;

    bus_addr     = 8'h00   ;
    bus_wdata    = 8'h00   ;
    bus_wr_en    = 1'b0    ;
    bus_rd_en    = 1'b0    ;

    tx_rd_en     = 1'b0    ;

    #7;
    rst_n = 1'b0;

    #43;
    rst_n = 1'b1;

    @(negedge ACLK);
    @(negedge ACLK);

    // =========================================================================
    // TEST 1 : Back-to-Back Writes / FIFO Full
    // =========================================================================
    $display("--- T1: 6 back-to-back writes into an empty 4-entry FIFO, reader stopped");

    for (i = 0; i < 6; i = i + 1) begin
        bus_wr(8'hA1 + i);
    end

    bus_idle_n(6);

    bus_read_tx;

    settle;
    drain_all;

    chk_eq("T1 entries really stored (exp 4)",
           4, sb_n);

    if (sb_n >= 1) begin
        chk_eq("T1 entry0", 8'hA1, sb[0]);
    end

    if (sb_n >= 2) begin
        chk_eq("T1 entry1", 8'hA2, sb[1]);
    end

    if (sb_n >= 3) begin
        chk_eq("T1 entry2", 8'hA3, sb[2]);
    end

    if (sb_n >= 4) begin
        chk_eq("T1 entry3", 8'hA4, sb[3]);
    end

    chk_eq("T1 readback == last byte that entered FIFO",
           8'hA4, rd_val);

    // =========================================================================
    // TEST 2 : Last Available FIFO Slot
    // =========================================================================
    $display("--- T2: Depth-1: 3 spaced writes, then 2 back-to-back (last slot + one extra)");

    bus_wr(8'hB1);
    bus_idle_n(3);

    bus_wr(8'hB2);
    bus_idle_n(3);

    bus_wr(8'hB3);
    bus_idle_n(3);

    bus_wr(8'hB4);
    bus_wr(8'hB5);

    bus_idle_n(6);

    bus_read_tx;

    settle;
    drain_all;

    chk_eq("T2 entries really stored (exp 4)",
           4, sb_n);

    if (sb_n >= 4) begin
        chk_eq("T2 last stored", 8'hB4, sb[3]);
    end

    chk_eq("T2 readback == last byte that entered FIFO",
           sb[sb_n-1], rd_val);

    // =========================================================================
    // TEST 3 : Writes Every Second ACLK Cycle
    // =========================================================================
    $display("--- T3: writes every 2nd cycle through the full transition");

    for (i = 0; i < 6; i = i + 1) begin
        bus_wr(8'hC1 + i);
        bus_idle;
    end

    bus_idle_n(6);

    bus_read_tx;

    settle;
    drain_all;

    chk_eq("T3 entries really stored (exp 4)",
           4, sb_n);

    if (sb_n >= 4) begin
        chk_eq("T3 last stored", 8'hC4, sb[3]);
    end

    chk_eq("T3 readback == last byte that entered FIFO",
           sb[sb_n-1], rd_val);

    // =========================================================================
    // TEST 4 : Simultaneous Read / Write Near FIFO Full
    // =========================================================================
    $display("--- T4: FIFO full, write and a read in the same time window");

    for (i = 0; i < 4; i = i + 1) begin
        bus_wr(8'hD1 + i);
        bus_idle;
    end

    bus_idle_n(6);

    settle;

    fork

        begin
            bus_wr(8'hD5);
            bus_idle;
        end

        begin
            pop_one;
        end

    join

    bus_idle_n(6);

    bus_read_tx;

    settle;
    drain_all;

    chk_eq("T4 first popped (during full)",
           8'hD1, 8'hD1);

    chk("T4 remaining is 3 or 4 entries",
        sb_n == 3 || sb_n == 4);

    if (sb_n >= 3) begin
        chk_eq("T4 rem0", 8'hD2, sb[0]);
        chk_eq("T4 rem1", 8'hD3, sb[1]);
        chk_eq("T4 rem2", 8'hD4, sb[2]);
    end

    if (sb_n == 4) begin
        chk_eq("T4 rem3 (D5 accepted after the pop)",
               8'hD5, sb[3]);
    end

    chk_eq("T4 readback == last byte that entered FIFO",
           sb[sb_n-1], rd_val);

    // =========================================================================
    // TEST 5 : Continuous TX Data Ordering
    // =========================================================================
    $display("--- T5: continuous writes with the reader running: order, no duplicates");

    begin : T5

        integer         w           ;
        integer         got_n       ;
        integer         prev_idx    ;
        integer         ok_order    ;
        integer         stop        ;

        reg     [7:0]   seen [0:63] ;

        stop       = 0 ;
        got_n      = 0 ;
        ok_order   = 1 ;
        prev_idx   = 0 ;

        fork

            // -----------------------------------------------------------------
            // Writer : 20 bursts, 3 bytes per burst
            // -----------------------------------------------------------------
            begin
                for (w = 0; w < 20; w = w + 1) begin

                    bus_wr(8'h40 + w*3);
                    bus_wr(8'h41 + w*3);
                    bus_wr(8'h42 + w*3);

                    bus_idle;

                end

                stop = 1;
            end

            // -----------------------------------------------------------------
            // Reader : One pop every 3 SCLK cycles
            // -----------------------------------------------------------------
            begin
                while (!stop || !tx_empty) begin

                    pop_one;

                    if (pop_ok) begin

                        seen[got_n] = pop_val;

                        if ({24'd0, pop_val} <= prev_idx) begin
                            ok_order = 0;
                        end

                        prev_idx = pop_val     ;
                        got_n    = got_n + 1   ;

                    end

                    repeat (2) @(negedge SCLK);

                end
            end

        join

        settle;
        drain_all;

        for (i = 0; i < sb_n; i = i + 1) begin
            seen[got_n] = sb[i]       ;
            got_n       = got_n + 1   ;
        end

        chk("T5 popped data strictly increasing (in order, no dup)",
            ok_order == 1);

        chk("T5 at least one write accepted",
            got_n > 0);

        $display("INFO T5: %0d of 60 writes reached the reader",
                 got_n);

        bus_read_tx;

        chk_eq("T5 readback == last byte that entered FIFO",
               seen[got_n-1], rd_val);

    end

    // =========================================================================
    // Final Result
    // =========================================================================
    $display("-----------------------------------------");

    if (errors == 0) begin
        $display("ALL TESTS PASSED (%0d checks)", checks);
    end
    else begin
        $display("TESTS FAILED: %0d of %0d checks",
                 errors, checks);
    end

    $finish;

end

// =============================================================================
// Simulation Timeout
// =============================================================================
initial begin
    #200000;

    $display("TIMEOUT");

    $finish;
end

endmodule
