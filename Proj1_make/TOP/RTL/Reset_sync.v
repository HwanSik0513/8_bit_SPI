`timescale 1ns / 1ps

module Reset_sync (

// port list

clk		,
arst_n		,
rst_n_sync	

);

// port declaration

input	clk		; // local domain clock (SCLK or ACLK)
input	arst_n		; // global asynchronous active-low reset (ARESETn)
output	rst_n_sync	; // local domain reset, async assert / sync deassert

// internal register

reg	rst_n_sync	;
reg	r_meta_ff	;

// modeling

always @(posedge clk or negedge arst_n) begin
	
	if (!arst_n) begin
	   // Asynchronous assert: both stages clear immediately
	   r_meta_ff	<= 1'b0		;
	   rst_n_sync   <= 1'b0		;
	end else begin
	   // Synchronous release: 2-flop cascade
	   r_meta_ff	<= 1'b1		;
	   rst_n_sync 	<= r_meta_ff	;
	end
end

endmodule
