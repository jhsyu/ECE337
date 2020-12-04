//  Module: edge_detect
//  send a pulse after every transition of dp. 
module edge_detect(
    input logic clk,
    input logic n_rst, 
    input logic d_plus,
    output logic d_edge
    );
    
    logic curr, next_curr; 
    logic prev, next_prev; 

    always_comb begin
        next_curr = d_plus; 
        next_prev = curr; 
        d_edge = curr ^ prev; 
    end
    
    always_ff @(posedge clk, negedge n_rst) begin
        if (~n_rst) begin
            curr <= 1'b1; 
            prev <= 1'b1; 
        end
        else begin
            curr <= next_curr; 
            prev <= next_prev; 
        end
    end
endmodule: edge_detect
