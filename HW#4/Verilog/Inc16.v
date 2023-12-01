/**
 * 16-bit incrementer:
 * out = in + 1 (arithmetic addition)
 */

//`default_nettype none
module Inc16(
	input [15:0] in,
	output [15:0] out
);

wire [15:0] w1=16'h0001;
	Add16 add(w1,in,out);
endmodule
