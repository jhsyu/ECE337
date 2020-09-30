// $Id: $
// File name:   flex_stp_sr.sv
// Created:     9/29/2020
// Author:      Jiahao Xu
// Lab Section: 337-002
// Version:     1.0  Initial Design Entry
// Description: .

module flex_stp_sr #(parameter NUM_BITS = 4, SHIFT_MSB = 1'b1)(
    clk,
    n_rst,
    shift_enable,
    serial_in,
    parallel_out
);
    input wire clk, n_rst;
    input wire shift_enable;
    input wire serial_in;
    output reg [NUM_BITS -1 : 0] parallel_out;
    reg [NUM_BITS - 1:0] nxt_out;
    // registers.
    always_ff@(posedge clk, negedge n_rst) begin
        if (!n_rst) parallel_out <= '1;
        else parallel_out <= nxt_out;
    end

    // next state logic. 
    always_comb begin
        // SHIFT_MSB == 1'b1: nxt_out = {in, out [b-2,0]}
        // SHIFT_MSB == 1'b0: nxt_out = {out [b-1,1], in}
        if (shift_enable) begin
            case (SHIFT_MSB)
                1'b1: nxt_out = {parallel_out [NUM_BITS - 2:0],serial_in};
                1'b0: nxt_out = {serial_in, parallel_out [NUM_BITS - 1:1]};
                // for metastable SHIFT_MSB.
                default: nxt_out = parallel_out;
            endcase
        end
        // shift is not enabled.
        else nxt_out = parallel_out;
    end

    // output logic. 
endmodule