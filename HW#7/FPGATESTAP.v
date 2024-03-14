module FPGAtest(output wire [1:0] led,input wire CLK);
wire [15:0] addressM,inM,outM,pc,instruction;
wire writeM,reset;
wire loadRAM,loadIO0,loadIO1,loadIO2,loadIO3,loadIO4,loadIO5,loadIO6,loadIO7,loadIO8,loadIO9,loadIOA,loadIOB,loadIOC,loadIOD,loadIOE,loadIOF;
wire [15:0] inRAM,inIO0,inIO1,inIO2,inIO3,inIO4,inIO5,inIO6,inIO7,inIO8,inIO9,inIOA,inIOB,inIOC,inIOD,inIOE,inIOF;

 
Clock25_Reset20 clock(CLK,clk,reset);
CPU cpu(.clk(clk),.inM(inM),.instruction(instruction),.reset(reset),.outM(outM),.writeM(writeM),.addressM(addressM),.pc(pc));
ROM rom(.pc(pc),.instruction(instruction));
MemoryDecoder memdec(.address(addressM),
	.load(writeM),
	.out(inM),
	.loadRAM(loadRAM),
	.loadIO0(loadIO0),
	.loadIO1(loadIO1),
	.loadIO2(loadIO2),
	.loadIO3(loadIO3),
	.loadIO4(loadIO4),
	.loadIO5(loadIO5),
	.loadIO6(loadIO6),
	.loadIO7(loadIO7),
	.loadIO8(loadIO8),
	.loadIO9(loadIO9),
	.loadIOA(loadIOA),
	.loadIOB(loadIOB),
	.loadIOC(loadIOC),
	.loadIOD(loadIOD),
	.loadIOE(loadIOE),
	.loadIOF(loadIOF),
	.inRAM(inRAM),
	.inIO0(inIO0),
	.inIO1(inIO1),
	.inIO2(inIO2),
	.inIO3(inIO3),
	.inIO4(inIO4),
	.inIO5(inIO5),
	.inIO6(inIO6),
	.inIO7(inIO7),
	.inIO8(inIO8),
	.inIO9(inIO9),
	.inIOA(inIOA),
	.inIOB(inIOB),
	.inIOC(inIOC),
	.inIOD(inIOD),
	.inIOE(inIOE),
	.inIOF(inIOF));




RAM3840 ram3840(.clk(clk),.address(addressM[11:0]),.in(outM),.load(loadRAM),.out(inRAM));
Register LED(.clk(clk),.in(outM),.load(loadIO0),.out(inIO0));
Register BUTTON(.clk(clk),.in(outM),.load(loadIO1),.out(inIO1));
Register UART_TX(.clk(clk),.in(outM),.load(loadIO2),.out(inIO2));
Register UART_RX(.clk(clk),.in(outM),.load(loadIO3),.out(inIO3));
Register SPI(.clk(clk),.in(outM),.load(loadIO4),.out(inIO4));
Register SRAM_ADDR(.clk(clk),.in(outM),.load(loadIO5),.out(inIO5));
Register SRAM_DATA(.clk(clk),.in(outM),.load(loadIO6),.out(inIO6));
Register GO(.clk(clk),.in(outM),.load(loadIO7),.out(inIO7));
Register LCD8(.clk(clk),.in(outM),.load(loadIO8),.out(inIO8));
Register LCD16(.clk(clk),.in(outM),.load(loadIO9),.out(inIO9));
Register RTP(.clk(clk),.in(outM),.load(loadIOA),.out(inIOA));
Register DEBUG0(.clk(clk),.in(outM),.load(loadIOB),.out(inIOB));
Register DEBUG1(.clk(clk),.in(outM),.load(loadIOC),.out(inIOC));
Register DEBUG2(.clk(clk),.in(outM),.load(loadIOD),.out(inIOD));
Register DEBUG3(.clk(clk),.in(outM),.load(loadIOE),.out(inIOE));
Register DEBUG4(.clk(clk),.in(outM),.load(loadIOF),.out(inIOF));

assign led[0]=inIO0[0];
assign led[1]=inIO0[1];

endmodule
