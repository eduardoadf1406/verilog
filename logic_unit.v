	module logic_unit (out, ena, A, B);
	input A, B;
	input [2:0] ena;
	output [2:0] out;
	wire AandB, AorB, invB;

	and (AandB, A, B);
	or  (AorB, A, B);
	not (invB, B);

	and (out[0], AandB, ena[0]);
	and (out[1], AorB, ena[1]);
	and (out[2], invB, ena[2]);
	endmodule
