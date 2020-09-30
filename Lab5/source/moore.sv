// $Id: $
// File name:   moore.sv
// Created:     9/29/2020
// Author:      Jiahao Xu
// Lab Section: 337-002
// Version:     1.0  Initial Design Entry
// Description: .

module moore(clk, n_rst, i, o);
    input wire clk, n_rst;
    input wire i;
    output wire o;

    localparam s0 = 3'd0;
    localparam s1 = 3'd1;
    localparam s2 = 3'd2;
    localparam s3 = 3'd3;
    localparam s4 = 3'd4;

    reg [2:0] s, nxt_s;

    // registers.
    always_ff @ (posedge clk, negedge n_rst) begin
        if (!n_rst) s <= s0;
        else s <= nxt_s;
    end
    // next state logic
    always_comb begin
        case (s)
            s0: nxt_s = (i == 1'b1) ? s1 : s0; 
            s1: nxt_s = (i == 1'b1) ? s2 : s0; 
            s2: nxt_s = (i == 1'b1) ? s2 : s3; 
            s3: nxt_s = (i == 1'b1) ? s4 : s0; 
            s4: nxt_s = (i == 1'b1) ? s2 : s0; 
            default: nxt_s = s0;
        endcase
    end
    // output logic
    assign o = (s == s4) ? 1'b1 : 1'b0;
endmodule