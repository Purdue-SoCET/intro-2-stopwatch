module tb_timer();
	localparam FREQUENCY = 10_000_000;
	localparam MAX_SECONDS = 10;

	
	logic clk;
	logic enable;
	logic second_tick;

	timer DUT(
		.clk,
		.enable,
		.second_tick
	);

	task advance_clock();
		#(1);
		clk = 1'b1;
		#(1);
		clk = 1'b0;
	endtask

	initial begin
		enable = 1;
		
		for (int i=0; i < 9_999_950; i++) begin 
			//advance clock
			advance_clock();
		end

		for (int a = 0; a < 100; a++) begin
			advance_clock();
			if (second_tick == 1) begin
				$display("%d tick!", a+9_999_950);
			end else begin
				$display("%d tock!", a+9_999_950);
			end
		end
	end
endmodule
