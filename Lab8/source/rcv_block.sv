// $Id: $
// File name:   rcv_block.sv
// Created:     10/5/2020
// Author:      Jiahao Xu
// Lab Section: 337-002
// Version:     1.0  Initial Design Entry
// Description: .
module rcv_block (clk, n_rst, 
                  serial_in, data_read, 
                  rx_data, data_ready, 
                  overrun_error, framing_error,
                  data_size, bit_period);
    input wire clk, n_rst;
    input wire serial_in, data_read; 
    input wire [3:0] data_size;
    input wire [13:0] bit_period;
    output wire [7:0] rx_data;
    output wire data_ready;
    output wire overrun_error, framing_error; 

    wire start, shift_en, done;
    wire sbc_clr, sbc_en, ld_buf, timer_en;
    reg [7:0] packet_data; 
    reg stop;


    start_bit_det det0 (.clk(clk), .n_rst(n_rst),
                        .serial_in(serial_in),
                        .start_bit_detected(start)
    );

    sr_9bit sr0 (.clk(clk), .n_rst(n_rst), .shift_strobe(shift_en), 
                .serial_in(serial_in), 
                .packet_data(packet_data), .stop_bit(stop)
    );

    rcu cu0 (.clk(clk), 
             .n_rst(n_rst), 
             .start_bit_detected(start), 
             .packet_done(done), 
             .framing_error(framing_error), 
             .sbc_clear(sbc_clr), 
             .sbc_enable(sbc_en), 
             .load_buffer(ld_buf), 
             .enable_timer(timer_en)
    );

    timer tm0 (.clk(clk), .n_rst(n_rst), 
               .enable_timer(timer_en), 
               .shift_enable(shift_en), 
               .packet_done(done), 
               .data_size(data_size), 
               .bit_period(bit_period)
    );

    stop_bit_chk det1 (.clk(clk),
                       .n_rst(n_rst),
                       .sbc_clear(sbc_clr),
                       .sbc_enable(sbc_en),
                       .stop_bit(stop),
                       .framing_error(framing_error)
    );

    rx_data_buff buff0 (.clk(clk),
                        .n_rst(n_rst),
                        .load_buffer(ld_buf),
                        .packet_data(packet_data),
                        .data_read(data_read),
                        .rx_data(rx_data),
                        .data_ready(data_ready),
                        .overrun_error(overrun_error)
);


endmodule