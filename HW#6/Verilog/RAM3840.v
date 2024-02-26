

module RAM3840(
	input clk,
	input [11:0] address,
	input [15:0] in,
	input load,
	output  [15:0] out
);
wire [15:0] w0,w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15;
wire [15:0] wl;
Decoder4to16 d0(.in(address[11:8]),.load(load),.out(wl));
Mux16way m0(.A(w0),.B(w1),.C(w2),.D(w3),.E(w4),.F(w5),.G(w6),.H(w7),.I(w8),.J(w9),.K(w10),.L(w11),.M(w12),.N(w13),.O(w14),.P(w15),.sel(address[11:8]),.out(out));

ram r0(.clk(clk),.address(address[7:0]),.in(in),.load(wl[0]),.out(w0));
ram r1(.clk(clk),.address(address[7:0]),.in(in),.load(wl[1]),.out(w1));
ram r2(.clk(clk),.address(address[7:0]),.in(in),.load(wl[2]),.out(w2));
ram r3(.clk(clk),.address(address[7:0]),.in(in),.load(wl[3]),.out(w3));

//bank0 

ram r4(.clk(clk),.address(address[7:0]),.in(in),.load(wl[4]),.out(w4));
ram r5(.clk(clk),.address(address[7:0]),.in(in),.load(wl[5]),.out(w5));
ram r6(.clk(clk),.address(address[7:0]),.in(in),.load(wl[6]),.out(w6));
ram r7(.clk(clk),.address(address[7:0]),.in(in),.load(wl[7]),.out(w7));

// Bank1

ram r8(.clk(clk),.address(address[7:0]),.in(in),.load(wl[8]),.out(w8));
ram r9(.clk(clk),.address(address[7:0]),.in(in),.load(wl[9]),.out(w9));
ram r10(.clk(clk),.address(address[7:0]),.in(in),.load(wl[10]),.out(w10));
ram r11(.clk(clk),.address(address[7:0]),.in(in),.load(wl[11]),.out(w11));

// Bank2

ram r12(.clk(clk),.address(address[7:0]),.in(in),.load(wl[12]),.out(w12));
ram r13(.clk(clk),.address(address[7:0]),.in(in),.load(wl[13]),.out(w13));
ram r14(.clk(clk),.address(address[7:0]),.in(in),.load(wl[14]),.out(w14));
//ram r15(.clk(clk),.address(address[7:0]),.in(in),.load(wl[15]),.out(w15));

//Bank3


endmodule