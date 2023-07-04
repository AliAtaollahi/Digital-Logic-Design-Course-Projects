`timescale 1ns/1ns
module ca6_final_TB ();
	logic clk=1'b0,rst=1'b0,start=1'b0;
	logic [15:0] x=16'b0; //0
	logic ready,busy;
	logic[15:0] y;
	ca6_final ccc(busy,clk,rst,start,x,ready,y);
	always #100 clk=~clk;
	initial begin 
		#1000 start=1'b1;
		#1000 start=1'b0;
		#10000 x=16'b0110010010000111;   //pi/8
		#1000 start=1'b1;
		#1000 start=1'b0;
		#10000 x=16'b1100100100001111;   //pi/4
		#300 start=1'b1;
		#1000 start=1'b0;
		#100000 $stop; 
	end
	real in,tanin;
	assign in=x*(2.0**-16);
	assign tanin=y*(2.0**-16);
endmodule
