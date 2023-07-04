`timescale 1ns/1ns
module CA4_E2_TB ();
	logic serr=0,c=1,enn=1;
	wire[7:0] ppoo;
	register8withDlatch xx(serr,c,enn,ppoo);
	always #200 c=~c ;
	initial begin 
		#1050 serr=1;
		#200 serr=0;
		#1000 $stop; 
	end
endmodule