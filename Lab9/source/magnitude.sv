// $Id: $
// File name:   magnitude.sv
// Created:     10/13/2020
// Author:      Jiahao Xu
// Lab Section: 337-002
// Version:     1.0  Initial Design Entry
// Description: .

module magnitude(in, out);
    input wire [16:0] in;
    output wire [15:0] out;
    assign out = (in[16]) ? (~in[15:0] + 1) : in[15:0];
endmodule