module Xor16(out,a,b);
  input [15:0] a,b;
  output [15:0] out;
   
  xor  a0(out[0],a[0],b[0]);
  xor  a1(out[1],a[1],b[1]);
  xor  a2(out[2],a[2],b[2]);
  xor  a3(out[3],a[3],b[3]);
  xor  a4(out[4],a[4],b[4]);
  xor  a5(out[5],a[5],b[5]);
  xor  a6(out[6],a[6],b[6]);
  xor  a7(out[7],a[7],b[7]);
  xor  a8(out[8],a[8],b[8]);
  xor  a9(out[9],a[9],b[9]);
  xor  a10(out[10],a[10],b[10]);
  xor  a11(out[11],a[11],b[11]);
  xor  a12(out[12],a[12],b[12]);
  xor  a13(out[13],a[13],b[13]);
  xor  a14(out[14],a[14],b[14]);
  xor  a15(out[15],a[15],b[15]);
  
   
  
  
endmodule


