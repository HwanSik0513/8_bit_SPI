`timescale 1ns / 1ps

// =============================================================================
// spi_slave.v
// SPI Mode 0 Slave : SCLK Domain
//
// CPOL = 0, CPHA = 0
// Data Width : 8-bit
// Bit Order  : MSB First
//
// RX : MOSI sampled on rising edge
// TX : MISO updated on falling edge
//
// TX FIFO : One-byte prefetch holding register
// Underflow : 8'h00
// FIFO_CLEAR : TX FIFO drain and holding register flush
// =============================================================================

module spi_slave (

    // port list
    SCLK                    ,
    rst_n                   ,
    i_cs_n                  ,
    i_mosi                  ,
    o_miso                  ,
    o_rx_wr_en              ,
    o_rx_wr_data            ,
    i_rx_fifo_full          ,
    o_rx_overflow_pulse     ,
    o_tx_fifo_rd_en         ,
    i_tx_fifo_rd_data       ,
    i_tx_fifo_empty         ,
    i_tx_clear_pulse        ,
    o_tx_clear_done         ,
    o_spi_busy

);

// port declaration
input           SCLK                    ;
input           rst_n                   ;
input           i_cs_n                  ;
input           i_mosi                  ;
output          o_miso                  ;

output          o_rx_wr_en              ;
output  [7:0]   o_rx_wr_data            ;
input           i_rx_fifo_full          ;
output          o_rx_overflow_pulse     ;

output          o_tx_fifo_rd_en         ;
input   [7:0]   i_tx_fifo_rd_data       ;
input           i_tx_fifo_empty         ;
input           i_tx_clear_pulse        ;
output          o_tx_clear_done         ;
output          o_spi_busy              ;

// internal register
reg             o_miso                  ;
reg             o_tx_clear_done         ;

// FSM state encoding
localparam [1:0] S_IDLE      = 2'd0      ,
                 S_LOAD      = 2'd1      ,
                 S_RECEIVE   = 2'd2      ,
                 S_BYTE_DONE = 2'd3      ;

reg     [1:0]   state                   ;
reg     [1:0]   next_state              ;

// RX / TX datapath
reg     [2:0]   bit_cnt                 ;
reg     [7:0]   r_shift_rx              ;
reg     [7:0]   r_shift_tx              ;

// TX holding register
reg     [7:0]   r_tx_hold               ;
reg             r_tx_hold_valid         ;
reg             r_tx_pop_d              ;
reg             r_tx_cur_from_hold      ;

// TX FIFO clear
reg             r_clr_active            ;
reg     [2:0]   r_clr_settle            ;

localparam [2:0] CLR_SETTLE = 3'd4       ;

// internal wire
wire            w_entering_receive      ;
wire            w_byte_complete         ;
wire            w_tx_consume            ;
wire            w_clr_end               ;
wire            w_tx_pop                ;

// modeling

// =============================================================================
// State Conditions
// =============================================================================
assign w_entering_receive = (next_state == S_RECEIVE) &&
                            (state != S_RECEIVE)                  ;

assign w_byte_complete    = (state == S_RECEIVE) &&
                            (bit_cnt == 3'd7)                     ;

// =============================================================================
// Process 1 : State Register
// =============================================================================
always @(posedge SCLK or negedge rst_n) begin
    if (!rst_n) begin
        state                  <= S_IDLE              ;
    end
    else begin
        state                  <= next_state          ;
    end
end

// =============================================================================
// Process 2 : Next State Logic
// =============================================================================
always @(*) begin
    next_state = state;

    case (state)
        S_IDLE: begin
            if (!i_cs_n) begin
                next_state     = S_LOAD               ;
            end
        end

        S_LOAD: begin
            next_state         = S_RECEIVE            ;
        end

        S_RECEIVE: begin
            if (i_cs_n) begin
                next_state     = S_IDLE               ;
            end
            else if (w_byte_complete) begin
                next_state     = S_BYTE_DONE          ;
            end
            else begin
                next_state     = S_RECEIVE            ;
            end
        end

        S_BYTE_DONE: begin
            if (i_cs_n) begin
                next_state     = S_IDLE               ;
            end
            else begin
                next_state     = S_RECEIVE            ;
            end
        end

        default: begin
            next_state         = S_IDLE               ;
        end
    endcase
end

// =============================================================================
// RX Bit Counter + Shift Register
// =============================================================================
always @(posedge SCLK or negedge rst_n) begin
    if (!rst_n) begin
        bit_cnt                <= 3'd0                ;
        r_shift_rx             <= 8'd0                ;
    end
    else if (w_entering_receive) begin
        bit_cnt                <= 3'd0                ;
    end
    else if (state == S_RECEIVE) begin
        bit_cnt                <= bit_cnt + 3'd1      ;
        r_shift_rx             <= {r_shift_rx[6:0], i_mosi};
    end
end

// =============================================================================
// TX FIFO Prefetch / Consume / Clear Conditions
// =============================================================================
assign w_tx_consume = (state == S_RECEIVE) &&
                      (bit_cnt == 3'd0) &&
                      !i_cs_n &&
                      r_tx_cur_from_hold                          ;

assign w_clr_end    = r_clr_active &&
                      (r_clr_settle == 3'd0) &&
                      i_tx_fifo_empty &&
                      !r_tx_pop_d                                  ;

assign w_tx_pop     = !i_tx_fifo_empty &&
                      (r_clr_active ||
                      (!r_tx_hold_valid && !r_tx_pop_d))            ;

assign o_tx_fifo_rd_en = w_tx_pop                                  ;

// =============================================================================
// TX Holding Register + FIFO_CLEAR Control
// =============================================================================
always @(posedge SCLK or negedge rst_n) begin
    if (!rst_n) begin
        r_tx_pop_d             <= 1'b0                ;
        r_tx_hold              <= 8'd0                ;
        r_tx_hold_valid        <= 1'b0                ;
        r_clr_active           <= 1'b0                ;
        r_clr_settle           <= 3'd0                ;
        r_tx_cur_from_hold     <= 1'b0                ;
        o_tx_clear_done        <= 1'b0                ;
    end
    else begin
        r_tx_pop_d             <= w_tx_pop            ;
        o_tx_clear_done        <= w_clr_end           ;

        // Clear request / completion
        if (i_tx_clear_pulse) begin
            r_clr_active       <= 1'b1                ;
            r_clr_settle       <= CLR_SETTLE          ;
        end
        else if (w_clr_end) begin
            r_clr_active       <= 1'b0                ;
        end
        else if (r_clr_active && (r_clr_settle != 3'd0)) begin
            r_clr_settle       <= r_clr_settle - 3'd1 ;
        end

        // Holding register
        if (r_clr_active || i_tx_clear_pulse) begin
            r_tx_hold_valid    <= 1'b0                ;
        end
        else if (r_tx_pop_d) begin
            r_tx_hold          <= i_tx_fifo_rd_data   ;
            r_tx_hold_valid    <= 1'b1                ;
        end
        else if (w_tx_consume) begin
            r_tx_hold_valid    <= 1'b0                ;
        end

        // Track whether current TX byte came from holding register
        if (w_entering_receive) begin
            r_tx_cur_from_hold <= r_tx_hold_valid &&
                                  !r_clr_active &&
                                  !i_tx_clear_pulse   ;
        end
        else if (w_tx_consume) begin
            r_tx_cur_from_hold <= 1'b0                ;
        end
    end
end

// =============================================================================
// TX Shift Register
// =============================================================================
always @(posedge SCLK or negedge rst_n) begin
    if (!rst_n) begin
        r_shift_tx             <= 8'd0                ;
    end
    else if (w_entering_receive) begin
        r_shift_tx             <= r_tx_hold_valid ? r_tx_hold : 8'h00;
    end
    else if (state == S_RECEIVE) begin
        r_shift_tx             <= {r_shift_tx[6:0], 1'b0};
    end
end

// =============================================================================
// MISO Output : Falling Edge (SPI Mode 0)
// =============================================================================
always @(negedge SCLK or negedge rst_n) begin
    if (!rst_n) begin
        o_miso                 <= 1'b0                ;
    end
    else if (state == S_RECEIVE) begin
        o_miso                 <= r_shift_tx[7]       ;
    end
end

// =============================================================================
// RX FIFO Write / Overflow
// =============================================================================
assign o_rx_wr_en          = (state == S_BYTE_DONE) &&
                             !i_rx_fifo_full                    ;

assign o_rx_wr_data        = r_shift_rx                       ;

assign o_rx_overflow_pulse = (state == S_BYTE_DONE) &&
                             i_rx_fifo_full                     ;

// =============================================================================
// SPI Busy Status
// =============================================================================
assign o_spi_busy          = (state != S_IDLE)                ;

endmodule
