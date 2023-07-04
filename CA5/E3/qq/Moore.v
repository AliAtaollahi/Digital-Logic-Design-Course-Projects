`timescale 1ns/1ns
module MOORE10110 (input clk,rst,j,en,output w);
	reg [2:0] ns,ps;
	parameter [2:0] A=3'b000,B=3'b001,C=3'b010,D=3'b011,E=3'b100,F=3'b101;
	always@(ps,j) begin
		ns=3'b000;
		case(ps)
			A: ns= j ? B : A;
			B: ns= j ? B : C;
			C: ns= j ? D : A;
			D: ns= j ? E : C;
			E: ns= j ? B : F;
			F: ns= en ? (j ? D : A) : F;
			default: ns=A;
		endcase
	end
	assign w= ~en ? 1'b1 : (ps==F) ? 1'b1 : 1'b0;
	always@(posedge clk,posedge rst)begin
		if(rst)
			ps<=A;
		else
			ps<=ns;
	end
endmodule