/**
 * A 16-bit counter with load and reset control bits.
 * if      (reset[t] == 1) out[t+1] = 0
 * else if (load[t] == 1)  out[t+1] = in[t]
 * else if (inc[t] == 1)   out[t+1] = out[t] + 1  (integer addition)
 * else                    out[t+1] = out[t]
 */

//`default_nettype none
module PC(
	input clk,
	input [15:0] in,
	input load,
	input inc,
	input reset,
	output [15:0] out
);	
	wire [15:0] w1,w2,w3,w4,outreg;
    Inc16 in0(outreg,w1);
    Mux16 m0(outreg,w1,inc,w2);
    Mux16 m1(w2,in,load,w3);
    Mux16 m2(w3,0,reset,w4);
    Register r0(w4,1,outreg);
	assign out=outreg;
endmodule
