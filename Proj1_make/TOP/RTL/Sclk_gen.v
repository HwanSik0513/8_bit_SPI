`timescale 1ns / 1ps

// =============================================================================
// sclk_gen.v
// Clock Generator : ACLK Domain
//
// ACLK = 100 MHz (10 ns)
// SCLK =  25 MHz (40 ns)
//
// Divide-by-4 Clock Generator
// SCLK is a generated clock derived from ACLK.
// =============================================================================

module sclk_gen (

    // port list
    clk             ,
    rst_n           ,
    o_sclk

);

// port declaration
input           clk             ; // ACLK (100 MHz)
input           rst_n           ; // Active-Low Reset
output          o_sclk          ; // SCLK (25 MHz)

// internal register
reg             o_sclk          ;
reg             r_toggle_phase  ;

// modeling

// =============================================================================
// Clock Divider : Divide by 4
// =============================================================================
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        r_toggle_phase      <= 1'b0             ;
        o_sclk              <= 1'b0             ;
    end
    else begin
        r_toggle_phase      <= ~r_toggle_phase  ;

        if (r_toggle_phase) begin
            o_sclk          <= ~o_sclk          ;
        end
    end
end

endmodule
