module tb_timer();
	localparam FREQUENCY = 10_000_000;
	localparam MAX_SECONDS = 10;

	
	logic clk;
	logic enable;
	logic n_rst;
	logic second_tick;
	logic [24:0] cycles;

	timer DUT(
		.clk,
		.enable,
		.n_rst,
		.cycles, 
		.second_tick
	);

	task advance_clock();
		#(1);
		clk = 1'b1;
		#(1);
		clk = 1'b0;
	endtask

	task reset_clock();
		n_rst = 1;
		#(1);
		n_rst = 0;
	endtask

	integer i;
	initial begin
		enable = 1;
		
		$display("Running test 1: 1 second");
		for (int a = 1; a <= 10_000_000; a++) begin
			advance_clock();
			if (second_tick == 1)
				if (a + i == 10_000_000)
					$display("Passed test 1!");
		end


		//reset clock
		//TEST 2 - RESET
		//TEST 2 - FULL
		$display("Running test 2: reset test");
		reset_clock();
		if (second_tick == 0)
			$display("Passed test 2!");
			

		$display("Running test 3: 10 seconds");
		for (int b = 0; b < 100_000_000; b=b+1) begin
			advance_clock();
		end

	
		if (second_tick == 1)
			$display("Passed test 3!");
		else
			$display("cycles: %d", cycles);

	end
endmodule
