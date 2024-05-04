/**
 * GO switches from boot to run mode.
 */
module GO(
	input clk,
	input load,
	input [15:0] pc,
	input [15:0] sram_addr,
	output [15:0] SRAM_ADDR,
	input [15:0] sram_data,
	input [15:0] ROM_data,
	output [15:0] instruction
);
	reg run;
        always @(posedge clk)
		if (pc>=256) run <=1;
	assign instruction=run?sram_data:ROM_data;

endmodule
