// $Id: $
// File name:   sr_9bit.sv
// Created:     10/5/2020
// Author:      Jiahao Xu
// Lab Section: 337-002
// Version:     1.0  Initial Design Entry
// Description: .

module sr_9bit (clk, n_rst, shift_strobe, 
                serial_in, 
                packet_data, stop_bit);
    input wire clk, n_rst;
    input wire serial_in;
    input wire shift_strobe;
    output wire [7:0] packet_data;
    output wire stop_bit;

    localparam NUM_BITS = 9;

    reg [8:0] buffer;

    flex_stp_sr #(NUM_BITS,1'b0) sr0 (.clk(clk), 
                                 .n_rst(n_rst), 
                                 .shift_enable(shift_strobe), 
                                 .serial_in(serial_in), 
                                 .parallel_out(buffer));

    // output logic
    assign stop_bit = buffer[8];
    assign packet_data = buffer[7:0];
endmodule
