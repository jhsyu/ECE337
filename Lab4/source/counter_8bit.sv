// $Id: $
// File name:   counter_8bit.sv
// Created:     9/22/2020
// Author:      Jiahao Xu
// Lab Section: 337-002
// Version:     1.0  Initial Design Entry
// Description: .

module counter_8bit (
    clk, clear, n_rst, count_enable,
    rollover_val,
    count_out, 
    rollover_flag,
);
    localparam BIT_CNT_NUM = 8;
    input wire clk, n_rst, clear, count_enable;
    input wire [BIT_CNT_NUM - 1 : 0] rollover_val;
    output reg [BIT_CNT_NUM - 1 : 0] count_out;
    output reg rollover_flag;

    flex_counter #(BIT_CNT_NUM) (.clk(clk), 
                                 .clear(clear), 
                                 .n_rst(n_rst), 
                                 .count_enable(count_enable), 
                                 .rollover_val(rollover_val),
                                 .rollover_flag(rollover_flag), 
                                 .count_out(count_out)
                                 );

endmodule