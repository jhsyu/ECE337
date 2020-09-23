/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Sep 22 23:00:59 2020
/////////////////////////////////////////////////////////////


module flex_counter_NUM_CNT_BIT8_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module flex_counter_NUM_CNT_BIT8 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [7:0] rollover_val;
  output [7:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   \next_count[0] , N7, N8, N9, N10, N11, N12, N13, N14, N15,
         \eq_43/A[1] , \eq_43/A[2] , \eq_43/A[3] , \eq_43/A[4] , \eq_43/A[5] ,
         \eq_43/A[6] , \eq_43/A[7] , n1, n2, n3, n4, n5, n6, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54;

  DFFSR \count_out_reg[0]  ( .D(\next_count[0] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[0]) );
  DFFSR \count_out_reg[7]  ( .D(\eq_43/A[7] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[7]) );
  DFFSR \count_out_reg[6]  ( .D(\eq_43/A[6] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[6]) );
  DFFSR \count_out_reg[5]  ( .D(\eq_43/A[5] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[5]) );
  DFFSR \count_out_reg[4]  ( .D(\eq_43/A[4] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[4]) );
  DFFSR \count_out_reg[3]  ( .D(\eq_43/A[3] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[3]) );
  DFFSR \count_out_reg[2]  ( .D(\eq_43/A[2] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[2]) );
  DFFSR \count_out_reg[1]  ( .D(\eq_43/A[1] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[1]) );
  DFFSR rollover_flag_reg ( .D(N15), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  flex_counter_NUM_CNT_BIT8_DW01_inc_0 add_41 ( .A(count_out), .SUM({N14, N13, 
        N12, N11, N10, N9, N8, N7}) );
  NOR2X1 U5 ( .A(n1), .B(n2), .Y(N15) );
  NAND3X1 U6 ( .A(n3), .B(n4), .C(n5), .Y(n2) );
  NOR2X1 U14 ( .A(n6), .B(n16), .Y(n5) );
  XOR2X1 U15 ( .A(rollover_val[4]), .B(\eq_43/A[4] ), .Y(n16) );
  OAI21X1 U16 ( .A(count_enable), .B(n17), .C(n18), .Y(\eq_43/A[4] ) );
  NAND2X1 U17 ( .A(N11), .B(n19), .Y(n18) );
  INVX1 U18 ( .A(count_out[4]), .Y(n17) );
  XOR2X1 U19 ( .A(rollover_val[3]), .B(\eq_43/A[3] ), .Y(n6) );
  OAI21X1 U20 ( .A(count_enable), .B(n20), .C(n21), .Y(\eq_43/A[3] ) );
  NAND2X1 U21 ( .A(N10), .B(n19), .Y(n21) );
  XNOR2X1 U22 ( .A(rollover_val[5]), .B(\eq_43/A[5] ), .Y(n4) );
  OAI21X1 U23 ( .A(count_enable), .B(n22), .C(n23), .Y(\eq_43/A[5] ) );
  NAND2X1 U24 ( .A(N12), .B(n19), .Y(n23) );
  INVX1 U25 ( .A(count_out[5]), .Y(n22) );
  XNOR2X1 U26 ( .A(rollover_val[6]), .B(\eq_43/A[6] ), .Y(n3) );
  OAI21X1 U27 ( .A(count_enable), .B(n24), .C(n25), .Y(\eq_43/A[6] ) );
  NAND2X1 U28 ( .A(N13), .B(n19), .Y(n25) );
  NAND3X1 U29 ( .A(n26), .B(n27), .C(n28), .Y(n1) );
  NOR2X1 U30 ( .A(n29), .B(n30), .Y(n28) );
  XOR2X1 U31 ( .A(rollover_val[2]), .B(\eq_43/A[2] ), .Y(n30) );
  OAI21X1 U32 ( .A(count_enable), .B(n31), .C(n32), .Y(\eq_43/A[2] ) );
  NAND2X1 U33 ( .A(N9), .B(n19), .Y(n32) );
  XOR2X1 U34 ( .A(rollover_val[1]), .B(\eq_43/A[1] ), .Y(n29) );
  OAI21X1 U35 ( .A(count_enable), .B(n33), .C(n34), .Y(\eq_43/A[1] ) );
  NAND2X1 U36 ( .A(N8), .B(n19), .Y(n34) );
  INVX1 U37 ( .A(count_out[1]), .Y(n33) );
  XNOR2X1 U38 ( .A(rollover_val[7]), .B(\eq_43/A[7] ), .Y(n27) );
  OAI21X1 U39 ( .A(count_enable), .B(n35), .C(n36), .Y(\eq_43/A[7] ) );
  NAND2X1 U40 ( .A(N14), .B(n19), .Y(n36) );
  INVX1 U41 ( .A(n37), .Y(n19) );
  XNOR2X1 U42 ( .A(rollover_val[0]), .B(\next_count[0] ), .Y(n26) );
  OAI21X1 U43 ( .A(n37), .B(n38), .C(n39), .Y(\next_count[0] ) );
  MUX2X1 U44 ( .B(count_out[0]), .A(n40), .S(count_enable), .Y(n39) );
  NOR2X1 U45 ( .A(clear), .B(n41), .Y(n40) );
  INVX1 U46 ( .A(N7), .Y(n38) );
  NAND3X1 U47 ( .A(n41), .B(n42), .C(count_enable), .Y(n37) );
  INVX1 U48 ( .A(clear), .Y(n42) );
  OR2X1 U49 ( .A(n43), .B(n44), .Y(n41) );
  NAND3X1 U50 ( .A(n45), .B(n46), .C(n47), .Y(n44) );
  NOR2X1 U51 ( .A(n48), .B(n49), .Y(n47) );
  XOR2X1 U52 ( .A(rollover_val[5]), .B(count_out[5]), .Y(n49) );
  XOR2X1 U53 ( .A(rollover_val[4]), .B(count_out[4]), .Y(n48) );
  XOR2X1 U54 ( .A(n24), .B(rollover_val[6]), .Y(n46) );
  INVX1 U55 ( .A(count_out[6]), .Y(n24) );
  XOR2X1 U56 ( .A(n35), .B(rollover_val[7]), .Y(n45) );
  INVX1 U57 ( .A(count_out[7]), .Y(n35) );
  NAND3X1 U58 ( .A(n50), .B(n51), .C(n52), .Y(n43) );
  NOR2X1 U59 ( .A(n53), .B(n54), .Y(n52) );
  XOR2X1 U60 ( .A(rollover_val[1]), .B(count_out[1]), .Y(n54) );
  XOR2X1 U61 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n53) );
  XOR2X1 U62 ( .A(n31), .B(rollover_val[2]), .Y(n51) );
  INVX1 U63 ( .A(count_out[2]), .Y(n31) );
  XOR2X1 U64 ( .A(n20), .B(rollover_val[3]), .Y(n50) );
  INVX1 U65 ( .A(count_out[3]), .Y(n20) );
endmodule


module counter_8bit ( clk, clear, n_rst, count_enable, rollover_val, count_out, 
        rollover_flag, Port8 );
  input [7:0] rollover_val;
  output [7:0] count_out;
  input clk, clear, n_rst, count_enable, Port8;
  output rollover_flag;


  flex_counter_NUM_CNT_BIT8 __tmp204 ( .clk(clk), .n_rst(n_rst), .clear(clear), 
        .count_enable(count_enable), .rollover_val(rollover_val), .count_out(
        count_out), .rollover_flag(rollover_flag) );
endmodule

