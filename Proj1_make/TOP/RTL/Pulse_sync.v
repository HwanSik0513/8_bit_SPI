`timescale 1ns / 1ps 

module pulse_sync (

// port list

src_clk		,
src_rst_n	,
i_src_pulse	,
dst_clk		,
dst_rst_n	,
o_dst_pulse

);

// port declaration

input	src_clk		; // source domain clock
input	src_rst_n	; // already synchronized to src_clk
input	i_src_pulse	; // one src_clk-wide pulse to transfer

input	dst_clk		; // destination domain	clock
input	dst_rst_n	; // already synchronized to dst_clk 
output	o_dst_pulse	; // one dst_clk-wide pulse, once per i_src_pulse

// internal register 

reg	r_src_toggle	;
reg	r_dst_meta	;
reg	r_dst_sync	;
reg	r_dst_sync_d	;

// modeling  

// ---- Source domain: toggle flop ----
 
always @(posedge src_clk or negedge src_rst_n) begin
	if (!src_rst_n) begin
	    r_src_toggle <= 1'b0		;
	end
	
	else if (i_src_pulse) begin
	    r_src_toggle <= ~r_src_toggle	;
	end

end

// ---- Destination domain: 2FF synchronizer + edge detect ----

always @(posedge dst_clk or negedge dst_rst_n) begin
	if (!dst_rst_n) begin 
	    r_dst_meta 	 <= 1'b0		;
	    r_dst_sync   <= 1'b0		;
	    r_dst_sync_d <= 1'b0		;
	end else begin
	    r_dst_meta   <= r_src_toggle	;
	    r_dst_sync	 <= r_dst_meta		;
	    r_dst_sync_d <= r_dst_sync		;
	end
end

assign o_dst_pulse = r_dst_sync ^ r_dst_sync_d	;

endmodule
	
