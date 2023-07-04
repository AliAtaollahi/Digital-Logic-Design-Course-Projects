`timescale 1ns/1ns
module register32_v2 (input clk,rst,init,ld,input[31:0] ParIn,input[31:0] io,output reg[31:0] ParOut);
	always @(posedge clk,posedge rst,posedge init)begin
		if(rst)
			ParOut<=32'b0;
		else 
			if(init)
				ParOut<= io;
			else
				ParOut<= (ld) ? ParIn : ParOut;
	end
endmodule