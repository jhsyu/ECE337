// $Id: $
// File name:   fir_filter.sv
// Created:     10/13/2020
// Author:      Jiahao Xu
// Lab Section: 337-002
// Version:     1.0  Initial Design Entry
// Description: .
module fir_filter(clk, n_reset, 
                  sample_data, fir_coefficient, 
                  data_ready, load_coeff, 
                  one_k_samples, modwait, err, 
                  fir_out);
    input wire clk, n_reset;
    input wire [15:0] sample_data;
    input wire [15:0] fir_coefficient;
    input wire data_ready, load_coeff;
    output reg one_k_samples, modwait, err;
    output reg [15:0] fir_out; 

    wire overflow, clear, cnt_up;
    wire [16:0] reg_out;
    wire [2:0] op;
    wire [3:0] dest, src1, src2;


    // controller unit. 
    controller CU (
        .clk(clk), .n_rst(n_reset), .dr(data_ready), .lc(load_coeff), 
        .overflow(overflow), .cnt_up(cnt_up), .clear(clear), 
        .modwait(modwait),  .err(err),
        .op(op), .src1(src1), .src2(src2), .dest(dest)
    );

    counter cnt (
        .clk(clk), .n_rst(n_reset), .cnt_up(cnt_up), .clear(clear), 
        .one_k_samples(one_k_samples)
    );
    datapath dp(
        .clk(clk), .n_reset(n_reset), 
        .op(op), .src1(src1), .src2(src2), .dest(dest), 
        .ext_data1(sample_data), .ext_data2(fir_coefficient), 
        .outreg_data(reg_out), .overflow(overflow)
    );
    magnitude mag(.in(reg_out), .out(fir_out));
endmodule