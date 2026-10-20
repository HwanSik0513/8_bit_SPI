`timescale 1ns / 1ps

// =============================================================================
// register_block.v
// SPI Register Block - ACLK Domain
//
// Register Map
// 0x00 : RX_DATA_REG
// 0x04 : STATUS_REG
// 0x08 : CONTROL_REG
// 0x0C : FIFO_LEVEL_REG
// 0x10 : TX_DATA_REG
// =============================================================================

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
    o_tx_clear_req              ,
    i_tx_clear_done_pulse_sync  ,
    i_spi_busy_sync             ,
    i_rx_overflow_pulse_sync    ,
    o_overflow                  ,
    o_rx_valid

);

// =============================================================================
// Port Declaration
// =============================================================================
input           ACLK                        ;
input           rst_n                       ;

input   [7:0]   i_bus_addr                  ;
input           i_bus_wr_en                 ;
input   [7:0]   i_bus_wdata                 ;
input           i_bus_rd_en                 ;
output  [7:0]   o_bus_rdata                 ;

output          o_rx_fifo_rd_en             ;
input   [7:0]   i_rx_fifo_rd_data           ;
input           i_rx_fifo_empty             ;
input           i_rx_fifo_full              ;
input   [4:0]   i_rx_fifo_level             ;

output          o_tx_fifo_wr_en             ;
output  [7:0]   o_tx_fifo_wr_data           ;
input           i_tx_fifo_full              ;

output          o_tx_clear_req              ;
input           i_tx_clear_done_pulse_sync  ;

input           i_spi_busy_sync             ;
input           i_rx_overflow_pulse_sync    ;

output          o_overflow                  ;
output          o_rx_valid                  ;

// =============================================================================
// Internal Register
// =============================================================================
reg     [7:0]   o_bus_rdata                 ;
reg             o_tx_clear_req              ;

reg     [7:0]   r_rx_data_buf               ;
reg             rx_data_buf_valid           ;
reg             r_rx_fifo_rd_en_d           ;
reg             irq_enable                  ;
reg             r_drain_active              ;
reg             r_overflow_sticky           ;
reg             r_tx_clear_busy             ;
reg     [7:0]   r_tx_last_accepted          ;

// =============================================================================
// Register Address
// =============================================================================
localparam [7:0] ADDR_RX_DATA       = 8'h00   ,
                 ADDR_STATUS        = 8'h04   ,
                 ADDR_CONTROL       = 8'h08   ,
                 ADDR_FIFO_LEVEL    = 8'h0C   ,
                 ADDR_TX_DATA       = 8'h10   ;

// =============================================================================
// Internal Wire
// =============================================================================
wire            w_rx_addr_hit               ;
wire            w_tx_addr_hit               ;
wire            w_control_wr_hit            ;
wire            w_fifo_clear_strobe         ;
wire            w_ovfl_clear_strobe         ;
wire            w_tx_accept                 ;
wire            w_tx_clear_start            ;
wire            w_rx_prefetch               ;

wire    [7:0]   w_status_reg_val            ;
wire    [7:0]   w_control_reg_val           ;

// =============================================================================
// Modeling
// =============================================================================

// -----------------------------------------------------------------------------
// Address Decode
// -----------------------------------------------------------------------------
assign w_rx_addr_hit       = (i_bus_addr == ADDR_RX_DATA)                      ;
assign w_tx_addr_hit       = (i_bus_addr == ADDR_TX_DATA)                      ;
assign w_control_wr_hit    = i_bus_wr_en && (i_bus_addr == ADDR_CONTROL)       ;
assign w_fifo_clear_strobe = w_control_wr_hit && i_bus_wdata[0]               ;
assign w_ovfl_clear_strobe = w_control_wr_hit && i_bus_wdata[1]               ;

assign w_tx_accept         = i_bus_wr_en && w_tx_addr_hit
                             && !i_tx_fifo_full && !r_tx_clear_busy           ;

assign w_tx_clear_start    = w_fifo_clear_strobe && !r_tx_clear_busy          ;

// -----------------------------------------------------------------------------
// RX FIFO Prefetch
// -----------------------------------------------------------------------------
assign w_rx_prefetch       = !rx_data_buf_valid && !i_rx_fifo_empty
                             && !r_drain_active && !r_rx_fifo_rd_en_d         ;

assign o_rx_fifo_rd_en     = w_rx_prefetch || r_drain_active                  ;

// -----------------------------------------------------------------------------
// RX FIFO Read Enable Delay
// -----------------------------------------------------------------------------
always @(posedge ACLK or negedge rst_n) begin
    if (!rst_n) begin
        r_rx_fifo_rd_en_d       <= 1'b0                ;
    end
    else begin
        r_rx_fifo_rd_en_d       <= w_rx_prefetch       ;
    end
end

// -----------------------------------------------------------------------------
// RX Data Buffer
// Priority : Drain > FIFO Data Latch > Software Read
// -----------------------------------------------------------------------------
always @(posedge ACLK or negedge rst_n) begin
    if (!rst_n) begin
        r_rx_data_buf          <= 8'd0                ;
        rx_data_buf_valid      <= 1'b0                ;
    end
    else if (r_drain_active) begin
        rx_data_buf_valid      <= 1'b0                ;
    end
    else if (r_rx_fifo_rd_en_d) begin
        r_rx_data_buf          <= i_rx_fifo_rd_data   ;
        rx_data_buf_valid      <= 1'b1                ;
    end
    else if (i_bus_rd_en && w_rx_addr_hit && rx_data_buf_valid) begin
        rx_data_buf_valid      <= 1'b0                ;
    end
end

// -----------------------------------------------------------------------------
// CONTROL_REG : IRQ Enable
// -----------------------------------------------------------------------------
always @(posedge ACLK or negedge rst_n) begin
    if (!rst_n) begin
        irq_enable             <= 1'b0                ;
    end
    else if (w_control_wr_hit) begin
        irq_enable             <= i_bus_wdata[2]      ;
    end
end

// -----------------------------------------------------------------------------
// RX FIFO Clear : Drain Control
// -----------------------------------------------------------------------------
always @(posedge ACLK or negedge rst_n) begin
    if (!rst_n) begin
        r_drain_active         <= 1'b0                ;
    end
    else if (w_fifo_clear_strobe) begin
        r_drain_active         <= 1'b1                ;
    end
    else if (r_drain_active && i_rx_fifo_empty) begin
        r_drain_active         <= 1'b0                ;
    end
end

// -----------------------------------------------------------------------------
// Overflow Sticky Flag
// -----------------------------------------------------------------------------
always @(posedge ACLK or negedge rst_n) begin
    if (!rst_n) begin
        r_overflow_sticky      <= 1'b0                ;
    end
    else if (i_rx_overflow_pulse_sync) begin
        r_overflow_sticky      <= 1'b1                ;
    end
    else if (w_ovfl_clear_strobe) begin
        r_overflow_sticky      <= 1'b0                ;
    end
end

// -----------------------------------------------------------------------------
// TX FIFO Write
// Combinational write enables same-cycle FIFO acceptance.
// -----------------------------------------------------------------------------
assign o_tx_fifo_wr_en      = w_tx_accept             ;
assign o_tx_fifo_wr_data    = i_bus_wdata             ;

// -----------------------------------------------------------------------------
// TX_DATA_REG : Last Accepted Data
// -----------------------------------------------------------------------------
always @(posedge ACLK or negedge rst_n) begin
    if (!rst_n) begin
        r_tx_last_accepted     <= 8'd0                ;
    end
    else if (w_tx_accept) begin
        r_tx_last_accepted     <= i_bus_wdata         ;
    end
end

// -----------------------------------------------------------------------------
// TX FIFO Clear Handshake
// -----------------------------------------------------------------------------
always @(posedge ACLK or negedge rst_n) begin
    if (!rst_n) begin
        o_tx_clear_req         <= 1'b0                ;
        r_tx_clear_busy        <= 1'b0                ;
    end
    else begin
        o_tx_clear_req         <= w_tx_clear_start    ;

        if (w_tx_clear_start) begin
            r_tx_clear_busy    <= 1'b1                ;
        end
        else if (i_tx_clear_done_pulse_sync) begin
            r_tx_clear_busy    <= 1'b0                ;
        end
    end
end

// -----------------------------------------------------------------------------
// STATUS_REG
// [5] TX_CLR_BUSY
// [4] OVERFLOW
// [3] RX_VALID
// [2] SPI_BUSY
// [1] RX_FULL
// [0] RX_EMPTY
// -----------------------------------------------------------------------------
assign w_status_reg_val     = {2'b00                   ,
                               r_tx_clear_busy         ,
                               r_overflow_sticky       ,
                               rx_data_buf_valid       ,
                               i_spi_busy_sync         ,
                               i_rx_fifo_full          ,
                               i_rx_fifo_empty}        ;

// -----------------------------------------------------------------------------
// CONTROL_REG
// [2] IRQ_ENABLE
// [1] OVERFLOW_CLEAR
// [0] FIFO_CLEAR
// -----------------------------------------------------------------------------
assign w_control_reg_val    = {5'b00000, irq_enable, 1'b0, 1'b0} ;

// -----------------------------------------------------------------------------
// Register Read MUX
// -----------------------------------------------------------------------------
always @(*) begin
    case (i_bus_addr)
        ADDR_RX_DATA    : o_bus_rdata = r_rx_data_buf          ;
        ADDR_STATUS     : o_bus_rdata = w_status_reg_val       ;
        ADDR_CONTROL    : o_bus_rdata = w_control_reg_val      ;
        ADDR_FIFO_LEVEL : o_bus_rdata = {3'b000, i_rx_fifo_level};
        ADDR_TX_DATA    : o_bus_rdata = r_tx_last_accepted     ;
        default         : o_bus_rdata = 8'h00                  ;
    endcase
end

// -----------------------------------------------------------------------------
// Status Output
// -----------------------------------------------------------------------------
assign o_overflow           = r_overflow_sticky       ;
assign o_rx_valid           = rx_data_buf_valid      ;

endmodule
