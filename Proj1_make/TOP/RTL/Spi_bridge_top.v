`timescale 1ns / 1ps

module spi_bridge_top (
    // port list
    ACLK            ,
    ARESETn         ,
    i_bus_addr      ,
    i_bus_wr_en     ,
    i_bus_wdata     ,
    i_bus_rd_en     ,
    o_bus_rdata     ,
    o_overflow      ,
    o_rx_valid      ,
    o_dbg_sclk      ,
    o_dbg_cs_n      ,
    o_dbg_mosi      ,
    o_dbg_miso
);

// port declaration
input           ACLK        ; // 100 MHz system clock
input           ARESETn     ; // global asynchronous active-low reset

input   [7:0]   i_bus_addr  ; // register bus (placeholder until an AXI4-Lite wrapper is added)
input           i_bus_wr_en ;
input   [7:0]   i_bus_wdata ;
input           i_bus_rd_en ;
output  [7:0]   o_bus_rdata ;

output          o_overflow  ; // top-level status outputs
output          o_rx_valid  ;

output          o_dbg_sclk  ; // debug-only visibility of the internal SPI bus
output          o_dbg_cs_n  ; // (optional; not part of the required top-level
output          o_dbg_mosi  ; //  interface per spec section 04)
output          o_dbg_miso  ;

// =====================================================================
// SCLK net: declared up front because both the reset_sync instance below
// and the sclk_gen/BUFG pair further down need to reference it. It is
// driven by the BUFG output later in this file.
// =====================================================================
wire SCLK;

// =====================================================================
// Reset synchronization, one per clock domain
// =====================================================================
wire aclk_rst_n;
wire sclk_rst_n;

reset_sync u_reset_sync_aclk (
    .clk        (ACLK),
    .arst_n     (ARESETn),
    .rst_n_sync (aclk_rst_n)
);

reset_sync u_reset_sync_sclk (
    .clk        (SCLK),
    .arst_n     (ARESETn),
    .rst_n_sync (sclk_rst_n)
);

// =====================================================================
// SCLK generation: ACLK-domain divider -> BUFG -> real SCLK clock tree
// =====================================================================
wire w_sclk_raw;

sclk_gen u_sclk_gen (
    .clk     (ACLK),
    .rst_n   (aclk_rst_n),
    .o_sclk  (w_sclk_raw)
);

// BUFG: required so the divided clock is driven onto a global clock
// buffer/tree, not left as an ordinary combinational/register net. This
// is a justified, target-specific primitive per spec section 19 (FPGA
// clocking resources) -- swap for the equivalent primitive if targeting
// a different vendor.
BUFG u_bufg_sclk (
    .I (w_sclk_raw),
    .O (SCLK)
);

// =====================================================================
// SPI Master + SPI Slave (SCLK domain)
// =====================================================================
wire w_cs_n, w_mosi, w_miso;
wire w_spi_busy_master, w_spi_busy_slave;

wire         w_rx_wr_en;
wire [7:0]   w_rx_wr_data;
wire         w_rx_fifo_full;
wire         w_rx_overflow_pulse;

wire         w_tx_fifo_rd_en;
wire [7:0]   w_tx_fifo_rd_data;
wire         w_tx_fifo_empty;

spi_master u_spi_master (
    .SCLK                 (SCLK),
    .rst_n                (sclk_rst_n),
    .o_cs_n               (w_cs_n),
    .o_mosi               (w_mosi),
    .i_miso               (w_miso),
    .o_rx_captured        (),           // unused: master-side RX debug capture
    .o_rx_captured_valid  (),
    .o_busy               (w_spi_busy_master)
);

spi_slave u_spi_slave (
    .SCLK                   (SCLK),
    .rst_n                  (sclk_rst_n),
    .i_cs_n                 (w_cs_n),
    .i_mosi                 (w_mosi),
    .o_miso                 (w_miso),
    .o_rx_wr_en             (w_rx_wr_en),
    .o_rx_wr_data           (w_rx_wr_data),
    .i_rx_fifo_full         (w_rx_fifo_full),
    .o_rx_overflow_pulse    (w_rx_overflow_pulse),
    .o_tx_fifo_rd_en        (w_tx_fifo_rd_en),
    .i_tx_fifo_rd_data      (w_tx_fifo_rd_data),
    .i_tx_fifo_empty        (w_tx_fifo_empty),
    .o_spi_busy             (w_spi_busy_slave)
);

assign o_dbg_sclk = SCLK;
assign o_dbg_cs_n = w_cs_n;
assign o_dbg_mosi = w_mosi;
assign o_dbg_miso = w_miso;

// =====================================================================
// RX path: rx_fifo, SCLK write side / ACLK read side (16 entries)
// =====================================================================
wire [7:0] w_rx_fifo_rd_data;
wire       w_rx_fifo_empty;
wire [4:0] w_rx_fifo_level;
wire       w_rx_fifo_rd_en;

async_fifo #(
    .DATA_WIDTH (8),
    .ADDR_WIDTH (4)          // 16 entries, per spec section 06
) u_rx_fifo (
    .wr_clk    (SCLK),
    .wr_rst_n  (sclk_rst_n),
    .i_wr_en   (w_rx_wr_en),
    .i_wr_data (w_rx_wr_data),
    .o_full    (w_rx_fifo_full),

    .rd_clk    (ACLK),
    .rd_rst_n  (aclk_rst_n),
    .i_rd_en   (w_rx_fifo_rd_en),
    .o_rd_data (w_rx_fifo_rd_data),
    .o_empty   (w_rx_fifo_empty),
    .o_rd_level(w_rx_fifo_level)
);

// =====================================================================
// TX path: tx_fifo, ACLK write side / SCLK read side (4 entries -- a
// deep queue is not needed, it only ever needs to hold the most recent
// few TX_DATA_REG writes).
// =====================================================================
wire       w_tx_fifo_wr_en;
wire [7:0] w_tx_fifo_wr_data;
wire       w_tx_fifo_full;

async_fifo #(
    .DATA_WIDTH (8),
    .ADDR_WIDTH (2)          // 4 entries
) u_tx_fifo (
    .wr_clk    (ACLK),
    .wr_rst_n  (aclk_rst_n),
    .i_wr_en   (w_tx_fifo_wr_en),
    .i_wr_data (w_tx_fifo_wr_data),
    .o_full    (w_tx_fifo_full),

    .rd_clk    (SCLK),
    .rd_rst_n  (sclk_rst_n),
    .i_rd_en   (w_tx_fifo_rd_en),
    .o_rd_data (w_tx_fifo_rd_data),
    .o_empty   (w_tx_fifo_empty),
    .o_rd_level()                  // unused on the TX side
);

// =====================================================================
// Single-bit CDC: OVERFLOW pulse (SCLK -> ACLK)
// =====================================================================
wire w_rx_overflow_pulse_sync;

pulse_sync u_overflow_pulse_sync (
    .src_clk     (SCLK),
    .src_rst_n   (sclk_rst_n),
    .i_src_pulse (w_rx_overflow_pulse),
    .dst_clk     (ACLK),
    .dst_rst_n   (aclk_rst_n),
    .o_dst_pulse (w_rx_overflow_pulse_sync)
);

// =====================================================================
// Single-bit CDC: SPI_BUSY level (SCLK -> ACLK), plain 2FF synchronizer
// (safe here because it is a LEVEL signal, not a pulse).
// =====================================================================
reg r_spi_busy_meta, r_spi_busy_sync;
wire w_spi_busy = w_spi_busy_master || w_spi_busy_slave;

always @(posedge ACLK) begin
    if (!aclk_rst_n) begin
        r_spi_busy_meta <= 1'b0;
        r_spi_busy_sync <= 1'b0;
    end else begin
        r_spi_busy_meta <= w_spi_busy;
        r_spi_busy_sync <= r_spi_busy_meta;
    end
end

// =====================================================================
// Register Block (ACLK domain)
// =====================================================================
register_block u_register_block (
    .ACLK                       (ACLK),
    .rst_n                      (aclk_rst_n),

    .i_bus_addr                 (i_bus_addr),
    .i_bus_wr_en                (i_bus_wr_en),
    .i_bus_wdata                (i_bus_wdata),
    .i_bus_rd_en                (i_bus_rd_en),
    .o_bus_rdata                (o_bus_rdata),

    .o_rx_fifo_rd_en            (w_rx_fifo_rd_en),
    .i_rx_fifo_rd_data          (w_rx_fifo_rd_data),
    .i_rx_fifo_empty            (w_rx_fifo_empty),
    .i_rx_fifo_full             (w_rx_fifo_full),
    .i_rx_fifo_level            (w_rx_fifo_level),

    .o_tx_fifo_wr_en            (w_tx_fifo_wr_en),
    .o_tx_fifo_wr_data          (w_tx_fifo_wr_data),
    .i_tx_fifo_full             (w_tx_fifo_full),

    .i_spi_busy_sync            (r_spi_busy_sync),
    .i_rx_overflow_pulse_sync   (w_rx_overflow_pulse_sync),

    .o_overflow                 (o_overflow),
    .o_rx_valid                 (o_rx_valid)
);

endmodule
