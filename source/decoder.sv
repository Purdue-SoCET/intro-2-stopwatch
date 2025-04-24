module decoder (
    input  logic [7:0] num,   
    output logic [7:0] seg1,  
    output logic [7:0] seg0   
);

logic [3:0] tens, units;
assign tens  = num[7:4];
assign units = num[3:0];

digits tens_decoder(.in(tens), .out(seg1));
digits units_decoder(.in(units), .out(seg0));

endmodule

module digits(
    input logic [3:0] in,    
    output logic [7:0] out
);                           

assign out = ~(
  (in == 4'd0) ? 8'b0111111 : 
  (in == 4'd1) ? 8'b0000110 :
  (in == 4'd2) ? 8'b1011011 : 
  (in == 4'd3) ? 8'b1001111 : 
  (in == 4'd4) ? 8'b1100110 : 
  (in == 4'd5) ? 8'b1101101 : 
  (in == 4'd6) ? 8'b1111101 : 
  (in == 4'd7) ? 8'b0000111 : 
  (in == 4'd8) ? 8'b1111111 : 8'b1100111);
endmodule