// $Id: $
// File name:   timer.sv
// Created:     10/5/2020
// Author:      Jiahao Xu
// Lab Section: 337-002
// Version:     1.0  Initial Design Entry
// Description: .

module timer(clk, n_rst, enable_timer, shift_enable, packet_done);
    input wire clk, n_rst;
    input wire enable_timer;
    output wire shift_enable, packet_done;

    localparam NUM_BITS = 4;
    localparam DIVISOR = 4'd10;
    localparam DATA_LENGTH = 4'd9;


    flex_counter #(NUM_BITS) clk_divder (.clk(clk), 
                        .n_rst(n_rst), 
                        .clear(~enable_timer),
                        .count_enable(enable_timer),
                        .rollover_val(DIVISOR), 
                        .rollover_flag(shift_enable)
                        );

    flex_counter #(NUM_BITS) controller (.clk(clk), 
                        .n_rst(n_rst), 
                        .clear(~enable_timer), 
                        .count_enable(shift_enable),
                        .rollover_val(DATA_LENGTH),
                        .rollover_flag(packet_done)
                        );
endmodule