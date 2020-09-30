// $Id: $
// File name:   tb_moore.sv
// Created:     9/29/2020
// Author:      Jiahao Xu
// Lab Section: 337-002
// Version:     1.0  Initial Design Entry
// Description: .
`timescale 1ns / 10ps

module tb_moore();
  // Define parameters
  // Common parameters
  localparam CLK_PERIOD        = 2.5;
  localparam RESET_OUTPUT_VALUE = 1'b0;
  localparam MAX_BIT_LENGTH = 8;

  // Declare Test Case Signals
  integer tb_test_num;
  string  tb_test_case;
  string  tb_stream_check_tag;
  int     tb_bit_num;
  logic   tb_mismatch;
  logic   tb_check;

  // Declare the Test Bench Signals for Expected Results
  logic tb_expected_ouput;
  logic tb_test_data [];

  // Declare DUT Connection Signals
  logic                tb_clk;
  logic                tb_n_rst;
  logic                tb_i;
  logic                tb_o;

// Task for standard DUT reset procedure
  task reset_dut;
  begin
    // Activate the reset
    tb_n_rst = 1'b0;

    // Maintain the reset for more than one cycle
    @(posedge tb_clk);
    @(posedge tb_clk);

    // Wait until safely away from rising edge of the clock before releasing
    @(negedge tb_clk);
    tb_n_rst = 1'b1;

    // Leave out of reset for a couple cycles before allowing other stimulus
    // Wait for negative clock edges, 
    // since inputs to DUT should normally be applied away from rising clock edges
    @(negedge tb_clk);
    @(negedge tb_clk);
  end
  endtask

  // Task to cleanly and consistently check DUT output values
  task check_output;
    input string check_tag;
  begin
    tb_mismatch = 1'b0;
    tb_check    = 1'b1;
    if(tb_expected_ouput == tb_o) begin // Check passed
      $info("Correct output %s during %s test case", check_tag, tb_test_case);
    end
    else begin // Check failed
      tb_mismatch = 1'b1;
      $error("Incorrect output %s during %s test case", check_tag, tb_test_case);
    end

    // Wait some small amount of time so check pulse timing is visible on waves
    #(0.1);
    tb_check =1'b0;
  end
  endtask

  // Task to manage the timing of sending one bit through the shift register
  task send_bit;
    input logic bit_to_send;
  begin
    // Synchronize to the negative edge of clock to prevent timing errors
    @(negedge tb_clk);
    tb_i = 1'b0;
    #(0.1);
    // Set the value of the bit
    tb_i = bit_to_send;

    // Wait for the value to have been shifted in on the rising clock edge
    //@(posedge tb_clk);
    //@(negedge tb_clk);

  end
  endtask

  // Task to contiguosly send a stream of bits through the shift register
  task send_stream;
    input logic bit_stream [];
  begin
    // Coniguously stream out all of the bits in the provided input vector
    for(tb_bit_num = 0; tb_bit_num < bit_stream.size(); tb_bit_num++) begin
      // Send the current bit
      send_bit(bit_stream[tb_bit_num]);
    end
  end
  endtask

  // Clock generation block
  always begin
    // Start with clock low to avoid false rising edge events at t=0
    tb_clk = 1'b0;
    // Wait half of the clock period before toggling clock value (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
    tb_clk = 1'b1;
    // Wait half of the clock period before toggling clock value via rerunning the block (maintain 50% duty cycle)
    #(CLK_PERIOD/2.0);
  end

  // DUT Portmap
    moore DUT (.clk(tb_clk), .n_rst(tb_n_rst), .i(tb_i), .o(tb_o));

  // Test bench main process
  initial begin
    // Initialize all of the test inputs
    tb_n_rst            = 1'b1; // Initialize to be inactive
    tb_test_num         = 0;    // Initialize test case counter
    tb_test_case        = "Test bench initializaton";
    tb_stream_check_tag = "N/A";
    tb_bit_num          = -1;   // Initialize to invalid number
    tb_mismatch         = 1'b0;
    tb_check            = 1'b0;
    // Wait some time before starting first test case
    #(0.1);

    // ************************************************************************
    // Test Case 1: Power-on Reset of the DUT
    // ************************************************************************
    tb_test_num  = tb_test_num + 1;
    tb_test_case = "Power on Reset";
    // Note: Do not use reset task during reset test case since we need to specifically check behavior during reset
    // Wait some time before applying test case stimulus
    #(0.1);
    // Apply test case initial stimulus
    tb_i = 1'b0;
    tb_n_rst     = 1'b0;

    // Wait for a bit before checking for correct functionality
    #(CLK_PERIOD * 0.5);

    // Check that internal state was correctly reset
    tb_expected_ouput = RESET_OUTPUT_VALUE;
    check_output("after reset applied");

    // Check that the reset value is maintained during a clock cycle
    #(CLK_PERIOD);
    check_output("after clock cycle while in reset");
    
    // Release the reset away from a clock edge
    @(negedge tb_clk);
    tb_n_rst  = 1'b1;   // Deactivate the chip reset
    // Check that internal state was correctly keep after reset release
    check_output("after reset was released");

    // ************************************************************************
    // Test Case 2: Normal Operation with Contiguous Zero Fill
    // ************************************************************************
    tb_test_num  = tb_test_num + 1;
    tb_test_case = "Contiguous Zero Fill";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_i = 1'b1;
    reset_dut();

    // Define the test data stream for this test case
    tb_test_data = '{MAX_BIT_LENGTH{1'b0}};

    // Define the expected result
    tb_expected_ouput = '0;

    // Contiguously stream enough zeros to fill the shift register
    send_stream(tb_test_data);

    // Check the result of the full stream
    check_output("after zero fill stream");


    // STUDENT TODO: Add more test cases here
    // ************************************************************************
    // Test Case 3: Normal Operation with Contiguous '1' Fill
    // ************************************************************************
    tb_test_num  = tb_test_num + 1;
    tb_test_case = "Contiguous one Fill";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_i = 1'b1;
    reset_dut();

    // Define the test data stream for this test case
    tb_test_data = '{MAX_BIT_LENGTH{1'b1}};

    // Define the expected result
    tb_expected_ouput = '0;

    // Contiguously stream enough zeros to fill the shift register
    send_stream(tb_test_data);

    // Check the result of the full stream
    check_output("after one fill stream");

    // ************************************************************************
    // Test Case 4: 1101 detects.
    // ************************************************************************
    tb_test_num  = tb_test_num + 1;
    tb_test_case = "single sequence detect";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_i = 1'b0;
    reset_dut();
    tb_test_data = '{1'b1,1'b1,1'b0,1'b1};

    // Contiguously stream enough zeros to fill the shift register
    send_stream(tb_test_data);
    @(posedge tb_clk);
    tb_expected_ouput = 1'b1;
    check_output("1101 detect");
    // ************************************************************************
    // Test Case 5: overlapping 1101 detects.
    // ************************************************************************
    tb_test_num  = tb_test_num + 1;
    tb_test_case = "overlapping 1101 detect";
    // Start out with inactive value and reset the DUT to isolate from prior tests
    tb_i = 1'b0;
    reset_dut();
    tb_test_data = '{1'b1,1'b1,1'b0,1'b1, 1'b1, 1'b0, 1'b1};
    // Contiguously stream enough zeros to fill the shift register
    send_stream(tb_test_data);
    @(posedge tb_clk);
    tb_expected_ouput = 1'b1;
    check_output("1101 detect");

  end
endmodule
