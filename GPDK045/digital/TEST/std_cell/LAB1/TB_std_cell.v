`timescale 1ns/1ps
module TB_std_cell(
);


/*
reg CK,RN;
reg [2:0] IN;
wire AND_RESULT, XOR_RESULT;
wire Q1, Q1_BAR, Q2;

//integer TEST;


AND2X1 UAND2X1 (
	.A(IN[0]),
	.B(IN[1]),
	.Y(AND_RESULT)
);


XOR2X1 UXOR2X1 (
	.A(AND_RESULT),
	.B(IN[2]),
	.Y(XOR_RESULT)
);



DFFRHQX1 UDFFRHQX1 (
	.D(XOR_RESULT),
	.CK(CK),
	.RN(RN),
	.Q(Q1)
);



INVX1 UINVX1 (
	.A(Q1),
	.Y(Q1_BAR)
);


DFFRHQX1 UDFFRHQX2 (
	.D(Q1_BAR),
	.CK(CK),
	.RN(RN),
	.Q(Q2)
);
*/

reg CK,RN	;
reg [7:0] IN	;
wire AOI_RESULT1, AOI_RESULT2, XOR_RESULT	;
wire Q1, Q2					;

AOI211X1 UAOI211X1_1 (
	.A0(IN[0]),
	.A1(IN[1]),
	.B0(IN[2]),
	.C0(IN[3]),
	.Y(AOI_RESULT1)
);

AOI211X1 UAOI211X1_2 (
	.A0(IN[4]),
	.A1(IN[5]),
	.B0(IN[6]),
	.C0(IN[7]),
	.Y(AOI_RESULT2)
);

DFFRHQX1 UDFFRHQX1 (
	.D(AOI_RESULT1),
	.CK(CK),
	.RN(RN),
	.Q(Q1)
);

DFFRHQX1 UDFFRHQX2 (
	.D(AOI_RESULT2),
	.CK(CK),
	.RN(RN),
	.Q(Q2)
);


XOR2X1 UXOR2X1 (
	.A(Q1),
	.B(Q2),
	.Y(XOR_RESULT)
);

initial begin
	CK	<= 1'b0;
	IN	<= 3'b000;
	RN	<= 1'b1;

#99	RN	<= 1'b0;
#100	RN	<= 1'b1;

#500
$stop;
end

always begin
#2	CK	<= ~CK;
end

always begin
#2	IN	<= IN+1'b1;
end

initial begin
	`ifdef function_sim 
		//$sdf_annotate (".../.../xx.sdf", TB_std_cell.core,,,"MAXIMUM");
		//TEST  <= $fopen("./log/tb_std_cell.rpt");
		$shm_open("./dump/TB_std_cell");
		$shm_probe(TB_std_cell, "AC");
	`endif
end

endmodule
