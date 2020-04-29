	module booth_datapath (ldA, ldQ, ldM, clrA, clrQ, clrff, sftA, sftQ,addsub,decr,ldcnt,data_in,clk,qm1,eqz,ldff);

	input ldA, ldQ, ldM, clrA, clrQ, clrff, sftA, sftQ, addsub, clk, decr, ldcnt, ldff;
	input [15:0] data_in;
	output qm1, eqz;
	wire [15:0] A, M, Q, Z;
	wire [4:0] count;

	assign eqz = ~|count; // if bits are all 0, eqz = 1

	shiftreg AR (A, Z, A[15], clk, ldA, clrA, sftA);
	shiftreg QR (Q, data_in, A[0], clk, ldQ, clrQ, sftQ);
	dff QM1 (Q[0], qm1, ldff, clk, clrff); 
	PIPO MR (M, clk, ldM, data_in);
	ALU AS (Z, A, M, addsub);
	counter CN (count, decr, ldcnt, clk);
	endmodule
