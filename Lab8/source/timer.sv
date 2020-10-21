// $Id: $
// File name:   timer.sv
// Created:     10/5/2020
// Author:      Jiahao Xu
// Lab Section: 337-002
// Version:     1.0  Initial Design Entry
// Description: .

module timer(clk, n_rst, enable_timer, shift_enable, packet_done, data_size, bit_period);
    input wire clk, n_rst;
    input wire enable_timer;
    output wire shift_enable, packet_done;
    input wire [3:0] data_size;
    input wire [13:0] bit_period;

    localparam NUM_BITS = 14'd14;
    localparam MAX_CNT_BITS = 4;

    flex_counter #(NUM_BITS) clk_divder (
        .clk(clk), 
        .n_rst(n_rst), 
        .clear(~enable_timer),
        .count_enable(enable_timer),
        .rollover_val(bit_period), 
        .rollover_flag(shift_enable)
    );

    flex_counter #(MAX_CNT_BITS) controller (
        .clk(clk), 
        .n_rst(n_rst), 
        .clear(~enable_timer), 
        .count_enable(shift_enable),
        .rollover_val(data_size + 1'b1),
        .rollover_flag(packet_done)
    );
endmodule