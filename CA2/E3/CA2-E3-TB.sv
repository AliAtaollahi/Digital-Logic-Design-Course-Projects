`timescale 1ns/1ns
module CA2_E3_TB ();
	logic [0:7] aa,bb;
	logic tt=1,ss=0;
	assign aa=8'b01110001;
	assign bb=8'b10100111;
	wire [0:7] ww;
	wire [7:0] wwasign;
	CA2_E3 eee(aa,bb,ss,tt,ww);
	CA2_E3_2 eeee(aa,bb,ss,tt,wwasign);
	initial begin
	#1000 ss=1;
	#1000 ss=0;
	#1000 $stop;
	end
endmodule


