module keypadd(keypad,hex1,hex2,hex3,oparation);
input [7:0] keypad;
output reg [5:0] oparation;
output reg [15:0] hex1,hex2,hex3;
always @ (keypad)
begin
		case (keypad)
		    8'b00010100: hex1 = 16'd0; //0
		   	8'b10001000: hex1 = 16'd1; //1
		   	8'b10000100: hex1 = 16'd2; //2
		   	8'b10000010: hex1 = 16'd3; //3
		   	8'b01001000: hex1 = 16'd4; //4
		   	8'b01000100: hex1 = 16'd5; //5
		   	8'b01000010: hex1 = 16'd6; //6
		   	8'b00101000: hex1 = 16'd7; //7
		    8'b00100100: hex1 = 16'd8; //8
		   	8'b00100010: hex1 = 16'd9; //9
		   
			
		endcase
     if(keypad==8'b00010010)   //#	
       begin
                   case (keypad)
                        8'b10000001:begin oparation = 6'b000010; hex2  = 16'b0001000; end // x+y  //A
		      	8'b01000001:begin oparation = 6'b010011; hex2  = 16'b1100000; end // x-y   B
		      	8'b01000001:begin oparation = 6'b010101; hex2  = 16'b0110001; end // x|y   //C
		  	8'b00100001:begin oparation = 6'b000000; hex2  = 16'b1000010; end // x&y   //D
                   endcase
      end
   if(keypad==8'b00011000 )  //*
       begin
                   case (keypad)
                        8'b00010100: hex3 = 16'd0; //0
		   	8'b10001000: hex3 = 16'd1; //1
		   	8'b10000100: hex3 = 16'd2; //2
		   	8'b10000010: hex3 = 16'd3; //3
		   	8'b01001000: hex3 = 16'd4; //4
		   	8'b01000100: hex3 = 16'd5; //5
		   	8'b01000010: hex3 = 16'd6; //6
		   	8'b00101000: hex3 = 16'd7; //7
		        8'b00100100: hex3 = 16'd8; //8
		   	8'b00100010: hex3 = 16'd9; //9
                   endcase
      end

end

endmodule


         