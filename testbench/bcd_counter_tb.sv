module bcd_counter_tb ();

    logic [7:0] num;
    logic enable = 1;
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

    task run_reset();
        nRST = 0;
        advance_clock(); 
        nRST = 1; 
    endtask

    timer t1 (.clk(clk), .enable(enable), .n_rst(nRST), .second_tick(second_tick));
    bcd_counter DUT (.second_tick(second_tick), .clear(clear), .nRST(nRST), .clock(clk), .number(num));

    initial begin
        //give us a second tick
        $display("Beginning test 1: 10 second ticks");
        for (int i=0; i < 100_000_000; i++) begin 
            advance_clock();
        end

        if (num[7:4] == 4'b1 && num[3:0] == 4'b0) begin
            $display("Passed test 1!");
        end

    
        //test 2, reset
        $display("Beginning test 2: reset");
        run_reset();

        if (num == 8'b0) begin
            $display("Passed test 2!");
        end

    end

endmodule