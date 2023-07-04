`timescale 1ns/1ns
module CA2_E1_TB ();
	logic aa=0,bb=1,ss=0,tt=1;
	wire ww;
	CA2_E1 eee(aa,bb,ss,tt,ww);
	initial begin
	#1000 ss=1;
	#1000 ss=0;
	#500 bb=0;
	#500 tt=0;
	#1000 $stop;
	end
endmodule
