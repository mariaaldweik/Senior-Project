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
reg [11:0] counter=0;
wire q1,q2;
DFF dff0(.clk(CLK),.in(~q1),.out(q1));
DFF dff1(.clk(q1),.in(~q2),.out(q2));
assign clk=q2;
always @(posedge CLK) 
begin
	if(counter>='d2000)
  reset<=1'b0;
	else
	begin
		counter<=counter+1;
  reset<=1'b1;
	end
	
end

	// Put your code here:

endmodule