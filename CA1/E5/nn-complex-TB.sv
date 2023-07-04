`timescale 1ns/1ns
module nn_complex_TB ();
	logic aa=1,bb=1,cc=0,dd=1;
	wire ww;
	nn_complex NNC(aa,bb,cc,dd,ww);
	initial begin
	#100 dd=0;
	#100 cc=1;
	#50 $stop;
	end
endmodule
module make_sure_nn_complex_TB ();
	logic aa=1,bb=1,cc=1,dd=1;
	wire ww;
	nn_complex NNC(aa,bb,cc,dd,ww);
	always #1000 aa=~aa;
	always #1500 bb=~bb;
	always #2000 cc=~cc;
	always #2500 dd=~dd;
	initial begin
	#100000 $stop;
	end
endmodule