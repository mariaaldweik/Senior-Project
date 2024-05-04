`timescale 1ns / 1ps
module FPGAtest_tb;

  // Inputs
  reg CLK;
  // Outputs
  wire DCX,SDO,SCK,CSX,read,SDI;
 

  // Instantiate the accumulator module
  FPGAtest uut (
    .DCX(DCX),
    .SDO(SDO),
.SCK(SCK),
.CSX(CSX),
.ready(ready),
.CLK(CLK),
.SDI(SDI)
  );
  // Test case
  initial begin
    // Initialize inputs


always #2 CLK=~CLK;
 
    $finish;
  end

endmodule
