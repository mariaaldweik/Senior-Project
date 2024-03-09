module FPGAtest(CLK,result);
input CLK;
output [15:0] result ;
wire [15:0] instruction,addressM,pc,inM,outM,oparationn;
wire writeM,clk,reset;
Clock25_Reset20 clock(CLK,clk,reset);
CPU cpu(.clk(clk),.inM(inM),.instruction(instruction),.reset(reset),.outM(outM),.writeM(writeM),.addressM(addressM),.pc(pc));
ROM rom(.pc(pc),.instruction(instruction));
Memory memory(.clk(clk),.writeM(writeM),.outM(outM),.addressM(addressM),.inM(inM),.result(result));
endmodule
