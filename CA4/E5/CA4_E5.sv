`timescale 1ns/1ns
module mux2_to_1 (input a,b,s,en,output w);
	wire i,j;
	notif1 #(14,18,16) n1(i,a,j);
	notif1 #(14,18,16) n2(i,b,s);
	not #(7,9) n3(j,s);
	notif1 #(14,18,16) n4(w,i,en);
endmodule
module D_latch(input d,clk,en,output q);
	mux2_to_1 mx(q,d,clk,en,q);
endmodule
module new_ms_DFF(input d,clk,syncInt,reset,en,output q);
	wire i,j,clkbar,d2,q1;
	not #(7,9) n1(clkbar,clk);
	nor #(8,18) n2(i,d,reset);
	nor #(8,18) n3(j,i,syncInt);
	D_latch dl1(j,clk,en,q1);
	D_latch dl2(q1,clkbar,en,q);
endmodule
module new_register8withMSDFF(input clk,syncInt,reset,en,output [7:0] po);
	wire [8:0] d,preset;
	wire reset_;
	assign d[8]=d[0];
	genvar k;
	generate
		for(k=8;k>0;k=k-1) begin : registerGates
			new_ms_DFF dd(d[k],clk,preset[k],reset_,en,d[k-1]);
		end
	endgenerate
	assign po=d[7:0];
	assign reset_= (reset|syncInt);
	assign preset= 8'b10000000 ? syncInt : 8'b0;
endmodule
module LFSR(input clk,syncInt,reset,en,output [7:0] po);
	wire [8:0] d,preset;
	wire reset_;
	assign d[8]=d[0];
	genvar k;
	generate
		for(k=8;k>0;k=k-1) begin : registerGates
			new_ms_DFF dd(d[k],clk,preset[k],reset_,en,d[k-1]);
		end
	endgenerate
	assign po=d[7:0];
	assign reset_= (reset|syncInt);
	assign preset= 8'b10000000 ? syncInt : 8'b0;
endmodule