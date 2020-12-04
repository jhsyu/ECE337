//  Module: decoder
//  NRZ decoding module. 
//  output 0 if adjcent bits different. 
//  output 1 if adjcent bits same. 
module decoder(
    input logic clk, 
    input logic n_rst, 
    input logic d_plus, 
    input logic shift_en, 
    input logic eop, 
    output logic d_orig
    );

    logic curr;
    logic prev;
    logic next_prev;
  
    always_comb begin
        if (shift_en) begin
            if (eop) next_prev = 1;
            else next_prev = curr;
        end 
        else next_prev = prev;
    end
  
    always_ff @(posedge clk, negedge n_rst) begin
        if(~n_rst) begin
            curr <= 1;
            prev <= 1;
        end 
        else begin
            curr <= d_plus;
            prev <= next_prev;
        end
    end

    assign d_orig = ~(prev ^ curr);
  
    
endmodule: decoder
