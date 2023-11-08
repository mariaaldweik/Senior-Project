module Xor16(SW,HEX0,HEX1,HEX2,HEX3);
input[7:0]SW;
output [0:6]HEX0,HEX1,HEX2,HEX3;
wire [3:0] a,b;
wire [15:0] out,outda,outdb;
assign a=SW [3:0] ;
assign b= SW [7:4];
assign e=1'b1;



   hex7seg hjhj (out[3:0], HEX0);
   hex7seg rythj (out[7:4], HEX1);
   hex7seg hjuoyj (out[11:8], HEX2);
  hex7seg rytu7uj (out[15:12], HEX3);
  decoder_4to16  adec(e,a,outda);
  decoder_4to16  bdec(e,b,outdb);
  Xor16bit a1(out,outda,outdb);

 

endmodule
	


module Xor16bit(out,a,b);
  input [15:0] a,b;
  output [15:0] out;
   
  xor  a0(out[0],a[0],b[0]);
  xor  a1(out[1],a[1],b[1]);
  xor  a2(out[2],a[2],b[2]);
  xor  a3(out[3],a[3],b[3]);
  xor  a4(out[4],a[4],b[4]);
  xor  a5(out[5],a[5],b[5]);
  xor  a6(out[6],a[6],b[6]);
  xor  a7(out[7],a[7],b[7]);
  xor  a8(out[8],a[8],b[8]);
  xor  a9(out[9],a[9],b[9]);
  xor  a10(out[10],a[10],b[10]);
  xor  a11(out[11],a[11],b[11]);
  xor  a12(out[12],a[12],b[12]);
  xor  a13(out[13],a[13],b[13]);
  xor  a14(out[14],a[14],b[14]);
  xor  a15(out[15],a[15],b[15]);
  
   
  
  
endmodule


module hex7seg (hex, display);
	input [3:0] hex;
	output [0:6] display;

	reg [0:6] display;

	/*
	 *       0  
	 *      ---  
	 *     |   |
	 *    5|   |1
	 *     | 6 |
	 *      ---  
	 *     |   |
	 *    4|   |2
	 *     |   |
	 *      ---  
	 *       3  
	 */
	always @ (hex)
		case (hex)
			4'h0: display = 7'b0000001;
			4'h1: display = 7'b1001111;
			4'h2: display = 7'b0010010;
			4'h3: display = 7'b0000110;
			4'h4: display = 7'b1001100;
			4'h5: display = 7'b0100100;
			4'h6: display = 7'b0100000;
			4'h7: display = 7'b0001111;
			4'h8: display = 7'b0000000;
			4'h9: display = 7'b0000100;
			4'hA: display = 7'b0001000;
			4'hb: display = 7'b1100000;
			4'hC: display = 7'b0110001;
			4'hd: display = 7'b1000010;
			4'hE: display = 7'b0110000;
			4'hF: display = 7'b0111000;
		endcase
endmodule

module decoder_4to16 (
	input  enable,
	input [3:0] binary_in,
	output reg [15:0] decoder_out
);

always @ (enable or binary_in)
begin
  if (enable) begin
    case (binary_in)
      4'h0 : decoder_out = 16'h0001;
      4'h1 : decoder_out = 16'h0002;
      4'h2 : decoder_out = 16'h0004;
      4'h3 : decoder_out = 16'h0008;
      4'h4 : decoder_out = 16'h0010;
      4'h5 : decoder_out = 16'h0020;
      4'h6 : decoder_out = 16'h0040;
      4'h7 : decoder_out = 16'h0080;
      4'h8 : decoder_out = 16'h0100;
      4'h9 : decoder_out = 16'h0200;
      4'hA : decoder_out = 16'h0400;
      4'hB : decoder_out = 16'h0800;
      4'hC : decoder_out = 16'h1000;
      4'hD : decoder_out = 16'h2000;
      4'hE : decoder_out = 16'h4000;
      4'hF : decoder_out = 16'h8000;
      default : decoder_out = 0;
    endcase
  end
  else begin
    decoder_out = 0;
  end
end
    
    endmodule
