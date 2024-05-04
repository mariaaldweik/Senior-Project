/**
 * Adds two 16-bit values.
 * The most significant carry bit is ignored.
 * out = a + b (16 bit)
 */

//`default_nettype none
module Add16(
	input [15:0] a,
	input [15:0] b,
	output [15:0] out
);
wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16;

HalfAdder h0(.a(a[0]),.b(b[0]),.sum(out[0]),.carry(w1));
FullAdder f0(.a(a[1]),.b(b[1]),.c(w1),.sum(out[1]),.carry(w2));
FullAdder f1(.a(a[2]),.b(b[2]),.c(w2),.sum(out[2]),.carry(w3));
FullAdder f2(.a(a[3]),.b(b[3]),.c(w3),.sum(out[3]),.carry(w4));
FullAdder f3(.a(a[4]),.b(b[4]),.c(w4),.sum(out[4]),.carry(w5));
FullAdder f4(.a(a[5]),.b(b[5]),.c(w5),.sum(out[5]),.carry(w6));
FullAdder f5(.a(a[6]),.b(b[6]),.c(w6),.sum(out[6]),.carry(w7));
FullAdder f6(.a(a[7]),.b(b[7]),.c(w7),.sum(out[7]),.carry(w8));
FullAdder f7(.a(a[8]),.b(b[8]),.c(w8),.sum(out[8]),.carry(w9));
FullAdder f8(.a(a[9]),.b(b[9]),.c(w9),.sum(out[9]),.carry(w10));
FullAdder f9(.a(a[10]),.b(b[10]),.c(w10),.sum(out[10]),.carry(w11));
FullAdder f10(.a(a[11]),.b(b[11]),.c(w11),.sum(out[11]),.carry(w12));
FullAdder f11(.a(a[12]),.b(b[12]),.c(w12),.sum(out[12]),.carry(w13));
FullAdder f12(.a(a[13]),.b(b[13]),.c(w13),.sum(out[13]),.carry(w14));
FullAdder f13(.a(a[14]),.b(b[14]),.c(w14),.sum(out[14]),.carry(w15));
FullAdder f14(.a(a[15]),.b(b[15]),.c(w15),.sum(out[15]),.carry(w16));

endmodule