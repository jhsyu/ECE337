// $Id: $
// File name:   adder_1bit.sv
// Created:     9/9/2020
// Author:      Jiahao Xu
// Lab Section: 337-002
// Version:     1.0  Initial Design Entry
// Description: .
module adder_1bit(
    a,
    b,
    carry_in,
    sum,
    carry_out
);
    input wire a,b,carry_in;
    output wire sum,carry_out;
    assign sum = carry_in ^ (a ^ b);
    assign carry_out = (~carry_in & a & b) | (carry_in & (b | a));
endmodule