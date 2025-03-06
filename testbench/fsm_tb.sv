module tb_fsm();
  logic clk;
  logic n_rst;
  logic onestart;
  logic tenstart;
  logic pause;
  logic clr;
  logic ten_run_push;
  logic one_run_push;
  logic pause_push;
  logic clear_push;

  //tb_state_e currentState, nextState;


  always begin 
    clk = 0;
    #(50ns);
    clk = 1;
    #(50ns);
  end 

  fsm fsm_dut(.*);

 initial begin
     $dumpfile ("fsm.vcd");
     $dumpvars;
    end

  initial begin 
   n_rst = 1;
   onestart = 0; 
   tenstart = 0;
   pause = 0; 
   clr = 0;
    
   #(5ns);
   n_rst = 0;
   repeat(2) @(negedge clk);
   n_rst = 1; 
  
   @(negedge clk);
   onestart = 1; 
   repeat(2) @(negedge clk);
   if(one_run_push == 1) begin
     $display ("Called 1_run_push");
   end
   clr = 1; 
   onestart = 0;
   $display ("One Start Ended");
   
   repeat(2) @(negedge clk);
   if(clear_push == 1) begin
     $display ("CLEARED!");
   end
   $display ("Ten Start Started");
   clr = 0;
   tenstart = 1;
   repeat(2) @(negedge clk);
   if(ten_run_push == 1) begin
     $display ("Called 10_run_push");
   end
   $display ("Ten Started Ended");
   
   repeat(2) @(negedge clk);
   tenstart = 0;
   pause = 1;
   repeat(2) @(negedge clk);
   if(pause_push == 1) begin
      $display ("Called pause_push");
   end
   repeat(2) @(negedge clk);
   pause = 0;
   clr = 1;
   repeat(2) @(negedge clk);
   $display (pause_push);
   $finish;
  end


endmodule
