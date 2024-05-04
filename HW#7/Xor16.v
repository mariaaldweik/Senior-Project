module Xor16(out,a,b);
  input [15:0] a;
  input b;
  output [15:0] out;
   
  xor  a0(out[0],a[0],b);
  xor  a1(out[1],a[1],b);
  xor  a2(out[2],a[2],b);
  xor  a3(out[3],a[3],b);
  xor  a4(out[4],a[4],b);
  xor  a5(out[5],a[5],b);
  xor  a6(out[6],a[6],b);
  xor  a7(out[7],a[7],b);
  xor  a8(out[8],a[8],b);
  xor  a9(out[9],a[9],b);
  xor  a10(out[10],a[10],b);
  xor  a11(out[11],a[11],b);
  xor  a12(out[12],a[12],b);
  xor  a13(out[13],a[13],b);
  xor  a14(out[14],a[14],b);
  xor  a15(out[15],a[15],b);
  
   
  
  
endmodule