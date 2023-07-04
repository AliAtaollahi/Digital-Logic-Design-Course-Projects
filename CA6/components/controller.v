`timescale 1ns/1ns
module controller (input clk,rst,start,co,output reg ready,initx,ldx,initt,ldt,initr,ldr,enc,s,busy);
	reg[2:0] ps,ns;
	parameter [2:0] Idle=0,init=1,Begin=2,Mult1=3,Mult2=4,Mult3=5,add=6;
	always @(ps,co,start)begin
		ns=Idle;
		case(ps)
			Idle:ns=(start)? init:Idle;
			init:ns=(start)? init:Begin;
			Begin:ns=Mult2;
			Mult1:ns=Mult2;
			Mult2:ns=Mult3;
			Mult3:ns=add;
			add:ns=(co)? Idle:Mult1;
		endcase
	end
	always@(posedge clk,posedge rst)begin
		if(rst==1'b1)
			ps<=Idle;
		else
			ps<=ns;
	end
	always @(ps,co,start)begin
		ready=1'b0;initx=1'b0;ldx=1'b0;initt=1'b0;ldt=1'b0;busy=1'b0;
		initr=1'b0;ldr=1'b0;enc=1'b0;s=1'b0;
		case(ps)
			Idle:begin ready=1'b1; end
			init:begin ldx=1'b1; end
			Begin:begin initr=1'b1; initt=1'b1; end
			Mult1:begin s=1'b0; ldt=1'b1;busy=1'b1; end
			Mult2:begin s=1'b1; ldt=1'b1;busy=1'b1; end
			Mult3:begin s=1'b0; ldt=1'b1;busy=1'b1; end
			add:begin enc=1'b1; ldr=1'b1;busy=1'b1; end
		endcase
	end
endmodule
