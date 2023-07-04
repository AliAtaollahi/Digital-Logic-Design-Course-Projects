`timescale 1ns/1ns
module CA2_E4_TB ();
	logic [0:7] aa;
	assign aa=8'b10000010;
	wire [7:0] ww1,ww2;
	complimentor8_bit eee(aa,ww1);
	assign #(34*8) ww2 = ~aa + 1'b1;
	initial begin
	#1000 $stop;
	end
endmodule
module CA2_E4_TB_1slice ();
	logic aa=0,bb=0;
	wire ww1,ww2;
	slice eee(aa,bb,ww2,ww1);
	initial begin
	#1000 bb=1;
	#500 bb=0;
	#500 aa=1;
	#1000 $stop;
	end
endmodule
