`timescale 1ns/1ns
module not_ (input c,output w2);
	supply1 Vdd;
	supply0 Gnd;
	pmos #(4,7,9) T5(w2,Vdd,c);
	nmos #(3,5,7) T6(w2,Gnd,c);
endmodule
module not_ctrl_ (input c,EN1,output w1);
	wire i1,i2,i3;
	supply1 Vdd;
	supply0 Gnd;
	pmos #(4,7,9) T1(i2,Vdd,c);
	pmos #(4,7,9) T2(w1,i2,i1);
	pmos #(4,7,9) T3(i1,Vdd,EN1);
	nmos #(3,5,7) T4(i1,Gnd,EN1);
	nmos #(3,5,7) T5(w1,i3,EN1);
	nmos #(3,5,7) T6(i3,Gnd,c);
endmodule
module CA2_E1 (input a,b,s,t,output w);
	wire i,j;
	not_ not1(s,i);
	not_ctrl_ nif1(a,i,j);
	not_ctrl_ nif2(b,s,j);
	not_ctrl_ nif3(j,t,w);
endmodule
module CA2_E3 (input [0:7]a,[0:7]b,input s,t,output [0:7]w);
	CA2_E1 e0(a[0],b[0],s,t,w[0]);
	CA2_E1 e1(a[1],b[1],s,t,w[1]);
	CA2_E1 e2(a[2],b[2],s,t,w[2]);
	CA2_E1 e3(a[3],b[3],s,t,w[3]);
	CA2_E1 e4(a[4],b[4],s,t,w[4]);
	CA2_E1 e5(a[5],b[5],s,t,w[5]);
	CA2_E1 e6(a[6],b[6],s,t,w[6]);
	CA2_E1 e7(a[7],b[7],s,t,w[7]);
endmodule
module CA2_E3_2 (input [0:7]a,[0:7]b,input s,t,output [0:7]w);
	assign w= ~s ? a : b ;
endmodule