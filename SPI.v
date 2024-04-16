/**
 
 * When load=1 transmission of byte in[7:0] is initiated. The byte is send to
 * MOSI (master out slave in) bitwise together with 8 clock signals on SCK.
 * At the same time the SPI recieves a byte at MISO (master in slave out).
 * Sampling of MISO is done at rising edge of SCK and shiftingis done at
 */ 

module SPI(
	input clk,
	input load,
	input [15:0] in,
	output [15:0] out,
	output  CSX,
	output SDO,
	input SDI,
	output SCK
);
wire w0=1;
reg wCSX=1;
	  reg[4:0] bits=0;
           wire busy=|bits;
	 assign SCK= busy&~bits[0];
	
	always @(posedge clk)
		bits <= (load&~in[8])?1:((bits==16)?0:(busy?bits+1:0));
	reg [7:0] shift=0;
	assign out = {busy,7'd0,shift};
	
	reg miso_s;
	always @(posedge clk)
		miso_s <= SDI;
	always @(posedge clk)
		shift <= load?in[7:0]:(~SCK?shift:{shift[6:0],miso_s});
	
	always @(posedge clk)
		 wCSX<=load?in[8]:wCSX;
	assign CSX=wCSX;
	assign SDO=shift[7];	



endmodule
