
module top_tb();
    logic one_button, ten_button, pause_button, clear_button, clk;
    logic [6:0] seg_0, seg_1;
    logic [7:0] bcd_num;
    logic [4:0] fsm_state;


    
    task advance_clock();
		#(1);
		clk = 1'b1;
		#(1);
		clk = 1'b0;
	endtask
    
    task press_one_button();
        $display("Pressed 1 button!");
        one_button = 1'b1;
        for (int i=0; i < 1_000_000; i++) begin
            advance_clock();
        end 
        one_button = 1'b0;
    endtask
 
    task press_ten_button();
        $display("Pressed 10 button!");
        ten_button = 1'b1;
        for (int i=0; i < 1_000_000; i++) begin
            advance_clock();
        end 
        ten_button = 1'b0;
    endtask
    
    task press_pause_button();
        $display("Pressed pause button!");
        pause_button = 1'b1;
        for (int i=0; i < 1_000_000; i++) begin
            advance_clock();
        end 
        pause_button = 1'b0;
    endtask

    task press_clear_button();
        $display("Pressed clear button!");
        clear_button = 1'b1;
        for (int i=0; i < 1_000_000; i++) begin
            advance_clock();
        end 
        clear_button = 1'b0;
    endtask

    task pass_seconds(int seconds); 
        for (int i=0; i < seconds * 10_000_000; i++) begin
            advance_clock();
        end 
    endtask

    top DUT (
        .one_button(one_button),
        .ten_button(ten_button),
        .pause_button(pause_button),
        .clear_button(clear_button),
        .clk(clk),
        .seg_0(seg_0),
        .seg_1(seg_1),
        .bcd_num(bcd_num),
        .fsm_state(fsm_state)
    );

    //testcases
    initial begin
        $display("Begin test: count to 5");
        press_one_button();
        for (int a = 0; a < 5; a++) begin
            pass_seconds(1);
            $display("%d: %b %b %b", a+1, seg_1, seg_0, bcd_num);
        end

        $display("\n\nBegin test: pause");
        press_pause_button();
        for (int a = 0; a < 5; a++) begin
            pass_seconds(1);
            $display("%d: %b %b %b", 5, seg_1, seg_0, bcd_num);
        end

        $display("\nBegin test: unpause");
        press_one_button();
        for (int a = 0; a < 5; a++) begin 
            pass_seconds(1);
            $display("%d: %b %b %b", a+5, seg_1, seg_0, bcd_num);
        end

        $display("\nBegin test: ten-second-mode");
        press_clear_button(); 
        press_ten_button();
        for (int a = 0; a < 50; a++) begin 
            pass_seconds(1);
            $display("%d: %b %b %b", a+1, seg_1, seg_0, bcd_num);
        end
    end
endmodule