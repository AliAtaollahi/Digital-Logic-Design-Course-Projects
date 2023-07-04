`timescale 1ns/1ns
module nand_ (input a,b,output w1);
	wire y;
	supply1 Vdd;
	supply0 Gnd;
	pmos #(4,7,9) T1(w1,Vdd,a);
	pmos #(4,7,9) T2(w1,Vdd,b);
	nmos #(3,5,7) T3(y,Gnd,a);
	nmos #(3,5,7) T4(w1,y,b);
endmodule
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

module nand_ctrl_ (input a,b,EN2,output w2);
	wire j1,j2,j3,j4;
	supply1 Vdd;
	supply0 Gnd;
	pmos #(4,7,9) T1(j3,Vdd,a);
	pmos #(4,7,9) T2(j3,Vdd,b);
	pmos #(4,7,9) T3(w2,j3,j4);
	pmos #(4,7,9) T4(j4,Vdd,EN2);
	nmos #(3,5,7) T5(j4,Gnd,EN2);
	nmos #(3,5,7) T6(w2,j2,EN2);
	nmos #(3,5,7) T7(j2,j1,b);
	nmos #(3,5,7) T8(j1,Gnd,a);
endmodule

module with_nnc (input a,b,c,d,output w);
	wire i;
	supply1 Vdd;
	not_ctrl_ not1(d,Vdd,i);
	not_ctrl_ not2(c,i,w);
	nand_ctrl_ nand1(a,b,d,w);
endmodule

module with_nand_not (input a,b,c,d,output w);
	wire i,j,k,l,m;
	not_ n1(c,i);
	not_ n2(d,j);
	nand_ na1(i,j,k);
	nand_ na2(l,d,m);
	nand_ na3(a,b,l);
	nand_ na4(k,m,w);
endmodule
module nn_complex (input a,b,c,d,output w);
	wire i,j,k,l,m;
	supply1 Vdd;
	supply0 Gnd;
	pmos #(4,7,9) T1(k,Vdd,c);
	pmos #(4,7,9) T2(l,Vdd,b);
	pmos #(4,7,9) T3(l,Vdd,a);
	pmos #(4,7,9) T4(w,k,d);
	pmos #(4,7,9) T5(w,l,m);
	pmos #(4,7,9) T6(m,Vdd,d);
	nmos #(3,5,7) T7(m,Gnd,d);
	nmos #(3,5,7) T8(i,Gnd,d);
	nmos #(3,5,7) T9(i,Gnd,c);
	nmos #(3,5,7) T10(w,i,m);
	nmos #(3,5,7) T11(j,i,b);
	nmos #(3,5,7) T12(w,j,a);
endmodule



