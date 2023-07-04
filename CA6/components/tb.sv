`timescale 1ns/1ns
module tb ();
	logic ready,initx,ldx,initt,ldt,initr,ldr,ldc,enc,s;
	logic clk=1'b0,rst=1'b0,start=1'b0,co=1'b0;
	controller ccc(clk,rst,start,co,ready,initx,ldx,initt,ldt,initr,ldr,ldc,enc,s);
	always #100 clk=~clk;
	initial begin 
		#1000 start=1'b1;
		#1000 start=1'b0;
		#1000 rst=1'b1;
		#1000 rst=1'b0;
		#1000 start=1'b1;
		#1000 start=1'b0;
		#10000 co=1'b1;
		#10000 $stop; 
	end
endmodule
