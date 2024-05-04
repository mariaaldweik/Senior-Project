/**
 * 8-way Or: 
 * out = (in[0] or in[1] or ... or in[7])
 */

module Or8Way(
	input [7:0] in,
	output out
);

  wire w1,w2,w3,w4,w5,w6;
  or or2(w1,in[0],in[1]);
  or or3(w2,in[2],in[3]);
  or or4(w3,in[4],in[5]);
  or or5(w4,in[6],in[7]);
  or or6(w5,w1,w2);
  or or7(w6,w3,w4);
  or or8(out,w5,w6);
endmodule