// $Id: $
// File name:   tb_flex_counter.sv
// Created:     9/22/2020
// Author:      Jiahao Xu
// Lab Section: 337-002
// Version:     1.0  Initial Design Entry
// Description: .
`timescale 1ns / 10ps
module tb_flex_counter();
  // Define local parameters used by the test bench
  localparam  CLK_PERIOD = 2.5;
  localparam  NUM_BITS = 4;
  localparam  RESET_COUNT = 'b0;
  localparam  RESET_FLAG = 1'b0;
  
  // Declare DUT portmap signals
  logic tb_clk;
  logic tb_n_rst;
  logic tb_clear;
  logic tb_count_enable;
  logic [NUM_BITS - 1:0] tb_rollover_val;
  logic [NUM_BITS - 1:0] tb_count_out;
  logic tb_rollover_flag;
  
  // Declare test bench signals
  integer tb_test_num;
  string tb_test_case;
  integer tb_stream_test_num;
  string tb_stream_check_tag;

  task reset_dut;
  begin
      tb_n_rst = 1'b0;
      // Maintain the reset for more than one cycle
      @(posedge tb_clk);

      // Wait until safely away from rising edge of the clock before releasing
      @(negedge tb_clk);
      tb_n_rst = 1'b1;

      // Leave out of reset for a couple cycles before allowing other stimulus
      // Wait for negative clock edges, 
      // since inputs to DUT should normally be applied away from rising clock edges
  end
  endtask

  task  check_output;
      input logic [NUM_BITS-1:0] expected_count;
      input logic expected_rollover_flag;
      begin
          if(expected_count == tb_count_out)
            $info("correct count %d", tb_count_out);
          else 
            $error("incorrect count %d", tb_count_out);
          if(expected_rollover_flag == tb_rollover_flag)
            $info("correct flag %d", tb_rollover_flag);
          else 
            $error("incorrect flag %d", tb_rollover_flag);
      end
  endtask
    
  task  DUT_clear;
    begin
        @(negedge tb_clk);
        tb_clear = 1'b1;
        #(CLK_PERIOD);
        tb_clear = 1'b0;       
    end
  endtask  
  // Clock generation
  always begin
    // Start with clock low to avoid false rising edge events at t=0
    tb_clk = 1'b0;
    // Wait half of the clock period before toggling clock value (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
    tb_clk = 1'b1;
    // Wait half of the clock period before toggling clock value via rerunning the block (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
  end

  flex_counter DUT (.clk(tb_clk), .n_rst(tb_n_rst), .clear(tb_clear), .count_enable(tb_count_enable), 
                    .rollover_val(tb_rollover_val), .count_out(tb_count_out), .rollover_flag(tb_rollover_flag));

  // Test bench main process
  initial begin
    // Initialize all of the test inputs
    tb_n_rst  = 1'b1;              // Initialize to be inactive
    tb_clear = 1'b0;
    tb_count_enable = 1'b0;
    tb_rollover_val = 4'h2;

    tb_test_num = 0;               // Initialize test case counter
    tb_test_case = "Test bench initializaton";
    tb_stream_test_num = 0;
    tb_stream_check_tag = "N/A";
    // Wait some time before starting first test case
    #(0.1);
    
    // ************************************************************************
    // Test Case 1: Power-on Reset of the DUT
    // ************************************************************************
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Power on Reset";
    // Note: Do not use reset task during reset test case since we need to specifically check behavior during reset
    // Wait some time before applying test case stimulus
    #(0.1);
    // Apply test case initial stimulus
    tb_count_enable = 1'b0;
    tb_clear = 1'b0;
    tb_rollover_val = 4'h2;
    tb_n_rst  = 1'b0;    // Activate reset
    
    // Wait for a bit before checking for correct functionality
    #(CLK_PERIOD/2.0);

    // Check that internal state was correctly reset
    $display("TEST CASE 1: POWER RESET");
    check_output( RESET_COUNT, RESET_FLAG);
    
    // Check that the reset value is maintained during a clock cycle
    #(CLK_PERIOD);
    check_output( RESET_COUNT, RESET_FLAG);
    
    // Release the reset away from a clock edge
    tb_n_rst  = 1'b1;   // Deactivate the chip reset
    #0.1;
    // Check that internal state was correctly keep after reset release
    check_output( RESET_COUNT, RESET_FLAG);

    // ************************************************************************
    // Test Case 2: Rollover for a rollover value that is not a power of two
    // ************************************************************************
    @(negedge tb_clk);
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Rollover for a rollover value that is not a power of two";

    tb_count_enable = 1'b1;
    tb_n_rst = 1'b1;
    tb_clear = 1'b0;
    tb_rollover_val = 4'h7;
    reset_dut();

    @(posedge tb_clk);
    @(posedge tb_clk);
    @(posedge tb_clk);

    #(CLK_PERIOD/2.0);
    $display("TEST CASE 2");
    check_output(4'h3,1'b0);


    // ************************************************************************
    // Test Case 3: Continuous counting
    // ************************************************************************
    @(negedge tb_clk);
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Continuous counting";

    tb_count_enable = 1'b1;
    tb_n_rst = 1'b1;
    tb_clear = 1'b0;
    tb_rollover_val = 4'h7;
    reset_dut();

    #(CLK_PERIOD*15);    

    #(CLK_PERIOD/2.0);
    $display("TEST CASE 3");
    check_output(4'h1,1'b0);



    // ************************************************************************
    // Test Case 4: Discontinuous counting
    // ************************************************************************
    @(negedge tb_clk);
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Discontinuous counting";

    tb_count_enable = 1'b1;
    tb_n_rst = 1'b1;
    tb_clear = 1'b0;
    tb_rollover_val = 4'h2;
    reset_dut();

    @(posedge tb_clk);
    tb_count_enable = 1'b0;
    @(posedge tb_clk);
    tb_count_enable = 1'b1;
    @(posedge tb_clk);

    $display("TEST CASE 4");
    #(CLK_PERIOD/2.0);
    check_output(4'h2,1'b1);

    @(posedge tb_clk);
    DUT_clear();
    @(posedge tb_clk);
    #(CLK_PERIOD/2.0);
    check_output(4'h1,1'b0);



    // ************************************************************************
    // Test Case 5: Clearing while counting to check clear vs. count enable priority
    // ************************************************************************
    @(negedge tb_clk);
    tb_test_num = tb_test_num + 1;
    tb_test_case = "Clearing while counting to check clear vs. count enable priority";
    
    tb_count_enable = 1'b1;
    tb_n_rst = 1'b1;
    tb_clear = 1'b1;
    tb_rollover_val = 4'h2;
    reset_dut();

    @(posedge tb_clk);
    @(posedge tb_clk);

    $display("TEST CASE 5");
    #(CLK_PERIOD/2.0);
    check_output(4'h0,1'b0);
  end
endmodule