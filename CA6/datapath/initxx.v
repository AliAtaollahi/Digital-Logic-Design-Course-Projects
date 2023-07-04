`timescale 1ns/1ns
module initxx (input [15:0] x,output [31:0] data);
	reg [15:0] temp;
	always@(x) begin
		temp=(16'b1111111111111111)/x;
	end
	assign data={temp,16'b1111111111111111};	
endmodule