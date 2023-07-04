`timescale 1ns/1ns
module CA3_E2_TB ();
	logic [15:0] inMM=3'd5,inNN=3'd4;
	logic [2:0] opcc;
	logic inCC=1'b0;
	wire zerr1,negg1,zerr2,negg2;
	logic [15:0] outFF1,outFF2;
	ALU_STR1 alu1(inMM,inNN,opcc,inCC,zerr1,negg1,outFF1);
	ALU_STR2 alu2(inMM,inNN,opcc,inCC,zerr2,negg2,outFF2);
	initial begin
	opcc=3'd0;
	repeat (10) begin 
		#40 inMM=$random; #40 inNN=$random; #20 inCC=$random;
	end
	opcc=3'd1;
	repeat (10) begin 
		#40 inMM=$random; #40 inNN=$random; #20 inCC=$random;
	end
	opcc=3'd2;
	repeat (10) begin 
		#40 inMM=$random; #40 inNN=$random; #20 inCC=$random;
	end
	opcc=3'd3;
	repeat (10) begin 
		#40 inMM=$random; #40 inNN=$random; #20 inCC=$random;
	end
	opcc=3'd4;
	repeat (10) begin 
		#40 inMM=$random; #40 inNN=$random; #20 inCC=$random;
	end
	opcc=3'd5;
	repeat (10) begin 
		#40 inMM=$random; #40 inNN=$random; #20 inCC=$random;
	end
	opcc=3'd6;
	repeat (10) begin 
		#40 inMM=$random; #40 inNN=$random; #20 inCC=$random;
	end
	#1000 $stop;
	end
endmodule
