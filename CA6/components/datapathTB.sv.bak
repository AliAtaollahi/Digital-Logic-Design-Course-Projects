`timescale 1ns/1ns
module dataPathTB ();
	logic co;
 	logic [15:0] yBus;
 	logic clk=1'b0;
 	logic rst=1'b0;
 	logic initr=1'b1;
	logic ldr=1'b0;
	logic initt=1'b1;
 	logic ldt=1'b0;
	logic s=1'b0;
	logic initx=1'b1;
 	logic ldx=1'b0;
	logic [15:0] xBus=16'b0011111111111111;
 	logic enc=1'b1;
	ca6 ccc(co,
	yBus,
	clk,
	rst,
	initr,
	ldr,
	initt,
	ldt,
	s,
	initx,
	ldx,
	xBus,
	enc);
	always #500 clk=~clk;
	initial begin 
		#1000 initr=1'b0;initt=1'b0;initx=1'b0;
		#1000 ldr=1'b1;ldt=1'b1;ldx=1'b1;
		#10000 $stop; 
	end
endmodule

