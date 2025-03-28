module top (
    input logic one_button, ten_button, pause_button, clear_button, clk,
    output logic [6:0] seg_0, seg_1
    // add other input/output as necessary
);

logic one_button_sync, ten_button_sync, pause_sync, clear_sync; //sync
logic ten_run_push, one_run_push, pause_push, clear_push; //fsm
logic n_rst = 1;

//for clock
logic div_enable = 1;
logic second_tick; //second tick provided by clock divider

//for counter
logic [7:0] bcd_num;


//button syncs
synch_edge_det sync_one (.clk(clk), .n_rst(n_rst), .async_in(one_button), .edge_flag(one_button_sync));
synch_edge_det sync_ten (.clk(clk), .n_rst(n_rst), .async_in(ten_button), .edge_flag(ten_button_sync));
synch_edge_det sync_pause (.clk(clk), .n_rst(n_rst), .async_in(pause_button), .edge_flag(pause_sync));
synch_edge_det sync_clear (.clk(clk), .n_rst(n_rst), .async_in(clear_button), .edge_flag(clear_sync));

//clock divider
timer clock_div (
    .clk(clk),
    .enable(div_enable),
    .n_rst(n_rst),
    .second_tick(second_tick)
);

//fsm state monitor
fsm fsm_inst1 (
    .onestart(one_button_sync), 
    .tenstart(ten_button_sync), 
    .pause(pause_sync), 
    .clr(clear_sync), 
    .n_rst(n_rst),
    .clk(clk), 
    .one_run_push(one_run_push), 
    .ten_run_push(ten_run_push), 
    .pause_push(pause_push),
    .clear_push(clear_push)
); 


//counter
bcd_counter counter (
    .second_tick(second_tick),
    .clear(clear_push),
    .nRST(n_rst),
    .clock(clk),
    .number(bcd_num)
);

//decoder 
decoder counter_decoder (
    .num(bcd_num),
    .seg0(seg_0),
    .seg1(seg_1)
);



/*
module fsm
(
input logic clk, 
input logic n_rst,
input logic onestart,
input logic tenstart,
input logic pause,
input logic clr,
output logic ten_run_push,
output logic one_run_push,
output logic pause_push,
output logic clear_push
); */


endmodule