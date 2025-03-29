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
output logic clear_push,
output logic [4:0] state
); 

  typedef enum logic [4:0] {CLEAR, ONERUN, TENRUN, PAUSE} State;
 
  State currentState, nextState;

  always_ff @(posedge clk, negedge n_rst)
     if(!n_rst) currentState <= CLEAR;
     else currentState <= nextState;
  always_comb

   case(currentState)
    
    CLEAR: begin if(tenstart) nextState = TENRUN;
           else if(onestart) nextState = ONERUN;
           else nextState = CLEAR;
           end 
    ONERUN:  begin  if(pause) nextState = PAUSE;
           else if (clr) nextState = CLEAR;
           else nextState = ONERUN;
           end
    TENRUN: begin  if(pause) nextState = PAUSE;
	   else if (clr) nextState = CLEAR;
           else  nextState = TENRUN;
           end 
    PAUSE: begin if(onestart) nextState = ONERUN;
           else if(tenstart) nextState = TENRUN;
           else if(clr) nextState = CLEAR;
           else nextState = PAUSE;
           end

   default: nextState = CLEAR;
    
   endcase 
    
   assign one_run_push = (currentState == ONERUN);
   assign ten_run_push = (currentState == TENRUN);
   assign pause_push = (currentState == PAUSE);
   assign clear_push = (currentState == CLEAR);
   assign state = currentState;
endmodule

