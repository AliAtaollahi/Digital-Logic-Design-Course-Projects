`timescale 1ns/1ns
module CA5_E1_TB_1 ();
	logic clock=0,jj=0,reset=0;
	wire ww1,ww2;
	MOORE10110 xx(clock,reset,jj,ww1);
	E1_QQ xxx(clock,reset,jj,ww2);
	always #50 clock=~clock ;
	initial begin 
		#90 jj=0;
		#100 jj=0;
		#100 jj=1;
		#100 jj=1;
		#100 jj=0;
		#100 jj=1;
		#100 jj=1;
		#100 jj=0;
		#100 jj=0;
		#100 jj=1;
		#100 jj=1;
		#40 reset=1;
		#40 reset=0;
		#20 jj=0;
		#100 jj=1;
		#100 jj=1;
		#100 jj=0;
		#100 jj=0;
		#100 jj=0;
		#200 $stop; 
	end
endmodule
