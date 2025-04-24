module seg_scan
    # (parameter PERIOD = 10_000
    )
    (
        input logic clk,
        input logic [7:0] num_0,
        input logic [7:0] num_1,
        output logic [7:0] seg_out,
        output logic [3:0] seg_enable
    );
    

    //65565 Clock cycles for funsies, about 2kHZ switching frequency
    logic [15:0] period_counter; 
    logic ctrl = 0;

    always @(posedge clk) begin 
        //if hit period, restart counter and switch digit
        if (period_counter == PERIOD - 1) begin
            period_counter <= 16'b0;
            ctrl <= ~ctrl; 
        end else begin
            period_counter <= period_counter + 1;
        end
    end


    //switch number shown
    assign seg_out = (ctrl) ? num_1 : num_0;

    //switch digit
    assign seg_enable = (ctrl) ? 4'b1101: 4'b1110;

endmodule
