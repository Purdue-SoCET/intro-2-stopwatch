module synch_edge_det (
    input logic clk, n_rst, async_in,
    output logic edge_flag
);

logic sync_1, sync_2, q, sync_out;

always_ff @(posedge clk, negedge n_rst) 
begin: SYNC
    if(!n_rst) begin
        sync_1 <= 0;
        sync_2 <= 0;
    end else begin
        sync_1 <= async_in;
        sync_2 <= sync_1;
    end
end

always_ff @(posedge clk, negedge n_rst)
begin: EDGE_DET 
    if(!n_rst) begin
        q <= 1'b0;
    end else begin
        q <= sync_2;
    end
end

always_comb begin
    edge_flag = ~q & sync_2;
end

endmodule