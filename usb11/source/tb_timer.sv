//  Module: tb_timer
//
`timescale 1ns / 10ps

module tb_timer (); 
    localparam  CLK_PERIOD    = 1;
    // test bench signals.
    logic tb_clk;
    logic tb_n_rst;  
    logic tb_d_edge; 
    logic tb_bit_stuff; 
    logic tb_rcving; 
    logic tb_shift_en; 
    logic tb_byte_received; 

    string test_case_info; 
    int test_case_num; 

    task reset; begin
        @(negedge tb_clk); 
        tb_n_rst = 1'b0; 
        @(posedge tb_clk); 
        @(negedge tb_clk); 
        tb_n_rst = 1'b1; 
        @(posedge tb_clk); 
        @(posedge tb_clk); 
    end
    endtask

    task check_output(
        input logic expected_shift_en, 
        input logic expected_byte_received
    ); begin
        if (tb_shift_en == expected_shift_en) begin
            $info("correct shift_en output."); 
        end
        else begin
            $error("incorrect shift_en output. "); 
        end

        if (tb_byte_received == expected_byte_received) begin
            $info("correct byte_received output"); 
        end
        else begin
            $error("incorrect byte_received output.");
        end
    end
    endtask


    // Clock generation block
    always begin
        tb_clk = 1'b0;
        #(CLK_PERIOD/2.0);
        tb_clk = 1'b1;
        #(CLK_PERIOD/2.0);
    end

    timer DUT (
        .clk(tb_clk), 
        .n_rst(tb_n_rst), 
        .d_edge(tb_d_edge), 
        .rcving(tb_rcving), 
        .bit_stuff(tb_bit_stuff), 
        .shift_en(tb_shift_en), 
        .byte_rcvd(tb_byte_received)
    ); 

    initial begin
        tb_n_rst = 1'b1; 
        tb_d_edge = 1'b0; 
        tb_bit_stuff = 1'b0; 
        tb_rcving = 1'b0; 

        test_case_num = -1; 
        test_case_info = "N/A"; 

        // test case 1: reset dut
        test_case_num = test_case_num + 1; 
        test_case_info = "reset dut"; 
        reset(); 
        #(0.1);
        check_output(1'b0, 1'b0); 
        
        // test 2: 4+8+4 test. 
        test_case_num = test_case_num + 1; 
        test_case_info = "4+8+4 test."; 
        tb_rcving = 1'b1; 
        @(posedge tb_clk); 
        tb_d_edge = 1'b1; 
        #(CLK_PERIOD); 
        tb_d_edge = 1'b0; 
        #(CLK_PERIOD * 3); 
        #(0.1); 
        check_output(1'b1, 1'b0); 
        @(posedge tb_clk); 
        #(CLK_PERIOD * 7); 
        #(0.1);
        check_output(1'b1, 1'b0); 
        #(CLK_PERIOD); 
        @(posedge tb_clk); 
        tb_d_edge = 1'b1; 
        #(CLK_PERIOD); 
        tb_d_edge = 1'b0; 
        #(CLK_PERIOD * 3);
        #(0.1); 
        check_output(1'b1, 1'b0); 
        #(CLK_PERIOD * 64); 
        check_output(1'b1, 1'b1); 


    end


endmodule: tb_timer
