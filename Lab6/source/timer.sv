// $Id: $
// File name:   timer.sv
// Created:     10/5/2020
// Author:      Jiahao Xu
// Lab Section: 337-002
// Version:     1.0  Initial Design Entry
// Description: .

module timer(clk, n_rst, enable_timer, shift_enable, packet_done);
    input wire clk, n_rst;
    input wire shift_enable, enable_timer;
    output wire packet_done;

    localparam NUM_BITS = 4;
    localparam DIVISOR = 4'd10;
    localparam DATA_LENGTH = 4'd9;

    reg clk10;
    reg [NUM_BITS - 1 : 0] divider_cnt;
    reg [NUM_BITS - 1 : 0] controller_cnt;

    flex_counter #(NUM_BITS) clk_divder (.clk(clk), 
                        .n_rst(n_rst), 
                        .clear(1'b0), 
                        .count_enable(enable_timer),
                        .rollover_val(DIVISOR), 
                        .count_out(divider_cnt),
                        .rollover_flag(clk10));

    flex_counter #(NUM_BITS) controller (.clk(clk10), 
                        .n_rst(n_rst), 
                        .clear(1'b0), 
                        .count_enable(enable_timer),
                        .rollover_val(DATA_LENGTH), 
                        .count_out(controller_cnt),
                        .rollover_flag(packet_done));
    assign shift_enable = | controller_cnt;
endmodule