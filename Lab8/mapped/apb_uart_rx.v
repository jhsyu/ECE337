/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Fri Oct 23 22:55:28 2020
/////////////////////////////////////////////////////////////


module apb_slave ( clk, n_rst, rx_data, data_ready, overrun_error, 
        framing_error, data_read, psel, penable, pwrite, paddr, prdata, pwdata, 
        pslverr, data_size, bit_period );
  input [7:0] rx_data;
  input [2:0] paddr;
  output [7:0] prdata;
  input [7:0] pwdata;
  output [3:0] data_size;
  output [13:0] bit_period;
  input clk, n_rst, data_ready, overrun_error, framing_error, psel, penable,
         pwrite;
  output data_read, pslverr;
  wire   N19, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n154, n156, n158, n160, n162, n164,
         n166, n168, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109,
         n110, n111;
  wire   [7:6] bit_period_reg1;
  wire   [7:0] next_bit_period_reg0;
  wire   [7:0] next_bit_period_reg1;
  wire   [7:0] next_data_size_reg;
  wire   [7:0] data_buffer_reg;
  assign data_read = N19;

  DFFSR \data_buffer_reg_reg[7]  ( .D(n168), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buffer_reg[7]) );
  DFFSR \data_buffer_reg_reg[6]  ( .D(n166), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buffer_reg[6]) );
  DFFSR \data_buffer_reg_reg[5]  ( .D(n164), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buffer_reg[5]) );
  DFFSR \data_buffer_reg_reg[4]  ( .D(n162), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buffer_reg[4]) );
  DFFSR \data_buffer_reg_reg[3]  ( .D(n160), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buffer_reg[3]) );
  DFFSR \data_buffer_reg_reg[2]  ( .D(n158), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buffer_reg[2]) );
  DFFSR \data_buffer_reg_reg[1]  ( .D(n156), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buffer_reg[1]) );
  DFFSR \data_buffer_reg_reg[0]  ( .D(n154), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buffer_reg[0]) );
  DFFSR \data_size_reg_reg[3]  ( .D(n106), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[3]) );
  DFFSR \data_size_reg_reg[2]  ( .D(n107), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[2]) );
  DFFSR \data_size_reg_reg[1]  ( .D(next_data_size_reg[1]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(data_size[1]) );
  DFFSR \data_size_reg_reg[0]  ( .D(next_data_size_reg[0]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(data_size[0]) );
  DFFSR \bit_period_reg0_reg[7]  ( .D(next_bit_period_reg0[7]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period[7]) );
  DFFSR \bit_period_reg0_reg[6]  ( .D(next_bit_period_reg0[6]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period[6]) );
  DFFSR \bit_period_reg0_reg[5]  ( .D(next_bit_period_reg0[5]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period[5]) );
  DFFSR \bit_period_reg0_reg[4]  ( .D(next_bit_period_reg0[4]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period[4]) );
  DFFSR \bit_period_reg0_reg[3]  ( .D(n108), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[3]) );
  DFFSR \bit_period_reg0_reg[2]  ( .D(n109), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[2]) );
  DFFSR \bit_period_reg0_reg[1]  ( .D(next_bit_period_reg0[1]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period[1]) );
  DFFSR \bit_period_reg0_reg[0]  ( .D(next_bit_period_reg0[0]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period[0]) );
  DFFSR \bit_period_reg1_reg[7]  ( .D(next_bit_period_reg1[7]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period_reg1[7]) );
  DFFSR \bit_period_reg1_reg[6]  ( .D(next_bit_period_reg1[6]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period_reg1[6]) );
  DFFSR \bit_period_reg1_reg[5]  ( .D(next_bit_period_reg1[5]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period[13]) );
  DFFSR \bit_period_reg1_reg[4]  ( .D(next_bit_period_reg1[4]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period[12]) );
  DFFSR \bit_period_reg1_reg[3]  ( .D(n110), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[11]) );
  DFFSR \bit_period_reg1_reg[2]  ( .D(n111), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[10]) );
  DFFSR \bit_period_reg1_reg[1]  ( .D(next_bit_period_reg1[1]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period[9]) );
  DFFSR \bit_period_reg1_reg[0]  ( .D(next_bit_period_reg1[0]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period[8]) );
  DFFSR \prdata_reg[7]  ( .D(1'b0), .CLK(clk), .R(n131), .S(n132), .Q(
        prdata[7]) );
  DFFSR \prdata_reg[6]  ( .D(1'b0), .CLK(clk), .R(n129), .S(n130), .Q(
        prdata[6]) );
  DFFSR \prdata_reg[5]  ( .D(1'b0), .CLK(clk), .R(n127), .S(n128), .Q(
        prdata[5]) );
  DFFSR \prdata_reg[4]  ( .D(1'b0), .CLK(clk), .R(n125), .S(n126), .Q(
        prdata[4]) );
  DFFSR \prdata_reg[3]  ( .D(1'b0), .CLK(clk), .R(n123), .S(n124), .Q(
        prdata[3]) );
  DFFSR \prdata_reg[2]  ( .D(1'b0), .CLK(clk), .R(n121), .S(n122), .Q(
        prdata[2]) );
  DFFSR \prdata_reg[1]  ( .D(1'b0), .CLK(clk), .R(n119), .S(n120), .Q(
        prdata[1]) );
  DFFSR \prdata_reg[0]  ( .D(1'b0), .CLK(clk), .R(n117), .S(n118), .Q(
        prdata[0]) );
  OAI21X1 U3 ( .A(n1), .B(n2), .C(n3), .Y(pslverr) );
  NAND3X1 U4 ( .A(n4), .B(n5), .C(paddr[2]), .Y(n3) );
  INVX1 U5 ( .A(n6), .Y(n1) );
  MUX2X1 U6 ( .B(n7), .A(n8), .S(n9), .Y(next_data_size_reg[1]) );
  MUX2X1 U7 ( .B(n10), .A(n11), .S(n9), .Y(next_data_size_reg[0]) );
  MUX2X1 U8 ( .B(n12), .A(n13), .S(n14), .Y(next_bit_period_reg1[7]) );
  INVX1 U9 ( .A(bit_period_reg1[7]), .Y(n13) );
  MUX2X1 U10 ( .B(n15), .A(n16), .S(n14), .Y(next_bit_period_reg1[6]) );
  INVX1 U11 ( .A(bit_period_reg1[6]), .Y(n16) );
  MUX2X1 U12 ( .B(n17), .A(n18), .S(n14), .Y(next_bit_period_reg1[5]) );
  INVX1 U13 ( .A(bit_period[13]), .Y(n18) );
  MUX2X1 U14 ( .B(n19), .A(n20), .S(n14), .Y(next_bit_period_reg1[4]) );
  INVX1 U15 ( .A(bit_period[12]), .Y(n20) );
  MUX2X1 U16 ( .B(n8), .A(n21), .S(n14), .Y(next_bit_period_reg1[1]) );
  INVX1 U17 ( .A(bit_period[9]), .Y(n21) );
  MUX2X1 U18 ( .B(n11), .A(n22), .S(n14), .Y(next_bit_period_reg1[0]) );
  INVX1 U19 ( .A(bit_period[8]), .Y(n22) );
  MUX2X1 U20 ( .B(n12), .A(n23), .S(n24), .Y(next_bit_period_reg0[7]) );
  INVX1 U21 ( .A(pwdata[7]), .Y(n12) );
  MUX2X1 U22 ( .B(n15), .A(n25), .S(n24), .Y(next_bit_period_reg0[6]) );
  INVX1 U23 ( .A(pwdata[6]), .Y(n15) );
  MUX2X1 U24 ( .B(n17), .A(n26), .S(n24), .Y(next_bit_period_reg0[5]) );
  INVX1 U25 ( .A(pwdata[5]), .Y(n17) );
  MUX2X1 U26 ( .B(n19), .A(n27), .S(n24), .Y(next_bit_period_reg0[4]) );
  INVX1 U27 ( .A(pwdata[4]), .Y(n19) );
  MUX2X1 U28 ( .B(n8), .A(n28), .S(n24), .Y(next_bit_period_reg0[1]) );
  INVX1 U29 ( .A(bit_period[1]), .Y(n28) );
  INVX1 U30 ( .A(pwdata[1]), .Y(n8) );
  MUX2X1 U31 ( .B(n11), .A(n29), .S(n24), .Y(next_bit_period_reg0[0]) );
  INVX1 U32 ( .A(bit_period[0]), .Y(n29) );
  INVX1 U33 ( .A(pwdata[0]), .Y(n11) );
  INVX1 U34 ( .A(n30), .Y(n106) );
  MUX2X1 U35 ( .B(data_size[3]), .A(pwdata[3]), .S(n9), .Y(n30) );
  INVX1 U36 ( .A(n31), .Y(n107) );
  MUX2X1 U37 ( .B(data_size[2]), .A(pwdata[2]), .S(n9), .Y(n31) );
  AND2X1 U38 ( .A(n32), .B(paddr[2]), .Y(n9) );
  INVX1 U39 ( .A(n33), .Y(n108) );
  MUX2X1 U40 ( .B(pwdata[3]), .A(bit_period[3]), .S(n24), .Y(n33) );
  INVX1 U41 ( .A(n34), .Y(n109) );
  MUX2X1 U42 ( .B(pwdata[2]), .A(bit_period[2]), .S(n24), .Y(n34) );
  NAND3X1 U43 ( .A(paddr[1]), .B(n14), .C(n32), .Y(n24) );
  INVX1 U44 ( .A(n35), .Y(n110) );
  MUX2X1 U45 ( .B(pwdata[3]), .A(bit_period[11]), .S(n14), .Y(n35) );
  INVX1 U46 ( .A(n36), .Y(n111) );
  MUX2X1 U47 ( .B(pwdata[2]), .A(bit_period[10]), .S(n14), .Y(n36) );
  NAND2X1 U48 ( .A(n32), .B(paddr[0]), .Y(n14) );
  NOR2X1 U49 ( .A(n2), .B(n6), .Y(n32) );
  MUX2X1 U50 ( .B(n37), .A(n38), .S(n39), .Y(n6) );
  NOR2X1 U51 ( .A(paddr[0]), .B(n37), .Y(n38) );
  NAND3X1 U52 ( .A(penable), .B(psel), .C(pwrite), .Y(n2) );
  INVX1 U53 ( .A(n40), .Y(n168) );
  MUX2X1 U54 ( .B(data_buffer_reg[7]), .A(rx_data[7]), .S(data_ready), .Y(n40)
         );
  INVX1 U55 ( .A(n41), .Y(n166) );
  MUX2X1 U56 ( .B(data_buffer_reg[6]), .A(rx_data[6]), .S(data_ready), .Y(n41)
         );
  INVX1 U57 ( .A(n42), .Y(n164) );
  MUX2X1 U58 ( .B(data_buffer_reg[5]), .A(rx_data[5]), .S(data_ready), .Y(n42)
         );
  INVX1 U59 ( .A(n43), .Y(n162) );
  MUX2X1 U60 ( .B(data_buffer_reg[4]), .A(rx_data[4]), .S(data_ready), .Y(n43)
         );
  INVX1 U61 ( .A(n44), .Y(n160) );
  MUX2X1 U62 ( .B(data_buffer_reg[3]), .A(rx_data[3]), .S(data_ready), .Y(n44)
         );
  INVX1 U63 ( .A(n45), .Y(n158) );
  MUX2X1 U64 ( .B(data_buffer_reg[2]), .A(rx_data[2]), .S(data_ready), .Y(n45)
         );
  INVX1 U65 ( .A(n46), .Y(n156) );
  MUX2X1 U66 ( .B(data_buffer_reg[1]), .A(rx_data[1]), .S(data_ready), .Y(n46)
         );
  INVX1 U67 ( .A(n47), .Y(n154) );
  MUX2X1 U68 ( .B(data_buffer_reg[0]), .A(rx_data[0]), .S(data_ready), .Y(n47)
         );
  NAND2X1 U69 ( .A(n48), .B(n49), .Y(n132) );
  OAI21X1 U70 ( .A(n50), .B(n51), .C(n52), .Y(n131) );
  INVX1 U71 ( .A(n49), .Y(n50) );
  OAI21X1 U72 ( .A(n23), .B(n53), .C(n54), .Y(n49) );
  AOI22X1 U73 ( .A(n55), .B(data_buffer_reg[7]), .C(n56), .D(
        bit_period_reg1[7]), .Y(n54) );
  INVX1 U74 ( .A(bit_period[7]), .Y(n23) );
  NAND2X1 U75 ( .A(n48), .B(n57), .Y(n130) );
  OAI21X1 U76 ( .A(n58), .B(n51), .C(n52), .Y(n129) );
  INVX1 U77 ( .A(n57), .Y(n58) );
  OAI21X1 U78 ( .A(n25), .B(n53), .C(n59), .Y(n57) );
  AOI22X1 U79 ( .A(n55), .B(data_buffer_reg[6]), .C(n56), .D(
        bit_period_reg1[6]), .Y(n59) );
  INVX1 U80 ( .A(bit_period[6]), .Y(n25) );
  NAND2X1 U81 ( .A(n48), .B(n60), .Y(n128) );
  OAI21X1 U82 ( .A(n61), .B(n51), .C(n52), .Y(n127) );
  INVX1 U83 ( .A(n60), .Y(n61) );
  OAI21X1 U84 ( .A(n26), .B(n53), .C(n62), .Y(n60) );
  AOI22X1 U85 ( .A(n55), .B(data_buffer_reg[5]), .C(n56), .D(bit_period[13]), 
        .Y(n62) );
  INVX1 U86 ( .A(bit_period[5]), .Y(n26) );
  NAND2X1 U87 ( .A(n48), .B(n63), .Y(n126) );
  OAI21X1 U88 ( .A(n64), .B(n51), .C(n52), .Y(n125) );
  INVX1 U89 ( .A(n63), .Y(n64) );
  OAI21X1 U90 ( .A(n27), .B(n53), .C(n65), .Y(n63) );
  AOI22X1 U91 ( .A(n55), .B(data_buffer_reg[4]), .C(n56), .D(bit_period[12]), 
        .Y(n65) );
  INVX1 U92 ( .A(bit_period[4]), .Y(n27) );
  NAND2X1 U93 ( .A(n48), .B(n66), .Y(n124) );
  OAI21X1 U94 ( .A(n67), .B(n51), .C(n52), .Y(n123) );
  INVX1 U95 ( .A(n66), .Y(n67) );
  NAND2X1 U96 ( .A(n68), .B(n69), .Y(n66) );
  AOI22X1 U97 ( .A(n70), .B(data_size[3]), .C(n55), .D(data_buffer_reg[3]), 
        .Y(n69) );
  AOI22X1 U98 ( .A(n56), .B(bit_period[11]), .C(n71), .D(bit_period[3]), .Y(
        n68) );
  NAND2X1 U99 ( .A(n48), .B(n72), .Y(n122) );
  OAI21X1 U100 ( .A(n73), .B(n51), .C(n52), .Y(n121) );
  INVX1 U101 ( .A(n72), .Y(n73) );
  NAND2X1 U102 ( .A(n74), .B(n75), .Y(n72) );
  AOI22X1 U103 ( .A(n70), .B(data_size[2]), .C(n55), .D(data_buffer_reg[2]), 
        .Y(n75) );
  INVX1 U104 ( .A(n76), .Y(n70) );
  AOI22X1 U105 ( .A(n56), .B(bit_period[10]), .C(n71), .D(bit_period[2]), .Y(
        n74) );
  NAND2X1 U106 ( .A(n48), .B(n77), .Y(n120) );
  OAI21X1 U107 ( .A(n78), .B(n51), .C(n52), .Y(n119) );
  INVX1 U108 ( .A(n77), .Y(n78) );
  NAND2X1 U109 ( .A(n79), .B(n80), .Y(n77) );
  AOI21X1 U110 ( .A(n55), .B(data_buffer_reg[1]), .C(n81), .Y(n80) );
  OAI22X1 U111 ( .A(n7), .B(n76), .C(n82), .D(n83), .Y(n81) );
  NAND2X1 U112 ( .A(overrun_error), .B(n84), .Y(n83) );
  NAND3X1 U113 ( .A(n85), .B(n86), .C(n87), .Y(n82) );
  INVX1 U114 ( .A(framing_error), .Y(n86) );
  INVX1 U115 ( .A(data_size[1]), .Y(n7) );
  AOI22X1 U116 ( .A(n56), .B(bit_period[9]), .C(n71), .D(bit_period[1]), .Y(
        n79) );
  NAND3X1 U117 ( .A(penable), .B(n88), .C(n48), .Y(n118) );
  NOR2X1 U118 ( .A(n51), .B(n89), .Y(n48) );
  OAI21X1 U119 ( .A(n51), .B(n90), .C(n52), .Y(n117) );
  NAND2X1 U120 ( .A(n89), .B(n_rst), .Y(n52) );
  NOR2X1 U121 ( .A(n91), .B(penable), .Y(n89) );
  NAND2X1 U122 ( .A(penable), .B(n88), .Y(n90) );
  NAND2X1 U123 ( .A(n92), .B(n93), .Y(n88) );
  AOI21X1 U124 ( .A(n55), .B(data_buffer_reg[0]), .C(n94), .Y(n93) );
  OAI21X1 U125 ( .A(n10), .B(n76), .C(n95), .Y(n94) );
  NAND3X1 U126 ( .A(n87), .B(n85), .C(n96), .Y(n95) );
  INVX1 U127 ( .A(n97), .Y(n96) );
  MUX2X1 U128 ( .B(framing_error), .A(data_ready), .S(n98), .Y(n97) );
  NAND3X1 U129 ( .A(n87), .B(n98), .C(n99), .Y(n76) );
  INVX1 U130 ( .A(n85), .Y(n99) );
  INVX1 U131 ( .A(data_size[0]), .Y(n10) );
  NOR2X1 U132 ( .A(n85), .B(n87), .Y(n55) );
  AOI22X1 U133 ( .A(n56), .B(bit_period[8]), .C(n71), .D(bit_period[0]), .Y(
        n92) );
  INVX1 U134 ( .A(n53), .Y(n71) );
  NAND3X1 U135 ( .A(n98), .B(n85), .C(n100), .Y(n53) );
  NAND3X1 U136 ( .A(n4), .B(n101), .C(paddr[2]), .Y(n85) );
  INVX1 U137 ( .A(n5), .Y(n101) );
  NOR2X1 U138 ( .A(n39), .B(n102), .Y(n5) );
  NOR2X1 U139 ( .A(n98), .B(n87), .Y(n56) );
  INVX1 U140 ( .A(n100), .Y(n87) );
  NOR2X1 U141 ( .A(n103), .B(n104), .Y(n100) );
  OAI21X1 U142 ( .A(n102), .B(n37), .C(paddr[1]), .Y(n104) );
  INVX1 U143 ( .A(paddr[0]), .Y(n102) );
  INVX1 U144 ( .A(n84), .Y(n98) );
  NOR2X1 U145 ( .A(n103), .B(n105), .Y(n84) );
  OAI21X1 U146 ( .A(n39), .B(n37), .C(paddr[0]), .Y(n105) );
  INVX1 U147 ( .A(paddr[2]), .Y(n37) );
  INVX1 U148 ( .A(paddr[1]), .Y(n39) );
  INVX1 U149 ( .A(n4), .Y(n103) );
  INVX1 U150 ( .A(n_rst), .Y(n51) );
  AND2X1 U151 ( .A(n4), .B(penable), .Y(N19) );
  NOR2X1 U152 ( .A(n91), .B(pwrite), .Y(n4) );
  INVX1 U153 ( .A(psel), .Y(n91) );
endmodule


module start_bit_det ( clk, n_rst, serial_in, start_bit_detected, 
        new_package_detected );
  input clk, n_rst, serial_in;
  output start_bit_detected, new_package_detected;
  wire   start_bit_detected, old_sample, new_sample, sync_phase, n4;
  assign new_package_detected = start_bit_detected;

  DFFSR sync_phase_reg ( .D(serial_in), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        sync_phase) );
  DFFSR new_sample_reg ( .D(sync_phase), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        new_sample) );
  DFFSR old_sample_reg ( .D(new_sample), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        old_sample) );
  NOR2X1 U6 ( .A(new_sample), .B(n4), .Y(start_bit_detected) );
  INVX1 U7 ( .A(old_sample), .Y(n4) );
endmodule


module flex_stp_sr_9_0 ( clk, n_rst, shift_enable, serial_in, parallel_out );
  output [8:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n13, n15, n17, n19, n21, n23, n25, n27, n29, n1, n2, n3, n4, n5, n6,
         n7, n8, n9;

  DFFSR \parallel_out_reg[8]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[8]) );
  DFFSR \parallel_out_reg[7]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[7]) );
  DFFSR \parallel_out_reg[6]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[6]) );
  DFFSR \parallel_out_reg[5]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[5]) );
  DFFSR \parallel_out_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[4]) );
  DFFSR \parallel_out_reg[3]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[3]) );
  DFFSR \parallel_out_reg[2]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[2]) );
  DFFSR \parallel_out_reg[1]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[1]) );
  DFFSR \parallel_out_reg[0]  ( .D(n13), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        parallel_out[0]) );
  INVX1 U2 ( .A(n1), .Y(n29) );
  MUX2X1 U3 ( .B(parallel_out[8]), .A(serial_in), .S(shift_enable), .Y(n1) );
  INVX1 U4 ( .A(n2), .Y(n27) );
  MUX2X1 U5 ( .B(parallel_out[7]), .A(parallel_out[8]), .S(shift_enable), .Y(
        n2) );
  INVX1 U6 ( .A(n3), .Y(n25) );
  MUX2X1 U7 ( .B(parallel_out[6]), .A(parallel_out[7]), .S(shift_enable), .Y(
        n3) );
  INVX1 U8 ( .A(n4), .Y(n23) );
  MUX2X1 U9 ( .B(parallel_out[5]), .A(parallel_out[6]), .S(shift_enable), .Y(
        n4) );
  INVX1 U10 ( .A(n5), .Y(n21) );
  MUX2X1 U11 ( .B(parallel_out[4]), .A(parallel_out[5]), .S(shift_enable), .Y(
        n5) );
  INVX1 U12 ( .A(n6), .Y(n19) );
  MUX2X1 U13 ( .B(parallel_out[3]), .A(parallel_out[4]), .S(shift_enable), .Y(
        n6) );
  INVX1 U14 ( .A(n7), .Y(n17) );
  MUX2X1 U15 ( .B(parallel_out[2]), .A(parallel_out[3]), .S(shift_enable), .Y(
        n7) );
  INVX1 U16 ( .A(n8), .Y(n15) );
  MUX2X1 U17 ( .B(parallel_out[1]), .A(parallel_out[2]), .S(shift_enable), .Y(
        n8) );
  INVX1 U18 ( .A(n9), .Y(n13) );
  MUX2X1 U19 ( .B(parallel_out[0]), .A(parallel_out[1]), .S(shift_enable), .Y(
        n9) );
endmodule


module sr_9bit ( clk, n_rst, shift_strobe, serial_in, packet_data, stop_bit );
  output [7:0] packet_data;
  input clk, n_rst, shift_strobe, serial_in;
  output stop_bit;


  flex_stp_sr_9_0 sr0 ( .clk(clk), .n_rst(n_rst), .shift_enable(shift_strobe), 
        .serial_in(serial_in), .parallel_out({stop_bit, packet_data}) );
endmodule


module rcu ( clk, n_rst, start_bit_detected, packet_done, framing_error, 
        sbc_clear, sbc_enable, load_buffer, enable_timer );
  input clk, n_rst, start_bit_detected, packet_done, framing_error;
  output sbc_clear, sbc_enable, load_buffer, enable_timer;
  wire   n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15;
  wire   [2:0] s;
  wire   [2:0] next_s;

  DFFSR \s_reg[0]  ( .D(next_s[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(s[0])
         );
  DFFSR \s_reg[2]  ( .D(next_s[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(s[2])
         );
  DFFSR \s_reg[1]  ( .D(next_s[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(s[1])
         );
  OAI21X1 U6 ( .A(n4), .B(n5), .C(n6), .Y(next_s[2]) );
  AOI21X1 U7 ( .A(n7), .B(s[2]), .C(sbc_enable), .Y(n6) );
  INVX1 U8 ( .A(n8), .Y(sbc_enable) );
  NOR2X1 U9 ( .A(s[1]), .B(framing_error), .Y(n7) );
  OAI21X1 U10 ( .A(n9), .B(n10), .C(n11), .Y(next_s[1]) );
  OR2X1 U11 ( .A(framing_error), .B(s[1]), .Y(n10) );
  NAND3X1 U12 ( .A(n12), .B(n8), .C(n11), .Y(next_s[0]) );
  AOI21X1 U13 ( .A(n5), .B(n13), .C(sbc_clear), .Y(n11) );
  AND2X1 U14 ( .A(n13), .B(n14), .Y(sbc_clear) );
  INVX1 U15 ( .A(packet_done), .Y(n5) );
  NAND3X1 U16 ( .A(n9), .B(n14), .C(s[2]), .Y(n8) );
  NAND3X1 U17 ( .A(n9), .B(n14), .C(start_bit_detected), .Y(n12) );
  NOR2X1 U18 ( .A(n14), .B(n15), .Y(load_buffer) );
  NAND2X1 U19 ( .A(s[2]), .B(n9), .Y(n15) );
  INVX1 U20 ( .A(s[1]), .Y(n14) );
  INVX1 U21 ( .A(n4), .Y(enable_timer) );
  NAND2X1 U22 ( .A(s[1]), .B(n13), .Y(n4) );
  NOR2X1 U23 ( .A(n9), .B(s[2]), .Y(n13) );
  INVX1 U24 ( .A(s[0]), .Y(n9) );
endmodule


module flex_counter_000e_DW01_inc_0 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;

  wire   [13:2] carry;

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
  XOR2X1 U2 ( .A(carry[13]), .B(A[13]), .Y(SUM[13]) );
endmodule


module flex_counter_000e ( clk, n_rst, clear, count_enable, rollover_val, 
        count_out, rollover_flag );
  input [13:0] rollover_val;
  output [13:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n97, \next_count[0] , N7, N8, N9, N10, N11, N12, N13, N14, N15, N16,
         N17, N18, N19, N20, N21, \eq_43/A[1] , \eq_43/A[2] , \eq_43/A[3] ,
         \eq_43/A[4] , \eq_43/A[5] , \eq_43/A[6] , \eq_43/A[7] , \eq_43/A[8] ,
         \eq_43/A[9] , \eq_43/A[10] , \eq_43/A[11] , \eq_43/A[12] ,
         \eq_43/A[13] , n2, n3, n4, n5, n6, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96;

  DFFSR \count_out_reg[0]  ( .D(\next_count[0] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[0]) );
  DFFSR \count_out_reg[13]  ( .D(\eq_43/A[13] ), .CLK(clk), .R(n_rst), .S(1'b1), .Q(count_out[13]) );
  DFFSR \count_out_reg[9]  ( .D(\eq_43/A[9] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[9]) );
  DFFSR \count_out_reg[8]  ( .D(\eq_43/A[8] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[8]) );
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
  DFFSR \count_out_reg[12]  ( .D(\eq_43/A[12] ), .CLK(clk), .R(n_rst), .S(1'b1), .Q(count_out[12]) );
  DFFSR \count_out_reg[11]  ( .D(\eq_43/A[11] ), .CLK(clk), .R(n_rst), .S(1'b1), .Q(count_out[11]) );
  DFFSR \count_out_reg[10]  ( .D(\eq_43/A[10] ), .CLK(clk), .R(n_rst), .S(1'b1), .Q(count_out[10]) );
  DFFSR rollover_flag_reg ( .D(N21), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n97)
         );
  flex_counter_000e_DW01_inc_0 add_41 ( .A(count_out), .SUM({N20, N19, N18, 
        N17, N16, N15, N14, N13, N12, N11, N10, N9, N8, N7}) );
  BUFX2 U5 ( .A(n97), .Y(rollover_flag) );
  BUFX2 U6 ( .A(n26), .Y(n2) );
  AND2X1 U20 ( .A(n3), .B(n4), .Y(N21) );
  NOR2X1 U21 ( .A(n5), .B(n6), .Y(n4) );
  NAND3X1 U22 ( .A(n22), .B(n23), .C(n24), .Y(n6) );
  XNOR2X1 U23 ( .A(rollover_val[10]), .B(\eq_43/A[10] ), .Y(n24) );
  OAI21X1 U24 ( .A(n25), .B(n2), .C(n27), .Y(\eq_43/A[10] ) );
  NAND2X1 U25 ( .A(N17), .B(n28), .Y(n27) );
  XNOR2X1 U26 ( .A(rollover_val[11]), .B(\eq_43/A[11] ), .Y(n23) );
  OAI21X1 U27 ( .A(n29), .B(n2), .C(n30), .Y(\eq_43/A[11] ) );
  NAND2X1 U28 ( .A(N18), .B(n28), .Y(n30) );
  XNOR2X1 U29 ( .A(rollover_val[12]), .B(\eq_43/A[12] ), .Y(n22) );
  OAI21X1 U30 ( .A(n31), .B(n2), .C(n32), .Y(\eq_43/A[12] ) );
  NAND2X1 U31 ( .A(N19), .B(n28), .Y(n32) );
  NAND3X1 U32 ( .A(n33), .B(n34), .C(n35), .Y(n5) );
  NOR2X1 U33 ( .A(n36), .B(n37), .Y(n35) );
  XOR2X1 U34 ( .A(rollover_val[6]), .B(\eq_43/A[6] ), .Y(n37) );
  OAI21X1 U35 ( .A(n38), .B(n2), .C(n39), .Y(\eq_43/A[6] ) );
  NAND2X1 U36 ( .A(N13), .B(n28), .Y(n39) );
  INVX1 U37 ( .A(count_out[6]), .Y(n38) );
  XOR2X1 U38 ( .A(rollover_val[7]), .B(\eq_43/A[7] ), .Y(n36) );
  OAI21X1 U39 ( .A(n40), .B(n2), .C(n41), .Y(\eq_43/A[7] ) );
  NAND2X1 U40 ( .A(N14), .B(n28), .Y(n41) );
  INVX1 U41 ( .A(count_out[7]), .Y(n40) );
  XNOR2X1 U42 ( .A(rollover_val[8]), .B(\eq_43/A[8] ), .Y(n34) );
  OAI21X1 U43 ( .A(n42), .B(n2), .C(n43), .Y(\eq_43/A[8] ) );
  NAND2X1 U44 ( .A(N15), .B(n28), .Y(n43) );
  XNOR2X1 U45 ( .A(rollover_val[9]), .B(\eq_43/A[9] ), .Y(n33) );
  OAI21X1 U46 ( .A(n44), .B(n2), .C(n45), .Y(\eq_43/A[9] ) );
  NAND2X1 U47 ( .A(N16), .B(n28), .Y(n45) );
  NOR2X1 U48 ( .A(n46), .B(n47), .Y(n3) );
  NAND3X1 U49 ( .A(n48), .B(n49), .C(n50), .Y(n47) );
  XNOR2X1 U50 ( .A(rollover_val[3]), .B(\eq_43/A[3] ), .Y(n50) );
  OAI21X1 U51 ( .A(n51), .B(n2), .C(n52), .Y(\eq_43/A[3] ) );
  NAND2X1 U52 ( .A(N10), .B(n28), .Y(n52) );
  XNOR2X1 U53 ( .A(rollover_val[4]), .B(\eq_43/A[4] ), .Y(n49) );
  OAI21X1 U54 ( .A(n53), .B(n2), .C(n54), .Y(\eq_43/A[4] ) );
  NAND2X1 U55 ( .A(N11), .B(n28), .Y(n54) );
  XNOR2X1 U56 ( .A(rollover_val[5]), .B(\eq_43/A[5] ), .Y(n48) );
  OAI21X1 U57 ( .A(n55), .B(n2), .C(n56), .Y(\eq_43/A[5] ) );
  NAND2X1 U58 ( .A(N12), .B(n28), .Y(n56) );
  NAND3X1 U59 ( .A(n57), .B(n58), .C(n59), .Y(n46) );
  NOR2X1 U60 ( .A(n60), .B(n61), .Y(n59) );
  XOR2X1 U61 ( .A(rollover_val[13]), .B(\eq_43/A[13] ), .Y(n61) );
  OAI21X1 U62 ( .A(n62), .B(n2), .C(n63), .Y(\eq_43/A[13] ) );
  NAND2X1 U63 ( .A(N20), .B(n28), .Y(n63) );
  INVX1 U64 ( .A(count_out[13]), .Y(n62) );
  XOR2X1 U65 ( .A(rollover_val[2]), .B(\eq_43/A[2] ), .Y(n60) );
  OAI21X1 U66 ( .A(n64), .B(n2), .C(n65), .Y(\eq_43/A[2] ) );
  NAND2X1 U67 ( .A(N9), .B(n28), .Y(n65) );
  XNOR2X1 U68 ( .A(rollover_val[1]), .B(\eq_43/A[1] ), .Y(n58) );
  OAI21X1 U69 ( .A(n66), .B(n2), .C(n67), .Y(\eq_43/A[1] ) );
  NAND2X1 U70 ( .A(N8), .B(n28), .Y(n67) );
  INVX1 U71 ( .A(n68), .Y(n28) );
  NAND3X1 U72 ( .A(n69), .B(n70), .C(count_enable), .Y(n68) );
  XNOR2X1 U73 ( .A(rollover_val[0]), .B(\next_count[0] ), .Y(n57) );
  OAI22X1 U74 ( .A(n71), .B(n2), .C(n72), .D(n73), .Y(\next_count[0] ) );
  OAI21X1 U75 ( .A(n74), .B(N7), .C(n70), .Y(n73) );
  INVX1 U76 ( .A(n69), .Y(n74) );
  NAND2X1 U77 ( .A(n75), .B(n76), .Y(n69) );
  NOR2X1 U78 ( .A(n77), .B(n78), .Y(n76) );
  NAND3X1 U79 ( .A(n79), .B(n80), .C(n81), .Y(n78) );
  XOR2X1 U80 ( .A(n29), .B(rollover_val[11]), .Y(n81) );
  INVX1 U81 ( .A(count_out[11]), .Y(n29) );
  XOR2X1 U82 ( .A(n31), .B(rollover_val[12]), .Y(n80) );
  INVX1 U83 ( .A(count_out[12]), .Y(n31) );
  XOR2X1 U84 ( .A(n25), .B(rollover_val[10]), .Y(n79) );
  INVX1 U85 ( .A(count_out[10]), .Y(n25) );
  NAND3X1 U86 ( .A(n82), .B(n83), .C(n84), .Y(n77) );
  NOR2X1 U87 ( .A(n85), .B(n86), .Y(n84) );
  XOR2X1 U88 ( .A(rollover_val[7]), .B(count_out[7]), .Y(n86) );
  XOR2X1 U89 ( .A(rollover_val[6]), .B(count_out[6]), .Y(n85) );
  XOR2X1 U90 ( .A(n42), .B(rollover_val[8]), .Y(n83) );
  INVX1 U91 ( .A(count_out[8]), .Y(n42) );
  XOR2X1 U92 ( .A(n44), .B(rollover_val[9]), .Y(n82) );
  INVX1 U93 ( .A(count_out[9]), .Y(n44) );
  NOR2X1 U94 ( .A(n87), .B(n88), .Y(n75) );
  NAND3X1 U95 ( .A(n89), .B(n90), .C(n91), .Y(n88) );
  XOR2X1 U96 ( .A(n53), .B(rollover_val[4]), .Y(n91) );
  INVX1 U97 ( .A(count_out[4]), .Y(n53) );
  XOR2X1 U98 ( .A(n55), .B(rollover_val[5]), .Y(n90) );
  INVX1 U99 ( .A(count_out[5]), .Y(n55) );
  XOR2X1 U100 ( .A(n51), .B(rollover_val[3]), .Y(n89) );
  INVX1 U101 ( .A(count_out[3]), .Y(n51) );
  NAND3X1 U102 ( .A(n92), .B(n93), .C(n94), .Y(n87) );
  NOR2X1 U103 ( .A(n95), .B(n96), .Y(n94) );
  XOR2X1 U104 ( .A(rollover_val[13]), .B(count_out[13]), .Y(n96) );
  XOR2X1 U105 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n95) );
  XOR2X1 U106 ( .A(n66), .B(rollover_val[1]), .Y(n93) );
  INVX1 U107 ( .A(count_out[1]), .Y(n66) );
  XOR2X1 U108 ( .A(n64), .B(rollover_val[2]), .Y(n92) );
  INVX1 U109 ( .A(count_out[2]), .Y(n64) );
  NAND2X1 U110 ( .A(n70), .B(n72), .Y(n26) );
  INVX1 U111 ( .A(count_enable), .Y(n72) );
  INVX1 U112 ( .A(clear), .Y(n70) );
  INVX1 U113 ( .A(count_out[0]), .Y(n71) );
endmodule


module flex_counter_NUM_CNT_BITS4 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N11, n1, n2, n3, n4, n5, n6, n12, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33;
  wire   [3:0] next_count;

  DFFSR \count_out_reg[0]  ( .D(next_count[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(next_count[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n33), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
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
  MUX2X1 U13 ( .B(n12), .A(n13), .S(count_out[3]), .Y(n1) );
  OAI21X1 U14 ( .A(count_out[2]), .B(n14), .C(n15), .Y(n13) );
  NOR2X1 U15 ( .A(n16), .B(n17), .Y(n12) );
  XOR2X1 U16 ( .A(n2), .B(rollover_val[1]), .Y(n5) );
  MUX2X1 U17 ( .B(n18), .A(n19), .S(count_out[1]), .Y(n2) );
  AND2X1 U18 ( .A(count_out[0]), .B(n20), .Y(n18) );
  NAND2X1 U19 ( .A(n21), .B(n22), .Y(n3) );
  XNOR2X1 U20 ( .A(rollover_val[0]), .B(next_count[0]), .Y(n22) );
  OAI22X1 U21 ( .A(count_out[0]), .B(n14), .C(clear), .D(n23), .Y(
        next_count[0]) );
  MUX2X1 U22 ( .B(count_out[0]), .A(n24), .S(count_enable), .Y(n23) );
  INVX1 U23 ( .A(n25), .Y(n24) );
  XNOR2X1 U24 ( .A(rollover_val[2]), .B(n33), .Y(n21) );
  MUX2X1 U25 ( .B(n17), .A(n15), .S(count_out[2]), .Y(n33) );
  AOI21X1 U26 ( .A(n26), .B(n20), .C(n19), .Y(n15) );
  OAI22X1 U27 ( .A(count_enable), .B(clear), .C(count_out[0]), .D(n14), .Y(n19) );
  NAND3X1 U28 ( .A(count_out[1]), .B(count_out[0]), .C(n20), .Y(n17) );
  INVX1 U29 ( .A(n14), .Y(n20) );
  NAND3X1 U30 ( .A(n25), .B(n27), .C(count_enable), .Y(n14) );
  INVX1 U31 ( .A(clear), .Y(n27) );
  NAND3X1 U32 ( .A(n28), .B(n29), .C(n30), .Y(n25) );
  NOR2X1 U33 ( .A(n31), .B(n32), .Y(n30) );
  XNOR2X1 U34 ( .A(rollover_val[1]), .B(n26), .Y(n32) );
  INVX1 U35 ( .A(count_out[1]), .Y(n26) );
  XOR2X1 U36 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n31) );
  XOR2X1 U37 ( .A(rollover_val[2]), .B(n16), .Y(n29) );
  INVX1 U38 ( .A(count_out[2]), .Y(n16) );
  XNOR2X1 U39 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n28) );
endmodule


module timer ( clk, n_rst, enable_timer, shift_enable, packet_done, data_size, 
        bit_period );
  input [3:0] data_size;
  input [13:0] bit_period;
  input clk, n_rst, enable_timer;
  output shift_enable, packet_done;
  wire   \_2_net_[3] , \_2_net_[2] , \_2_net_[1] , n1, n2, n3, n4, n5;

  flex_counter_000e clk_divder ( .clk(clk), .n_rst(n_rst), .clear(n4), 
        .count_enable(enable_timer), .rollover_val(bit_period), 
        .rollover_flag(shift_enable) );
  flex_counter_NUM_CNT_BITS4 controller ( .clk(clk), .n_rst(n_rst), .clear(n4), 
        .count_enable(shift_enable), .rollover_val({\_2_net_[3] , \_2_net_[2] , 
        \_2_net_[1] , n5}), .rollover_flag(packet_done) );
  INVX1 U2 ( .A(enable_timer), .Y(n4) );
  INVX1 U3 ( .A(data_size[0]), .Y(n5) );
  XOR2X1 U4 ( .A(data_size[3]), .B(n1), .Y(\_2_net_[3] ) );
  NOR2X1 U5 ( .A(n2), .B(n3), .Y(n1) );
  XOR2X1 U6 ( .A(n3), .B(n2), .Y(\_2_net_[2] ) );
  NAND2X1 U7 ( .A(data_size[1]), .B(data_size[0]), .Y(n2) );
  INVX1 U8 ( .A(data_size[2]), .Y(n3) );
  XOR2X1 U9 ( .A(data_size[1]), .B(data_size[0]), .Y(\_2_net_[1] ) );
endmodule


module stop_bit_chk ( clk, n_rst, sbc_clear, sbc_enable, stop_bit, 
        framing_error );
  input clk, n_rst, sbc_clear, sbc_enable, stop_bit;
  output framing_error;
  wire   n5, n2, n3;

  DFFSR framing_error_reg ( .D(n5), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        framing_error) );
  NOR2X1 U3 ( .A(sbc_clear), .B(n2), .Y(n5) );
  MUX2X1 U4 ( .B(framing_error), .A(n3), .S(sbc_enable), .Y(n2) );
  INVX1 U5 ( .A(stop_bit), .Y(n3) );
endmodule


module rx_data_buff ( clk, n_rst, load_buffer, packet_data, data_read, rx_data, 
        data_ready, overrun_error );
  input [7:0] packet_data;
  output [7:0] rx_data;
  input clk, n_rst, load_buffer, data_read;
  output data_ready, overrun_error;
  wire   n30, n31, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n15, n17, n19,
         n21, n23, n25, n27, n29;

  DFFSR \rx_data_reg[7]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[7]) );
  DFFSR \rx_data_reg[6]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[6]) );
  DFFSR \rx_data_reg[5]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[5]) );
  DFFSR \rx_data_reg[4]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[4]) );
  DFFSR \rx_data_reg[3]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[3]) );
  DFFSR \rx_data_reg[2]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[2]) );
  DFFSR \rx_data_reg[1]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[1]) );
  DFFSR \rx_data_reg[0]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[0]) );
  DFFSR data_ready_reg ( .D(n31), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_ready) );
  DFFSR overrun_error_reg ( .D(n30), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        overrun_error) );
  INVX1 U3 ( .A(n1), .Y(n15) );
  MUX2X1 U4 ( .B(rx_data[6]), .A(packet_data[6]), .S(load_buffer), .Y(n1) );
  INVX1 U5 ( .A(n2), .Y(n17) );
  MUX2X1 U6 ( .B(rx_data[7]), .A(packet_data[7]), .S(load_buffer), .Y(n2) );
  INVX1 U7 ( .A(n3), .Y(n19) );
  MUX2X1 U8 ( .B(rx_data[4]), .A(packet_data[4]), .S(load_buffer), .Y(n3) );
  INVX1 U9 ( .A(n4), .Y(n21) );
  MUX2X1 U10 ( .B(rx_data[5]), .A(packet_data[5]), .S(load_buffer), .Y(n4) );
  INVX1 U11 ( .A(n5), .Y(n23) );
  MUX2X1 U12 ( .B(rx_data[3]), .A(packet_data[3]), .S(load_buffer), .Y(n5) );
  INVX1 U13 ( .A(n6), .Y(n25) );
  MUX2X1 U14 ( .B(rx_data[2]), .A(packet_data[2]), .S(load_buffer), .Y(n6) );
  INVX1 U15 ( .A(n7), .Y(n27) );
  MUX2X1 U16 ( .B(rx_data[1]), .A(packet_data[1]), .S(load_buffer), .Y(n7) );
  INVX1 U17 ( .A(n8), .Y(n29) );
  MUX2X1 U18 ( .B(rx_data[0]), .A(packet_data[0]), .S(load_buffer), .Y(n8) );
  OAI21X1 U19 ( .A(data_read), .B(n9), .C(n10), .Y(n31) );
  INVX1 U20 ( .A(load_buffer), .Y(n10) );
  INVX1 U21 ( .A(data_ready), .Y(n9) );
  NOR2X1 U22 ( .A(data_read), .B(n11), .Y(n30) );
  AOI21X1 U23 ( .A(data_ready), .B(load_buffer), .C(overrun_error), .Y(n11) );
endmodule


module rcv_block ( clk, n_rst, serial_in, data_read, rx_data, data_ready, 
        overrun_error, framing_error, data_size, bit_period );
  output [7:0] rx_data;
  input [3:0] data_size;
  input [13:0] bit_period;
  input clk, n_rst, serial_in, data_read;
  output data_ready, overrun_error, framing_error;
  wire   start, shift_en, stop, done, sbc_clr, sbc_en, ld_buf, timer_en, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20;
  wire   [7:0] packet_data_in;
  wire   [7:0] packet_data_out;

  start_bit_det det0 ( .clk(clk), .n_rst(n_rst), .serial_in(serial_in), 
        .start_bit_detected(start) );
  sr_9bit sr0 ( .clk(clk), .n_rst(n_rst), .shift_strobe(shift_en), .serial_in(
        serial_in), .packet_data(packet_data_out), .stop_bit(stop) );
  rcu cu0 ( .clk(clk), .n_rst(n_rst), .start_bit_detected(start), 
        .packet_done(done), .framing_error(framing_error), .sbc_clear(sbc_clr), 
        .sbc_enable(sbc_en), .load_buffer(ld_buf), .enable_timer(timer_en) );
  timer tm0 ( .clk(clk), .n_rst(n_rst), .enable_timer(timer_en), 
        .shift_enable(shift_en), .packet_done(done), .data_size(data_size), 
        .bit_period(bit_period) );
  stop_bit_chk det1 ( .clk(clk), .n_rst(n_rst), .sbc_clear(sbc_clr), 
        .sbc_enable(sbc_en), .stop_bit(stop), .framing_error(framing_error) );
  rx_data_buff buff0 ( .clk(clk), .n_rst(n_rst), .load_buffer(ld_buf), 
        .packet_data(packet_data_in), .data_read(data_read), .rx_data(rx_data), 
        .data_ready(data_ready), .overrun_error(overrun_error) );
  NOR2X1 U2 ( .A(n1), .B(n2), .Y(packet_data_in[7]) );
  OAI22X1 U3 ( .A(n2), .B(n3), .C(n1), .D(n4), .Y(packet_data_in[6]) );
  INVX1 U4 ( .A(packet_data_out[7]), .Y(n2) );
  OAI22X1 U5 ( .A(n4), .B(n3), .C(n1), .D(n5), .Y(packet_data_in[5]) );
  INVX1 U6 ( .A(packet_data_out[6]), .Y(n4) );
  OAI21X1 U7 ( .A(n3), .B(n5), .C(n6), .Y(packet_data_in[4]) );
  AOI22X1 U8 ( .A(packet_data_out[4]), .B(n7), .C(n8), .D(packet_data_out[7]), 
        .Y(n6) );
  INVX1 U9 ( .A(packet_data_out[5]), .Y(n5) );
  OAI21X1 U10 ( .A(n3), .B(n9), .C(n10), .Y(packet_data_in[3]) );
  AOI22X1 U11 ( .A(packet_data_out[3]), .B(n7), .C(n8), .D(packet_data_out[6]), 
        .Y(n10) );
  INVX1 U12 ( .A(packet_data_out[4]), .Y(n9) );
  OAI21X1 U13 ( .A(n3), .B(n11), .C(n12), .Y(packet_data_in[2]) );
  AOI22X1 U14 ( .A(packet_data_out[2]), .B(n7), .C(n8), .D(packet_data_out[5]), 
        .Y(n12) );
  INVX1 U15 ( .A(packet_data_out[3]), .Y(n11) );
  OAI21X1 U16 ( .A(n3), .B(n13), .C(n14), .Y(packet_data_in[1]) );
  AOI22X1 U17 ( .A(packet_data_out[1]), .B(n7), .C(n8), .D(packet_data_out[4]), 
        .Y(n14) );
  INVX1 U18 ( .A(packet_data_out[2]), .Y(n13) );
  OAI21X1 U19 ( .A(n3), .B(n15), .C(n16), .Y(packet_data_in[0]) );
  AOI22X1 U20 ( .A(packet_data_out[0]), .B(n7), .C(packet_data_out[3]), .D(n8), 
        .Y(n16) );
  INVX1 U21 ( .A(n17), .Y(n8) );
  INVX1 U22 ( .A(n1), .Y(n7) );
  NAND2X1 U23 ( .A(n3), .B(n17), .Y(n1) );
  NAND3X1 U24 ( .A(data_size[2]), .B(data_size[0]), .C(n18), .Y(n17) );
  NOR2X1 U25 ( .A(data_size[3]), .B(data_size[1]), .Y(n18) );
  INVX1 U26 ( .A(packet_data_out[1]), .Y(n15) );
  NAND3X1 U27 ( .A(data_size[1]), .B(data_size[2]), .C(n19), .Y(n3) );
  NOR2X1 U28 ( .A(data_size[3]), .B(n20), .Y(n19) );
  INVX1 U29 ( .A(data_size[0]), .Y(n20) );
endmodule


module apb_uart_rx ( clk, n_rst, serial_in, psel, penable, pwrite, paddr, 
        pwdata, prdata, pslverr );
  input [2:0] paddr;
  input [7:0] pwdata;
  output [7:0] prdata;
  input clk, n_rst, serial_in, psel, penable, pwrite;
  output pslverr;
  wire   data_ready, overrun_error, framing_error, data_read;
  wire   [7:0] rx_data;
  wire   [3:0] data_size;
  wire   [13:0] bit_period;

  apb_slave apb_slv ( .clk(clk), .n_rst(n_rst), .rx_data(rx_data), 
        .data_ready(data_ready), .overrun_error(overrun_error), 
        .framing_error(framing_error), .data_read(data_read), .psel(psel), 
        .penable(penable), .pwrite(pwrite), .paddr(paddr), .prdata(prdata), 
        .pwdata(pwdata), .pslverr(pslverr), .data_size(data_size), 
        .bit_period(bit_period) );
  rcv_block uart0 ( .clk(clk), .n_rst(n_rst), .serial_in(serial_in), 
        .data_read(data_read), .rx_data(rx_data), .data_ready(data_ready), 
        .overrun_error(overrun_error), .framing_error(framing_error), 
        .data_size(data_size), .bit_period(bit_period) );
endmodule

