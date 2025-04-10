module tb_seg_scan(); 

logic [7:0] num_0 = 8'b00000001;
logic [7:0] num_1 = 8'b00000010;
logic [7:0] num_out;
logic [3:0] enable;
logic clk;

task run_10000_cycles();
    for (int i = 0; i < 10_000; i++) begin
        clk = 1'b1;
        #(1);
        clk = 1'b0;
        #(1);
    end
endtask 

seg_scan DUT(.clk(clk), .num_0(num_0), .num_1(num_1), .seg_out(num_out), .seg_enable(enable));

initial begin

    $display("%b %b\n", num_out, enable); 
    run_10000_cycles();
    $display("%b %b\n", num_out, enable); 
    run_10000_cycles();
    $display("%b %b\n", num_out, enable); 
    run_10000_cycles();
end
endmodule