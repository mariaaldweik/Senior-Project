/**
* Uses CLK of 100MHz to generate:
* internal clock signal clk with 25MHz and
* a reset signal of approx. 20us length
*/
//`default_nettype none
module Clock25_Reset20( 
    input CLK,			// external clock 100 MHz	
	output clk,			// internal clock 25 Mhz
	output reg reset 		// reset signal approx. 20us
);

wire q1,q2,w0,w1;
wire [15:0] outreg,w4;
assign w4=16'b0;
DFF dff0(.clk(CLK),.in(~q1),.out(q1));
DFF dff1(.clk(q1),.in(~q2),.out(q2));
assign clk=q2;

   Inc16 in0(.in(outreg),.out(w1));
 Register r0(.clk(CLK),.in(w1),.load(reset),.out(outreg));
  not (reset,outreg[11]);
 
endmodule



