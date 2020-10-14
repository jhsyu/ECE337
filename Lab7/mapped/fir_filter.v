/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Oct 13 22:48:12 2020
/////////////////////////////////////////////////////////////


module sync_low_1 ( clk, n_rst, async_in, sync_out, Port5 );
  input clk, n_rst, async_in, Port5;
  output sync_out;
  wire   temp;

  DFFSR temp_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(temp) );
  DFFSR sync_out_reg ( .D(temp), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out)
         );
endmodule


module sync_low_0 ( clk, n_rst, async_in, sync_out, Port5 );
  input clk, n_rst, async_in, Port5;
  output sync_out;
  wire   temp;

  DFFSR temp_reg ( .D(async_in), .CLK(clk), .R(n_rst), .S(1'b1), .Q(temp) );
  DFFSR sync_out_reg ( .D(temp), .CLK(clk), .R(n_rst), .S(1'b1), .Q(sync_out)
         );
endmodule


module controller ( clk, n_rst, dr, lc, overflow, cnt_up, clear, modwait, err, 
        op, src1, src2, dest );
  output [2:0] op;
  output [3:0] src1;
  output [3:0] src2;
  output [3:0] dest;
  input clk, n_rst, dr, lc, overflow;
  output cnt_up, clear, modwait, err;
  wire   lc, n146, next_modwait, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n37, n38, n39, n41, n42, n44, n45, n46, n47,
         n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142;
  wire   [4:0] s;
  wire   [4:0] next_s;
  assign src1[3] = 1'b0;
  assign clear = lc;

  DFFSR \s_reg[0]  ( .D(next_s[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(s[0])
         );
  DFFSR \s_reg[1]  ( .D(next_s[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(s[1])
         );
  DFFSR \s_reg[2]  ( .D(next_s[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(s[2])
         );
  DFFSR \s_reg[3]  ( .D(next_s[3]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(s[3])
         );
  DFFSR \s_reg[4]  ( .D(next_s[4]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(s[4])
         );
  DFFSR modwait_reg ( .D(next_modwait), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        modwait) );
  INVX4 U9 ( .A(n44), .Y(n27) );
  INVX4 U10 ( .A(n41), .Y(n48) );
  INVX2 U11 ( .A(n77), .Y(n87) );
  BUFX2 U12 ( .A(s[0]), .Y(n42) );
  BUFX2 U13 ( .A(n137), .Y(n9) );
  BUFX2 U14 ( .A(n117), .Y(n7) );
  INVX2 U15 ( .A(n56), .Y(n8) );
  AND2X2 U16 ( .A(s[2]), .B(n45), .Y(n10) );
  AND2X2 U17 ( .A(n116), .B(n84), .Y(n11) );
  INVX2 U18 ( .A(n11), .Y(src2[2]) );
  NAND2X1 U19 ( .A(n87), .B(n21), .Y(n12) );
  AND2X2 U20 ( .A(n130), .B(n126), .Y(n13) );
  AND2X2 U21 ( .A(n101), .B(n89), .Y(n14) );
  AND2X2 U22 ( .A(cnt_up), .B(n61), .Y(n15) );
  INVX1 U23 ( .A(n35), .Y(n16) );
  INVX2 U24 ( .A(n16), .Y(n17) );
  BUFX2 U25 ( .A(n37), .Y(n18) );
  INVX1 U26 ( .A(n119), .Y(n19) );
  INVX2 U27 ( .A(n19), .Y(n20) );
  BUFX2 U28 ( .A(n64), .Y(n21) );
  BUFX2 U29 ( .A(n118), .Y(n22) );
  INVX1 U30 ( .A(n49), .Y(n23) );
  OR2X1 U31 ( .A(n24), .B(n82), .Y(next_s[1]) );
  NAND2X1 U32 ( .A(n13), .B(n96), .Y(n24) );
  INVX2 U33 ( .A(n99), .Y(n25) );
  AND2X2 U34 ( .A(n83), .B(n119), .Y(n26) );
  INVX1 U35 ( .A(s[3]), .Y(n45) );
  BUFX2 U36 ( .A(n115), .Y(n28) );
  INVX1 U37 ( .A(n52), .Y(n29) );
  NAND2X1 U38 ( .A(n87), .B(n27), .Y(n30) );
  BUFX2 U39 ( .A(n29), .Y(n39) );
  AND2X1 U40 ( .A(n12), .B(n114), .Y(n33) );
  AND2X1 U41 ( .A(n30), .B(n92), .Y(n93) );
  AND2X2 U42 ( .A(n33), .B(n11), .Y(n31) );
  AND2X2 U43 ( .A(n85), .B(n97), .Y(n32) );
  AND2X2 U44 ( .A(n83), .B(n84), .Y(n34) );
  AND2X2 U45 ( .A(n32), .B(n129), .Y(n35) );
  OR2X1 U46 ( .A(n112), .B(n111), .Y(dest[1]) );
  AND2X2 U47 ( .A(n45), .B(n52), .Y(n37) );
  AND2X2 U48 ( .A(s[3]), .B(n29), .Y(n38) );
  INVX1 U49 ( .A(n97), .Y(n99) );
  INVX2 U50 ( .A(n78), .Y(n75) );
  BUFX2 U51 ( .A(s[0]), .Y(n41) );
  BUFX4 U52 ( .A(n146), .Y(src1[2]) );
  INVX1 U53 ( .A(src1[2]), .Y(n80) );
  INVX1 U54 ( .A(overflow), .Y(n137) );
  INVX2 U55 ( .A(s[4]), .Y(n56) );
  INVX2 U56 ( .A(s[1]), .Y(n47) );
  NAND3X1 U57 ( .A(n42), .B(n56), .C(n47), .Y(n44) );
  NAND2X1 U58 ( .A(n38), .B(n27), .Y(n114) );
  NAND3X1 U59 ( .A(s[1]), .B(n56), .C(n48), .Y(n78) );
  NAND2X1 U60 ( .A(n75), .B(n10), .Y(n115) );
  NAND2X1 U61 ( .A(n10), .B(n27), .Y(n118) );
  NAND3X1 U62 ( .A(n115), .B(n114), .C(n118), .Y(n146) );
  NAND2X1 U63 ( .A(n8), .B(s[1]), .Y(n46) );
  INVX2 U64 ( .A(s[2]), .Y(n52) );
  NAND2X1 U65 ( .A(n37), .B(n42), .Y(n66) );
  INVX2 U66 ( .A(n46), .Y(n91) );
  NAND3X1 U67 ( .A(n91), .B(n37), .C(n48), .Y(n108) );
  OAI21X1 U68 ( .A(n46), .B(n66), .C(n108), .Y(n112) );
  INVX2 U69 ( .A(n112), .Y(n128) );
  NAND2X1 U70 ( .A(s[4]), .B(n47), .Y(n53) );
  NAND2X1 U71 ( .A(n53), .B(n46), .Y(n65) );
  NAND3X1 U72 ( .A(n10), .B(n48), .C(n65), .Y(n101) );
  INVX2 U73 ( .A(n53), .Y(n50) );
  NAND3X1 U74 ( .A(n10), .B(n42), .C(n50), .Y(n89) );
  NAND3X1 U75 ( .A(n48), .B(n56), .C(n47), .Y(n49) );
  INVX2 U76 ( .A(n49), .Y(n62) );
  NAND2X1 U77 ( .A(n62), .B(n18), .Y(n132) );
  INVX2 U78 ( .A(n132), .Y(n100) );
  NAND2X1 U79 ( .A(n50), .B(n37), .Y(n113) );
  INVX2 U80 ( .A(n113), .Y(n122) );
  AOI21X1 U81 ( .A(n100), .B(lc), .C(n122), .Y(n51) );
  NAND3X1 U82 ( .A(n128), .B(n14), .C(n51), .Y(next_s[4]) );
  NAND2X1 U83 ( .A(s[3]), .B(n52), .Y(n77) );
  OAI21X1 U84 ( .A(n62), .B(n75), .C(n87), .Y(n97) );
  INVX2 U85 ( .A(n101), .Y(n55) );
  INVX2 U86 ( .A(lc), .Y(n90) );
  OAI21X1 U87 ( .A(n39), .B(n53), .C(n108), .Y(n54) );
  AOI21X1 U88 ( .A(n55), .B(n90), .C(n54), .Y(n58) );
  NAND3X1 U89 ( .A(s[1]), .B(n56), .C(n42), .Y(n57) );
  INVX2 U90 ( .A(n57), .Y(n64) );
  NAND2X1 U91 ( .A(n87), .B(n64), .Y(n83) );
  NAND2X1 U92 ( .A(n64), .B(n37), .Y(n119) );
  NAND2X1 U93 ( .A(n38), .B(n21), .Y(n133) );
  INVX2 U94 ( .A(n133), .Y(err) );
  INVX2 U95 ( .A(dr), .Y(n61) );
  NAND3X1 U96 ( .A(err), .B(n61), .C(n90), .Y(n92) );
  NAND3X1 U97 ( .A(n58), .B(n26), .C(n92), .Y(n59) );
  NOR2X1 U98 ( .A(src1[2]), .B(n59), .Y(n60) );
  OAI21X1 U99 ( .A(n9), .B(n25), .C(n60), .Y(n71) );
  NAND2X1 U100 ( .A(n27), .B(n18), .Y(n126) );
  INVX2 U101 ( .A(n126), .Y(cnt_up) );
  NAND2X1 U102 ( .A(s[4]), .B(s[3]), .Y(n73) );
  NAND2X1 U103 ( .A(n38), .B(n62), .Y(n85) );
  NAND2X1 U104 ( .A(n10), .B(n23), .Y(n117) );
  NAND3X1 U105 ( .A(n73), .B(n85), .C(n7), .Y(n63) );
  NOR2X1 U106 ( .A(n15), .B(n63), .Y(n70) );
  NAND2X1 U107 ( .A(n38), .B(n75), .Y(n129) );
  INVX2 U108 ( .A(n129), .Y(n123) );
  NAND2X1 U109 ( .A(overflow), .B(n123), .Y(n72) );
  NAND2X1 U110 ( .A(n87), .B(n27), .Y(n116) );
  NAND2X1 U111 ( .A(n64), .B(n10), .Y(n84) );
  INVX2 U112 ( .A(n65), .Y(n67) );
  OAI22X1 U113 ( .A(lc), .B(n89), .C(n67), .D(n66), .Y(n68) );
  AOI21X1 U114 ( .A(overflow), .B(src2[2]), .C(n68), .Y(n69) );
  NAND3X1 U115 ( .A(n70), .B(n72), .C(n69), .Y(n98) );
  OR2X1 U116 ( .A(n71), .B(n98), .Y(next_s[2]) );
  NAND2X1 U117 ( .A(n73), .B(n72), .Y(n76) );
  NOR2X1 U118 ( .A(n15), .B(n76), .Y(n74) );
  NAND2X1 U119 ( .A(n31), .B(n32), .Y(n138) );
  INVX2 U120 ( .A(n138), .Y(n131) );
  NAND3X1 U121 ( .A(n74), .B(n131), .C(n92), .Y(next_s[3]) );
  NAND2X1 U122 ( .A(n75), .B(n37), .Y(n130) );
  INVX2 U123 ( .A(n76), .Y(n81) );
  OAI21X1 U124 ( .A(n78), .B(n77), .C(n128), .Y(n79) );
  INVX2 U125 ( .A(n79), .Y(n125) );
  NAND3X1 U126 ( .A(n81), .B(n80), .C(n125), .Y(n82) );
  NAND2X1 U127 ( .A(n34), .B(n85), .Y(n86) );
  OAI21X1 U128 ( .A(n87), .B(n86), .C(overflow), .Y(n88) );
  OAI21X1 U129 ( .A(n90), .B(n89), .C(n88), .Y(n95) );
  NAND2X1 U130 ( .A(n91), .B(n10), .Y(n135) );
  OAI21X1 U131 ( .A(n42), .B(n135), .C(n93), .Y(n94) );
  NOR2X1 U132 ( .A(n95), .B(n94), .Y(n96) );
  NOR2X1 U133 ( .A(n99), .B(n98), .Y(n107) );
  NAND2X1 U134 ( .A(n130), .B(n28), .Y(n121) );
  INVX2 U135 ( .A(n121), .Y(n106) );
  NAND2X1 U136 ( .A(n100), .B(dr), .Y(n102) );
  MUX2X1 U137 ( .B(n102), .A(n101), .S(lc), .Y(n104) );
  OAI21X1 U138 ( .A(n33), .B(n9), .C(n133), .Y(n103) );
  NOR2X1 U139 ( .A(n104), .B(n103), .Y(n105) );
  NAND3X1 U140 ( .A(n107), .B(n106), .C(n105), .Y(next_s[0]) );
  OAI21X1 U141 ( .A(n42), .B(n113), .C(n20), .Y(n110) );
  NAND3X1 U142 ( .A(n22), .B(n126), .C(n108), .Y(n109) );
  OR2X1 U143 ( .A(n110), .B(n109), .Y(dest[0]) );
  NAND3X1 U144 ( .A(n117), .B(n22), .C(n31), .Y(n111) );
  NAND3X1 U145 ( .A(n128), .B(n28), .C(n126), .Y(dest[2]) );
  NAND2X1 U146 ( .A(n31), .B(n113), .Y(dest[3]) );
  NAND2X1 U147 ( .A(n114), .B(n30), .Y(src2[0]) );
  NAND2X1 U148 ( .A(n11), .B(n35), .Y(src2[1]) );
  NAND2X1 U149 ( .A(n33), .B(n17), .Y(src2[3]) );
  NAND3X1 U150 ( .A(n117), .B(n115), .C(n34), .Y(src1[0]) );
  NAND3X1 U151 ( .A(n30), .B(n117), .C(n26), .Y(src1[1]) );
  NAND3X1 U152 ( .A(n20), .B(n118), .C(n117), .Y(n120) );
  NOR2X1 U153 ( .A(n121), .B(n120), .Y(n142) );
  NOR2X1 U154 ( .A(n123), .B(n122), .Y(n124) );
  NAND3X1 U155 ( .A(n125), .B(n142), .C(n124), .Y(op[0]) );
  INVX2 U156 ( .A(dest[3]), .Y(n127) );
  NAND3X1 U157 ( .A(n128), .B(n127), .C(n126), .Y(op[1]) );
  NAND3X1 U158 ( .A(n131), .B(n130), .C(n129), .Y(op[2]) );
  NAND2X1 U159 ( .A(n133), .B(n132), .Y(n134) );
  OAI21X1 U160 ( .A(cnt_up), .B(n134), .C(dr), .Y(n141) );
  INVX2 U161 ( .A(n134), .Y(n136) );
  NAND3X1 U162 ( .A(n14), .B(n136), .C(n135), .Y(n139) );
  AOI22X1 U163 ( .A(lc), .B(n139), .C(n138), .D(n9), .Y(n140) );
  NAND3X1 U164 ( .A(n142), .B(n141), .C(n140), .Y(next_modwait) );
endmodule


module flex_counter_NUM_CNT_BITS10_DW01_inc_0 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module flex_counter_NUM_CNT_BITS10 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [9:0] rollover_val;
  output [9:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n1, n2, n3, n4, n5, n6, n7, n8, n20, n21, n22, n23, n24, n25;
  wire   [9:0] next_count;

  DFFSR \count_out_reg[0]  ( .D(next_count[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(next_count[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(next_count[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(next_count[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[3]) );
  DFFSR \count_out_reg[4]  ( .D(next_count[4]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[4]) );
  DFFSR \count_out_reg[5]  ( .D(next_count[5]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[5]) );
  DFFSR \count_out_reg[6]  ( .D(next_count[6]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[6]) );
  DFFSR \count_out_reg[7]  ( .D(next_count[7]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[7]) );
  DFFSR \count_out_reg[8]  ( .D(next_count[8]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[8]) );
  DFFSR \count_out_reg[9]  ( .D(next_count[9]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[9]) );
  DFFSR rollover_flag_reg ( .D(N17), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  NOR2X1 U28 ( .A(n34), .B(n35), .Y(N17) );
  NAND3X1 U29 ( .A(n36), .B(n37), .C(n38), .Y(n35) );
  NOR2X1 U30 ( .A(n39), .B(n40), .Y(n38) );
  XOR2X1 U31 ( .A(next_count[0]), .B(rollover_val[0]), .Y(n40) );
  OAI21X1 U32 ( .A(n3), .B(n41), .C(n42), .Y(next_count[0]) );
  AOI22X1 U33 ( .A(n43), .B(n4), .C(N7), .D(n1), .Y(n42) );
  NOR2X1 U34 ( .A(clear), .B(n25), .Y(n43) );
  XOR2X1 U35 ( .A(rollover_val[1]), .B(next_count[1]), .Y(n39) );
  OAI21X1 U36 ( .A(n5), .B(n41), .C(n45), .Y(next_count[1]) );
  NAND2X1 U37 ( .A(N8), .B(n1), .Y(n45) );
  XNOR2X1 U38 ( .A(rollover_val[2]), .B(next_count[2]), .Y(n37) );
  OAI21X1 U39 ( .A(n6), .B(n41), .C(n46), .Y(next_count[2]) );
  NAND2X1 U40 ( .A(N9), .B(n1), .Y(n46) );
  NOR2X1 U41 ( .A(n47), .B(n48), .Y(n36) );
  XOR2X1 U42 ( .A(rollover_val[5]), .B(next_count[5]), .Y(n48) );
  OAI21X1 U43 ( .A(n20), .B(n41), .C(n49), .Y(next_count[5]) );
  NAND2X1 U44 ( .A(N12), .B(n1), .Y(n49) );
  XOR2X1 U45 ( .A(rollover_val[4]), .B(next_count[4]), .Y(n47) );
  OAI21X1 U46 ( .A(n8), .B(n41), .C(n50), .Y(next_count[4]) );
  NAND2X1 U47 ( .A(N11), .B(n1), .Y(n50) );
  NAND3X1 U48 ( .A(n51), .B(n52), .C(n53), .Y(n34) );
  NOR2X1 U49 ( .A(n54), .B(n55), .Y(n53) );
  XOR2X1 U50 ( .A(rollover_val[6]), .B(next_count[6]), .Y(n55) );
  OAI21X1 U51 ( .A(n21), .B(n41), .C(n56), .Y(next_count[6]) );
  NAND2X1 U52 ( .A(N13), .B(n1), .Y(n56) );
  XOR2X1 U53 ( .A(rollover_val[9]), .B(next_count[9]), .Y(n54) );
  OAI21X1 U54 ( .A(n24), .B(n41), .C(n57), .Y(next_count[9]) );
  NAND2X1 U55 ( .A(N16), .B(n1), .Y(n57) );
  XNOR2X1 U56 ( .A(rollover_val[3]), .B(next_count[3]), .Y(n52) );
  OAI21X1 U57 ( .A(n7), .B(n41), .C(n58), .Y(next_count[3]) );
  NAND2X1 U58 ( .A(N10), .B(n1), .Y(n58) );
  NOR2X1 U59 ( .A(n59), .B(n60), .Y(n51) );
  XOR2X1 U60 ( .A(rollover_val[8]), .B(next_count[8]), .Y(n60) );
  OAI21X1 U61 ( .A(n23), .B(n41), .C(n61), .Y(next_count[8]) );
  NAND2X1 U62 ( .A(N15), .B(n1), .Y(n61) );
  XOR2X1 U63 ( .A(rollover_val[7]), .B(next_count[7]), .Y(n59) );
  OAI21X1 U64 ( .A(n22), .B(n41), .C(n62), .Y(next_count[7]) );
  NAND2X1 U65 ( .A(N14), .B(n1), .Y(n62) );
  NAND3X1 U66 ( .A(n44), .B(n2), .C(count_enable), .Y(n63) );
  NAND3X1 U67 ( .A(n64), .B(n65), .C(n66), .Y(n44) );
  NOR2X1 U68 ( .A(n67), .B(n68), .Y(n66) );
  NAND2X1 U69 ( .A(n69), .B(n70), .Y(n68) );
  XOR2X1 U70 ( .A(n24), .B(rollover_val[9]), .Y(n70) );
  XOR2X1 U71 ( .A(n21), .B(rollover_val[6]), .Y(n69) );
  NAND3X1 U72 ( .A(n71), .B(n72), .C(n73), .Y(n67) );
  XOR2X1 U73 ( .A(n7), .B(rollover_val[3]), .Y(n73) );
  XOR2X1 U74 ( .A(n22), .B(rollover_val[7]), .Y(n72) );
  XOR2X1 U75 ( .A(n23), .B(rollover_val[8]), .Y(n71) );
  NOR2X1 U76 ( .A(n74), .B(n75), .Y(n65) );
  NAND2X1 U77 ( .A(n76), .B(n77), .Y(n75) );
  XOR2X1 U78 ( .A(n8), .B(rollover_val[4]), .Y(n77) );
  XOR2X1 U79 ( .A(n20), .B(rollover_val[5]), .Y(n76) );
  XOR2X1 U80 ( .A(rollover_val[2]), .B(count_out[2]), .Y(n74) );
  NOR2X1 U81 ( .A(n78), .B(n79), .Y(n64) );
  XOR2X1 U82 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n79) );
  XOR2X1 U83 ( .A(rollover_val[1]), .B(count_out[1]), .Y(n78) );
  NAND2X1 U84 ( .A(n2), .B(n25), .Y(n41) );
  flex_counter_NUM_CNT_BITS10_DW01_inc_0 add_41 ( .A(count_out), .SUM({N16, 
        N15, N14, N13, N12, N11, N10, N9, N8, N7}) );
  INVX2 U14 ( .A(n63), .Y(n1) );
  INVX2 U15 ( .A(clear), .Y(n2) );
  INVX2 U16 ( .A(count_out[0]), .Y(n3) );
  INVX2 U17 ( .A(n44), .Y(n4) );
  INVX2 U18 ( .A(count_out[1]), .Y(n5) );
  INVX2 U19 ( .A(count_out[2]), .Y(n6) );
  INVX2 U20 ( .A(count_out[3]), .Y(n7) );
  INVX2 U21 ( .A(count_out[4]), .Y(n8) );
  INVX2 U22 ( .A(count_out[5]), .Y(n20) );
  INVX2 U23 ( .A(count_out[6]), .Y(n21) );
  INVX2 U24 ( .A(count_out[7]), .Y(n22) );
  INVX2 U25 ( .A(count_out[8]), .Y(n23) );
  INVX2 U26 ( .A(count_out[9]), .Y(n24) );
  INVX2 U27 ( .A(count_enable), .Y(n25) );
endmodule


module counter ( clk, n_rst, cnt_up, clear, one_k_samples );
  input clk, n_rst, cnt_up, clear;
  output one_k_samples;


  flex_counter_NUM_CNT_BITS10 flx_cnt ( .clk(clk), .n_rst(n_rst), .clear(clear), .count_enable(cnt_up), .rollover_val({1'b1, 1'b1, 1'b1, 1'b1, 1'b1, 1'b0, 
        1'b1, 1'b0, 1'b0, 1'b0}), .rollover_flag(one_k_samples) );
endmodule


module datapath_decode ( op, w_en, w_data_sel, alu_op );
  input [2:0] op;
  output [1:0] w_data_sel;
  output [1:0] alu_op;
  output w_en;
  wire   n4, n5, n1, n2, n3;

  NAND3X1 U6 ( .A(n1), .B(n3), .C(n2), .Y(w_en) );
  NOR2X1 U7 ( .A(n2), .B(w_data_sel[1]), .Y(w_data_sel[0]) );
  NAND2X1 U8 ( .A(op[1]), .B(n3), .Y(w_data_sel[1]) );
  OAI21X1 U9 ( .A(n3), .B(n4), .C(n5), .Y(alu_op[1]) );
  NAND3X1 U10 ( .A(op[0]), .B(n1), .C(op[2]), .Y(n5) );
  NAND2X1 U11 ( .A(op[1]), .B(n2), .Y(n4) );
  NOR2X1 U12 ( .A(op[0]), .B(n3), .Y(alu_op[0]) );
  INVX2 U3 ( .A(op[1]), .Y(n1) );
  INVX2 U4 ( .A(op[0]), .Y(n2) );
  INVX2 U5 ( .A(op[2]), .Y(n3) );
endmodule


module alu_DW01_sub_1 ( A, B, CI, DIFF, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n22, n24, n25, n26, n27, n28, n30, n32, n33, n34,
         n35, n36, n38, n40, n41, n42, n43, n44, n46, n48, n49, n50, n51, n52,
         n54, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69, n70, n71, n73, n75, n77, n79, n81, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n103, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182;

  XOR2X1 U4 ( .A(n175), .B(n1), .Y(DIFF[14]) );
  OAI21X1 U5 ( .A(n20), .B(n18), .C(n19), .Y(n17) );
  NAND2X1 U6 ( .A(n19), .B(n73), .Y(n1) );
  NOR2X1 U8 ( .A(A[14]), .B(n88), .Y(n18) );
  NAND2X1 U9 ( .A(A[14]), .B(n88), .Y(n19) );
  XNOR2X1 U10 ( .A(n176), .B(n2), .Y(DIFF[13]) );
  AOI21X1 U11 ( .A(n181), .B(n25), .C(n22), .Y(n20) );
  NAND2X1 U14 ( .A(n24), .B(n181), .Y(n2) );
  NAND2X1 U17 ( .A(A[13]), .B(n89), .Y(n24) );
  XOR2X1 U18 ( .A(n28), .B(n3), .Y(DIFF[12]) );
  OAI21X1 U19 ( .A(n28), .B(n26), .C(n27), .Y(n25) );
  NAND2X1 U20 ( .A(n27), .B(n75), .Y(n3) );
  NOR2X1 U22 ( .A(A[12]), .B(n90), .Y(n26) );
  NAND2X1 U23 ( .A(A[12]), .B(n90), .Y(n27) );
  XNOR2X1 U24 ( .A(n33), .B(n4), .Y(DIFF[11]) );
  AOI21X1 U25 ( .A(n180), .B(n33), .C(n30), .Y(n28) );
  NAND2X1 U28 ( .A(n32), .B(n180), .Y(n4) );
  NAND2X1 U31 ( .A(A[11]), .B(n91), .Y(n32) );
  XOR2X1 U32 ( .A(n36), .B(n5), .Y(DIFF[10]) );
  OAI21X1 U33 ( .A(n36), .B(n34), .C(n35), .Y(n33) );
  NAND2X1 U34 ( .A(n35), .B(n77), .Y(n5) );
  NOR2X1 U36 ( .A(A[10]), .B(n92), .Y(n34) );
  NAND2X1 U37 ( .A(A[10]), .B(n92), .Y(n35) );
  XNOR2X1 U38 ( .A(n41), .B(n6), .Y(DIFF[9]) );
  AOI21X1 U39 ( .A(n162), .B(n41), .C(n38), .Y(n36) );
  NAND2X1 U42 ( .A(n40), .B(n162), .Y(n6) );
  NAND2X1 U45 ( .A(A[9]), .B(n93), .Y(n40) );
  XOR2X1 U46 ( .A(n44), .B(n7), .Y(DIFF[8]) );
  OAI21X1 U47 ( .A(n44), .B(n42), .C(n43), .Y(n41) );
  NAND2X1 U48 ( .A(n43), .B(n79), .Y(n7) );
  NOR2X1 U50 ( .A(A[8]), .B(n94), .Y(n42) );
  NAND2X1 U51 ( .A(A[8]), .B(n94), .Y(n43) );
  XNOR2X1 U52 ( .A(n49), .B(n8), .Y(DIFF[7]) );
  AOI21X1 U53 ( .A(n163), .B(n49), .C(n46), .Y(n44) );
  NAND2X1 U56 ( .A(n48), .B(n163), .Y(n8) );
  NAND2X1 U59 ( .A(A[7]), .B(n95), .Y(n48) );
  XOR2X1 U60 ( .A(n52), .B(n9), .Y(DIFF[6]) );
  OAI21X1 U61 ( .A(n52), .B(n50), .C(n51), .Y(n49) );
  NAND2X1 U62 ( .A(n51), .B(n81), .Y(n9) );
  NOR2X1 U64 ( .A(A[6]), .B(n96), .Y(n50) );
  NAND2X1 U65 ( .A(A[6]), .B(n96), .Y(n51) );
  XNOR2X1 U66 ( .A(n57), .B(n10), .Y(DIFF[5]) );
  AOI21X1 U67 ( .A(n179), .B(n57), .C(n54), .Y(n52) );
  NAND2X1 U70 ( .A(n56), .B(n179), .Y(n10) );
  NAND2X1 U73 ( .A(A[5]), .B(n97), .Y(n56) );
  XOR2X1 U74 ( .A(n60), .B(n11), .Y(DIFF[4]) );
  OAI21X1 U75 ( .A(n60), .B(n58), .C(n59), .Y(n57) );
  NAND2X1 U76 ( .A(n59), .B(n83), .Y(n11) );
  NOR2X1 U78 ( .A(A[4]), .B(n98), .Y(n58) );
  NAND2X1 U79 ( .A(A[4]), .B(n98), .Y(n59) );
  XNOR2X1 U80 ( .A(n65), .B(n12), .Y(DIFF[3]) );
  AOI21X1 U81 ( .A(n69), .B(n61), .C(n62), .Y(n60) );
  NOR2X1 U82 ( .A(n63), .B(n66), .Y(n61) );
  OAI21X1 U83 ( .A(n63), .B(n67), .C(n64), .Y(n62) );
  NAND2X1 U84 ( .A(n64), .B(n84), .Y(n12) );
  NOR2X1 U86 ( .A(A[3]), .B(n99), .Y(n63) );
  NAND2X1 U87 ( .A(A[3]), .B(n99), .Y(n64) );
  XOR2X1 U88 ( .A(n68), .B(n13), .Y(DIFF[2]) );
  OAI21X1 U89 ( .A(n68), .B(n66), .C(n67), .Y(n65) );
  NAND2X1 U90 ( .A(n67), .B(n85), .Y(n13) );
  NOR2X1 U92 ( .A(A[2]), .B(n100), .Y(n66) );
  NAND2X1 U93 ( .A(A[2]), .B(n100), .Y(n67) );
  XOR2X1 U94 ( .A(n14), .B(n177), .Y(DIFF[1]) );
  OAI21X1 U96 ( .A(n70), .B(n178), .C(n71), .Y(n69) );
  NAND2X1 U97 ( .A(n71), .B(n86), .Y(n14) );
  NOR2X1 U99 ( .A(A[1]), .B(n101), .Y(n70) );
  NAND2X1 U100 ( .A(A[1]), .B(n101), .Y(n71) );
  XNOR2X1 U101 ( .A(n182), .B(A[0]), .Y(DIFF[0]) );
  INVX1 U123 ( .A(n69), .Y(n68) );
  OR2X2 U124 ( .A(A[9]), .B(n93), .Y(n162) );
  OR2X2 U125 ( .A(A[7]), .B(n95), .Y(n163) );
  INVX2 U126 ( .A(B[0]), .Y(n182) );
  INVX1 U127 ( .A(B[14]), .Y(n88) );
  INVX1 U128 ( .A(B[6]), .Y(n96) );
  NAND3X1 U129 ( .A(n166), .B(n167), .C(n168), .Y(n164) );
  INVX1 U130 ( .A(B[4]), .Y(n98) );
  INVX1 U131 ( .A(B[11]), .Y(n91) );
  INVX1 U132 ( .A(B[5]), .Y(n97) );
  INVX1 U133 ( .A(B[3]), .Y(n99) );
  INVX1 U134 ( .A(B[2]), .Y(n100) );
  INVX1 U135 ( .A(B[8]), .Y(n94) );
  INVX1 U136 ( .A(B[10]), .Y(n92) );
  XOR2X1 U137 ( .A(A[15]), .B(n87), .Y(n165) );
  XOR2X1 U138 ( .A(n165), .B(n174), .Y(DIFF[15]) );
  NAND2X1 U139 ( .A(A[15]), .B(n87), .Y(n166) );
  NAND2X1 U140 ( .A(A[15]), .B(n17), .Y(n167) );
  NAND2X1 U141 ( .A(n87), .B(n17), .Y(n168) );
  NAND3X1 U142 ( .A(n166), .B(n167), .C(n168), .Y(n16) );
  XOR2X1 U143 ( .A(n103), .B(B[16]), .Y(n169) );
  XOR2X1 U144 ( .A(n169), .B(n164), .Y(DIFF[16]) );
  NAND2X1 U145 ( .A(n103), .B(B[16]), .Y(n170) );
  NAND2X1 U146 ( .A(n103), .B(n16), .Y(n171) );
  NAND2X1 U147 ( .A(B[16]), .B(n16), .Y(n172) );
  NAND3X1 U148 ( .A(n170), .B(n171), .C(n172), .Y(n15) );
  INVX1 U149 ( .A(n17), .Y(n173) );
  INVX2 U150 ( .A(n173), .Y(n174) );
  INVX1 U151 ( .A(n66), .Y(n85) );
  INVX1 U152 ( .A(B[1]), .Y(n101) );
  BUFX2 U153 ( .A(n20), .Y(n175) );
  BUFX2 U154 ( .A(n25), .Y(n176) );
  INVX1 U155 ( .A(n63), .Y(n84) );
  INVX1 U156 ( .A(B[9]), .Y(n93) );
  INVX1 U157 ( .A(B[15]), .Y(n87) );
  NOR2X1 U158 ( .A(A[0]), .B(n182), .Y(n177) );
  NOR2X1 U159 ( .A(A[0]), .B(n182), .Y(n178) );
  OR2X2 U160 ( .A(A[5]), .B(n97), .Y(n179) );
  OR2X2 U161 ( .A(A[11]), .B(n91), .Y(n180) );
  OR2X2 U162 ( .A(A[13]), .B(n89), .Y(n181) );
  INVX1 U163 ( .A(B[12]), .Y(n90) );
  INVX2 U164 ( .A(B[7]), .Y(n95) );
  INVX2 U165 ( .A(B[13]), .Y(n89) );
  INVX2 U166 ( .A(n70), .Y(n86) );
  INVX2 U167 ( .A(n58), .Y(n83) );
  INVX2 U168 ( .A(n50), .Y(n81) );
  INVX2 U169 ( .A(n42), .Y(n79) );
  INVX2 U170 ( .A(n34), .Y(n77) );
  INVX2 U171 ( .A(n26), .Y(n75) );
  INVX2 U172 ( .A(n18), .Y(n73) );
  INVX2 U173 ( .A(n56), .Y(n54) );
  INVX2 U174 ( .A(n48), .Y(n46) );
  INVX2 U175 ( .A(n40), .Y(n38) );
  INVX2 U176 ( .A(n32), .Y(n30) );
  INVX2 U177 ( .A(n24), .Y(n22) );
  INVX2 U178 ( .A(A[17]), .Y(n103) );
  INVX2 U179 ( .A(n15), .Y(DIFF[17]) );
endmodule


module alu_DW01_add_1 ( A, B, CI, SUM, CO );
  input [17:0] A;
  input [17:0] B;
  output [17:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n16, n17,
         n18, n19, n20, n21, n23, n25, n26, n27, n28, n29, n31, n33, n34, n35,
         n36, n37, n39, n41, n42, n43, n44, n45, n47, n49, n50, n51, n52, n53,
         n55, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n74, n75, n77, n79, n81, n83, n85, n86, n87, n88, n90,
         n91, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167;

  XOR2X1 U4 ( .A(n21), .B(n1), .Y(SUM[14]) );
  OAI21X1 U5 ( .A(n21), .B(n19), .C(n20), .Y(n18) );
  NAND2X1 U6 ( .A(n20), .B(n75), .Y(n1) );
  NOR2X1 U8 ( .A(A[14]), .B(B[14]), .Y(n19) );
  NAND2X1 U9 ( .A(A[14]), .B(B[14]), .Y(n20) );
  XNOR2X1 U10 ( .A(n26), .B(n2), .Y(SUM[13]) );
  AOI21X1 U11 ( .A(n167), .B(n26), .C(n23), .Y(n21) );
  NAND2X1 U14 ( .A(n25), .B(n167), .Y(n2) );
  NAND2X1 U17 ( .A(A[13]), .B(B[13]), .Y(n25) );
  XOR2X1 U18 ( .A(n160), .B(n3), .Y(SUM[12]) );
  OAI21X1 U19 ( .A(n29), .B(n27), .C(n28), .Y(n26) );
  NAND2X1 U20 ( .A(n28), .B(n77), .Y(n3) );
  NOR2X1 U22 ( .A(A[12]), .B(B[12]), .Y(n27) );
  NAND2X1 U23 ( .A(A[12]), .B(B[12]), .Y(n28) );
  XNOR2X1 U24 ( .A(n34), .B(n4), .Y(SUM[11]) );
  AOI21X1 U25 ( .A(n166), .B(n34), .C(n31), .Y(n29) );
  NAND2X1 U28 ( .A(n33), .B(n166), .Y(n4) );
  NAND2X1 U31 ( .A(A[11]), .B(B[11]), .Y(n33) );
  XOR2X1 U32 ( .A(n161), .B(n5), .Y(SUM[10]) );
  OAI21X1 U33 ( .A(n37), .B(n35), .C(n36), .Y(n34) );
  NAND2X1 U34 ( .A(n36), .B(n79), .Y(n5) );
  NOR2X1 U36 ( .A(A[10]), .B(B[10]), .Y(n35) );
  NAND2X1 U37 ( .A(A[10]), .B(B[10]), .Y(n36) );
  XNOR2X1 U38 ( .A(n162), .B(n6), .Y(SUM[9]) );
  AOI21X1 U39 ( .A(n165), .B(n42), .C(n39), .Y(n37) );
  NAND2X1 U42 ( .A(n41), .B(n165), .Y(n6) );
  NAND2X1 U45 ( .A(A[9]), .B(B[9]), .Y(n41) );
  XOR2X1 U46 ( .A(n45), .B(n7), .Y(SUM[8]) );
  OAI21X1 U47 ( .A(n45), .B(n43), .C(n44), .Y(n42) );
  NAND2X1 U48 ( .A(n44), .B(n81), .Y(n7) );
  NOR2X1 U50 ( .A(A[8]), .B(B[8]), .Y(n43) );
  NAND2X1 U51 ( .A(A[8]), .B(B[8]), .Y(n44) );
  XNOR2X1 U52 ( .A(n151), .B(n8), .Y(SUM[7]) );
  AOI21X1 U53 ( .A(n164), .B(n50), .C(n47), .Y(n45) );
  NAND2X1 U56 ( .A(n49), .B(n164), .Y(n8) );
  NAND2X1 U59 ( .A(A[7]), .B(B[7]), .Y(n49) );
  XOR2X1 U60 ( .A(n53), .B(n9), .Y(SUM[6]) );
  OAI21X1 U61 ( .A(n53), .B(n51), .C(n52), .Y(n50) );
  NAND2X1 U62 ( .A(n52), .B(n83), .Y(n9) );
  NOR2X1 U64 ( .A(A[6]), .B(B[6]), .Y(n51) );
  NAND2X1 U65 ( .A(A[6]), .B(B[6]), .Y(n52) );
  XNOR2X1 U66 ( .A(n58), .B(n10), .Y(SUM[5]) );
  AOI21X1 U67 ( .A(n163), .B(n58), .C(n55), .Y(n53) );
  NAND2X1 U70 ( .A(n57), .B(n163), .Y(n10) );
  NAND2X1 U73 ( .A(A[5]), .B(B[5]), .Y(n57) );
  XOR2X1 U74 ( .A(n61), .B(n11), .Y(SUM[4]) );
  OAI21X1 U75 ( .A(n61), .B(n59), .C(n60), .Y(n58) );
  NAND2X1 U76 ( .A(n60), .B(n85), .Y(n11) );
  NOR2X1 U78 ( .A(A[4]), .B(B[4]), .Y(n59) );
  NAND2X1 U79 ( .A(A[4]), .B(B[4]), .Y(n60) );
  XNOR2X1 U80 ( .A(n66), .B(n12), .Y(SUM[3]) );
  AOI21X1 U81 ( .A(n70), .B(n62), .C(n63), .Y(n61) );
  NOR2X1 U82 ( .A(n64), .B(n67), .Y(n62) );
  OAI21X1 U83 ( .A(n64), .B(n68), .C(n65), .Y(n63) );
  NAND2X1 U84 ( .A(n65), .B(n86), .Y(n12) );
  NOR2X1 U86 ( .A(A[3]), .B(B[3]), .Y(n64) );
  NAND2X1 U87 ( .A(A[3]), .B(B[3]), .Y(n65) );
  XOR2X1 U88 ( .A(n69), .B(n13), .Y(SUM[2]) );
  OAI21X1 U89 ( .A(n69), .B(n67), .C(n68), .Y(n66) );
  NAND2X1 U90 ( .A(n68), .B(n87), .Y(n13) );
  NOR2X1 U92 ( .A(A[2]), .B(B[2]), .Y(n67) );
  NAND2X1 U93 ( .A(A[2]), .B(B[2]), .Y(n68) );
  XOR2X1 U94 ( .A(n14), .B(n74), .Y(SUM[1]) );
  OAI21X1 U96 ( .A(n71), .B(n74), .C(n72), .Y(n70) );
  NAND2X1 U97 ( .A(n72), .B(n88), .Y(n14) );
  NOR2X1 U99 ( .A(A[1]), .B(B[1]), .Y(n71) );
  NAND2X1 U100 ( .A(A[1]), .B(B[1]), .Y(n72) );
  NAND2X1 U105 ( .A(A[0]), .B(B[0]), .Y(n74) );
  OR2X2 U111 ( .A(A[0]), .B(B[0]), .Y(n150) );
  BUFX2 U112 ( .A(n50), .Y(n151) );
  XOR2X1 U113 ( .A(A[15]), .B(B[15]), .Y(n152) );
  XOR2X1 U114 ( .A(n18), .B(n152), .Y(SUM[15]) );
  NAND2X1 U115 ( .A(n18), .B(A[15]), .Y(n153) );
  NAND2X1 U116 ( .A(n18), .B(B[15]), .Y(n154) );
  NAND2X1 U117 ( .A(A[15]), .B(B[15]), .Y(n155) );
  NAND3X1 U118 ( .A(n154), .B(n153), .C(n155), .Y(n17) );
  OR2X1 U119 ( .A(A[5]), .B(B[5]), .Y(n163) );
  XOR2X1 U120 ( .A(n90), .B(n91), .Y(n156) );
  XOR2X1 U121 ( .A(n17), .B(n156), .Y(SUM[16]) );
  NAND2X1 U122 ( .A(n17), .B(n90), .Y(n157) );
  NAND2X1 U123 ( .A(n17), .B(n91), .Y(n158) );
  NAND2X1 U124 ( .A(n90), .B(n91), .Y(n159) );
  NAND3X1 U125 ( .A(n158), .B(n157), .C(n159), .Y(n16) );
  INVX1 U126 ( .A(n70), .Y(n69) );
  INVX1 U127 ( .A(n64), .Y(n86) );
  INVX1 U128 ( .A(n71), .Y(n88) );
  BUFX2 U129 ( .A(n29), .Y(n160) );
  BUFX2 U130 ( .A(n37), .Y(n161) );
  BUFX2 U131 ( .A(n42), .Y(n162) );
  OR2X2 U132 ( .A(A[11]), .B(B[11]), .Y(n166) );
  OR2X2 U133 ( .A(A[13]), .B(B[13]), .Y(n167) );
  AND2X1 U134 ( .A(n74), .B(n150), .Y(SUM[0]) );
  OR2X1 U135 ( .A(A[7]), .B(B[7]), .Y(n164) );
  OR2X1 U136 ( .A(A[9]), .B(B[9]), .Y(n165) );
  INVX2 U137 ( .A(A[17]), .Y(n91) );
  INVX2 U138 ( .A(B[17]), .Y(n90) );
  INVX2 U139 ( .A(n67), .Y(n87) );
  INVX2 U140 ( .A(n59), .Y(n85) );
  INVX2 U141 ( .A(n51), .Y(n83) );
  INVX2 U142 ( .A(n43), .Y(n81) );
  INVX2 U143 ( .A(n35), .Y(n79) );
  INVX2 U144 ( .A(n27), .Y(n77) );
  INVX2 U145 ( .A(n19), .Y(n75) );
  INVX2 U146 ( .A(n57), .Y(n55) );
  INVX2 U147 ( .A(n49), .Y(n47) );
  INVX2 U148 ( .A(n41), .Y(n39) );
  INVX2 U149 ( .A(n33), .Y(n31) );
  INVX2 U150 ( .A(n25), .Y(n23) );
  INVX2 U151 ( .A(n16), .Y(SUM[17]) );
endmodule


module alu_DW_mult_uns_2 ( a, b, product );
  input [30:0] a;
  input [15:0] b;
  output [46:0] product;
  wire   n1, n7, n9, n13, n19, n25, n28, n30, n31, n34, n37, n46, n49, n51,
         n52, n53, n55, n59, n61, n65, n66, n67, n68, n69, n70, n72, n73, n74,
         n75, n77, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n109, n111, n112, n113, n114, n115, n116,
         n120, n122, n123, n124, n125, n127, n129, n130, n133, n134, n135,
         n136, n137, n140, n142, n144, n145, n146, n147, n148, n149, n151,
         n154, n155, n156, n159, n160, n161, n162, n163, n164, n165, n166,
         n169, n170, n171, n172, n173, n174, n177, n178, n179, n181, n182,
         n183, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n197, n198, n199, n200, n201, n202, n205, n206, n207, n209, n210,
         n211, n212, n213, n214, n215, n216, n217, n218, n219, n220, n221,
         n222, n223, n224, n233, n234, n235, n236, n237, n238, n239, n240,
         n241, n242, n243, n248, n249, n250, n251, n256, n257, n258, n259,
         n264, n265, n266, n267, n275, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n320,
         n321, n322, n323, n324, n325, n326, n327, n328, n329, n330, n331,
         n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, n342,
         n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353,
         n354, n355, n356, n357, n358, n359, n361, n362, n363, n364, n365,
         n366, n367, n368, n369, n370, n371, n372, n373, n374, n375, n376,
         n377, n378, n379, n380, n381, n382, n383, n384, n387, n388, n389,
         n390, n391, n392, n393, n394, n395, n396, n397, n398, n399, n400,
         n401, n402, n403, n404, n405, n406, n407, n408, n409, n410, n411,
         n412, n413, n414, n415, n416, n417, n418, n419, n420, n421, n422,
         n423, n424, n425, n426, n427, n428, n429, n430, n431, n432, n433,
         n434, n435, n436, n437, n438, n439, n440, n441, n442, n443, n444,
         n445, n446, n447, n448, n449, n450, n451, n452, n453, n454, n455,
         n456, n457, n458, n459, n460, n461, n462, n463, n464, n465, n466,
         n467, n468, n469, n470, n471, n472, n473, n474, n475, n476, n477,
         n478, n479, n480, n481, n482, n483, n484, n485, n486, n487, n488,
         n489, n490, n491, n492, n493, n494, n495, n496, n497, n498, n499,
         n500, n501, n502, n503, n504, n505, n506, n507, n508, n509, n510,
         n511, n512, n513, n514, n515, n516, n517, n518, n519, n520, n521,
         n522, n523, n524, n525, n526, n527, n528, n529, n530, n531, n532,
         n533, n534, n535, n536, n537, n538, n539, n540, n541, n542, n545,
         n548, n551, n554, n558, n560, n563, n565, n566, n567, n568, n569,
         n570, n571, n572, n573, n574, n575, n576, n577, n578, n579, n580,
         n581, n582, n584, n585, n586, n587, n588, n589, n590, n591, n592,
         n593, n594, n595, n596, n597, n598, n599, n600, n601, n602, n603,
         n604, n605, n606, n607, n608, n609, n610, n611, n612, n613, n614,
         n615, n616, n617, n618, n619, n620, n621, n622, n623, n624, n625,
         n626, n627, n628, n629, n630, n631, n632, n633, n634, n635, n636,
         n637, n638, n639, n640, n641, n642, n643, n644, n645, n646, n647,
         n648, n649, n650, n651, n652, n653, n654, n655, n656, n657, n658,
         n659, n660, n661, n662, n663, n664, n665, n666, n667, n668, n669,
         n670, n671, n672, n674, n675, n676, n677, n678, n679, n680, n681,
         n682, n683, n684, n685, n686, n687, n688, n689, n690, n691, n692,
         n693, n694, n695, n696, n697, n698, n699, n700, n701, n702, n703,
         n704, n705, n706, n707, n708, n709, n710, n711, n712, n713, n714,
         n715, n716, n717, n718, n719, n720, n721, n722, n723, n724, n725,
         n729, n730, n731, n735, n736, n741, n742, n743, n744, n745, n746,
         n747, n748, n749, n750, n751, n752, n753, n754, n755, n756, n757,
         n758, n759, n760, n761, n762, n763, n764, n765, n766, n767, n768,
         n769, n770, n771, n772, n773, n774, n775, n776, n777, n778, n779,
         n780, n781, n782, n783, n784, n785, n786, n787, n788, n789, n790,
         n791, n792, n793, n794, n795, n796, n797, n798, n799, n800, n801,
         n802, n803, n804, n805, n806, n807, n808, n809, n810, n811, n812,
         n813, n814, n815, n816, n817, n818, n819, n820, n821, n822, n823,
         n824, n825, n826, n827, n828, n829, n830, n831, n832, n833, n834,
         n835, n836, n837, n838, n839, n840, n841, n842, n843, n844, n845,
         n846, n847, n848, n849, n850, n851, n852, n853, n854, n855, n856,
         n857, n858, n859, n860, n861, n862, n863, n864, n865, n866, n867,
         n868, n869, n870, n871, n872, n873, n874, n875, n876, n877, n878,
         n879, n880, n881, n882, n883, n884, n885, n886, n887, n888, n889,
         n890, n891, n893, n894, n895, n896, n897, n898, n899, n900, n917,
         n918, n995, n996, n997, n998, n999, n1000, n1001, n1002, n1003, n1004,
         n1005, n1006, n1007, n1008, n1009, n1010, n1011, n1012, n1013, n1014,
         n1015, n1016, n1017, n1018, n1019, n1020, n1021, n1022, n1023, n1024,
         n1025, n1026, n1027, n1028, n1029, n1030, n1031, n1032, n1033, n1034,
         n1035, n1036, n1037, n1038, n1039, n1040, n1041, n1042, n1043, n1044,
         n1045, n1046, n1047, n1048, n1049, n1050, n1051, n1052, n1053, n1054,
         n1055, n1056, n1057, n1058, n1059, n1060, n1061, n1062, n1063, n1064,
         n1065, n1066, n1067, n1068, n1069, n1070, n1071, n1072, n1073, n1074,
         n1075, n1076, n1077, n1078, n1079, n1080, n1081, n1082, n1083, n1084,
         n1085, n1086, n1087, n1088, n1089, n1090, n1091, n1092, n1093, n1094,
         n1095, n1096, n1097, n1098, n1099, n1100, n1101, n1102, n1103, n1104,
         n1105, n1106, n1107, n1108, n1109, n1110, n1111, n1112, n1113, n1114,
         n1115, n1116, n1117, n1118, n1119, n1120, n1121, n1122, n1123, n1124,
         n1125, n1126, n1127, n1128, n1129, n1130, n1131, n1132, n1133, n1134,
         n1135, n1136, n1137, n1138, n1139, n1140, n1141, n1142, n1143, n1144,
         n1145, n1146, n1147, n1148, n1149, n1150, n1151, n1152, n1153, n1154,
         n1155, n1156, n1157, n1158, n1159, n1160, n1161, n1162, n1163, n1164,
         n1165, n1166, n1167, n1168, n1169, n1170, n1171, n1172, n1173, n1174,
         n1175, n1176, n1177, n1178, n1179, n1180, n1181, n1182, n1183, n1184,
         n1185, n1186, n1187, n1188, n1189, n1190, n1191, n1192, n1193, n1194,
         n1195, n1196, n1197, n1198, n1199, n1200, n1201, n1202, n1203, n1204,
         n1205, n1206, n1207, n1208, n1209, n1210, n1211, n1212, n1213, n1214,
         n1215, n1216, n1217, n1218, n1219, n1220, n1221, n1222, n1223, n1224,
         n1225, n1226, n1227, n1228, n1229, n1230, n1231, n1232, n1233, n1234,
         n1235, n1236, n1237, n1238, n1239, n1240, n1241, n1242, n1243, n1244,
         n1245, n1246, n1247, n1248, n1249, n1250, n1251, n1252, n1253, n1254,
         n1255, n1256, n1257, n1258, n1259, n1260, n1261, n1262, n1263, n1264,
         n1265, n1266, n1267, n1268, n1269, n1270, n1271, n1272, n1273, n1274,
         n1275, n1276, n1277, n1278, n1279, n1280, n1281, n1282, n1283, n1284,
         n1285, n1286, n1287, n1288, n1289, n1290, n1291, n1292, n1293, n1294,
         n1295, n1296, n1297, n1298, n1299, n1300, n1301, n1302, n1303, n1304,
         n1305, n1306, n1307, n1308, n1309, n1310, n1311, n1312, n1313, n1314,
         n1315, n1316, n1317, n1318, n1319, n1320, n1321, n1322, n1323, n1324,
         n1325, n1326, n1327, n1328, n1329, n1330, n1331, n1332, n1333, n1334,
         n1335, n1336, n1337, n1338, n1339, n1340, n1341, n1342, n1343;
  assign n1 = a[16];
  assign n7 = a[18];
  assign n13 = a[20];
  assign n19 = a[22];
  assign n25 = a[24];
  assign n31 = a[26];
  assign n37 = a[28];
  assign n49 = b[0];
  assign n541 = a[30];
  assign n877 = b[15];
  assign n878 = b[14];
  assign n879 = b[13];
  assign n880 = b[12];
  assign n881 = b[11];
  assign n882 = b[10];
  assign n883 = b[9];
  assign n884 = b[8];
  assign n885 = b[7];
  assign n886 = b[6];
  assign n887 = b[5];
  assign n888 = b[4];
  assign n889 = b[3];
  assign n890 = b[2];
  assign n891 = b[1];

  NAND2X1 U58 ( .A(n292), .B(n293), .Y(n72) );
  XOR2X1 U59 ( .A(n86), .B(n55), .Y(product[45]) );
  AOI21X1 U60 ( .A(n1139), .B(n74), .C(n75), .Y(n73) );
  NOR2X1 U61 ( .A(n1225), .B(n1246), .Y(n74) );
  OAI21X1 U62 ( .A(n52), .B(n1225), .C(n77), .Y(n75) );
  OAI21X1 U66 ( .A(n80), .B(n140), .C(n81), .Y(n79) );
  NAND2X1 U67 ( .A(n82), .B(n104), .Y(n80) );
  AOI21X1 U68 ( .A(n82), .B(n105), .C(n83), .Y(n81) );
  NOR2X1 U69 ( .A(n84), .B(n93), .Y(n82) );
  OAI21X1 U70 ( .A(n94), .B(n84), .C(n85), .Y(n83) );
  NAND2X1 U71 ( .A(n85), .B(n275), .Y(n55) );
  NOR2X1 U73 ( .A(n294), .B(n297), .Y(n84) );
  NAND2X1 U74 ( .A(n294), .B(n297), .Y(n85) );
  AOI21X1 U76 ( .A(n1178), .B(n87), .C(n88), .Y(n86) );
  NOR2X1 U77 ( .A(n89), .B(n1247), .Y(n87) );
  OAI21X1 U78 ( .A(n89), .B(n52), .C(n90), .Y(n88) );
  NAND2X1 U79 ( .A(n91), .B(n100), .Y(n89) );
  AOI21X1 U80 ( .A(n91), .B(n101), .C(n92), .Y(n90) );
  NOR2X1 U85 ( .A(n298), .B(n301), .Y(n93) );
  NAND2X1 U86 ( .A(n298), .B(n301), .Y(n94) );
  AOI21X1 U88 ( .A(n1178), .B(n96), .C(n97), .Y(n95) );
  NOR2X1 U89 ( .A(n98), .B(n1247), .Y(n96) );
  OAI21X1 U90 ( .A(n1248), .B(n98), .C(n99), .Y(n97) );
  NOR2X1 U93 ( .A(n102), .B(n1244), .Y(n100) );
  OAI21X1 U94 ( .A(n140), .B(n102), .C(n103), .Y(n101) );
  NOR2X1 U97 ( .A(n106), .B(n130), .Y(n104) );
  OAI21X1 U98 ( .A(n106), .B(n133), .C(n107), .Y(n105) );
  NAND2X1 U99 ( .A(n1229), .B(n1044), .Y(n106) );
  AOI21X1 U100 ( .A(n120), .B(n1229), .C(n109), .Y(n107) );
  NAND2X1 U106 ( .A(n302), .B(n307), .Y(n111) );
  AOI21X1 U108 ( .A(n1178), .B(n113), .C(n114), .Y(n112) );
  NOR2X1 U109 ( .A(n115), .B(n1247), .Y(n113) );
  OAI21X1 U110 ( .A(n115), .B(n52), .C(n116), .Y(n114) );
  NAND2X1 U111 ( .A(n1136), .B(n1137), .Y(n115) );
  AOI21X1 U112 ( .A(n1044), .B(n129), .C(n120), .Y(n116) );
  NAND2X1 U120 ( .A(n308), .B(n313), .Y(n122) );
  XOR2X1 U121 ( .A(n134), .B(n59), .Y(product[41]) );
  AOI21X1 U122 ( .A(n1178), .B(n124), .C(n125), .Y(n123) );
  NOR2X1 U123 ( .A(n1138), .B(n1247), .Y(n124) );
  OAI21X1 U124 ( .A(n1248), .B(n1138), .C(n127), .Y(n125) );
  OAI21X1 U128 ( .A(n140), .B(n130), .C(n133), .Y(n129) );
  NAND2X1 U131 ( .A(n133), .B(n1135), .Y(n59) );
  NOR2X1 U133 ( .A(n314), .B(n321), .Y(n130) );
  NAND2X1 U134 ( .A(n314), .B(n321), .Y(n133) );
  AOI21X1 U136 ( .A(n1178), .B(n135), .C(n136), .Y(n134) );
  NOR2X1 U137 ( .A(n1244), .B(n1247), .Y(n135) );
  OAI21X1 U138 ( .A(n1248), .B(n1244), .C(n140), .Y(n136) );
  NAND2X1 U141 ( .A(n1226), .B(n1217), .Y(n137) );
  AOI21X1 U142 ( .A(n151), .B(n1226), .C(n142), .Y(n140) );
  NAND2X1 U148 ( .A(n322), .B(n329), .Y(n144) );
  XOR2X1 U149 ( .A(n154), .B(n61), .Y(product[39]) );
  AOI21X1 U150 ( .A(n1178), .B(n146), .C(n147), .Y(n145) );
  NOR2X1 U151 ( .A(n148), .B(n1247), .Y(n146) );
  OAI21X1 U152 ( .A(n1248), .B(n148), .C(n149), .Y(n147) );
  NAND2X1 U157 ( .A(n149), .B(n1217), .Y(n61) );
  NAND2X1 U160 ( .A(n339), .B(n330), .Y(n149) );
  AOI21X1 U162 ( .A(n1178), .B(n155), .C(n156), .Y(n154) );
  NAND2X1 U165 ( .A(n171), .B(n159), .Y(n53) );
  AOI21X1 U166 ( .A(n172), .B(n159), .C(n160), .Y(n52) );
  NOR2X1 U167 ( .A(n161), .B(n166), .Y(n159) );
  OAI21X1 U168 ( .A(n1154), .B(n169), .C(n162), .Y(n160) );
  NOR2X1 U171 ( .A(n340), .B(n349), .Y(n161) );
  NAND2X1 U172 ( .A(n340), .B(n349), .Y(n162) );
  AOI21X1 U174 ( .A(n1178), .B(n164), .C(n165), .Y(n163) );
  NOR2X1 U175 ( .A(n1202), .B(n173), .Y(n164) );
  OAI21X1 U176 ( .A(n174), .B(n1202), .C(n169), .Y(n165) );
  NOR2X1 U181 ( .A(n350), .B(n361), .Y(n166) );
  NAND2X1 U182 ( .A(n350), .B(n361), .Y(n169) );
  AOI21X1 U184 ( .A(n1178), .B(n1116), .C(n172), .Y(n170) );
  NOR2X1 U189 ( .A(n177), .B(n182), .Y(n171) );
  OAI21X1 U190 ( .A(n1177), .B(n183), .C(n178), .Y(n172) );
  NOR2X1 U193 ( .A(n373), .B(n362), .Y(n177) );
  NAND2X1 U194 ( .A(n373), .B(n362), .Y(n178) );
  AOI21X1 U196 ( .A(n1178), .B(n285), .C(n181), .Y(n179) );
  NAND2X1 U199 ( .A(n183), .B(n285), .Y(n65) );
  NOR2X1 U201 ( .A(n387), .B(n374), .Y(n182) );
  NAND2X1 U202 ( .A(n387), .B(n374), .Y(n183) );
  XOR2X1 U203 ( .A(n191), .B(n66), .Y(product[34]) );
  OAI21X1 U204 ( .A(n213), .B(n185), .C(n186), .Y(n51) );
  NAND2X1 U205 ( .A(n187), .B(n199), .Y(n185) );
  AOI21X1 U206 ( .A(n200), .B(n187), .C(n188), .Y(n186) );
  NOR2X1 U207 ( .A(n189), .B(n194), .Y(n187) );
  OAI21X1 U208 ( .A(n189), .B(n197), .C(n190), .Y(n188) );
  NAND2X1 U209 ( .A(n190), .B(n286), .Y(n66) );
  NOR2X1 U211 ( .A(n401), .B(n388), .Y(n189) );
  NAND2X1 U212 ( .A(n401), .B(n388), .Y(n190) );
  XOR2X1 U213 ( .A(n198), .B(n67), .Y(product[33]) );
  AOI21X1 U214 ( .A(n212), .B(n192), .C(n193), .Y(n191) );
  NOR2X1 U215 ( .A(n1035), .B(n201), .Y(n192) );
  OAI21X1 U216 ( .A(n202), .B(n194), .C(n197), .Y(n193) );
  NAND2X1 U219 ( .A(n197), .B(n287), .Y(n67) );
  NOR2X1 U221 ( .A(n415), .B(n402), .Y(n194) );
  NAND2X1 U222 ( .A(n415), .B(n402), .Y(n197) );
  XOR2X1 U223 ( .A(n207), .B(n68), .Y(product[32]) );
  AOI21X1 U224 ( .A(n1191), .B(n212), .C(n200), .Y(n198) );
  NOR2X1 U229 ( .A(n205), .B(n210), .Y(n199) );
  OAI21X1 U230 ( .A(n205), .B(n211), .C(n206), .Y(n200) );
  NAND2X1 U231 ( .A(n206), .B(n288), .Y(n68) );
  NOR2X1 U233 ( .A(n429), .B(n416), .Y(n205) );
  NAND2X1 U234 ( .A(n429), .B(n1253), .Y(n206) );
  XNOR2X1 U235 ( .A(n212), .B(n69), .Y(product[31]) );
  AOI21X1 U236 ( .A(n289), .B(n212), .C(n209), .Y(n207) );
  NAND2X1 U239 ( .A(n211), .B(n289), .Y(n69) );
  NOR2X1 U241 ( .A(n443), .B(n430), .Y(n210) );
  NAND2X1 U242 ( .A(n443), .B(n430), .Y(n211) );
  XNOR2X1 U243 ( .A(n218), .B(n70), .Y(product[30]) );
  AOI21X1 U245 ( .A(n222), .B(n214), .C(n215), .Y(n213) );
  NOR2X1 U246 ( .A(n219), .B(n216), .Y(n214) );
  OAI21X1 U247 ( .A(n216), .B(n220), .C(n217), .Y(n215) );
  NAND2X1 U248 ( .A(n217), .B(n290), .Y(n70) );
  NOR2X1 U250 ( .A(n457), .B(n444), .Y(n216) );
  NAND2X1 U251 ( .A(n457), .B(n444), .Y(n217) );
  OAI21X1 U252 ( .A(n221), .B(n219), .C(n220), .Y(n218) );
  NOR2X1 U253 ( .A(n469), .B(n458), .Y(n219) );
  NAND2X1 U254 ( .A(n469), .B(n458), .Y(n220) );
  OAI21X1 U256 ( .A(n223), .B(n233), .C(n224), .Y(n222) );
  NAND2X1 U257 ( .A(n1232), .B(n1227), .Y(n223) );
  AOI21X1 U258 ( .A(n1231), .B(n1227), .C(n1228), .Y(n224) );
  AOI21X1 U267 ( .A(n240), .B(n234), .C(n235), .Y(n233) );
  NOR2X1 U268 ( .A(n238), .B(n236), .Y(n234) );
  OAI21X1 U269 ( .A(n236), .B(n239), .C(n237), .Y(n235) );
  NOR2X1 U270 ( .A(n501), .B(n492), .Y(n236) );
  NAND2X1 U271 ( .A(n501), .B(n492), .Y(n237) );
  NOR2X1 U272 ( .A(n509), .B(n502), .Y(n238) );
  NAND2X1 U273 ( .A(n509), .B(n502), .Y(n239) );
  OAI21X1 U274 ( .A(n243), .B(n241), .C(n242), .Y(n240) );
  NOR2X1 U275 ( .A(n517), .B(n510), .Y(n241) );
  NAND2X1 U276 ( .A(n517), .B(n510), .Y(n242) );
  AOI21X1 U277 ( .A(n1230), .B(n248), .C(n1233), .Y(n243) );
  OAI21X1 U282 ( .A(n251), .B(n249), .C(n250), .Y(n248) );
  NOR2X1 U283 ( .A(n529), .B(n524), .Y(n249) );
  NAND2X1 U284 ( .A(n529), .B(n524), .Y(n250) );
  AOI21X1 U285 ( .A(n256), .B(n1234), .C(n1236), .Y(n251) );
  OAI21X1 U290 ( .A(n257), .B(n259), .C(n258), .Y(n256) );
  NOR2X1 U291 ( .A(n537), .B(n534), .Y(n257) );
  NAND2X1 U292 ( .A(n537), .B(n534), .Y(n258) );
  AOI21X1 U293 ( .A(n264), .B(n1235), .C(n1237), .Y(n259) );
  OAI21X1 U298 ( .A(n265), .B(n267), .C(n266), .Y(n264) );
  NOR2X1 U299 ( .A(n707), .B(n540), .Y(n265) );
  NAND2X1 U300 ( .A(n707), .B(n540), .Y(n266) );
  AOI21X1 U301 ( .A(n1238), .B(n1042), .C(n1051), .Y(n267) );
  XOR2X1 U308 ( .A(n295), .B(n291), .Y(n292) );
  FAX1 U310 ( .A(n296), .B(n584), .C(n299), .YC(n293), .YS(n294) );
  FAX1 U312 ( .A(n601), .B(n300), .C(n303), .YC(n297), .YS(n298) );
  FAX1 U313 ( .A(n305), .B(n574), .C(n585), .YC(n299), .YS(n300) );
  FAX1 U314 ( .A(n311), .B(n304), .C(n309), .YC(n301), .YS(n302) );
  FAX1 U315 ( .A(n306), .B(n602), .C(n586), .YC(n303), .YS(n304) );
  FAX1 U317 ( .A(n317), .B(n315), .C(n310), .YC(n307), .YS(n308) );
  FAX1 U318 ( .A(n603), .B(n619), .C(n312), .YC(n309), .YS(n310) );
  FAX1 U319 ( .A(n319), .B(n575), .C(n587), .YC(n311), .YS(n312) );
  FAX1 U320 ( .A(n318), .B(n316), .C(n323), .YC(n313), .YS(n314) );
  FAX1 U321 ( .A(n604), .B(n327), .C(n325), .YC(n315), .YS(n316) );
  FAX1 U322 ( .A(n320), .B(n620), .C(n588), .YC(n317), .YS(n318) );
  FAX1 U324 ( .A(n333), .B(n324), .C(n331), .YC(n321), .YS(n322) );
  FAX1 U325 ( .A(n328), .B(n335), .C(n326), .YC(n323), .YS(n324) );
  FAX1 U326 ( .A(n589), .B(n621), .C(n637), .YC(n325), .YS(n326) );
  FAX1 U328 ( .A(n343), .B(n332), .C(n341), .YC(n329), .YS(n330) );
  FAX1 U329 ( .A(n345), .B(n336), .C(n334), .YC(n331), .YS(n332) );
  FAX1 U330 ( .A(n622), .B(n606), .C(n347), .YC(n333), .YS(n334) );
  FAX1 U331 ( .A(n338), .B(n638), .C(n590), .YC(n335), .YS(n336) );
  FAX1 U333 ( .A(n344), .B(n351), .C(n342), .YC(n339), .YS(n340) );
  FAX1 U335 ( .A(n591), .B(n348), .C(n357), .YC(n343), .YS(n344) );
  FAX1 U336 ( .A(n607), .B(n639), .C(n655), .YC(n345), .YS(n346) );
  FAX1 U338 ( .A(n354), .B(n352), .C(n363), .YC(n349), .YS(n350) );
  FAX1 U339 ( .A(n356), .B(n367), .C(n365), .YC(n351), .YS(n352) );
  FAX1 U341 ( .A(n608), .B(n624), .C(n640), .YC(n355), .YS(n356) );
  FAX1 U342 ( .A(n1218), .B(n656), .C(n592), .YC(n357), .YS(n358) );
  FAX1 U345 ( .A(n368), .B(n379), .C(n377), .YC(n363), .YS(n364) );
  FAX1 U349 ( .A(n1216), .B(n578), .C(n641), .YC(n371), .YS(n372) );
  FAX1 U350 ( .A(n378), .B(n1040), .C(n376), .YC(n373), .YS(n374) );
  FAX1 U352 ( .A(n1033), .B(n1104), .C(n382), .YC(n377), .YS(n378) );
  FAX1 U353 ( .A(n626), .B(n399), .C(n397), .YC(n379), .YS(n380) );
  FAX1 U354 ( .A(n658), .B(n610), .C(n642), .YC(n381), .YS(n382) );
  FAX1 U355 ( .A(n1041), .B(n674), .C(n594), .YC(n383), .YS(n384) );
  FAX1 U358 ( .A(n407), .B(n394), .C(n405), .YC(n389), .YS(n390) );
  FAX1 U361 ( .A(n659), .B(n611), .C(n709), .YC(n395), .YS(n396) );
  FAX1 U362 ( .A(n691), .B(n675), .C(n627), .YC(n397), .YS(n398) );
  FAX1 U371 ( .A(n1245), .B(n420), .C(n418), .YC(n415), .YS(n416) );
  FAX1 U373 ( .A(n439), .B(n424), .C(n426), .YC(n419), .YS(n420) );
  FAX1 U378 ( .A(n434), .B(n445), .C(n432), .YC(n429), .YS(n430) );
  FAX1 U380 ( .A(n442), .B(n438), .C(n440), .YC(n433), .YS(n434) );
  FAX1 U381 ( .A(n1031), .B(n453), .C(n451), .YC(n435), .YS(n436) );
  FAX1 U382 ( .A(n646), .B(n662), .C(n630), .YC(n437), .YS(n438) );
  FAX1 U383 ( .A(n678), .B(n598), .C(n614), .YC(n439), .YS(n440) );
  FAX1 U388 ( .A(n663), .B(n1034), .C(n467), .YC(n449), .YS(n450) );
  FAX1 U389 ( .A(n631), .B(n679), .C(n565), .YC(n451), .YS(n452) );
  HAX1 U391 ( .A(n711), .B(n615), .YC(n455), .YS(n456) );
  FAX1 U392 ( .A(n462), .B(n471), .C(n460), .YC(n457), .YS(n458) );
  FAX1 U393 ( .A(n466), .B(n464), .C(n473), .YC(n459), .YS(n460) );
  FAX1 U394 ( .A(n477), .B(n475), .C(n468), .YC(n461), .YS(n462) );
  FAX1 U395 ( .A(n680), .B(n664), .C(n479), .YC(n463), .YS(n464) );
  FAX1 U396 ( .A(n696), .B(n632), .C(n648), .YC(n465), .YS(n466) );
  FAX1 U397 ( .A(n712), .B(n600), .C(n616), .YC(n467), .YS(n468) );
  FAX1 U398 ( .A(n474), .B(n483), .C(n472), .YC(n469), .YS(n470) );
  FAX1 U399 ( .A(n476), .B(n478), .C(n485), .YC(n471), .YS(n472) );
  FAX1 U400 ( .A(n480), .B(n1072), .C(n487), .YC(n473), .YS(n474) );
  FAX1 U401 ( .A(n665), .B(n649), .C(n566), .YC(n475), .YS(n476) );
  FAX1 U402 ( .A(n633), .B(n681), .C(n617), .YC(n477), .YS(n478) );
  FAX1 U404 ( .A(n486), .B(n493), .C(n484), .YC(n481), .YS(n482) );
  FAX1 U405 ( .A(n488), .B(n490), .C(n495), .YC(n483), .YS(n484) );
  FAX1 U406 ( .A(n682), .B(n1108), .C(n497), .YC(n485), .YS(n486) );
  FAX1 U407 ( .A(n698), .B(n650), .C(n666), .YC(n487), .YS(n488) );
  FAX1 U408 ( .A(n714), .B(n634), .C(n618), .YC(n489), .YS(n490) );
  FAX1 U409 ( .A(n496), .B(n503), .C(n494), .YC(n491), .YS(n492) );
  FAX1 U410 ( .A(n507), .B(n505), .C(n498), .YC(n493), .YS(n494) );
  FAX1 U411 ( .A(n683), .B(n567), .C(n500), .YC(n495), .YS(n496) );
  HAX1 U413 ( .A(n715), .B(n651), .YC(n499), .YS(n500) );
  FAX1 U414 ( .A(n508), .B(n511), .C(n504), .YC(n501), .YS(n502) );
  FAX1 U415 ( .A(n515), .B(n513), .C(n506), .YC(n503), .YS(n504) );
  FAX1 U416 ( .A(n700), .B(n668), .C(n684), .YC(n505), .YS(n506) );
  FAX1 U417 ( .A(n716), .B(n652), .C(n636), .YC(n507), .YS(n508) );
  FAX1 U418 ( .A(n514), .B(n519), .C(n512), .YC(n509), .YS(n510) );
  FAX1 U419 ( .A(n568), .B(n516), .C(n521), .YC(n511), .YS(n512) );
  FAX1 U420 ( .A(n685), .B(n669), .C(n653), .YC(n513), .YS(n514) );
  HAX1 U421 ( .A(n717), .B(n701), .YC(n515), .YS(n516) );
  FAX1 U422 ( .A(n525), .B(n522), .C(n520), .YC(n517), .YS(n518) );
  FAX1 U423 ( .A(n702), .B(n686), .C(n527), .YC(n519), .YS(n520) );
  FAX1 U424 ( .A(n718), .B(n670), .C(n654), .YC(n521), .YS(n522) );
  FAX1 U425 ( .A(n528), .B(n531), .C(n526), .YC(n523), .YS(n524) );
  FAX1 U426 ( .A(n719), .B(n569), .C(n671), .YC(n525), .YS(n526) );
  HAX1 U427 ( .A(n703), .B(n687), .YC(n527), .YS(n528) );
  FAX1 U428 ( .A(n704), .B(n535), .C(n532), .YC(n529), .YS(n530) );
  FAX1 U429 ( .A(n720), .B(n688), .C(n672), .YC(n531), .YS(n532) );
  FAX1 U430 ( .A(n570), .B(n689), .C(n536), .YC(n533), .YS(n534) );
  HAX1 U431 ( .A(n705), .B(n721), .YC(n535), .YS(n536) );
  FAX1 U432 ( .A(n722), .B(n706), .C(n690), .YC(n537), .YS(n538) );
  HAX1 U433 ( .A(n723), .B(n571), .YC(n539), .YS(n540) );
  NOR2X1 U434 ( .A(n1224), .B(n1318), .Y(n573) );
  NOR2X1 U435 ( .A(n1224), .B(n1316), .Y(n295) );
  NOR2X1 U436 ( .A(n918), .B(n1314), .Y(n574) );
  NOR2X1 U437 ( .A(n918), .B(n729), .Y(n305) );
  NOR2X1 U438 ( .A(n918), .B(n730), .Y(n575) );
  NOR2X1 U439 ( .A(n918), .B(n731), .Y(n319) );
  NOR2X1 U440 ( .A(n918), .B(n1306), .Y(n576) );
  NOR2X1 U441 ( .A(n918), .B(n1304), .Y(n337) );
  NOR2X1 U442 ( .A(n918), .B(n1302), .Y(n577) );
  NOR2X1 U444 ( .A(n918), .B(n736), .Y(n578) );
  NOR2X1 U446 ( .A(n918), .B(n1294), .Y(n579) );
  OAI22X1 U466 ( .A(n918), .B(n1288), .C(n1287), .D(n757), .Y(n565) );
  OAI22X1 U469 ( .A(n1224), .B(n1287), .C(n1288), .D(n741), .Y(n584) );
  OAI22X1 U470 ( .A(n1288), .B(n742), .C(n1287), .D(n741), .Y(n585) );
  OAI22X1 U471 ( .A(n1287), .B(n742), .C(n1288), .D(n743), .Y(n586) );
  OAI22X1 U472 ( .A(n1287), .B(n743), .C(n1288), .D(n744), .Y(n587) );
  OAI22X1 U473 ( .A(n1287), .B(n744), .C(n1288), .D(n745), .Y(n588) );
  OAI22X1 U474 ( .A(n1287), .B(n745), .C(n1288), .D(n746), .Y(n589) );
  OAI22X1 U475 ( .A(n1287), .B(n746), .C(n1288), .D(n747), .Y(n590) );
  OAI22X1 U476 ( .A(n1287), .B(n747), .C(n1288), .D(n748), .Y(n591) );
  OAI22X1 U477 ( .A(n1287), .B(n748), .C(n1288), .D(n749), .Y(n592) );
  OAI22X1 U478 ( .A(n1287), .B(n749), .C(n1288), .D(n750), .Y(n593) );
  OAI22X1 U479 ( .A(n1287), .B(n750), .C(n1288), .D(n751), .Y(n594) );
  OAI22X1 U480 ( .A(n1287), .B(n751), .C(n1288), .D(n752), .Y(n595) );
  OAI22X1 U481 ( .A(n1287), .B(n752), .C(n1288), .D(n753), .Y(n596) );
  OAI22X1 U482 ( .A(n1287), .B(n753), .C(n1288), .D(n754), .Y(n597) );
  OAI22X1 U483 ( .A(n1287), .B(n754), .C(n1288), .D(n755), .Y(n598) );
  OAI22X1 U484 ( .A(n1287), .B(n755), .C(n1288), .D(n756), .Y(n599) );
  AND2X1 U485 ( .A(n1324), .B(n1286), .Y(n600) );
  XNOR2X1 U487 ( .A(n1319), .B(n1029), .Y(n741) );
  XNOR2X1 U488 ( .A(n1317), .B(n1221), .Y(n742) );
  XNOR2X1 U489 ( .A(n1315), .B(n1029), .Y(n743) );
  XNOR2X1 U490 ( .A(n1313), .B(n1221), .Y(n744) );
  XNOR2X1 U491 ( .A(n1311), .B(n1037), .Y(n745) );
  XNOR2X1 U492 ( .A(n1309), .B(n1037), .Y(n746) );
  XNOR2X1 U493 ( .A(n1307), .B(n1029), .Y(n747) );
  XNOR2X1 U494 ( .A(n1305), .B(n1221), .Y(n748) );
  XNOR2X1 U495 ( .A(n1303), .B(n1037), .Y(n749) );
  XNOR2X1 U496 ( .A(n1301), .B(n1037), .Y(n750) );
  XNOR2X1 U497 ( .A(n1299), .B(n1322), .Y(n751) );
  XNOR2X1 U498 ( .A(n1297), .B(n1029), .Y(n752) );
  XNOR2X1 U499 ( .A(n1295), .B(n1221), .Y(n753) );
  XNOR2X1 U500 ( .A(n1293), .B(n1037), .Y(n754) );
  XNOR2X1 U501 ( .A(n1291), .B(n1029), .Y(n755) );
  XNOR2X1 U502 ( .A(n1323), .B(n1221), .Y(n756) );
  OAI22X1 U505 ( .A(n1251), .B(n1285), .C(n1055), .D(n774), .Y(n566) );
  OAI22X1 U508 ( .A(n1251), .B(n1055), .C(n1285), .D(n758), .Y(n602) );
  OAI22X1 U509 ( .A(n1285), .B(n759), .C(n1055), .D(n758), .Y(n603) );
  OAI22X1 U510 ( .A(n1055), .B(n759), .C(n1285), .D(n760), .Y(n604) );
  OAI22X1 U511 ( .A(n1055), .B(n760), .C(n1285), .D(n761), .Y(n605) );
  OAI22X1 U512 ( .A(n1055), .B(n761), .C(n1285), .D(n762), .Y(n606) );
  OAI22X1 U513 ( .A(n1055), .B(n762), .C(n1285), .D(n763), .Y(n607) );
  OAI22X1 U514 ( .A(n1055), .B(n763), .C(n1285), .D(n764), .Y(n608) );
  OAI22X1 U515 ( .A(n1223), .B(n764), .C(n1285), .D(n765), .Y(n609) );
  OAI22X1 U516 ( .A(n1054), .B(n765), .C(n1285), .D(n766), .Y(n610) );
  OAI22X1 U517 ( .A(n1054), .B(n766), .C(n1285), .D(n767), .Y(n611) );
  OAI22X1 U518 ( .A(n1223), .B(n767), .C(n1285), .D(n768), .Y(n612) );
  OAI22X1 U519 ( .A(n1223), .B(n768), .C(n1285), .D(n769), .Y(n613) );
  OAI22X1 U520 ( .A(n1055), .B(n769), .C(n1285), .D(n770), .Y(n614) );
  OAI22X1 U521 ( .A(n1054), .B(n770), .C(n1285), .D(n771), .Y(n615) );
  OAI22X1 U522 ( .A(n1223), .B(n771), .C(n1285), .D(n772), .Y(n616) );
  OAI22X1 U523 ( .A(n1055), .B(n772), .C(n1285), .D(n773), .Y(n617) );
  XNOR2X1 U526 ( .A(n1319), .B(n1342), .Y(n758) );
  XNOR2X1 U527 ( .A(n1317), .B(n1342), .Y(n759) );
  XNOR2X1 U528 ( .A(n1315), .B(n1342), .Y(n760) );
  XNOR2X1 U529 ( .A(n1313), .B(n1342), .Y(n761) );
  XNOR2X1 U530 ( .A(n1311), .B(n1342), .Y(n762) );
  XNOR2X1 U531 ( .A(n1309), .B(n1342), .Y(n763) );
  XNOR2X1 U532 ( .A(n1307), .B(n1342), .Y(n764) );
  XNOR2X1 U533 ( .A(n1305), .B(n1342), .Y(n765) );
  XNOR2X1 U534 ( .A(n1303), .B(n1342), .Y(n766) );
  XNOR2X1 U535 ( .A(n1301), .B(n1341), .Y(n767) );
  XNOR2X1 U536 ( .A(n1299), .B(n1341), .Y(n768) );
  XNOR2X1 U537 ( .A(n1297), .B(n1341), .Y(n769) );
  XNOR2X1 U538 ( .A(n1295), .B(n1341), .Y(n770) );
  XNOR2X1 U539 ( .A(n1293), .B(n1341), .Y(n771) );
  XNOR2X1 U540 ( .A(n1291), .B(n1342), .Y(n772) );
  XNOR2X1 U541 ( .A(n1323), .B(n1342), .Y(n773) );
  OR2X1 U542 ( .A(n1323), .B(n1251), .Y(n774) );
  OAI22X1 U544 ( .A(n1112), .B(n1157), .C(n1280), .D(n791), .Y(n567) );
  OAI22X1 U547 ( .A(n1112), .B(n1280), .C(n1157), .D(n775), .Y(n620) );
  OAI22X1 U548 ( .A(n1157), .B(n776), .C(n1279), .D(n775), .Y(n621) );
  OAI22X1 U549 ( .A(n1279), .B(n776), .C(n1157), .D(n777), .Y(n622) );
  OAI22X1 U550 ( .A(n1280), .B(n777), .C(n1282), .D(n778), .Y(n623) );
  OAI22X1 U551 ( .A(n1279), .B(n778), .C(n1157), .D(n779), .Y(n624) );
  OAI22X1 U552 ( .A(n1280), .B(n779), .C(n1157), .D(n780), .Y(n625) );
  OAI22X1 U553 ( .A(n1279), .B(n780), .C(n1157), .D(n781), .Y(n626) );
  OAI22X1 U554 ( .A(n1280), .B(n781), .C(n1282), .D(n782), .Y(n627) );
  OAI22X1 U556 ( .A(n1280), .B(n783), .C(n1281), .D(n784), .Y(n629) );
  OAI22X1 U557 ( .A(n1279), .B(n784), .C(n1282), .D(n785), .Y(n630) );
  OAI22X1 U558 ( .A(n1280), .B(n785), .C(n1282), .D(n786), .Y(n631) );
  OAI22X1 U559 ( .A(n1279), .B(n786), .C(n1281), .D(n787), .Y(n632) );
  OAI22X1 U560 ( .A(n1280), .B(n787), .C(n1281), .D(n788), .Y(n633) );
  OAI22X1 U561 ( .A(n1279), .B(n788), .C(n1281), .D(n789), .Y(n634) );
  OAI22X1 U562 ( .A(n1280), .B(n789), .C(n1282), .D(n790), .Y(n635) );
  AND2X1 U563 ( .A(n1324), .B(n1278), .Y(n636) );
  XNOR2X1 U565 ( .A(n1319), .B(n1027), .Y(n775) );
  XNOR2X1 U566 ( .A(n1317), .B(n1026), .Y(n776) );
  XNOR2X1 U567 ( .A(n1315), .B(n1027), .Y(n777) );
  XNOR2X1 U568 ( .A(n1313), .B(n1027), .Y(n778) );
  XNOR2X1 U569 ( .A(n1311), .B(n1027), .Y(n779) );
  XNOR2X1 U570 ( .A(n1309), .B(n1026), .Y(n780) );
  XNOR2X1 U571 ( .A(n1307), .B(n1026), .Y(n781) );
  XNOR2X1 U572 ( .A(n1305), .B(n1027), .Y(n782) );
  XNOR2X1 U573 ( .A(n1303), .B(n1026), .Y(n783) );
  XNOR2X1 U574 ( .A(n1301), .B(n1026), .Y(n784) );
  XNOR2X1 U575 ( .A(n1299), .B(n1025), .Y(n785) );
  XNOR2X1 U576 ( .A(n1297), .B(n1025), .Y(n786) );
  XNOR2X1 U577 ( .A(n1295), .B(n1026), .Y(n787) );
  XNOR2X1 U578 ( .A(n1293), .B(n1027), .Y(n788) );
  XNOR2X1 U579 ( .A(n1291), .B(n1026), .Y(n789) );
  XNOR2X1 U580 ( .A(n1323), .B(n1027), .Y(n790) );
  OR2X1 U581 ( .A(n1323), .B(n1112), .Y(n791) );
  OAI22X1 U583 ( .A(n1338), .B(n1277), .C(n1275), .D(n808), .Y(n568) );
  OAI22X1 U586 ( .A(n1338), .B(n1275), .C(n1277), .D(n792), .Y(n638) );
  OAI22X1 U587 ( .A(n1260), .B(n793), .C(n1274), .D(n792), .Y(n639) );
  OAI22X1 U588 ( .A(n1274), .B(n793), .C(n1277), .D(n794), .Y(n640) );
  OAI22X1 U589 ( .A(n1275), .B(n794), .C(n795), .D(n1260), .Y(n641) );
  OAI22X1 U591 ( .A(n1275), .B(n796), .C(n1260), .D(n797), .Y(n643) );
  OAI22X1 U592 ( .A(n1274), .B(n797), .C(n1277), .D(n798), .Y(n644) );
  OAI22X1 U593 ( .A(n1275), .B(n798), .C(n1277), .D(n799), .Y(n645) );
  OAI22X1 U594 ( .A(n1274), .B(n799), .C(n1260), .D(n800), .Y(n646) );
  OAI22X1 U595 ( .A(n1275), .B(n800), .C(n1277), .D(n801), .Y(n647) );
  OAI22X1 U596 ( .A(n1274), .B(n801), .C(n1277), .D(n802), .Y(n648) );
  OAI22X1 U597 ( .A(n1275), .B(n802), .C(n1277), .D(n803), .Y(n649) );
  OAI22X1 U598 ( .A(n1274), .B(n803), .C(n1260), .D(n804), .Y(n650) );
  OAI22X1 U599 ( .A(n1275), .B(n804), .C(n1260), .D(n805), .Y(n651) );
  OAI22X1 U600 ( .A(n1274), .B(n805), .C(n1277), .D(n806), .Y(n652) );
  OAI22X1 U601 ( .A(n1275), .B(n806), .C(n1260), .D(n807), .Y(n653) );
  AND2X1 U602 ( .A(n1324), .B(n1166), .Y(n654) );
  XNOR2X1 U604 ( .A(n1319), .B(n1337), .Y(n792) );
  XNOR2X1 U605 ( .A(n1317), .B(n1337), .Y(n793) );
  XNOR2X1 U606 ( .A(n1315), .B(n1337), .Y(n794) );
  XNOR2X1 U608 ( .A(n1311), .B(n1337), .Y(n796) );
  XNOR2X1 U609 ( .A(n1309), .B(n1337), .Y(n797) );
  XNOR2X1 U610 ( .A(n1307), .B(n1337), .Y(n798) );
  XNOR2X1 U611 ( .A(n1305), .B(n1337), .Y(n799) );
  XNOR2X1 U612 ( .A(n1303), .B(n1337), .Y(n800) );
  XNOR2X1 U613 ( .A(n1301), .B(n1337), .Y(n801) );
  XNOR2X1 U614 ( .A(n1299), .B(n1337), .Y(n802) );
  XNOR2X1 U615 ( .A(n1297), .B(n1337), .Y(n803) );
  XNOR2X1 U616 ( .A(n1295), .B(n1337), .Y(n804) );
  XNOR2X1 U617 ( .A(n1293), .B(n1337), .Y(n805) );
  XNOR2X1 U618 ( .A(n1291), .B(n1337), .Y(n806) );
  XNOR2X1 U619 ( .A(n1323), .B(n1337), .Y(n807) );
  OR2X1 U620 ( .A(n1323), .B(n1338), .Y(n808) );
  OAI22X1 U622 ( .A(n1336), .B(n1272), .C(n1271), .D(n825), .Y(n569) );
  OAI22X1 U625 ( .A(n1336), .B(n1271), .C(n1272), .D(n809), .Y(n656) );
  OAI22X1 U626 ( .A(n1273), .B(n810), .C(n1070), .D(n809), .Y(n657) );
  OAI22X1 U627 ( .A(n1271), .B(n810), .C(n1273), .D(n811), .Y(n658) );
  OAI22X1 U628 ( .A(n1271), .B(n811), .C(n1272), .D(n812), .Y(n659) );
  OAI22X1 U629 ( .A(n1271), .B(n812), .C(n1273), .D(n813), .Y(n660) );
  OAI22X1 U630 ( .A(n813), .B(n1070), .C(n1272), .D(n814), .Y(n661) );
  OAI22X1 U631 ( .A(n814), .B(n1271), .C(n1273), .D(n815), .Y(n662) );
  OAI22X1 U632 ( .A(n1271), .B(n815), .C(n1273), .D(n816), .Y(n663) );
  OAI22X1 U633 ( .A(n1271), .B(n816), .C(n1272), .D(n817), .Y(n664) );
  OAI22X1 U634 ( .A(n1271), .B(n817), .C(n1273), .D(n818), .Y(n665) );
  OAI22X1 U635 ( .A(n1271), .B(n818), .C(n1272), .D(n819), .Y(n666) );
  OAI22X1 U636 ( .A(n1271), .B(n819), .C(n1273), .D(n820), .Y(n667) );
  OAI22X1 U637 ( .A(n1271), .B(n820), .C(n1272), .D(n821), .Y(n668) );
  OAI22X1 U638 ( .A(n1271), .B(n821), .C(n1273), .D(n822), .Y(n669) );
  OAI22X1 U639 ( .A(n1271), .B(n822), .C(n1272), .D(n823), .Y(n670) );
  OAI22X1 U640 ( .A(n1271), .B(n823), .C(n1273), .D(n824), .Y(n671) );
  AND2X1 U641 ( .A(n1324), .B(n1240), .Y(n672) );
  XNOR2X1 U643 ( .A(n1319), .B(n1335), .Y(n809) );
  XNOR2X1 U644 ( .A(n1317), .B(n1335), .Y(n810) );
  XNOR2X1 U645 ( .A(n1315), .B(n1335), .Y(n811) );
  XNOR2X1 U646 ( .A(n1313), .B(n1335), .Y(n812) );
  XNOR2X1 U647 ( .A(n1311), .B(n1335), .Y(n813) );
  XNOR2X1 U648 ( .A(n1309), .B(n1335), .Y(n814) );
  XNOR2X1 U649 ( .A(n1307), .B(n1335), .Y(n815) );
  XNOR2X1 U650 ( .A(n1305), .B(n1335), .Y(n816) );
  XNOR2X1 U651 ( .A(n1303), .B(n1335), .Y(n817) );
  XNOR2X1 U652 ( .A(n1301), .B(n1335), .Y(n818) );
  XNOR2X1 U653 ( .A(n1299), .B(n1335), .Y(n819) );
  XNOR2X1 U654 ( .A(n1297), .B(n1335), .Y(n820) );
  XNOR2X1 U655 ( .A(n1295), .B(n1335), .Y(n821) );
  XNOR2X1 U656 ( .A(n1293), .B(n1335), .Y(n822) );
  XNOR2X1 U657 ( .A(n1291), .B(n1335), .Y(n823) );
  XNOR2X1 U658 ( .A(n1323), .B(n1335), .Y(n824) );
  OR2X1 U659 ( .A(n1323), .B(n1336), .Y(n825) );
  OAI22X1 U661 ( .A(n1156), .B(n1270), .C(n1268), .D(n842), .Y(n570) );
  OAI22X1 U664 ( .A(n1156), .B(n1269), .C(n826), .D(n1039), .Y(n674) );
  OAI22X1 U665 ( .A(n1039), .B(n827), .C(n1268), .D(n826), .Y(n675) );
  OAI22X1 U666 ( .A(n1268), .B(n827), .C(n1270), .D(n828), .Y(n676) );
  OAI22X1 U668 ( .A(n1269), .B(n829), .C(n1039), .D(n830), .Y(n678) );
  OAI22X1 U669 ( .A(n1268), .B(n830), .C(n1039), .D(n831), .Y(n679) );
  OAI22X1 U670 ( .A(n1268), .B(n831), .C(n1249), .D(n832), .Y(n680) );
  OAI22X1 U671 ( .A(n1268), .B(n832), .C(n1249), .D(n833), .Y(n681) );
  OAI22X1 U672 ( .A(n1268), .B(n833), .C(n1249), .D(n834), .Y(n682) );
  OAI22X1 U673 ( .A(n1268), .B(n834), .C(n1270), .D(n835), .Y(n683) );
  OAI22X1 U674 ( .A(n1268), .B(n835), .C(n1249), .D(n836), .Y(n684) );
  OAI22X1 U675 ( .A(n1268), .B(n836), .C(n1270), .D(n837), .Y(n685) );
  OAI22X1 U676 ( .A(n1268), .B(n837), .C(n1249), .D(n838), .Y(n686) );
  OAI22X1 U677 ( .A(n1268), .B(n838), .C(n1270), .D(n839), .Y(n687) );
  OAI22X1 U678 ( .A(n1268), .B(n839), .C(n1270), .D(n840), .Y(n688) );
  OAI22X1 U679 ( .A(n1268), .B(n840), .C(n1249), .D(n841), .Y(n689) );
  AND2X1 U680 ( .A(n1324), .B(n558), .Y(n690) );
  XNOR2X1 U682 ( .A(n1319), .B(n1333), .Y(n826) );
  XNOR2X1 U683 ( .A(n1317), .B(n1333), .Y(n827) );
  XNOR2X1 U684 ( .A(n1315), .B(n1333), .Y(n828) );
  XNOR2X1 U685 ( .A(n1313), .B(n1096), .Y(n829) );
  XNOR2X1 U686 ( .A(n1074), .B(n1333), .Y(n830) );
  XNOR2X1 U688 ( .A(n1307), .B(n1096), .Y(n832) );
  XNOR2X1 U689 ( .A(n1305), .B(n1095), .Y(n833) );
  XNOR2X1 U690 ( .A(n1303), .B(n1095), .Y(n834) );
  XNOR2X1 U691 ( .A(n1301), .B(n1096), .Y(n835) );
  XNOR2X1 U692 ( .A(n1083), .B(n1095), .Y(n836) );
  XNOR2X1 U693 ( .A(n1297), .B(n1095), .Y(n837) );
  XNOR2X1 U694 ( .A(n1295), .B(n1096), .Y(n838) );
  XNOR2X1 U695 ( .A(n1293), .B(n1096), .Y(n839) );
  XNOR2X1 U696 ( .A(n1291), .B(n1095), .Y(n840) );
  XNOR2X1 U697 ( .A(n1323), .B(n1095), .Y(n841) );
  OR2X1 U698 ( .A(n1323), .B(n1156), .Y(n842) );
  OAI22X1 U700 ( .A(n1331), .B(n1267), .C(n1266), .D(n859), .Y(n571) );
  OAI22X1 U703 ( .A(n1331), .B(n1266), .C(n1049), .D(n843), .Y(n692) );
  OAI22X1 U704 ( .A(n1267), .B(n844), .C(n1266), .D(n843), .Y(n693) );
  OAI22X1 U707 ( .A(n846), .B(n1266), .C(n1267), .D(n847), .Y(n696) );
  OAI22X1 U708 ( .A(n1266), .B(n847), .C(n1267), .D(n848), .Y(n697) );
  OAI22X1 U709 ( .A(n1266), .B(n848), .C(n1267), .D(n849), .Y(n698) );
  OAI22X1 U710 ( .A(n1266), .B(n849), .C(n1049), .D(n850), .Y(n699) );
  OAI22X1 U711 ( .A(n1266), .B(n850), .C(n1267), .D(n851), .Y(n700) );
  OAI22X1 U712 ( .A(n1266), .B(n851), .C(n1267), .D(n852), .Y(n701) );
  OAI22X1 U713 ( .A(n1266), .B(n852), .C(n1267), .D(n853), .Y(n702) );
  OAI22X1 U714 ( .A(n1266), .B(n853), .C(n1267), .D(n854), .Y(n703) );
  OAI22X1 U715 ( .A(n1266), .B(n854), .C(n1267), .D(n855), .Y(n704) );
  OAI22X1 U716 ( .A(n1266), .B(n855), .C(n1267), .D(n856), .Y(n705) );
  OAI22X1 U717 ( .A(n1266), .B(n856), .C(n1267), .D(n857), .Y(n706) );
  OAI22X1 U718 ( .A(n1266), .B(n857), .C(n1267), .D(n858), .Y(n707) );
  AND2X1 U719 ( .A(n1324), .B(n1265), .Y(n708) );
  XNOR2X1 U721 ( .A(n1319), .B(n1242), .Y(n843) );
  XNOR2X1 U723 ( .A(n1315), .B(n1330), .Y(n845) );
  XNOR2X1 U725 ( .A(n1311), .B(n1242), .Y(n847) );
  XNOR2X1 U726 ( .A(n1309), .B(n1243), .Y(n848) );
  XNOR2X1 U727 ( .A(n1307), .B(n1242), .Y(n849) );
  XNOR2X1 U728 ( .A(n1305), .B(n1242), .Y(n850) );
  XNOR2X1 U729 ( .A(n1303), .B(n1243), .Y(n851) );
  XNOR2X1 U730 ( .A(n1301), .B(n1243), .Y(n852) );
  XNOR2X1 U731 ( .A(n1083), .B(n1243), .Y(n853) );
  XNOR2X1 U732 ( .A(n1297), .B(n1243), .Y(n854) );
  XNOR2X1 U733 ( .A(n1295), .B(n1243), .Y(n855) );
  XNOR2X1 U734 ( .A(n1293), .B(n1243), .Y(n856) );
  XNOR2X1 U735 ( .A(n1291), .B(n1243), .Y(n857) );
  XNOR2X1 U736 ( .A(n1323), .B(n1243), .Y(n858) );
  OR2X1 U737 ( .A(n1323), .B(n1331), .Y(n859) );
  OAI22X1 U739 ( .A(n1328), .B(n1263), .C(n917), .D(n876), .Y(n572) );
  OAI22X1 U742 ( .A(n917), .B(n1328), .C(n1264), .D(n860), .Y(n710) );
  OAI22X1 U743 ( .A(n1264), .B(n861), .C(n917), .D(n860), .Y(n711) );
  OAI22X1 U744 ( .A(n1263), .B(n862), .C(n917), .D(n861), .Y(n712) );
  OAI22X1 U745 ( .A(n1264), .B(n863), .C(n917), .D(n862), .Y(n713) );
  OAI22X1 U746 ( .A(n1263), .B(n864), .C(n917), .D(n863), .Y(n714) );
  OAI22X1 U747 ( .A(n1264), .B(n865), .C(n917), .D(n864), .Y(n715) );
  OAI22X1 U748 ( .A(n1263), .B(n866), .C(n917), .D(n865), .Y(n716) );
  OAI22X1 U749 ( .A(n1263), .B(n867), .C(n917), .D(n866), .Y(n717) );
  OAI22X1 U750 ( .A(n1264), .B(n868), .C(n917), .D(n867), .Y(n718) );
  OAI22X1 U751 ( .A(n1263), .B(n869), .C(n917), .D(n868), .Y(n719) );
  OAI22X1 U752 ( .A(n1264), .B(n870), .C(n917), .D(n869), .Y(n720) );
  OAI22X1 U753 ( .A(n1263), .B(n871), .C(n917), .D(n870), .Y(n721) );
  OAI22X1 U754 ( .A(n1264), .B(n872), .C(n917), .D(n871), .Y(n722) );
  OAI22X1 U755 ( .A(n1263), .B(n873), .C(n917), .D(n872), .Y(n723) );
  OAI22X1 U756 ( .A(n1264), .B(n874), .C(n917), .D(n873), .Y(n724) );
  OAI22X1 U757 ( .A(n917), .B(n874), .C(n1264), .D(n875), .Y(n725) );
  XNOR2X1 U758 ( .A(n1319), .B(n1327), .Y(n860) );
  XNOR2X1 U759 ( .A(n1317), .B(n1327), .Y(n861) );
  XNOR2X1 U760 ( .A(n1315), .B(n1327), .Y(n862) );
  XNOR2X1 U761 ( .A(n1313), .B(n1326), .Y(n863) );
  XNOR2X1 U762 ( .A(n1311), .B(n1326), .Y(n864) );
  XNOR2X1 U763 ( .A(n1309), .B(n1326), .Y(n865) );
  XNOR2X1 U764 ( .A(n1307), .B(n1326), .Y(n866) );
  XNOR2X1 U765 ( .A(n1305), .B(n1326), .Y(n867) );
  XNOR2X1 U766 ( .A(n1303), .B(n1326), .Y(n868) );
  XNOR2X1 U767 ( .A(n1301), .B(n1326), .Y(n869) );
  XNOR2X1 U768 ( .A(n1083), .B(n1326), .Y(n870) );
  XNOR2X1 U769 ( .A(n1297), .B(n1326), .Y(n871) );
  XNOR2X1 U770 ( .A(n1295), .B(n1326), .Y(n872) );
  XNOR2X1 U771 ( .A(n1293), .B(n1326), .Y(n873) );
  XNOR2X1 U772 ( .A(n1291), .B(n1326), .Y(n874) );
  XNOR2X1 U773 ( .A(n1323), .B(n1326), .Y(n875) );
  OR2X1 U774 ( .A(n1323), .B(n1261), .Y(n876) );
  XOR2X1 U802 ( .A(n541), .B(a[29]), .Y(n893) );
  XOR2X1 U805 ( .A(n1341), .B(a[27]), .Y(n894) );
  XNOR2X1 U809 ( .A(n25), .B(a[25]), .Y(n34) );
  NAND2X1 U810 ( .A(n896), .B(n28), .Y(n30) );
  XNOR2X1 U812 ( .A(n19), .B(a[23]), .Y(n28) );
  XOR2X1 U814 ( .A(n1102), .B(a[21]), .Y(n897) );
  XOR2X1 U817 ( .A(n1333), .B(a[19]), .Y(n898) );
  XOR2X1 U820 ( .A(n1330), .B(a[17]), .Y(n899) );
  XNOR2X1 U821 ( .A(n1), .B(a[17]), .Y(n9) );
  XOR2X1 U823 ( .A(a[15]), .B(n1), .Y(n900) );
  XOR2X1 U828 ( .A(n667), .B(n635), .Y(n995) );
  XOR2X1 U829 ( .A(n699), .B(n995), .Y(n498) );
  NAND2X1 U830 ( .A(n699), .B(n667), .Y(n996) );
  NAND2X1 U831 ( .A(n699), .B(n635), .Y(n997) );
  NAND2X1 U832 ( .A(n667), .B(n635), .Y(n998) );
  NAND3X1 U833 ( .A(n997), .B(n996), .C(n998), .Y(n497) );
  XOR2X1 U834 ( .A(n428), .B(n441), .Y(n999) );
  XOR2X1 U835 ( .A(n437), .B(n999), .Y(n422) );
  NAND2X1 U836 ( .A(n437), .B(n428), .Y(n1000) );
  NAND2X1 U837 ( .A(n437), .B(n441), .Y(n1001) );
  NAND2X1 U838 ( .A(n428), .B(n441), .Y(n1002) );
  NAND3X1 U839 ( .A(n1001), .B(n1000), .C(n1002), .Y(n421) );
  XOR2X1 U840 ( .A(n643), .B(n579), .Y(n1003) );
  XOR2X1 U841 ( .A(n595), .B(n1003), .Y(n400) );
  NAND2X1 U842 ( .A(n595), .B(n643), .Y(n1004) );
  NAND2X1 U843 ( .A(n595), .B(n579), .Y(n1005) );
  NAND2X1 U844 ( .A(n643), .B(n579), .Y(n1006) );
  NAND3X1 U845 ( .A(n1005), .B(n1004), .C(n1006), .Y(n399) );
  XOR2X1 U846 ( .A(n337), .B(n576), .Y(n1007) );
  XOR2X1 U847 ( .A(n605), .B(n1007), .Y(n328) );
  NAND2X1 U848 ( .A(n605), .B(n337), .Y(n1008) );
  NAND2X1 U849 ( .A(n605), .B(n576), .Y(n1009) );
  NAND2X1 U850 ( .A(n337), .B(n576), .Y(n1010) );
  NAND3X1 U851 ( .A(n1009), .B(n1008), .C(n1010), .Y(n327) );
  INVX8 U852 ( .A(n880), .Y(n1312) );
  XOR2X1 U853 ( .A(n412), .B(n423), .Y(n1011) );
  XOR2X1 U854 ( .A(n410), .B(n1011), .Y(n406) );
  NAND2X1 U855 ( .A(n410), .B(n412), .Y(n1012) );
  NAND2X1 U856 ( .A(n410), .B(n423), .Y(n1013) );
  NAND2X1 U857 ( .A(n412), .B(n423), .Y(n1014) );
  NAND3X1 U858 ( .A(n1013), .B(n1012), .C(n1014), .Y(n405) );
  XOR2X1 U859 ( .A(n713), .B(n697), .Y(n480) );
  INVX2 U860 ( .A(n1015), .Y(n479) );
  NAND2X1 U861 ( .A(n713), .B(n697), .Y(n1015) );
  XOR2X1 U862 ( .A(n1110), .B(n1122), .Y(n1016) );
  XOR2X1 U863 ( .A(n1016), .B(n454), .Y(n448) );
  NAND2X1 U864 ( .A(n1110), .B(n1122), .Y(n1017) );
  NAND2X1 U865 ( .A(n1110), .B(n454), .Y(n1018) );
  NAND2X1 U866 ( .A(n1122), .B(n454), .Y(n1019) );
  NAND3X1 U867 ( .A(n1017), .B(n1018), .C(n1019), .Y(n447) );
  XOR2X1 U868 ( .A(n1059), .B(n1038), .Y(n1020) );
  XOR2X1 U869 ( .A(n1020), .B(n447), .Y(n432) );
  NAND2X1 U870 ( .A(n1059), .B(n1038), .Y(n1021) );
  NAND2X1 U871 ( .A(n1059), .B(n447), .Y(n1022) );
  NAND2X1 U872 ( .A(n1038), .B(n447), .Y(n1023) );
  NAND3X1 U873 ( .A(n1021), .B(n1022), .C(n1023), .Y(n431) );
  OR2X1 U874 ( .A(n1323), .B(n918), .Y(n757) );
  INVX8 U875 ( .A(n1322), .Y(n918) );
  INVX8 U876 ( .A(n1300), .Y(n1301) );
  BUFX4 U877 ( .A(n1329), .Y(n1242) );
  BUFX4 U878 ( .A(n53), .Y(n1247) );
  INVX4 U879 ( .A(n1071), .Y(n1072) );
  INVX8 U880 ( .A(n1261), .Y(n1326) );
  INVX4 U881 ( .A(n1103), .Y(n1104) );
  INVX8 U882 ( .A(n1339), .Y(n1024) );
  INVX4 U883 ( .A(n1024), .Y(n1025) );
  INVX8 U884 ( .A(n1024), .Y(n1026) );
  INVX8 U885 ( .A(n1024), .Y(n1027) );
  INVX4 U886 ( .A(n1220), .Y(n1028) );
  INVX8 U887 ( .A(n1028), .Y(n1029) );
  BUFX4 U888 ( .A(n459), .Y(n1030) );
  INVX8 U889 ( .A(n1343), .Y(n1341) );
  INVX4 U890 ( .A(n37), .Y(n1343) );
  BUFX4 U891 ( .A(n455), .Y(n1031) );
  BUFX4 U892 ( .A(n381), .Y(n1032) );
  BUFX4 U893 ( .A(n395), .Y(n1033) );
  INVX8 U894 ( .A(n1338), .Y(n1337) );
  INVX8 U895 ( .A(n25), .Y(n1338) );
  INVX8 U896 ( .A(n1306), .Y(n1307) );
  INVX4 U897 ( .A(n883), .Y(n1306) );
  INVX8 U898 ( .A(n1316), .Y(n1317) );
  INVX4 U899 ( .A(n878), .Y(n1316) );
  INVX8 U900 ( .A(n1314), .Y(n1315) );
  INVX4 U901 ( .A(n879), .Y(n1314) );
  INVX8 U902 ( .A(n1296), .Y(n1297) );
  INVX4 U903 ( .A(n888), .Y(n1296) );
  INVX8 U904 ( .A(n1318), .Y(n1319) );
  INVX4 U905 ( .A(n877), .Y(n1318) );
  INVX4 U906 ( .A(n1113), .Y(n563) );
  INVX2 U907 ( .A(n1250), .Y(n1095) );
  INVX2 U908 ( .A(n736), .Y(n1083) );
  INVX2 U909 ( .A(n1), .Y(n1261) );
  INVX2 U910 ( .A(n884), .Y(n1304) );
  INVX4 U911 ( .A(n1292), .Y(n1293) );
  INVX2 U912 ( .A(n1250), .Y(n1096) );
  INVX2 U913 ( .A(n887), .Y(n1298) );
  INVX2 U914 ( .A(n1168), .Y(n1282) );
  INVX2 U915 ( .A(n881), .Y(n1310) );
  INVX2 U916 ( .A(n693), .Y(n1155) );
  INVX2 U917 ( .A(n1256), .Y(n1272) );
  INVX4 U918 ( .A(n1310), .Y(n1311) );
  BUFX2 U919 ( .A(n1283), .Y(n1219) );
  INVX4 U920 ( .A(n1312), .Y(n1313) );
  INVX2 U921 ( .A(n1107), .Y(n1108) );
  INVX2 U922 ( .A(n392), .Y(n1056) );
  INVX2 U923 ( .A(n1320), .Y(n1220) );
  INVX4 U924 ( .A(n1036), .Y(n1037) );
  INVX2 U925 ( .A(n1321), .Y(n1036) );
  BUFX2 U926 ( .A(n137), .Y(n1244) );
  INVX8 U927 ( .A(n1043), .Y(n1288) );
  INVX4 U928 ( .A(n19), .Y(n1336) );
  BUFX4 U929 ( .A(n456), .Y(n1034) );
  INVX2 U930 ( .A(n287), .Y(n1035) );
  BUFX4 U931 ( .A(n436), .Y(n1038) );
  INVX4 U932 ( .A(n1097), .Y(n1270) );
  INVX4 U933 ( .A(n1097), .Y(n1249) );
  INVX1 U934 ( .A(n211), .Y(n209) );
  BUFX4 U935 ( .A(n1073), .Y(n1039) );
  BUFX4 U936 ( .A(n389), .Y(n1040) );
  INVX2 U937 ( .A(n30), .Y(n1276) );
  OR2X2 U938 ( .A(n918), .B(n1296), .Y(n1041) );
  INVX2 U939 ( .A(n34), .Y(n1278) );
  INVX2 U940 ( .A(n28), .Y(n1166) );
  OR2X2 U941 ( .A(n724), .B(n708), .Y(n1042) );
  INVX2 U942 ( .A(n1332), .Y(n1156) );
  AND2X2 U943 ( .A(n46), .B(n893), .Y(n1043) );
  OR2X2 U944 ( .A(n308), .B(n313), .Y(n1044) );
  XNOR2X1 U945 ( .A(n1331), .B(a[19]), .Y(n1045) );
  AND2X2 U946 ( .A(n169), .B(n283), .Y(n1046) );
  AND2X2 U947 ( .A(n162), .B(n282), .Y(n1047) );
  AND2X2 U948 ( .A(n178), .B(n284), .Y(n1048) );
  INVX2 U949 ( .A(n1166), .Y(n1274) );
  INVX2 U950 ( .A(n1276), .Y(n1277) );
  INVX4 U951 ( .A(n1286), .Y(n1287) );
  INVX2 U952 ( .A(n46), .Y(n1286) );
  INVX4 U953 ( .A(n1240), .Y(n1271) );
  NAND2X1 U954 ( .A(n9), .B(n899), .Y(n1049) );
  OR2X2 U955 ( .A(n9), .B(n845), .Y(n1050) );
  INVX4 U956 ( .A(n1294), .Y(n1295) );
  INVX2 U957 ( .A(n885), .Y(n1302) );
  AND2X2 U958 ( .A(n724), .B(n708), .Y(n1051) );
  OR2X2 U959 ( .A(n292), .B(n293), .Y(n1052) );
  INVX4 U960 ( .A(n1219), .Y(n1053) );
  INVX2 U961 ( .A(n1053), .Y(n1054) );
  INVX4 U962 ( .A(n1053), .Y(n1055) );
  XNOR2X1 U963 ( .A(n403), .B(n1056), .Y(n1090) );
  AND2X2 U964 ( .A(n1324), .B(n1222), .Y(n618) );
  INVX1 U965 ( .A(n182), .Y(n285) );
  OAI22X1 U966 ( .A(n1275), .B(n800), .C(n1277), .D(n801), .Y(n1057) );
  INVX2 U967 ( .A(n886), .Y(n1300) );
  INVX2 U968 ( .A(n449), .Y(n1058) );
  INVX2 U969 ( .A(n1058), .Y(n1059) );
  XOR2X1 U970 ( .A(n577), .B(n359), .Y(n1060) );
  XOR2X1 U971 ( .A(n623), .B(n1060), .Y(n348) );
  NAND2X1 U972 ( .A(n623), .B(n577), .Y(n1061) );
  NAND2X1 U973 ( .A(n623), .B(n359), .Y(n1062) );
  NAND2X1 U974 ( .A(n577), .B(n359), .Y(n1063) );
  NAND3X1 U975 ( .A(n1062), .B(n1061), .C(n1063), .Y(n347) );
  XNOR2X1 U976 ( .A(n1064), .B(n1254), .Y(n370) );
  XNOR2X1 U977 ( .A(n609), .B(n657), .Y(n1064) );
  INVX1 U978 ( .A(n1309), .Y(n731) );
  XNOR2X1 U979 ( .A(n1065), .B(n25), .Y(n896) );
  INVX1 U980 ( .A(a[23]), .Y(n1065) );
  XOR2X1 U981 ( .A(n375), .B(n366), .Y(n1066) );
  XOR2X1 U982 ( .A(n364), .B(n1066), .Y(n362) );
  NAND2X1 U983 ( .A(n364), .B(n375), .Y(n1067) );
  NAND2X1 U984 ( .A(n364), .B(n366), .Y(n1068) );
  NAND2X1 U985 ( .A(n375), .B(n366), .Y(n1069) );
  NAND3X1 U986 ( .A(n1068), .B(n1067), .C(n1069), .Y(n361) );
  INVX2 U987 ( .A(n9), .Y(n1265) );
  XNOR2X1 U988 ( .A(n1312), .B(n1338), .Y(n795) );
  XNOR2X1 U989 ( .A(n13), .B(a[21]), .Y(n1070) );
  INVX2 U990 ( .A(n1070), .Y(n1240) );
  INVX4 U991 ( .A(n49), .Y(n1325) );
  INVX2 U992 ( .A(n489), .Y(n1071) );
  XNOR2X1 U993 ( .A(n1308), .B(n1156), .Y(n831) );
  NAND2X1 U994 ( .A(n898), .B(n1269), .Y(n1073) );
  INVX4 U995 ( .A(n1265), .Y(n1266) );
  INVX2 U996 ( .A(n1278), .Y(n1279) );
  INVX2 U997 ( .A(n1334), .Y(n1332) );
  INVX1 U998 ( .A(n1248), .Y(n156) );
  INVX2 U999 ( .A(n1310), .Y(n1074) );
  XOR2X1 U1000 ( .A(n421), .B(n408), .Y(n1075) );
  XOR2X1 U1001 ( .A(n1075), .B(n419), .Y(n404) );
  XOR2X1 U1002 ( .A(n417), .B(n406), .Y(n1076) );
  XOR2X1 U1003 ( .A(n1076), .B(n404), .Y(n402) );
  NAND2X1 U1004 ( .A(n421), .B(n408), .Y(n1077) );
  NAND2X1 U1005 ( .A(n421), .B(n419), .Y(n1078) );
  NAND2X1 U1006 ( .A(n408), .B(n419), .Y(n1079) );
  NAND3X1 U1007 ( .A(n1077), .B(n1078), .C(n1079), .Y(n403) );
  NAND2X1 U1008 ( .A(n417), .B(n406), .Y(n1080) );
  NAND2X1 U1009 ( .A(n417), .B(n404), .Y(n1081) );
  NAND2X1 U1010 ( .A(n406), .B(n404), .Y(n1082) );
  NAND3X1 U1011 ( .A(n1080), .B(n1081), .C(n1082), .Y(n401) );
  INVX2 U1012 ( .A(n1299), .Y(n736) );
  XNOR2X1 U1013 ( .A(n1084), .B(n677), .Y(n424) );
  XNOR2X1 U1014 ( .A(n613), .B(n661), .Y(n1084) );
  INVX1 U1015 ( .A(n1311), .Y(n730) );
  AND2X2 U1016 ( .A(n1322), .B(n1293), .Y(n580) );
  BUFX2 U1017 ( .A(a[25]), .Y(n1085) );
  XOR2X1 U1018 ( .A(n1312), .B(n1330), .Y(n846) );
  AND2X2 U1019 ( .A(n1322), .B(n1301), .Y(n359) );
  XOR2X1 U1020 ( .A(n422), .B(n435), .Y(n1086) );
  XOR2X1 U1021 ( .A(n433), .B(n1086), .Y(n418) );
  NAND2X1 U1022 ( .A(n433), .B(n422), .Y(n1087) );
  NAND2X1 U1023 ( .A(n433), .B(n435), .Y(n1088) );
  NAND2X1 U1024 ( .A(n422), .B(n435), .Y(n1089) );
  NAND3X1 U1025 ( .A(n1088), .B(n1087), .C(n1089), .Y(n417) );
  XOR2X1 U1026 ( .A(n1090), .B(n390), .Y(n388) );
  NAND2X1 U1027 ( .A(n390), .B(n403), .Y(n1091) );
  NAND2X1 U1028 ( .A(n390), .B(n392), .Y(n1092) );
  NAND2X1 U1029 ( .A(n403), .B(n392), .Y(n1093) );
  NAND3X1 U1030 ( .A(n1092), .B(n1091), .C(n1093), .Y(n387) );
  XOR2X1 U1031 ( .A(n1094), .B(n596), .Y(n412) );
  XOR2X1 U1032 ( .A(n628), .B(n676), .Y(n1094) );
  INVX4 U1033 ( .A(n1320), .Y(n1322) );
  INVX2 U1034 ( .A(n1166), .Y(n1275) );
  AND2X2 U1035 ( .A(n898), .B(n1269), .Y(n1097) );
  AND2X2 U1036 ( .A(n1322), .B(n1291), .Y(n581) );
  XOR2X1 U1037 ( .A(n660), .B(n644), .Y(n1098) );
  XOR2X1 U1038 ( .A(n612), .B(n1098), .Y(n410) );
  NAND2X1 U1039 ( .A(n612), .B(n660), .Y(n1099) );
  NAND2X1 U1040 ( .A(n612), .B(n644), .Y(n1100) );
  NAND2X1 U1041 ( .A(n660), .B(n644), .Y(n1101) );
  NAND3X1 U1042 ( .A(n1100), .B(n1099), .C(n1101), .Y(n409) );
  BUFX2 U1043 ( .A(n19), .Y(n1102) );
  INVX1 U1044 ( .A(n183), .Y(n181) );
  INVX2 U1045 ( .A(n384), .Y(n1103) );
  INVX2 U1046 ( .A(n889), .Y(n1294) );
  AND2X2 U1047 ( .A(n9), .B(n899), .Y(n1105) );
  XNOR2X1 U1048 ( .A(n1106), .B(n1085), .Y(n895) );
  INVX2 U1049 ( .A(n31), .Y(n1106) );
  INVX4 U1050 ( .A(n882), .Y(n1308) );
  INVX1 U1051 ( .A(n31), .Y(n1340) );
  INVX1 U1052 ( .A(n222), .Y(n221) );
  INVX4 U1053 ( .A(n1331), .Y(n1330) );
  INVX2 U1054 ( .A(n499), .Y(n1107) );
  INVX2 U1055 ( .A(n465), .Y(n1109) );
  INVX4 U1056 ( .A(n1109), .Y(n1110) );
  INVX4 U1057 ( .A(n1045), .Y(n1269) );
  INVX4 U1058 ( .A(n1045), .Y(n1268) );
  INVX1 U1059 ( .A(n1341), .Y(n1251) );
  XNOR2X1 U1060 ( .A(n73), .B(n1111), .Y(product[46]) );
  AND2X2 U1061 ( .A(n72), .B(n1052), .Y(n1111) );
  INVX1 U1062 ( .A(n1026), .Y(n1112) );
  AOI22X1 U1063 ( .A(a[15]), .B(n1114), .C(n1114), .D(n1239), .Y(n1113) );
  INVX2 U1064 ( .A(n1328), .Y(n1114) );
  INVX2 U1065 ( .A(n1239), .Y(n1263) );
  NAND2X1 U1066 ( .A(n1050), .B(n1115), .Y(n695) );
  OR2X1 U1067 ( .A(n1049), .B(n846), .Y(n1115) );
  INVX2 U1068 ( .A(n173), .Y(n1116) );
  XOR2X1 U1069 ( .A(n625), .B(n593), .Y(n1117) );
  XOR2X1 U1070 ( .A(n372), .B(n1117), .Y(n368) );
  NAND2X1 U1071 ( .A(n372), .B(n625), .Y(n1118) );
  NAND2X1 U1072 ( .A(n372), .B(n593), .Y(n1119) );
  NAND2X1 U1073 ( .A(n625), .B(n593), .Y(n1120) );
  NAND3X1 U1074 ( .A(n1119), .B(n1118), .C(n1120), .Y(n367) );
  XOR2X1 U1075 ( .A(n1316), .B(n1330), .Y(n844) );
  OR2X1 U1076 ( .A(n9), .B(n844), .Y(n1200) );
  INVX4 U1077 ( .A(n1334), .Y(n1333) );
  INVX2 U1078 ( .A(n452), .Y(n1121) );
  INVX4 U1079 ( .A(n1121), .Y(n1122) );
  XOR2X1 U1080 ( .A(n383), .B(n1032), .Y(n1123) );
  XOR2X1 U1081 ( .A(n370), .B(n1123), .Y(n366) );
  NAND2X1 U1082 ( .A(n609), .B(n657), .Y(n1124) );
  NAND2X1 U1083 ( .A(n609), .B(n1254), .Y(n1125) );
  NAND2X1 U1084 ( .A(n657), .B(n1254), .Y(n1126) );
  NAND3X1 U1085 ( .A(n1124), .B(n1125), .C(n1126), .Y(n369) );
  NAND2X1 U1086 ( .A(n383), .B(n1032), .Y(n1127) );
  NAND2X1 U1087 ( .A(n383), .B(n370), .Y(n1128) );
  NAND2X1 U1088 ( .A(n1032), .B(n370), .Y(n1129) );
  NAND3X1 U1089 ( .A(n1127), .B(n1128), .C(n1129), .Y(n365) );
  XNOR2X1 U1090 ( .A(n1130), .B(n391), .Y(n376) );
  XNOR2X1 U1091 ( .A(n393), .B(n380), .Y(n1130) );
  XNOR2X1 U1092 ( .A(n145), .B(n1131), .Y(product[40]) );
  AND2X2 U1093 ( .A(n144), .B(n1226), .Y(n1131) );
  XNOR2X1 U1094 ( .A(n163), .B(n1047), .Y(product[38]) );
  XNOR2X1 U1095 ( .A(n179), .B(n1048), .Y(product[36]) );
  XNOR2X1 U1096 ( .A(n112), .B(n1132), .Y(product[43]) );
  AND2X2 U1097 ( .A(n111), .B(n1229), .Y(n1132) );
  XNOR2X1 U1098 ( .A(n123), .B(n1133), .Y(product[42]) );
  AND2X2 U1099 ( .A(n122), .B(n1044), .Y(n1133) );
  XNOR2X1 U1100 ( .A(n95), .B(n1134), .Y(product[44]) );
  AND2X2 U1101 ( .A(n94), .B(n91), .Y(n1134) );
  XNOR2X1 U1102 ( .A(n170), .B(n1046), .Y(product[37]) );
  INVX1 U1103 ( .A(n100), .Y(n98) );
  AND2X2 U1104 ( .A(n1135), .B(n1044), .Y(n1137) );
  INVX1 U1105 ( .A(n130), .Y(n1135) );
  INVX1 U1106 ( .A(n1244), .Y(n1136) );
  NAND2X1 U1107 ( .A(n1135), .B(n1136), .Y(n1138) );
  BUFX2 U1108 ( .A(n51), .Y(n1139) );
  INVX2 U1109 ( .A(n51), .Y(n1289) );
  INVX8 U1110 ( .A(n1336), .Y(n1335) );
  XOR2X1 U1111 ( .A(n563), .B(n581), .Y(n1140) );
  XOR2X1 U1112 ( .A(n645), .B(n1140), .Y(n428) );
  NAND2X1 U1113 ( .A(n645), .B(n563), .Y(n1141) );
  NAND2X1 U1114 ( .A(n645), .B(n581), .Y(n1142) );
  NAND2X1 U1115 ( .A(n563), .B(n581), .Y(n1143) );
  NAND3X1 U1116 ( .A(n1142), .B(n1141), .C(n1143), .Y(n427) );
  XNOR2X1 U1117 ( .A(n1144), .B(n425), .Y(n408) );
  XNOR2X1 U1118 ( .A(n414), .B(n427), .Y(n1144) );
  XNOR2X1 U1119 ( .A(n1340), .B(a[27]), .Y(n1145) );
  XOR2X1 U1120 ( .A(n371), .B(n369), .Y(n1146) );
  XOR2X1 U1121 ( .A(n1146), .B(n358), .Y(n354) );
  NAND2X1 U1122 ( .A(n371), .B(n369), .Y(n1147) );
  NAND2X1 U1123 ( .A(n371), .B(n358), .Y(n1148) );
  NAND2X1 U1124 ( .A(n369), .B(n358), .Y(n1149) );
  NAND3X1 U1125 ( .A(n1147), .B(n1148), .C(n1149), .Y(n353) );
  XOR2X1 U1126 ( .A(n355), .B(n346), .Y(n1150) );
  XOR2X1 U1127 ( .A(n1150), .B(n353), .Y(n342) );
  NAND2X1 U1128 ( .A(n355), .B(n346), .Y(n1151) );
  NAND2X1 U1129 ( .A(n355), .B(n353), .Y(n1152) );
  NAND2X1 U1130 ( .A(n346), .B(n353), .Y(n1153) );
  NAND3X1 U1131 ( .A(n1151), .B(n1152), .C(n1153), .Y(n341) );
  NOR2X1 U1132 ( .A(n349), .B(n340), .Y(n1154) );
  INVX2 U1133 ( .A(n1169), .Y(n1281) );
  XNOR2X1 U1134 ( .A(n1184), .B(n1155), .Y(n426) );
  INVX4 U1135 ( .A(n13), .Y(n1334) );
  INVX2 U1136 ( .A(n1169), .Y(n1157) );
  INVX2 U1137 ( .A(n1332), .Y(n1250) );
  INVX4 U1138 ( .A(n1290), .Y(n1291) );
  INVX2 U1139 ( .A(n891), .Y(n1290) );
  INVX2 U1140 ( .A(n890), .Y(n1292) );
  XOR2X1 U1141 ( .A(n463), .B(n450), .Y(n1158) );
  XOR2X1 U1142 ( .A(n1158), .B(n461), .Y(n446) );
  XOR2X1 U1143 ( .A(n448), .B(n1030), .Y(n1159) );
  XOR2X1 U1144 ( .A(n1159), .B(n446), .Y(n444) );
  NAND2X1 U1145 ( .A(n463), .B(n450), .Y(n1160) );
  NAND2X1 U1146 ( .A(n463), .B(n461), .Y(n1161) );
  NAND2X1 U1147 ( .A(n450), .B(n461), .Y(n1162) );
  NAND3X1 U1148 ( .A(n1160), .B(n1161), .C(n1162), .Y(n445) );
  NAND2X1 U1149 ( .A(n448), .B(n1030), .Y(n1163) );
  NAND2X1 U1150 ( .A(n448), .B(n446), .Y(n1164) );
  NAND2X1 U1151 ( .A(n1030), .B(n446), .Y(n1165) );
  NAND3X1 U1152 ( .A(n1163), .B(n1164), .C(n1165), .Y(n443) );
  BUFX2 U1153 ( .A(n628), .Y(n1167) );
  AND2X2 U1154 ( .A(n895), .B(n34), .Y(n1168) );
  AND2X2 U1155 ( .A(n895), .B(n34), .Y(n1169) );
  INVX2 U1156 ( .A(n1328), .Y(n1327) );
  INVX2 U1157 ( .A(n1), .Y(n1328) );
  BUFX4 U1158 ( .A(n431), .Y(n1245) );
  XOR2X1 U1159 ( .A(n400), .B(n396), .Y(n1170) );
  XOR2X1 U1160 ( .A(n1170), .B(n398), .Y(n392) );
  NAND2X1 U1161 ( .A(n400), .B(n396), .Y(n1171) );
  NAND2X1 U1162 ( .A(n400), .B(n398), .Y(n1172) );
  NAND2X1 U1163 ( .A(n396), .B(n398), .Y(n1173) );
  NAND3X1 U1164 ( .A(n1171), .B(n1172), .C(n1173), .Y(n391) );
  NAND2X1 U1165 ( .A(n393), .B(n380), .Y(n1174) );
  NAND2X1 U1166 ( .A(n393), .B(n391), .Y(n1175) );
  NAND2X1 U1167 ( .A(n380), .B(n391), .Y(n1176) );
  NAND3X1 U1168 ( .A(n1174), .B(n1175), .C(n1176), .Y(n375) );
  NOR2X1 U1169 ( .A(n373), .B(n362), .Y(n1177) );
  INVX1 U1170 ( .A(n213), .Y(n212) );
  XNOR2X1 U1171 ( .A(n37), .B(a[29]), .Y(n46) );
  INVX8 U1172 ( .A(n1289), .Y(n1178) );
  XNOR2X1 U1173 ( .A(n1262), .B(n409), .Y(n1210) );
  NAND2X1 U1174 ( .A(n677), .B(n613), .Y(n1179) );
  NAND2X1 U1175 ( .A(n677), .B(n661), .Y(n1180) );
  NAND2X1 U1176 ( .A(n613), .B(n661), .Y(n1181) );
  NAND3X1 U1177 ( .A(n1180), .B(n1179), .C(n1181), .Y(n423) );
  NOR2X1 U1178 ( .A(n1268), .B(n828), .Y(n1182) );
  NOR2X1 U1179 ( .A(n829), .B(n1270), .Y(n1183) );
  OR2X2 U1180 ( .A(n1182), .B(n1183), .Y(n677) );
  XOR2X1 U1181 ( .A(n629), .B(n597), .Y(n1184) );
  NAND2X1 U1182 ( .A(n629), .B(n597), .Y(n1185) );
  NAND2X1 U1183 ( .A(n629), .B(n693), .Y(n1186) );
  NAND2X1 U1184 ( .A(n597), .B(n693), .Y(n1187) );
  NAND3X1 U1185 ( .A(n1185), .B(n1186), .C(n1187), .Y(n425) );
  NAND2X1 U1186 ( .A(n427), .B(n414), .Y(n1188) );
  NAND2X1 U1187 ( .A(n427), .B(n425), .Y(n1189) );
  NAND2X1 U1188 ( .A(n414), .B(n425), .Y(n1190) );
  NAND3X1 U1189 ( .A(n1188), .B(n1189), .C(n1190), .Y(n407) );
  INVX4 U1190 ( .A(n1343), .Y(n1342) );
  INVX1 U1191 ( .A(n201), .Y(n1191) );
  XOR2X1 U1192 ( .A(n599), .B(n1057), .Y(n1192) );
  XOR2X1 U1193 ( .A(n695), .B(n1192), .Y(n454) );
  NAND2X1 U1194 ( .A(n695), .B(n599), .Y(n1193) );
  NAND2X1 U1195 ( .A(n695), .B(n647), .Y(n1194) );
  NAND2X1 U1196 ( .A(n599), .B(n647), .Y(n1195) );
  NAND3X1 U1197 ( .A(n1194), .B(n1193), .C(n1195), .Y(n453) );
  XOR2X1 U1198 ( .A(n710), .B(n582), .Y(n1196) );
  XOR2X1 U1199 ( .A(n694), .B(n1196), .Y(n442) );
  NAND2X1 U1200 ( .A(n694), .B(n710), .Y(n1197) );
  NAND2X1 U1201 ( .A(n694), .B(n582), .Y(n1198) );
  NAND2X1 U1202 ( .A(n710), .B(n582), .Y(n1199) );
  NAND3X1 U1203 ( .A(n1199), .B(n1197), .C(n1198), .Y(n441) );
  OR2X1 U1204 ( .A(n1049), .B(n845), .Y(n1201) );
  NAND2X1 U1205 ( .A(n1200), .B(n1201), .Y(n694) );
  AND2X2 U1206 ( .A(n1324), .B(n1029), .Y(n582) );
  INVX8 U1207 ( .A(n1105), .Y(n1267) );
  INVX2 U1208 ( .A(n283), .Y(n1202) );
  XOR2X1 U1209 ( .A(n563), .B(n580), .Y(n1203) );
  XOR2X1 U1210 ( .A(n692), .B(n1203), .Y(n414) );
  NAND2X1 U1211 ( .A(n692), .B(n563), .Y(n1204) );
  NAND2X1 U1212 ( .A(n692), .B(n580), .Y(n1205) );
  NAND2X1 U1213 ( .A(n563), .B(n580), .Y(n1206) );
  NAND3X1 U1214 ( .A(n1205), .B(n1204), .C(n1206), .Y(n413) );
  INVX8 U1215 ( .A(n1325), .Y(n1323) );
  INVX2 U1216 ( .A(n1325), .Y(n1324) );
  NAND2X1 U1217 ( .A(n1167), .B(n676), .Y(n1207) );
  NAND2X1 U1218 ( .A(n1167), .B(n596), .Y(n1208) );
  NAND2X1 U1219 ( .A(n676), .B(n596), .Y(n1209) );
  NAND3X1 U1220 ( .A(n1207), .B(n1208), .C(n1209), .Y(n411) );
  XOR2X1 U1221 ( .A(n1210), .B(n411), .Y(n394) );
  NAND2X1 U1222 ( .A(n413), .B(n409), .Y(n1211) );
  NAND2X1 U1223 ( .A(n413), .B(n411), .Y(n1212) );
  NAND2X1 U1224 ( .A(n409), .B(n411), .Y(n1213) );
  NAND3X1 U1225 ( .A(n1211), .B(n1212), .C(n1213), .Y(n393) );
  NOR2X1 U1226 ( .A(n1279), .B(n782), .Y(n1214) );
  NOR2X1 U1227 ( .A(n1282), .B(n783), .Y(n1215) );
  OR2X2 U1228 ( .A(n1214), .B(n1215), .Y(n628) );
  INVX1 U1229 ( .A(n1301), .Y(n735) );
  NOR2X1 U1230 ( .A(n918), .B(n1296), .Y(n1216) );
  OR2X2 U1231 ( .A(n339), .B(n330), .Y(n1217) );
  INVX1 U1232 ( .A(n1217), .Y(n148) );
  OR2X2 U1233 ( .A(n918), .B(n735), .Y(n1218) );
  INVX1 U1234 ( .A(n1145), .Y(n1283) );
  INVX1 U1235 ( .A(n1283), .Y(n1222) );
  INVX2 U1236 ( .A(n1222), .Y(n1223) );
  INVX2 U1237 ( .A(n1320), .Y(n1221) );
  INVX1 U1238 ( .A(n795), .Y(n1258) );
  INVX2 U1239 ( .A(n1320), .Y(n1321) );
  OR2X2 U1240 ( .A(n1244), .B(n80), .Y(n1225) );
  XNOR2X1 U1241 ( .A(n1178), .B(n65), .Y(product[35]) );
  OR2X2 U1242 ( .A(n322), .B(n329), .Y(n1226) );
  OR2X2 U1243 ( .A(n481), .B(n470), .Y(n1227) );
  INVX1 U1244 ( .A(n84), .Y(n275) );
  INVX1 U1245 ( .A(n94), .Y(n92) );
  OR2X2 U1246 ( .A(n302), .B(n307), .Y(n1229) );
  INVX2 U1247 ( .A(n796), .Y(n1259) );
  INVX8 U1248 ( .A(n1241), .Y(n1285) );
  INVX8 U1249 ( .A(a[15]), .Y(n917) );
  INVX1 U1250 ( .A(n1037), .Y(n1224) );
  AND2X2 U1251 ( .A(n481), .B(n470), .Y(n1228) );
  OR2X1 U1252 ( .A(n523), .B(n518), .Y(n1230) );
  AND2X2 U1253 ( .A(n491), .B(n482), .Y(n1231) );
  OR2X1 U1254 ( .A(n491), .B(n482), .Y(n1232) );
  AND2X2 U1255 ( .A(n523), .B(n518), .Y(n1233) );
  INVX2 U1256 ( .A(n554), .Y(n655) );
  INVX2 U1257 ( .A(n560), .Y(n691) );
  INVX2 U1258 ( .A(n551), .Y(n637) );
  INVX2 U1259 ( .A(n545), .Y(n601) );
  INVX2 U1260 ( .A(n1257), .Y(n642) );
  OR2X1 U1261 ( .A(n533), .B(n530), .Y(n1234) );
  OR2X1 U1262 ( .A(n539), .B(n538), .Y(n1235) );
  AND2X2 U1263 ( .A(n533), .B(n530), .Y(n1236) );
  AND2X2 U1264 ( .A(n539), .B(n538), .Y(n1237) );
  XNOR2X1 U1265 ( .A(n542), .B(n573), .Y(n291) );
  INVX2 U1266 ( .A(n548), .Y(n619) );
  INVX4 U1267 ( .A(n1255), .Y(n1273) );
  AND2X2 U1268 ( .A(n572), .B(n725), .Y(n1238) );
  AND2X2 U1269 ( .A(n917), .B(n900), .Y(n1239) );
  AND2X2 U1270 ( .A(n894), .B(n1284), .Y(n1241) );
  INVX4 U1271 ( .A(n541), .Y(n1320) );
  BUFX4 U1272 ( .A(n1329), .Y(n1243) );
  INVX1 U1273 ( .A(n1331), .Y(n1329) );
  INVX1 U1274 ( .A(n200), .Y(n202) );
  BUFX2 U1275 ( .A(n53), .Y(n1246) );
  AOI21X1 U1276 ( .A(n172), .B(n159), .C(n160), .Y(n1248) );
  INVX1 U1277 ( .A(n216), .Y(n290) );
  INVX1 U1278 ( .A(n416), .Y(n1252) );
  INVX1 U1279 ( .A(n1252), .Y(n1253) );
  AOI22X1 U1280 ( .A(n558), .B(n1096), .C(n1097), .D(n1096), .Y(n1254) );
  INVX1 U1281 ( .A(n1268), .Y(n558) );
  AND2X2 U1282 ( .A(n897), .B(n1070), .Y(n1255) );
  AND2X2 U1283 ( .A(n897), .B(n1070), .Y(n1256) );
  AOI22X1 U1284 ( .A(n1166), .B(n1258), .C(n1276), .D(n1259), .Y(n1257) );
  BUFX2 U1285 ( .A(n30), .Y(n1260) );
  INVX2 U1286 ( .A(n1278), .Y(n1280) );
  INVX2 U1287 ( .A(n413), .Y(n1262) );
  INVX1 U1288 ( .A(n189), .Y(n286) );
  INVX1 U1289 ( .A(n199), .Y(n201) );
  INVX2 U1290 ( .A(n1239), .Y(n1264) );
  INVX2 U1291 ( .A(n1145), .Y(n1284) );
  INVX1 U1292 ( .A(n205), .Y(n288) );
  INVX1 U1293 ( .A(n171), .Y(n173) );
  INVX2 U1294 ( .A(n563), .Y(n709) );
  INVX1 U1295 ( .A(n172), .Y(n174) );
  INVX1 U1296 ( .A(n177), .Y(n284) );
  INVX1 U1297 ( .A(n166), .Y(n283) );
  INVX1 U1298 ( .A(n194), .Y(n287) );
  INVX1 U1299 ( .A(n161), .Y(n282) );
  INVX1 U1300 ( .A(n1247), .Y(n155) );
  INVX8 U1301 ( .A(n1298), .Y(n1299) );
  INVX8 U1302 ( .A(n1302), .Y(n1303) );
  INVX8 U1303 ( .A(n1304), .Y(n1305) );
  INVX8 U1304 ( .A(n1308), .Y(n1309) );
  INVX8 U1305 ( .A(n7), .Y(n1331) );
  INVX8 U1306 ( .A(n1106), .Y(n1339) );
  INVX2 U1307 ( .A(n101), .Y(n99) );
  INVX2 U1308 ( .A(n79), .Y(n77) );
  INVX2 U1309 ( .A(n1313), .Y(n729) );
  OAI22X1 U1310 ( .A(n1266), .B(n1331), .C(n1267), .D(n1331), .Y(n560) );
  OAI22X1 U1311 ( .A(n1271), .B(n1336), .C(n1272), .D(n1336), .Y(n554) );
  OAI22X1 U1312 ( .A(n1274), .B(n1338), .C(n1277), .D(n1338), .Y(n551) );
  OAI22X1 U1313 ( .A(n1279), .B(n1112), .C(n1157), .D(n1112), .Y(n548) );
  OAI22X1 U1314 ( .A(n1055), .B(n1251), .C(n1285), .D(n1251), .Y(n545) );
  OAI22X1 U1315 ( .A(n1287), .B(n1224), .C(n1288), .D(n1224), .Y(n542) );
  INVX2 U1316 ( .A(n337), .Y(n338) );
  INVX2 U1317 ( .A(n319), .Y(n320) );
  INVX2 U1318 ( .A(n305), .Y(n306) );
  INVX2 U1319 ( .A(n295), .Y(n296) );
  INVX2 U1320 ( .A(n93), .Y(n91) );
  INVX2 U1321 ( .A(n210), .Y(n289) );
  INVX2 U1322 ( .A(n149), .Y(n151) );
  INVX2 U1323 ( .A(n144), .Y(n142) );
  INVX2 U1324 ( .A(n129), .Y(n127) );
  INVX2 U1325 ( .A(n122), .Y(n120) );
  INVX2 U1326 ( .A(n111), .Y(n109) );
  INVX2 U1327 ( .A(n105), .Y(n103) );
  INVX2 U1328 ( .A(n104), .Y(n102) );
endmodule


module alu ( src1_data, src2_data, alu_op, result, overflow );
  input [16:0] src1_data;
  input [16:0] src2_data;
  input [1:0] alu_op;
  output [16:0] result;
  output overflow;
  wire   N26, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71;
  wire   [46:30] full_mult;
  wire   [17:0] large_sum;
  wire   [17:0] large_dif;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29;

  alu_DW01_sub_1 sub_44 ( .A({src1_data[16], src1_data[16], n9, src1_data[14], 
        n14, n15, src1_data[11:10], n13, n11, n29, n19, n16, n18, n26, n17, 
        src1_data[1], n25}), .B({src2_data[16], src2_data[16:14], n3, 
        src2_data[12:8], n7, src2_data[6:1], n1}), .CI(1'b0), .DIFF(large_dif)
         );
  alu_DW01_add_1 add_41 ( .A({src1_data[16], src1_data[16], n9, src1_data[14], 
        n14, n15, src1_data[11:10], n13, n11, n29, n19, n16, n18, n26, n17, 
        src1_data[1], n25}), .B({src2_data[16], src2_data[16], n4, 
        src2_data[14], n3, src2_data[12:8], n7, src2_data[6:5], n5, 
        src2_data[3:2], n20, n1}), .CI(1'b0), .SUM(large_sum) );
  alu_DW_mult_uns_2 mult_35 ( .a({src1_data[15:0], 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), 
        .b({src2_data[15:1], n1}), .product({N26, full_mult[45:30], 
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29}) );
  BUFX4 U3 ( .A(src2_data[0]), .Y(n1) );
  INVX1 U4 ( .A(src2_data[13]), .Y(n2) );
  INVX2 U6 ( .A(n2), .Y(n3) );
  BUFX2 U7 ( .A(src2_data[15]), .Y(n4) );
  BUFX2 U9 ( .A(src2_data[4]), .Y(n5) );
  BUFX2 U10 ( .A(large_dif[16]), .Y(n6) );
  BUFX2 U11 ( .A(src2_data[7]), .Y(n7) );
  INVX1 U12 ( .A(src1_data[15]), .Y(n8) );
  INVX2 U13 ( .A(n8), .Y(n9) );
  INVX1 U14 ( .A(src1_data[8]), .Y(n10) );
  INVX2 U15 ( .A(n10), .Y(n11) );
  INVX1 U16 ( .A(src1_data[9]), .Y(n12) );
  INVX2 U17 ( .A(n12), .Y(n13) );
  BUFX2 U18 ( .A(src1_data[13]), .Y(n14) );
  BUFX2 U19 ( .A(src1_data[12]), .Y(n15) );
  BUFX2 U20 ( .A(src1_data[5]), .Y(n16) );
  BUFX2 U21 ( .A(src1_data[2]), .Y(n17) );
  BUFX2 U22 ( .A(src1_data[4]), .Y(n18) );
  BUFX2 U23 ( .A(src1_data[6]), .Y(n19) );
  BUFX2 U24 ( .A(src2_data[1]), .Y(n20) );
  BUFX2 U25 ( .A(src1_data[0]), .Y(n25) );
  OR2X1 U26 ( .A(n33), .B(n71), .Y(n21) );
  NAND2X1 U27 ( .A(n21), .B(n32), .Y(overflow) );
  INVX2 U28 ( .A(n71), .Y(n66) );
  AND2X2 U29 ( .A(n35), .B(n34), .Y(n22) );
  AND2X2 U30 ( .A(alu_op[1]), .B(n34), .Y(n23) );
  AND2X2 U31 ( .A(alu_op[0]), .B(alu_op[1]), .Y(n24) );
  INVX1 U32 ( .A(src1_data[7]), .Y(n30) );
  INVX2 U33 ( .A(n30), .Y(n29) );
  BUFX2 U34 ( .A(src1_data[3]), .Y(n26) );
  INVX2 U35 ( .A(large_sum[16]), .Y(n70) );
  XOR2X1 U36 ( .A(n70), .B(large_sum[17]), .Y(n33) );
  INVX2 U37 ( .A(alu_op[1]), .Y(n35) );
  NAND2X1 U38 ( .A(alu_op[0]), .B(n35), .Y(n71) );
  INVX2 U39 ( .A(alu_op[0]), .Y(n34) );
  XOR2X1 U40 ( .A(large_dif[17]), .B(large_dif[16]), .Y(n31) );
  AOI22X1 U41 ( .A(N26), .B(n24), .C(n23), .D(n31), .Y(n32) );
  AOI22X1 U42 ( .A(n25), .B(n22), .C(full_mult[30]), .D(n24), .Y(n37) );
  AOI22X1 U43 ( .A(large_dif[0]), .B(n23), .C(large_sum[0]), .D(n66), .Y(n36)
         );
  NAND2X1 U44 ( .A(n37), .B(n36), .Y(result[0]) );
  AOI22X1 U45 ( .A(src1_data[1]), .B(n22), .C(full_mult[31]), .D(n24), .Y(n39)
         );
  AOI22X1 U46 ( .A(large_dif[1]), .B(n23), .C(large_sum[1]), .D(n66), .Y(n38)
         );
  NAND2X1 U47 ( .A(n39), .B(n38), .Y(result[1]) );
  AOI22X1 U48 ( .A(n17), .B(n22), .C(full_mult[32]), .D(n24), .Y(n41) );
  AOI22X1 U49 ( .A(large_dif[2]), .B(n23), .C(large_sum[2]), .D(n66), .Y(n40)
         );
  NAND2X1 U50 ( .A(n41), .B(n40), .Y(result[2]) );
  AOI22X1 U51 ( .A(n26), .B(n22), .C(full_mult[33]), .D(n24), .Y(n43) );
  AOI22X1 U52 ( .A(large_dif[3]), .B(n23), .C(large_sum[3]), .D(n66), .Y(n42)
         );
  NAND2X1 U53 ( .A(n43), .B(n42), .Y(result[3]) );
  AOI22X1 U54 ( .A(n18), .B(n22), .C(full_mult[34]), .D(n24), .Y(n45) );
  AOI22X1 U55 ( .A(large_dif[4]), .B(n23), .C(large_sum[4]), .D(n66), .Y(n44)
         );
  NAND2X1 U56 ( .A(n45), .B(n44), .Y(result[4]) );
  AOI22X1 U57 ( .A(n16), .B(n22), .C(full_mult[35]), .D(n24), .Y(n47) );
  AOI22X1 U58 ( .A(large_dif[5]), .B(n23), .C(large_sum[5]), .D(n66), .Y(n46)
         );
  NAND2X1 U59 ( .A(n47), .B(n46), .Y(result[5]) );
  AOI22X1 U60 ( .A(n19), .B(n22), .C(full_mult[36]), .D(n24), .Y(n49) );
  AOI22X1 U61 ( .A(large_dif[6]), .B(n23), .C(large_sum[6]), .D(n66), .Y(n48)
         );
  NAND2X1 U62 ( .A(n48), .B(n49), .Y(result[6]) );
  AOI22X1 U63 ( .A(n29), .B(n22), .C(full_mult[37]), .D(n24), .Y(n51) );
  AOI22X1 U64 ( .A(large_dif[7]), .B(n23), .C(large_sum[7]), .D(n66), .Y(n50)
         );
  NAND2X1 U65 ( .A(n50), .B(n51), .Y(result[7]) );
  AOI22X1 U66 ( .A(n11), .B(n22), .C(full_mult[38]), .D(n24), .Y(n53) );
  AOI22X1 U67 ( .A(large_dif[8]), .B(n23), .C(large_sum[8]), .D(n66), .Y(n52)
         );
  NAND2X1 U68 ( .A(n53), .B(n52), .Y(result[8]) );
  AOI22X1 U69 ( .A(n13), .B(n22), .C(full_mult[39]), .D(n24), .Y(n55) );
  AOI22X1 U70 ( .A(large_dif[9]), .B(n23), .C(large_sum[9]), .D(n66), .Y(n54)
         );
  NAND2X1 U71 ( .A(n55), .B(n54), .Y(result[9]) );
  AOI22X1 U72 ( .A(src1_data[10]), .B(n22), .C(full_mult[40]), .D(n24), .Y(n57) );
  AOI22X1 U73 ( .A(large_dif[10]), .B(n23), .C(large_sum[10]), .D(n66), .Y(n56) );
  NAND2X1 U74 ( .A(n57), .B(n56), .Y(result[10]) );
  AOI22X1 U75 ( .A(src1_data[11]), .B(n22), .C(full_mult[41]), .D(n24), .Y(n59) );
  AOI22X1 U76 ( .A(large_dif[11]), .B(n23), .C(large_sum[11]), .D(n66), .Y(n58) );
  NAND2X1 U77 ( .A(n59), .B(n58), .Y(result[11]) );
  AOI22X1 U78 ( .A(n15), .B(n22), .C(full_mult[42]), .D(n24), .Y(n61) );
  AOI22X1 U79 ( .A(large_dif[12]), .B(n23), .C(large_sum[12]), .D(n66), .Y(n60) );
  NAND2X1 U80 ( .A(n61), .B(n60), .Y(result[12]) );
  AOI22X1 U81 ( .A(n14), .B(n22), .C(full_mult[43]), .D(n24), .Y(n63) );
  AOI22X1 U82 ( .A(large_dif[13]), .B(n23), .C(large_sum[13]), .D(n66), .Y(n62) );
  NAND2X1 U83 ( .A(n63), .B(n62), .Y(result[13]) );
  AOI22X1 U84 ( .A(src1_data[14]), .B(n22), .C(full_mult[44]), .D(n24), .Y(n65) );
  AOI22X1 U85 ( .A(large_dif[14]), .B(n23), .C(large_sum[14]), .D(n66), .Y(n64) );
  NAND2X1 U86 ( .A(n65), .B(n64), .Y(result[14]) );
  AOI22X1 U87 ( .A(n9), .B(n22), .C(full_mult[45]), .D(n24), .Y(n68) );
  AOI22X1 U88 ( .A(large_dif[15]), .B(n23), .C(large_sum[15]), .D(n66), .Y(n67) );
  NAND2X1 U89 ( .A(n68), .B(n67), .Y(result[15]) );
  AOI22X1 U90 ( .A(src1_data[16]), .B(n22), .C(n6), .D(n23), .Y(n69) );
  OAI21X1 U91 ( .A(n71), .B(n70), .C(n69), .Y(result[16]) );
endmodule


module flex_sreg_NUM_BITS17_15 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n11), .Y(n46) );
  INVX1 U3 ( .A(n14), .Y(n40) );
  INVX1 U4 ( .A(n13), .Y(n42) );
  INVX1 U5 ( .A(n17), .Y(n34) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX1 U7 ( .A(n20), .Y(n30) );
  INVX1 U8 ( .A(n16), .Y(n36) );
  INVX1 U9 ( .A(n12), .Y(n44) );
  INVX1 U10 ( .A(n22), .Y(n28) );
  INVX1 U11 ( .A(n18), .Y(n32) );
  INVX2 U12 ( .A(n1), .Y(n2) );
  INVX2 U13 ( .A(write_enable), .Y(n1) );
  INVX2 U14 ( .A(n4), .Y(n3) );
  INVX2 U15 ( .A(n_reset), .Y(n4) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_14 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n17), .Y(n34) );
  INVX1 U5 ( .A(n15), .Y(n38) );
  INVX1 U6 ( .A(n13), .Y(n42) );
  INVX1 U7 ( .A(n11), .Y(n46) );
  INVX1 U8 ( .A(n16), .Y(n36) );
  INVX1 U9 ( .A(n14), .Y(n40) );
  INVX1 U10 ( .A(n12), .Y(n44) );
  INVX1 U11 ( .A(n22), .Y(n28) );
  INVX2 U12 ( .A(n1), .Y(n2) );
  INVX2 U13 ( .A(write_enable), .Y(n1) );
  INVX2 U14 ( .A(n4), .Y(n3) );
  INVX2 U15 ( .A(n_reset), .Y(n4) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_13 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n17), .Y(n34) );
  INVX1 U5 ( .A(n22), .Y(n28) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX1 U7 ( .A(n13), .Y(n42) );
  INVX1 U8 ( .A(n11), .Y(n46) );
  INVX1 U9 ( .A(n16), .Y(n36) );
  INVX1 U10 ( .A(n14), .Y(n40) );
  INVX1 U11 ( .A(n12), .Y(n44) );
  INVX2 U12 ( .A(n1), .Y(n2) );
  INVX2 U13 ( .A(write_enable), .Y(n1) );
  INVX2 U14 ( .A(n4), .Y(n3) );
  INVX2 U15 ( .A(n_reset), .Y(n4) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_12 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n17), .Y(n34) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n22), .Y(n28) );
  INVX1 U7 ( .A(n15), .Y(n38) );
  INVX1 U8 ( .A(n13), .Y(n42) );
  INVX1 U9 ( .A(n11), .Y(n46) );
  INVX1 U10 ( .A(n16), .Y(n36) );
  INVX1 U11 ( .A(n14), .Y(n40) );
  INVX2 U12 ( .A(n1), .Y(n2) );
  INVX2 U13 ( .A(write_enable), .Y(n1) );
  INVX2 U14 ( .A(n4), .Y(n3) );
  INVX2 U15 ( .A(n_reset), .Y(n4) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_11 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n17), .Y(n34) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n22), .Y(n28) );
  INVX1 U7 ( .A(n15), .Y(n38) );
  INVX1 U8 ( .A(n13), .Y(n42) );
  INVX1 U9 ( .A(n11), .Y(n46) );
  INVX1 U10 ( .A(n16), .Y(n36) );
  INVX1 U11 ( .A(n14), .Y(n40) );
  INVX2 U12 ( .A(n1), .Y(n2) );
  INVX2 U13 ( .A(write_enable), .Y(n1) );
  INVX2 U14 ( .A(n4), .Y(n3) );
  INVX2 U15 ( .A(n_reset), .Y(n4) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_10 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n17), .Y(n34) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n22), .Y(n28) );
  INVX1 U7 ( .A(n15), .Y(n38) );
  INVX1 U8 ( .A(n13), .Y(n42) );
  INVX1 U9 ( .A(n11), .Y(n46) );
  INVX1 U10 ( .A(n16), .Y(n36) );
  INVX1 U11 ( .A(n14), .Y(n40) );
  INVX2 U12 ( .A(n1), .Y(n2) );
  INVX2 U13 ( .A(write_enable), .Y(n1) );
  INVX2 U14 ( .A(n4), .Y(n3) );
  INVX2 U15 ( .A(n_reset), .Y(n4) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_9 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n17), .Y(n34) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n22), .Y(n28) );
  INVX1 U7 ( .A(n15), .Y(n38) );
  INVX1 U8 ( .A(n13), .Y(n42) );
  INVX1 U9 ( .A(n11), .Y(n46) );
  INVX1 U10 ( .A(n16), .Y(n36) );
  INVX1 U11 ( .A(n14), .Y(n40) );
  INVX2 U12 ( .A(n1), .Y(n2) );
  INVX2 U13 ( .A(write_enable), .Y(n1) );
  INVX2 U14 ( .A(n4), .Y(n3) );
  INVX2 U15 ( .A(n_reset), .Y(n4) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_8 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n17), .Y(n34) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n22), .Y(n28) );
  INVX1 U7 ( .A(n15), .Y(n38) );
  INVX1 U8 ( .A(n13), .Y(n42) );
  INVX1 U9 ( .A(n11), .Y(n46) );
  INVX1 U10 ( .A(n16), .Y(n36) );
  INVX1 U11 ( .A(n14), .Y(n40) );
  INVX2 U12 ( .A(n1), .Y(n2) );
  INVX2 U13 ( .A(write_enable), .Y(n1) );
  INVX2 U14 ( .A(n4), .Y(n3) );
  INVX2 U15 ( .A(n_reset), .Y(n4) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_7 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n17), .Y(n34) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n22), .Y(n28) );
  INVX1 U7 ( .A(n15), .Y(n38) );
  INVX1 U8 ( .A(n13), .Y(n42) );
  INVX1 U9 ( .A(n11), .Y(n46) );
  INVX1 U10 ( .A(n16), .Y(n36) );
  INVX1 U11 ( .A(n14), .Y(n40) );
  INVX2 U12 ( .A(n1), .Y(n2) );
  INVX2 U13 ( .A(write_enable), .Y(n1) );
  INVX2 U14 ( .A(n4), .Y(n3) );
  INVX2 U15 ( .A(n_reset), .Y(n4) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_6 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n17), .Y(n34) );
  INVX1 U5 ( .A(n22), .Y(n28) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX1 U7 ( .A(n13), .Y(n42) );
  INVX1 U8 ( .A(n11), .Y(n46) );
  INVX1 U9 ( .A(n16), .Y(n36) );
  INVX1 U10 ( .A(n14), .Y(n40) );
  INVX1 U11 ( .A(n12), .Y(n44) );
  INVX2 U12 ( .A(n1), .Y(n2) );
  INVX2 U13 ( .A(write_enable), .Y(n1) );
  INVX2 U14 ( .A(n4), .Y(n3) );
  INVX2 U15 ( .A(n_reset), .Y(n4) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_5 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n17), .Y(n34) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n22), .Y(n28) );
  INVX1 U7 ( .A(n15), .Y(n38) );
  INVX1 U8 ( .A(n13), .Y(n42) );
  INVX1 U9 ( .A(n11), .Y(n46) );
  INVX1 U10 ( .A(n16), .Y(n36) );
  INVX1 U11 ( .A(n14), .Y(n40) );
  INVX2 U12 ( .A(n1), .Y(n2) );
  INVX2 U13 ( .A(write_enable), .Y(n1) );
  INVX2 U14 ( .A(n4), .Y(n3) );
  INVX2 U15 ( .A(n_reset), .Y(n4) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_4 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n17), .Y(n34) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n22), .Y(n28) );
  INVX1 U7 ( .A(n15), .Y(n38) );
  INVX1 U8 ( .A(n13), .Y(n42) );
  INVX1 U9 ( .A(n11), .Y(n46) );
  INVX1 U10 ( .A(n16), .Y(n36) );
  INVX1 U11 ( .A(n14), .Y(n40) );
  INVX2 U12 ( .A(n1), .Y(n2) );
  INVX2 U13 ( .A(write_enable), .Y(n1) );
  INVX2 U14 ( .A(n4), .Y(n3) );
  INVX2 U15 ( .A(n_reset), .Y(n4) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_3 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n17), .Y(n34) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n22), .Y(n28) );
  INVX1 U7 ( .A(n15), .Y(n38) );
  INVX1 U8 ( .A(n13), .Y(n42) );
  INVX1 U9 ( .A(n11), .Y(n46) );
  INVX1 U10 ( .A(n16), .Y(n36) );
  INVX1 U11 ( .A(n14), .Y(n40) );
  INVX2 U12 ( .A(n1), .Y(n2) );
  INVX2 U13 ( .A(write_enable), .Y(n1) );
  INVX2 U14 ( .A(n4), .Y(n3) );
  INVX2 U15 ( .A(n_reset), .Y(n4) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_2 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n17), .Y(n34) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n15), .Y(n38) );
  INVX1 U7 ( .A(n13), .Y(n42) );
  INVX1 U8 ( .A(n11), .Y(n46) );
  INVX1 U9 ( .A(n16), .Y(n36) );
  INVX1 U10 ( .A(n14), .Y(n40) );
  INVX2 U11 ( .A(n1), .Y(n2) );
  INVX2 U12 ( .A(write_enable), .Y(n1) );
  INVX2 U13 ( .A(n4), .Y(n3) );
  INVX2 U14 ( .A(n_reset), .Y(n4) );
  INVX1 U15 ( .A(n22), .Y(n28) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_1 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n17), .Y(n34) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n22), .Y(n28) );
  INVX1 U7 ( .A(n15), .Y(n38) );
  INVX1 U8 ( .A(n13), .Y(n42) );
  INVX1 U9 ( .A(n11), .Y(n46) );
  INVX1 U10 ( .A(n16), .Y(n36) );
  INVX1 U11 ( .A(n14), .Y(n40) );
  INVX2 U12 ( .A(n1), .Y(n2) );
  INVX2 U13 ( .A(write_enable), .Y(n1) );
  INVX2 U14 ( .A(n4), .Y(n3) );
  INVX2 U15 ( .A(n_reset), .Y(n4) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module flex_sreg_NUM_BITS17_0 ( clk, n_reset, write_enable, new_value, 
        current_value );
  input [16:0] new_value;
  output [16:0] current_value;
  input clk, n_reset, write_enable;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n20, n22, n24, n26, n28, n30, n32, n34, n36, n38, n40, n42,
         n44, n46, n48, n50, n52, n53, n54, n55;

  DFFSR \value_reg[16]  ( .D(n26), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[16]) );
  DFFSR \value_reg[15]  ( .D(n28), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[15]) );
  DFFSR \value_reg[14]  ( .D(n30), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[14]) );
  DFFSR \value_reg[13]  ( .D(n32), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[13]) );
  DFFSR \value_reg[12]  ( .D(n34), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[12]) );
  DFFSR \value_reg[11]  ( .D(n36), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[11]) );
  DFFSR \value_reg[10]  ( .D(n38), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[10]) );
  DFFSR \value_reg[9]  ( .D(n40), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[9]) );
  DFFSR \value_reg[8]  ( .D(n42), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[8]) );
  DFFSR \value_reg[7]  ( .D(n44), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[7]) );
  DFFSR \value_reg[6]  ( .D(n46), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[6]) );
  DFFSR \value_reg[5]  ( .D(n48), .CLK(clk), .R(n3), .S(1'b1), .Q(
        current_value[5]) );
  DFFSR \value_reg[4]  ( .D(n50), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[4]) );
  DFFSR \value_reg[3]  ( .D(n52), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[3]) );
  DFFSR \value_reg[2]  ( .D(n53), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[2]) );
  DFFSR \value_reg[1]  ( .D(n54), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[1]) );
  DFFSR \value_reg[0]  ( .D(n55), .CLK(clk), .R(n_reset), .S(1'b1), .Q(
        current_value[0]) );
  INVX1 U2 ( .A(n20), .Y(n30) );
  INVX1 U3 ( .A(n18), .Y(n32) );
  INVX1 U4 ( .A(n17), .Y(n34) );
  INVX1 U5 ( .A(n12), .Y(n44) );
  INVX1 U6 ( .A(n22), .Y(n28) );
  INVX1 U7 ( .A(n15), .Y(n38) );
  INVX1 U8 ( .A(n13), .Y(n42) );
  INVX1 U9 ( .A(n11), .Y(n46) );
  INVX1 U10 ( .A(n16), .Y(n36) );
  INVX1 U11 ( .A(n14), .Y(n40) );
  INVX2 U12 ( .A(n1), .Y(n2) );
  INVX2 U13 ( .A(write_enable), .Y(n1) );
  INVX2 U14 ( .A(n4), .Y(n3) );
  INVX2 U15 ( .A(n_reset), .Y(n4) );
  MUX2X1 U16 ( .B(current_value[0]), .A(new_value[0]), .S(n2), .Y(n5) );
  INVX2 U17 ( .A(n5), .Y(n55) );
  MUX2X1 U18 ( .B(current_value[1]), .A(new_value[1]), .S(n2), .Y(n6) );
  INVX2 U19 ( .A(n6), .Y(n54) );
  MUX2X1 U20 ( .B(current_value[2]), .A(new_value[2]), .S(n2), .Y(n7) );
  INVX2 U21 ( .A(n7), .Y(n53) );
  MUX2X1 U22 ( .B(current_value[3]), .A(new_value[3]), .S(n2), .Y(n8) );
  INVX2 U23 ( .A(n8), .Y(n52) );
  MUX2X1 U24 ( .B(current_value[4]), .A(new_value[4]), .S(n2), .Y(n9) );
  INVX2 U25 ( .A(n9), .Y(n50) );
  MUX2X1 U26 ( .B(current_value[5]), .A(new_value[5]), .S(write_enable), .Y(
        n10) );
  INVX2 U27 ( .A(n10), .Y(n48) );
  MUX2X1 U28 ( .B(current_value[6]), .A(new_value[6]), .S(n2), .Y(n11) );
  MUX2X1 U29 ( .B(current_value[7]), .A(new_value[7]), .S(write_enable), .Y(
        n12) );
  MUX2X1 U30 ( .B(current_value[8]), .A(new_value[8]), .S(n2), .Y(n13) );
  MUX2X1 U31 ( .B(current_value[9]), .A(new_value[9]), .S(write_enable), .Y(
        n14) );
  MUX2X1 U32 ( .B(current_value[10]), .A(new_value[10]), .S(n2), .Y(n15) );
  MUX2X1 U33 ( .B(current_value[11]), .A(new_value[11]), .S(write_enable), .Y(
        n16) );
  MUX2X1 U34 ( .B(current_value[12]), .A(new_value[12]), .S(n2), .Y(n17) );
  MUX2X1 U35 ( .B(current_value[13]), .A(new_value[13]), .S(write_enable), .Y(
        n18) );
  MUX2X1 U36 ( .B(current_value[14]), .A(new_value[14]), .S(n2), .Y(n20) );
  MUX2X1 U54 ( .B(current_value[15]), .A(new_value[15]), .S(write_enable), .Y(
        n22) );
  MUX2X1 U55 ( .B(current_value[16]), .A(new_value[16]), .S(n2), .Y(n24) );
  INVX2 U56 ( .A(n24), .Y(n26) );
endmodule


module register_file ( clk, n_reset, w_en, r1_sel, r2_sel, w_sel, w_data, 
        r1_data, r2_data, outreg_data );
  input [3:0] r1_sel;
  input [3:0] r2_sel;
  input [3:0] w_sel;
  input [16:0] w_data;
  output [16:0] r1_data;
  output [16:0] r2_data;
  output [16:0] outreg_data;
  input clk, n_reset, w_en;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, n737, \regs_matrix[15][16] ,
         \regs_matrix[15][15] , \regs_matrix[15][14] , \regs_matrix[15][13] ,
         \regs_matrix[15][12] , \regs_matrix[15][11] , \regs_matrix[15][10] ,
         \regs_matrix[15][9] , \regs_matrix[15][8] , \regs_matrix[15][7] ,
         \regs_matrix[15][6] , \regs_matrix[15][5] , \regs_matrix[15][4] ,
         \regs_matrix[15][3] , \regs_matrix[15][2] , \regs_matrix[15][1] ,
         \regs_matrix[15][0] , \regs_matrix[14][16] , \regs_matrix[14][15] ,
         \regs_matrix[14][14] , \regs_matrix[14][13] , \regs_matrix[14][12] ,
         \regs_matrix[14][11] , \regs_matrix[14][10] , \regs_matrix[14][9] ,
         \regs_matrix[14][8] , \regs_matrix[14][7] , \regs_matrix[14][6] ,
         \regs_matrix[14][5] , \regs_matrix[14][4] , \regs_matrix[14][3] ,
         \regs_matrix[14][2] , \regs_matrix[14][1] , \regs_matrix[14][0] ,
         \regs_matrix[13][16] , \regs_matrix[13][15] , \regs_matrix[13][14] ,
         \regs_matrix[13][13] , \regs_matrix[13][12] , \regs_matrix[13][11] ,
         \regs_matrix[13][10] , \regs_matrix[13][9] , \regs_matrix[13][8] ,
         \regs_matrix[13][7] , \regs_matrix[13][6] , \regs_matrix[13][5] ,
         \regs_matrix[13][4] , \regs_matrix[13][3] , \regs_matrix[13][2] ,
         \regs_matrix[13][1] , \regs_matrix[13][0] , \regs_matrix[12][16] ,
         \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] ,
         \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] ,
         \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] ,
         \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] ,
         \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] ,
         \regs_matrix[12][0] , \regs_matrix[11][16] , \regs_matrix[11][15] ,
         \regs_matrix[11][14] , \regs_matrix[11][13] , \regs_matrix[11][12] ,
         \regs_matrix[11][11] , \regs_matrix[11][10] , \regs_matrix[11][9] ,
         \regs_matrix[11][8] , \regs_matrix[11][7] , \regs_matrix[11][6] ,
         \regs_matrix[11][5] , \regs_matrix[11][4] , \regs_matrix[11][3] ,
         \regs_matrix[11][2] , \regs_matrix[11][1] , \regs_matrix[11][0] ,
         \regs_matrix[10][16] , \regs_matrix[10][15] , \regs_matrix[10][14] ,
         \regs_matrix[10][13] , \regs_matrix[10][12] , \regs_matrix[10][11] ,
         \regs_matrix[10][10] , \regs_matrix[10][9] , \regs_matrix[10][8] ,
         \regs_matrix[10][7] , \regs_matrix[10][6] , \regs_matrix[10][5] ,
         \regs_matrix[10][4] , \regs_matrix[10][3] , \regs_matrix[10][2] ,
         \regs_matrix[10][1] , \regs_matrix[10][0] , \regs_matrix[9][16] ,
         \regs_matrix[9][15] , \regs_matrix[9][14] , \regs_matrix[9][13] ,
         \regs_matrix[9][12] , \regs_matrix[9][11] , \regs_matrix[9][10] ,
         \regs_matrix[9][9] , \regs_matrix[9][8] , \regs_matrix[9][7] ,
         \regs_matrix[9][6] , \regs_matrix[9][5] , \regs_matrix[9][4] ,
         \regs_matrix[9][3] , \regs_matrix[9][2] , \regs_matrix[9][1] ,
         \regs_matrix[9][0] , \regs_matrix[8][16] , \regs_matrix[8][15] ,
         \regs_matrix[8][14] , \regs_matrix[8][13] , \regs_matrix[8][12] ,
         \regs_matrix[8][11] , \regs_matrix[8][10] , \regs_matrix[8][9] ,
         \regs_matrix[8][8] , \regs_matrix[8][7] , \regs_matrix[8][6] ,
         \regs_matrix[8][5] , \regs_matrix[8][4] , \regs_matrix[8][3] ,
         \regs_matrix[8][2] , \regs_matrix[8][1] , \regs_matrix[8][0] ,
         \regs_matrix[7][16] , \regs_matrix[7][15] , \regs_matrix[7][14] ,
         \regs_matrix[7][13] , \regs_matrix[7][12] , \regs_matrix[7][11] ,
         \regs_matrix[7][10] , \regs_matrix[7][9] , \regs_matrix[7][8] ,
         \regs_matrix[7][7] , \regs_matrix[7][6] , \regs_matrix[7][5] ,
         \regs_matrix[7][4] , \regs_matrix[7][3] , \regs_matrix[7][2] ,
         \regs_matrix[7][1] , \regs_matrix[7][0] , \regs_matrix[6][16] ,
         \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] ,
         \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] ,
         \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] ,
         \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] ,
         \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] ,
         \regs_matrix[6][0] , \regs_matrix[5][16] , \regs_matrix[5][15] ,
         \regs_matrix[5][14] , \regs_matrix[5][13] , \regs_matrix[5][12] ,
         \regs_matrix[5][11] , \regs_matrix[5][10] , \regs_matrix[5][9] ,
         \regs_matrix[5][8] , \regs_matrix[5][7] , \regs_matrix[5][6] ,
         \regs_matrix[5][5] , \regs_matrix[5][4] , \regs_matrix[5][3] ,
         \regs_matrix[5][2] , \regs_matrix[5][1] , \regs_matrix[5][0] ,
         \regs_matrix[4][16] , \regs_matrix[4][15] , \regs_matrix[4][14] ,
         \regs_matrix[4][13] , \regs_matrix[4][12] , \regs_matrix[4][11] ,
         \regs_matrix[4][10] , \regs_matrix[4][9] , \regs_matrix[4][8] ,
         \regs_matrix[4][7] , \regs_matrix[4][6] , \regs_matrix[4][5] ,
         \regs_matrix[4][4] , \regs_matrix[4][3] , \regs_matrix[4][2] ,
         \regs_matrix[4][1] , \regs_matrix[4][0] , \regs_matrix[3][16] ,
         \regs_matrix[3][15] , \regs_matrix[3][14] , \regs_matrix[3][13] ,
         \regs_matrix[3][12] , \regs_matrix[3][11] , \regs_matrix[3][10] ,
         \regs_matrix[3][9] , \regs_matrix[3][8] , \regs_matrix[3][7] ,
         \regs_matrix[3][6] , \regs_matrix[3][5] , \regs_matrix[3][4] ,
         \regs_matrix[3][3] , \regs_matrix[3][2] , \regs_matrix[3][1] ,
         \regs_matrix[3][0] , \regs_matrix[2][16] , \regs_matrix[2][15] ,
         \regs_matrix[2][14] , \regs_matrix[2][13] , \regs_matrix[2][12] ,
         \regs_matrix[2][11] , \regs_matrix[2][10] , \regs_matrix[2][9] ,
         \regs_matrix[2][8] , \regs_matrix[2][7] , \regs_matrix[2][6] ,
         \regs_matrix[2][5] , \regs_matrix[2][4] , \regs_matrix[2][3] ,
         \regs_matrix[2][2] , \regs_matrix[2][1] , \regs_matrix[2][0] ,
         \regs_matrix[1][16] , \regs_matrix[1][15] , \regs_matrix[1][14] ,
         \regs_matrix[1][13] , \regs_matrix[1][12] , \regs_matrix[1][11] ,
         \regs_matrix[1][10] , \regs_matrix[1][9] , \regs_matrix[1][8] ,
         \regs_matrix[1][7] , \regs_matrix[1][6] , \regs_matrix[1][5] ,
         \regs_matrix[1][4] , \regs_matrix[1][3] , \regs_matrix[1][2] ,
         \regs_matrix[1][1] , \regs_matrix[1][0] , n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n1, n2, n3, n4, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425, n426, n427, n428, n429, n430, n431, n432, n433, n434, n435,
         n436, n437, n438, n439, n440, n441, n442, n443, n444, n445, n446,
         n447, n448, n449, n450, n451, n452, n453, n454, n455, n456, n457,
         n458, n459, n460, n461, n462, n463, n464, n465, n466, n467, n468,
         n469, n470, n471, n472, n473, n474, n475, n476, n477, n478, n479,
         n480, n481, n482, n483, n484, n485, n486, n487, n488, n489, n490,
         n491, n492, n493, n494, n495, n496, n497, n498, n499, n500, n501,
         n502, n503, n504, n505, n506, n507, n508, n509, n510, n511, n512,
         n513, n514, n515, n516, n517, n518, n519, n520, n521, n522, n523,
         n524, n525, n526, n527, n528, n529, n530, n531, n532, n533, n534,
         n535, n536, n537, n538, n539, n540, n541, n542, n543, n544, n545,
         n546, n547, n548, n549, n550, n551, n552, n553, n554, n555, n556,
         n557, n558, n559, n560, n561, n562, n563, n564, n565, n566, n567,
         n568, n569, n570, n571, n572, n573, n574, n575, n576, n577, n578,
         n579, n580, n581, n582, n583, n584, n585, n586, n587, n588, n589,
         n590, n591, n592, n593, n594, n595, n596, n597, n598, n599, n600,
         n601, n602, n603, n604, n605, n606, n607, n608, n609, n610, n611,
         n612, n613, n614, n615, n616, n617, n618, n619, n620, n621, n622,
         n623, n624, n625, n626, n627, n628, n629, n630, n631, n632, n633,
         n634, n635, n636, n637, n638, n639, n640, n641, n642, n643, n644,
         n645, n646, n647, n648, n649, n650, n651, n652, n653, n654, n655,
         n656, n657, n658, n659, n660, n661, n662, n663, n664, n665, n666,
         n667, n668, n669, n670, n671, n672, n673, n674, n675, n676, n677,
         n678, n679, n680, n681, n682, n683, n684, n685, n686, n687, n688,
         n689, n690, n691, n692, n693, n694, n695, n696, n697, n698, n699,
         n700, n701, n702, n703, n704, n705, n706, n707, n708, n709, n710,
         n711, n712, n713, n714, n715, n716, n717, n718, n719, n720, n721,
         n722, n724, n725, n726, n727, n728, n729, n730, n731, n732, n733,
         n734, n735, n736;
  wire   [15:0] write_enables;
  assign N10 = r1_sel[0];
  assign N11 = r1_sel[1];
  assign N12 = r1_sel[2];
  assign N13 = r1_sel[3];
  assign N14 = r2_sel[0];
  assign N15 = r2_sel[1];
  assign N16 = r2_sel[2];
  assign N17 = r2_sel[3];

  NOR2X1 U6 ( .A(n5), .B(n6), .Y(write_enables[9]) );
  NOR2X1 U7 ( .A(n6), .B(n7), .Y(write_enables[8]) );
  NOR2X1 U8 ( .A(n8), .B(n9), .Y(write_enables[7]) );
  NOR2X1 U9 ( .A(n8), .B(n10), .Y(write_enables[6]) );
  NOR2X1 U10 ( .A(n9), .B(n11), .Y(write_enables[5]) );
  NOR2X1 U11 ( .A(n10), .B(n11), .Y(write_enables[4]) );
  NOR2X1 U12 ( .A(n9), .B(n12), .Y(write_enables[3]) );
  NOR2X1 U13 ( .A(n10), .B(n12), .Y(write_enables[2]) );
  NOR2X1 U14 ( .A(n6), .B(n9), .Y(write_enables[1]) );
  NAND3X1 U15 ( .A(w_en), .B(n733), .C(w_sel[0]), .Y(n9) );
  NOR2X1 U16 ( .A(n5), .B(n8), .Y(write_enables[15]) );
  NOR2X1 U17 ( .A(n7), .B(n8), .Y(write_enables[14]) );
  NAND2X1 U18 ( .A(w_sel[2]), .B(w_sel[1]), .Y(n8) );
  NOR2X1 U19 ( .A(n5), .B(n11), .Y(write_enables[13]) );
  NOR2X1 U20 ( .A(n7), .B(n11), .Y(write_enables[12]) );
  NAND2X1 U21 ( .A(w_sel[2]), .B(n736), .Y(n11) );
  NOR2X1 U22 ( .A(n5), .B(n12), .Y(write_enables[11]) );
  NAND3X1 U23 ( .A(w_sel[0]), .B(w_en), .C(w_sel[3]), .Y(n5) );
  NOR2X1 U24 ( .A(n7), .B(n12), .Y(write_enables[10]) );
  NAND2X1 U25 ( .A(w_sel[1]), .B(n735), .Y(n12) );
  NAND2X1 U26 ( .A(n13), .B(w_sel[3]), .Y(n7) );
  NOR2X1 U27 ( .A(n6), .B(n10), .Y(write_enables[0]) );
  NAND2X1 U28 ( .A(n13), .B(n733), .Y(n10) );
  NOR2X1 U29 ( .A(n734), .B(w_sel[0]), .Y(n13) );
  NAND2X1 U30 ( .A(n736), .B(n735), .Y(n6) );
  flex_sreg_NUM_BITS17_15 \genblk1[0].REGX  ( .clk(clk), .n_reset(n732), 
        .write_enable(write_enables[0]), .new_value({n722, n25, n717, n42, 
        n713, n26, n708, n27, n703, n701, n698, n695, n692, n689, n686, n683, 
        n680}), .current_value({n737, outreg_data[15:0]}) );
  flex_sreg_NUM_BITS17_14 \genblk1[1].REGX  ( .clk(clk), .n_reset(n725), 
        .write_enable(write_enables[1]), .new_value({n721, n719, n34, n42, n30, 
        n710, n32, n705, n703, n700, n37, n694, n691, n688, n685, n682, n680}), 
        .current_value({\regs_matrix[1][16] , \regs_matrix[1][15] , 
        \regs_matrix[1][14] , \regs_matrix[1][13] , \regs_matrix[1][12] , 
        \regs_matrix[1][11] , \regs_matrix[1][10] , \regs_matrix[1][9] , 
        \regs_matrix[1][8] , \regs_matrix[1][7] , \regs_matrix[1][6] , 
        \regs_matrix[1][5] , \regs_matrix[1][4] , \regs_matrix[1][3] , 
        \regs_matrix[1][2] , \regs_matrix[1][1] , \regs_matrix[1][0] }) );
  flex_sreg_NUM_BITS17_13 \genblk1[2].REGX  ( .clk(clk), .n_reset(n725), 
        .write_enable(write_enables[2]), .new_value({n722, n719, n717, n42, 
        n713, n710, n708, n705, n703, n701, n698, n695, n692, n689, n686, n683, 
        w_data[0]}), .current_value({\regs_matrix[2][16] , 
        \regs_matrix[2][15] , \regs_matrix[2][14] , \regs_matrix[2][13] , 
        \regs_matrix[2][12] , \regs_matrix[2][11] , \regs_matrix[2][10] , 
        \regs_matrix[2][9] , \regs_matrix[2][8] , \regs_matrix[2][7] , 
        \regs_matrix[2][6] , \regs_matrix[2][5] , \regs_matrix[2][4] , 
        \regs_matrix[2][3] , \regs_matrix[2][2] , \regs_matrix[2][1] , 
        \regs_matrix[2][0] }) );
  flex_sreg_NUM_BITS17_12 \genblk1[3].REGX  ( .clk(clk), .n_reset(n726), 
        .write_enable(write_enables[3]), .new_value({n721, n719, n716, n42, 
        n712, n710, n707, n705, n703, n40, n697, n694, n691, n688, n685, n682, 
        n680}), .current_value({\regs_matrix[3][16] , \regs_matrix[3][15] , 
        \regs_matrix[3][14] , \regs_matrix[3][13] , \regs_matrix[3][12] , 
        \regs_matrix[3][11] , \regs_matrix[3][10] , \regs_matrix[3][9] , 
        \regs_matrix[3][8] , \regs_matrix[3][7] , \regs_matrix[3][6] , 
        \regs_matrix[3][5] , \regs_matrix[3][4] , \regs_matrix[3][3] , 
        \regs_matrix[3][2] , \regs_matrix[3][1] , \regs_matrix[3][0] }) );
  flex_sreg_NUM_BITS17_11 \genblk1[4].REGX  ( .clk(clk), .n_reset(n726), 
        .write_enable(write_enables[4]), .new_value({n722, n719, n717, n42, 
        n713, n710, n708, n705, n703, n701, n698, n695, n692, n689, n686, n683, 
        w_data[0]}), .current_value({\regs_matrix[4][16] , 
        \regs_matrix[4][15] , \regs_matrix[4][14] , \regs_matrix[4][13] , 
        \regs_matrix[4][12] , \regs_matrix[4][11] , \regs_matrix[4][10] , 
        \regs_matrix[4][9] , \regs_matrix[4][8] , \regs_matrix[4][7] , 
        \regs_matrix[4][6] , \regs_matrix[4][5] , \regs_matrix[4][4] , 
        \regs_matrix[4][3] , \regs_matrix[4][2] , \regs_matrix[4][1] , 
        \regs_matrix[4][0] }) );
  flex_sreg_NUM_BITS17_10 \genblk1[5].REGX  ( .clk(clk), .n_reset(n727), 
        .write_enable(write_enables[5]), .new_value({n721, n719, n35, n42, n31, 
        n710, n33, n705, n703, n39, n38, n694, n691, n688, n685, n682, n680}), 
        .current_value({\regs_matrix[5][16] , \regs_matrix[5][15] , 
        \regs_matrix[5][14] , \regs_matrix[5][13] , \regs_matrix[5][12] , 
        \regs_matrix[5][11] , \regs_matrix[5][10] , \regs_matrix[5][9] , 
        \regs_matrix[5][8] , \regs_matrix[5][7] , \regs_matrix[5][6] , 
        \regs_matrix[5][5] , \regs_matrix[5][4] , \regs_matrix[5][3] , 
        \regs_matrix[5][2] , \regs_matrix[5][1] , \regs_matrix[5][0] }) );
  flex_sreg_NUM_BITS17_9 \genblk1[6].REGX  ( .clk(clk), .n_reset(n727), 
        .write_enable(write_enables[6]), .new_value({n722, n719, n717, n42, 
        n713, n710, n708, n705, n703, n701, n698, n695, n692, n689, n686, n683, 
        w_data[0]}), .current_value({\regs_matrix[6][16] , 
        \regs_matrix[6][15] , \regs_matrix[6][14] , \regs_matrix[6][13] , 
        \regs_matrix[6][12] , \regs_matrix[6][11] , \regs_matrix[6][10] , 
        \regs_matrix[6][9] , \regs_matrix[6][8] , \regs_matrix[6][7] , 
        \regs_matrix[6][6] , \regs_matrix[6][5] , \regs_matrix[6][4] , 
        \regs_matrix[6][3] , \regs_matrix[6][2] , \regs_matrix[6][1] , 
        \regs_matrix[6][0] }) );
  flex_sreg_NUM_BITS17_8 \genblk1[7].REGX  ( .clk(clk), .n_reset(n728), 
        .write_enable(write_enables[7]), .new_value({n721, n719, n34, n42, n30, 
        n710, n32, n705, n703, n40, n37, n694, n691, n688, n685, n682, n680}), 
        .current_value({\regs_matrix[7][16] , \regs_matrix[7][15] , 
        \regs_matrix[7][14] , \regs_matrix[7][13] , \regs_matrix[7][12] , 
        \regs_matrix[7][11] , \regs_matrix[7][10] , \regs_matrix[7][9] , 
        \regs_matrix[7][8] , \regs_matrix[7][7] , \regs_matrix[7][6] , 
        \regs_matrix[7][5] , \regs_matrix[7][4] , \regs_matrix[7][3] , 
        \regs_matrix[7][2] , \regs_matrix[7][1] , \regs_matrix[7][0] }) );
  flex_sreg_NUM_BITS17_7 \genblk1[8].REGX  ( .clk(clk), .n_reset(n728), 
        .write_enable(write_enables[8]), .new_value({n722, n719, n35, n42, n31, 
        n710, n33, n705, n703, n700, n38, n695, n692, n689, n686, n683, 
        w_data[0]}), .current_value({\regs_matrix[8][16] , 
        \regs_matrix[8][15] , \regs_matrix[8][14] , \regs_matrix[8][13] , 
        \regs_matrix[8][12] , \regs_matrix[8][11] , \regs_matrix[8][10] , 
        \regs_matrix[8][9] , \regs_matrix[8][8] , \regs_matrix[8][7] , 
        \regs_matrix[8][6] , \regs_matrix[8][5] , \regs_matrix[8][4] , 
        \regs_matrix[8][3] , \regs_matrix[8][2] , \regs_matrix[8][1] , 
        \regs_matrix[8][0] }) );
  flex_sreg_NUM_BITS17_6 \genblk1[9].REGX  ( .clk(clk), .n_reset(n729), 
        .write_enable(write_enables[9]), .new_value({n721, n719, n716, n42, 
        n712, n710, n707, n705, n703, n40, n697, n694, n691, n688, n685, n682, 
        n680}), .current_value({\regs_matrix[9][16] , \regs_matrix[9][15] , 
        \regs_matrix[9][14] , \regs_matrix[9][13] , \regs_matrix[9][12] , 
        \regs_matrix[9][11] , \regs_matrix[9][10] , \regs_matrix[9][9] , 
        \regs_matrix[9][8] , \regs_matrix[9][7] , \regs_matrix[9][6] , 
        \regs_matrix[9][5] , \regs_matrix[9][4] , \regs_matrix[9][3] , 
        \regs_matrix[9][2] , \regs_matrix[9][1] , \regs_matrix[9][0] }) );
  flex_sreg_NUM_BITS17_5 \genblk1[10].REGX  ( .clk(clk), .n_reset(n729), 
        .write_enable(write_enables[10]), .new_value({n722, n719, n34, n42, 
        n30, n710, n32, n705, n703, n700, n37, n695, n692, n689, n686, n683, 
        w_data[0]}), .current_value({\regs_matrix[10][16] , 
        \regs_matrix[10][15] , \regs_matrix[10][14] , \regs_matrix[10][13] , 
        \regs_matrix[10][12] , \regs_matrix[10][11] , \regs_matrix[10][10] , 
        \regs_matrix[10][9] , \regs_matrix[10][8] , \regs_matrix[10][7] , 
        \regs_matrix[10][6] , \regs_matrix[10][5] , \regs_matrix[10][4] , 
        \regs_matrix[10][3] , \regs_matrix[10][2] , \regs_matrix[10][1] , 
        \regs_matrix[10][0] }) );
  flex_sreg_NUM_BITS17_4 \genblk1[11].REGX  ( .clk(clk), .n_reset(n730), 
        .write_enable(write_enables[11]), .new_value({n721, n719, n35, n42, 
        n31, n710, n33, n705, n703, n700, n38, n694, n691, n688, n685, n682, 
        n680}), .current_value({\regs_matrix[11][16] , \regs_matrix[11][15] , 
        \regs_matrix[11][14] , \regs_matrix[11][13] , \regs_matrix[11][12] , 
        \regs_matrix[11][11] , \regs_matrix[11][10] , \regs_matrix[11][9] , 
        \regs_matrix[11][8] , \regs_matrix[11][7] , \regs_matrix[11][6] , 
        \regs_matrix[11][5] , \regs_matrix[11][4] , \regs_matrix[11][3] , 
        \regs_matrix[11][2] , \regs_matrix[11][1] , \regs_matrix[11][0] }) );
  flex_sreg_NUM_BITS17_3 \genblk1[12].REGX  ( .clk(clk), .n_reset(n730), 
        .write_enable(write_enables[12]), .new_value({n722, n719, n716, n42, 
        n712, n710, n707, n705, n703, n39, n697, n695, n692, n689, n686, n683, 
        w_data[0]}), .current_value({\regs_matrix[12][16] , 
        \regs_matrix[12][15] , \regs_matrix[12][14] , \regs_matrix[12][13] , 
        \regs_matrix[12][12] , \regs_matrix[12][11] , \regs_matrix[12][10] , 
        \regs_matrix[12][9] , \regs_matrix[12][8] , \regs_matrix[12][7] , 
        \regs_matrix[12][6] , \regs_matrix[12][5] , \regs_matrix[12][4] , 
        \regs_matrix[12][3] , \regs_matrix[12][2] , \regs_matrix[12][1] , 
        \regs_matrix[12][0] }) );
  flex_sreg_NUM_BITS17_2 \genblk1[13].REGX  ( .clk(clk), .n_reset(n731), 
        .write_enable(write_enables[13]), .new_value({n721, n719, n34, n42, 
        n30, n710, n32, n705, n703, n40, n37, n694, n691, n688, n685, n682, 
        n680}), .current_value({\regs_matrix[13][16] , \regs_matrix[13][15] , 
        \regs_matrix[13][14] , \regs_matrix[13][13] , \regs_matrix[13][12] , 
        \regs_matrix[13][11] , \regs_matrix[13][10] , \regs_matrix[13][9] , 
        \regs_matrix[13][8] , \regs_matrix[13][7] , \regs_matrix[13][6] , 
        \regs_matrix[13][5] , \regs_matrix[13][4] , \regs_matrix[13][3] , 
        \regs_matrix[13][2] , \regs_matrix[13][1] , \regs_matrix[13][0] }) );
  flex_sreg_NUM_BITS17_1 \genblk1[14].REGX  ( .clk(clk), .n_reset(n731), 
        .write_enable(write_enables[14]), .new_value({n722, n719, n35, n42, 
        n31, n710, n33, n705, n703, n39, n38, n695, n692, n689, n686, n683, 
        w_data[0]}), .current_value({\regs_matrix[14][16] , 
        \regs_matrix[14][15] , \regs_matrix[14][14] , \regs_matrix[14][13] , 
        \regs_matrix[14][12] , \regs_matrix[14][11] , \regs_matrix[14][10] , 
        \regs_matrix[14][9] , \regs_matrix[14][8] , \regs_matrix[14][7] , 
        \regs_matrix[14][6] , \regs_matrix[14][5] , \regs_matrix[14][4] , 
        \regs_matrix[14][3] , \regs_matrix[14][2] , \regs_matrix[14][1] , 
        \regs_matrix[14][0] }) );
  flex_sreg_NUM_BITS17_0 \genblk1[15].REGX  ( .clk(clk), .n_reset(n732), 
        .write_enable(write_enables[15]), .new_value({n721, n719, n716, n42, 
        n712, n710, n707, n705, n703, n39, n697, n694, n691, n688, n685, n682, 
        n680}), .current_value({\regs_matrix[15][16] , \regs_matrix[15][15] , 
        \regs_matrix[15][14] , \regs_matrix[15][13] , \regs_matrix[15][12] , 
        \regs_matrix[15][11] , \regs_matrix[15][10] , \regs_matrix[15][9] , 
        \regs_matrix[15][8] , \regs_matrix[15][7] , \regs_matrix[15][6] , 
        \regs_matrix[15][5] , \regs_matrix[15][4] , \regs_matrix[15][3] , 
        \regs_matrix[15][2] , \regs_matrix[15][1] , \regs_matrix[15][0] }) );
  NAND2X1 U2 ( .A(n571), .B(n1), .Y(n2) );
  NAND2X1 U3 ( .A(n572), .B(n676), .Y(n3) );
  NAND2X1 U4 ( .A(n2), .B(n3), .Y(n4) );
  INVX1 U5 ( .A(n676), .Y(n1) );
  INVX4 U31 ( .A(n4), .Y(r2_data[12]) );
  INVX4 U32 ( .A(n678), .Y(n676) );
  INVX4 U33 ( .A(n322), .Y(r1_data[15]) );
  INVX4 U34 ( .A(n271), .Y(r1_data[12]) );
  INVX8 U35 ( .A(n643), .Y(n648) );
  INVX4 U36 ( .A(n58), .Y(r1_data[0]) );
  INVX4 U37 ( .A(n254), .Y(r1_data[11]) );
  INVX4 U38 ( .A(n237), .Y(r1_data[10]) );
  INVX4 U39 ( .A(w_data[6]), .Y(n696) );
  INVX4 U40 ( .A(w_data[7]), .Y(n699) );
  INVX4 U41 ( .A(n409), .Y(n669) );
  INVX4 U42 ( .A(n360), .Y(n362) );
  INVX4 U43 ( .A(n66), .Y(n360) );
  INVX4 U44 ( .A(n407), .Y(n661) );
  INVX8 U45 ( .A(n650), .Y(n653) );
  INVX4 U46 ( .A(n644), .Y(n647) );
  BUFX2 U47 ( .A(n642), .Y(n644) );
  BUFX2 U48 ( .A(n642), .Y(n643) );
  INVX2 U49 ( .A(n408), .Y(n665) );
  INVX2 U50 ( .A(n356), .Y(n357) );
  INVX2 U51 ( .A(n75), .Y(n378) );
  INVX2 U52 ( .A(n67), .Y(n364) );
  BUFX2 U53 ( .A(n642), .Y(n645) );
  INVX4 U54 ( .A(n645), .Y(n646) );
  INVX2 U55 ( .A(n101), .Y(r1_data[2]) );
  INVX2 U56 ( .A(n135), .Y(r1_data[4]) );
  INVX2 U57 ( .A(n152), .Y(r1_data[5]) );
  INVX2 U58 ( .A(n169), .Y(r1_data[6]) );
  INVX2 U59 ( .A(n186), .Y(r1_data[7]) );
  INVX4 U60 ( .A(n375), .Y(n376) );
  INVX4 U61 ( .A(n378), .Y(n48) );
  INVX2 U62 ( .A(n288), .Y(r1_data[13]) );
  INVX2 U63 ( .A(n305), .Y(r1_data[14]) );
  INVX1 U64 ( .A(N15), .Y(n14) );
  INVX1 U65 ( .A(n14), .Y(n15) );
  INVX1 U66 ( .A(n350), .Y(n23) );
  INVX4 U67 ( .A(n389), .Y(n388) );
  INVX1 U68 ( .A(n389), .Y(n19) );
  NAND2X1 U69 ( .A(n23), .B(n354), .Y(n16) );
  AND2X2 U70 ( .A(n354), .B(n23), .Y(n17) );
  INVX2 U71 ( .A(n364), .Y(n366) );
  INVX2 U72 ( .A(n360), .Y(n361) );
  INVX2 U73 ( .A(n356), .Y(n358) );
  INVX2 U74 ( .A(n65), .Y(n356) );
  INVX2 U75 ( .A(n45), .Y(r2_data[15]) );
  INVX4 U76 ( .A(n661), .Y(n662) );
  INVX4 U77 ( .A(n661), .Y(n41) );
  INVX4 U78 ( .A(n661), .Y(n663) );
  INVX4 U79 ( .A(n661), .Y(n664) );
  AND2X2 U80 ( .A(n23), .B(n354), .Y(n18) );
  INVX4 U81 ( .A(n18), .Y(n386) );
  INVX8 U82 ( .A(n654), .Y(n655) );
  INVX8 U83 ( .A(n654), .Y(n656) );
  INVX1 U84 ( .A(N12), .Y(n20) );
  INVX4 U85 ( .A(n672), .Y(n675) );
  INVX4 U86 ( .A(n672), .Y(n674) );
  INVX2 U87 ( .A(N10), .Y(n21) );
  INVX2 U88 ( .A(n21), .Y(n22) );
  INVX2 U89 ( .A(n203), .Y(r1_data[8]) );
  INVX8 U90 ( .A(n669), .Y(n670) );
  INVX8 U91 ( .A(n669), .Y(n671) );
  BUFX2 U92 ( .A(n376), .Y(n24) );
  INVX1 U93 ( .A(n718), .Y(n25) );
  INVX8 U94 ( .A(n718), .Y(n719) );
  INVX1 U95 ( .A(n709), .Y(n26) );
  INVX8 U96 ( .A(n709), .Y(n710) );
  INVX1 U97 ( .A(n704), .Y(n27) );
  INVX8 U98 ( .A(n704), .Y(n705) );
  INVX8 U99 ( .A(n702), .Y(n703) );
  INVX4 U100 ( .A(n657), .Y(n660) );
  INVX4 U101 ( .A(n404), .Y(n657) );
  INVX4 U102 ( .A(n657), .Y(n659) );
  INVX4 U103 ( .A(n657), .Y(n658) );
  INVX8 U104 ( .A(n714), .Y(n42) );
  AND2X2 U105 ( .A(n354), .B(n20), .Y(n28) );
  INVX2 U106 ( .A(n28), .Y(n83) );
  BUFX2 U107 ( .A(n24), .Y(n29) );
  INVX4 U108 ( .A(n403), .Y(n654) );
  INVX4 U109 ( .A(n360), .Y(n363) );
  INVX4 U110 ( .A(N12), .Y(n350) );
  INVX4 U111 ( .A(n356), .Y(n359) );
  INVX2 U112 ( .A(n370), .Y(n372) );
  INVX4 U113 ( .A(w_data[15]), .Y(n718) );
  INVX2 U114 ( .A(n711), .Y(n30) );
  INVX2 U115 ( .A(n711), .Y(n31) );
  INVX4 U116 ( .A(w_data[12]), .Y(n711) );
  INVX4 U117 ( .A(w_data[11]), .Y(n709) );
  INVX2 U118 ( .A(n706), .Y(n32) );
  INVX2 U119 ( .A(n706), .Y(n33) );
  INVX4 U120 ( .A(w_data[10]), .Y(n706) );
  INVX2 U121 ( .A(n715), .Y(n34) );
  INVX2 U122 ( .A(n715), .Y(n35) );
  INVX4 U123 ( .A(w_data[14]), .Y(n715) );
  INVX1 U124 ( .A(n372), .Y(n36) );
  INVX2 U125 ( .A(n696), .Y(n37) );
  INVX2 U126 ( .A(n696), .Y(n38) );
  INVX4 U127 ( .A(n17), .Y(n368) );
  INVX4 U128 ( .A(w_data[9]), .Y(n704) );
  INVX4 U129 ( .A(w_data[8]), .Y(n702) );
  INVX2 U130 ( .A(n699), .Y(n39) );
  INVX2 U131 ( .A(n699), .Y(n40) );
  INVX2 U132 ( .A(n678), .Y(n677) );
  INVX4 U133 ( .A(w_data[13]), .Y(n714) );
  NAND2X1 U134 ( .A(n50), .B(n678), .Y(n43) );
  NAND2X1 U135 ( .A(n51), .B(n677), .Y(n44) );
  NAND2X1 U136 ( .A(n43), .B(n44), .Y(n45) );
  INVX2 U137 ( .A(n665), .Y(n46) );
  INVX2 U138 ( .A(n665), .Y(n47) );
  INVX2 U139 ( .A(n378), .Y(n380) );
  INVX1 U140 ( .A(n17), .Y(n369) );
  INVX4 U141 ( .A(n651), .Y(n652) );
  INVX8 U142 ( .A(n364), .Y(n365) );
  INVX2 U143 ( .A(w_data[16]), .Y(n720) );
  NAND2X1 U144 ( .A(n619), .B(n620), .Y(n50) );
  NAND2X1 U145 ( .A(n613), .B(n614), .Y(n51) );
  INVX2 U146 ( .A(w_data[5]), .Y(n693) );
  INVX2 U147 ( .A(w_data[4]), .Y(n690) );
  INVX2 U148 ( .A(w_data[3]), .Y(n687) );
  INVX2 U149 ( .A(w_data[2]), .Y(n684) );
  INVX2 U150 ( .A(w_data[1]), .Y(n681) );
  BUFX2 U151 ( .A(n649), .Y(n651) );
  BUFX2 U152 ( .A(n649), .Y(n650) );
  INVX2 U153 ( .A(n378), .Y(n381) );
  INVX2 U154 ( .A(n665), .Y(n668) );
  INVX2 U155 ( .A(n665), .Y(n667) );
  INVX2 U156 ( .A(n665), .Y(n666) );
  INVX2 U157 ( .A(n402), .Y(n649) );
  INVX2 U158 ( .A(n378), .Y(n379) );
  INVX2 U159 ( .A(N17), .Y(n678) );
  INVX2 U160 ( .A(n720), .Y(n722) );
  INVX2 U161 ( .A(n720), .Y(n721) );
  INVX2 U162 ( .A(n693), .Y(n695) );
  INVX2 U163 ( .A(n693), .Y(n694) );
  INVX2 U164 ( .A(n706), .Y(n708) );
  INVX2 U165 ( .A(n711), .Y(n713) );
  INVX2 U166 ( .A(n715), .Y(n717) );
  INVX2 U167 ( .A(n706), .Y(n707) );
  INVX2 U168 ( .A(n711), .Y(n712) );
  INVX2 U169 ( .A(n715), .Y(n716) );
  INVX2 U170 ( .A(n699), .Y(n701) );
  INVX2 U171 ( .A(n696), .Y(n698) );
  INVX2 U172 ( .A(n699), .Y(n700) );
  INVX2 U173 ( .A(n696), .Y(n697) );
  INVX2 U174 ( .A(n687), .Y(n689) );
  INVX2 U175 ( .A(n684), .Y(n686) );
  INVX2 U176 ( .A(n687), .Y(n688) );
  INVX2 U177 ( .A(n684), .Y(n685) );
  INVX2 U178 ( .A(n690), .Y(n692) );
  INVX2 U179 ( .A(n690), .Y(n691) );
  INVX2 U180 ( .A(n679), .Y(n680) );
  INVX2 U181 ( .A(n681), .Y(n683) );
  INVX2 U182 ( .A(n681), .Y(n682) );
  INVX2 U183 ( .A(w_data[0]), .Y(n679) );
  INVX2 U184 ( .A(n724), .Y(outreg_data[16]) );
  INVX2 U185 ( .A(n737), .Y(n724) );
  BUFX2 U186 ( .A(n_reset), .Y(n725) );
  BUFX2 U187 ( .A(n_reset), .Y(n726) );
  BUFX2 U188 ( .A(n_reset), .Y(n727) );
  BUFX2 U189 ( .A(n_reset), .Y(n728) );
  BUFX2 U190 ( .A(n_reset), .Y(n729) );
  BUFX2 U191 ( .A(n_reset), .Y(n730) );
  BUFX2 U192 ( .A(n_reset), .Y(n731) );
  BUFX2 U193 ( .A(n_reset), .Y(n732) );
  AOI22X1 U194 ( .A(n55), .B(n54), .C(n53), .D(n52), .Y(n56) );
  INVX2 U195 ( .A(N13), .Y(n57) );
  INVX2 U196 ( .A(n56), .Y(r1_data[16]) );
  AOI22X1 U197 ( .A(n59), .B(n60), .C(n61), .D(n62), .Y(n58) );
  NOR2X1 U198 ( .A(n63), .B(n64), .Y(n62) );
  OAI22X1 U199 ( .A(\regs_matrix[6][0] ), .B(n359), .C(outreg_data[0]), .D(
        n363), .Y(n64) );
  OAI21X1 U200 ( .A(\regs_matrix[4][0] ), .B(n365), .C(n57), .Y(n63) );
  NOR2X1 U201 ( .A(n68), .B(n69), .Y(n61) );
  OAI21X1 U202 ( .A(\regs_matrix[7][0] ), .B(n367), .C(n70), .Y(n69) );
  AOI22X1 U203 ( .A(n387), .B(n72), .C(n28), .D(n73), .Y(n70) );
  INVX2 U204 ( .A(\regs_matrix[3][0] ), .Y(n73) );
  INVX2 U205 ( .A(\regs_matrix[1][0] ), .Y(n72) );
  OAI22X1 U206 ( .A(\regs_matrix[2][0] ), .B(n376), .C(\regs_matrix[5][0] ), 
        .D(n48), .Y(n68) );
  NOR2X1 U207 ( .A(n76), .B(n77), .Y(n60) );
  OAI22X1 U208 ( .A(\regs_matrix[14][0] ), .B(n358), .C(\regs_matrix[8][0] ), 
        .D(n361), .Y(n77) );
  OAI21X1 U209 ( .A(\regs_matrix[12][0] ), .B(n366), .C(N13), .Y(n76) );
  NOR2X1 U210 ( .A(n78), .B(n79), .Y(n59) );
  OAI21X1 U211 ( .A(\regs_matrix[15][0] ), .B(n369), .C(n80), .Y(n79) );
  AOI22X1 U212 ( .A(n372), .B(n81), .C(n382), .D(n82), .Y(n80) );
  INVX2 U213 ( .A(\regs_matrix[11][0] ), .Y(n82) );
  INVX2 U214 ( .A(\regs_matrix[9][0] ), .Y(n81) );
  OAI22X1 U215 ( .A(\regs_matrix[10][0] ), .B(n24), .C(\regs_matrix[13][0] ), 
        .D(n381), .Y(n78) );
  AOI22X1 U216 ( .A(n85), .B(n86), .C(n87), .D(n88), .Y(n84) );
  NOR2X1 U217 ( .A(n89), .B(n90), .Y(n88) );
  OAI22X1 U218 ( .A(outreg_data[1]), .B(n363), .C(\regs_matrix[2][1] ), .D(
        n377), .Y(n90) );
  OAI22X1 U219 ( .A(\regs_matrix[4][1] ), .B(n365), .C(\regs_matrix[6][1] ), 
        .D(n359), .Y(n89) );
  NOR2X1 U220 ( .A(n91), .B(n92), .Y(n87) );
  OAI21X1 U221 ( .A(\regs_matrix[3][1] ), .B(n385), .C(n93), .Y(n92) );
  AOI21X1 U222 ( .A(n387), .B(n94), .C(N13), .Y(n93) );
  INVX2 U223 ( .A(\regs_matrix[1][1] ), .Y(n94) );
  OAI22X1 U224 ( .A(\regs_matrix[5][1] ), .B(n48), .C(\regs_matrix[7][1] ), 
        .D(n386), .Y(n91) );
  NOR2X1 U225 ( .A(n95), .B(n96), .Y(n86) );
  OAI22X1 U226 ( .A(\regs_matrix[8][1] ), .B(n361), .C(\regs_matrix[10][1] ), 
        .D(n29), .Y(n96) );
  OAI22X1 U227 ( .A(\regs_matrix[12][1] ), .B(n366), .C(\regs_matrix[14][1] ), 
        .D(n358), .Y(n95) );
  NOR2X1 U228 ( .A(n97), .B(n98), .Y(n85) );
  OAI21X1 U229 ( .A(\regs_matrix[11][1] ), .B(n383), .C(n99), .Y(n98) );
  AOI21X1 U230 ( .A(n372), .B(n100), .C(n57), .Y(n99) );
  INVX2 U231 ( .A(\regs_matrix[9][1] ), .Y(n100) );
  OAI22X1 U232 ( .A(\regs_matrix[13][1] ), .B(n381), .C(\regs_matrix[15][1] ), 
        .D(n369), .Y(n97) );
  AOI22X1 U233 ( .A(n102), .B(n103), .C(n104), .D(n105), .Y(n101) );
  NOR2X1 U234 ( .A(n106), .B(n107), .Y(n105) );
  OAI22X1 U235 ( .A(outreg_data[2]), .B(n362), .C(\regs_matrix[2][2] ), .D(
        n377), .Y(n107) );
  OAI22X1 U236 ( .A(\regs_matrix[4][2] ), .B(n365), .C(\regs_matrix[6][2] ), 
        .D(n359), .Y(n106) );
  NOR2X1 U237 ( .A(n108), .B(n109), .Y(n104) );
  OAI21X1 U238 ( .A(\regs_matrix[3][2] ), .B(n385), .C(n110), .Y(n109) );
  AOI21X1 U239 ( .A(n387), .B(n111), .C(N13), .Y(n110) );
  INVX2 U240 ( .A(\regs_matrix[1][2] ), .Y(n111) );
  OAI22X1 U241 ( .A(\regs_matrix[5][2] ), .B(n379), .C(\regs_matrix[7][2] ), 
        .D(n386), .Y(n108) );
  NOR2X1 U242 ( .A(n112), .B(n113), .Y(n103) );
  OAI22X1 U243 ( .A(\regs_matrix[8][2] ), .B(n361), .C(\regs_matrix[10][2] ), 
        .D(n29), .Y(n113) );
  OAI22X1 U244 ( .A(\regs_matrix[12][2] ), .B(n366), .C(\regs_matrix[14][2] ), 
        .D(n358), .Y(n112) );
  NOR2X1 U245 ( .A(n114), .B(n115), .Y(n102) );
  OAI21X1 U246 ( .A(\regs_matrix[11][2] ), .B(n383), .C(n116), .Y(n115) );
  AOI21X1 U247 ( .A(n372), .B(n117), .C(n57), .Y(n116) );
  INVX2 U248 ( .A(\regs_matrix[9][2] ), .Y(n117) );
  OAI22X1 U249 ( .A(\regs_matrix[13][2] ), .B(n381), .C(\regs_matrix[15][2] ), 
        .D(n368), .Y(n114) );
  AOI22X1 U250 ( .A(n119), .B(n120), .C(n121), .D(n122), .Y(n118) );
  NOR2X1 U251 ( .A(n123), .B(n124), .Y(n122) );
  OAI22X1 U252 ( .A(outreg_data[3]), .B(n363), .C(\regs_matrix[2][3] ), .D(
        n377), .Y(n124) );
  OAI22X1 U253 ( .A(\regs_matrix[4][3] ), .B(n365), .C(\regs_matrix[6][3] ), 
        .D(n357), .Y(n123) );
  NOR2X1 U254 ( .A(n125), .B(n126), .Y(n121) );
  OAI21X1 U255 ( .A(\regs_matrix[3][3] ), .B(n384), .C(n127), .Y(n126) );
  AOI21X1 U256 ( .A(n388), .B(n128), .C(N13), .Y(n127) );
  INVX2 U257 ( .A(\regs_matrix[1][3] ), .Y(n128) );
  OAI22X1 U258 ( .A(\regs_matrix[5][3] ), .B(n380), .C(\regs_matrix[7][3] ), 
        .D(n16), .Y(n125) );
  NOR2X1 U259 ( .A(n129), .B(n130), .Y(n120) );
  OAI22X1 U260 ( .A(\regs_matrix[8][3] ), .B(n361), .C(\regs_matrix[10][3] ), 
        .D(n29), .Y(n130) );
  OAI22X1 U261 ( .A(\regs_matrix[12][3] ), .B(n366), .C(\regs_matrix[14][3] ), 
        .D(n358), .Y(n129) );
  NOR2X1 U262 ( .A(n131), .B(n132), .Y(n119) );
  OAI21X1 U263 ( .A(\regs_matrix[11][3] ), .B(n383), .C(n133), .Y(n132) );
  AOI21X1 U264 ( .A(n372), .B(n134), .C(n57), .Y(n133) );
  INVX2 U265 ( .A(\regs_matrix[9][3] ), .Y(n134) );
  OAI22X1 U266 ( .A(\regs_matrix[13][3] ), .B(n381), .C(\regs_matrix[15][3] ), 
        .D(n368), .Y(n131) );
  AOI22X1 U267 ( .A(n136), .B(n137), .C(n138), .D(n139), .Y(n135) );
  NOR2X1 U268 ( .A(n140), .B(n141), .Y(n139) );
  OAI22X1 U269 ( .A(outreg_data[4]), .B(n362), .C(\regs_matrix[2][4] ), .D(
        n377), .Y(n141) );
  OAI22X1 U270 ( .A(\regs_matrix[4][4] ), .B(n365), .C(\regs_matrix[6][4] ), 
        .D(n359), .Y(n140) );
  NOR2X1 U271 ( .A(n142), .B(n143), .Y(n138) );
  OAI21X1 U272 ( .A(\regs_matrix[3][4] ), .B(n384), .C(n144), .Y(n143) );
  AOI21X1 U273 ( .A(n387), .B(n145), .C(N13), .Y(n144) );
  INVX2 U274 ( .A(\regs_matrix[1][4] ), .Y(n145) );
  OAI22X1 U275 ( .A(\regs_matrix[5][4] ), .B(n48), .C(\regs_matrix[7][4] ), 
        .D(n386), .Y(n142) );
  NOR2X1 U276 ( .A(n146), .B(n147), .Y(n137) );
  OAI22X1 U277 ( .A(\regs_matrix[8][4] ), .B(n361), .C(\regs_matrix[10][4] ), 
        .D(n29), .Y(n147) );
  OAI22X1 U278 ( .A(\regs_matrix[12][4] ), .B(n366), .C(\regs_matrix[14][4] ), 
        .D(n358), .Y(n146) );
  NOR2X1 U279 ( .A(n148), .B(n149), .Y(n136) );
  OAI21X1 U280 ( .A(\regs_matrix[11][4] ), .B(n383), .C(n150), .Y(n149) );
  AOI21X1 U281 ( .A(n372), .B(n151), .C(n57), .Y(n150) );
  INVX2 U282 ( .A(\regs_matrix[9][4] ), .Y(n151) );
  OAI22X1 U283 ( .A(\regs_matrix[13][4] ), .B(n381), .C(\regs_matrix[15][4] ), 
        .D(n369), .Y(n148) );
  AOI22X1 U284 ( .A(n153), .B(n154), .C(n155), .D(n156), .Y(n152) );
  NOR2X1 U285 ( .A(n157), .B(n158), .Y(n156) );
  OAI22X1 U286 ( .A(outreg_data[5]), .B(n362), .C(\regs_matrix[2][5] ), .D(
        n377), .Y(n158) );
  OAI22X1 U287 ( .A(\regs_matrix[4][5] ), .B(n365), .C(\regs_matrix[6][5] ), 
        .D(n357), .Y(n157) );
  NOR2X1 U288 ( .A(n159), .B(n160), .Y(n155) );
  OAI21X1 U289 ( .A(\regs_matrix[3][5] ), .B(n384), .C(n161), .Y(n160) );
  AOI21X1 U290 ( .A(n388), .B(n162), .C(N13), .Y(n161) );
  INVX2 U291 ( .A(\regs_matrix[1][5] ), .Y(n162) );
  OAI22X1 U292 ( .A(\regs_matrix[5][5] ), .B(n380), .C(\regs_matrix[7][5] ), 
        .D(n16), .Y(n159) );
  NOR2X1 U293 ( .A(n163), .B(n164), .Y(n154) );
  OAI22X1 U294 ( .A(\regs_matrix[8][5] ), .B(n361), .C(\regs_matrix[10][5] ), 
        .D(n24), .Y(n164) );
  OAI22X1 U295 ( .A(\regs_matrix[12][5] ), .B(n366), .C(\regs_matrix[14][5] ), 
        .D(n358), .Y(n163) );
  NOR2X1 U296 ( .A(n165), .B(n166), .Y(n153) );
  OAI21X1 U297 ( .A(\regs_matrix[11][5] ), .B(n383), .C(n167), .Y(n166) );
  AOI21X1 U298 ( .A(n372), .B(n168), .C(n57), .Y(n167) );
  INVX2 U299 ( .A(\regs_matrix[9][5] ), .Y(n168) );
  OAI22X1 U300 ( .A(\regs_matrix[13][5] ), .B(n381), .C(\regs_matrix[15][5] ), 
        .D(n369), .Y(n165) );
  AOI22X1 U301 ( .A(n170), .B(n171), .C(n172), .D(n173), .Y(n169) );
  NOR2X1 U302 ( .A(n174), .B(n175), .Y(n173) );
  OAI22X1 U303 ( .A(outreg_data[6]), .B(n363), .C(\regs_matrix[2][6] ), .D(
        n377), .Y(n175) );
  OAI22X1 U304 ( .A(\regs_matrix[4][6] ), .B(n365), .C(\regs_matrix[6][6] ), 
        .D(n359), .Y(n174) );
  NOR2X1 U305 ( .A(n176), .B(n177), .Y(n172) );
  OAI21X1 U306 ( .A(\regs_matrix[3][6] ), .B(n83), .C(n178), .Y(n177) );
  AOI21X1 U307 ( .A(n387), .B(n179), .C(N13), .Y(n178) );
  INVX2 U308 ( .A(\regs_matrix[1][6] ), .Y(n179) );
  OAI22X1 U309 ( .A(\regs_matrix[5][6] ), .B(n48), .C(\regs_matrix[7][6] ), 
        .D(n367), .Y(n176) );
  NOR2X1 U310 ( .A(n180), .B(n181), .Y(n171) );
  OAI22X1 U311 ( .A(\regs_matrix[8][6] ), .B(n361), .C(\regs_matrix[10][6] ), 
        .D(n29), .Y(n181) );
  OAI22X1 U312 ( .A(\regs_matrix[12][6] ), .B(n366), .C(\regs_matrix[14][6] ), 
        .D(n358), .Y(n180) );
  NOR2X1 U313 ( .A(n182), .B(n183), .Y(n170) );
  OAI21X1 U314 ( .A(\regs_matrix[11][6] ), .B(n383), .C(n184), .Y(n183) );
  AOI21X1 U315 ( .A(n372), .B(n185), .C(n57), .Y(n184) );
  INVX2 U316 ( .A(\regs_matrix[9][6] ), .Y(n185) );
  OAI22X1 U317 ( .A(\regs_matrix[13][6] ), .B(n381), .C(\regs_matrix[15][6] ), 
        .D(n368), .Y(n182) );
  AOI22X1 U318 ( .A(n187), .B(n188), .C(n189), .D(n190), .Y(n186) );
  NOR2X1 U319 ( .A(n192), .B(n191), .Y(n190) );
  OAI22X1 U320 ( .A(outreg_data[7]), .B(n363), .C(\regs_matrix[2][7] ), .D(
        n377), .Y(n192) );
  OAI22X1 U321 ( .A(\regs_matrix[4][7] ), .B(n365), .C(\regs_matrix[6][7] ), 
        .D(n357), .Y(n191) );
  NOR2X1 U322 ( .A(n194), .B(n193), .Y(n189) );
  OAI21X1 U323 ( .A(\regs_matrix[3][7] ), .B(n384), .C(n195), .Y(n194) );
  AOI21X1 U324 ( .A(n196), .B(n19), .C(N13), .Y(n195) );
  INVX2 U325 ( .A(\regs_matrix[1][7] ), .Y(n196) );
  OAI22X1 U326 ( .A(\regs_matrix[5][7] ), .B(n48), .C(\regs_matrix[7][7] ), 
        .D(n16), .Y(n193) );
  NOR2X1 U327 ( .A(n197), .B(n198), .Y(n188) );
  OAI22X1 U328 ( .A(\regs_matrix[8][7] ), .B(n361), .C(\regs_matrix[10][7] ), 
        .D(n29), .Y(n198) );
  OAI22X1 U329 ( .A(\regs_matrix[12][7] ), .B(n366), .C(\regs_matrix[14][7] ), 
        .D(n358), .Y(n197) );
  NOR2X1 U330 ( .A(n199), .B(n200), .Y(n187) );
  OAI21X1 U331 ( .A(\regs_matrix[11][7] ), .B(n383), .C(n201), .Y(n200) );
  AOI21X1 U332 ( .A(n372), .B(n202), .C(n57), .Y(n201) );
  INVX2 U333 ( .A(\regs_matrix[9][7] ), .Y(n202) );
  OAI22X1 U334 ( .A(\regs_matrix[13][7] ), .B(n381), .C(\regs_matrix[15][7] ), 
        .D(n368), .Y(n199) );
  AOI22X1 U335 ( .A(n204), .B(n205), .C(n206), .D(n207), .Y(n203) );
  NOR2X1 U336 ( .A(n208), .B(n209), .Y(n207) );
  OAI22X1 U337 ( .A(outreg_data[8]), .B(n362), .C(\regs_matrix[2][8] ), .D(
        n376), .Y(n209) );
  OAI22X1 U338 ( .A(\regs_matrix[4][8] ), .B(n365), .C(\regs_matrix[6][8] ), 
        .D(n357), .Y(n208) );
  NOR2X1 U339 ( .A(n210), .B(n211), .Y(n206) );
  OAI21X1 U340 ( .A(\regs_matrix[3][8] ), .B(n83), .C(n212), .Y(n211) );
  AOI21X1 U341 ( .A(n387), .B(n213), .C(N13), .Y(n212) );
  INVX2 U342 ( .A(\regs_matrix[1][8] ), .Y(n213) );
  OAI22X1 U343 ( .A(\regs_matrix[5][8] ), .B(n380), .C(\regs_matrix[7][8] ), 
        .D(n386), .Y(n210) );
  NOR2X1 U344 ( .A(n214), .B(n215), .Y(n205) );
  OAI22X1 U345 ( .A(\regs_matrix[8][8] ), .B(n361), .C(\regs_matrix[10][8] ), 
        .D(n29), .Y(n215) );
  OAI22X1 U346 ( .A(\regs_matrix[12][8] ), .B(n366), .C(\regs_matrix[14][8] ), 
        .D(n358), .Y(n214) );
  NOR2X1 U347 ( .A(n216), .B(n217), .Y(n204) );
  OAI21X1 U348 ( .A(\regs_matrix[11][8] ), .B(n383), .C(n218), .Y(n217) );
  AOI21X1 U349 ( .A(n372), .B(n219), .C(n57), .Y(n218) );
  INVX2 U350 ( .A(\regs_matrix[9][8] ), .Y(n219) );
  OAI22X1 U351 ( .A(\regs_matrix[13][8] ), .B(n381), .C(\regs_matrix[15][8] ), 
        .D(n368), .Y(n216) );
  AOI22X1 U352 ( .A(n221), .B(n222), .C(n223), .D(n224), .Y(n220) );
  NOR2X1 U353 ( .A(n225), .B(n226), .Y(n224) );
  OAI22X1 U354 ( .A(outreg_data[9]), .B(n362), .C(\regs_matrix[2][9] ), .D(
        n377), .Y(n226) );
  OAI22X1 U355 ( .A(\regs_matrix[4][9] ), .B(n365), .C(\regs_matrix[6][9] ), 
        .D(n357), .Y(n225) );
  NOR2X1 U356 ( .A(n227), .B(n228), .Y(n223) );
  OAI21X1 U357 ( .A(\regs_matrix[3][9] ), .B(n385), .C(n229), .Y(n228) );
  AOI21X1 U358 ( .A(n387), .B(n230), .C(N13), .Y(n229) );
  INVX2 U359 ( .A(\regs_matrix[1][9] ), .Y(n230) );
  OAI22X1 U360 ( .A(\regs_matrix[5][9] ), .B(n48), .C(\regs_matrix[7][9] ), 
        .D(n386), .Y(n227) );
  NOR2X1 U361 ( .A(n231), .B(n232), .Y(n222) );
  OAI22X1 U362 ( .A(\regs_matrix[8][9] ), .B(n361), .C(\regs_matrix[10][9] ), 
        .D(n29), .Y(n232) );
  OAI22X1 U363 ( .A(\regs_matrix[12][9] ), .B(n366), .C(\regs_matrix[14][9] ), 
        .D(n358), .Y(n231) );
  NOR2X1 U364 ( .A(n233), .B(n234), .Y(n221) );
  OAI21X1 U365 ( .A(\regs_matrix[11][9] ), .B(n383), .C(n235), .Y(n234) );
  AOI21X1 U366 ( .A(n372), .B(n236), .C(n57), .Y(n235) );
  INVX2 U367 ( .A(\regs_matrix[9][9] ), .Y(n236) );
  OAI22X1 U368 ( .A(\regs_matrix[13][9] ), .B(n381), .C(\regs_matrix[15][9] ), 
        .D(n369), .Y(n233) );
  AOI22X1 U369 ( .A(n238), .B(n239), .C(n240), .D(n241), .Y(n237) );
  NOR2X1 U370 ( .A(n242), .B(n243), .Y(n241) );
  OAI22X1 U371 ( .A(outreg_data[10]), .B(n363), .C(\regs_matrix[2][10] ), .D(
        n377), .Y(n243) );
  OAI22X1 U372 ( .A(\regs_matrix[4][10] ), .B(n365), .C(\regs_matrix[6][10] ), 
        .D(n359), .Y(n242) );
  NOR2X1 U373 ( .A(n244), .B(n245), .Y(n240) );
  OAI21X1 U374 ( .A(\regs_matrix[3][10] ), .B(n385), .C(n246), .Y(n245) );
  AOI21X1 U375 ( .A(n387), .B(n247), .C(N13), .Y(n246) );
  INVX2 U376 ( .A(\regs_matrix[1][10] ), .Y(n247) );
  OAI22X1 U377 ( .A(\regs_matrix[5][10] ), .B(n48), .C(\regs_matrix[7][10] ), 
        .D(n386), .Y(n244) );
  NOR2X1 U378 ( .A(n248), .B(n249), .Y(n239) );
  OAI22X1 U379 ( .A(\regs_matrix[8][10] ), .B(n361), .C(\regs_matrix[10][10] ), 
        .D(n29), .Y(n249) );
  OAI22X1 U380 ( .A(\regs_matrix[12][10] ), .B(n366), .C(\regs_matrix[14][10] ), .D(n358), .Y(n248) );
  NOR2X1 U381 ( .A(n250), .B(n251), .Y(n238) );
  OAI21X1 U382 ( .A(\regs_matrix[11][10] ), .B(n383), .C(n252), .Y(n251) );
  AOI21X1 U383 ( .A(n372), .B(n253), .C(n57), .Y(n252) );
  INVX2 U384 ( .A(\regs_matrix[9][10] ), .Y(n253) );
  OAI22X1 U385 ( .A(\regs_matrix[13][10] ), .B(n381), .C(\regs_matrix[15][10] ), .D(n369), .Y(n250) );
  AOI22X1 U386 ( .A(n255), .B(n256), .C(n257), .D(n258), .Y(n254) );
  NOR2X1 U387 ( .A(n259), .B(n260), .Y(n258) );
  OAI22X1 U388 ( .A(outreg_data[11]), .B(n362), .C(\regs_matrix[2][11] ), .D(
        n376), .Y(n260) );
  OAI22X1 U389 ( .A(\regs_matrix[4][11] ), .B(n365), .C(\regs_matrix[6][11] ), 
        .D(n359), .Y(n259) );
  NOR2X1 U390 ( .A(n261), .B(n262), .Y(n257) );
  OAI21X1 U391 ( .A(\regs_matrix[3][11] ), .B(n83), .C(n263), .Y(n262) );
  AOI21X1 U392 ( .A(n388), .B(n264), .C(N13), .Y(n263) );
  INVX2 U393 ( .A(\regs_matrix[1][11] ), .Y(n264) );
  OAI22X1 U394 ( .A(\regs_matrix[5][11] ), .B(n379), .C(\regs_matrix[7][11] ), 
        .D(n386), .Y(n261) );
  NOR2X1 U395 ( .A(n265), .B(n266), .Y(n256) );
  OAI22X1 U396 ( .A(\regs_matrix[8][11] ), .B(n361), .C(\regs_matrix[10][11] ), 
        .D(n29), .Y(n266) );
  OAI22X1 U397 ( .A(\regs_matrix[12][11] ), .B(n366), .C(\regs_matrix[14][11] ), .D(n358), .Y(n265) );
  NOR2X1 U398 ( .A(n267), .B(n268), .Y(n255) );
  OAI21X1 U399 ( .A(\regs_matrix[11][11] ), .B(n383), .C(n269), .Y(n268) );
  AOI21X1 U400 ( .A(n372), .B(n270), .C(n57), .Y(n269) );
  INVX2 U401 ( .A(\regs_matrix[9][11] ), .Y(n270) );
  OAI22X1 U402 ( .A(\regs_matrix[13][11] ), .B(n381), .C(\regs_matrix[15][11] ), .D(n368), .Y(n267) );
  AOI22X1 U403 ( .A(n272), .B(n273), .C(n274), .D(n275), .Y(n271) );
  NOR2X1 U404 ( .A(n276), .B(n277), .Y(n275) );
  OAI22X1 U405 ( .A(outreg_data[12]), .B(n363), .C(\regs_matrix[2][12] ), .D(
        n376), .Y(n277) );
  OAI22X1 U406 ( .A(\regs_matrix[4][12] ), .B(n365), .C(\regs_matrix[6][12] ), 
        .D(n359), .Y(n276) );
  NOR2X1 U407 ( .A(n278), .B(n279), .Y(n274) );
  OAI21X1 U408 ( .A(\regs_matrix[3][12] ), .B(n385), .C(n280), .Y(n279) );
  AOI21X1 U409 ( .A(n371), .B(n281), .C(N13), .Y(n280) );
  INVX2 U410 ( .A(\regs_matrix[1][12] ), .Y(n281) );
  OAI22X1 U411 ( .A(\regs_matrix[5][12] ), .B(n48), .C(\regs_matrix[7][12] ), 
        .D(n368), .Y(n278) );
  NOR2X1 U412 ( .A(n282), .B(n283), .Y(n273) );
  OAI22X1 U413 ( .A(\regs_matrix[8][12] ), .B(n361), .C(\regs_matrix[10][12] ), 
        .D(n29), .Y(n283) );
  OAI22X1 U414 ( .A(\regs_matrix[12][12] ), .B(n366), .C(\regs_matrix[14][12] ), .D(n358), .Y(n282) );
  NOR2X1 U415 ( .A(n284), .B(n285), .Y(n272) );
  OAI21X1 U416 ( .A(\regs_matrix[11][12] ), .B(n383), .C(n286), .Y(n285) );
  AOI21X1 U417 ( .A(n372), .B(n287), .C(n57), .Y(n286) );
  INVX2 U418 ( .A(\regs_matrix[9][12] ), .Y(n287) );
  OAI22X1 U419 ( .A(\regs_matrix[13][12] ), .B(n381), .C(\regs_matrix[15][12] ), .D(n368), .Y(n284) );
  AOI22X1 U420 ( .A(n289), .B(n290), .C(n291), .D(n292), .Y(n288) );
  NOR2X1 U421 ( .A(n293), .B(n294), .Y(n292) );
  OAI22X1 U422 ( .A(outreg_data[13]), .B(n362), .C(\regs_matrix[2][13] ), .D(
        n376), .Y(n294) );
  OAI22X1 U423 ( .A(\regs_matrix[4][13] ), .B(n365), .C(\regs_matrix[6][13] ), 
        .D(n357), .Y(n293) );
  NOR2X1 U424 ( .A(n295), .B(n296), .Y(n291) );
  OAI21X1 U425 ( .A(\regs_matrix[3][13] ), .B(n385), .C(n297), .Y(n296) );
  AOI21X1 U426 ( .A(n387), .B(n298), .C(N13), .Y(n297) );
  INVX2 U427 ( .A(\regs_matrix[1][13] ), .Y(n298) );
  OAI22X1 U428 ( .A(\regs_matrix[5][13] ), .B(n379), .C(\regs_matrix[7][13] ), 
        .D(n16), .Y(n295) );
  NOR2X1 U429 ( .A(n299), .B(n300), .Y(n290) );
  OAI22X1 U430 ( .A(\regs_matrix[8][13] ), .B(n361), .C(\regs_matrix[10][13] ), 
        .D(n24), .Y(n300) );
  OAI22X1 U431 ( .A(\regs_matrix[12][13] ), .B(n365), .C(\regs_matrix[14][13] ), .D(n358), .Y(n299) );
  NOR2X1 U432 ( .A(n301), .B(n302), .Y(n289) );
  OAI21X1 U433 ( .A(\regs_matrix[11][13] ), .B(n383), .C(n303), .Y(n302) );
  AOI21X1 U434 ( .A(n372), .B(n304), .C(n57), .Y(n303) );
  INVX2 U435 ( .A(\regs_matrix[9][13] ), .Y(n304) );
  OAI22X1 U436 ( .A(\regs_matrix[13][13] ), .B(n381), .C(\regs_matrix[15][13] ), .D(n368), .Y(n301) );
  AOI22X1 U437 ( .A(n306), .B(n307), .C(n308), .D(n309), .Y(n305) );
  NOR2X1 U438 ( .A(n310), .B(n311), .Y(n309) );
  OAI22X1 U439 ( .A(outreg_data[14]), .B(n363), .C(\regs_matrix[2][14] ), .D(
        n376), .Y(n311) );
  OAI22X1 U440 ( .A(\regs_matrix[4][14] ), .B(n365), .C(\regs_matrix[6][14] ), 
        .D(n359), .Y(n310) );
  NOR2X1 U441 ( .A(n312), .B(n313), .Y(n308) );
  OAI21X1 U442 ( .A(\regs_matrix[3][14] ), .B(n384), .C(n314), .Y(n313) );
  AOI21X1 U443 ( .A(n387), .B(n315), .C(N13), .Y(n314) );
  INVX2 U444 ( .A(\regs_matrix[1][14] ), .Y(n315) );
  OAI22X1 U445 ( .A(\regs_matrix[5][14] ), .B(n48), .C(\regs_matrix[7][14] ), 
        .D(n16), .Y(n312) );
  NOR2X1 U446 ( .A(n316), .B(n317), .Y(n307) );
  OAI22X1 U447 ( .A(\regs_matrix[8][14] ), .B(n361), .C(\regs_matrix[10][14] ), 
        .D(n24), .Y(n317) );
  OAI22X1 U448 ( .A(\regs_matrix[12][14] ), .B(n365), .C(\regs_matrix[14][14] ), .D(n358), .Y(n316) );
  NOR2X1 U449 ( .A(n318), .B(n319), .Y(n306) );
  OAI21X1 U450 ( .A(\regs_matrix[11][14] ), .B(n383), .C(n320), .Y(n319) );
  AOI21X1 U451 ( .A(n372), .B(n321), .C(n57), .Y(n320) );
  INVX2 U452 ( .A(\regs_matrix[9][14] ), .Y(n321) );
  OAI22X1 U453 ( .A(\regs_matrix[13][14] ), .B(n381), .C(\regs_matrix[15][14] ), .D(n369), .Y(n318) );
  AOI22X1 U454 ( .A(n323), .B(n324), .C(n325), .D(n326), .Y(n322) );
  NOR2X1 U455 ( .A(n327), .B(n328), .Y(n326) );
  OAI22X1 U456 ( .A(outreg_data[15]), .B(n363), .C(\regs_matrix[2][15] ), .D(
        n376), .Y(n328) );
  OAI22X1 U457 ( .A(\regs_matrix[4][15] ), .B(n365), .C(\regs_matrix[6][15] ), 
        .D(n359), .Y(n327) );
  NOR2X1 U458 ( .A(n329), .B(n330), .Y(n325) );
  OAI21X1 U459 ( .A(\regs_matrix[3][15] ), .B(n384), .C(n331), .Y(n330) );
  AOI21X1 U460 ( .A(n371), .B(n332), .C(N13), .Y(n331) );
  INVX2 U461 ( .A(\regs_matrix[1][15] ), .Y(n332) );
  OAI22X1 U462 ( .A(\regs_matrix[5][15] ), .B(n379), .C(\regs_matrix[7][15] ), 
        .D(n368), .Y(n329) );
  NOR2X1 U463 ( .A(n333), .B(n334), .Y(n324) );
  OAI22X1 U464 ( .A(\regs_matrix[8][15] ), .B(n361), .C(\regs_matrix[10][15] ), 
        .D(n24), .Y(n334) );
  OAI22X1 U465 ( .A(\regs_matrix[12][15] ), .B(n365), .C(\regs_matrix[14][15] ), .D(n358), .Y(n333) );
  NOR2X1 U466 ( .A(n335), .B(n336), .Y(n323) );
  OAI21X1 U467 ( .A(\regs_matrix[11][15] ), .B(n383), .C(n337), .Y(n336) );
  AOI21X1 U468 ( .A(n372), .B(n338), .C(n57), .Y(n337) );
  INVX2 U469 ( .A(\regs_matrix[9][15] ), .Y(n338) );
  OAI22X1 U470 ( .A(\regs_matrix[13][15] ), .B(n381), .C(\regs_matrix[15][15] ), .D(n369), .Y(n335) );
  NOR2X1 U471 ( .A(n340), .B(n341), .Y(n52) );
  OAI21X1 U472 ( .A(outreg_data[16]), .B(n363), .C(n342), .Y(n341) );
  AOI21X1 U473 ( .A(n375), .B(n343), .C(N13), .Y(n342) );
  INVX2 U474 ( .A(\regs_matrix[2][16] ), .Y(n343) );
  OAI22X1 U475 ( .A(\regs_matrix[4][16] ), .B(n365), .C(\regs_matrix[6][16] ), 
        .D(n359), .Y(n340) );
  NOR2X1 U476 ( .A(n344), .B(n345), .Y(n53) );
  OAI22X1 U477 ( .A(\regs_matrix[3][16] ), .B(n383), .C(\regs_matrix[1][16] ), 
        .D(n36), .Y(n345) );
  OAI22X1 U478 ( .A(\regs_matrix[5][16] ), .B(n48), .C(\regs_matrix[7][16] ), 
        .D(n368), .Y(n344) );
  NOR3X1 U479 ( .A(n346), .B(n347), .C(n348), .Y(n54) );
  OAI22X1 U480 ( .A(\regs_matrix[10][16] ), .B(n24), .C(\regs_matrix[8][16] ), 
        .D(n361), .Y(n348) );
  NAND3X1 U481 ( .A(n349), .B(n350), .C(n351), .Y(n66) );
  NAND3X1 U482 ( .A(n350), .B(N11), .C(n351), .Y(n74) );
  NOR2X1 U483 ( .A(\regs_matrix[12][16] ), .B(n365), .Y(n347) );
  NAND3X1 U484 ( .A(N12), .B(n349), .C(n351), .Y(n67) );
  OAI22X1 U485 ( .A(\regs_matrix[9][16] ), .B(n370), .C(\regs_matrix[14][16] ), 
        .D(n358), .Y(n346) );
  NAND3X1 U486 ( .A(N12), .B(N11), .C(n351), .Y(n65) );
  INVX2 U487 ( .A(N10), .Y(n351) );
  NAND3X1 U488 ( .A(n22), .B(n350), .C(n349), .Y(n339) );
  NOR2X1 U489 ( .A(n352), .B(n353), .Y(n55) );
  OAI21X1 U490 ( .A(\regs_matrix[11][16] ), .B(n383), .C(N13), .Y(n353) );
  OAI22X1 U491 ( .A(\regs_matrix[15][16] ), .B(n368), .C(\regs_matrix[13][16] ), .D(n381), .Y(n352) );
  NAND3X1 U492 ( .A(N12), .B(n22), .C(n349), .Y(n75) );
  INVX2 U493 ( .A(n355), .Y(n354) );
  NAND2X1 U494 ( .A(N11), .B(N10), .Y(n355) );
  BUFX4 U495 ( .A(n373), .Y(n374) );
  BUFX4 U496 ( .A(n373), .Y(n375) );
  INVX8 U497 ( .A(n374), .Y(n377) );
  INVX4 U498 ( .A(n339), .Y(n71) );
  INVX4 U499 ( .A(n84), .Y(r1_data[1]) );
  INVX4 U500 ( .A(n118), .Y(r1_data[3]) );
  INVX4 U501 ( .A(n220), .Y(r1_data[9]) );
  INVX2 U502 ( .A(n370), .Y(n371) );
  INVX4 U503 ( .A(n388), .Y(n370) );
  INVX2 U504 ( .A(n74), .Y(n373) );
  BUFX2 U505 ( .A(n28), .Y(n382) );
  INVX2 U506 ( .A(n382), .Y(n383) );
  NAND2X1 U507 ( .A(n354), .B(n20), .Y(n384) );
  NAND2X1 U508 ( .A(n354), .B(n20), .Y(n385) );
  INVX4 U509 ( .A(N11), .Y(n349) );
  INVX2 U510 ( .A(n17), .Y(n367) );
  INVX8 U511 ( .A(n389), .Y(n387) );
  INVX8 U512 ( .A(n71), .Y(n389) );
  AOI22X1 U513 ( .A(n393), .B(n392), .C(n391), .D(n390), .Y(n394) );
  INVX2 U514 ( .A(n394), .Y(r2_data[16]) );
  MUX2X1 U515 ( .B(n395), .A(n396), .S(n676), .Y(r2_data[0]) );
  NAND2X1 U516 ( .A(n398), .B(n397), .Y(n396) );
  NOR2X1 U517 ( .A(n400), .B(n399), .Y(n398) );
  OAI22X1 U518 ( .A(\regs_matrix[8][0] ), .B(n646), .C(\regs_matrix[10][0] ), 
        .D(n652), .Y(n400) );
  OAI22X1 U519 ( .A(\regs_matrix[12][0] ), .B(n655), .C(\regs_matrix[14][0] ), 
        .D(n659), .Y(n399) );
  NOR2X1 U520 ( .A(n405), .B(n406), .Y(n397) );
  OAI22X1 U521 ( .A(\regs_matrix[11][0] ), .B(n663), .C(\regs_matrix[9][0] ), 
        .D(n667), .Y(n406) );
  OAI22X1 U522 ( .A(\regs_matrix[13][0] ), .B(n670), .C(\regs_matrix[15][0] ), 
        .D(n675), .Y(n405) );
  NAND2X1 U523 ( .A(n411), .B(n412), .Y(n395) );
  NOR2X1 U524 ( .A(n413), .B(n414), .Y(n412) );
  OAI22X1 U525 ( .A(outreg_data[0]), .B(n646), .C(\regs_matrix[2][0] ), .D(
        n652), .Y(n414) );
  OAI22X1 U526 ( .A(\regs_matrix[4][0] ), .B(n656), .C(\regs_matrix[6][0] ), 
        .D(n660), .Y(n413) );
  NOR2X1 U527 ( .A(n415), .B(n416), .Y(n411) );
  OAI22X1 U528 ( .A(\regs_matrix[3][0] ), .B(n663), .C(\regs_matrix[1][0] ), 
        .D(n666), .Y(n416) );
  OAI22X1 U529 ( .A(\regs_matrix[5][0] ), .B(n670), .C(\regs_matrix[7][0] ), 
        .D(n675), .Y(n415) );
  MUX2X1 U530 ( .B(n417), .A(n418), .S(n677), .Y(r2_data[1]) );
  NAND2X1 U531 ( .A(n419), .B(n420), .Y(n418) );
  NOR2X1 U532 ( .A(n421), .B(n422), .Y(n420) );
  OAI22X1 U533 ( .A(\regs_matrix[8][1] ), .B(n646), .C(\regs_matrix[10][1] ), 
        .D(n652), .Y(n422) );
  OAI22X1 U534 ( .A(\regs_matrix[12][1] ), .B(n655), .C(\regs_matrix[14][1] ), 
        .D(n660), .Y(n421) );
  NOR2X1 U535 ( .A(n423), .B(n424), .Y(n419) );
  OAI22X1 U536 ( .A(\regs_matrix[11][1] ), .B(n664), .C(\regs_matrix[9][1] ), 
        .D(n46), .Y(n424) );
  OAI22X1 U537 ( .A(\regs_matrix[13][1] ), .B(n671), .C(\regs_matrix[15][1] ), 
        .D(n675), .Y(n423) );
  NAND2X1 U538 ( .A(n425), .B(n426), .Y(n417) );
  NOR2X1 U539 ( .A(n427), .B(n428), .Y(n426) );
  OAI22X1 U540 ( .A(outreg_data[1]), .B(n646), .C(\regs_matrix[2][1] ), .D(
        n652), .Y(n428) );
  OAI22X1 U541 ( .A(\regs_matrix[4][1] ), .B(n656), .C(\regs_matrix[6][1] ), 
        .D(n660), .Y(n427) );
  NOR2X1 U542 ( .A(n429), .B(n430), .Y(n425) );
  OAI22X1 U543 ( .A(\regs_matrix[3][1] ), .B(n41), .C(\regs_matrix[1][1] ), 
        .D(n666), .Y(n430) );
  OAI22X1 U544 ( .A(\regs_matrix[5][1] ), .B(n671), .C(\regs_matrix[7][1] ), 
        .D(n675), .Y(n429) );
  MUX2X1 U545 ( .B(n431), .A(n432), .S(n676), .Y(r2_data[2]) );
  NAND2X1 U546 ( .A(n433), .B(n434), .Y(n432) );
  NOR2X1 U547 ( .A(n435), .B(n436), .Y(n434) );
  OAI22X1 U548 ( .A(\regs_matrix[8][2] ), .B(n646), .C(\regs_matrix[10][2] ), 
        .D(n652), .Y(n436) );
  OAI22X1 U549 ( .A(\regs_matrix[12][2] ), .B(n655), .C(\regs_matrix[14][2] ), 
        .D(n660), .Y(n435) );
  NOR2X1 U550 ( .A(n437), .B(n438), .Y(n433) );
  OAI22X1 U551 ( .A(\regs_matrix[11][2] ), .B(n662), .C(\regs_matrix[9][2] ), 
        .D(n46), .Y(n438) );
  OAI22X1 U552 ( .A(\regs_matrix[13][2] ), .B(n670), .C(\regs_matrix[15][2] ), 
        .D(n675), .Y(n437) );
  NAND2X1 U553 ( .A(n439), .B(n440), .Y(n431) );
  NOR2X1 U554 ( .A(n441), .B(n442), .Y(n440) );
  OAI22X1 U555 ( .A(outreg_data[2]), .B(n646), .C(\regs_matrix[2][2] ), .D(
        n652), .Y(n442) );
  OAI22X1 U556 ( .A(\regs_matrix[4][2] ), .B(n655), .C(\regs_matrix[6][2] ), 
        .D(n660), .Y(n441) );
  NOR2X1 U557 ( .A(n443), .B(n444), .Y(n439) );
  OAI22X1 U558 ( .A(\regs_matrix[3][2] ), .B(n41), .C(\regs_matrix[1][2] ), 
        .D(n666), .Y(n444) );
  OAI22X1 U559 ( .A(\regs_matrix[5][2] ), .B(n670), .C(\regs_matrix[7][2] ), 
        .D(n675), .Y(n443) );
  MUX2X1 U560 ( .B(n445), .A(n446), .S(n677), .Y(r2_data[3]) );
  NAND2X1 U561 ( .A(n447), .B(n448), .Y(n446) );
  NOR2X1 U562 ( .A(n449), .B(n450), .Y(n448) );
  OAI22X1 U563 ( .A(\regs_matrix[8][3] ), .B(n646), .C(\regs_matrix[10][3] ), 
        .D(n652), .Y(n450) );
  OAI22X1 U564 ( .A(\regs_matrix[12][3] ), .B(n655), .C(\regs_matrix[14][3] ), 
        .D(n660), .Y(n449) );
  NOR2X1 U565 ( .A(n451), .B(n452), .Y(n447) );
  OAI22X1 U566 ( .A(\regs_matrix[11][3] ), .B(n663), .C(\regs_matrix[9][3] ), 
        .D(n46), .Y(n452) );
  OAI22X1 U567 ( .A(\regs_matrix[13][3] ), .B(n671), .C(\regs_matrix[15][3] ), 
        .D(n675), .Y(n451) );
  NAND2X1 U568 ( .A(n453), .B(n454), .Y(n445) );
  NOR2X1 U569 ( .A(n455), .B(n456), .Y(n454) );
  OAI22X1 U570 ( .A(outreg_data[3]), .B(n646), .C(\regs_matrix[2][3] ), .D(
        n652), .Y(n456) );
  OAI22X1 U571 ( .A(\regs_matrix[4][3] ), .B(n655), .C(\regs_matrix[6][3] ), 
        .D(n660), .Y(n455) );
  NOR2X1 U572 ( .A(n457), .B(n458), .Y(n453) );
  OAI22X1 U573 ( .A(\regs_matrix[3][3] ), .B(n663), .C(\regs_matrix[1][3] ), 
        .D(n667), .Y(n458) );
  OAI22X1 U574 ( .A(\regs_matrix[5][3] ), .B(n671), .C(\regs_matrix[7][3] ), 
        .D(n675), .Y(n457) );
  MUX2X1 U575 ( .B(n459), .A(n460), .S(n676), .Y(r2_data[4]) );
  NAND2X1 U576 ( .A(n461), .B(n462), .Y(n460) );
  NOR2X1 U577 ( .A(n463), .B(n464), .Y(n462) );
  OAI22X1 U578 ( .A(\regs_matrix[8][4] ), .B(n647), .C(\regs_matrix[10][4] ), 
        .D(n653), .Y(n464) );
  OAI22X1 U579 ( .A(\regs_matrix[12][4] ), .B(n655), .C(\regs_matrix[14][4] ), 
        .D(n660), .Y(n463) );
  NOR2X1 U580 ( .A(n465), .B(n466), .Y(n461) );
  OAI22X1 U581 ( .A(\regs_matrix[11][4] ), .B(n41), .C(\regs_matrix[9][4] ), 
        .D(n47), .Y(n466) );
  OAI22X1 U582 ( .A(\regs_matrix[13][4] ), .B(n671), .C(\regs_matrix[15][4] ), 
        .D(n675), .Y(n465) );
  NAND2X1 U583 ( .A(n467), .B(n468), .Y(n459) );
  NOR2X1 U584 ( .A(n469), .B(n470), .Y(n468) );
  OAI22X1 U585 ( .A(outreg_data[4]), .B(n647), .C(\regs_matrix[2][4] ), .D(
        n653), .Y(n470) );
  OAI22X1 U586 ( .A(\regs_matrix[4][4] ), .B(n655), .C(\regs_matrix[6][4] ), 
        .D(n660), .Y(n469) );
  NOR2X1 U587 ( .A(n471), .B(n472), .Y(n467) );
  OAI22X1 U588 ( .A(\regs_matrix[3][4] ), .B(n663), .C(\regs_matrix[1][4] ), 
        .D(n667), .Y(n472) );
  OAI22X1 U589 ( .A(\regs_matrix[5][4] ), .B(n671), .C(\regs_matrix[7][4] ), 
        .D(n675), .Y(n471) );
  MUX2X1 U590 ( .B(n473), .A(n474), .S(n677), .Y(r2_data[5]) );
  NAND2X1 U591 ( .A(n475), .B(n476), .Y(n474) );
  NOR2X1 U592 ( .A(n477), .B(n478), .Y(n476) );
  OAI22X1 U593 ( .A(\regs_matrix[8][5] ), .B(n647), .C(\regs_matrix[10][5] ), 
        .D(n653), .Y(n478) );
  OAI22X1 U594 ( .A(\regs_matrix[12][5] ), .B(n656), .C(\regs_matrix[14][5] ), 
        .D(n660), .Y(n477) );
  NOR2X1 U595 ( .A(n479), .B(n480), .Y(n475) );
  OAI22X1 U596 ( .A(\regs_matrix[11][5] ), .B(n41), .C(\regs_matrix[9][5] ), 
        .D(n667), .Y(n480) );
  OAI22X1 U597 ( .A(\regs_matrix[13][5] ), .B(n671), .C(\regs_matrix[15][5] ), 
        .D(n675), .Y(n479) );
  NAND2X1 U598 ( .A(n481), .B(n482), .Y(n473) );
  NOR2X1 U599 ( .A(n483), .B(n484), .Y(n482) );
  OAI22X1 U600 ( .A(outreg_data[5]), .B(n647), .C(\regs_matrix[2][5] ), .D(
        n653), .Y(n484) );
  OAI22X1 U601 ( .A(\regs_matrix[4][5] ), .B(n656), .C(\regs_matrix[6][5] ), 
        .D(n660), .Y(n483) );
  NOR2X1 U602 ( .A(n485), .B(n486), .Y(n481) );
  OAI22X1 U603 ( .A(\regs_matrix[3][5] ), .B(n662), .C(\regs_matrix[1][5] ), 
        .D(n666), .Y(n486) );
  OAI22X1 U604 ( .A(\regs_matrix[5][5] ), .B(n670), .C(\regs_matrix[7][5] ), 
        .D(n675), .Y(n485) );
  MUX2X1 U605 ( .B(n487), .A(n488), .S(n676), .Y(r2_data[6]) );
  NAND2X1 U606 ( .A(n489), .B(n490), .Y(n488) );
  NOR2X1 U607 ( .A(n491), .B(n492), .Y(n490) );
  OAI22X1 U608 ( .A(\regs_matrix[8][6] ), .B(n647), .C(\regs_matrix[10][6] ), 
        .D(n653), .Y(n492) );
  OAI22X1 U609 ( .A(\regs_matrix[12][6] ), .B(n656), .C(\regs_matrix[14][6] ), 
        .D(n659), .Y(n491) );
  NOR2X1 U610 ( .A(n493), .B(n494), .Y(n489) );
  OAI22X1 U611 ( .A(\regs_matrix[11][6] ), .B(n41), .C(\regs_matrix[9][6] ), 
        .D(n47), .Y(n494) );
  OAI22X1 U612 ( .A(\regs_matrix[13][6] ), .B(n671), .C(\regs_matrix[15][6] ), 
        .D(n674), .Y(n493) );
  NAND2X1 U613 ( .A(n495), .B(n496), .Y(n487) );
  NOR2X1 U614 ( .A(n497), .B(n498), .Y(n496) );
  OAI22X1 U615 ( .A(outreg_data[6]), .B(n647), .C(\regs_matrix[2][6] ), .D(
        n653), .Y(n498) );
  OAI22X1 U616 ( .A(\regs_matrix[4][6] ), .B(n656), .C(\regs_matrix[6][6] ), 
        .D(n659), .Y(n497) );
  NOR2X1 U617 ( .A(n499), .B(n500), .Y(n495) );
  OAI22X1 U618 ( .A(\regs_matrix[3][6] ), .B(n664), .C(\regs_matrix[1][6] ), 
        .D(n668), .Y(n500) );
  OAI22X1 U619 ( .A(\regs_matrix[5][6] ), .B(n671), .C(\regs_matrix[7][6] ), 
        .D(n674), .Y(n499) );
  MUX2X1 U620 ( .B(n501), .A(n502), .S(n677), .Y(r2_data[7]) );
  NAND2X1 U621 ( .A(n503), .B(n504), .Y(n502) );
  NOR2X1 U622 ( .A(n505), .B(n506), .Y(n504) );
  OAI22X1 U623 ( .A(\regs_matrix[8][7] ), .B(n647), .C(\regs_matrix[10][7] ), 
        .D(n653), .Y(n506) );
  OAI22X1 U624 ( .A(\regs_matrix[12][7] ), .B(n655), .C(\regs_matrix[14][7] ), 
        .D(n659), .Y(n505) );
  NOR2X1 U625 ( .A(n507), .B(n508), .Y(n503) );
  OAI22X1 U626 ( .A(\regs_matrix[11][7] ), .B(n662), .C(\regs_matrix[9][7] ), 
        .D(n667), .Y(n508) );
  OAI22X1 U627 ( .A(\regs_matrix[13][7] ), .B(n670), .C(\regs_matrix[15][7] ), 
        .D(n674), .Y(n507) );
  NAND2X1 U628 ( .A(n509), .B(n510), .Y(n501) );
  NOR2X1 U629 ( .A(n511), .B(n512), .Y(n510) );
  OAI22X1 U630 ( .A(outreg_data[7]), .B(n647), .C(\regs_matrix[2][7] ), .D(
        n653), .Y(n512) );
  OAI22X1 U631 ( .A(\regs_matrix[4][7] ), .B(n655), .C(\regs_matrix[6][7] ), 
        .D(n659), .Y(n511) );
  NOR2X1 U632 ( .A(n513), .B(n514), .Y(n509) );
  OAI22X1 U633 ( .A(\regs_matrix[3][7] ), .B(n663), .C(\regs_matrix[1][7] ), 
        .D(n47), .Y(n514) );
  OAI22X1 U634 ( .A(\regs_matrix[5][7] ), .B(n670), .C(\regs_matrix[7][7] ), 
        .D(n674), .Y(n513) );
  MUX2X1 U635 ( .B(n515), .A(n516), .S(n676), .Y(r2_data[8]) );
  NAND2X1 U636 ( .A(n517), .B(n518), .Y(n516) );
  NOR2X1 U637 ( .A(n519), .B(n520), .Y(n518) );
  OAI22X1 U638 ( .A(\regs_matrix[8][8] ), .B(n647), .C(\regs_matrix[10][8] ), 
        .D(n653), .Y(n520) );
  OAI22X1 U639 ( .A(\regs_matrix[12][8] ), .B(n656), .C(\regs_matrix[14][8] ), 
        .D(n659), .Y(n519) );
  NOR2X1 U640 ( .A(n521), .B(n522), .Y(n517) );
  OAI22X1 U641 ( .A(\regs_matrix[11][8] ), .B(n664), .C(\regs_matrix[9][8] ), 
        .D(n46), .Y(n522) );
  OAI22X1 U642 ( .A(\regs_matrix[13][8] ), .B(n670), .C(\regs_matrix[15][8] ), 
        .D(n674), .Y(n521) );
  NAND2X1 U643 ( .A(n523), .B(n524), .Y(n515) );
  NOR2X1 U644 ( .A(n525), .B(n526), .Y(n524) );
  OAI22X1 U645 ( .A(outreg_data[8]), .B(n647), .C(\regs_matrix[2][8] ), .D(
        n653), .Y(n526) );
  OAI22X1 U646 ( .A(\regs_matrix[4][8] ), .B(n656), .C(\regs_matrix[6][8] ), 
        .D(n659), .Y(n525) );
  NOR2X1 U647 ( .A(n527), .B(n528), .Y(n523) );
  OAI22X1 U648 ( .A(\regs_matrix[3][8] ), .B(n41), .C(\regs_matrix[1][8] ), 
        .D(n666), .Y(n528) );
  OAI22X1 U649 ( .A(\regs_matrix[5][8] ), .B(n671), .C(\regs_matrix[7][8] ), 
        .D(n674), .Y(n527) );
  MUX2X1 U650 ( .B(n529), .A(n530), .S(n677), .Y(r2_data[9]) );
  NAND2X1 U651 ( .A(n531), .B(n532), .Y(n530) );
  NOR2X1 U652 ( .A(n533), .B(n534), .Y(n532) );
  OAI22X1 U653 ( .A(\regs_matrix[8][9] ), .B(n647), .C(\regs_matrix[10][9] ), 
        .D(n653), .Y(n534) );
  OAI22X1 U654 ( .A(\regs_matrix[12][9] ), .B(n655), .C(\regs_matrix[14][9] ), 
        .D(n659), .Y(n533) );
  NOR2X1 U655 ( .A(n535), .B(n536), .Y(n531) );
  OAI22X1 U656 ( .A(\regs_matrix[11][9] ), .B(n662), .C(\regs_matrix[9][9] ), 
        .D(n46), .Y(n536) );
  OAI22X1 U657 ( .A(\regs_matrix[13][9] ), .B(n671), .C(\regs_matrix[15][9] ), 
        .D(n674), .Y(n535) );
  NAND2X1 U658 ( .A(n537), .B(n538), .Y(n529) );
  NOR2X1 U659 ( .A(n539), .B(n540), .Y(n538) );
  OAI22X1 U660 ( .A(outreg_data[9]), .B(n647), .C(\regs_matrix[2][9] ), .D(
        n653), .Y(n540) );
  OAI22X1 U661 ( .A(\regs_matrix[4][9] ), .B(n655), .C(\regs_matrix[6][9] ), 
        .D(n659), .Y(n539) );
  NOR2X1 U662 ( .A(n541), .B(n542), .Y(n537) );
  OAI22X1 U663 ( .A(\regs_matrix[3][9] ), .B(n664), .C(\regs_matrix[1][9] ), 
        .D(n47), .Y(n542) );
  OAI22X1 U664 ( .A(\regs_matrix[5][9] ), .B(n671), .C(\regs_matrix[7][9] ), 
        .D(n674), .Y(n541) );
  MUX2X1 U665 ( .B(n543), .A(n544), .S(n676), .Y(r2_data[10]) );
  NAND2X1 U666 ( .A(n545), .B(n546), .Y(n544) );
  NOR2X1 U667 ( .A(n547), .B(n548), .Y(n546) );
  OAI22X1 U668 ( .A(\regs_matrix[8][10] ), .B(n648), .C(\regs_matrix[10][10] ), 
        .D(n652), .Y(n548) );
  OAI22X1 U669 ( .A(\regs_matrix[12][10] ), .B(n656), .C(\regs_matrix[14][10] ), .D(n659), .Y(n547) );
  NOR2X1 U670 ( .A(n549), .B(n550), .Y(n545) );
  OAI22X1 U671 ( .A(\regs_matrix[11][10] ), .B(n41), .C(\regs_matrix[9][10] ), 
        .D(n666), .Y(n550) );
  OAI22X1 U672 ( .A(\regs_matrix[13][10] ), .B(n671), .C(\regs_matrix[15][10] ), .D(n674), .Y(n549) );
  NAND2X1 U673 ( .A(n551), .B(n552), .Y(n543) );
  NOR2X1 U674 ( .A(n553), .B(n554), .Y(n552) );
  OAI22X1 U675 ( .A(outreg_data[10]), .B(n648), .C(\regs_matrix[2][10] ), .D(
        n653), .Y(n554) );
  OAI22X1 U676 ( .A(\regs_matrix[4][10] ), .B(n656), .C(\regs_matrix[6][10] ), 
        .D(n659), .Y(n553) );
  NOR2X1 U677 ( .A(n555), .B(n556), .Y(n551) );
  OAI22X1 U678 ( .A(\regs_matrix[3][10] ), .B(n663), .C(\regs_matrix[1][10] ), 
        .D(n47), .Y(n556) );
  OAI22X1 U679 ( .A(\regs_matrix[5][10] ), .B(n671), .C(\regs_matrix[7][10] ), 
        .D(n674), .Y(n555) );
  MUX2X1 U680 ( .B(n557), .A(n558), .S(n677), .Y(r2_data[11]) );
  NAND2X1 U681 ( .A(n559), .B(n560), .Y(n558) );
  NOR2X1 U682 ( .A(n561), .B(n562), .Y(n560) );
  OAI22X1 U683 ( .A(\regs_matrix[8][11] ), .B(n648), .C(\regs_matrix[10][11] ), 
        .D(n653), .Y(n562) );
  OAI22X1 U684 ( .A(\regs_matrix[12][11] ), .B(n655), .C(\regs_matrix[14][11] ), .D(n659), .Y(n561) );
  NOR2X1 U685 ( .A(n563), .B(n564), .Y(n559) );
  OAI22X1 U686 ( .A(\regs_matrix[11][11] ), .B(n662), .C(\regs_matrix[9][11] ), 
        .D(n667), .Y(n564) );
  OAI22X1 U687 ( .A(\regs_matrix[13][11] ), .B(n671), .C(\regs_matrix[15][11] ), .D(n674), .Y(n563) );
  NAND2X1 U688 ( .A(n565), .B(n566), .Y(n557) );
  NOR2X1 U689 ( .A(n567), .B(n568), .Y(n566) );
  OAI22X1 U690 ( .A(outreg_data[11]), .B(n648), .C(\regs_matrix[2][11] ), .D(
        n653), .Y(n568) );
  OAI22X1 U691 ( .A(\regs_matrix[4][11] ), .B(n656), .C(\regs_matrix[6][11] ), 
        .D(n658), .Y(n567) );
  NOR2X1 U692 ( .A(n569), .B(n570), .Y(n565) );
  OAI22X1 U693 ( .A(\regs_matrix[3][11] ), .B(n662), .C(\regs_matrix[1][11] ), 
        .D(n668), .Y(n570) );
  OAI22X1 U694 ( .A(\regs_matrix[5][11] ), .B(n670), .C(\regs_matrix[7][11] ), 
        .D(n674), .Y(n569) );
  NAND2X1 U695 ( .A(n573), .B(n574), .Y(n572) );
  NOR2X1 U696 ( .A(n575), .B(n576), .Y(n574) );
  OAI22X1 U697 ( .A(\regs_matrix[8][12] ), .B(n648), .C(\regs_matrix[10][12] ), 
        .D(n653), .Y(n576) );
  OAI22X1 U698 ( .A(\regs_matrix[12][12] ), .B(n655), .C(\regs_matrix[14][12] ), .D(n658), .Y(n575) );
  NOR2X1 U699 ( .A(n577), .B(n578), .Y(n573) );
  OAI22X1 U700 ( .A(\regs_matrix[11][12] ), .B(n662), .C(\regs_matrix[9][12] ), 
        .D(n668), .Y(n578) );
  OAI22X1 U701 ( .A(\regs_matrix[13][12] ), .B(n670), .C(\regs_matrix[15][12] ), .D(n673), .Y(n577) );
  NAND2X1 U702 ( .A(n579), .B(n580), .Y(n571) );
  NOR2X1 U703 ( .A(n581), .B(n582), .Y(n580) );
  OAI22X1 U704 ( .A(outreg_data[12]), .B(n648), .C(\regs_matrix[2][12] ), .D(
        n653), .Y(n582) );
  OAI22X1 U705 ( .A(\regs_matrix[4][12] ), .B(n656), .C(\regs_matrix[6][12] ), 
        .D(n658), .Y(n581) );
  NOR2X1 U706 ( .A(n583), .B(n584), .Y(n579) );
  OAI22X1 U707 ( .A(\regs_matrix[3][12] ), .B(n663), .C(\regs_matrix[1][12] ), 
        .D(n668), .Y(n584) );
  OAI22X1 U708 ( .A(\regs_matrix[5][12] ), .B(n670), .C(\regs_matrix[7][12] ), 
        .D(n673), .Y(n583) );
  MUX2X1 U709 ( .B(n585), .A(n586), .S(n677), .Y(r2_data[13]) );
  NAND2X1 U710 ( .A(n587), .B(n588), .Y(n586) );
  NOR2X1 U711 ( .A(n589), .B(n590), .Y(n588) );
  OAI22X1 U712 ( .A(\regs_matrix[8][13] ), .B(n648), .C(\regs_matrix[10][13] ), 
        .D(n653), .Y(n590) );
  OAI22X1 U713 ( .A(\regs_matrix[12][13] ), .B(n656), .C(\regs_matrix[14][13] ), .D(n658), .Y(n589) );
  NOR2X1 U714 ( .A(n591), .B(n592), .Y(n587) );
  OAI22X1 U715 ( .A(\regs_matrix[11][13] ), .B(n662), .C(\regs_matrix[9][13] ), 
        .D(n46), .Y(n592) );
  OAI22X1 U716 ( .A(\regs_matrix[13][13] ), .B(n671), .C(\regs_matrix[15][13] ), .D(n673), .Y(n591) );
  NAND2X1 U717 ( .A(n593), .B(n594), .Y(n585) );
  NOR2X1 U718 ( .A(n595), .B(n596), .Y(n594) );
  OAI22X1 U719 ( .A(outreg_data[13]), .B(n648), .C(\regs_matrix[2][13] ), .D(
        n653), .Y(n596) );
  OAI22X1 U720 ( .A(\regs_matrix[4][13] ), .B(n656), .C(\regs_matrix[6][13] ), 
        .D(n658), .Y(n595) );
  NOR2X1 U721 ( .A(n597), .B(n598), .Y(n593) );
  OAI22X1 U722 ( .A(\regs_matrix[3][13] ), .B(n664), .C(\regs_matrix[1][13] ), 
        .D(n47), .Y(n598) );
  OAI22X1 U723 ( .A(\regs_matrix[5][13] ), .B(n670), .C(\regs_matrix[7][13] ), 
        .D(n673), .Y(n597) );
  MUX2X1 U724 ( .B(n599), .A(n600), .S(n676), .Y(r2_data[14]) );
  NAND2X1 U725 ( .A(n601), .B(n602), .Y(n600) );
  NOR2X1 U726 ( .A(n603), .B(n604), .Y(n602) );
  OAI22X1 U727 ( .A(\regs_matrix[8][14] ), .B(n648), .C(\regs_matrix[10][14] ), 
        .D(n652), .Y(n604) );
  OAI22X1 U728 ( .A(\regs_matrix[12][14] ), .B(n656), .C(\regs_matrix[14][14] ), .D(n658), .Y(n603) );
  NOR2X1 U729 ( .A(n605), .B(n606), .Y(n601) );
  OAI22X1 U730 ( .A(\regs_matrix[11][14] ), .B(n664), .C(\regs_matrix[9][14] ), 
        .D(n47), .Y(n606) );
  OAI22X1 U731 ( .A(\regs_matrix[13][14] ), .B(n670), .C(\regs_matrix[15][14] ), .D(n673), .Y(n605) );
  NAND2X1 U732 ( .A(n607), .B(n608), .Y(n599) );
  NOR2X1 U733 ( .A(n609), .B(n610), .Y(n608) );
  OAI22X1 U734 ( .A(outreg_data[14]), .B(n648), .C(\regs_matrix[2][14] ), .D(
        n653), .Y(n610) );
  OAI22X1 U735 ( .A(\regs_matrix[4][14] ), .B(n656), .C(\regs_matrix[6][14] ), 
        .D(n658), .Y(n609) );
  NOR2X1 U736 ( .A(n611), .B(n612), .Y(n607) );
  OAI22X1 U737 ( .A(\regs_matrix[3][14] ), .B(n664), .C(\regs_matrix[1][14] ), 
        .D(n667), .Y(n612) );
  OAI22X1 U738 ( .A(\regs_matrix[5][14] ), .B(n670), .C(\regs_matrix[7][14] ), 
        .D(n673), .Y(n611) );
  NOR2X1 U739 ( .A(n615), .B(n616), .Y(n614) );
  OAI22X1 U740 ( .A(\regs_matrix[8][15] ), .B(n648), .C(\regs_matrix[10][15] ), 
        .D(n653), .Y(n616) );
  OAI22X1 U741 ( .A(\regs_matrix[12][15] ), .B(n655), .C(\regs_matrix[14][15] ), .D(n658), .Y(n615) );
  NOR2X1 U742 ( .A(n617), .B(n618), .Y(n613) );
  OAI22X1 U743 ( .A(\regs_matrix[11][15] ), .B(n663), .C(\regs_matrix[9][15] ), 
        .D(n668), .Y(n618) );
  OAI22X1 U744 ( .A(\regs_matrix[13][15] ), .B(n670), .C(\regs_matrix[15][15] ), .D(n673), .Y(n617) );
  NOR2X1 U745 ( .A(n621), .B(n622), .Y(n620) );
  OAI22X1 U746 ( .A(outreg_data[15]), .B(n648), .C(\regs_matrix[2][15] ), .D(
        n653), .Y(n622) );
  OAI22X1 U747 ( .A(\regs_matrix[4][15] ), .B(n656), .C(\regs_matrix[6][15] ), 
        .D(n658), .Y(n621) );
  NOR2X1 U748 ( .A(n623), .B(n624), .Y(n619) );
  OAI22X1 U749 ( .A(\regs_matrix[3][15] ), .B(n662), .C(\regs_matrix[1][15] ), 
        .D(n668), .Y(n624) );
  OAI22X1 U750 ( .A(\regs_matrix[5][15] ), .B(n670), .C(\regs_matrix[7][15] ), 
        .D(n673), .Y(n623) );
  NOR2X1 U751 ( .A(n625), .B(n626), .Y(n390) );
  OAI21X1 U752 ( .A(\regs_matrix[6][16] ), .B(n658), .C(n627), .Y(n626) );
  AOI22X1 U753 ( .A(n651), .B(n343), .C(n645), .D(n724), .Y(n627) );
  OAI21X1 U754 ( .A(\regs_matrix[4][16] ), .B(n656), .C(n678), .Y(n625) );
  NOR2X1 U755 ( .A(n628), .B(n629), .Y(n391) );
  OAI22X1 U756 ( .A(\regs_matrix[3][16] ), .B(n664), .C(\regs_matrix[1][16] ), 
        .D(n666), .Y(n629) );
  OAI22X1 U757 ( .A(\regs_matrix[5][16] ), .B(n670), .C(\regs_matrix[7][16] ), 
        .D(n673), .Y(n628) );
  NOR2X1 U758 ( .A(n630), .B(n631), .Y(n392) );
  OAI21X1 U759 ( .A(\regs_matrix[12][16] ), .B(n655), .C(n632), .Y(n631) );
  AOI22X1 U760 ( .A(n651), .B(n633), .C(n645), .D(n634), .Y(n632) );
  INVX2 U761 ( .A(\regs_matrix[8][16] ), .Y(n634) );
  NAND3X1 U762 ( .A(n637), .B(n636), .C(n635), .Y(n401) );
  INVX2 U763 ( .A(\regs_matrix[10][16] ), .Y(n633) );
  NAND3X1 U764 ( .A(N15), .B(n636), .C(n637), .Y(n402) );
  NAND3X1 U765 ( .A(N16), .B(n635), .C(n637), .Y(n403) );
  OAI22X1 U766 ( .A(\regs_matrix[9][16] ), .B(n46), .C(\regs_matrix[14][16] ), 
        .D(n660), .Y(n630) );
  NAND3X1 U767 ( .A(N16), .B(n15), .C(n637), .Y(n404) );
  INVX2 U768 ( .A(N14), .Y(n637) );
  NAND3X1 U769 ( .A(N14), .B(n636), .C(n635), .Y(n408) );
  NOR2X1 U770 ( .A(n638), .B(n639), .Y(n393) );
  OAI21X1 U771 ( .A(\regs_matrix[11][16] ), .B(n41), .C(n676), .Y(n639) );
  NAND2X1 U772 ( .A(n640), .B(n636), .Y(n407) );
  INVX2 U773 ( .A(N16), .Y(n636) );
  OAI22X1 U774 ( .A(\regs_matrix[15][16] ), .B(n673), .C(\regs_matrix[13][16] ), .D(n671), .Y(n638) );
  NAND3X1 U775 ( .A(N16), .B(N14), .C(n635), .Y(n409) );
  NAND2X1 U776 ( .A(n640), .B(N16), .Y(n410) );
  INVX2 U777 ( .A(n641), .Y(n640) );
  NAND2X1 U778 ( .A(N15), .B(N14), .Y(n641) );
  INVX2 U779 ( .A(N15), .Y(n635) );
  INVX4 U780 ( .A(n410), .Y(n672) );
  INVX2 U781 ( .A(n401), .Y(n642) );
  INVX4 U782 ( .A(n672), .Y(n673) );
  INVX2 U783 ( .A(w_sel[3]), .Y(n733) );
  INVX2 U784 ( .A(w_en), .Y(n734) );
  INVX2 U785 ( .A(w_sel[2]), .Y(n735) );
  INVX2 U786 ( .A(w_sel[1]), .Y(n736) );
endmodule


module datapath ( clk, n_reset, op, src1, src2, dest, ext_data1, ext_data2, 
        outreg_data, overflow );
  input [2:0] op;
  input [3:0] src1;
  input [3:0] src2;
  input [3:0] dest;
  input [15:0] ext_data1;
  input [15:0] ext_data2;
  output [16:0] outreg_data;
  input clk, n_reset;
  output overflow;
  wire   w_en, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36;
  wire   [1:0] w_data_sel;
  wire   [1:0] alu_op;
  wire   [16:0] src1_data;
  wire   [16:0] src2_data;
  wire   [16:0] alu_result;
  wire   [16:0] dest_data;

  datapath_decode DEC ( .op(op), .w_en(w_en), .w_data_sel(w_data_sel), 
        .alu_op(alu_op) );
  alu CORE ( .src1_data(src1_data), .src2_data(src2_data), .alu_op(alu_op), 
        .result(alu_result), .overflow(overflow) );
  register_file RF ( .clk(clk), .n_reset(n_reset), .w_en(w_en), .r1_sel(src1), 
        .r2_sel(src2), .w_sel(dest), .w_data(dest_data), .r1_data(src1_data), 
        .r2_data(src2_data), .outreg_data(outreg_data) );
  INVX2 U2 ( .A(w_data_sel[1]), .Y(n36) );
  AND2X2 U3 ( .A(w_data_sel[0]), .B(n36), .Y(n1) );
  AND2X2 U4 ( .A(n36), .B(n3), .Y(n2) );
  AND2X2 U5 ( .A(alu_result[16]), .B(w_data_sel[1]), .Y(dest_data[16]) );
  INVX2 U6 ( .A(alu_result[15]), .Y(n5) );
  INVX2 U7 ( .A(w_data_sel[0]), .Y(n3) );
  AOI22X1 U8 ( .A(ext_data2[15]), .B(n1), .C(ext_data1[15]), .D(n2), .Y(n4) );
  OAI21X1 U9 ( .A(n36), .B(n5), .C(n4), .Y(dest_data[15]) );
  INVX2 U10 ( .A(alu_result[14]), .Y(n7) );
  AOI22X1 U11 ( .A(ext_data2[14]), .B(n1), .C(ext_data1[14]), .D(n2), .Y(n6)
         );
  OAI21X1 U12 ( .A(n36), .B(n7), .C(n6), .Y(dest_data[14]) );
  INVX2 U13 ( .A(alu_result[13]), .Y(n9) );
  AOI22X1 U14 ( .A(ext_data2[13]), .B(n1), .C(ext_data1[13]), .D(n2), .Y(n8)
         );
  OAI21X1 U15 ( .A(n36), .B(n9), .C(n8), .Y(dest_data[13]) );
  INVX2 U16 ( .A(alu_result[12]), .Y(n11) );
  AOI22X1 U17 ( .A(ext_data2[12]), .B(n1), .C(ext_data1[12]), .D(n2), .Y(n10)
         );
  OAI21X1 U18 ( .A(n36), .B(n11), .C(n10), .Y(dest_data[12]) );
  INVX2 U19 ( .A(alu_result[11]), .Y(n13) );
  AOI22X1 U20 ( .A(ext_data2[11]), .B(n1), .C(ext_data1[11]), .D(n2), .Y(n12)
         );
  OAI21X1 U21 ( .A(n36), .B(n13), .C(n12), .Y(dest_data[11]) );
  INVX2 U22 ( .A(alu_result[10]), .Y(n15) );
  AOI22X1 U23 ( .A(ext_data2[10]), .B(n1), .C(ext_data1[10]), .D(n2), .Y(n14)
         );
  OAI21X1 U24 ( .A(n36), .B(n15), .C(n14), .Y(dest_data[10]) );
  INVX2 U25 ( .A(alu_result[9]), .Y(n17) );
  AOI22X1 U26 ( .A(ext_data2[9]), .B(n1), .C(ext_data1[9]), .D(n2), .Y(n16) );
  OAI21X1 U27 ( .A(n36), .B(n17), .C(n16), .Y(dest_data[9]) );
  INVX2 U28 ( .A(alu_result[8]), .Y(n19) );
  AOI22X1 U29 ( .A(ext_data2[8]), .B(n1), .C(ext_data1[8]), .D(n2), .Y(n18) );
  OAI21X1 U30 ( .A(n36), .B(n19), .C(n18), .Y(dest_data[8]) );
  INVX2 U31 ( .A(alu_result[7]), .Y(n21) );
  AOI22X1 U32 ( .A(ext_data2[7]), .B(n1), .C(ext_data1[7]), .D(n2), .Y(n20) );
  OAI21X1 U33 ( .A(n36), .B(n21), .C(n20), .Y(dest_data[7]) );
  INVX2 U34 ( .A(alu_result[6]), .Y(n23) );
  AOI22X1 U35 ( .A(ext_data2[6]), .B(n1), .C(ext_data1[6]), .D(n2), .Y(n22) );
  OAI21X1 U36 ( .A(n36), .B(n23), .C(n22), .Y(dest_data[6]) );
  INVX2 U37 ( .A(alu_result[5]), .Y(n25) );
  AOI22X1 U38 ( .A(ext_data2[5]), .B(n1), .C(ext_data1[5]), .D(n2), .Y(n24) );
  OAI21X1 U39 ( .A(n36), .B(n25), .C(n24), .Y(dest_data[5]) );
  INVX2 U40 ( .A(alu_result[4]), .Y(n27) );
  AOI22X1 U41 ( .A(ext_data2[4]), .B(n1), .C(ext_data1[4]), .D(n2), .Y(n26) );
  OAI21X1 U42 ( .A(n36), .B(n27), .C(n26), .Y(dest_data[4]) );
  INVX2 U43 ( .A(alu_result[3]), .Y(n29) );
  AOI22X1 U44 ( .A(ext_data2[3]), .B(n1), .C(ext_data1[3]), .D(n2), .Y(n28) );
  OAI21X1 U45 ( .A(n36), .B(n29), .C(n28), .Y(dest_data[3]) );
  INVX2 U46 ( .A(alu_result[2]), .Y(n31) );
  AOI22X1 U47 ( .A(ext_data2[2]), .B(n1), .C(ext_data1[2]), .D(n2), .Y(n30) );
  OAI21X1 U48 ( .A(n36), .B(n31), .C(n30), .Y(dest_data[2]) );
  INVX2 U49 ( .A(alu_result[1]), .Y(n33) );
  AOI22X1 U50 ( .A(ext_data2[1]), .B(n1), .C(ext_data1[1]), .D(n2), .Y(n32) );
  OAI21X1 U51 ( .A(n36), .B(n33), .C(n32), .Y(dest_data[1]) );
  INVX2 U52 ( .A(alu_result[0]), .Y(n35) );
  AOI22X1 U53 ( .A(ext_data2[0]), .B(n1), .C(ext_data1[0]), .D(n2), .Y(n34) );
  OAI21X1 U54 ( .A(n36), .B(n35), .C(n34), .Y(dest_data[0]) );
endmodule


module magnitude_DW01_inc_0 ( A, SUM );
  input [15:0] A;
  output [15:0] SUM;

  wire   [15:2] carry;

  HAX1 U1_1_14 ( .A(A[14]), .B(carry[14]), .YC(carry[15]), .YS(SUM[14]) );
  HAX1 U1_1_13 ( .A(A[13]), .B(carry[13]), .YC(carry[14]), .YS(SUM[13]) );
  HAX1 U1_1_12 ( .A(A[12]), .B(carry[12]), .YC(carry[13]), .YS(SUM[12]) );
  HAX1 U1_1_11 ( .A(A[11]), .B(carry[11]), .YC(carry[12]), .YS(SUM[11]) );
  HAX1 U1_1_10 ( .A(A[10]), .B(carry[10]), .YC(carry[11]), .YS(SUM[10]) );
  HAX1 U1_1_9 ( .A(A[9]), .B(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[15]), .B(A[15]), .Y(SUM[15]) );
endmodule


module magnitude ( in, out );
  input [16:0] in;
  output [15:0] out;
  wire   N18, N19, N20, N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31,
         N32, N33, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n33, n34;

  OAI21X1 U18 ( .A(n1), .B(n9), .C(n17), .Y(out[9]) );
  NAND2X1 U19 ( .A(in[16]), .B(N27), .Y(n17) );
  OAI21X1 U20 ( .A(n1), .B(n10), .C(n18), .Y(out[8]) );
  NAND2X1 U21 ( .A(N26), .B(in[16]), .Y(n18) );
  OAI21X1 U22 ( .A(n1), .B(n11), .C(n19), .Y(out[7]) );
  NAND2X1 U23 ( .A(N25), .B(in[16]), .Y(n19) );
  OAI21X1 U24 ( .A(n1), .B(n12), .C(n20), .Y(out[6]) );
  NAND2X1 U25 ( .A(N24), .B(in[16]), .Y(n20) );
  OAI21X1 U26 ( .A(n1), .B(n13), .C(n21), .Y(out[5]) );
  NAND2X1 U27 ( .A(N23), .B(in[16]), .Y(n21) );
  OAI21X1 U28 ( .A(n1), .B(n14), .C(n22), .Y(out[4]) );
  NAND2X1 U29 ( .A(N22), .B(in[16]), .Y(n22) );
  OAI21X1 U30 ( .A(n1), .B(n15), .C(n23), .Y(out[3]) );
  NAND2X1 U31 ( .A(N21), .B(in[16]), .Y(n23) );
  OAI21X1 U32 ( .A(n1), .B(n16), .C(n24), .Y(out[2]) );
  NAND2X1 U33 ( .A(N20), .B(n1), .Y(n24) );
  OAI21X1 U34 ( .A(n1), .B(n33), .C(n25), .Y(out[1]) );
  NAND2X1 U35 ( .A(N19), .B(n1), .Y(n25) );
  OAI21X1 U36 ( .A(n1), .B(n3), .C(n26), .Y(out[15]) );
  NAND2X1 U37 ( .A(N33), .B(in[16]), .Y(n26) );
  OAI21X1 U38 ( .A(n1), .B(n4), .C(n27), .Y(out[14]) );
  NAND2X1 U39 ( .A(N32), .B(n1), .Y(n27) );
  OAI21X1 U40 ( .A(n1), .B(n5), .C(n28), .Y(out[13]) );
  NAND2X1 U41 ( .A(N31), .B(in[16]), .Y(n28) );
  OAI21X1 U42 ( .A(n1), .B(n6), .C(n29), .Y(out[12]) );
  NAND2X1 U43 ( .A(N30), .B(in[16]), .Y(n29) );
  OAI21X1 U44 ( .A(in[16]), .B(n7), .C(n30), .Y(out[11]) );
  NAND2X1 U45 ( .A(N29), .B(in[16]), .Y(n30) );
  OAI21X1 U46 ( .A(in[16]), .B(n8), .C(n31), .Y(out[10]) );
  NAND2X1 U47 ( .A(N28), .B(in[16]), .Y(n31) );
  OAI21X1 U48 ( .A(in[16]), .B(n34), .C(n32), .Y(out[0]) );
  NAND2X1 U49 ( .A(N18), .B(in[16]), .Y(n32) );
  magnitude_DW01_inc_0 add_12 ( .A({n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, 
        n13, n14, n15, n16, n33, n34}), .SUM({N33, N32, N31, N30, N29, N28, 
        N27, N26, N25, N24, N23, N22, N21, N20, N19, N18}) );
  INVX2 U2 ( .A(n2), .Y(n1) );
  INVX2 U3 ( .A(in[16]), .Y(n2) );
  INVX2 U4 ( .A(in[15]), .Y(n3) );
  INVX2 U5 ( .A(in[14]), .Y(n4) );
  INVX2 U6 ( .A(in[13]), .Y(n5) );
  INVX2 U7 ( .A(in[12]), .Y(n6) );
  INVX2 U8 ( .A(in[11]), .Y(n7) );
  INVX2 U9 ( .A(in[10]), .Y(n8) );
  INVX2 U10 ( .A(in[9]), .Y(n9) );
  INVX2 U11 ( .A(in[8]), .Y(n10) );
  INVX2 U12 ( .A(in[7]), .Y(n11) );
  INVX2 U13 ( .A(in[6]), .Y(n12) );
  INVX2 U14 ( .A(in[5]), .Y(n13) );
  INVX2 U15 ( .A(in[4]), .Y(n14) );
  INVX2 U16 ( .A(in[3]), .Y(n15) );
  INVX2 U17 ( .A(in[2]), .Y(n16) );
  INVX2 U50 ( .A(in[1]), .Y(n33) );
  INVX2 U51 ( .A(in[0]), .Y(n34) );
endmodule


module fir_filter ( clk, n_reset, sample_data, fir_coefficient, data_ready, 
        load_coeff, one_k_samples, modwait, err, fir_out );
  input [15:0] sample_data;
  input [15:0] fir_coefficient;
  output [15:0] fir_out;
  input clk, n_reset, data_ready, load_coeff;
  output one_k_samples, modwait, err;
  wire   dr, lc, overflow, cnt_up, clear;
  wire   [2:0] op;
  wire   [3:0] src1;
  wire   [3:0] src2;
  wire   [3:0] dest;
  wire   [16:0] reg_out;
  wire   SYNOPSYS_UNCONNECTED__0;

  sync_low_1 sync_dr ( .clk(clk), .n_rst(n_reset), .async_in(data_ready), 
        .sync_out(dr), .Port5(1'b0) );
  sync_low_0 sync_lc ( .clk(clk), .n_rst(n_reset), .async_in(load_coeff), 
        .sync_out(lc), .Port5(1'b0) );
  controller CU ( .clk(clk), .n_rst(n_reset), .dr(dr), .lc(lc), .overflow(
        overflow), .cnt_up(cnt_up), .clear(clear), .modwait(modwait), .err(err), .op(op), .src1({SYNOPSYS_UNCONNECTED__0, src1[2:0]}), .src2(src2), .dest(
        dest) );
  counter cnt ( .clk(clk), .n_rst(n_reset), .cnt_up(cnt_up), .clear(clear), 
        .one_k_samples(one_k_samples) );
  datapath dp ( .clk(clk), .n_reset(n_reset), .op(op), .src1({1'b0, src1[2:0]}), .src2(src2), .dest(dest), .ext_data1(sample_data), .ext_data2(
        fir_coefficient), .outreg_data(reg_out), .overflow(overflow) );
  magnitude mag ( .in(reg_out), .out(fir_out) );
endmodule

