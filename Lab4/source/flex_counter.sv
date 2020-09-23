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
    input wire clk, n_rst, clear, count_enable;
    input wire [NUM_CNT_BIT - 1 : 0] rollover_val;
    output reg [NUM_CNT_BIT - 1 : 0] count_out;
    output reg rollover_flag;  

    reg next_flag;

    reg [NUM_CNT_BIT - 1 : 0] next_count;

    localparam INITIAL_VALUE = 0;
    always_ff @ (posedge clk, negedge n_rst) begin
        if (!n_rst) begin
            count_out <= 0;
            rollover_flag <= 0;
        end
        else begin
            count_out <= next_count;
            rollover_flag <= next_flag;
        end
    end
    always_comb begin
        if (!count_enable) next_count = count_out;
        else if (clear) next_count = 0;
        else if (count_out == rollover_val) next_count = 1;
        else next_count = count_out + 1;

        next_flag = (next_count == rollover_val) ? 1'b1 : 1'b0;
    end
endmodule