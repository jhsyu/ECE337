/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Sep 30 00:00:53 2020
/////////////////////////////////////////////////////////////


module moore ( clk, n_rst, i, o );
  input clk, n_rst, i;
  output o;
  wire   n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26;
  wire   [2:0] s;
  wire   [2:0] nxt_s;

  DFFSR \s_reg[0]  ( .D(nxt_s[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(s[0]) );
  DFFSR \s_reg[1]  ( .D(nxt_s[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(s[1]) );
  DFFSR \s_reg[2]  ( .D(nxt_s[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(s[2]) );
  INVX1 U21 ( .A(n16), .Y(o) );
  NOR2X1 U22 ( .A(n17), .B(n18), .Y(nxt_s[2]) );
  OAI21X1 U23 ( .A(n19), .B(n16), .C(n20), .Y(nxt_s[1]) );
  MUX2X1 U24 ( .B(n21), .A(n22), .S(s[1]), .Y(n20) );
  NOR2X1 U25 ( .A(s[2]), .B(s[0]), .Y(n22) );
  INVX1 U26 ( .A(n17), .Y(n21) );
  NAND3X1 U27 ( .A(i), .B(n23), .C(s[0]), .Y(n17) );
  NAND3X1 U28 ( .A(n24), .B(n18), .C(s[2]), .Y(n16) );
  INVX1 U29 ( .A(s[1]), .Y(n18) );
  NOR2X1 U30 ( .A(n25), .B(n26), .Y(nxt_s[0]) );
  NAND2X1 U31 ( .A(n24), .B(n23), .Y(n26) );
  INVX1 U32 ( .A(s[2]), .Y(n23) );
  INVX1 U33 ( .A(s[0]), .Y(n24) );
  XOR2X1 U34 ( .A(n19), .B(s[1]), .Y(n25) );
  INVX1 U35 ( .A(i), .Y(n19) );
endmodule

