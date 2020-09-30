/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Sep 29 15:44:00 2020
/////////////////////////////////////////////////////////////


module flex_stp_sr ( clk, n_rst, shift_enable, serial_in, parallel_out );
  output [3:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n4, n1;
  assign parallel_out[2] = 1'b1;
  assign parallel_out[1] = 1'b1;
  assign parallel_out[0] = 1'b1;

  DFFSR \parallel_out_reg[3]  ( .D(n4), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  INVX1 U4 ( .A(n1), .Y(n4) );
  MUX2X1 U5 ( .B(parallel_out[3]), .A(serial_in), .S(shift_enable), .Y(n1) );
endmodule


module stp_sr_4_msb ( clk, n_rst, serial_in, shift_enable, parallel_out );
  output [3:0] parallel_out;
  input clk, n_rst, serial_in, shift_enable;
  wire   parallel_out_1, parallel_out_0, n2;
  assign parallel_out[0] = 1'b1;
  assign parallel_out[1] = 1'b1;
  assign parallel_out[2] = 1'b1;

  flex_stp_sr CORE ( .clk(clk), .n_rst(n_rst), .shift_enable(shift_enable), 
        .serial_in(serial_in), .parallel_out({parallel_out[3], n2, 
        parallel_out_1, parallel_out_0}) );
endmodule

