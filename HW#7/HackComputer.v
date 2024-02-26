module HackComputer();

ROM rom(.pc(pc),.instruction(instruction));
CPU cpu(.clk(clk),.inM(inM),.instruction(instruction),.reset(reset),.outM(outM),.writeM(writeM),.addressM(addressM),.pc(pc));
Memory memory(.writeM(writeM),.outM(outM),.addressM(addressM),.inM(inM));


endmodule