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
    	output [15:0] addressM,		// Address in data memory (of M) to read
    	output [15:0] pc			// address of next instruction
);
wire w1,w2,aLoad,AoM,wzr,wng,pass,pcload, ngzr,gt,jlt,jeq,jgt,ple;
wire [15:0] ouToAreg,woutM,outAreg,alubin,wDRegister,w100;
wire w0=1'b1;


      not(w1,instruction[15]);


      Mux16 m0(.a(woutM),.b(instruction),.sel(w1),.out(ouToAreg));  
  

      or(aLoad,instruction[5],w1);


      Register Areg(.clk(clk),.in(ouToAreg),.load(aLoad),.out(outAreg));
      assign addressM=outAreg;

      and(AoM,instruction[15],instruction[12]);  
  
     Mux16 m1(.a(outAreg),.b(inM),.sel(AoM),.out(alubin));

    


      and(w2,instruction[15],instruction[4]);  
  
      Register Dreg(.clk(clk),.in(woutM),.load(w2),.out(wDRegister));

    //ALU

      ALU alu0(.x(wDRegister),.y(alubin),.zx(instruction[11]),.nx(instruction[10]),.zy(instruction[9]),.ny(instruction[8]),.f(instruction[7]),.no(instruction[6]),.out(woutM),.zr(wzr),.ng(wng));
      assign outM=woutM;  

    //jump

      or(ngzr,wng,wzr);
 
      not(gt,ngzr);
      
     


      and(jlt,wng,instruction[2]);


      and(jeq,wzr,instruction[1]);

      and(jgt,gt,instruction[0]);


      or(ple,jlt,jeq);


      or(pass,jgt,ple);


    //PC
      and(pcload,instruction[15],pass);

      PC pc0(.clk(clk),.in(outAreg),.load(pcload),.inc(w0),.reset(reset),.out(pc));

      and(writeM,instruction[15],instruction[3]);


endmodule
