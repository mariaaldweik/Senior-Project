/**
 * 16-bit multiplexor: 
 * for i = 0..15 out[i] = a[i] if sel == 0 
 *                        b[i] if sel == 1
 */

module Mux8Way16(
	input [15:0] a,
	input [15:0] b,
	input [15:0] c,
	input [15:0] d,
	input [15:0] e,
	input [15:0] f,
	input [15:0] g,
	input [15:0] h,
   	input [2:0] sel,
	output [15:0] out
);

  wire [15:0] w1,w2;

  Mux4Way16 m0(.a(a),.b(b),.c(c),.d(d),.sel(sel[1:0]),.out(w1));
  Mux4Way16 m1(.a(e),.b(f),.c(g),.d(g),.sel(sel[1:0]),.out(w2));
  Mux16 m2(.a(w1),.b(w2),.sel(sel[2]),.out(out));
endmodule
