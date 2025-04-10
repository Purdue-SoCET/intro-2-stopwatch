module timer
	# (parameter FREQUENCY = 100_000_000, parameter TEN_FREQUENCY = 1_000_000_000
	)
	(
		input logic clk, 
		input logic enable,
		input logic ten_sec_enable, 
		input logic n_rst,
		output logic second_tick
	);


	logic [27:0] cycles;
	logic [27:0] threshold;
	
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
				second_tick <= 0;
				cycles <= cycles + 1;
			end
		end
	end 
endmodule
