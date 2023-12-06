/**
* RAM256 implements 256 Bytes of RAM addressed from 0 - 255
* out = M[address]
* if (load =i= 1) M[address][t+1] = in[t]
*/

`default_nettype none
module ram(
	input clk,
	input [7:0] address,
	input [15:0] in,
	input load,
	output reg [15:0] out
);
	
	 parameter addr_width = 8;	
	// No need to implement this chip
	// RAM is implemented using BRAM of iCE40
	reg [15:0] mem [(1<<addr_width)-1:0] ;
	always @(posedge clk)
     begin
     if (load)
     mem[(address)] <= in;
     out  = mem[address]; // Output register controlled by clock.
     end

endmodule

