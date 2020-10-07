/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Oct  7 02:04:05 2020
/////////////////////////////////////////////////////////////


module rcu ( clk, n_rst, start_bit_detected, packet_done, framing_error, 
        sbc_clear, sbc_enable, load_buffer, enable_timer );
  input clk, n_rst, start_bit_detected, packet_done, framing_error;
  output sbc_clear, sbc_enable, load_buffer, enable_timer;
  wire   n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29;
  wire   [2:0] s;
  wire   [2:0] next_s;

  DFFSR \s_reg[0]  ( .D(next_s[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(s[0])
         );
  DFFSR \s_reg[2]  ( .D(next_s[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(s[2])
         );
  DFFSR \s_reg[1]  ( .D(next_s[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(s[1])
         );
  OAI21X1 U27 ( .A(n18), .B(n19), .C(n20), .Y(next_s[2]) );
  AOI21X1 U28 ( .A(n21), .B(s[2]), .C(sbc_enable), .Y(n20) );
  INVX1 U29 ( .A(n22), .Y(sbc_enable) );
  NOR2X1 U30 ( .A(s[1]), .B(framing_error), .Y(n21) );
  OAI21X1 U31 ( .A(n23), .B(n24), .C(n25), .Y(next_s[1]) );
  OR2X1 U32 ( .A(framing_error), .B(s[1]), .Y(n24) );
  NAND3X1 U33 ( .A(n26), .B(n22), .C(n25), .Y(next_s[0]) );
  AOI21X1 U34 ( .A(n19), .B(n27), .C(sbc_clear), .Y(n25) );
  AND2X1 U35 ( .A(n27), .B(n28), .Y(sbc_clear) );
  INVX1 U36 ( .A(packet_done), .Y(n19) );
  NAND3X1 U37 ( .A(n23), .B(n28), .C(s[2]), .Y(n22) );
  NAND3X1 U38 ( .A(n23), .B(n28), .C(start_bit_detected), .Y(n26) );
  NOR2X1 U39 ( .A(n28), .B(n29), .Y(load_buffer) );
  NAND2X1 U40 ( .A(s[2]), .B(n23), .Y(n29) );
  INVX1 U41 ( .A(s[1]), .Y(n28) );
  INVX1 U42 ( .A(n18), .Y(enable_timer) );
  NAND2X1 U43 ( .A(s[1]), .B(n27), .Y(n18) );
  NOR2X1 U44 ( .A(n23), .B(s[2]), .Y(n27) );
  INVX1 U45 ( .A(s[0]), .Y(n23) );
endmodule

