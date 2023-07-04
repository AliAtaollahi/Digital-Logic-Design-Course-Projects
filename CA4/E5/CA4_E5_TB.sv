`timescale 1ns/1ns
module CA4_E5_TB ();
	logic c=1,synccInt=1,enn=1,resett=0;
	wire[7:0] ppoo1;
	new_register8withMSDFF xx1(c,synccInt,resett,enn,ppoo1);
	always #100 c=~c ;
	initial begin 
		#3000
		#1000 $stop; 
	end
endmodule

