
module FullAdder(
	input a,		//1-bit input
	input b,		//1-bit input
	input c,		//1-bit input
	output sum,		//Right bit of a + b + c
	output carry	//Left bit of a + b + c
);
wire w1,w2,w3;

 // Computes the sum of three bits.
     xor x1(w1,a,b);
     xor x2(sum,w1,c);
     and a1(w2,w1,c);
     and a2(w3,a,b);
     or o1(carry,w2,w3);


endmodule