
module SPI(
        input clk,
	input load,
	input [15:0] in,
	output [15:0] out,
	output CSX,
	output SDO,
	input SDI,
	output reg SCK
);

reg [7:0] shiftreg;
reg [3:0] counter;
reg sampling;
reg shifting;

always @(posedge clk) begin
    if (load) begin
        shiftreg <= in;
        counter <= 4'b0000;
        sampling <= 1'b1;
        shifting <= 1'b0;
        SCK <= 1'b0;
    end else begin
        if (counter == 4'b1000) begin
          counter <= 4'b0000;
            sampling <= 1'b0;
            shifting <= 1'b1;
        end else if (sampling) begin
            counter <= counter + 1;
            SCK <= ~SCK;
        end else if (shifting) begin
            counter <= counter + 1;
            shiftreg <= {shiftreg[6:0], SDI};
            SCK <= ~SCK;
        end
    end
end

assign out = shiftreg;
assign CSX = load;
assign SDO = shiftreg[7];

endmodule
