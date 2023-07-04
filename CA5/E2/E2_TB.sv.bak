`timescale 1ns/1ns
module CA5_E2_TB ();
	logic clock=0,cnt=1,en=1,reset=0;
	wire ccoo;
	wire[7:0] ww;
	E2_QQ xxxx(ccoo,clock,en,cnt,reset,ww);
	always #10 clock=~clock ;
	initial begin 
		#5000 cnt=1;
		#5000 cnt=0;
		#5000 cnt=1;
		#5000 reset=1;
		#5000 reset=0;
		#10000 $stop; 
	end
endmodule

