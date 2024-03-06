module FPGAtest(keypad,CLK,reset,hex1,hex2,hex3,hex4);
input [7:0] keypad;
input CLK;
input reset;
output [7:0] hex1,hex2,hex3,hex4;
wire [15:0] num1,num2;
wire [5:0] oparation;
wire [15:0] instruction,addressM,pc,inM,outM,oparationn,w2,w3,w4,w5,w6;
wire writeM,clk,w1;

assign w1=1;
assign w2=16'b0000;
assign w3=16'b0001;
assign w6=16'b0010;
assign w4=16'b0011;
Clock25_Reset20 clock(CLK,clk,reset);
keypadd key(keypad,num1,oparationn,num2,oparation);
Memory memory2(.writeM(w1),.outM(num1),.addressM(w2),.inM(inM));
Memory memory3(.writeM(w1),.outM(num2),.addressM(w3),.inM(inM));
Memory memory4(.writeM(w1),.outM(oparation),.addressM(w6),.inM(inM));
Memory memory5(.writeM(w1),.outM(oparationn),.addressM(w4),.inM(inM));
CPU cpu(.clk(clk),.inM(inM),.instruction(instruction),.reset(reset),.outM(outM),.writeM(writeM),.addressM(addressM),.pc(pc));
ROM rom(.pc(pc),.instruction(instruction));
Memory memory(.writeM(writeM),.outM(outM),.addressM(addressM),.inM(inM));

endmodule
