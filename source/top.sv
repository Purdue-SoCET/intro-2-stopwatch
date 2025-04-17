module top (
    input logic [3:0] BTN,
    input logic CLK_100MHZ,
    output logic [15:0] LED,
    output logic D0_AN_0,
    output logic D0_AN_1,
    output logic D0_AN_2,
    output logic D0_AN_3,
    output logic [7:0] D0_SEG
    // add other input/output as necessary
);

logic one_button_sync, ten_button_sync, pause_sync, clear_sync; //sync
logic ten_run_push, one_run_push, pause_push, clear_push; //fsm
logic n_rst = 1;
logic clk;
logic [4:0] fsm_state;
logic [6:0] seg_0, seg_1;
logic [7:0] bcd_num;
logic [3:0] D0_AN;

//for clock
logic second_tick; //second tick provided by clock divider

//for counter
//logic [7:0] bcd_num;


//button syncs
synch_edge_det sync_one (.clk(clk), .n_rst(n_rst), .async_in(BTN[0]), .edge_flag(one_button_sync));
synch_edge_det sync_ten (.clk(clk), .n_rst(n_rst), .async_in(BTN[1]), .edge_flag(ten_button_sync));
synch_edge_det sync_pause (.clk(clk), .n_rst(n_rst), .async_in(BTN[2]), .edge_flag(pause_sync));
synch_edge_det sync_clear (.clk(clk), .n_rst(n_rst), .async_in(BTN[3]), .edge_flag(clear_sync));


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
    .clear_push(clear_push),
    .state(fsm_state)
); 

//clock divider
timer clock_div (
    .clk(clk),
    .enable(~pause_push),
    .ten_sec_enable(ten_run_push), 
    .n_rst(n_rst),
    .second_tick(second_tick)
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


seg_scan digit_scanner(
    .clk(clk),
    .num_0(seg_0),
    .num_1(seg_1),
    .seg_out(D0_SEG),
    .seg_enable(D0_AN)
);

assign clk = CLK_100MHZ;
assign D0_SEG[7] = 1;
assign D0_AN_0 = D0_AN[1];
assign D0_AN_1 = D0_AN[0];
assign D0_AN_2 = 1;
assign D0_AN_3 = 1;
assign LED[15:9] = seg_1;
assign LED[7:0] = seg_0;

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