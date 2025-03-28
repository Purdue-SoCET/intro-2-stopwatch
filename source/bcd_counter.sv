module bcd_counter
 # (parameter SIZE = 8)
(
  input logic second_tick,
  input clear,
  input nRST,
  input clock,
  output [SIZE-1:0] number
);

  logic[SIZE - 1:0] count_reg;
  logic[SIZE - 1:0] next_count_reg;
  logic rollover;
  logic rollover_or_clear;
  logic[SIZE - 1:0] adder_output; 

  always_comb begin
    adder_output = count_reg;

    if (second_tick) begin
      if (count_reg[3:0] == 4'd9) begin
        adder_output = {adder_output[7:4] + 4'b1, 4'b0};
      end else begin
        adder_output = adder_output + 8'b1;
      end

    end

    if (count_reg == 8'd99) 
      rollover = 1;
    else 
      rollover = 0; 

    
    rollover_or_clear = rollover || clear;

    if (!rollover_or_clear)
      next_count_reg = adder_output;
    else
      next_count_reg = 0;
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