`timescale 1ns / 1ps

module spi_master #(
	
	parameter [7:0] IDLE_GAP = 8'd8 // SCLK cycles of o_cs_n = 1 between frames 
) (

// port list 

SCLK 			,
rst_n			,
o_cs_n 			,
o_mosi			,
i_miso			,
o_rx_captured		,
o_rx_captured_valid	,
o_busy			

);

// port declaration

input	 	SCLK 			; // SPI serial clock 
input	 	rst_n			; // SCLK-domain synchronized reset

output 		o_cs_n			; // chip select, active low 
output 		o_mosi			; // master -> slave data
input 		i_miso			; // slave -> master data 

output [7:0] 	o_rx_captured 		; // last byte recelved via i_miso (debug)
output 		o_rx_captured_valid 	; // 1-cycle pulse 

output 		o_busy 			;

// internal register 

reg 		o_cs_n			;
reg		o_mosi			;
reg    [7:0]	o_rx_captured		;
reg		o_rx_captured_valid	;

// FSM state encoding 

localparam [1:0] S_IDLE 	= 2'd0,
		 S_CS_SETUP	= 2'd1,
		 S_SHIFT 	= 2'd2,
		 S_DONE 	= 2'd3;

reg [1:0] state, next_state ;

reg [7:0] idle_cnt	; // counts IDLE_GAP cycle while o_cs_n is high
reg	  setup_cnt	; // 1-bit: counts the 2 CS-setup cycles
reg [2:0] bit_cnt	; // counts shifted bits 0..7
reg [7:0] r_shift_out	; // o_mosi shift register, MSB-first 
reg [7:0] r_shift_in	; // i_miso capture register, MSB-first 
reg [7:0] r_tx_byte	; // next byte to send (auto-incrementing pattern)

wire w_idle_gap_done = (idle_cnt == IDLE_GAP - 1'b1)		;
wire w_setup_done    = (setup_cnt == 1'b1)			;
wire w_byte_complete = (state == S_SHIFT) && (bit_cnt ==  3'd7)	;

// modeling 

// Process 1/3 -- state register 

always @(posedge SCLK) begin

	if (!rst_n)
		state <= S_IDLE		;
	else 
		state <= next_state 	;
end 

// Process 2/3 -- combinational next-state logic

always @(*) begin 
	
	next_state = state		;

	case (state) 
		S_IDLE:		if (w_idle_gap_done) next_state = S_CS_SETUP	;
		S_CS_SETUP:	if (w_setup_done)    next_state = S_SHIFT	;
		S_SHIFT:	if (w_byte_complete) next_state = S_DONE	;
		S_DONE:	 			     next_state = S_IDLE	;
		
		default: 			     next_state = S_IDLE	;
	endcase
end

// Process 3/3 -- datepath / output logic

// Inter-frame gap counter 

always @(posedge SCLK) begin
	
	if (!rst_n)
		idle_cnt  <= 8'd0		;
	else if (state == S_IDLE) 
		idle_cnt <= idle_cnt + 8'd1	;
	else
		idle_cnt <= 8'd0		;
end

// CS-setup counter (2 cycles: 0 -> 1 -> advance to SHIFT)

always @(posedge SCLK) begin 

	if (!rst_n)
		setup_cnt <= 1'b0		;
	else if (state == S_CS_SETUP)		
		setup_cnt <= 1'b1		;
	else
		setup_cnt <= 1'b0		;
end

// 8bit counter 

always @(posedge SCLK) begin 
	
	if (!rst_n)
		bit_cnt <= 3'd0			;
	else if (state == S_SHIFT)		
		bit_cnt <= bit_cnt + 3'd1	;
	else
		bit_cnt <= 3'd0			;
end

// Next TX byte source (default: free-running counter pattern --see
// the open-item node above)

always @(posedge SCLK) begin

	if (!rst_n)
		r_tx_byte <= 8'd0		;
	else if (state == S_DONE)
		r_tx_byte <= r_tx_byte + 8'd1	;
end

// o_cd_n: asserted low from S_CS_SETUP through the end of S_SHIFT

always @(posedge SCLK) begin 

	if (!rst_n) 
		o_cs_n <= 1'b1			;
	else if (state == S_IDLE && w_idle_gap_done)
		o_cs_n <= 1'b0			;
	else if (state == S_DONE)
		o_cs_n <= 1'b1			;
end

// o_mosi shift register: parallel-loaded when o_cs_n first asserts, then
// shifts left once per bit during S_SHIFT Single owning process

always @(posedge SCLK) begin

	if (!rst_n) 
		r_shift_out <= 8'd0		;
	else if (state == S_IDLE && w_idle_gap_done)
		r_shift_out <= r_tx_byte	; // parallel load for the frame
	else if (state == S_SHIFT)
		r_shift_out <= {r_shift_out[6:0], 1'b0} ; // shift left, MSB-first
end

// o_mosi updates on the SCLK FALLING edge -- mirrors the slave's i_miso
// handling, giving the receiving side a full half-cycle of setup time 
// before the next rising (sampling) edge

always @(negedge SCLK) begin 
	
	if (!rst_n) 
		o_mosi <= 1'b0			;
	else if (state == S_SHIFT)		;
		o_mosi <= r_shift_out[7]	;
end

// i_miso capture register: samples on SCLK rising edge (Mode 0 master
// behavior -- master samples on the same edge the slave shifts data 
// out from, since the slave updates i_miso on the falling edge)

always @(posedge SCLK) begin
	
	if (!rst_n) begin 
		r_shift_in 	    <= 8'd0	;
		o_rx_captured	    <= 8'd0	;
		o_rx_captured_valid <= 1'b0	;
	end else begin 
		o_rx_captured_valid <= 1'b0	; // default: pulse low
		if (state == S_SHIFT) begin 
			r_shift_in 		 <= {r_shift_in[6:0], i_miso}	;
		end else begin 
			o_rx_captured 		 <= r_shift_in 			;
			o_rx_captured_valid	 <= 1'b1			; // 1-cycle "byte received" pulse
		end
	end
end

assign o_busy = (state != S_IDLE);

endmodule 
