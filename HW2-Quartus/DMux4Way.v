/**
 * 4-way demultiplexor:
 * {a, b, c, d} = {in, 0, 0, 0} if sel == 00
 *                {0, in, 0, 0} if sel == 01
 *                {0, 0, in, 0} if sel == 10
 *                {0, 0, 0, in} if sel == 11
 */

module DMux4Way(
	input in,
	input [1:0] sel,
    output a,
	output b,
	output c,
	output d
);
	
   wire w1 ,w2;
  DMux Dm1 (w1,w2,in,sel[1]);
  DMux Dm2 (a,b,w1,sel[0]);
  DMux dm3 (c,d,w2,sel[0]);
endmodule
