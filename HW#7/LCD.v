/*
 * LCD communicates with ILI9341V LCD controller over 4 wire SPI.
 * 
 * When load=1 and in[8]=0 transmission of byte in[7:0] is initiated.
 * CSX is goes low (and stays low even when transmission is completed).
 * DCX is set to in[9]. The byte in[7:0] is send to SDO bitwise together
 * with 8 clock signals on SCK. During transmission out[15] is 1.
 * After 16 clock cycles transmission is completed and out[15] is set to 0.
 * 
 * When load=1 and in[8]=1 CSX goes high and DCX=in[9] without transmission
 * of any bit.
 * 
 * When load16=1 transmission of word in[15:0] is initiated. CSX is goes low
 * (and stays low even when transmission is completed). DCX is set to 1 (data).
 * After 32 clock cycles transmission is completed and out[15] is set to 0.
*/

module LCD(
		input clk,			//clock 25 MHz
		input load,		    //start send command/byte over SPI
		input load16,		//start send data (16 bits)
		input [15:0] in,	//data to be send
		output [15:0] out,	//data to be send
		output DCX,			//SPI data/command not
		output CSX,			//SPI chip select not
		output SDO,			//SPI serial data out
		output SCK			//SPI serial clock
);

	
	reg[5:0] bits=0;
	reg d16=0;
        wire busy=|bits;
      
	always @(posedge clk)
		d16 <= load16?1:(load)?0:d16;	
	always @(posedge clk)
		bits <= (load&~in[8]|load16)?1:(((bits[4]&~d16)|bits[5])?0:(busy?bits+1:0));
	assign SCK=busy&~bits[0];
	assign out[15] = busy;
	reg [15:0] shift=0;
	always @(posedge clk)
		shift <= (load|load16)?in:(~SCK?shift:{shift[14:0],1'b0});
	assign out[14:0]=15'b0;
	reg ce_cmp=0;
	always @(posedge clk)
		ce_cmp<=(load|load16)?(load16|load&~in[8]):ce_cmp;
	 assign CSX = ~ce_cmp;
	reg DCX_cmp=0;
	always @(posedge clk)
		DCX_cmp <=load?in[9]:(load16)?1:DCX_cmp;
	assign DCX= DCX_cmp;
	assign SDO =(d16&shift[15])|(~d16&shift[7]);	

endmodule
