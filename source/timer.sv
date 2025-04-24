module timer
	# (parameter FREQUENCY = 10_000_000, parameter TEN_FREQUENCY = 100_000_000
	)
	(
		input logic clk, 
		input logic enable,
		input logic ten_sec_enable, 
		input logic n_rst,
		output logic second_tick
	);


	logic [31:0] cycles;
	logic [31:0] threshold;
	
	assign threshold = (ten_sec_enable) ? TEN_FREQUENCY : FREQUENCY;
	
	always @(posedge clk, negedge n_rst) begin
		//reset timer
		if (n_rst == 0) begin
			cycles <= 0; 
			second_tick <= 0;
		end else if (enable == 1) begin // if timing is enabled
			//if we hit the frequency amount of clock cycles, output second tick
			if (cycles == threshold - 1) begin
				second_tick <= 1;
				cycles <= 0;
			end else begin
				//situation where we are inside of a 10 tick when we shouldnt be
				if (!ten_sec_enable && cycles > FREQUENCY) begin
					cycles <= cycles % FREQUENCY;
				end else begin
					cycles <= cycles + 1;
				end
				second_tick <= 0;
			end
		end
	end 
endmodule
