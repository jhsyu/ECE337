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
    reg [2:0] s, next_s;

    localparam IDLE  = 3'b000;
    localparam CLEAR = 3'b001;
    //localparam WAIT0 = 3'b010;
    localparam READ  = 3'b011;
    localparam SBCEN = 3'b100;
    localparam CHECK = 3'b101;
    localparam LOAD  = 3'b110;
    // state regiusters
    always_ff@(posedge clk, negedge n_rst) begin
        if (!n_rst) s <= IDLE;
        else s <= next_s;
    end

    // next state logic
    always_comb begin
        case (s)
            IDLE:  next_s = (start_bit_detected) ? CLEAR : IDLE;
            CLEAR: next_s = READ;
            //WAIT0: next_s = READ;
            READ:  next_s = (packet_done) ? SBCEN: READ;
            SBCEN: next_s = CHECK;
            CHECK: next_s = (framing_error) ? IDLE : LOAD; 
            default: next_s = IDLE;
        endcase
    end

    // output logic
    always_comb begin
        case (s)
            IDLE:  out = 4'b0000;
            CLEAR: out = 4'b0010;
            READ:  out = 4'b1000;
            SBCEN: out = 4'b0100;
            CHECK: out = 4'b0000;
            LOAD:  out = 4'b0001; 
            default: out = 4'b0000;
        endcase
    end
    assign {enable_timer, sbc_enable, sbc_clear, load_buffer} = out;

endmodule