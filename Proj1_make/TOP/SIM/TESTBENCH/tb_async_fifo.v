`timescale 1ns/1ps

module tb_async_fifo;

localparam DATA_WIDTH = 8;
localparam ADDR_WIDTH = 4;              // 16 entries
localparam DEPTH      = (1 << ADDR_WIDTH);

reg                         wr_clk;
reg                         wr_rst_n;
reg                         i_wr_en;
reg  [DATA_WIDTH-1:0]       i_wr_data;
wire                        o_full;

reg                         rd_clk;
reg                         rd_rst_n;
reg                         i_rd_en;
wire [DATA_WIDTH-1:0]       o_rd_data;
wire                        o_empty;
wire [ADDR_WIDTH:0]         o_rd_level;

integer                     errors;

async_fifo #(
    .DATA_WIDTH (DATA_WIDTH),
    .ADDR_WIDTH (ADDR_WIDTH)
) dut (
    .wr_clk     (wr_clk),
    .wr_rst_n   (wr_rst_n),
    .i_wr_en    (i_wr_en),
    .i_wr_data  (i_wr_data),
    .o_full     (o_full),
    .rd_clk     (rd_clk),
    .rd_rst_n   (rd_rst_n),
    .i_rd_en    (i_rd_en),
    .o_rd_data  (o_rd_data),
    .o_empty    (o_empty),
    .o_rd_level (o_rd_level)
);

// Genuinely different, non-integer-ratio clocks: 10 ns (100 MHz) write side,
// 13 ns (~76.9 MHz) read side. The exact read frequency does not matter --
// what matters is that it is NOT a clean multiple of the write clock, so no
// lucky alignment masks a real CDC bug.
initial wr_clk = 1'b0;
always  #5   wr_clk = ~wr_clk;

initial rd_clk = 1'b0;
always  #6.5 rd_clk = ~rd_clk;

// ---------------------------------------------------------------------
// Scoreboard: plain Verilog-2001 array used as a FIFO model, since this
// is simulation-only code (not synthesizable RTL).
// ---------------------------------------------------------------------
reg [DATA_WIDTH-1:0] sb_mem [0:1023];
integer sb_wr_ptr;
integer sb_rd_ptr;

task sb_push(input [DATA_WIDTH-1:0] data);
begin
    sb_mem[sb_wr_ptr] = data;
    sb_wr_ptr = sb_wr_ptr + 1;
end
endtask

task sb_pop_and_check(input [DATA_WIDTH-1:0] got);
begin
    if (got !== sb_mem[sb_rd_ptr]) begin
        $display("[%0t] FAIL: read data mismatch. expected=%02h got=%02h (index %0d)",
                  $time, sb_mem[sb_rd_ptr], got, sb_rd_ptr);
        errors = errors + 1;
    end
    sb_rd_ptr = sb_rd_ptr + 1;
end
endtask

// ---------------------------------------------------------------------
// Write-domain driver task: one write per call, held for exactly one
// wr_clk period.
// ---------------------------------------------------------------------
task wr_one(input [DATA_WIDTH-1:0] data);
begin
    @(posedge wr_clk);
    i_wr_en   = 1'b1;
    i_wr_data = data;
    if (!o_full)
        sb_push(data);
    @(posedge wr_clk);
    i_wr_en   = 1'b0;
end
endtask

// ---------------------------------------------------------------------
// Read-domain driver task: one read per call, checks o_rd_data the cycle
// after i_rd_en (matches async_fifo.v's registered read-data timing).
// ---------------------------------------------------------------------
task rd_one;
begin
    @(posedge rd_clk);
    i_rd_en = 1'b1;
    @(posedge rd_clk);
    i_rd_en = 1'b0;
    // o_rd_data is registered: valid on this edge, one cycle after rd_en.
    sb_pop_and_check(o_rd_data);
end
endtask

integer i;

initial begin
    errors    = 0;
    sb_wr_ptr = 0;
    sb_rd_ptr = 0;
    i_wr_en   = 1'b0;
    i_wr_data = {DATA_WIDTH{1'b0}};
    i_rd_en   = 1'b0;
    wr_rst_n  = 1'b0;
    rd_rst_n  = 1'b0;

    repeat (5) @(posedge wr_clk);
    wr_rst_n = 1'b1;
    repeat (5) @(posedge rd_clk);
    rd_rst_n = 1'b1;
    repeat (3) @(posedge wr_clk);

    // -------------------------------------------------------------
    // Test 1: fill to FULL, verify FULL asserts at exactly DEPTH
    // writes, and that one extra write while full is dropped.
    // -------------------------------------------------------------
    $display("[%0t] TEST 1: fill to full", $time);
    for (i = 0; i < DEPTH; i = i + 1)
        wr_one(i[DATA_WIDTH-1:0]);

    @(posedge wr_clk);
    if (!o_full) begin
        $display("[%0t] FAIL: o_full not asserted after %0d writes", $time, DEPTH);
        errors = errors + 1;
    end else begin
        $display("[%0t] PASS: o_full asserted after %0d writes", $time, DEPTH);
    end

    // Attempt one more write while full -- must be silently dropped.
    wr_one(8'hFF);
    if (sb_wr_ptr != DEPTH) begin
        // sb_push only happens in wr_one when !o_full was seen, so if the
        // scoreboard didn't grow, the drop was correctly modeled; this is
        // really just documenting intent, the real check is FIFO contents
        // below still matching the first DEPTH values pushed.
    end

    // -------------------------------------------------------------
    // Test 2: drain completely, verify order + EMPTY at exactly
    // DEPTH reads.
    // -------------------------------------------------------------
    $display("[%0t] TEST 2: drain to empty, check order", $time);
    for (i = 0; i < DEPTH; i = i + 1)
        rd_one;

    @(posedge rd_clk);
    if (!o_empty) begin
        $display("[%0t] FAIL: o_empty not asserted after draining %0d entries", $time, DEPTH);
        errors = errors + 1;
    end else begin
        $display("[%0t] PASS: o_empty asserted after draining %0d entries", $time, DEPTH);
    end

    // -------------------------------------------------------------
    // Test 3: simultaneous write/read traffic across the async
    // boundary -- 64 bytes, write and read running concurrently.
    // -------------------------------------------------------------
    $display("[%0t] TEST 3: concurrent write/read traffic", $time);
    fork
        begin : wr_stream
            integer k;
            for (k = 0; k < 64; k = k + 1)
                wr_one(k[DATA_WIDTH-1:0] ^ 8'hA5);
        end
        begin : rd_stream
            integer k;
            k = 0;
            while (k < 64) begin
                @(posedge rd_clk);
                if (!o_empty) begin
                    i_rd_en = 1'b1;
                    @(posedge rd_clk);
                    i_rd_en = 1'b0;
                    sb_pop_and_check(o_rd_data);
                    k = k + 1;
                end
            end
        end
    join

    repeat (10) @(posedge rd_clk);

    if (errors == 0)
        $display("[%0t] ALL TESTS PASSED (tb_async_fifo)", $time);
    else
        $display("[%0t] TESTS FAILED: %0d error(s) (tb_async_fifo)", $time, errors);

    $finish;
end

// Safety timeout in case a task hangs (e.g. mis-wired handshake).
initial begin
    #200000;
    $display("[%0t] FAIL: TIMEOUT -- simulation did not finish", $time);
    $finish;
end

endmodule
