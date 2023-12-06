/**
 * 16-bit multiplexor: 
 * for i = 0..15 out[i] = a[i] if sel == 0 
 *                        b[i] if sel == 1
 */

module Mux4Way16(
	input [15:0] a,
	input [15:0] b,
	input [15:0] c,
	input [15:0] d,
   	input [1:0] sel,
	output [15:0] out
);

wire [15:0] w1,w2;

	Mux16 m1(.a(a),.b(b),.sel(sel[0]),.out(w1));
	Mux16 m2(.a(c),.b(d),.sel(sel[0]),.out(w2));
	Mux16 m3(.a(w1),.b(w2),.sel(sel[1]),.out(out));

endmodule
