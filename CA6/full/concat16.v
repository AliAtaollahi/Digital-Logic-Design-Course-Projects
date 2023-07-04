`timescale 1ns/1ns
module concat16 (input[15:0] in,output [31:0] out);
	assign out={16'b0000000000000000,in};
endmodule