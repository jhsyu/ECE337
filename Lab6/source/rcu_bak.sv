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

    reg [3:0] out;
    reg [1:0] s, next_s;

    localparam IDLE  = 2'b00;
    localparam WAIT  = 2'b01;
    localparam READ  = 2'b10;
    localparam CHECK = 2'b11;
    // state regiusters
    always_ff@(posedge clk, negedge n_rst) begin
        if (!n_rst) s <= IDLE;
        else s <= next_s;
    end

    // next state logic
    always_comb begin
        case (s)
            IDLE: next_s = (start_bit_detected) ? WAIT : IDLE;
            WAIT: next_s = READ;
            READ: next_s = (packet_done) ? CHECK: READ;
            CHECK: next_s = IDLE; 
            default: next_s = IDLE;
        endcase
    end

    // output logic
    always_comb begin
        case (s)
            IDLE:  out = (start_bit_detected) ? 4'b0010 : 4'b0000;
            WAIT:  out = 4'b1000;
            READ:  out = (packet_done) ? 4'b0100 : 4'b1000;
            CHECK: out = (framing_error) ? 4'b0000 : 4'b0001; 
            default: out = 4'b0000;
        endcase
    end
    assign {enable_timer, sbc_enable, sbc_clear, load_buffer} = out;

endmodule
