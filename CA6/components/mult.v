`timescale 1ns/1ns
module mult (input [15:0] a,b,output [15:0] w);
	wire [15:0] temp;
	assign {w,temp}=a*b;
endmodule
