/**
 * The Hack CPU (Central Processing unit), consisting of an ALU,
 * two registers named A and D, and a program counter named PC.
 * The CPU is designed to fetch and execute instructions written in 
 * the Hack machine language. In particular, functions as follows:
 * Executes the inputted instruction according to the Hack machine 
 * language specification. The D and A in the language specification
 * refer to CPU-resident registers, while M refers to the external
 * memory location addressed by A, i.e. to Memory[A]. The inM input 
 * holds the value of this location. If the current instruction needs 
 * to write a value to M, the value is placed in outM, the address 
 * of the target location is placed in the addressM output, and the 
 * writeM control bit is asserted. (When writeM==0, any value may 
 * appear in outM). The outM and writeM outputs are combinational: 
 * they are affected instantaneously by the execution of the current 
 * instruction. The addressM and pc outputs are clocked: although they 
 * are affected by the execution of the current instruction, they commit 
 * to their new values only in the next time step. If reset==1 then the 
 * CPU jumps to address 0 (i.e. pc is set to 0 in next time step) rather 
 * than to the address resulting from executing the current instruction. 
 */

//`default_nettype none
module CPU(
		input clk,
    	input [15:0] inM,         	// M value input  (M = contents of RAM[A])
    	input [15:0] instruction, 	// Instruction for execution
		input reset,				// Signals whether to re-start the current
                         			// program (reset==1) or continue executing
                         			// the current program (reset==0).

    	output [15:0] outM,			// M value output
    	output writeM,				// Write to M? 
    	output [14:0] addressM,		// Address in data memory (of M) to read
    	output [14:0] pc			// address of next instruction
);
wire w1,w2,w3,w4,w5,w6,w7,w8,aLoad,AoM,wzr,wng,pass,pcload;
wire [15:0] ouToAreg,woutM,outAreg,alubin,wDRegister;

	// Put your code here:
	// Compare	
   not(w1,instruction[15]);
    Mux16 m0(woutM,instruction,w1,ouToAreg);
    or(aLoad,instruction[5],w1);
    ADRegister Areg(clk,ouToAreg,reset,aLoad,outAreg);  //A register
	assign addressM=outAreg[0:14];
    and(AoM,instruction[15],instruction[12]);
    Mux16 m1(outAreg,inM,AoM,alubin);

    


    and(w2,instruction[15],instruction[4]);
    ADRegister Dreg(clk,woutM,reset,w2,wDRegister);

    //ALU
    ALU alu(wDRegister,alubin,instruction[11],instruction[10],instruction[9],instruction[8],instruction[7],instruction[6],outM,wzr,wng);
    

    //jump
    or(w3,wng,wzr); //w3=nqzr
    not(w4,w3); //w4=gt
    and(w5,wng,instruction[2]); //w5=jlt
    and(w6,wzr,instruction[1]); //w6=jeq
    and(w7,w4,instruction[0]); //w7=jgt
    or(w8,w5,w6); //w8=ple
    or(pass,w8,w7); 

    //PC
    and(pcload,instruction[15],pass);
    PC pc0(clk,outAreg,pcload,1,reset,pc);
    and(writeM,instruction[15],instruction[3]);

endmodule
