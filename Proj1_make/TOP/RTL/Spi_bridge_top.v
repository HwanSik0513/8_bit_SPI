`timescale 1ns / 1ps

// =============================================================================
// spi_bridge_top.v
// SPI Master-Slave CDC Bridge Top Module
//
// ACLK : 100 MHz
// SCLK :  25 MHz
//
// RX FIFO : 16 entries
// TX FIFO :  4 entries + 1-byte holding register
// =============================================================================

module spi_bridge_top (

    // port list
    ACLK                    ,
    ARESETn                 ,
    i_bus_addr              ,
    i_bus_wr_en             ,
    i_bus_wdata             ,
    i_bus_rd_en             ,
    o_bus_rdata             ,
    o_overflow              ,
    o_rx_valid              ,
    o_dbg_sclk              ,
    o_dbg_cs_n              ,
    o_dbg_mosi              ,
    o_dbg_miso

);

// =============================================================================
// Port Declaration
// =============================================================================
input           ACLK                    ;
input           ARESETn                 ;

input   [7:0]   i_bus_addr              ;
input           i_bus_wr_en             ;
input   [7:0]   i_bus_wdata             ;
input           i_bus_rd_en             ;
output  [7:0]   o_bus_rdata             ;

output          o_overflow              ;
output          o_rx_valid              ;

output          o_dbg_sclk              ;
output          o_dbg_cs_n              ;
output          o_dbg_mosi              ;
output          o_dbg_miso              ;

// =============================================================================
// Internal Wire
// =============================================================================

// Clock / Reset
wire            SCLK                    ;
wire            w_sclk_raw              ;
wire            aclk_rst_n              ;
wire            sclk_rst_n              ;

// SPI Interface
wire            w_cs_n                  ;
wire            w_mosi                  ;
wire            w_miso                  ;
wire            w_spi_busy_master       ;
wire            w_spi_busy_slave        ;

// RX FIFO Interface
wire            w_rx_wr_en              ;
wire    [7:0]   w_rx_wr_data            ;
wire            w_rx_fifo_full          ;
wire            w_rx_overflow_pulse     ;

wire            w_rx_fifo_rd_en         ;
wire    [7:0]   w_rx_fifo_rd_data       ;
wire            w_rx_fifo_empty         ;
wire    [4:0]   w_rx_fifo_level         ;

// TX FIFO Interface
wire            w_tx_fifo_wr_en         ;
wire    [7:0]   w_tx_fifo_wr_data       ;
wire            w_tx_fifo_full          ;

wire            w_tx_fifo_rd_en         ;
wire    [7:0]   w_tx_fifo_rd_data       ;
wire            w_tx_fifo_empty         ;

// TX FIFO Clear Handshake
wire            w_tx_clear_req          ;
wire            w_tx_clear_pulse        ;
wire            w_tx_clear_done         ;
wire            w_tx_clear_done_sync    ;

// Overflow CDC
wire            w_rx_overflow_pulse_sync;

// =============================================================================
// Internal Register
// =============================================================================
reg             r_spi_busy_sclk         ;
reg             r_spi_busy_meta         ;
reg             r_spi_busy_sync         ;

reg             r_rx_full_meta          ;
reg             r_rx_full_sync          ;

// =============================================================================
// Modeling
// =============================================================================

// -----------------------------------------------------------------------------
// Reset Synchronizer : ACLK Domain
// -----------------------------------------------------------------------------
reset_sync u_reset_sync_aclk (

    .clk            (ACLK               ),
    .arst_n         (ARESETn            ),
    .rst_n_sync     (aclk_rst_n         )

);

// -----------------------------------------------------------------------------
// Reset Synchronizer : SCLK Domain
// -----------------------------------------------------------------------------
reset_sync u_reset_sync_sclk (

    .clk            (SCLK               ),
    .arst_n         (ARESETn            ),
    .rst_n_sync     (sclk_rst_n         )

);

// -----------------------------------------------------------------------------
// SCLK Generator : 100 MHz -> 25 MHz
// -----------------------------------------------------------------------------
sclk_gen u_sclk_gen (

    .clk            (ACLK               ),
    .rst_n          (aclk_rst_n         ),
    .o_sclk         (w_sclk_raw         )

);

// -----------------------------------------------------------------------------
// SCLK Clock Buffer
// -----------------------------------------------------------------------------
`ifdef XILINX_BUFG

BUFG u_bufg_sclk (

    .I              (w_sclk_raw         ),
    .O              (SCLK               )

);

`else

assign SCLK = w_sclk_raw;

`endif

// =============================================================================
// SPI Master : SCLK Domain
// =============================================================================
spi_master u_spi_master (

    .SCLK               (SCLK                   ),
    .rst_n              (sclk_rst_n           ),
    .o_cs_n             (w_cs_n               ),
    .o_mosi             (w_mosi               ),
    .i_miso             (w_miso               ),
    .o_rx_captured      (                       ),
    .o_rx_captured_valid(                       ),
    .o_busy             (w_spi_busy_master    )

);

// =============================================================================
// SPI Slave : SCLK Domain
// =============================================================================
spi_slave u_spi_slave (

    .SCLK                   (SCLK                   ),
    .rst_n                  (sclk_rst_n           ),
    .i_cs_n                 (w_cs_n               ),
    .i_mosi                 (w_mosi               ),
    .o_miso                 (w_miso               ),

    .o_rx_wr_en             (w_rx_wr_en           ),
    .o_rx_wr_data           (w_rx_wr_data         ),
    .i_rx_fifo_full         (w_rx_fifo_full       ),
    .o_rx_overflow_pulse    (w_rx_overflow_pulse  ),

    .o_tx_fifo_rd_en        (w_tx_fifo_rd_en      ),
    .i_tx_fifo_rd_data      (w_tx_fifo_rd_data    ),
    .i_tx_fifo_empty        (w_tx_fifo_empty      ),

    .i_tx_clear_pulse       (w_tx_clear_pulse     ),
    .o_tx_clear_done        (w_tx_clear_done      ),

    .o_spi_busy             (w_spi_busy_slave     )

);

// =============================================================================
// SPI Debug Output
// =============================================================================
assign o_dbg_sclk = SCLK       ;
assign o_dbg_cs_n = w_cs_n     ;
assign o_dbg_mosi = w_mosi     ;
assign o_dbg_miso = w_miso     ;

// =============================================================================
// RX Async FIFO
//
// Write Domain : SCLK
// Read Domain  : ACLK
// Depth        : 16 entries
// =============================================================================
async_fifo #(

    .DATA_WIDTH     (8                  ),
    .ADDR_WIDTH     (4                  )

) u_rx_fifo (

    .wr_clk         (SCLK               ),
    .wr_rst_n       (sclk_rst_n         ),
    .i_wr_en        (w_rx_wr_en         ),
    .i_wr_data      (w_rx_wr_data       ),
    .o_full         (w_rx_fifo_full     ),

    .rd_clk         (ACLK               ),
    .rd_rst_n       (aclk_rst_n         ),
    .i_rd_en        (w_rx_fifo_rd_en    ),
    .o_rd_data      (w_rx_fifo_rd_data  ),
    .o_empty        (w_rx_fifo_empty    ),
    .o_rd_level     (w_rx_fifo_level    )

);

// =============================================================================
// TX Async FIFO
//
// Write Domain : ACLK
// Read Domain  : SCLK
// Depth        : 4 entries
// =============================================================================
async_fifo #(

    .DATA_WIDTH     (8                  ),
    .ADDR_WIDTH     (2                  )

) u_tx_fifo (

    .wr_clk         (ACLK               ),
    .wr_rst_n       (aclk_rst_n         ),
    .i_wr_en        (w_tx_fifo_wr_en    ),
    .i_wr_data      (w_tx_fifo_wr_data  ),
    .o_full         (w_tx_fifo_full     ),

    .rd_clk         (SCLK               ),
    .rd_rst_n       (sclk_rst_n         ),
    .i_rd_en        (w_tx_fifo_rd_en    ),
    .o_rd_data      (w_tx_fifo_rd_data  ),
    .o_empty        (w_tx_fifo_empty    ),
    .o_rd_level     (                   )

);

// =============================================================================
// TX FIFO Clear Request CDC : ACLK -> SCLK
// =============================================================================
pulse_sync u_tx_clear_req_sync (

    .src_clk        (ACLK               ),
    .src_rst_n      (aclk_rst_n         ),
    .i_src_pulse    (w_tx_clear_req     ),

    .dst_clk        (SCLK               ),
    .dst_rst_n      (sclk_rst_n         ),
    .o_dst_pulse    (w_tx_clear_pulse   )

);

// =============================================================================
// TX FIFO Clear Done CDC : SCLK -> ACLK
// =============================================================================
pulse_sync u_tx_clear_done_sync (

    .src_clk        (SCLK               ),
    .src_rst_n      (sclk_rst_n         ),
    .i_src_pulse    (w_tx_clear_done    ),

    .dst_clk        (ACLK               ),
    .dst_rst_n      (aclk_rst_n         ),
    .o_dst_pulse    (w_tx_clear_done_sync)

);

// =============================================================================
// RX Overflow Pulse CDC : SCLK -> ACLK
// =============================================================================
pulse_sync u_overflow_pulse_sync (

    .src_clk        (SCLK                       ),
    .src_rst_n      (sclk_rst_n                 ),
    .i_src_pulse    (w_rx_overflow_pulse        ),

    .dst_clk        (ACLK                       ),
    .dst_rst_n      (aclk_rst_n                 ),
    .o_dst_pulse    (w_rx_overflow_pulse_sync   )

);

// =============================================================================
// SPI Busy Register : SCLK Domain
// =============================================================================
always @(posedge SCLK or negedge sclk_rst_n) begin
    if (!sclk_rst_n) begin
        r_spi_busy_sclk     <= 1'b0                    ;
    end
    else begin
        r_spi_busy_sclk     <= w_spi_busy_master ||
                               w_spi_busy_slave       ;
    end
end

// =============================================================================
// Single-Bit CDC : SCLK -> ACLK
//
// SPI_BUSY : 2-FF Synchronizer
// RX_FULL  : 2-FF Synchronizer
// =============================================================================
always @(posedge ACLK or negedge aclk_rst_n) begin
    if (!aclk_rst_n) begin
        r_spi_busy_meta     <= 1'b0                    ;
        r_spi_busy_sync     <= 1'b0                    ;
        r_rx_full_meta      <= 1'b0                    ;
        r_rx_full_sync      <= 1'b0                    ;
    end
    else begin
        r_spi_busy_meta     <= r_spi_busy_sclk         ;
        r_spi_busy_sync     <= r_spi_busy_meta         ;
        r_rx_full_meta      <= w_rx_fifo_full          ;
        r_rx_full_sync      <= r_rx_full_meta          ;
    end
end

// =============================================================================
// Register Block : ACLK Domain
// =============================================================================
register_block u_register_block (

    .ACLK                       (ACLK                       ),
    .rst_n                      (aclk_rst_n                 ),

    .i_bus_addr                 (i_bus_addr                 ),
    .i_bus_wr_en                (i_bus_wr_en                ),
    .i_bus_wdata                (i_bus_wdata                ),
    .i_bus_rd_en                (i_bus_rd_en                ),
    .o_bus_rdata                (o_bus_rdata                ),

    .o_rx_fifo_rd_en            (w_rx_fifo_rd_en            ),
    .i_rx_fifo_rd_data          (w_rx_fifo_rd_data          ),
    .i_rx_fifo_empty            (w_rx_fifo_empty            ),
    .i_rx_fifo_full             (r_rx_full_sync             ),
    .i_rx_fifo_level            (w_rx_fifo_level            ),

    .o_tx_fifo_wr_en            (w_tx_fifo_wr_en            ),
    .o_tx_fifo_wr_data          (w_tx_fifo_wr_data          ),
    .i_tx_fifo_full             (w_tx_fifo_full             ),
    .o_tx_clear_req             (w_tx_clear_req             ),
    .i_tx_clear_done_pulse_sync (w_tx_clear_done_sync       ),

    .i_spi_busy_sync            (r_spi_busy_sync            ),
    .i_rx_overflow_pulse_sync   (w_rx_overflow_pulse_sync   ),

    .o_overflow                 (o_overflow                 ),
    .o_rx_valid                 (o_rx_valid                 )

);

endmodule
