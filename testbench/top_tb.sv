
module top_tb();
    logic one_button, ten_button, pause_button, clear_button, clk;
    logic [6:0] seg_0, seg_1;

    top DUT (
        .one_button(one_button),
        .ten_button(ten_button),
        .pause_button(pause_button),
        .clear_button(clear_button),
        .clk(clk),
        .seg_0(seg_0),
        .seg_1(seg_1)
    );
endmodule