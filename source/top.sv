module top (
    input logic one_button, ten_button, pause, clear,
    // add other input/output as necessary
);

logic one_button_sync, ten_button_sync, pause_sync, clear_sync;

synch_edge_det sync_one (.clk(clk), .n_rst(n_rst), .async_in(one_button), .edge_flag(one_button_sync));

synch_edge_det sync_ten (.clk(clk), .n_rst(n_rst), .async_in(ten_button), .edge_flag(tem_button_sync));

synch_edge_det sync_pause (.clk(clk), .n_rst(n_rst), .async_in(pause), .edge_flag(pause_sync));

synch_edge_det sync_clear (.clk(clk), .n_rst(n_rst), .async_in(clear), .edge_flag(clear_sync));




endmodule