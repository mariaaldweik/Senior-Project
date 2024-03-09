module FPGAtest(CLK,leds);
input CLK;
output [1:0] leds ;
wire [15:0] instruction,addressM,pc,inM,outM;
wire writeM,clk,reset;
Clock25_Reset20 clock(CLK,clk,reset);
CPU cpu(.clk(clk),.inM(inM),.instruction(instruction),.reset(reset),.outM(outM),.writeM(writeM),.addressM(addressM),.pc(pc));
ROM rom(.pc(pc),.instruction(instruction));
Memory memory(.clk(clk),.writeM(writeM),.outM(outM),.addressM(addressM),.inM(inM));
assign leds=inM[1:0];
endmodule
