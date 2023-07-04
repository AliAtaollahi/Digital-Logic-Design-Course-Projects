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