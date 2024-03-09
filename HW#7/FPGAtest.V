module FPGAtest(CLK,reset,num1,num2,result);
input CLK;
input reset;
output [15:0] num1,num2,result ;
wire [15:0] instruction,addressM,pc,inM,outM,oparationn;
wire writeM,clk;
Clock25_Reset20 clock(CLK,clk,reset);
CPU cpu(.clk(clk),.inM(inM),.instruction(instruction),.reset(reset),.outM(outM),.writeM(writeM),.addressM(addressM),.pc(pc));
ROM rom(.pc(pc),.instruction(instruction));
Memory memory(.clk(clk),.writeM(writeM),.outM(outM),.addressM(addressM),.inM(inM),.num1(num1),.num2(num2),.result(result));
endmodule
