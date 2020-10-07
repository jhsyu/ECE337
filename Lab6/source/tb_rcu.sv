// $Id: $
// File name:   tb_rcu.sv
// Created:     10/6/2020
// Author:      Jiahao Xu
// Lab Section: 337-002
// Version:     1.0  Initial Design Entry
// Description: .
`timescale 1 ns / 10 ps
module tb_rcu ();
    // local parameters;
    localparam CLK_PERIOD = 2.5;
    
    // declare test case info. 
    integer tb_test_num;
    string tb_test_case;

    // declare DUT signal
    logic tb_clk, tb_n_rst;
    logic tb_start_bit_detected;
    logic tb_packet_done;
    logic tb_framing_error;
    logic tb_sbc_clear, tb_sbc_enable;
    logic tb_load_buffer;
    logic tb_enable_timer;
    logic [2:0] tb_input; 
    logic [3:0] tb_output; 

    // DUT portmap
    assign {tb_start_bit_detected, tb_packet_done, tb_framing_error} = tb_input;
    assign tb_output = {tb_enable_timer, tb_sbc_enable, tb_sbc_clear, tb_load_buffer};

    rcu DUT (.clk(tb_clk), .n_rst(tb_n_rst), 
             .start_bit_detected(tb_start_bit_detected), 
             .packet_done(tb_packet_done), 
             .framing_error(tb_framing_error), 
             .sbc_clear(tb_sbc_clear), 
             .sbc_enable(tb_sbc_enable), 
             .load_buffer(tb_load_buffer), 
             .enable_timer(tb_enable_timer));
    // tasks. 
    task  reset;
    begin
        @(negedge tb_clk);
        tb_n_rst = 1'b0;
        #(CLK_PERIOD * 2);
        tb_n_rst = 1'b1;
        #(CLK_PERIOD * 2);
    end
    endtask //

    task  check_output;
        input integer tb_test_num; 
        input logic [3:0] expected_output;
        begin
            if (tb_output != 4'b1100) 
                $error("test case %d failed. ", tb_test_num);
            else $info("test case %d passed. ", tb_test_num);
        end
    endtask //

    // clock generation. 
    always begin
        tb_clk = 1'b0;
        #(CLK_PERIOD/2.0);
        tb_clk = 1'b1;
        #(CLK_PERIOD/2.0);
    end


    initial begin
        //initialize Test case signals. 
        tb_test_case = "initialization"; 
        tb_test_num = -1;
        //initialize DUT inputs. 
        tb_n_rst = 1'b1; 
        tb_input = 3'b0;
        #(0.1);

        // test case 0: power on reset. 
        tb_test_num = tb_test_num + 1;
        tb_test_case = "power on reset. ";
        #(0.1);
        tb_input = 3'b0;
        reset();

        //test case 1: start bit detected. 
        tb_test_num = tb_test_num + 1; 
        tb_test_case = "start bit detected.";
        #(0.1);
        tb_input = 3'b100; 
        #(CLK_PERIOD); 
        if (tb_output != 4'b1100) 
            $error("test case 1 failed. ");
        else $info("test case 1 passed. ");
        #(CLK_PERIOD);
        
        // testcase 2: read bits. 
        tb_test_num = tb_test_num + 1; 
        tb_test_case = "read bits.";
        #(0.1);
        tb_input = 3'b000; // packet_done = 1'b0;
        #(CLK_PERIOD);
        check_output(2, 4'b1000);

        tb_input = 3'b100;
        #(CLK_PERIOD);
        check_output(2, 4'b1000);

        tb_input = 3'b101;
        #(CLK_PERIOD * 1);
        check_output(2, 4'b1000);
        #(CLK_PERIOD);

        // test case 3: packet done. 
        tb_test_num = tb_test_num + 1; 
        tb_test_case = "packet done";
        #(0.1);
        tb_input = 3'b010; // packet_done = 1'b1;
        #(CLK_PERIOD);
        check_output(3, 4'b1100);

        tb_input = 3'b111;
        #(CLK_PERIOD);
        check_output(3, 4'b1100);

        #(CLK_PERIOD *8); 

        // test case 4: framming error
        tb_test_num = tb_test_num + 1; 
        tb_test_case = "framming error";
        #(0.1);
        tb_input = 3'b001; // framming_err = 1'b1;
        #(CLK_PERIOD);
        check_output(4, 4'b0000);
        #(CLK_PERIOD);
    end
endmodule