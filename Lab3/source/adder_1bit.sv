// $Id: $
// File name:   adder_1bit.sv
// Created:     9/9/2020
// Author:      Jiahao Xu
// Lab Section: 337-002
// Version:     1.0  Initial Design Entry
// Description: .
`timescale 1ns / 100ps
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
    //always @ (a, b, carry_in) begin
        //#(2) assert(((a + b + carry_in)%2)==sum)
        //else $error("Output 's' of first 1 bit adder is incorrect");
        //assert((a==1'b1)||(a==1'b0))
        //else $error("input 'a' is not a digital logic value");
        //assert((b==1'b1)||(b==1'b0))
        //else $error("input 'b' is not a digital logic value");
    //end
endmodule