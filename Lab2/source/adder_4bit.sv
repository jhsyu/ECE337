// $Id: $
// File name:   adder_4bit.sv
// Created:     9/9/2020
// Author:      Jiahao Xu
// Lab Section: 337-002
// Version:     1.0  Initial Design Entry
// Description: .
module adder_4bit (
    a, b,
    sum, 
    carry_in,
    overflow
);
    input wire [3:0] a, b;
    output wire [3:0] sum;
    input carry_in;
    output overflow;
    
    wire [2:0] cout;
    adder_1bit a0(.a(a[0]), .b(b[0]), .carry_in(carry_in), .sum(sum[0]), .carry_out(cout[0]));
    adder_1bit a1(.a(a[1]), .b(b[1]), .carry_in(cout[0]), .sum(sum[1]), .carry_out(cout[1]));
    adder_1bit a2(.a(a[2]), .b(b[2]), .carry_in(cout[1]), .sum(sum[2]), .carry_out(cout[2]));
    adder_1bit a3(.a(a[3]), .b(b[3]), .carry_in(cout[2]), .sum(sum[3]), .carry_out(overflow));
endmodule

