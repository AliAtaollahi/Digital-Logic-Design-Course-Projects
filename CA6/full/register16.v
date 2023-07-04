`timescale 1ns/1ns
module register16 (input clk,rst,init,ld,input[15:0] ParIn,input[15:0] io,output reg[15:0] ParOut);
	always @(posedge clk,posedge rst,posedge init)begin
		if(rst)
			ParOut<=16'b0;
		else 
			if(init)
				ParOut<= io;
			else
				ParOut<= (ld) ? ParIn : ParOut;
	end
endmodule