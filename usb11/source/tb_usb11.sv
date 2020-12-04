//  Module: tb_usb11
//
`timescale 1ns / 10ps
module tb_usb11();
    logic tb_clk;
    logic tb_n_rst;
    logic tb_d_plus;
    logic tb_d_minus;
    logic tb_r_enable;
    logic tb_empty;
    logic tb_full;
    logic tb_rcving;
    logic tb_r_error;

    logic [7:0] tb_r_data;
    logic [7:0] tb_test_byte;

    logic [3:0] tb_PID;
    logic [3:0] tb_expected_PID;
  
    integer test_num;
    integer count_1; 
    integer bit_num; 
    string test_info;

    localparam CLK_PERIOD = 1; 

    // Clock generation block
    always begin
        tb_clk = 1'b0;
        #(CLK_PERIOD/2.0);
        tb_clk = 1'b1;
        #(CLK_PERIOD/2.0);
    end


    task reset; begin
        @(negedge tb_clk); 
        tb_n_rst = 1'b0; 
        @(posedge tb_clk);
        #(CLK_PERIOD); 
        @(negedge tb_clk); 
        tb_n_rst = 1'b1; 
        @(negedge tb_clk); 
    end
    endtask

    task send_bit(
        input logic bit_to_send
    ); begin
        bit_num ++; 
        if (bit_to_send) begin
            count_1 ++;
            // used as calculating the stuff bits.  
            // counting consequtive 1's. 
        end
        if (bit_to_send == 1'b0) begin
            tb_d_plus = ~tb_d_plus;
            tb_d_minus = ~tb_d_plus; 
            count_1 = 0;
        end
        #(CLK_PERIOD * 8);
        // staff bits. 
        if (count_1 == 6) begin
            count_1 = 0; 
            tb_d_plus =  ~tb_d_plus;
            tb_d_minus = ~tb_d_plus;
            #(CLK_PERIOD * 8);   
            bit_num ++;  
        end
    end
    endtask

    task send_byte(
        input logic [7:0] byte_to_send
    );
    integer i; 
    begin
        bit_num = 0; 
        @(posedge tb_clk); 
        for (i = 0; i < 8; i++) begin
            send_bit(byte_to_send[i]); 
        end
    end 
    endtask

    task send_sync_byte();begin
        send_byte(8'h80); 
    end
    endtask

    task  send_eop();begin
        @(negedge tb_clk); 
        tb_d_plus = 1'b0; 
        tb_d_minus = 1'b0;
        #(CLK_PERIOD * 4); 
    end
    endtask
    
    task  send_PID(
        input logic [3:0] PID_to_send
    );begin
        send_byte({~PID_to_send, PID_to_send});
    end
    endtask

    task  check_fifo(
        input logic [7:0] expected_r_data
    ); begin
        if (tb_r_data == expected_r_data) begin
            $info("correct rdata in testcase %d", test_num);
        end
        else $error("incorrect rdata in testcase %d", test_num); 

        @(negedge tb_clk);
        tb_r_enable = 1;
        #(CLK_PERIOD);
        tb_r_enable = 0;
        #(CLK_PERIOD);    
    end
    endtask //

    task check_err(); begin   
        if(tb_r_error == 1) begin
            $info("correct error output in testcase %d", test_num);
        end 
        else $error("incorrect error output in testcase %d.", test_num);
    end
    endtask

    task check_PID(
        input logic[3:0] expected_PID
    ); begin
        if(tb_PID == expected_PID) begin
            $info("correct PID in testcase %d. ", test_num);
        end 
        else $error("incorrect PID in testcase %d. ", test_num);
    end
    endtask
      
      

    usb11 DUT (
        .clk(tb_clk),
        .n_rst(tb_n_rst),
        .d_plus(tb_d_plus),
        .d_minus(tb_d_minus),
        .r_enable(tb_r_enable),
        .r_data(tb_r_data),
        .empty(tb_empty),
        .full(tb_full),
        .rcving(tb_rcving),
        .r_error(tb_r_error),
        .PID(tb_PID)
    );   

    initial begin
        
    end
    
endmodule: tb_usb11
