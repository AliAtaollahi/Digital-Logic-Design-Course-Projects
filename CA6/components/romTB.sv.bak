`timescale 1ns/1ns
module romTB ();
	logic add=3'b001;
	wire[15:0] q;
	logic clk=1'b0;
	myRom mr(add,clk,q);
	initial begin 
		#1000 add=3'b011;
		#10000 $stop; 
	end
endmodule
