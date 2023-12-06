`default_nettype none
module CPU_tb();

	// IN,OUT
	reg clk=1;
    reg [15:0] inM=0;
   	reg [15:0] instruction=0;
	reg reset=1;
    wire [15:0] outM;
    wire writeM;
    wire [15:0] addressM;
    wire [15:0] pc;
	reg [15:0] n = 0;
	reg [4:0] counter=0;
	// Part
	CPU CPU(
		.clk(clk),
		.inM(inM),
		.instruction(instruction),
		.reset(reset),
		.outM(outM),
		.writeM(writeM),
		.addressM(addressM),
		.pc(pc)
	);

	// Simulation
	always #1 clk=~clk;
	always @(posedge clk) begin
		inM <= $random;
              //inM <= 'b1110110100000110; 
		reset <= (n<=10) || ((n>20) && (n<40));
		instruction[15:12] <= $random;	
		instruction[5:0] <= $random;
		counter<=counter+1;
	/*	if(instruction[12]==1)
		begin
			
			case (counter)
		3'd0:instruction[11:6] <= 'd48;
		3'd1:instruction[11:6] <='d49;
		3'd2:instruction[11:6] <='d51;
		3'd3:instruction[11:6] <='d55;
		3'd4:instruction[11:6] <='d50;
		3'd5:instruction[11:6] <='d2;
		3'd6:instruction[11:6] <='d19;
		3'd7:instruction[11:6] <='d7;
		3'd8:instruction[11:6] <='d0;
		3'd9:instruction[11:6] <='d21;
		default:instruction[11:6] <='d21;
			endcase
		
		end
		*/
		//else
		//begin
		case(counter)
		3'd0:instruction[11:6] <='d42;
		3'd1:instruction[11:6] <='d63;
		3'd2:instruction[11:6] <='d58;
		3'd3:instruction[11:6] <='d12;
		3'd4:instruction[11:6] <='d48;
		3'd5:instruction[11:6] <='d13;
		3'd6:instruction[11:6] <='d49;
		3'd7:instruction[11:6] <='d15;
		3'd8:instruction[11:6] <='d51;
		3'd9:instruction[11:6] <='d31;
		3'd10:instruction[11:6] <='d55;
		3'd11:instruction[11:6] <='d14;
		3'd12:instruction[11:6] <='d50;
		3'd13:instruction[11:6] <='d2;
		3'd14:instruction[11:6] <='d19;
		3'd15:instruction[11:6] <='d7;
		3'd16:instruction[11:6] <='d0;
		3'd17:instruction[11:6] <='d21;
		default:instruction[11:6] <='d21;

	endcase
		//end
	end

	// Compare	
	reg [15:0] addressM_cmp=0;
	reg [15:0] regD=0;
	reg [15:0] pc_cmp=0;
	reg zx,nx,zy,ny,f,no;
	wire [15:0] out_cmp;
	wire [15:0] x,y;
	wire zr,ng;

	assign x = instruction[10]?(instruction[11]?~0:~regD):(instruction[11]?0:regD);
	assign y = instruction[8]?(instruction[9]?~0:~(instruction[12]?inM:addressM_cmp)):(instruction[9]?0:(instruction[12]?inM:addressM_cmp));
	assign out_cmp = instruction[6]?(instruction[7]?~(x+y):~(x&y)):(instruction[7]?(x+y):(x&y));
	wire comp;
	wire jmp;
	//assign comp = instruction[15] && instruction[14] && instruction[13];
	assign comp = instruction[15];
	assign zr = (out_cmp==0);
	assign ng = out_cmp[15];
	assign jmp = comp && ((ng&&instruction[2])||(zr&&instruction[1])||(~(ng|zr)&&instruction[0]));
	always @(posedge clk) begin
		addressM_cmp <= comp?(instruction[5]?out_cmp:addressM_cmp) : instruction;
		regD <= comp?(instruction[4]?out_cmp:regD) : regD;
		pc_cmp <= reset?0 : (jmp?addressM_cmp:pc_cmp+1);
	end
	wire writeM_cmp;
	assign writeM_cmp = comp?instruction[3]:0;
	
	reg fail = 0;
	
	task check;
		#1
		if( instruction[15]==0)
		begin
		if ((pc != pc_cmp) || (addressM != addressM_cmp) || (writeM != writeM_cmp)) 
			begin
				$display("FAIL: clk=%1b, inM=%16b, instruction=%16b, reset=%1b, out_cmp=%16b, writeM_cmp=%1b, addressM_cmp=%16b, pc_cmp=%16b",clk,inM,instruction,reset,out_cmp,writeM_cmp,addressM_cmp,pc_cmp);
				$display("FAIL: clk=%1b, inM=%16b, instruction=%16b, reset=%1b, outM=%16b, writeM=%1b, addressM=%16b, pc=%16b",clk,inM,instruction,reset,outM,writeM,addressM,pc);
				fail=1;
			end
		end
		else if(instruction[15]==1)
		begin
        if ((pc != pc_cmp) || (addressM != addressM_cmp) || (outM != out_cmp) || (writeM != writeM_cmp)) 
			begin
				$display("FAIL: clk=%1b, inM=%16b, instruction=%16b, reset=%1b, out_cmp=%16b, writeM_cmp=%1b, addressM_cmp=%16b, pc_cmp=%16b",clk,inM,instruction,reset,out_cmp,writeM_cmp,addressM_cmp,pc_cmp);
				$display("FAIL: clk=%1b, inM=%16b, instruction=%16b, reset=%1b, outM=%16b, writeM=%1b, addressM=%16b, pc=%16b",clk,inM,instruction,reset,outM,writeM,addressM,pc);
				fail=1;
			end
		end
	endtask
	
	// Test  
  	initial begin
  		$dumpfile("CPU_tb.vcd");
  		$dumpvars(0, CPU_tb);
		
		$display("------------------------");
		$display("Testbench: CPU");

		for (n=0; n<1000;n=n+1) 
			check();
		
		if (fail==0) $display("passed");
		$display("------------------------");
		$finish;
	end

endmodule
