// $Id: $
// File name:   tb_timer.sv
// Created:     10/5/2020
// Author:      Jiahao Xu
// Lab Section: 337-002
// Version:     1.0  Initial Design Entry
// Description: . 
`timescale 1ns / 10ps
module tb_timer();
    // local parameter declaration. 
    localparam CLK_PERIOD = 2.5;

    // testbench signal declaration. 
    integer tb_test_number;
    string  tb_test_case; 

    // DUT Siganl declaration. 
    logic tb_clk, tb_n_rst;
    logic tb_enable_timer;
    logic tb_shift_enable, tb_packet_done;
    // DUT portmap
    timer DUT(.clk(tb_clk),
              .n_rst(tb_n_rst), 
              .enable_timer(tb_enable_timer), 
              .shift_enable(tb_shift_enable), 
              .packet_done(tb_packet_done));
    // clock generation.
    always begin
        tb_clk = 1'b0;
        #(CLK_PERIOD / 2);
        tb_clk = 1'b1;
        #(CLK_PERIOD / 2);
    end

    
    task  reset;
    begin
       @(negedge tb_clk);
       tb_n_rst = 1'b1;
       @(negedge tb_clk);
       tb_n_rst = 1'b0;
    end
    endtask

    initial begin
        tb_test_number = -1;
        tb_test_case = "initialize test bench.";
        tb_n_rst = 1'b0;
        tb_enable_timer = 1'b0;

        // TEST CASE 1: POWER ON RESET. 
        tb_test_number = 1;
        tb_test_case = "power one reset";
        #0.1
        reset();

        // TEST CASE 2: 
        tb_test_number = tb_test_number + 1;
        tb_test_case = "timing";
        tb_enable_timer = 1'b1;
        
        #(CLK_PERIOD * 400);

    end
    

endmodule

