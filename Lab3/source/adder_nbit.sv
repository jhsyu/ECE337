// $Id: $
// File name:   adder_nbit.sv
// Created:     9/9/2020
// Author:      Jiahao Xu
// Lab Section: 337-002
// Version:     1.0  Initial Design Entry
// Description: .
module adder_nbit #(parameter  BIT_WIDTH = 4) 
(
    a, b,
    sum, 
    carry_in,
    overflow
);
    input wire [BIT_WIDTH - 1:0] a, b;
    output wire [BIT_WIDTH - 1:0] sum;
    input carry_in;
    output overflow;
    
    wire [BIT_WIDTH:0] cout;
    assign cout[0] = carry_in;
    genvar i;
    generate
    for (i = 0; i < BIT_WIDTH; i = i + 1) begin
        adder_1bit IX(.a(a[i]), .b(b[i]), .carry_in(cout[i]), .sum(sum[i]), .carry_out(cout[i+1]));
    end
    endgenerate
    assign overflow = cout[BIT_WIDTH];
endmodule
