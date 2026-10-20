`timescale 1ns / 1ps

// =============================================================================
// tb_spi_bridge_top.v
// Top-Level Integration Testbench
//
// ACLK : 100 MHz
// SCLK : 25 MHz
//
// Verification
// - RX / TX Data Path
// - Register Block
// - Asynchronous FIFO
// - SPI Master / Slave
// - STATUS / FIFO_LEVEL
// - FIFO_CLEAR
// - Overflow
// - Asynchronous Reset
// - Continuous Transfer
// =============================================================================

module tb_spi_bridge_top;

// =============================================================================
// Register Address
// =============================================================================
localparam [7:0] ADDR_RX_DATA       = 8'h00 ,
                 ADDR_STATUS        = 8'h04 ,
                 ADDR_CONTROL       = 8'h08 ,
                 ADDR_FIFO_LEVEL    = 8'h0C ,
                 ADDR_TX_DATA       = 8'h10 ;

// =============================================================================
// Internal Register
// =============================================================================
reg             ACLK                       ;
reg             ARESETn                    ;

reg     [7:0]   i_bus_addr                 ;
reg             i_bus_wr_en                ;
reg     [7:0]   i_bus_wdata                ;
reg             i_bus_rd_en                ;

// =============================================================================
// Internal Wire
// =============================================================================
wire    [7:0]   o_bus_rdata                ;

wire            o_overflow                 ;
wire            o_rx_valid                 ;

wire            o_dbg_sclk                 ;
wire            o_dbg_cs_n                 ;
wire            o_dbg_mosi                 ;
wire            o_dbg_miso                 ;

// =============================================================================
// Testbench Variables
// =============================================================================
integer         errors                     ;
integer         checks                     ;

integer         fr_cnt                     ;
integer         edge_n                     ;
integer         last_pos                   ;

integer         period_viol                ;
integer         duty_viol                  ;
integer         mode_viol                  ;
integer         cs_cnt                     ;

integer         acc_n                      ;
integer         acc_base                   ;

integer         nzn                        ;
integer         nz_first                   ;

integer         i                          ;
integer         k                          ;
integer         base                       ;
integer         fT                         ;
integer         first_idx                  ;
integer         seen_busy                  ;
integer         seen_idle                  ;
integer         run_len                    ;

reg             mon_arm                    ;
reg             ok                         ;

reg     [7:0]   msh                        ;
reg     [7:0]   ish                        ;

reg     [7:0]   rd                         ;
reg     [7:0]   st                         ;
reg     [7:0]   lv                         ;
reg     [7:0]   first_val                  ;

reg     [7:0]   mosi_log [0:1023]          ;
reg     [7:0]   miso_log [0:1023]          ;
reg     [7:0]   acc_log  [0:255]           ;
reg     [7:0]   nz       [0:63]            ;
reg     [7:0]   vals     [0:63]            ;

// =============================================================================
// DUT Instantiation
// =============================================================================
spi_bridge_top dut (

    .ACLK        (ACLK        ),
    .ARESETn     (ARESETn     ),

    .i_bus_addr  (i_bus_addr  ),
    .i_bus_wr_en (i_bus_wr_en ),
    .i_bus_wdata (i_bus_wdata ),
    .i_bus_rd_en (i_bus_rd_en ),

    .o_bus_rdata (o_bus_rdata ),

    .o_overflow  (o_overflow  ),
    .o_rx_valid  (o_rx_valid  ),

    .o_dbg_sclk  (o_dbg_sclk  ),
    .o_dbg_cs_n  (o_dbg_cs_n  ),
    .o_dbg_mosi  (o_dbg_mosi  ),
    .o_dbg_miso  (o_dbg_miso  )

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
// Pin-Level SPI Observer
// =============================================================================
initial begin
    mon_arm = 1'b0;
end

always @(posedge o_dbg_sclk) begin
    if (ARESETn && mon_arm) begin

        if (last_pos != 0 && ($time - last_pos) != 40) begin
            period_viol = period_viol + 1;
        end

        last_pos = $time;

        if (!o_dbg_cs_n) begin

            edge_n = edge_n + 1;

            if (edge_n >= 3 && edge_n <= 10) begin
                msh = {msh[6:0], o_dbg_mosi};
                ish = {ish[6:0], o_dbg_miso};
            end

            if (edge_n == 10) begin
                mosi_log[fr_cnt] = msh        ;
                miso_log[fr_cnt] = ish        ;
                fr_cnt           = fr_cnt + 1 ;
            end

        end
        else begin

            if (edge_n != 0 && edge_n != 11) begin
                $display("[%0t] FAIL: CS_N window had %0d rising edges (expected 11)",
                         $time, edge_n);

                errors = errors + 1;
            end

            edge_n = 0;

        end
    end
    else begin
        last_pos = 0;
        edge_n   = 0;
    end
end

// =============================================================================
// SCLK Duty Cycle Monitor
// =============================================================================
always @(negedge o_dbg_sclk) begin
    if (ARESETn && mon_arm &&
        last_pos != 0 &&
        ($time - last_pos) != 20) begin

        duty_viol = duty_viol + 1;
    end
end

// =============================================================================
// SPI Mode 0 Timing Monitor
// =============================================================================
always @(o_dbg_mosi or o_dbg_miso) begin
    if (ARESETn &&
        o_dbg_sclk === 1'b1 &&
        last_pos != 0 &&
        ($time == last_pos)) begin

        mode_viol = mode_viol + 1;
    end
end

// =============================================================================
// CS_N Monitor
// =============================================================================
always @(negedge o_dbg_cs_n) begin
    cs_cnt = cs_cnt + 1;
end

// =============================================================================
// Bus Write Task
// =============================================================================
task bus_write;

    input [7:0] addr;
    input [7:0] data;

    begin
        @(negedge ACLK);

        i_bus_addr     = addr ;
        i_bus_wdata    = data ;
        i_bus_wr_en    = 1'b1 ;

        @(negedge ACLK);

        i_bus_wr_en    = 1'b0 ;
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

        i_bus_addr     = addr ;
        i_bus_rd_en    = 1'b1 ;

        #1;

        data           = o_bus_rdata ;

        @(negedge ACLK);

        i_bus_rd_en    = 1'b0 ;
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
// RX Read Task
// =============================================================================
task rx_read;

    output [7:0] val;
    output       ok;

    integer     g;
    reg [7:0]   s;

    begin
        ok  = 1'b0  ;
        g   = 0     ;
        val = 8'h00 ;

        while (!ok && g < 600) begin

            bus_read(ADDR_STATUS, s);

            if (s[3]) begin
                bus_read(ADDR_RX_DATA, val);
                ok = 1'b1;
            end

            g = g + 1;
        end
    end

endtask

// =============================================================================
// Wait Frames Task
// =============================================================================
task wait_frames;

    input integer n;
    integer g;

    begin
        g = 0;

        while (fr_cnt < n && g < 20000) begin
            @(negedge ACLK);
            g = g + 1;
        end

        if (fr_cnt < n) begin
            $display("[%0t] FAIL: waiting for frame %0d (have %0d)",
                     $time, n, fr_cnt);

            errors = errors + 1;
        end
    end

endtask

// =============================================================================
// Asynchronous Reset Task
// =============================================================================
task do_reset;

    begin
        #3;
        ARESETn = 1'b0;

        #1;

        chk("reset: RX_VALID low",
            o_rx_valid === 1'b0);

        chk("reset: OVERFLOW low",
            o_overflow === 1'b0);

        chk("reset: CS_N high",
            o_dbg_cs_n === 1'b1);

        chk("reset: SCLK stopped low",
            o_dbg_sclk === 1'b0);

        repeat (8) @(negedge ACLK);

        ARESETn  = 1'b1 ;
        fr_cnt   = 0    ;
        edge_n   = 0    ;
        last_pos = 0    ;
    end

endtask

// =============================================================================
// TX FIFO Accepted-Write Monitor
// =============================================================================
initial begin
    acc_n = 0;
end

always @(posedge ACLK) begin
    if (ARESETn &&
        dut.u_tx_fifo.i_wr_en &&
        !dut.u_tx_fifo.o_full) begin

        acc_log[acc_n] = dut.u_tx_fifo.i_wr_data ;
        acc_n          = acc_n + 1               ;
    end
end

// =============================================================================
// Collect Non-Zero MISO Bytes
// =============================================================================
task collect_nz;

    input integer from;
    integer j;

    begin
        nzn      = 0  ;
        nz_first = -1 ;

        for (j = from; j < fr_cnt; j = j + 1) begin

            if (miso_log[j] !== 8'h00) begin

                if (nz_first < 0) begin
                    nz_first = j;
                end

                nz[nzn] = miso_log[j] ;
                nzn     = nzn + 1     ;
            end
        end
    end

endtask

// =============================================================================
// TX Scoreboard Task
// =============================================================================
task chk_tx_scoreboard;

    input [8*64-1:0] label;
    input [8*64-1:0] context;

    integer j;
    integer bad;

    begin
        bad = 0;

        if (nzn != acc_n - acc_base) begin
            bad = bad + 1;
        end

        for (j = 0;
             j < nzn && j < acc_n - acc_base;
             j = j + 1) begin

            if (nz[j] !== acc_log[acc_base + j]) begin
                bad = bad + 1;
            end
        end

        if (bad == 0) begin
            $display("[%0t] PASS: %0s (%0d bytes)",
                     $time, label, nzn);
        end
        else begin
            $display("[%0t] FAIL: %0s (MISO bytes %0d, accepted %0d)",
                     $time, label, nzn, acc_n - acc_base);

            errors = errors + 1;
        end

        checks = checks + 1;
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
    fr_cnt              = 0       ;
    edge_n              = 0       ;
    last_pos            = 0       ;

    period_viol         = 0       ;
    duty_viol           = 0       ;
    mode_viol           = 0       ;
    cs_cnt              = 0       ;

    i_bus_addr          = 8'h00   ;
    i_bus_wr_en         = 1'b0    ;
    i_bus_wdata         = 8'h00   ;
    i_bus_rd_en         = 1'b0    ;

    ARESETn             = 1'b1    ;

    #7;
    ARESETn             = 1'b0    ;

    repeat (10) @(negedge ACLK);

    ARESETn             = 1'b1    ;
    last_pos            = 0       ;
    edge_n              = 0       ;
    mon_arm             = 1'b1    ;

    // =========================================================================
    // TEST 0 : Reset State
    // =========================================================================
    $display("[%0t] TEST 0: reset state", $time);

    bus_read(ADDR_CONTROL, rd);
    chk_eq("CONTROL after reset", 8'h00, rd);

    bus_read(ADDR_TX_DATA, rd);
    chk_eq("TX_DATA after reset", 8'h00, rd);

    bus_read(ADDR_FIFO_LEVEL, rd);
    chk_eq("FIFO_LEVEL after reset", 8'h00, rd);

    chk("OVERFLOW low after reset",
        o_overflow === 1'b0);

    // =========================================================================
    // TEST 1 : RX Path
    // =========================================================================
    $display("[%0t] TEST 1: RX path", $time);

    for (i = 0; i < 8; i = i + 1) begin

        rx_read(rd, ok);

        chk("RX byte arrived before timeout", ok);

        chk_eq("RX_DATA == frame counter", i, rd);

        chk("RX_DATA == MOSI pin monitor",
            fr_cnt > i && rd === mosi_log[i]);
    end

    chk_eq("SCLK period 40 ns", 0, period_viol);
    chk_eq("SCLK duty 50 percent", 0, duty_viol);

    // =========================================================================
    // TEST 2 : STATUS.SPI_BUSY
    // =========================================================================
    $display("[%0t] TEST 2: SPI_BUSY", $time);

    seen_busy = 0;
    seen_idle = 0;

    for (i = 0; i < 120; i = i + 1) begin

        bus_read(ADDR_STATUS, st);

        if (st[2]) begin
            seen_busy = seen_busy + 1;
        end
        else begin
            seen_idle = seen_idle + 1;
        end

        if (st[3]) begin
            bus_read(ADDR_RX_DATA, rd);
        end
    end

    chk("SPI_BUSY observed high", seen_busy > 0);
    chk("SPI_BUSY observed low", seen_idle > 0);

    // =========================================================================
    // TEST 3 : TX Path
    // =========================================================================
    $display("[%0t] TEST 3: TX path", $time);

    fT       = fr_cnt ;
    acc_base = acc_n  ;

    bus_write(ADDR_TX_DATA, 8'h5A);

    wait_frames(fT + 6);
    collect_nz(fT);

    chk_eq("5A sent once", 1, nzn);

    chk("MISO carries 5A within 3 frames",
        nzn == 1 &&
        nz[0] === 8'h5A &&
        nz_first <= fT + 3);

    chk_tx_scoreboard("MISO bytes == FIFO-accepted bytes",
                      "single write");

    for (i = 0; i < fT - 2 && i < 3; i = i + 1) begin
        chk_eq("frames before first write send 00",
               8'h00, miso_log[i]);
    end

    chk_eq("TX_DATA readback == 5A",
           8'h5A, o_bus_rdata);

    bus_read(ADDR_TX_DATA, rd);
    chk_eq("TX_DATA readback", 8'h5A, rd);

    fT       = fr_cnt ;
    acc_base = acc_n  ;

    bus_write(ADDR_TX_DATA, 8'hC6);

    wait_frames(fT + 6);
    collect_nz(fT);

    chk("C6 sent once",
        nzn == 1 && nz[0] === 8'hC6);

    // =========================================================================
    // TEST 3b : Back-to-Back TX
    // =========================================================================
    $display("[%0t] TEST 3b: back-to-back TX", $time);

    fT       = fr_cnt ;
    acc_base = acc_n  ;

    bus_write(ADDR_TX_DATA, 8'h11);
    bus_write(ADDR_TX_DATA, 8'h22);
    bus_write(ADDR_TX_DATA, 8'h33);

    wait_frames(fT + 10);
    collect_nz(fT);

    chk_eq("three TX bytes sent", 3, nzn);

    if (nzn == 3) begin
        chk_eq("TX byte 1", 8'h11, nz[0]);
        chk_eq("TX byte 2", 8'h22, nz[1]);
        chk_eq("TX byte 3", 8'h33, nz[2]);
    end

    chk_tx_scoreboard("MISO bytes == FIFO-accepted bytes",
                      "11-22-33");

    chk_eq("later frames send 00",
           8'h00, miso_log[fr_cnt - 1]);

    // =========================================================================
    // TEST 3c : TX FIFO Overrun
    // =========================================================================
    $display("[%0t] TEST 3c: TX FIFO overrun", $time);

    fT       = fr_cnt ;
    acc_base = acc_n  ;

    for (i = 0; i < 12; i = i + 1) begin
        bus_write(ADDR_TX_DATA, 8'hA0 + i);
    end

    wait_frames(fT + 18);
    collect_nz(fT);

    chk("at least FIFO depth accepted",
        acc_n - acc_base >= 4);

    chk("some writes rejected",
        acc_n - acc_base < 12);

    chk_tx_scoreboard("every accepted byte sent in order",
                      "overrun");

    bus_read(ADDR_TX_DATA, rd);

    chk_eq("TX readback last accepted byte",
           acc_log[acc_n - 1], rd);

    // =========================================================================
    // TEST 4 : FIFO_CLEAR
    // =========================================================================
    $display("[%0t] TEST 4: FIFO_CLEAR", $time);

    bus_write(ADDR_CONTROL, 8'h01);

    idle(60);

    bus_write(ADDR_CONTROL, 8'h02);

    idle(10);

    wait_frames(fr_cnt + 6);

    bus_read(ADDR_FIFO_LEVEL, lv);

    chk("RX FIFO holds several entries",
        lv >= 4);

    fT = fr_cnt;

    bus_write(ADDR_CONTROL, 8'h01);

    idle(40);

    bus_read(ADDR_FIFO_LEVEL, lv);

    chk("FIFO_LEVEL small after clear",
        lv <= 1);

    chk("RX_VALID cleared",
        o_rx_valid === 1'b0 || fr_cnt > fT);

    rx_read(rd, ok);

    chk("new data arrives after clear", ok);

    chk("no stale data after clear",
        rd >= fT - 1);

    chk("no overflow from clear",
        o_overflow === 1'b0);

    // =========================================================================
    // TEST 4b : TX FIFO Clear
    // =========================================================================
    $display("[%0t] TEST 4b: TX FIFO clear", $time);

    fT       = fr_cnt ;
    acc_base = acc_n  ;

    bus_write(ADDR_TX_DATA, 8'h71);
    bus_write(ADDR_TX_DATA, 8'h72);
    bus_write(ADDR_TX_DATA, 8'h73);

    bus_write(ADDR_CONTROL, 8'h01);

    k = acc_n;

    bus_write(ADDR_TX_DATA, 8'h99);

    chk_eq("write rejected during TX clear",
           k, acc_n);

    run_len = 0    ;
    ok      = 1'b0 ;

    while (!ok && run_len < 200) begin

        bus_read(ADDR_STATUS, st);

        if (st[5] === 1'b0) begin
            ok = 1'b1;
        end

        run_len = run_len + 1;
    end

    chk("TX_CLR_BUSY returns to zero", ok);

    first_idx = fr_cnt + 1;
    fT        = fr_cnt;

    wait_frames(fT + 8);
    collect_nz(first_idx);

    chk_eq("cleared TX bytes never appear",
           0, nzn);

    fT       = fr_cnt ;
    acc_base = acc_n  ;

    bus_write(ADDR_TX_DATA, 8'h81);

    wait_frames(fT + 6);
    collect_nz(fT);

    chk("new TX byte 81 sent once",
        nzn == 1 && nz[0] === 8'h81);

    chk_tx_scoreboard("MISO bytes == FIFO-accepted bytes",
                      "after clear");

    // =========================================================================
    // TEST 5 : RX FIFO Full / Overflow
    // =========================================================================
    $display("[%0t] TEST 5: RX FIFO overflow", $time);

    bus_write(ADDR_CONTROL, 8'h01);

    idle(60);

    bus_write(ADDR_CONTROL, 8'h02);

    idle(10);

    fT = fr_cnt;

    wait_frames(fT + 24);

    bus_read(ADDR_STATUS, st);

    chk_eq("STATUS OVERFLOW RX_VALID FULL",
           8'b0001_1010,
           st & 8'b0001_1010);

    chk("OVERFLOW output high",
        o_overflow === 1'b1);

    bus_read(ADDR_FIFO_LEVEL, lv);

    chk_eq("FIFO_LEVEL full", 16, lv);

    for (i = 0; i < 17; i = i + 1) begin

        rx_read(vals[i], ok);

        if (!ok) begin
            $display("[%0t] FAIL: RX_VALID timeout at entry %0d",
                     $time, i);

            errors = errors + 1;
        end
    end

    run_len = 1;

    for (i = 1; i < 17; i = i + 1) begin
        if (vals[i] === vals[0] + i) begin
            run_len = run_len + 1;
        end
    end

    chk_eq("17 stored bytes consecutive",
           17, run_len);

    chk("first byte matches MOSI log",
        vals[0] === mosi_log[vals[0]]);

    rx_read(rd, ok);

    chk("dropped frames do not reappear",
        ok && rd > vals[16] + 1);

    bus_read(ADDR_STATUS, st);

    chk("OVERFLOW sticky",
        st[4] === 1'b1);

    bus_write(ADDR_CONTROL, 8'h02);

    bus_read(ADDR_STATUS, st);

    chk("OVERFLOW cleared",
        st[4] === 1'b0 &&
        o_overflow === 1'b0);

    // =========================================================================
    // TEST 6 : Asynchronous Reset
    // =========================================================================
    $display("[%0t] TEST 6: asynchronous reset", $time);

    bus_write(ADDR_TX_DATA, 8'hAB);
    bus_write(ADDR_CONTROL, 8'h04);

    wait_frames(fr_cnt + 3);

    while (o_dbg_cs_n) begin
        @(negedge ACLK);
    end

    repeat (30) @(negedge ACLK);

    do_reset;

    idle(40);

    bus_read(ADDR_STATUS, st);

    chk("STATUS EMPTY after reset",
        st[0] === 1'b1);

    bus_read(ADDR_CONTROL, rd);
    chk_eq("CONTROL reset", 8'h00, rd);

    bus_read(ADDR_TX_DATA, rd);
    chk_eq("TX_DATA reset", 8'h00, rd);

    bus_read(ADDR_FIFO_LEVEL, lv);
    chk_eq("FIFO_LEVEL reset", 8'h00, lv);

    rx_read(rd, ok);

    chk("traffic restarts after reset", ok);

    chk_eq("first RX frame after reset",
           8'h00, rd);

    wait_frames(3);
    wait_frames(5);

    chk_eq("MISO reset frame 1",
           8'h00, miso_log[1]);

    chk_eq("MISO reset frame 2",
           8'h00, miso_log[2]);

    chk_eq("MISO reset frame 3",
           8'h00, miso_log[3]);

    fT       = fr_cnt ;
    acc_base = acc_n  ;

    bus_write(ADDR_TX_DATA, 8'h4D);

    wait_frames(fT + 6);
    collect_nz(fT);

    chk("first TX after reset sent once",
        nzn == 1 && nz[0] === 8'h4D);

    chk_tx_scoreboard("MISO bytes == FIFO-accepted bytes",
                      "after reset");

    // =========================================================================
    // TEST 7 : Continuous Transfer
    // =========================================================================
    $display("[%0t] TEST 7: continuous transfer", $time);

    run_len = 0;

    for (i = 1; i < 41; i = i + 1) begin

        rx_read(rd, ok);

        if (!ok) begin
            $display("[%0t] FAIL: timeout reading frame %0d",
                     $time, i);

            errors = errors + 1;
        end
        else if (rd !== i[7:0]) begin
            $display("[%0t] FAIL: frame %0d expected=0x%02h got=0x%02h",
                     $time, i, i[7:0], rd);

            errors = errors + 1;
        end
        else begin
            run_len = run_len + 1;
        end
    end

    chk_eq("40 frames in order",
           40, run_len);

    chk("no overflow during continuous RX",
        o_overflow === 1'b0);

    chk_eq("SCLK period 40 ns",
           0, period_viol);

    chk_eq("SCLK duty 50 percent",
           0, duty_viol);

    chk_eq("MOSI MISO rising-edge violations",
           0, mode_viol);

    // =========================================================================
    // Final Result
    // =========================================================================
    if (errors == 0) begin
        $display("[%0t] ALL TESTS PASSED (tb_spi_bridge_top, %0d checks)",
                 $time, checks);
    end
    else begin
        $display("[%0t] TESTS FAILED: %0d error(s) (tb_spi_bridge_top)",
                 $time, errors);
    end

    $finish;

end

// =============================================================================
// Simulation Timeout
// =============================================================================
initial begin
    #4000000;

    $display("[%0t] FAIL: TIMEOUT -- simulation did not finish", $time);

    $finish;
end

endmodule
