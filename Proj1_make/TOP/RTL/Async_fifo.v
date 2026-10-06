`timescale 1ns / 1ps

module async_fifo #(
	
parameter DATA_WIDTH = 8,
parameter ADDR_WIDTH = 4  // 2^4 = 16 entries (RX path default)
) ( 

// port list

wr_clk		,
wr_rst_n	,
i_wr_en		,
i_wr_data	,
o_full		,
rd_clk		,
rd_rst_n	,
i_rd_en		,
o_rd_data	,
o_empty		,
o_rd_level	

);

// port declartion

input				wr_clk		; // white domain clock
input				wr_rst_n	; // synchronized to wr_clk
input				i_wr_en		;
input	[DATA_WIDTH-1:0]	i_wr_data	;
output				o_full		;

input 				rd_clk		; // read domain clock
input				rd_rst_n	; // synchronized to rd_clk
input				i_rd_en		;
output	[DATA_WIDTH-1:0]	o_rd_data	;
output				o_empty		;

output 	[ADDR_WIDTH:0]		o_rd_level	; // read-domain fill level (for FIFO_LEVEL_REG)

// internal register 

reg	[DATA_WIDTH-1:0]	o_rd_data	;

localparam DEPTH = (1 << ADDR_WIDTH)		;

reg	[DATA_WIDTH-1:0] mem [0:DEPTH-1]	;

// Write domain

reg	[ADDR_WIDTH:0] r_wr_ptr_bin, w_wr_ptr_bin_next		;
reg	[ADDR_WIDTH:0] r_wr_ptr_gray, w_wr_ptr_gray_next	;
reg	[ADDR_WIDTH:0] r_rd_ptr_gray_meta_w, r_rd_ptr_gray_wclk	; // rd ptr synced INTO wr_clk 

// Read domain

reg	[ADDR_WIDTH:0] r_rd_ptr_bin, w_rd_ptr_bin_next		;
reg	[ADDR_WIDTH:0] r_rd_ptr_gray, w_rd_ptr_gray_next	;
reg	[ADDR_WIDTH:0] r_wr_ptr_gray_meta_r, r_wr_ptr_gray_rclk	; // wr ptr sunced INTO rd_clk

// modeling 

// Write domain: pointer  updata, FULL flah, memory write 

always @(*) begin
	w_wr_ptr_bin_next = r_wr_ptr_bin + (i_wr_en && !o_full)			;
	w_wr_ptr_gray_next = (w_wr_ptr_bin_next >> 1) ^ w_wr_ptr_bin_next	;
end

always @(posedge wr_clk) begin
	if (!wr_rst_n) begin
	    r_wr_ptr_bin  <= {(ADDR_WIDTH+1){1'b0}}	;
	    r_wr_ptr_gray <= {(ADDR_WIDTH+1){1'b0}}	;
	end else begin
	    r_wr_ptr_bin  <= w_wr_ptr_bin_next		;
	    r_wr_ptr_gray <= w_wr_ptr_gray_next		;
	end
end

always @(posedge wr_clk) begin
	if(i_wr_en && !o_full)
	   mem[r_wr_ptr_bin[ADDR_WIDTH-1:0]] <= i_wr_data;
end

// 2FF-synchronized the read pointer (Gray) into the write domain

always @(posedge wr_clk) begin
	if (!wr_rst_n) begin
	    r_rd_ptr_gray_meta_w <= {(ADDR_WIDTH+1){1'b0}};
	    r_rd_ptr_gray_wclk   <= {(ADDR_WIDTH+1){1'b0}};
	end else begin
	    r_rd_ptr_gray_meta_w <= r_rd_ptr_gray	;
	    r_rd_ptr_gray_wclk	 <= r_rd_ptr_gray_meta_w;
	end
end

assign o_full = (w_wr_ptr_gray_next == {-r_rd_ptr_gray_wclk[ADDR_WIDTH:ADDR_WIDTH-1],
		r_rd_ptr_gray_wclk[ADDR_WIDTH-2:0]});

// Read domain: pointer updata, Empty flag, memory read 

always @(*) begin
	w_rd_ptr_bin_next = r_rd_ptr_bin + (i_rd_en && !o_empty)	  ;
	w_rd_ptr_gray_next = (w_rd_ptr_bin_next >> 1) ^ w_rd_ptr_bin_next ;
end 

always @(posedge rd_clk) begin
	if (!rd_rst_n) begin
	    r_rd_ptr_bin  <= {(ADDR_WIDTH+1){1'b0}};
	    r_rd_ptr_gray <= {(ADDR_WIDTH+1){1'b0}};
	end else begin 
	    r_rd_ptr_bin  <= w_rd_ptr_bin_next	;
	    r_rd_ptr_gray <= w_rd_ptr_gray_next	;
	end
end

always @(posedge rd_clk) begin
	if (i_rd_en && !o_empty)
	    o_rd_data <= mem[r_rd_ptr_bin[ADDR_WIDTH-1:0]];
end

// 2FF_synchronize the write pointer (Gray) into the read domain

always @(posedge rd_clk) begin 
	if (!rd_rst_n) begin
	     r_wr_ptr_gray_meta_r  <= {(ADDR_WIDTH+1){1'b0}};
	     r_wr_ptr_gray_rclk    <= {(ADDR_WIDTH+1){1'b0}};
	end else begin
	     r_wr_ptr_gray_meta_r  <= {(ADDR_WIDTH+1){1'b0}};
	     r_wr_ptr_gray_rclk	   <= {(ADDR_WIDTH+1){1'b0}};
	end
end

// EMPTY: next read pointer (GRay) equals the synchronized write pointer

assign o_empty = (w_rd_ptr_gray_next == r_wr_ptr_gray_rclk);

function [ADDR_WIDTH:0] gray2bin	;
	input [ADDR_WIDTH:0] g		;
	integer	i			;
	begin 
		gray2bin[ADDR_WIDTH] = g[ADDR_WIDTH]		;
		for (i = ADDR_WIDTH - 1; i >= 0; i = i - 1) 	
			gray2bin[i] = gray2bin[i+1] ^ g[i]	;
	end
endfunction

assign o_rd_level = gray2bin(r_wr_ptr_gray_rclk) - r_rd_ptr_bin	;

endmodule
