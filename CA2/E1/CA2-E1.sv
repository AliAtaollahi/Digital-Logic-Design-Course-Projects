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