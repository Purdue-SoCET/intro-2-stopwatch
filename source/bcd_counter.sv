module bcd_counter
 # (paramater SIZE = 7)
(
  input logic second_tick,
  input clear,
  input nRST,
  input clock,
  output [SIZE-1:0] number

)

logic[SIZE - 1:0] count_reg;
logic[SIZE - 1:0] next_count_reg;
logic rollover;
logic rollover_or_clear;
logic[SIZE - 1:0] adder_output; 

always_comb begin
  increment_val = 1;

  adder_output = count_reg;

  if second_tick begin
    adder_output = count_reg + increment_val;
  end

  if (count_reg == 99) begin
    rollover = 1;
  end

  rollover_or_clear = rollover || clear;

  next_count_reg = !rollover_or_clear && adder_output;
end

always_ff @(posedge clock, negedge nRST) begin
  if(!nRST) begin
    count_reg <= 0; 
  end

  else begin
    count_reg <= next_count_reg;
  end
end

assign number = count_reg; 

endmodule