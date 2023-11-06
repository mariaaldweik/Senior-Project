/**
 * 8-way demultiplexor:
 * {a, b, c, d, e, f, g, h} = {in, 0, 0, 0, 0, 0, 0, 0} if sel == 000
 *                            {0, in, 0, 0, 0, 0, 0, 0} if sel == 001
 *                            etc.
 *                            {0, 0, 0, 0, 0, 0, 0, in} if sel == 111
 */

module DMux8Way(
	input in,
	input [2:0] sel,
    output a,
	output b,
	output c,
	output d,
	output e,
	output f,
	output g,
	output h
);

   wire w1,w2,w3,w5,w6;


  DMux dm1 (w1,w2,in,sel[2]);
  DMux dm2 (w3,w4,w1,sel[1]);
  DMux dm3 (w5,w6,w2,sel[1]);
  DMux dm4 (a,b,w3,sel[0]);
  DMux dm5 (c,d,w4,sel[0]);
  DMux dm6 (e,f,w5,sel[0]);
  DMux dm7 (g,h,w6,sel[0]);
  
endmodule
