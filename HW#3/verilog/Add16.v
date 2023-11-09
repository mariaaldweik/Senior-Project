module Add16(
	input [15:0] a,
	input [15:0] b,
	output [15:0] out
);
wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16;
    HalfAdder h1(out[0],w1,a[0],b[0]);
    FullAdder f1(out[1],w2,a[1],b[0],w1);
     FullAdder f2(out[2],w3,a[2],b[0],w2);
     FullAdder f3(out[3],w4,a[3],b[0],w3);
 FullAdder f4(out[4],w5,a[0],b[4],w4);
 FullAdder f5(out[5],w6,a[0],b[5],w5);
 FullAdder f6(out[6],w7,a[0],b[6],w6);
 FullAdder f7(out[7],w8,a[0],b[7],w7);
 FullAdder f8(out[8],w9,a[0],b[8],w8);
 FullAdder f9(out[9],w10,a[0],b[9],w9);
 FullAdder f10(out[10],w11,a[0],b[10],w10);
 FullAdder f11(out[11],w12,a[0],b[11],w11);
 FullAdder f12(out[12],w13,a[0],b[12],w12);
 FullAdder f13(out[13],w14,a[0],b[13],w13);
 FullAdder f14(out[14],w15,a[0],b[14],w14);
 FullAdder f15(out[15],w16,a[0],b[15],w15);
   
endmodule

