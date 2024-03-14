`default_nettype none

module FPGAtest_tb;

  reg [15:0] instruction;
  reg CLK = 0;
 

  wire [1:0] led;
  wire [15:0] pc;

  FPGAtest uut (led, CLK, instruction, pc);
  
  // Clock generation
  always #5 CLK = ~CLK;

  // Reset generation
  

  // Instruction execution
  always @(posedge CLK) begin
     
      case(pc)
        16'd0: instruction = 16'b0111111111111111;
        16'd1: instruction = 16'b1110110000010000;
        16'd2: instruction = 16'b0001000000000000;
        16'd3: instruction = 16'b1110001100001000;
        
        
      endcase
    end
  

  // Testbench setup
  initial begin
    $dumpfile("FPGAtest_tb.vcd");
    $dumpvars(0, FPGAtest_tb);

    $display("------------------------");
    $display("Testbench: CPU");
    $display("------------------------");
    #100000000 $finish ;
  end

endmodule
