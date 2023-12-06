/** 
 * Multiplexor:
 * out = a if sel == 0
 *       b otherwise
 */

module Mux(
	input a,
	input b,
	input sel,
	output out
);

wire w1,w2,w3;
  nand Nand1(w1,sel,b);
  nand Nan2(w2,sel,sel);
  nand Nan3(w3,a,w2);
  nand Nand4(out,w1,w3);


endmodule
