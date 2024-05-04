/**
 * Computes the sum of two bits.
 */

module HalfAdder(
	input a,		//1-bit input
	input b,		//1-bit inpur
	output sum,	//Right bit of a + b
	output carry	//Lef bit of a + b
);

xor (sum,a,b);
and(carry,a,b);
endmodule