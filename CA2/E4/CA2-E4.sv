`timescale 1ns/1ns
module slice (input a,b,output w2,w1);
	wire i;
	not #(7,9) not1(i,b);
	xor #(15,25) xor1(w2,a,i);
	nor #(8,18) nor1(w1,a,i);
endmodule
module complimentor8_bit (input [7:0] a,output [7:0] w);
	supply1 Vdd;
	wire i[7:0];
	slice slice0(a[0],Vdd,w[0],i[0]);
	slice slice1(a[1],i[0],w[1],i[1]);
	slice slice2(a[2],i[1],w[2],i[2]);
	slice slice3(a[3],i[2],w[3],i[3]);
	slice slice4(a[4],i[3],w[4],i[4]);
	slice slice5(a[5],i[4],w[5],i[5]);
	slice slice6(a[6],i[5],w[6],i[6]);
	slice slice7(a[7],i[6],w[7],i[7]);
endmodule
