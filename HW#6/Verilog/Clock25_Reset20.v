/**
* Uses CLK of 100MHz to generate:
* internal clock signal clk with 25MHz and
* a reset signal of approx. 20us length
*/
//`default_nettype none
module Clock25_Reset20( 
    input CLK,			// external clock 100 MHz	
	output clk,			// internal clock 25 Mhz
	output  reset 		// reset signal approx. 20us
);

wire q1,q2,w0,wreset;
wire [15:0] w1;
wire [15:0] outreg=16'h000C;
DFF dff0(.clk(CLK),.in(~q1),.out(q1));
DFF dff1(.clk(q1),.in(~q2),.out(q2));
assign clk=q2;

   Inc16 in0(.in(outreg),.out(w1));
 Register r0(.clk(clk),.in(w1),.load(wreset),.out(outreg));

  not (reset,outreg[9]);
 assign wreset=reset;
endmodule