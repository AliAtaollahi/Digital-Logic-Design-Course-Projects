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
module with_nand_not (input a,b,c,d,output w);
	wire i,j,k,l,m;
	not_ n1(c,i);
	not_ n2(d,j);
	nand_ na1(i,j,k);
	nand_ na2(l,d,m);
	nand_ na3(a,b,l);
	nand_ na4(k,m,w);
endmodule
