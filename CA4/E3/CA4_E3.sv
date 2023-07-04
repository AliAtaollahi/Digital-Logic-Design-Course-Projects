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
module ms_DFF(input d,clk,reset,en,output q);
	wire i,j,k,d2,q1;
	not #(7,9) n1(i,reset);
	not #(7,9) n2(j,clk);
	nand #(14,10) o1(k,i,q1);
	not #(7,9) n3(d2,k);
	D_latch dl1(d,clk,en,q1);
	D_latch dl2(d2,j,en,q);
endmodule
