

module Mux16way(
    input [15:0] A,
    input [15:0] B,
    input [15:0] C,
    input [15:0] D,
    input [15:0] E,
    input [15:0] F,
    input [15:0] G,
    input [15:0] H,
    input [15:0] I,
    input [15:0] J,
    input [15:0] K,
    input [15:0] L,
    input [15:0] M,
    input [15:0] N,
    input [15:0] O,
    input [15:0] P,
    input [3:0] sel,
    output [15:0] out    
);

 wire [15:0] w1,w2;
  
  Mux8Way16 a1(.a(A),.b(B),.c(C),.d(D),.e(E),.f(F),.g(G),.h(H),.sel(sel[2:0]),.out(w1));
  Mux8Way16 a2(.a(I),.b(J),.c(K),.d(L),.e(M),.f(N),.g(O),.h(P),.sel(sel[2:0]),.out(w2));
  Mux16 a3(.a(w1),.b(w2), .sel(sel[3]),.out(out));



    endmodule