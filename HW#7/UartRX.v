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
wire w2,w12,wclearbaud,busy,w100,wclearall,wload;
wire [15:0] w0,w216,wbaud,wbits,w108,wout,w14,wready,w20,w22;
wire [1:0] w21;
wire [8:0] data;
assign w0=0;
assign w216=16'd216;
assign w108=16'd9;
assign wready=16'b1000000000000000;
wire w7;
wire w11;

not(w100,RX);
or(w2,w100,clear,wclearall);
Bit s(clk,w100,w2,busy);




And16 aa(w216,wbaud,w20);
and(w21[0],w20[3],w20[6]);
and(w21[1],w20[4],w20[7]);
and(w7,w21[0],w21[1]);



And16 ab(w108,wbits,w22);
and(w11,w22[3],w22[0]);





or(wclearbaud,w7,clear);
or(wclearall,clear,w11);
PC bud(clk,w0,w0[0],busy,wclearbaud,wbaud);
PC bits(clk,w0,w0[0],w7,wclearall,wbits);


DFF in(clk,RX,w12);
BitShift9R ss(clk,w0[8:0],w12,clear,w7,data);


assign wout[6:0]=data[6:0];
assign wout[15:7]=0;
Mux16 r(wout,wready,clear,w14);
or(wload,clear,w11);
Register x(clk,w14,wload,out);
	

endmodule
