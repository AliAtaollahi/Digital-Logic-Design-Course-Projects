`timescale 1ns/1ns
module register32 (input clk,rst,init,ld,input[31:0] ParIn,input[31:0] io,output reg[31:0] ParOut,output [15:0] res);
	wire [15:0] temp;
	always @(posedge clk,posedge rst,posedge init)begin
		if(rst)
			ParOut<=32'b0;
		else 
			if(init)
				ParOut<= io;
			else
				ParOut<= (ld) ? ParIn : ParOut;
	end
	assign {res,temp}=ParOut;
endmodule