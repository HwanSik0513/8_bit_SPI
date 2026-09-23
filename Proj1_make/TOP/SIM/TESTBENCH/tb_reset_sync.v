`timescale 1ns / 1ps

module tb_reset_sync;

// DUT input
reg     clk;
reg     arst_n;

// DUT output
wire    rst_n_sync;


// ============================================================
// DUT
// ============================================================

Reset_sync uut (
    .clk        (clk),
    .arst_n     (arst_n),
    .rst_n_sync (rst_n_sync)
);


// ============================================================
// Clock generation
// 10 ns period = 100 MHz
// ============================================================

initial begin
    clk = 1'b0;

    forever #5 clk = ~clk;
end


// ============================================================
// Test stimulus
// ============================================================

initial begin

    // Initial value
    arst_n = 1'b1;

    // --------------------------------------------------------
    // TEST 1 : Asynchronous Assert
    // --------------------------------------------------------

    #3;

    arst_n = 1'b0;

    // Reset should assert immediately
    #1;

    if (rst_n_sync !== 1'b0) begin
        $display("[FAIL] Async reset assertion failed.");
        $finish;
    end
    else begin
        $display("[PASS] Async reset assertion.");
    end


    // --------------------------------------------------------
    // TEST 2 : Synchronous Deassert
    // --------------------------------------------------------

    // Release reset between clock edges
    #8;

    arst_n = 1'b1;

    $display("[%0t ns] ARESETn released.", $time);


    // First rising edge
    @(posedge clk);
    #1;

    if (rst_n_sync !== 1'b0) begin
        $display("[FAIL] rst_n_sync released too early.");
        $finish;
    end
    else begin
        $display("[PASS] First clock : rst_n_sync = 0");
    end


    // Second rising edge
    @(posedge clk);
    #1;

    if (rst_n_sync !== 1'b1) begin
        $display("[FAIL] rst_n_sync did not release.");
        $finish;
    end
    else begin
        $display("[PASS] Second clock : rst_n_sync = 1");
    end


    // --------------------------------------------------------
    // TEST 3 : Assert reset again during normal operation
    // --------------------------------------------------------

    #7;

    arst_n = 1'b0;

    #1;

    if (rst_n_sync !== 1'b0) begin
        $display("[FAIL] Second async assertion failed.");
        $finish;
    end
    else begin
        $display("[PASS] Second async assertion.");
    end


    // --------------------------------------------------------
    // Release again
    // --------------------------------------------------------

    #7;
    arst_n = 1'b1;

    repeat (3) @(posedge clk);

    $display("----------------------------------------");
    $display(" RESET_SYNC TEST PASSED");
    $display("----------------------------------------");

    #10;
    $finish;

end

initial begin 

`ifdef function_sim

$dumpfile("./DUMP/reset_sync.vcd");
$dumpvars(0, tb_reset_sync);

`endif

end

endmodule
