/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Oct  7 02:04:47 2020
/////////////////////////////////////////////////////////////


module flex_counter_NUM_CNT_BITS4_1 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N11, n13, n1, n2, n3, n4, n5, n6, n12, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33;
  wire   [3:0] next_count;

  DFFSR \count_out_reg[0]  ( .D(next_count[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(next_count[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n13), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(next_count[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[3]) );
  DFFSR rollover_flag_reg ( .D(N11), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  INVX1 U8 ( .A(n1), .Y(next_count[3]) );
  INVX1 U9 ( .A(n2), .Y(next_count[1]) );
  NOR2X1 U10 ( .A(n3), .B(n4), .Y(N11) );
  NAND2X1 U11 ( .A(n5), .B(n6), .Y(n4) );
  XOR2X1 U12 ( .A(n1), .B(rollover_val[3]), .Y(n6) );
  MUX2X1 U13 ( .B(n12), .A(n14), .S(count_out[3]), .Y(n1) );
  OAI21X1 U14 ( .A(count_out[2]), .B(n15), .C(n16), .Y(n14) );
  NOR2X1 U15 ( .A(n17), .B(n18), .Y(n12) );
  XOR2X1 U16 ( .A(n2), .B(rollover_val[1]), .Y(n5) );
  MUX2X1 U17 ( .B(n19), .A(n20), .S(count_out[1]), .Y(n2) );
  AND2X1 U18 ( .A(count_out[0]), .B(n21), .Y(n19) );
  NAND2X1 U19 ( .A(n22), .B(n23), .Y(n3) );
  XNOR2X1 U20 ( .A(rollover_val[0]), .B(next_count[0]), .Y(n23) );
  OAI22X1 U21 ( .A(count_out[0]), .B(n15), .C(clear), .D(n24), .Y(
        next_count[0]) );
  MUX2X1 U22 ( .B(count_out[0]), .A(n25), .S(count_enable), .Y(n24) );
  INVX1 U23 ( .A(n26), .Y(n25) );
  XNOR2X1 U24 ( .A(rollover_val[2]), .B(n13), .Y(n22) );
  MUX2X1 U25 ( .B(n18), .A(n16), .S(count_out[2]), .Y(n13) );
  AOI21X1 U26 ( .A(n27), .B(n21), .C(n20), .Y(n16) );
  OAI22X1 U27 ( .A(count_enable), .B(clear), .C(count_out[0]), .D(n15), .Y(n20) );
  NAND3X1 U28 ( .A(count_out[1]), .B(count_out[0]), .C(n21), .Y(n18) );
  INVX1 U29 ( .A(n15), .Y(n21) );
  NAND3X1 U30 ( .A(n26), .B(n28), .C(count_enable), .Y(n15) );
  INVX1 U31 ( .A(clear), .Y(n28) );
  NAND3X1 U32 ( .A(n29), .B(n30), .C(n31), .Y(n26) );
  NOR2X1 U33 ( .A(n32), .B(n33), .Y(n31) );
  XNOR2X1 U34 ( .A(rollover_val[1]), .B(n27), .Y(n33) );
  INVX1 U35 ( .A(count_out[1]), .Y(n27) );
  XOR2X1 U36 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n32) );
  XOR2X1 U37 ( .A(rollover_val[2]), .B(n17), .Y(n30) );
  INVX1 U38 ( .A(count_out[2]), .Y(n17) );
  XNOR2X1 U39 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n29) );
endmodule


module flex_counter_NUM_CNT_BITS4_0 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N11, n1, n2, n3, n4, n5, n6, n12, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34;
  wire   [3:0] next_count;

  DFFSR \count_out_reg[0]  ( .D(next_count[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(next_count[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n34), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(next_count[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[3]) );
  DFFSR rollover_flag_reg ( .D(N11), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  INVX1 U8 ( .A(n1), .Y(next_count[3]) );
  INVX1 U9 ( .A(n2), .Y(next_count[1]) );
  NOR2X1 U10 ( .A(n3), .B(n4), .Y(N11) );
  NAND2X1 U11 ( .A(n5), .B(n6), .Y(n4) );
  XOR2X1 U12 ( .A(n1), .B(rollover_val[3]), .Y(n6) );
  MUX2X1 U13 ( .B(n12), .A(n14), .S(count_out[3]), .Y(n1) );
  OAI21X1 U14 ( .A(count_out[2]), .B(n15), .C(n16), .Y(n14) );
  NOR2X1 U15 ( .A(n17), .B(n18), .Y(n12) );
  XOR2X1 U16 ( .A(n2), .B(rollover_val[1]), .Y(n5) );
  MUX2X1 U17 ( .B(n19), .A(n20), .S(count_out[1]), .Y(n2) );
  AND2X1 U18 ( .A(count_out[0]), .B(n21), .Y(n19) );
  NAND2X1 U19 ( .A(n22), .B(n23), .Y(n3) );
  XNOR2X1 U20 ( .A(rollover_val[0]), .B(next_count[0]), .Y(n23) );
  OAI22X1 U21 ( .A(count_out[0]), .B(n15), .C(clear), .D(n24), .Y(
        next_count[0]) );
  MUX2X1 U22 ( .B(count_out[0]), .A(n25), .S(count_enable), .Y(n24) );
  INVX1 U23 ( .A(n26), .Y(n25) );
  XNOR2X1 U24 ( .A(rollover_val[2]), .B(n34), .Y(n22) );
  MUX2X1 U25 ( .B(n18), .A(n16), .S(count_out[2]), .Y(n34) );
  AOI21X1 U26 ( .A(n27), .B(n21), .C(n20), .Y(n16) );
  OAI22X1 U27 ( .A(count_enable), .B(clear), .C(count_out[0]), .D(n15), .Y(n20) );
  NAND3X1 U28 ( .A(count_out[1]), .B(count_out[0]), .C(n21), .Y(n18) );
  INVX1 U29 ( .A(n15), .Y(n21) );
  NAND3X1 U30 ( .A(n26), .B(n28), .C(count_enable), .Y(n15) );
  INVX1 U31 ( .A(clear), .Y(n28) );
  NAND3X1 U32 ( .A(n29), .B(n30), .C(n31), .Y(n26) );
  NOR2X1 U33 ( .A(n32), .B(n33), .Y(n31) );
  XNOR2X1 U34 ( .A(rollover_val[1]), .B(n27), .Y(n33) );
  INVX1 U35 ( .A(count_out[1]), .Y(n27) );
  XOR2X1 U36 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n32) );
  XOR2X1 U37 ( .A(rollover_val[2]), .B(n17), .Y(n30) );
  INVX1 U38 ( .A(count_out[2]), .Y(n17) );
  XNOR2X1 U39 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n29) );
endmodule


module timer ( clk, n_rst, enable_timer, shift_enable, packet_done );
  input clk, n_rst, enable_timer;
  output shift_enable, packet_done;
  wire   n1;

  flex_counter_NUM_CNT_BITS4_1 clk_divder ( .clk(clk), .n_rst(n_rst), .clear(
        n1), .count_enable(enable_timer), .rollover_val({1'b1, 1'b0, 1'b1, 
        1'b0}), .rollover_flag(shift_enable) );
  flex_counter_NUM_CNT_BITS4_0 controller ( .clk(clk), .n_rst(n_rst), .clear(
        n1), .count_enable(shift_enable), .rollover_val({1'b1, 1'b0, 1'b0, 
        1'b1}), .rollover_flag(packet_done) );
  INVX1 U4 ( .A(enable_timer), .Y(n1) );
endmodule

