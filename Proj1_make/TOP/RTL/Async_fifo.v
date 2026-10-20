`timescale 1ns / 1ps

// =============================================================================
// async_fifo.v
// Dual-Clock Asynchronous FIFO
// Gray Pointer + 2-FF Synchronizer
// =============================================================================

module async_fifo #(

    parameter DATA_WIDTH = 8 ,
    parameter ADDR_WIDTH = 4

) (

    // port list
    wr_clk          ,
    wr_rst_n        ,
    i_wr_en         ,
    i_wr_data       ,
    o_full          ,
    rd_clk          ,
    rd_rst_n        ,
    i_rd_en         ,
    o_rd_data       ,
    o_empty         ,
    o_rd_level

);

// port declaration
input                       wr_clk          ;
input                       wr_rst_n        ;
input                       i_wr_en         ;
input   [DATA_WIDTH-1:0]    i_wr_data       ;
output                      o_full          ;

input                       rd_clk          ;
input                       rd_rst_n        ;
input                       i_rd_en         ;
output  [DATA_WIDTH-1:0]    o_rd_data       ;
output                      o_empty         ;
output  [ADDR_WIDTH:0]      o_rd_level      ;

// internal register
reg     [DATA_WIDTH-1:0]    o_rd_data       ;
reg                         o_full          ;
reg                         o_empty         ;

localparam DEPTH = (1 << ADDR_WIDTH);

reg     [DATA_WIDTH-1:0]    mem [0:DEPTH-1]  ;

// Write Domain
reg     [ADDR_WIDTH:0]      r_wr_ptr_bin        ;
reg     [ADDR_WIDTH:0]      r_wr_ptr_gray       ;
reg     [ADDR_WIDTH:0]      r_rd_ptr_gray_meta_w;
reg     [ADDR_WIDTH:0]      r_rd_ptr_gray_wclk  ;

reg     [ADDR_WIDTH:0]      w_wr_ptr_bin_next   ;
reg     [ADDR_WIDTH:0]      w_wr_ptr_gray_next  ;

wire                        w_wr_accept        ;

// Read Domain
reg     [ADDR_WIDTH:0]      r_rd_ptr_bin        ;
reg     [ADDR_WIDTH:0]      r_rd_ptr_gray       ;
reg     [ADDR_WIDTH:0]      r_wr_ptr_gray_meta_r;
reg     [ADDR_WIDTH:0]      r_wr_ptr_gray_rclk  ;

reg     [ADDR_WIDTH:0]      w_rd_ptr_bin_next   ;
reg     [ADDR_WIDTH:0]      w_rd_ptr_gray_next  ;

wire                        w_rd_accept        ;

// modeling

// =============================================================================
// Write Domain : Write Acceptance
// =============================================================================
assign w_wr_accept = i_wr_en && !o_full;

// =============================================================================
// Write Domain : Next Pointer Logic
// =============================================================================
always @(*) begin
    w_wr_ptr_bin_next  = r_wr_ptr_bin + {{ADDR_WIDTH{1'b0}}, w_wr_accept};
    w_wr_ptr_gray_next = (w_wr_ptr_bin_next >> 1) ^ w_wr_ptr_bin_next;
end

// =============================================================================
// Write Domain : Pointer Register + Full Flag
// =============================================================================
always @(posedge wr_clk or negedge wr_rst_n) begin
    if (!wr_rst_n) begin
        r_wr_ptr_bin       <= {(ADDR_WIDTH+1){1'b0}}  ;
        r_wr_ptr_gray      <= {(ADDR_WIDTH+1){1'b0}}  ;
        o_full             <= 1'b0                    ;
    end
    else begin
        r_wr_ptr_bin       <= w_wr_ptr_bin_next        ;
        r_wr_ptr_gray      <= w_wr_ptr_gray_next       ;
        o_full             <= (w_wr_ptr_gray_next ==
                              {~r_rd_ptr_gray_wclk[ADDR_WIDTH:ADDR_WIDTH-1],
                                r_rd_ptr_gray_wclk[ADDR_WIDTH-2:0]});
    end
end

// =============================================================================
// Write Domain : Memory Write
// =============================================================================
always @(posedge wr_clk) begin
    if (w_wr_accept) begin
        mem[r_wr_ptr_bin[ADDR_WIDTH-1:0]] <= i_wr_data;
    end
end

// =============================================================================
// Write Domain : Read Pointer Synchronizer (2-FF)
// =============================================================================
always @(posedge wr_clk or negedge wr_rst_n) begin
    if (!wr_rst_n) begin
        r_rd_ptr_gray_meta_w <= {(ADDR_WIDTH+1){1'b0}} ;
        r_rd_ptr_gray_wclk   <= {(ADDR_WIDTH+1){1'b0}} ;
    end
    else begin
        r_rd_ptr_gray_meta_w <= r_rd_ptr_gray          ;
        r_rd_ptr_gray_wclk   <= r_rd_ptr_gray_meta_w   ;
    end
end

// =============================================================================
// Read Domain : Read Acceptance
// =============================================================================
assign w_rd_accept = i_rd_en && !o_empty;

// =============================================================================
// Read Domain : Next Pointer Logic
// =============================================================================
always @(*) begin
    w_rd_ptr_bin_next  = r_rd_ptr_bin + {{ADDR_WIDTH{1'b0}}, w_rd_accept};
    w_rd_ptr_gray_next = (w_rd_ptr_bin_next >> 1) ^ w_rd_ptr_bin_next;
end

// =============================================================================
// Read Domain : Pointer Register + Empty Flag
// =============================================================================
always @(posedge rd_clk or negedge rd_rst_n) begin
    if (!rd_rst_n) begin
        r_rd_ptr_bin       <= {(ADDR_WIDTH+1){1'b0}}  ;
        r_rd_ptr_gray      <= {(ADDR_WIDTH+1){1'b0}}  ;
        o_empty            <= 1'b1                    ;
    end
    else begin
        r_rd_ptr_bin       <= w_rd_ptr_bin_next        ;
        r_rd_ptr_gray      <= w_rd_ptr_gray_next       ;
        o_empty            <= (w_rd_ptr_gray_next == r_wr_ptr_gray_rclk);
    end
end

// =============================================================================
// Read Domain : Registered Memory Read
// =============================================================================
always @(posedge rd_clk) begin
    if (w_rd_accept) begin
        o_rd_data <= mem[r_rd_ptr_bin[ADDR_WIDTH-1:0]];
    end
end

// =============================================================================
// Read Domain : Write Pointer Synchronizer (2-FF)
// =============================================================================
always @(posedge rd_clk or negedge rd_rst_n) begin
    if (!rd_rst_n) begin
        r_wr_ptr_gray_meta_r <= {(ADDR_WIDTH+1){1'b0}} ;
        r_wr_ptr_gray_rclk   <= {(ADDR_WIDTH+1){1'b0}} ;
    end
    else begin
        r_wr_ptr_gray_meta_r <= r_wr_ptr_gray          ;
        r_wr_ptr_gray_rclk   <= r_wr_ptr_gray_meta_r   ;
    end
end

// =============================================================================
// Read Domain : Gray to Binary Conversion
// =============================================================================
function [ADDR_WIDTH:0] gray2bin;
    input [ADDR_WIDTH:0] g;
    integer i;

    begin
        gray2bin[ADDR_WIDTH] = g[ADDR_WIDTH];

        for (i = ADDR_WIDTH - 1; i >= 0; i = i - 1) begin
            gray2bin[i] = gray2bin[i+1] ^ g[i];
        end
    end
endfunction

// =============================================================================
// Read Domain : FIFO Level
// =============================================================================
assign o_rd_level = gray2bin(r_wr_ptr_gray_rclk) - r_rd_ptr_bin;

endmodule
