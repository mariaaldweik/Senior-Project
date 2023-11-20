/**
 * 1-bit register:
 * If load[t] == 1 then out[t+1] = in[t]
 *    else out does not change (out[t+1] = out[t])
 */

//`default_nettype none
module Bit(
	input clk,
	input in,
	input load,
	output  out
);

wire w1,w2;
 
	Mux m1(w2,in,load,w1);
	DFF d1(clk,w1,w2);

assign out=w2;

endmodule
