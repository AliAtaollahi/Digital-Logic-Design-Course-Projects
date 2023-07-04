`timescale 1ns/1ns
module CA4_E1_TB_1 ();
	logic dd=1,c=1,enn=1;
	wire qq;
	D_latch xx(dd,c,enn,qq);
	always #200 c=~c ;
	initial begin 
		#100 dd=0;
		#200 dd=1;
		#200 $stop; 
	end
endmodule
module CA4_E1_TB_2 ();
	logic dd=1,c=1,enn=1;
	wire qq;
	D_latch xx(dd,c,enn,qq);
	always #200 c=~c ;
	initial begin 
		#200 dd=0;
		#200 dd=1;
		#200 $stop; 
	end
endmodule