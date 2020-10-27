// $Id: $
// File name:   coefficient_loader.sv
// Created:     10/27/2020
// Author:      Jiahao Xu
// Lab Section: 337-002
// Version:     1.0  Initial Design Entry
// Description: .
module coefficient_loader (
    input logic clk, 
    input logic n_rst, 
    input logic new_coefficient_set, 
    input logic modwait, 
    output logic load_coeff, 
    output logic [1:0] coefficient_num
);
    localparam IDLE     = 4'h0;
    localparam LOAD0    = 4'h1;
    localparam WAIT0    = 4'h2;
    localparam LOAD1    = 4'h3;
    localparam WAIT1    = 4'h4;
    localparam LOAD2    = 4'h5;
    localparam WAIT2    = 4'h6;
    localparam LOAD3    = 4'h7;
    localparam WAIT3    = 4'h8;

    logic [3:0] s, next_s;

    always_ff@(posedge clk, negedge n_rst) begin
        if(~n_rst) s <= 4'b0;
        else s <= next_s;
    end
    always_comb begin
        case (s)
            IDLE:   next_s = (new_coefficient_set) ? LOAD0 : IDLE;
            LOAD0:  next_s = WAIT0;
            WAIT0:  next_s = (modwait) ? WAIT0 : LOAD1;
            LOAD1:  next_s = WAIT1;
            WAIT1:  next_s = (modwait) ? WAIT1 : LOAD2;
            LOAD2:  next_s = WAIT2;
            WAIT2:  next_s = (modwait) ? WAIT2 : LOAD3;
            LOAD3:  next_s = WAIT3;
            WAIT3:  next_s = (modwait) ? WAIT3 : IDLE;
            default: next_s = IDLE;
        endcase
    end
    always_comb begin
        case (s)
            IDLE:   {load_coeff, coefficient_num} = {1'b0, 2'd0};
            LOAD0:  {load_coeff, coefficient_num} = {1'b1, 2'd0};
            WAIT0:  {load_coeff, coefficient_num} = {1'b0, 2'd0};
            LOAD1:  {load_coeff, coefficient_num} = {1'b1, 2'd1};
            WAIT1:  {load_coeff, coefficient_num} = {1'b0, 2'd1};
            LOAD2:  {load_coeff, coefficient_num} = {1'b1, 2'd2};
            WAIT2:  {load_coeff, coefficient_num} = {1'b0, 2'd2};
            LOAD3:  {load_coeff, coefficient_num} = {1'b1, 2'd3};
            WAIT3:  {load_coeff, coefficient_num} = {1'b0, 2'd3};
            default:{load_coeff, coefficient_num} = {1'b0, 2'd0}; 
        endcase
    end

endmodule