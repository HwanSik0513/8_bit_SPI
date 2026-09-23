`timescale 1ns / 1ps

// =============================================================================
// spi_slave.v                                                  [SCLK domain]
//
// PURPOSE
//   SPI Mode 0 slave, 8-bit, MSB-first. Implements the state machine from
//   spec figure 2 (IDLE / LOAD / RECEIVE / BYTE_DONE), including the abort
//   path (i_cs_n deasserted mid-byte) and the FIFO-full drop path.
//
// PROTOCOL
//   - i_mosi is sampled on the SCLK RISING edge (this entire module runs on
//     SCLK, so that sampling is simply "synchronous input").
//   - o_miso is updated on the SCLK FALLING edge. This needs its own
//     `always @(negedge SCLK)` block: it is not a second clock domain, just
//     the opposite edge of the same SCLK net, which SPI Mode 0 requires so
//     that o_miso is stable well before the master's next sampling edge.
//
// INTERFACES
//   - RX side: pushes completed bytes into the RX async_fifo (write side).
//   - TX side: pulls the next o_miso byte from the TX async_fifo (read side);
//     see spi_bridge_top.v for how TX_DATA_REG writes reach this FIFO.
// =============================================================================
module spi_slave (
    // port list
    SCLK                ,
    rst_n               ,
    i_cs_n              ,
    i_mosi              ,
    o_miso              ,
    o_rx_wr_en          ,
    o_rx_wr_data        ,
    i_rx_fifo_full      ,
    o_rx_overflow_pulse ,
    o_tx_fifo_rd_en     ,
    i_tx_fifo_rd_data   ,
    i_tx_fifo_empty     ,
    o_spi_busy
);

// port declaration
input           SCLK                ; // SPI serial clock
input           rst_n               ; // SCLK-domain synchronized reset

input           i_cs_n              ; // chip select, active low
input           i_mosi              ; // master -> slave data
output          o_miso              ; // slave -> master data

output          o_rx_wr_en          ; // RX FIFO write side (SCLK domain)
output  [7:0]   o_rx_wr_data        ;
input           i_rx_fifo_full      ;
output          o_rx_overflow_pulse ; // 1-cycle pulse: byte was dropped

output          o_tx_fifo_rd_en     ; // TX FIFO read side (SCLK domain)
input   [7:0]   i_tx_fifo_rd_data   ;
input           i_tx_fifo_empty     ;

output          o_spi_busy          ;

// internal register
reg             o_miso ;

// ---------------------------------------------------------------
// FSM state encoding
// ---------------------------------------------------------------
localparam [1:0] S_IDLE      = 2'd0,
                  S_LOAD      = 2'd1,
                  S_RECEIVE   = 2'd2,
                  S_BYTE_DONE = 2'd3;

reg [1:0] state, next_state;

// Datapath registers
reg [2:0] bit_cnt;          // counts sampled bits 0..7
reg [7:0] r_shift_rx;         // accumulates i_mosi, MSB-first
reg [7:0] r_shift_tx;         // shifts out on o_miso, MSB-first
reg [7:0] r_tx_byte_latched;  // most recently available TX byte

wire w_entering_receive = (next_state == S_RECEIVE) && (state != S_RECEIVE);
wire w_byte_complete    = (state == S_RECEIVE) && (bit_cnt == 3'd7);

// modeling

// =====================================================================
// Process 1/3 -- state register
// =====================================================================
always @(posedge SCLK) begin
    if (!rst_n)
        state <= S_IDLE;
    else
        state <= next_state;
end

// =====================================================================
// Process 2/3 -- combinational next-state logic
// =====================================================================
always @(*) begin
    next_state = state;  // safe default: hold state
    case (state)
        S_IDLE: begin
            if (!i_cs_n)
                next_state = S_LOAD;          // frame start
        end

        S_LOAD: begin
            next_state = S_RECEIVE;           // always advances after 1 cycle
        end

        S_RECEIVE: begin
            if (i_cs_n)
                next_state = S_IDLE;          // abort: i_cs_n deasserted mid-byte
            else if (w_byte_complete)
                next_state = S_BYTE_DONE;
            else
                next_state = S_RECEIVE;
        end

        S_BYTE_DONE: begin
            if (i_cs_n)
                next_state = S_IDLE;          // frame end
            else
                next_state = S_RECEIVE;       // next byte, same frame
        end

        default: next_state = S_IDLE;         // recovery from an illegal state
    endcase
end

// =====================================================================
// Process 3/3 -- datapath / output logic (registers clocked by SCLK)
// =====================================================================

// bit counter + RX shift register
always @(posedge SCLK) begin
    if (!rst_n) begin
        bit_cnt   <= 3'd0;
        r_shift_rx  <= 8'd0;
    end else if (w_entering_receive) begin
        bit_cnt   <= 3'd0;                    // new byte starting
    end else if (state == S_RECEIVE) begin
        bit_cnt   <= bit_cnt + 3'd1;
        r_shift_rx  <= {r_shift_rx[6:0], i_mosi};   // MSB-first sample on SCLK rise
    end
end

// TX byte cache: opportunistically pull a fresh byte from the TX FIFO
// whenever one is available and we are not in the middle of shifting a
// byte out, so r_tx_byte_latched always holds the newest TX data without
// disturbing an in-flight transfer.
wire w_tx_pop = !i_tx_fifo_empty && (state != S_RECEIVE);
assign o_tx_fifo_rd_en = w_tx_pop;

reg r_tx_pop_d;
always @(posedge SCLK) begin
    if (!rst_n) begin
        r_tx_pop_d        <= 1'b0;
        r_tx_byte_latched <= 8'd0;
    end else begin
        r_tx_pop_d <= w_tx_pop;
        if (r_tx_pop_d)
            r_tx_byte_latched <= i_tx_fifo_rd_data;  // FIFO read data valid 1 cycle after rd_en
    end
end

// TX shift register: loaded with a fresh byte at the start of every
// byte, then shifts left once per bit during RECEIVE. Single owning
// process (load and shift share one always block -- see rule against
// multiple drivers of the same register).
always @(posedge SCLK) begin
    if (!rst_n)
        r_shift_tx <= 8'd0;
    else if (w_entering_receive)
        r_shift_tx <= r_tx_byte_latched;
    else if (state == S_RECEIVE)
        r_shift_tx <= {r_shift_tx[6:0], 1'b0};
end

// o_miso updates on the SCLK FALLING edge (SPI Mode 0 requirement).
// It simply mirrors the current MSB of r_shift_tx; r_shift_tx itself is
// advanced on the rising edge above, so the new MSB is ready in time.
always @(negedge SCLK) begin
    if (!rst_n)
        o_miso <= 1'b0;
    else if (state == S_RECEIVE)
        o_miso <= r_shift_tx[7];
end

// RX FIFO write: one combinational pulse during the BYTE_DONE cycle.
// If the FIFO is full the byte is dropped and OVERFLOW is pulsed
// instead -- the state machine still advances normally either way.
assign o_rx_wr_en           = (state == S_BYTE_DONE) && !i_rx_fifo_full;
assign o_rx_wr_data         = r_shift_rx;
assign o_rx_overflow_pulse  = (state == S_BYTE_DONE) && i_rx_fifo_full;

assign o_spi_busy = (state != S_IDLE);

endmodule
