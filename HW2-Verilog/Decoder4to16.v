module Decoder4to16(
    input [3:0] in,
    input load,
    output  [15:0] out
	
	
);
wire w0,w1,w2,w3,w4;
//wire [15:0] wout;
not n0(w0,in[0]);
not n1(w1,in[1]);
not n2(w2,in[2]);
not n3(w3,in[3]);
and y0(out[0],w0,w1,w2,w3,load); 
and y1(out[1],in[0],w1,w2,w3,load); 
and y2(out[2],w0,in[1],w2,w3,load); 
and y3(out[3],in[0],in[1],w2,w3,load); 
and y4(out[4],w0,w1,in[2],w3,load); 
and y5(out[5],in[0],w1,in[2],w3,load); 
and y6(out[6],w0,in[1],in[2],w3,load); 
and y7(out[7],in[0],in[1],in[2],w3,load); 
and y8(out[8],w0,w1,w2,in[3],load);
and y9(out[9],in[0],w1,w2,in[3],load);
and y10(out[10],w0,in[1],w2,in[3],load);
and y11(out[11],in[0],in[1],w2,in[3],load);
and y12(out[12],w0,w1,in[2],in[3],load);
and y13(out[13],in[0],w1,in[2],in[3],load);
and y14(out[14],w0,in[1],in[2],in[3],load);
and y15(out[15],in[0],in[1],in[2],in[3],load);

endmodule