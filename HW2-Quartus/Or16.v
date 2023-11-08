/**
 * 16-bit bitwise And:
 * for i = 0..15: out[i] = (a[i] and b[i])
 */

module Or16(
	input [15:0] a,
	input [15:0] b,
	output [15:0] out
);


or Or0(out[0],a[0],b[0]);
or Or1(out[1],a[1],b[1]);
  or Or2(out[2],a[2],b[2]);
or Or3(out[3],a[3],b[3]);
or Or4(out[4],a[4],b[4]);
  or Or5(out[5],a[5],b[5]);
  or Or6(out[6],a[6],b[6]);
  or Or7(out[7],a[7],b[7]);
  or Or8(out[8],a[8],b[8]);
  or Or9(out[9],a[9],b[9]);
  or Or10(out[10],a[10],b[10]);
  or Or11(out[11],a[11],b[11]);
  or Or12(out[12],a[12],b[12]);
  or Or13(out[13],a[13],b[13]);
  or Or14(out[14],a[14],b[14]);
       or Or15(out[15],a[15],b[15]);


endmodule
