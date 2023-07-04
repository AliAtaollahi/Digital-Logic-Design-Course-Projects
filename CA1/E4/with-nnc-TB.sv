`timescale 1ns/1ns
module with_nnc_TB();
	logic aa=1,bb=1,cc=1,dd=1;
	wire ww;
	with_nnc WNNC(aa,bb,cc,dd,ww);
	initial begin
	#100 dd=0;cc=0;
	#100 dd=1;
	#200 $stop;
	end
endmodule
module make_sure_with_nnc_TB ();
	logic aa=1,bb=1,cc=1,dd=1;
	wire ww;
	with_nnc WWNC(aa,bb,cc,dd,ww);
	always #1000 aa=~aa;
	always #1500 bb=~bb;
	always #2000 cc=~cc;
	always #2500 dd=~dd;
	initial begin
	#100000 $stop;
	end
endmodule