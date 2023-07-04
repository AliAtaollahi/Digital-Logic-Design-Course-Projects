
module E6 (input a,b,c,d,output w);
	assign w=(a&~b&~c&~d)|(~a&~b&~c&d)|(~a&b&~c&d)|(a&b&~c&d)|(a&~b&~c&d)|(a&b&c&d)|(~a&~b&c&~d)|(~a&b&c&~d)|(a&b&c&~d);
endmodule
