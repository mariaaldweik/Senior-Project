/**
* 9 bit Shiftregister (shifts to right)
* if      (load == 1)  out[t+1] = in[t]
* else if (shift == 1) out[t+1] = out[t]>>1 | (inMSB<<8)
* (shift one position to right and insert inMSB as most significant bit)
*/

module BitShift9R(
	input clk,
	input [8:0] in,
	input inMSB,
	input load,
	input shift,
	output [8:0] out
);
reg [8:0] wout;
	always @(posedge clk)
		wout <= load?in:(shift?(wout>>1)|(inMSB<<8):wout);
assign out=wout;	




endmodule
