/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Sep 17 17:20:15 2020
/////////////////////////////////////////////////////////////


module sync_high ( clk, n_rst, async_in, sync_out, Port5 );
  input clk, n_rst, async_in, Port5;
  output sync_out;
  wire   temp;

  DFFSR temp_reg ( .D(async_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(temp) );
  DFFSR sync_out_reg ( .D(temp), .CLK(clk), .R(1'b1), .S(n_rst), .Q(sync_out)
         );
endmodule

