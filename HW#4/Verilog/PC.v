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
	inout  [15:0]out
);	
	wire [15:0] w1,w2,w3,w4,outreg;
	//reg [15:0] outreg;
	wire w0=16'h0001;
	wire[15:0] w5=16'h0000;

   Inc16 in0(.in(outreg),.out(w1));
	
    Mux16 m0(.a(outreg),.b(w1),.sel(inc),.out(w2));
	
   Mux16 m1(.a(w2),.b(in),.sel(load),.out(w3));
	
   Mux16 m2(.a(w3),.b(w5),.sel(reset),.out(w4));
	
   Register r0(.clk(clk),.in(w4),.load(w0),.out(outreg));
  assign out=outreg;

endmodule
