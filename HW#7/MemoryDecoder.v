/**
 * The complete address space of the Hack computer's memory,
 * including RAM and memory-mapped I/O. 
 * The chip facilitates read and write operations, as follows:
 *     Read:  out(t) = Memory[address(t)](t)
 *     Write: if load(t-1) then Memory[address(t-1)](t) = in(t-1)
 * In words: the chip always outputs the value stored at the memory 
 * location specified by address. If load==1, the in value is loaded 
 * into the memory location specified by address. This value becomes 
 * available through the out output from the next time step onward.
 * Address space rules:
 * RAM 0x0000 - 0x0EFF (3840 words)
 * IO  0x1000 - 0x100F (maps to 16 different devices)
 * The behavior of IO addresses is described in 06_IO-Devices
 */

module MemoryDecoder(
	input [15:0] address,
	input load,
	output [15:0] out,
	output loadRAM,
	output loadIO0,
	output loadIO1,
	output loadIO2,
	output loadIO3,
	output loadIO4,
	output loadIO5,
	output loadIO6,
	output loadIO7,
	output loadIO8,
	output loadIO9,
	output loadIOA,
	output loadIOB,
	output loadIOC,
	output loadIOD,
	output loadIOE,
	output loadIOF,
	input [15:0] inRAM,
	input [15:0] inIO0,
	input [15:0] inIO1,
	input [15:0] inIO2,
	input [15:0] inIO3,
	input [15:0] inIO4,
	input [15:0] inIO5,
	input [15:0] inIO6,
	input [15:0] inIO7,
	input [15:0] inIO8,
	input [15:0] inIO9,
	input [15:0] inIOA,
	input [15:0] inIOB,
	input [15:0] inIOC,
	input [15:0] inIOD,
	input [15:0] inIOE,
	input [15:0] inIOF
);

wire [15:0] wout;
	// Put your code here:

and(loadRAM,~address[12],load);
// RAM Load


nor(loadIO0,~address[12],address[3],address[2],address[1],address[0],~load);
//LED Load


nor(loadIO1,~address[12],address[3],address[2],address[1],~address[0],~load);
// BUTTON Load



nor(loadIO2,~address[12],address[3],address[2],~address[1],address[0],~load);
// TX Load


and(loadIO3,address[12],~address[3],~address[2],address[1],address[0],load);
// RX Load


nor(loadIO4,~address[12],address[3],~address[2],address[1],address[0],~load);
// SPI Load


and(loadIO5,address[12],~address[3],address[2],~address[1],address[0],load);
// SRAM_ADDR Load


and(loadIO6,address[12],~address[3],address[2],address[1],~address[0],load);
// SRAM_DATA Load


and(loadIO7,address[12],~address[3],address[2],address[1],address[0],load);
// GO Load


nor(loadIO8,~address[12],~address[3],address[2],address[1],address[0],~load);
// LCD8 Load


and(loadIO9,address[12],address[3],~address[2],~address[1],address[0],load);
// LCD16 Load


and(loadIOA,address[12],address[3],~address[2],address[1],~address[0],load);
// RTP Load


and(loadIOB,address[12],address[3],~address[2],address[1],address[0],load);
// DEBUG0 Load


and(loadIOC,address[12],address[3],address[2],~address[1],~address[0],load);
// DEBUG1 Load


and(loadIOD,address[12],address[3],address[2],~address[1],address[0],load);
// DEBUG2 Load


and(loadIOE,address[12],address[3],address[2],address[1],~address[0],load);
// DEBUG3 Load

and(loadIOF,address[12],load,address[0],address[1],address[2],address[3]);
// DEBUG4 Load


Mux16way m0(.A(inIO0),.B(inIO1),.C(inIO2),.D(inIO3),.E(inIO4),.F(inIO5),.G(inIO6),.H(inIO7),.I(inIO8),.J(inIO9),.K(inIOA),.L(inIOB),.M(inIOC),.N(inIOD),.O(inIOE),.P(inIOF),.sel(address[3:0]),.out(wout));
Mux16 m1(.a(inRAM),.b(wout),.sel(address[12]),.out(out));
endmodule