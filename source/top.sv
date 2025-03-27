module top (
    input logic one_button, ten_button, pause_button, clear_button,
    // add other input/output as necessary
);

logic one_button_sync, ten_button_sync, pause_sync, clear_sync; //sync

logic ten_run_push, one_run_push, pause_push, clear_push; //fsm 


synch_edge_det sync_one (.clk(clk), .n_rst(n_rst), .async_in(one_button), .edge_flag(onestart));

synch_edge_det sync_ten (.clk(clk), .n_rst(n_rst), .async_in(ten_button), .edge_flag(tenstart));

synch_edge_det sync_pause (.clk(clk), .n_rst(n_rst), .async_in(pause_button), .edge_flag(pause));

synch_edge_det sync_clear (.clk(clk), .n_rst(n_rst), .async_in(clear_button), .edge_flag(clear));

fsm fsm_inst1 (.*)

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