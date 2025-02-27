module FSM
(
input logic clk, 
input logic n_rst,
input logic 1start,
input logic 10start,
input logic pause;
input logic clr;
output logic 10_run_push;
output logic 1_run_push;
output logic pause_push;
output logic clear_push;
); 

 typdef enum logic [2:0] {CLEAR, 1RUN, 10RUN, PAUSE} State;
 
 State currentState, nextState;


  always_ff @(posedge clk, negedge n_rst)
  
  if(!n_rst) currentState <= CLEAR;
  else currentState <= nextState;
  
  


  always_comb

   case(currentState)
    
    CLEAR: begin if(10start) nextState = 10RUN;
           else if(1start) nextState = 1RUN;
           else nextState = CLEAR;
           end 
    1RUN:  begin  if(pause) nextstate = PAUSE;
           else if (clr) nextState = CLEAR;
           else begin
             nextState = 1RUN
           end
    10RUN: begin  if(pause) nextState = PAUSE;
	   else if (clr) nextState = CLEAR;
           else  nextState = 10RUN
           end 
    PAUSE: begin if(1start) nextState = 1RUN;
           else if(10start) nextState = 10RUN;
           else if(rst) nextState = CLEAR;
           else nextState = PAUSE;
           end
   endcase
   
   default: nextState = CLEAR;
  
  
endmodule

