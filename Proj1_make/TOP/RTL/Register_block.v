`timescale 1ns / 1ps

module register_block (
    // port list
    ACLK                        ,
    rst_n                       ,
    i_bus_addr                  ,
    i_bus_wr_en                 ,
    i_bus_wdata                 ,
    i_bus_rd_en                 ,
    o_bus_rdata                 ,
    o_rx_fifo_rd_en             ,
    i_rx_fifo_rd_data           ,
    i_rx_fifo_empty             ,
    i_rx_fifo_full              ,
    i_rx_fifo_level             ,
    o_tx_fifo_wr_en             ,
    o_tx_fifo_wr_data           ,
    i_tx_fifo_full              ,
    i_spi_busy_sync             ,
    i_rx_overflow_pulse_sync    ,
    o_overflow                  ,
    o_rx_valid
);

// port declaration
input           ACLK                        ;
input           rst_n                       ; // ACLK-domain synchronized reset

input   [7:0]   i_bus_addr                  ; // register bus
input           i_bus_wr_en                 ;
input   [7:0]   i_bus_wdata                 ;
input           i_bus_rd_en                 ;
output  [7:0]   o_bus_rdata                 ;

output          o_rx_fifo_rd_en             ; // RX FIFO, read side (ACLK domain)
input   [7:0]   i_rx_fifo_rd_data           ;
input           i_rx_fifo_empty             ;
input           i_rx_fifo_full              ;
input   [4:0]   i_rx_fifo_level             ; // ADDR_WIDTH=4 -> 5-bit level

output          o_tx_fifo_wr_en             ; // TX FIFO, write side (ACLK domain)
output  [7:0]   o_tx_fifo_wr_data           ;
input           i_tx_fifo_full              ;

input           i_spi_busy_sync             ; // already synchronized into ACLK domain
input           i_rx_overflow_pulse_sync    ; // pulse_sync'd, 1 ACLK cycle

output          o_overflow                  ; // top-level status outputs
output          o_rx_valid                  ;

// internal register
reg     [7:0]   o_bus_rdata                 ;
reg             o_tx_fifo_wr_en             ;
reg     [7:0]   o_tx_fifo_wr_data           ;

// ---------------------------------------------------------------
// Register map addresses
// ---------------------------------------------------------------
localparam [7:0] ADDR_RX_DATA    = 8'h00,
                  ADDR_STATUS     = 8'h04,
                  ADDR_CONTROL    = 8'h08,
                  ADDR_FIFO_LEVEL = 8'h0C,
                  ADDR_TX_DATA    = 8'h10;

reg  [7:0] r_rx_data_buf;
reg        rx_data_buf_valid;
reg        r_rx_fifo_rd_en_d;      // aligns with FIFO's 1-cycle read latency

reg        irq_enable;
reg        r_drain_active;
reg        r_overflow_sticky;

wire       w_rx_addr_hit       = (i_bus_addr == ADDR_RX_DATA);
wire       w_tx_addr_hit       = (i_bus_addr == ADDR_TX_DATA);
wire       w_control_wr_hit    = i_bus_wr_en && (i_bus_addr == ADDR_CONTROL);
wire       w_fifo_clear_strobe = w_control_wr_hit && i_bus_wdata[0];
wire       w_ovfl_clear_strobe = w_control_wr_hit && i_bus_wdata[1];
wire       w_rx_prefetch       = !rx_data_buf_valid && !i_rx_fifo_empty && !r_drain_active;

// modeling

// ---------------------------------------------------------------
// RX prefetch buffer (pop-on-read RX_DATA_REG)
// ---------------------------------------------------------------
assign o_rx_fifo_rd_en = w_rx_prefetch || r_drain_active;

always @(posedge ACLK) begin
    if (!rst_n)
        r_rx_fifo_rd_en_d <= 1'b0;
    else
        r_rx_fifo_rd_en_d <= w_rx_prefetch;
end

always @(posedge ACLK) begin
    if (!rst_n) begin
        r_rx_data_buf     <= 8'd0;
        rx_data_buf_valid <= 1'b0;
    end else if (r_drain_active) begin
        rx_data_buf_valid <= 1'b0;                  // drain: discard, don't latch
    end else if (r_rx_fifo_rd_en_d) begin
        r_rx_data_buf     <= i_rx_fifo_rd_data;
        rx_data_buf_valid <= 1'b1;
    end else if (i_bus_rd_en && w_rx_addr_hit && rx_data_buf_valid) begin
        rx_data_buf_valid <= 1'b0;                  // consumed by software read
    end
end

// ---------------------------------------------------------------
// CONTROL_REG: FIFO_CLEAR / OVERFLOW_CLEAR (write strobes),
//              IRQ_ENABLE (persistent, stored)
// ---------------------------------------------------------------
always @(posedge ACLK) begin
    if (!rst_n)
        irq_enable <= 1'b0;
    else if (w_control_wr_hit)
        irq_enable <= i_bus_wdata[2];
end

// Drain FSM: once triggered, keep popping the RX FIFO (discarding data)
// until it reports empty, then stop. A single flag is enough since the
// pop-and-check-empty loop is exactly what o_rx_fifo_rd_en/i_rx_fifo_empty
// already give us.
always @(posedge ACLK) begin
    if (!rst_n)
        r_drain_active <= 1'b0;
    else if (w_fifo_clear_strobe)
        r_drain_active <= 1'b1;
    else if (r_drain_active && i_rx_fifo_empty)
        r_drain_active <= 1'b0;
end

// OVERFLOW sticky flag: set by a synchronized overflow event from the
// SPI Slave (SCLK domain, already pulse_sync'd into ACLK), cleared by
// software strobe. If both happen the same cycle, the new overflow
// wins (set has priority), matching "sticky until explicitly cleared".
always @(posedge ACLK) begin
    if (!rst_n)
        r_overflow_sticky <= 1'b0;
    else if (i_rx_overflow_pulse_sync)
        r_overflow_sticky <= 1'b1;
    else if (w_ovfl_clear_strobe)
        r_overflow_sticky <= 1'b0;
end

// ---------------------------------------------------------------
// TX_DATA_REG: write pushes into the TX async_fifo write side.
// o_tx_fifo_wr_data is only updated on a TX_DATA_REG write (gated by
// w_tx_addr_hit) so that reading TX_DATA_REG back always returns the
// last value actually written there, not whatever else was on the
// bus during some other register's write.
// ---------------------------------------------------------------
always @(posedge ACLK) begin
    if (!rst_n) begin
        o_tx_fifo_wr_en   <= 1'b0;
        o_tx_fifo_wr_data <= 8'd0;
    end else begin
        o_tx_fifo_wr_en <= i_bus_wr_en && w_tx_addr_hit && !i_tx_fifo_full;
        if (i_bus_wr_en && w_tx_addr_hit)
            o_tx_fifo_wr_data <= i_bus_wdata;
    end
end

// ---------------------------------------------------------------
// Read mux (combinational)
// ---------------------------------------------------------------
wire [7:0] w_status_reg_val = {3'b000,                 // [7:5] reserved
                              r_overflow_sticky,        // [4] OVERFLOW
                              rx_data_buf_valid,        // [3] RX_VALID
                              i_spi_busy_sync,           // [2] SPI_BUSY
                              i_rx_fifo_full,             // [1] FULL
                              i_rx_fifo_empty};            // [0] EMPTY

wire [7:0] w_control_reg_val = {5'b00000, irq_enable, 1'b0, 1'b0};

always @(*) begin
    case (i_bus_addr)
        ADDR_RX_DATA:    o_bus_rdata = r_rx_data_buf;
        ADDR_STATUS:     o_bus_rdata = w_status_reg_val;
        ADDR_CONTROL:    o_bus_rdata = w_control_reg_val;
        ADDR_FIFO_LEVEL: o_bus_rdata = {3'b000, i_rx_fifo_level};
        ADDR_TX_DATA:    o_bus_rdata = o_tx_fifo_wr_data;   // last written value, RW readback
        default:         o_bus_rdata = 8'h00;
    endcase
end

assign o_overflow = r_overflow_sticky;
assign o_rx_valid = rx_data_buf_valid;

endmodule
