/**
 * 16-bit incrementer:
 * out = in + 1 (arithmetic addition)
 */

//`default_nettype none
module Inc16(
	input [15:0] in,
	output [15:0] out
);

wire w1;
assign w1=0000000000000001;
	Add16 add(out,in,w1);
endmodule
