mescale 1ns / 1ps

// =============================================================================
// tb_spi_master_slave.v
// Self-Checking Testbench for SPI Master / Slave
//
// SPI Mode : Mode 0 (CPOL = 0, CPHA = 0)
// Data     : 8-bit, MSB First
// SCLK     : 25 MHz
//
// Verification
// - Master MOSI -> Slave RX
// - Slave MISO -> Master RX
// - 24-Frame Data Scoreboard
// - CS_N Frame Length / Idle Gap
// - MOSI / MISO Edge Timing
// - Master / Slave Busy
// - Asynchronous Reset
// =============================================================================

module tb_spi_master_slave;

// =============================================================================
// Parameter Declaration
// =============================================================================
localparam      N_FRAMES                = 24        ;
localparam      GAP                     = 6         ;

// =============================================================================
// Internal Register
// =============================================================================
reg             SCLK                                ;
reg             rst_n                               ;

reg             s_i_rx_fifo_full                    ;
reg             s_i_tx_fifo_empty                   ;
reg     [7:0]   s_i_tx_fifo_rd_data                 ;

// =============================================================================
// Internal Wire
// =============================================================================
wire            w_cs_n                              ;
wire            w_mosi                              ;
wire            w_miso                              ;

wire            m_o_rx_captured_valid               ;
wire    [7:0]   m_o_rx_captured                     ;
wire            m_o_busy                            ;

wire            s_o_rx_wr_en                        ;
wire    [7:0]   s_o_rx_wr_data                      ;
wire            s_o_overflow                        ;
wire            s_o_tx_fifo_rd_en                   ;
wire            s_o_spi_busy                        ;

// =============================================================================
// Testbench Variables
// =============================================================================
integer         errors                              ;
integer         checks                              ;

integer         tq_head                             ;
integer         tq_tail                             ;

integer         rx_exp                              ;
integer         rx_seen                             ;
integer         frames_done                         ;
integer         cs_low_edges                        ;
integer         bad_frame_len                       ;

integer         mosi_viol                           ;
integer         miso_viol                           ;
integer         busy_viol                           ;

integer         guard                               ;

reg             push_req                            ;
reg             prev_valid                          ;
reg             prev_cs_n                           ;

reg     [7:0]   txq [0:63]                          ;

// =============================================================================
// SPI Master Instantiation
// =============================================================================
spi_master #(
    .IDLE_GAP             (GAP                     )
) u_master (

    .SCLK                 (SCLK                    ),
    .rst_n                (rst_n                   ),

    .o_cs_n               (w_cs_n                  ),
    .o_mosi               (w_mosi                  ),
    .i_miso               (w_miso                  ),

    .o_rx_captured        (m_o_rx_captured         ),
    .o_rx_captured_valid  (m_o_rx_captured_valid   ),

    .o_busy               (m_o_busy                )

);

// =============================================================================
// SPI Slave Instantiation
// =============================================================================
spi_slave u_slave (

    .SCLK                 (SCLK                    ),
    .rst_n                (rst_n                   ),

    .i_cs_n               (w_cs_n                  ),
    .i_mosi               (w_mosi                  ),
    .o_miso               (w_miso                  ),

    .o_rx_wr_en           (s_o_rx_wr_en            ),
    .o_rx_wr_data         (s_o_rx_wr_data          ),
    .i_rx_fifo_full       (s_i_rx_fifo_full        ),
    .o_rx_overflow_pulse  (s_o_overflow            ),

    .o_tx_fifo_rd_en      (s_o_tx_fifo_rd_en       ),
    .i_tx_fifo_rd_data    (s_i_tx_fifo_rd_data     ),
    .i_tx_fifo_empty      (s_i_tx_fifo_empty       ),

    .i_tx_clear_pulse     (1'b0                    ),
    .o_tx_clear_done      (                        ),

    .o_spi_busy           (s_o_spi_busy            )

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
    tq_head             = 0       ;
    tq_tail             = 0       ;

    s_i_tx_fifo_empty   = 1'b1    ;
    s_i_tx_fifo_rd_data = 8'h00   ;
    s_i_rx_fifo_full    = 1'b0    ;
end

always @(posedge SCLK or negedge rst_n) begin
    if (!rst_n) begin
        tq_head             = tq_tail ;
        s_i_tx_fifo_empty   <= 1'b1   ;
        s_i_tx_fifo_rd_data <= 8'h00  ;
    end
    else begin
        if (s_o_tx_fifo_rd_en && !s_i_tx_fifo_empty) begin
            s_i_tx_fifo_rd_data <= txq[tq_head] ;
            tq_head             = tq_head + 1  ;
        end

        s_i_tx_fifo_empty <= (tq_head == tq_tail);
    end
end

// =============================================================================
// Slave TX Response Pattern
// =============================================================================
function [7:0] txv;

    input integer n;

    begin
        txv = (8'hB1 ^ (n * 8'h1D)) | 8'h01;

        if (txv == 8'hFF) begin
            txv = 8'h7E;
        end
    end

endfunction

// =============================================================================
// RX Scoreboard / Protocol Monitor
// =============================================================================
always @(posedge SCLK) begin
    if (rst_n) begin

        // ---------------------------------------------------------------------
        // Slave RX Scoreboard
        // ---------------------------------------------------------------------
        if (s_o_rx_wr_en) begin

            if (s_o_rx_wr_data !== rx_exp[7:0]) begin
                $display("[%0t] FAIL: slave RX frame %0d expected=0x%02h got=0x%02h",
                         $time, rx_seen, rx_exp[7:0], s_o_rx_wr_data);

                errors = errors + 1;
            end
            else begin
                $display("[%0t] PASS: slave RX frame %0d = 0x%02h",
                         $time, rx_seen, s_o_rx_wr_data);
            end

            rx_exp  = (rx_exp + 1) & 8'hFF ;
            rx_seen = rx_seen + 1         ;

        end

        // ---------------------------------------------------------------------
        // Overflow Monitor
        // ---------------------------------------------------------------------
        if (s_o_overflow) begin
            $display("[%0t] FAIL: unexpected overflow pulse", $time);

            errors = errors + 1;
        end

        // ---------------------------------------------------------------------
        // Master RX Scoreboard
        // ---------------------------------------------------------------------
        if (m_o_rx_captured_valid) begin

            if (m_o_rx_captured !== txv(frames_done)) begin
                $display("[%0t] FAIL: master captured frame %0d expected=0x%02h got=0x%02h",
                         $time, frames_done, txv(frames_done), m_o_rx_captured);

                errors = errors + 1;
            end
            else begin
                $display("[%0t] PASS: master captured frame %0d = 0x%02h",
                         $time, frames_done, m_o_rx_captured);
            end

            if (prev_valid) begin
                $display("[%0t] FAIL: RX captured valid longer than one cycle",
                         $time);

                errors = errors + 1;
            end

            frames_done = frames_done + 1 ;
            push_req    = 1'b1            ;

        end

        prev_valid = m_o_rx_captured_valid;

        // ---------------------------------------------------------------------
        // CS_N Frame Length Monitor
        // ---------------------------------------------------------------------
        if (!w_cs_n) begin
            cs_low_edges = cs_low_edges + 1;
        end

        if (w_cs_n && !prev_cs_n) begin

            if (cs_low_edges != 11) begin
                $display("[%0t] FAIL: CS_N low for %0d rising edges (expected 11)",
                         $time, cs_low_edges);

                bad_frame_len = bad_frame_len + 1 ;
                errors        = errors + 1        ;
            end

            cs_low_edges = 0;

        end

        prev_cs_n = w_cs_n;

        // ---------------------------------------------------------------------
        // Master Busy Monitor
        // ---------------------------------------------------------------------
        if (!w_cs_n && !m_o_busy) begin
            busy_viol = busy_viol + 1;
        end

    end
end

// =============================================================================
// MOSI / MISO Edge Timing Monitor
// =============================================================================
always @(w_mosi) begin
    if (rst_n && (($time % 40) == 20)) begin
        mosi_viol = mosi_viol + 1;
    end
end

always @(w_miso) begin
    if (rst_n && (($time % 40) == 20)) begin
        miso_viol = miso_viol + 1;
    end
end

// =============================================================================
// Slave TX FIFO Loader
// =============================================================================
always @(negedge SCLK) begin
    if (push_req && rst_n) begin
        txq[tq_tail] = txv(frames_done) ;
        tq_tail      = tq_tail + 1     ;
        push_req     = 1'b0            ;
    end
end

// =============================================================================
// Run Until Frames Task
// =============================================================================
task run_until_frames;

    input integer n;

    begin
        guard = 0;

        while (frames_done < n && guard < 5000) begin
            @(posedge SCLK);
            guard = guard + 1;
        end

        chk("frame count reached before timeout",
            frames_done >= n);
    end

endtask

// =============================================================================
// Clear Counters Task
// =============================================================================
task clear_counters;

    begin
        rx_exp       = 0       ;
        rx_seen      = 0       ;
        frames_done  = 0       ;
        cs_low_edges = 0       ;

        prev_valid   = 1'b0    ;
        prev_cs_n    = 1'b1    ;
        push_req     = 1'b0    ;
    end

endtask

// =============================================================================
// Test Sequence
// =============================================================================
initial begin

    // -------------------------------------------------------------------------
    // Initialization
    // -------------------------------------------------------------------------
    errors          = 0       ;
    checks          = 0       ;
    bad_frame_len   = 0       ;
    mosi_viol       = 0       ;
    miso_viol       = 0       ;
    busy_viol       = 0       ;

    clear_counters;

    rst_n = 1'b0;

    repeat (4) @(posedge SCLK);

    @(negedge SCLK);

    txq[tq_tail] = txv(0)       ;
    tq_tail      = tq_tail + 1  ;
    rst_n        = 1'b1         ;

    // =========================================================================
    // TEST 1 : Master / Slave 24-Frame Transfer
    // =========================================================================
    $display("[%0t] TEST 1: %0d frames, MOSI and MISO scoreboards",
             $time, N_FRAMES);

    run_until_frames(N_FRAMES);

    repeat (3) @(posedge SCLK);

    chk("master RX pulses == slave RX writes (+-1 frame in flight)",
        (rx_seen == frames_done) ||
        (rx_seen == frames_done + 1));

    chk("slave received >= N_FRAMES bytes",
        rx_seen >= N_FRAMES);

    chk_eq("no CS_N frame length error", 0, bad_frame_len);
    chk_eq("MOSI falling-edge only", 0, mosi_viol);
    chk_eq("MISO falling-edge only", 0, miso_viol);
    chk_eq("master busy during CS_N low", 0, busy_viol);

    // =========================================================================
    // TEST 2 : CS_N Idle Gap / Busy Flags
    // =========================================================================
    $display("[%0t] TEST 2: CS_N idle gap and busy flags", $time);

    begin : gap_check

        integer high_edges;

        high_edges = 0;

        while (w_cs_n) begin
            @(posedge SCLK);
        end

        repeat (4) @(posedge SCLK);

        chk("master and slave busy inside frame",
            m_o_busy === 1'b1 &&
            s_o_spi_busy === 1'b1);

        while (!w_cs_n) begin
            @(posedge SCLK);
        end

        repeat (2) @(posedge SCLK);

        chk("master and slave idle after frame",
            m_o_busy === 1'b0 &&
            s_o_spi_busy === 1'b0);

        high_edges = 3;

        while (w_cs_n && high_edges < 100) begin
            @(posedge SCLK);

            if (w_cs_n) begin
                high_edges = high_edges + 1;
            end
        end

        chk_eq("CS_N high == IDLE_GAP",
               GAP, high_edges);

    end

    // =========================================================================
    // TEST 3 : Asynchronous Reset During Frame
    // =========================================================================
    $display("[%0t] TEST 3: asynchronous reset during frame", $time);

    while (w_cs_n) begin
        @(posedge SCLK);
    end

    repeat (5) @(posedge SCLK);

    #3;
    rst_n = 1'b0;

    #1;

    chk("async reset master idle",
        m_o_busy === 1'b0);

    chk("async reset CS_N high",
        w_cs_n === 1'b1);

    chk("async reset slave idle",
        s_o_spi_busy === 1'b0);

    repeat (3) @(posedge SCLK);

    @(negedge SCLK);

    clear_counters;

    txq[tq_tail] = txv(0)      ;
    tq_tail      = tq_tail + 1 ;
    rst_n        = 1'b1        ;

    run_until_frames(6);

    chk_eq("after reset pattern restarts at 00",
           6, rx_seen >= 6 ? 6 : rx_seen);

    chk_eq("no CS_N length errors after reset",
           0, bad_frame_len);

    chk_eq("MOSI falling-edge only",
           0, mosi_viol);

    chk_eq("MISO falling-edge only",
           0, miso_viol);

    // =========================================================================
    // Final Result
    // =========================================================================
    if (errors == 0) begin
        $display("[%0t] ALL TESTS PASSED (tb_spi_master_slave, %0d checks)",
                 $time, checks);
    end
    else begin
        $display("[%0t] TESTS FAILED: %0d error(s) (tb_spi_master_slave)",
                 $time, errors);
    end

    $finish;

end

// =============================================================================
// Simulation Timeout
// =============================================================================
initial begin
    #800000;

    $display("[%0t] FAIL: TIMEOUT -- simulation did not finish", $time);

    $finish;
end

endmodule
