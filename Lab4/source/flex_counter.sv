// $Id: $
// File name:   flex_counter.sv
// Created:     9/22/2020
// Author:      Jiahao Xu
// Lab Section: 337-002
// Version:     1.0  Initial Design Entry
// Description: .
module flex_counter #(parameter  NUM_CNT_BIT= 4)(
    clk, 
    n_rst, 
    clear, 
    count_enable,
    rollover_val, 
    count_out,
    rollover_flag
);
    input logic clk, n_rst, clear, count_enable;
    input logic [NUM_CNT_BIT - 1 : 0] rollover_val;
    output logic [NUM_CNT_BIT - 1 : 0] count_out;
    output logic rollover_flag;  

    logic [NUM_CNT_BIT - 1 : 0] next_count;

    localparam INITIAL_VALUE = 0;
    always_ff @ (posedge clk, negedge n_rst) begin
        if (!n_rst) count_out <= 0;
        else count_out = next_count;
    end
    always_comb begin
        next_count = count_out + 1;
        rollover_flag = 0;
        if (!count_enable) next_count = count_out;
        else if (clear) next_count = 1'b0;
        else if (count_out == rollover_val) begin
            next_count = 1;
            rollover_flag = 1;
        end
    end
endmodule