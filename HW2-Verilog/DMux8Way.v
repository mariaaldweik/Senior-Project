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

   wire w1,w2,w3,w5,w4,w6;


  DMux dm1 (.in(in),.sel(sel[2]),.a(w1),.b(w2));
  DMux dm2 (.in(w1),.sel(sel[1]),.a(w3),.b(w4));
  DMux dm3 (.in(w2),.sel(sel[1]),.a(w5),.b(w6));
  DMux dm4 (.in(w3),.sel(sel[0]),.a(a),.b(b));
  DMux dm5 (.in(w4),.sel(sel[0]),.a(c),.b(d));
  DMux dm6 (.in(w5),.sel(sel[0]),.a(e),.b(f));
  DMux dm7 (.in(w6),.sel(sel[0]),.a(g),.b(h));
  
endmodule
