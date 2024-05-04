/**
 * UartTX controls transmission of bytes over UART.
 *
 * When load = 1 the chip starts serial transmission of the byte in[7:0] to the
 * TX line according to the protocoll 8N1 with 115200 baud. During transmission
 * out[15] is set to high (busy). The transmission is finished after 2170 clock 
 * cycles (10 byte a 217 cycle each). When transmission completes out[15] goes
 * low again (ready). 
 */
module UartTX(
	input clk,
	input load,
	input [15:0] in,
	output TX,
	output [15:0] out
);

reg [9:0] uart=10'b1111111111;
	reg [15:0] baudrate = 0;
	reg [15:0] bits = 0;
	wire is216=(baudrate==216);
	reg [15:0] wout=0;
	always @(posedge clk)
		wout <=load?16'h8000:(bits==9)&is216?16'd0:wout;
     assign out=wout;
	always @(posedge clk)
		bits <= (load)?0:is216?bits+1:bits;
	always @(posedge clk)
		baudrate <= (is216?0:wout?baudrate+1:baudrate);
	always @(posedge clk)
		uart <= (load)?((in<<2)|1):(is216?{1'b1,uart[9:1]}:uart);
	
	assign TX = uart[1];
endmodule
