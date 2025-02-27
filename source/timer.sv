module timer
	# (parameter FREQUENCY = 10_000_000
	)
	(
		input logic clk, 
		input logic enable,
		output logic second_tick
	);


	logic[25:0] cycles;
	
	always @(posedge clk) begin
		//if timing is enabled
		if (enable == 1) begin
			//if we hit the frequency amount of clock cycles, output second tick
			if (cycles == FREQUENCY) begin
				second_tick <= 1;
				cycles <= 0;
			end else begin
				second_tick <= 0;
			end
				
			cycles <= cycles + 1;
		end
	end 
endmodule
