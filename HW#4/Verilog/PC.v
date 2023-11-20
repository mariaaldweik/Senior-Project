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
	wire [15:0] winc,w1,wout,w2,w3,outreg;
Inc16 inc0(in,winc);
Mux16 m0(winc,0,reset,w1);
    Mux16 m1(wout,in,load,w2);
    or(inc,reset,w3);
    Mux16 m3(w2,w1,w3,outreg);
    Register r1(clk,outreg,load,wout);
	assign out=wout;
endmodule
