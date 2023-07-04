`timescale 1ns/1ns
module nand_not_TB ();
	logic aa=0,bb=0,cc=0;
	wire ww1,ww2;
	nand_ NANDC(aa,bb,ww1);
	not_ NOTC(cc,ww2);
	initial begin
	#110 aa=1;bb=1;cc=1;
	#90 aa=0;cc=0;
	#50 $stop;
	end
endmodule
module make_sure_nand_not_TB ();
	logic aa=1,bb=1,cc=1;
	wire ww1,ww2;
	nand_ NANDC(aa,bb,ww1);
	not_ NOTC(cc,ww2);
	always #1000 aa=~aa;
	always #1500 bb=~bb;
	always #2000 cc=~cc;
	initial begin
	#100000 $stop;
	end
endmodule