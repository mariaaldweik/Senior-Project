module and4way(
output out,
input a,
input b,
input c,
input d
	
);
wire w0,w1;
and(w0,a,b);
and(w1,c,d);
and(out,w1,w0);
endmodule