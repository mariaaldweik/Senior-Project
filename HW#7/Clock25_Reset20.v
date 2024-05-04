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

wire q1,q2,wreset,w7,w00;
wire [15:0] w1,w4,outreg,w5,w2;
wire [15:0] w0;
wire [15:0] w10;
DFF dff0(.clk(CLK),.in(~q1),.out(q1));
DFF dff1(.clk(q1),.in(~q2),.out(q2));
assign clk=q2;
assign w00=1'b0;

assign w10=16'b0000100000000000;
assign w0=16'b0;
assign w7=1'b1;

 Inc16 in0(.in(w0),.out(w1));

 Inc16 in1(.in(outreg),.out(w2));

  	
  Mux16 m2(.a(w1),.b(w2),.sel(wreset),.out(w4));

  Mux16 m3(.a(w4),.b(w10),.sel(outreg[11]),.out(w5));

 Register r0(.clk(CLK),.in(w5),.load(w7),.out(outreg));

  not n1(wreset,outreg[11]);
assign reset = wreset;
  
endmodule
