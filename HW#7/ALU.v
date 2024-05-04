/**
 * The ALU (Arithmetic Logic Unit).
 * Computes one of the following functions:
 * x+y, x-y, y-x, 0, 1, -1, x, y, -x, -y, !x, !y,
 * x+1, y+1, x-1, y-1, x&y, x|y on two 16-bit inputs, 
 * according to 6 input bits denoted zx,nx,zy,ny,f,no.
 * In addition, the ALU computes two 1-bit outputs:
 * if the ALU output == 0, zr is set to 1; otherwise zr is set to 0;
 * if the ALU output < 0, ng is set to 1; otherwise ng is set to 0.
 */

// Implementation: the ALU logic manipulates the x and y inputs
// and operates on the resulting values, as follows:
// if (zx == 1) set x = 0        // 16-bit constant
// if (nx == 1) set x = !x       // bitwise not
// if (zy == 1) set y = 0        // 16-bit constant
// if (ny == 1) set y = !y       // bitwise not
// if (f == 1)  set out = x + y  // integer 2's complement addition
// if (f == 0)  set out = x & y  // bitwise and
// if (no == 1) set out = !out   // bitwise not
// if (out == 0) set zr = 1
// if (out < 0) set ng = 1

//`default_nettype none
module ALU(
	input [15:0] x,		// input x (16 bit)
	input [15:0] y,		// input y (16 bit)
    input zx, 				// zero the x input?
    input nx, 				// negate the x input?
    input zy, 				// zero the y input?
    input ny, 				// negate the y input?
    input f,  				// compute out = x + y (if 1) or x & y (if 0)
    input no, 				// negate the out output?
    output [15:0] out, 			// 16-bit output
    output zr, 				// 1 if (out == 0), 0 otherwise
    output ng 				// 1 if (out < 0),  0 otherwise
);
	// Put your code here:
wire [15:0] w0,w1,w2,w3,w4,w5,w6,w7,w8;
wire w13,w14,w15;
assign w0=16'h0000;
assign w8=y;

    Mux16 xm(x,w0,zx,w1);
    Mux16 ym(y,w0,zy,w2);

      Xor16 xinv(w3,w1,nx);
      Xor16 yinv(w4,w2,ny);

    

      Add16 adder(w3,w4,w5);
      And16 andxy(w3,w4,w6);
      Mux16 mf(w6,w5,f,w7);
      Xor16 mm(out,w7,no);
      Or8Way om(out[7:0],w13);
      Or8Way on(out[15:8],w14);
      or o(w15,w13,w14);
      not nout(zr,w15);
      assign ng=out[15];

endmodule