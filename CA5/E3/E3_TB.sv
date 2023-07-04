`timescale 1ns/1ns
module CA5_E3_TB ();
	logic serInn=1,clkk=1,resett=0;
	wire serout;
	wire[7:0] ww;
	E3_QQ xxxxx(serout,serInn,clkk,resett,ww);
	always #10 clkk=~clkk ;
	initial begin 
		#4490 resett=0;
	    #250 resett=1;
        #250 resett=0;
		#20 serInn=1;
		#20 serInn=0;
		#20 serInn=1;
		#20 serInn=1;
		#20 serInn=0;
		#10000 $stop; 
	end
endmodule


