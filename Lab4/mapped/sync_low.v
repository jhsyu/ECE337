/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Sep 17 17:10:51 2020
/////////////////////////////////////////////////////////////


module sync_low ( clk, n_rst, async_in, sync_out, Port5 );
  input clk, n_rst, async_in, Port5;
  output sync_out;
  wire   temp;

  DFFSR temp_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(temp) );
  DFFSR sync_out_reg ( .D(temp), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out)
         );
endmodule

