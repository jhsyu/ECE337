// $Id: $
// File name:   rcu.sv
// Created:     10/5/2020
// Author:      Jiahao Xu
// Lab Section: 337-002
// Version:     1.0  Initial Design Entry
// Description: .
module rcu (clk, n_rst, 
            start_bit_detected, packet_done, framing_error, 
            sbc_clear, sbc_enable, load_buffer, enable_timer);
    input wire clk, n_rst; 
    input wire start_bit_detected;
    input wire packet_done;
    input wire framing_error;

    output wire sbc_clear;
    output wire sbc_enable;
    output wire load_buffer;
    output wire enable_timer;

    //wire [2:0] in = {start_bit_detected, packet_done, framing_error};
    reg [3:0] out;
    reg [1:0] s, next_s;

    localparam S00 = 2'd0;
    localparam S01 = 2'd1;
    localparam S02 = 2'd2;
    // state regiusters
    always_ff@(posedge clk, negedge n_rst) begin
        if (!n_rst) s <= S00;
        else s <= next_s;
    end

    // next state logic
    always_comb begin
        case (s)
            S00: next_s = (start_bit_detected) ? S01 : S00;
            S01: next_s = (packet_done) ? S02: S01;
            S02: next_s = S00; 
            default: next_s = S00;
        endcase
    end

    // output logic
    always_comb begin
        case (s)
            S00: out = (start_bit_detected) ? 4'b1010 : 4'b0000;
            S01: out = (packet_done) ? 4'b1100 : 4'b1000;
            S02: out = (framing_error) ? 4'b0000 : 4'b0001; 
            default: out = 4'b0000;
        endcase
    end
    assign {enable_timer, sbc_enable, sbc_clear, load_buffer} = out;

endmodule