module bcd_counter_tb ();

    logic [7:0] num;
    logic enable;
    logic clear;
    logic nRST = 1;
    logic clk;
    logic second_tick = 1;

	task advance_clock();
		#(1);
		clk = 1'b1;
		#(1);
		clk = 1'b0;
	endtask

    timer t1 (.clk(clk), .enable(enable), .n_rst(nRST), .second_tick(second_tick));
    bcd_counter DUT (.second_tick(second_tick), .clear(clear), .nRST(nRST), .clock(clk), .number(num));

    initial begin
        //give us a second tick
        for (int i=0; i < 20_000_000; i++) begin 
            advance_clock();
            
            if (second_tick == 1) begin
                $display("Binary representation: %b, Decimal representation %d%d", num, num[7:4], num[3:0]);
            end
        end

    end

endmodule