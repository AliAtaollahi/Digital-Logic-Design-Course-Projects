`timescale 1ns/1ns
module rom (input [2:0] adr,output [15:0] data);
	reg [15:0] temp;
	always@(adr) begin
		case(adr)
			0:temp=16'b1111111111111111;
			1:temp=16'b0101010101010101;
			2:temp=16'b0110011001100110;
			3:temp=16'b0110011110011110;
			4:temp=16'b0110011110111101;
			5:temp=16'b0110011111000000;
			6:temp=16'b0110011111000001;
			7:temp=16'b0110011111000001;
		endcase
	end
	assign data=temp;	
endmodule