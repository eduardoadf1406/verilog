	module booth_testbench;
	
	reg [15:0] data_in;
	reg clk, start;
	wire count;
	wire [31:0] product;

	booth_datapath DP (ldA, ldQ,ldM,clrA,clrQ,clrff,sftA,sftQ,addsub,decr,ldcnt,data_in,clk,qm1,eqz,ldff);
	controller CON (ldA,clrA, sftA,ldQ,clrQ,sftQ,eqz,ldM,clrff,addsub,start,decr,ldcnt,done,clk,DP.Q[0],qm1,ldff);

	initial
	begin
		CON.state = 3'b000;
		clk = 1'b0;
		#3 start = 1'b1;
		#1000 $finish;
	end

	always #5 clk = ~clk;

	initial
	begin
		#11 data_in = 16'b1000000000000110; // M value
		#10 data_in = 16'b0000000000001101; // Q value
	end
	
	assign product = {DP.A,DP.Q}; 

	initial
	begin
		$monitor ($time, "%b  %b  %b %d", DP.A, DP.Q, DP.qm1, DP.count );
		$dumpfile ("booth.vcd"); $dumpvars (0, booth_testbench);
	end
	endmodule	 
