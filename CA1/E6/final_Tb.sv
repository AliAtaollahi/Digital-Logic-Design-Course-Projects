`timescale 1ns/1ns
module test_all_TB ();
	logic aa=1,bb=1,cc=1,dd=1;
	wire ww1,ww2,ww3;
	with_nnc WNNC(aa,bb,cc,dd,ww1);
	with_nand_not WNN(aa,bb,cc,dd,ww2);
	nn_complex NNC(aa,bb,cc,dd,ww3);
	initial begin
	#100 dd=0;
	#50 dd=1;
	#50 cc=0;dd=0;
	#50 dd=1;
	#50 dd=0;
	#50 aa=0;
	#50 aa=1;
	#50 dd=0;
	#50 $stop;
	end
endmodule
module make_sure_test_all_TB ();
	logic aa=1,bb=1,cc=1,dd=1;
	wire ww1,ww2,ww3;
	with_nnc WNNC(aa,bb,cc,dd,ww1);
	with_nand_not WNN(aa,bb,cc,dd,ww2);
	nn_complex NNC(aa,bb,cc,dd,ww3);
	always #1000 aa=~aa;
	always #1500 bb=~bb;
	always #2000 cc=~cc;
	always #2500 dd=~dd;
	initial begin
	#100000 $stop;
	end
endmodule

