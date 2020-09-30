/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Sep 29 23:25:18 2020
/////////////////////////////////////////////////////////////


module mealy ( clk, n_rst, i, o );
  input clk, n_rst, i;
  output o;
  wire   n8, n9, n10;
  wire   [1:0] s;
  wire   [1:0] nxt_s;

  DFFSR \s_reg[0]  ( .D(nxt_s[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(s[0]) );
  DFFSR \s_reg[1]  ( .D(nxt_s[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(s[1]) );
  INVX1 U12 ( .A(n8), .Y(o) );
  MUX2X1 U13 ( .B(n9), .A(s[0]), .S(s[1]), .Y(nxt_s[1]) );
  NAND2X1 U14 ( .A(s[0]), .B(i), .Y(n9) );
  OAI21X1 U15 ( .A(s[0]), .B(n10), .C(n8), .Y(nxt_s[0]) );
  NAND3X1 U16 ( .A(s[0]), .B(i), .C(s[1]), .Y(n8) );
  XNOR2X1 U17 ( .A(i), .B(s[1]), .Y(n10) );
endmodule

