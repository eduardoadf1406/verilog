	module PIPO (data_out, clk, load, data_in);
	input [15:0] data_in;
	input load, clk;
	output reg [15:0] data_out;

	always @ (posedge clk)	
		if (load) data_out <= data_in;
	endmodule
