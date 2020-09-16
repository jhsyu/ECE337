// $Id: $
// File name:   adder_nbit.sv
// Created:     9/9/2020
// Author:      Jiahao Xu
// Lab Section: 337-002
// Version:     1.0  Initial Design Entry
// Description: .
`timescale 1ns / 100ps
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
        always @ (a[i],b[i],cout[i]) begin
            assert((a[i]==1'b1)||(a[i]==1'b0))
            else $error("input 'a[%d]' is not a digital logic value",i);
            assert((b[i]==1'b1)||(b[i]==1'b0))
            else $error("input 'b[%d]' is not a digital logic value",i);
            #(2) assert (((a[i]+b[i]+cout[i])%2)==sum[i])
            else $error("output 'sum[%d]' of is incorrect!",i);
            #(2) assert (((a[i]+b[i]+cout[i])/2)==cout[i+1])
            else $error("output 'cout[%d]' of is incorrect!",i);
        end
    end
    endgenerate
    assign overflow = cout[BIT_WIDTH];
endmodule
