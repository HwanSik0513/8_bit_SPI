`timescale 1ns / 1ps 

module sclk_gen (

// port list

clk	,
rst_n	,
o_sclk	

);

// port declaration 

input 	clk	; // ACLK (100MHz)
input   rst_n	; // ACLK-domain sunchronized reset, active-low
output	o_sclk	; // free-running ~25 MHz divided clock (route via BUFG)

// internal register

reg	o_sclk		;
reg	r_toggle_phase	;

// modeling

// Toggling every ACLK cycle gives ACLK/2; toggling every 2 ACLK cycles
// gives ACLK/4 = 25 MHz from a 100 MHz ACLK

always @(posedge clk) begin
	if (!rst_n) begin
	    r_toggle_phase <= 1'b0;
	    o_sclk	   <= 1'b0;
	end else begin
	    r_toggle_phase <= ~r_toggle_phase;
	    if (r_toggle_phase) 
		o_sclk <= ~o_sclk;
	end
end

endmodule


