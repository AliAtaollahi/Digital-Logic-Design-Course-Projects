`timescale 1ns/1ns
module CA2_E2_TB ();
	logic aa=0,bb=1,cc=1,dd=1,ss=0,tt=0;
	wire ww;
	CA2_E2 eee(aa,bb,cc,dd,ss,tt,ww);
	initial begin
	#1000 ss=1;
	#1000 ss=0;
	#1000 $stop;
	end
endmodule

