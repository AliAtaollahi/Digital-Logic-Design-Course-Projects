`timescale 1ns/1ns
module concat32 (input[31:0] in,output [15:0] out);
	wire [15:0] temp;
	assign {out,temp}=in;
endmodule