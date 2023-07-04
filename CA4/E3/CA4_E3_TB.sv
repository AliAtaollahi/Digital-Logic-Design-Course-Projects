`timescale 1ns/1ns
module CA4_E3_TB_1 ();
	logic dd=1,c=1,enn=1,resett=0;
	wire qq;
	ms_DFF xx(dd,c,resett,enn,qq);
	always #300 c=~c ;
	initial begin 
		#1000
		#1000 dd=0;
		#2000 dd=1;
		#1900 resett=1;
		#2000 $stop; 
	end
endmodule
module CA4_E3_TB_2 ();
	logic dd=1,c=1,enn=1,resett=0;
	wire qq;
	ms_DFF xx(dd,c,resett,enn,qq);
	always #500 c=~c ;
	initial begin 
		#1000
		#1000 dd=0;
		#2000 dd=1;
		#2000 resett=1;
		#2000 $stop; 
	end
endmodule