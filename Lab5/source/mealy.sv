// $Id: $
// File name:   mealy.sv
// Created:     9/29/2020
// Author:      Jiahao Xu
// Lab Section: 337-002
// Version:     1.0  Initial Design Entry
// Description: .
module mealy (clk, n_rst, i, o);
    input wire clk, n_rst, i;
    output reg o;

    localparam S0 = 2'b00;
    localparam S1 = 2'b01;
    localparam S2 = 2'b10;
    localparam S3 = 2'b11;

    reg [1:0] s,nxt_s;

    // regsiters
    always_ff @ (posedge clk, negedge n_rst) begin
        if (!n_rst) s <= 0;
        else s <= nxt_s;
    end
    // next state logic 
    always_comb begin
        case (s)
            S0: nxt_s = (i) ? S1 : S0;
            S1: nxt_s = (i) ? S2 : S0;
            S2: nxt_s = (i) ? S2 : S3;
            S3: nxt_s = (i) ? S1 : S0;
            //default: 
        endcase
    end
    // output logic
    always_comb begin
        if (s == S3) assign o = (i == 1'b1) ? 1'b1 : 1'b0;
        else assign o = 1'b0;
    end

endmodule