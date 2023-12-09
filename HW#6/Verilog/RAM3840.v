

module RAM3840(
	input clk,
	input [11:0] address,
	input [15:0] in,
	input load,
	output reg [15:0] out
);
wire [15:0] w0,w1,w2,w3,w4,w5,w6,w7;
reg wl0,wl1,wl2,wl3,wl4,wl5,wl6,wl7;
ram r0(.clk(clk),.address(address[7:0]),.in(in),.load(wl0),.out(out));
ram r1(.clk(clk),.address(address[7:0]),.in(in),.load(wl1),.out(out));
// Bank0



ram r2(.clk(clk),.address(address[7:0]),.in(in),.load(wl2),.out(out));
ram r3(.clk(clk),.address(address[7:0]),.in(in),.load(wl3),.out(out));
// Bank1



ram r4(.clk(clk),.address(address[7:0]),.in(in),.load(wl4),.out(out));
ram r5(.clk(clk),.address(address[7:0]),.in(in),.load(wl5),.out(out));
// Bank2




ram r6(.clk(clk),.address(address[7:0]),.in(in),.load(wl6),.out(out));
ram r7(.clk(clk),.address(address[7:0]),.in(in),.load(wl7),.out(out));
// Bank3


always@(posedge clk)
begin
    
case (address[11:8])
    4'd0:  wl0<=1;
    4'd1:  wl1<=1;
    4'd2:  wl2<=1;
    4'd3:  wl3<=1;
    4'd4:  wl4<=1;
    4'd5:  wl5<=1;
    4'd6:  wl6<=1;
    4'd7:  wl7<=1;
endcase
end

/*
always@(*)
begin
    
case (address[8])
    1'd0:  out<=w0;
    1'd1:  out<=w1;
endcase

case (address[9])
    1'd0:  out<=w3;
    1'd1:  out<=w4;
endcase

case (address[10])
    1'd0:  out<=w4;
    1'd1:  out<=w5;
endcase

case (address[11])
    1'd0:  out<=w6;
    1'd1:  out<=w7;
endcase



end
*/




endmodule