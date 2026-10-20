`timescale 1ns/1ps
module TB_io_cell(
);

reg OEN_IN;
wire PAD_B_IN;
reg PAD_B_IN_reg;
wire Y_B_IN;

reg A_B_OUT;
reg OEN_OUT;
wire PAD_B_OUT;

reg PAD_IN;
wire Y_IN;

reg A_OUT;
wire PAD_OUT;

// Bi-directional Cell
// PAD to Y
PADDB UPADDB_IN(
	.A(), 
	.OEN(OEN_IN), 
	.PAD(PAD_B_IN), 
	.Y(Y_B_IN)
);


// Bi-directional Cell
// A to PAD
PADDB UPADDB_OUT(
	.A(A_B_OUT), 
	.OEN(OEN_OUT), 
	.PAD(PAD_B_OUT), 
	.Y()
);

// Input Buffer
// PAD to Y
PADDI UPADDI(
	.PAD(PAD_IN), 
	.Y(Y_IN)
);

// Output Driver
// A to PAD
PADDO UPADDO(
	.A(A_OUT), 
	.PAD(PAD_OUT)
);


initial begin
	PAD_B_IN_reg <=1'b0;
	OEN_IN <= 1'b1;	

	A_B_OUT<=1'b1;
	OEN_OUT<=1'b1;
	#20
	OEN_OUT <=1'b0;
	#20
	A_B_OUT<=1'b0;

	PAD_IN<= 1'b0;
	#20
	PAD_IN <=1'b1;

	A_OUT<= 1'b0;
	#20
	A_OUT<= 1'b1;

	#100
	$stop;
end


always begin
	#0.5 PAD_B_IN_reg <= ~PAD_B_IN_reg;
end

assign PAD_B_IN = PAD_B_IN_reg;

initial begin
	`ifdef function_sim 
		//$sdf_annotate (".../.../xx.sdf", TB_std_cell.core,,,"MAXIMUM");
		//TEST  <= $fopen("./log/tb_std_cell.rpt");
		$shm_open("./dump/TB_io_cell");
		$shm_probe(TB_io_cell, "AC");
	`endif
end

endmodule
