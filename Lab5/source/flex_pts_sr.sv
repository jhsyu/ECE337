// $Id: $
// File name:   flex_pts_sr.sv
// Created:     9/29/2020
// Author:      Jiahao Xu
// Lab Section: 337-002
// Version:     1.0  Initial Design Entry
// Description: .
module flex_pts_sr #(parameter NUM_BITS = 4, SHIFT_MSB = 1'b1)(
    clk, n_rst, 
    shift_enable, load_enable, 
    parallel_in, 
    serial_out
);
    input wire clk, n_rst;
    input wire shift_enable, load_enable;
    input wire [NUM_BITS - 1 : 0] parallel_in;
    output wire serial_out;

    reg [NUM_BITS - 1 : 0] p;
    reg [NUM_BITS - 1 : 0] nxt_p;

    // registers
    always_ff@(posedge clk, negedge n_rst) begin
        if (!n_rst) p <= '1;
        else p <= nxt_p;
    end
    // next state logic
    always_comb begin
        if (load_enable) nxt_p = parallel_in;
        else if (shift_enable) begin
            case (SHIFT_MSB)
                1'b1: nxt_p = {p[NUM_BITS - 2 : 0], 1'b1};
                1'b0: nxt_p = {1'b1, p[NUM_BITS - 1 : 1]};
                //default: 
            endcase
        end
        // neither shift nor load enabled. 
        else nxt_p = p;
    
    end
    // output logic
    assign serial_out = (SHIFT_MSB) ? p[NUM_BITS - 1] : p[0];
endmodule