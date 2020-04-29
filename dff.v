	module dff (d, q, ldff, clk, clr);
	input d, clk, clr, ldff;
	output reg q;

	always @ (posedge clk)
		if(clr) q<=0;
		else if(ldff) q <= d;
	endmodule
  
