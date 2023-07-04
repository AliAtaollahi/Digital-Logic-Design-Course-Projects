`timescale 1ns/1ns
module nand_not_ctrl_TB ();
	logic aa=1,bb=1,cc=0,EN1=1,EN2=1;
	wire ww1,ww2;
	nand_ctrl_ NOTC(aa,bb,EN2,ww2);
	not_ctrl_ NONDC(cc,EN1,ww1);
	initial begin
	#100 aa=0;cc=1;
	#50 bb=0;
	#50 aa=1;bb=1;cc=0;
	#50 aa=0;bb=0;
	#50 EN2=0;EN1=0;
	#100 $stop;
	end
endmodule
module make_sure_nand_not_ctrl_TB ();
	logic aa=1,bb=1,cc=1,EN1=1,EN2=1;
	wire ww1,ww2;
	nand_ctrl_ NNANDC(aa,bb,EN2,ww1);
	not_ctrl_ NNTC(cc,EN1,ww2);
	always #1000 aa=~aa;
	always #1500 bb=~bb;
	always #2000 cc=~cc;
	always #2500 EN1=~EN1;
	always #3000 EN2=~EN2;
	initial begin
	#1000000 $stop;
	end
endmodule