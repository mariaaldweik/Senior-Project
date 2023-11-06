/**
 * Demultiplexor:
 * {a, b} = {in, 0} if sel == 0
 *          {0, in} if sel == 1
 */

module DMux(
	input in,
	input sel,
    output a,
	output b
);
wire w1,w2,w3;
    
       nand Nand1(w1,sel,sel);
       nand Nand2(w2,in,w1);
       nand Nand3(w3,in,sel);
       nand Nand4(a,w2,w2);
       nand Nand5(b,w3,w3);
       


endmodule
