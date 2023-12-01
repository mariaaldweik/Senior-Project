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
wire [15:0] w1=0;
Mux16 m0(in,w1,reset,wout);
Bit b0(clk,wout[0],load,out[0]);
    Bit b1(clk,wout[1],load,out[1]);
    Bit b2(clk,wout[2],load,out[2]);
    Bit b3(clk,wout[3],load,out[3]);
    Bit b4(clk,wout[4],load,out[4]);
    Bit b5(clk,wout[5],load,out[5]);
    Bit b6(clk,wout[6],load,out[6]);
    Bit b7(clk,wout[7],load,out[7]);
    Bit b8(clk,wout[8],load,out[8]);
    Bit b9(clk,wout[9],load,out[9]);
    Bit b10(clk,wout[10],load,out[10]);
    Bit b11(clk,wout[11],load,out[11]);
    Bit b12(clk,wout[12],load,out[12]);
    Bit b13(clk,wout[13],load,out[13]);
    Bit b14(clk,wout[14],load,out[14]);
    Bit b15(clk,wout[15],load,out[15]);
endmodule
