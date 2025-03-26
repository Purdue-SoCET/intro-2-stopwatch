module decoder (
    input  logic [7:0] num,   
    output logic [6:0] seg1,  
    output logic [6:0] seg0   
);

logic [3:0] tens, units;
assign tens  = num / 10;  
assign units = num % 10;  

digits tens_decoder(.in(tens), .out(seg1));
digits units_decoder(.in(units), .out(seg0));

endmodule

module digits(
    input logic [3:0] in,    
    output logic [6:0] out
);                           

assign out = (
  (in == 4'h0) ? 7'b0111111 : 
  (in == 4'h1) ? 7'b0000110 :
  (in == 4'h2) ? 7'b1011011 : 
  (in == 4'h3) ? 7'b1001111 : 
  (in == 4'h4) ? 7'b1100110 : 
  (in == 4'h5) ? 7'b1101101 : 
  (in == 4'h6) ? 7'b1111101 : 
  (in == 4'h7) ? 7'b0000111 : 
  (in == 4'h8) ? 7'b1111111 : 7'b1100111);
endmodule