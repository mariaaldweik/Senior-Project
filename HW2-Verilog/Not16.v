/**
 * 16-bit Not:
 * for i=0..15: out[i] = not in[i]
 */

module Not16(
	input [15:0] in,
	output [15:0] out
);

  not aa (out[0],in[0]);
  not ab (out[1],in[1]);
  not ac (out[2],in[2]);
  not ad (out[3],in[3]);
  not ae (out[4],in[4]);
  not af (out[5],in[5]);
  not ag (out[6],in[6]);
  not ah (out[7],in[7]);
  not ai (out[8],in[8]);
  not aj (out[9],in[9]);
  not ak (out[10],in[10]);
  not al (out[11],in[11]);
  not am (out[12],in[12]);
  not an (out[13],in[13]);
  not au(out[14],in[14]);
  not as (out[15],in[15]);
			  
endmodule
