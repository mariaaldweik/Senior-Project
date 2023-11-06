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

  Mux4Way16 m1(w1,a,b,c,d,sel[1:0]);
  Mux4Way16 m2(w2,e,f,g,h,sel[1:0]);
  mux16 m3(out ,w1, w2, sel[2]);
endmodule
