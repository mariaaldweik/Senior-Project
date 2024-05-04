/**
 * UartRX receives bytes over UART
 *
 * When clear = 1 the chip clears the receive buffer and is ready to receive
 * next byte. out[15] is set to 1 to show, that chip is ready to receive next
 * byte. When RX goes low the chip starts sampling the RX line. After reading
 * of byte completes, chip ouputs the received byte to out[7:0]] with out[15]=0.
 */

module UartRX(
	input clk,
	input clear,
	input RX,
	output [15:0] out

);
wire run,w2,w3,winc,w12,wstop;
wire [15:0] w0,w216,wbaud,wbits,w108,wout,w14,wready,count10;
wire [8:0] data;
assign w0=0;
assign run=0;
assign winc=1;
assign w216=16'd216;
assign w108=16'd108;
assign wready=16'b1000000000000000;
reg w7=0;
reg w11=0;
reg stop=0;
reg wten=0;
reg wresetb=0;
or(w2,RX,clear);
Bit s(clk,RX,w2,w3);

//And16 is(w216,wbaud,w4);
//and(w5,w4[7],w4[6]);
//and(w6,w4[4],w4[3]);
//and(w7,w5,w6);



//And16 iss(w108,wbits,w8);
//and(w9,w8[6],w8[5]);
//and(w10,w8[3],w8[2]);
//and(w11,w9,w10);
always@(posedge clk)begin
if(wbaud==216)
w7=1;
if(wbaud!=216)
w7=0;
end
always@(posedge clk)begin
if(wbits==108)begin
w11=1;
wresetb=1;
end
if(wbits!=108)begin
w11=0;
wresetb=0;
end

if(count10==1080)begin
wten=1;
stop=1;

end
if(count10!=1080)begin
wten=0;
stop=0;

end

end

not(wstop,w3);
PC bud(clk,w0,w0[0],w3,w7,wbaud);
PC bits(clk,w0,w0[0],w7,wresetb,wbits);
PC count(clk,w0,w0[0],w7,wten,count10);
/*PC(
	input clk,
	input [15:0] in,
	input load,
	input inc,
	input reset,
	output  [15:0]out
);	
*/

DFF in(clk,RX,w12);
BitShift9R ss(clk,w0[8:0],w12,w0[0],w11,data);


assign wout[7:0]=data[7:0];
assign wout[15:8]=0;
Mux16 r(wout,wready,clear,w14);
 Register x(clk,w14,stop,out);

	

endmodule
//(load&~out_tx) // start
//out_tx// busy
