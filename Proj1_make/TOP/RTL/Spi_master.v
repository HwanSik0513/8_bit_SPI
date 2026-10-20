`timescale 1ns / 1ps

// =============================================================================
// spi_master.v
// SPI Master : SCLK Domain
//
// SPI Mode 0 (CPOL = 0, CPHA = 0)
// Data Width : 8-bit
// Bit Order  : MSB First
//
// MOSI changes on falling edge.
// MISO is sampled on rising edge.
// One byte per CS_N frame.
// =============================================================================

module spi_master #(

    parameter [7:0] IDLE_GAP = 8'd8

) (

    // port list
    SCLK                    ,
    rst_n                   ,
    o_cs_n                  ,
    o_mosi                  ,
    i_miso                  ,
    o_rx_captured           ,
    o_rx_captured_valid     ,
    o_busy

);

// =============================================================================
// Port Declaration
// =============================================================================
input           SCLK                    ; // SPI Serial Clock
input           rst_n                   ; // Active-Low Reset

output          o_cs_n                  ; // Chip Select
output          o_mosi                  ; // Master Output
input           i_miso                  ; // Master Input

output  [7:0]   o_rx_captured           ; // Received Data
output          o_rx_captured_valid     ; // RX Valid Pulse
output          o_busy                  ; // SPI Busy Status

// =============================================================================
// Internal Register
// =============================================================================
reg             o_cs_n                  ;
reg             o_mosi                  ;
reg     [7:0]   o_rx_captured           ;
reg             o_rx_captured_valid     ;

// FSM State Encoding
localparam [1:0] S_IDLE     = 2'd0       ,
                 S_CS_SETUP = 2'd1       ,
                 S_SHIFT    = 2'd2       ,
                 S_DONE     = 2'd3       ;

reg     [1:0]   state                   ;
reg     [1:0]   next_state              ;

// Counter
reg     [7:0]   idle_cnt                ;
reg             setup_cnt               ;
reg     [2:0]   bit_cnt                 ;

// Shift Register
reg     [7:0]   r_shift_out             ;
reg     [7:0]   r_shift_in              ;
reg     [7:0]   r_tx_byte               ;

// Internal Wire
wire            w_idle_gap_done         ;
wire            w_setup_done            ;
wire            w_byte_complete         ;

// =============================================================================
// Modeling
// =============================================================================

// -----------------------------------------------------------------------------
// State Condition
// -----------------------------------------------------------------------------
assign w_idle_gap_done = (idle_cnt == IDLE_GAP - 8'd1)              ;
assign w_setup_done    = (setup_cnt == 1'b1)                        ;
assign w_byte_complete = (state == S_SHIFT) && (bit_cnt == 3'd7)    ;

// -----------------------------------------------------------------------------
// Process 1 : State Register
// -----------------------------------------------------------------------------
always @(posedge SCLK or negedge rst_n) begin
    if (!rst_n) begin
        state                  <= S_IDLE              ;
    end
    else begin
        state                  <= next_state          ;
    end
end

// -----------------------------------------------------------------------------
// Process 2 : Next State Logic
// -----------------------------------------------------------------------------
always @(*) begin
    next_state = state;

    case (state)
        S_IDLE: begin
            if (w_idle_gap_done) begin
                next_state     = S_CS_SETUP           ;
            end
        end

        S_CS_SETUP: begin
            if (w_setup_done) begin
                next_state     = S_SHIFT              ;
            end
        end

        S_SHIFT: begin
            if (w_byte_complete) begin
                next_state     = S_DONE               ;
            end
        end

        S_DONE: begin
            next_state         = S_IDLE               ;
        end

        default: begin
            next_state         = S_IDLE               ;
        end
    endcase
end

// -----------------------------------------------------------------------------
// Process 3 : Datapath / Output Logic
// -----------------------------------------------------------------------------

// =============================================================================
// Inter-Frame Gap Counter
// =============================================================================
always @(posedge SCLK or negedge rst_n) begin
    if (!rst_n) begin
        idle_cnt               <= 8'd0                ;
    end
    else if (state == S_IDLE) begin
        idle_cnt               <= idle_cnt + 8'd1     ;
    end
    else begin
        idle_cnt               <= 8'd0                ;
    end
end

// =============================================================================
// CS Setup Counter
// =============================================================================
always @(posedge SCLK or negedge rst_n) begin
    if (!rst_n) begin
        setup_cnt              <= 1'b0                ;
    end
    else if (state == S_CS_SETUP) begin
        setup_cnt              <= 1'b1                ;
    end
    else begin
        setup_cnt              <= 1'b0                ;
    end
end

// =============================================================================
// Bit Counter
// =============================================================================
always @(posedge SCLK or negedge rst_n) begin
    if (!rst_n) begin
        bit_cnt                <= 3'd0                ;
    end
    else if (state == S_SHIFT) begin
        bit_cnt                <= bit_cnt + 3'd1      ;
    end
    else begin
        bit_cnt                <= 3'd0                ;
    end
end

// =============================================================================
// TX Data Pattern Generator
// =============================================================================
always @(posedge SCLK or negedge rst_n) begin
    if (!rst_n) begin
        r_tx_byte              <= 8'd0                ;
    end
    else if (state == S_DONE) begin
        r_tx_byte              <= r_tx_byte + 8'd1    ;
    end
end

// =============================================================================
// Chip Select Control
// =============================================================================
always @(posedge SCLK or negedge rst_n) begin
    if (!rst_n) begin
        o_cs_n                 <= 1'b1                ;
    end
    else if (state == S_IDLE && w_idle_gap_done) begin
        o_cs_n                 <= 1'b0                ;
    end
    else if (state == S_DONE) begin
        o_cs_n                 <= 1'b1                ;
    end
end

// =============================================================================
// MOSI Shift Register
// =============================================================================
always @(posedge SCLK or negedge rst_n) begin
    if (!rst_n) begin
        r_shift_out            <= 8'd0                ;
    end
    else if (state == S_IDLE && w_idle_gap_done) begin
        r_shift_out            <= r_tx_byte           ;
    end
    else if (state == S_SHIFT) begin
        r_shift_out            <= {r_shift_out[6:0], 1'b0};
    end
end

// =============================================================================
// MOSI Output : Falling Edge
// =============================================================================
always @(negedge SCLK or negedge rst_n) begin
    if (!rst_n) begin
        o_mosi                 <= 1'b0                ;
    end
    else if (state == S_SHIFT) begin
        o_mosi                 <= r_shift_out[7]      ;
    end
end

// =============================================================================
// MISO Capture : Rising Edge
// =============================================================================
always @(posedge SCLK or negedge rst_n) begin
    if (!rst_n) begin
        r_shift_in             <= 8'd0                ;
        o_rx_captured          <= 8'd0                ;
        o_rx_captured_valid    <= 1'b0                ;
    end
    else begin
        o_rx_captured_valid    <= 1'b0                ;

        if (state == S_SHIFT) begin
            r_shift_in         <= {r_shift_in[6:0], i_miso};
        end
        else if (state == S_DONE) begin
            o_rx_captured      <= r_shift_in          ;
            o_rx_captured_valid <= 1'b1               ;
        end
    end
end

// =============================================================================
// Busy Status
// =============================================================================
assign o_busy = (state != S_IDLE)                     ;

endmodule
