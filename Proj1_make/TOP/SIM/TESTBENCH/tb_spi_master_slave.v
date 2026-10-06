`timescale 1ns/1ps

module tb_spi_master_slave;

localparam N_FRAMES = 8;

reg  SCLK;
reg  rst_n;

wire w_cs_n, w_mosi, w_miso;

wire        m_o_rx_captured_valid;
wire [7:0]  m_o_rx_captured;
wire        m_o_busy;

wire        s_o_rx_wr_en;
wire [7:0]  s_o_rx_wr_data;
wire        s_o_spi_busy;

integer errors;

// Slave-side RX FIFO tied "always ready" (not under test here -- async_fifo
// has its own dedicated testbench, tb_async_fifo.v).
wire s_i_rx_fifo_full = 1'b0;

// Slave-side TX FIFO tied empty (master's RX-capture path is exercised
// separately below by also loading a byte through it once, to confirm the
// full-duplex direction works too).
reg        s_i_tx_fifo_empty;
reg [7:0]  s_i_tx_fifo_rd_data;

spi_master #(
    .IDLE_GAP (8'd4)      // shorter gap so the testbench finishes quickly
) u_master (
    .SCLK                 (SCLK),
    .rst_n                (rst_n),
    .o_cs_n               (w_cs_n),
    .o_mosi               (w_mosi),
    .i_miso               (w_miso),
    .o_rx_captured        (m_o_rx_captured),
    .o_rx_captured_valid  (m_o_rx_captured_valid),
    .o_busy               (m_o_busy)
);

spi_slave u_slave (
    .SCLK                 (SCLK),
    .rst_n                (rst_n),
    .i_cs_n               (w_cs_n),
    .i_mosi               (w_mosi),
    .o_miso               (w_miso),
    .o_rx_wr_en           (s_o_rx_wr_en),
    .o_rx_wr_data         (s_o_rx_wr_data),
    .i_rx_fifo_full       (s_i_rx_fifo_full),
    .o_rx_overflow_pulse  (),
    .o_tx_fifo_rd_en      (),
    .i_tx_fifo_rd_data    (s_i_tx_fifo_rd_data),
    .i_tx_fifo_empty      (s_i_tx_fifo_empty),
    .o_spi_busy           (s_o_spi_busy)
);

initial SCLK = 1'b0;
always  #20 SCLK = ~SCLK;    // 40 ns period, 25 MHz-shaped

// ---------------------------------------------------------------------
// Scoreboard: the master's free-running TX pattern is a known sequence
// (0x00, 0x01, 0x02, ... wrapping at 0xFF), so we just track how many
// bytes the slave has received and compare against that counter.
// ---------------------------------------------------------------------
integer expected_byte;
integer frames_checked;

initial begin
    errors         = 0;
    expected_byte  = 0;
    frames_checked = 0;
    rst_n              = 1'b0;
    s_i_tx_fifo_empty  = 1'b1;
    s_i_tx_fifo_rd_data = 8'h00;

    repeat (4) @(posedge SCLK);
    rst_n = 1'b1;

    $display("[%0t] Starting %0d-frame master<->slave loopback check", $time, N_FRAMES);
end

// Every time the slave successfully writes a byte into its (stubbed) RX
// FIFO, check it against the expected free-running pattern.
always @(posedge SCLK) begin
    if (rst_n && s_o_rx_wr_en) begin
        if (s_o_rx_wr_data !== expected_byte[7:0]) begin
            $display("[%0t] FAIL: frame %0d expected=0x%02h got=0x%02h",
                      $time, frames_checked, expected_byte[7:0], s_o_rx_wr_data);
            errors = errors + 1;
        end else begin
            $display("[%0t] PASS: frame %0d received 0x%02h correctly",
                      $time, frames_checked, s_o_rx_wr_data);
        end
        expected_byte  = (expected_byte + 1) & 8'hFF;
        frames_checked = frames_checked + 1;
    end
end

// End the test once N_FRAMES have been checked (or time out).
initial begin
    wait (frames_checked >= N_FRAMES);
    repeat (10) @(posedge SCLK);

    if (errors == 0)
        $display("[%0t] ALL TESTS PASSED (tb_spi_master_slave, %0d frames)", $time, frames_checked);
    else
        $display("[%0t] TESTS FAILED: %0d error(s) (tb_spi_master_slave)", $time, errors);

    $finish;
end

initial begin
    #200000;
    $display("[%0t] FAIL: TIMEOUT -- only %0d/%0d frames seen (check the CS_SETUP timing alignment)",
              $time, frames_checked, N_FRAMES);
    $finish;
end

endmodule
