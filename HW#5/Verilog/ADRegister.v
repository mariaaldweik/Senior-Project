/**
 * 16-bit register:
 * If load[t] == 1 then out[t+1] = in[t]
 * else out does not change
 */

//`default_nettype none

module ADRegister(
	input clk,
	input [15:0] in,
    input reset,
	input load,
	output [15:0] out
);
wire [15:0] wout;
Mux16 m0(in,0,reset,wout);
Bit b0(clk,in[0],load,wout[0]);
    Bit b1(clk,in[1],load,wout[1]);
    Bit b2(clk,in[2],load,wout[2]);
    Bit b3(clk,in[3],load,wout[3]);
    Bit b4(clk,in[4],load,wout[4]);
    Bit b5(clk,in[5],load,wout[5]);
    Bit b6(clk,in[6],load,wout[6]);
    Bit b7(clk,in[7],load,wout[7]);
    Bit b8(clk,in[8],load,wout[8]);
    Bit b9(clk,in[9],load,wout[9]);
    Bit b10(clk,in[10],load,wout[10]);
    Bit b11(clk,in[11],load,wout[11]);
    Bit b12(clk,in[12],load,wout[12]);
    Bit b13(clk,in[13],load,wout[13]);
    Bit b14(clk,in[14],load,wout[14]);
    Bit b15(clk,in[15],load,wout[15]);
endmodule
