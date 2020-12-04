/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Oct 27 15:33:17 2020
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
  wire   N19, n1, n3, n4, n6, n7, n8, n10, n15, n19, n27, n28, n31, n37, n38,
         n44, n45, n46, n48, n49, n50, n51, n52, n53, n54, n55, n59, n60, n63,
         n64, n67, n68, n69, n70, n71, n73, n75, n76, n78, n80, n81, n82, n83,
         n86, n87, n89, n90, n92, n93, n94, n96, n97, n98, n100, n102, n103,
         n105, n107, n109, n111, n113, n115, n117, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n137, n139, n141, n143, n145, n147, n149, n151, n2, n5,
         n9, n11, n12, n13, n14, n16, n17, n18, n20, n21, n22, n23, n24, n25,
         n26, n29, n30, n32, n33, n34, n35, n36, n39, n40, n41, n42, n43, n47,
         n56, n57, n58, n61, n62, n65, n66, n72, n74, n77, n79, n84, n85, n88,
         n91, n95, n99, n101, n104, n106, n108, n110, n112, n114, n116, n118,
         n172, n173, n174, n175, n176, n177, n178, n179;
  wire   [7:6] bit_period_reg1;
  wire   [7:0] next_bit_period_reg0;
  wire   [7:0] next_bit_period_reg1;
  wire   [7:0] next_data_size_reg;
  wire   [7:0] data_buffer_reg;
  assign data_read = N19;

  DFFSR \bit_period_reg1_reg[7]  ( .D(next_bit_period_reg1[7]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period_reg1[7]) );
  DFFSR \bit_period_reg1_reg[6]  ( .D(next_bit_period_reg1[6]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period_reg1[6]) );
  DFFSR \bit_period_reg1_reg[5]  ( .D(next_bit_period_reg1[5]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period[13]) );
  DFFSR \bit_period_reg1_reg[4]  ( .D(next_bit_period_reg1[4]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period[12]) );
  DFFSR \bit_period_reg1_reg[3]  ( .D(n25), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[11]) );
  DFFSR \bit_period_reg1_reg[2]  ( .D(n29), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[10]) );
  DFFSR \bit_period_reg1_reg[1]  ( .D(next_bit_period_reg1[1]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period[9]) );
  DFFSR \bit_period_reg1_reg[0]  ( .D(next_bit_period_reg1[0]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period[8]) );
  DFFSR \data_size_reg_reg[3]  ( .D(n34), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_size[3]) );
  DFFSR \data_size_reg_reg[2]  ( .D(n35), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
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
  DFFSR \bit_period_reg0_reg[3]  ( .D(n47), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[3]) );
  DFFSR \bit_period_reg0_reg[2]  ( .D(n56), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(bit_period[2]) );
  DFFSR \bit_period_reg0_reg[1]  ( .D(next_bit_period_reg0[1]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period[1]) );
  DFFSR \bit_period_reg0_reg[0]  ( .D(next_bit_period_reg0[0]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period[0]) );
  DFFSR \data_buffer_reg_reg[7]  ( .D(n151), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buffer_reg[7]) );
  DFFSR \data_buffer_reg_reg[6]  ( .D(n149), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buffer_reg[6]) );
  DFFSR \data_buffer_reg_reg[5]  ( .D(n147), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buffer_reg[5]) );
  DFFSR \data_buffer_reg_reg[4]  ( .D(n145), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buffer_reg[4]) );
  DFFSR \data_buffer_reg_reg[3]  ( .D(n143), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buffer_reg[3]) );
  DFFSR \data_buffer_reg_reg[2]  ( .D(n141), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buffer_reg[2]) );
  DFFSR \data_buffer_reg_reg[1]  ( .D(n139), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buffer_reg[1]) );
  DFFSR \data_buffer_reg_reg[0]  ( .D(n137), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buffer_reg[0]) );
  DFFSR \prdata_reg[7]  ( .D(1'b0), .CLK(clk), .R(n134), .S(n135), .Q(
        prdata[7]) );
  DFFSR \prdata_reg[6]  ( .D(1'b0), .CLK(clk), .R(n132), .S(n133), .Q(
        prdata[6]) );
  DFFSR \prdata_reg[5]  ( .D(1'b0), .CLK(clk), .R(n130), .S(n131), .Q(
        prdata[5]) );
  DFFSR \prdata_reg[4]  ( .D(1'b0), .CLK(clk), .R(n128), .S(n129), .Q(
        prdata[4]) );
  DFFSR \prdata_reg[3]  ( .D(1'b0), .CLK(clk), .R(n126), .S(n127), .Q(
        prdata[3]) );
  DFFSR \prdata_reg[2]  ( .D(1'b0), .CLK(clk), .R(n124), .S(n125), .Q(
        prdata[2]) );
  DFFSR \prdata_reg[1]  ( .D(1'b0), .CLK(clk), .R(n122), .S(n123), .Q(
        prdata[1]) );
  DFFSR \prdata_reg[0]  ( .D(1'b0), .CLK(clk), .R(n120), .S(n121), .Q(
        prdata[0]) );
  NOR2X1 U3 ( .A(n1), .B(n104), .Y(pslverr) );
  AOI22X1 U4 ( .A(paddr[0]), .B(n3), .C(pwrite), .D(n4), .Y(n1) );
  OAI21X1 U5 ( .A(paddr[1]), .B(n114), .C(n6), .Y(n3) );
  AOI22X1 U7 ( .A(n8), .B(pwdata[3]), .C(n110), .D(data_size[3]), .Y(n7) );
  AOI22X1 U9 ( .A(n8), .B(pwdata[2]), .C(n110), .D(data_size[2]), .Y(n10) );
  OAI22X1 U10 ( .A(n110), .B(n178), .C(n8), .D(n36), .Y(next_data_size_reg[1])
         );
  OAI22X1 U11 ( .A(n110), .B(n179), .C(n8), .D(n39), .Y(next_data_size_reg[0])
         );
  NOR2X1 U13 ( .A(n15), .B(n116), .Y(n8) );
  OAI22X1 U14 ( .A(n108), .B(n174), .C(n19), .D(n17), .Y(
        next_bit_period_reg1[7]) );
  OAI22X1 U15 ( .A(n108), .B(n175), .C(n19), .D(n20), .Y(
        next_bit_period_reg1[6]) );
  OAI22X1 U16 ( .A(n108), .B(n176), .C(n19), .D(n22), .Y(
        next_bit_period_reg1[5]) );
  OAI22X1 U17 ( .A(n108), .B(n177), .C(n19), .D(n24), .Y(
        next_bit_period_reg1[4]) );
  AOI22X1 U19 ( .A(pwdata[3]), .B(n19), .C(n108), .D(bit_period[11]), .Y(n27)
         );
  AOI22X1 U21 ( .A(pwdata[2]), .B(n19), .C(n108), .D(bit_period[10]), .Y(n28)
         );
  OAI22X1 U22 ( .A(n178), .B(n108), .C(n19), .D(n32), .Y(
        next_bit_period_reg1[1]) );
  OAI22X1 U24 ( .A(n179), .B(n108), .C(n19), .D(n33), .Y(
        next_bit_period_reg1[0]) );
  OAI22X1 U26 ( .A(n174), .B(n31), .C(n9), .D(n40), .Y(next_bit_period_reg0[7]) );
  OAI22X1 U29 ( .A(n175), .B(n31), .C(n9), .D(n41), .Y(next_bit_period_reg0[6]) );
  OAI22X1 U32 ( .A(n176), .B(n31), .C(n9), .D(n42), .Y(next_bit_period_reg0[5]) );
  OAI22X1 U35 ( .A(n177), .B(n31), .C(n9), .D(n43), .Y(next_bit_period_reg0[4]) );
  AOI22X1 U39 ( .A(pwdata[3]), .B(n9), .C(n31), .D(bit_period[3]), .Y(n37) );
  AOI22X1 U41 ( .A(pwdata[2]), .B(n9), .C(n31), .D(bit_period[2]), .Y(n38) );
  OAI22X1 U42 ( .A(n178), .B(n31), .C(n9), .D(n57), .Y(next_bit_period_reg0[1]) );
  OAI22X1 U45 ( .A(n179), .B(n31), .C(n9), .D(n58), .Y(next_bit_period_reg0[0]) );
  NAND3X1 U48 ( .A(paddr[1]), .B(n108), .C(n106), .Y(n31) );
  NOR2X1 U51 ( .A(n15), .B(n173), .Y(n19) );
  NAND3X1 U52 ( .A(n118), .B(psel), .C(n44), .Y(n15) );
  AOI21X1 U53 ( .A(paddr[0]), .B(paddr[2]), .C(n114), .Y(n44) );
  OAI21X1 U56 ( .A(paddr[2]), .B(paddr[1]), .C(n6), .Y(n4) );
  NAND3X1 U58 ( .A(n45), .B(n46), .C(penable), .Y(n121) );
  OAI21X1 U59 ( .A(n112), .B(n48), .C(n49), .Y(n120) );
  NAND2X1 U60 ( .A(n_rst), .B(n46), .Y(n48) );
  NAND2X1 U61 ( .A(n50), .B(n51), .Y(n46) );
  AOI21X1 U62 ( .A(data_buffer_reg[0]), .B(n52), .C(n53), .Y(n51) );
  OAI21X1 U63 ( .A(n39), .B(n54), .C(n55), .Y(n53) );
  NAND3X1 U64 ( .A(n85), .B(n95), .C(n12), .Y(n55) );
  AOI22X1 U66 ( .A(n60), .B(data_ready), .C(n101), .D(framing_error), .Y(n59)
         );
  AOI22X1 U68 ( .A(n84), .B(bit_period[0]), .C(n63), .D(bit_period[8]), .Y(n50) );
  NAND2X1 U69 ( .A(n45), .B(n64), .Y(n123) );
  OAI21X1 U70 ( .A(n13), .B(n11), .C(n49), .Y(n122) );
  NAND2X1 U72 ( .A(n67), .B(n68), .Y(n64) );
  AOI21X1 U73 ( .A(data_buffer_reg[1]), .B(n52), .C(n69), .Y(n68) );
  OAI22X1 U74 ( .A(n36), .B(n54), .C(n70), .D(n71), .Y(n69) );
  NAND2X1 U75 ( .A(overrun_error), .B(n101), .Y(n71) );
  NAND3X1 U77 ( .A(n95), .B(n14), .C(n85), .Y(n70) );
  AOI22X1 U80 ( .A(n84), .B(bit_period[1]), .C(n63), .D(bit_period[9]), .Y(n67) );
  NAND2X1 U81 ( .A(n45), .B(n73), .Y(n125) );
  OAI21X1 U82 ( .A(n30), .B(n11), .C(n49), .Y(n124) );
  NAND2X1 U84 ( .A(n75), .B(n76), .Y(n73) );
  AOI22X1 U85 ( .A(n88), .B(data_size[2]), .C(data_buffer_reg[2]), .D(n52), 
        .Y(n76) );
  AOI22X1 U86 ( .A(n84), .B(bit_period[2]), .C(n63), .D(bit_period[10]), .Y(
        n75) );
  NAND2X1 U87 ( .A(n45), .B(n78), .Y(n127) );
  OAI21X1 U88 ( .A(n26), .B(n11), .C(n49), .Y(n126) );
  NAND2X1 U90 ( .A(n80), .B(n81), .Y(n78) );
  AOI22X1 U91 ( .A(n88), .B(data_size[3]), .C(data_buffer_reg[3]), .D(n52), 
        .Y(n81) );
  NAND3X1 U93 ( .A(n60), .B(n95), .C(n82), .Y(n54) );
  AOI22X1 U94 ( .A(n84), .B(bit_period[3]), .C(n63), .D(bit_period[11]), .Y(
        n80) );
  NAND2X1 U95 ( .A(n45), .B(n83), .Y(n129) );
  OAI21X1 U96 ( .A(n23), .B(n11), .C(n49), .Y(n128) );
  OAI21X1 U98 ( .A(n24), .B(n91), .C(n86), .Y(n83) );
  AOI22X1 U99 ( .A(data_buffer_reg[4]), .B(n52), .C(n84), .D(bit_period[4]), 
        .Y(n86) );
  NAND2X1 U101 ( .A(n45), .B(n87), .Y(n131) );
  OAI21X1 U102 ( .A(n21), .B(n11), .C(n49), .Y(n130) );
  OAI21X1 U104 ( .A(n22), .B(n91), .C(n89), .Y(n87) );
  AOI22X1 U105 ( .A(data_buffer_reg[5]), .B(n52), .C(n84), .D(bit_period[5]), 
        .Y(n89) );
  NAND2X1 U107 ( .A(n45), .B(n90), .Y(n133) );
  OAI21X1 U108 ( .A(n18), .B(n11), .C(n49), .Y(n132) );
  OAI21X1 U110 ( .A(n20), .B(n91), .C(n92), .Y(n90) );
  AOI22X1 U111 ( .A(data_buffer_reg[6]), .B(n52), .C(n84), .D(bit_period[6]), 
        .Y(n92) );
  NAND2X1 U113 ( .A(n45), .B(n93), .Y(n135) );
  NOR2X1 U114 ( .A(n11), .B(n94), .Y(n45) );
  OAI21X1 U115 ( .A(n16), .B(n11), .C(n49), .Y(n134) );
  NAND2X1 U116 ( .A(n94), .B(n_rst), .Y(n49) );
  NOR2X1 U117 ( .A(n104), .B(penable), .Y(n94) );
  OAI21X1 U120 ( .A(n17), .B(n91), .C(n96), .Y(n93) );
  AOI22X1 U121 ( .A(data_buffer_reg[7]), .B(n52), .C(n84), .D(bit_period[7]), 
        .Y(n96) );
  NAND3X1 U123 ( .A(n85), .B(n60), .C(n98), .Y(n97) );
  NOR2X1 U124 ( .A(n95), .B(n85), .Y(n52) );
  NOR2X1 U126 ( .A(n99), .B(n100), .Y(n82) );
  OAI21X1 U127 ( .A(n172), .B(n173), .C(paddr[2]), .Y(n100) );
  NOR2X1 U130 ( .A(n95), .B(n60), .Y(n63) );
  NAND3X1 U131 ( .A(paddr[0]), .B(n6), .C(n102), .Y(n60) );
  NAND2X1 U132 ( .A(paddr[2]), .B(paddr[1]), .Y(n6) );
  NOR2X1 U134 ( .A(n99), .B(n103), .Y(n98) );
  OAI21X1 U135 ( .A(n116), .B(n173), .C(paddr[1]), .Y(n103) );
  OAI21X1 U139 ( .A(n5), .B(n79), .C(n105), .Y(n137) );
  NAND2X1 U140 ( .A(rx_data[0]), .B(n5), .Y(n105) );
  OAI21X1 U142 ( .A(n5), .B(n77), .C(n107), .Y(n139) );
  NAND2X1 U143 ( .A(rx_data[1]), .B(n5), .Y(n107) );
  OAI21X1 U145 ( .A(data_ready), .B(n74), .C(n109), .Y(n141) );
  NAND2X1 U146 ( .A(rx_data[2]), .B(n5), .Y(n109) );
  OAI21X1 U148 ( .A(data_ready), .B(n72), .C(n111), .Y(n143) );
  NAND2X1 U149 ( .A(rx_data[3]), .B(n5), .Y(n111) );
  OAI21X1 U151 ( .A(data_ready), .B(n66), .C(n113), .Y(n145) );
  NAND2X1 U152 ( .A(rx_data[4]), .B(n5), .Y(n113) );
  OAI21X1 U154 ( .A(data_ready), .B(n65), .C(n115), .Y(n147) );
  NAND2X1 U155 ( .A(rx_data[5]), .B(n5), .Y(n115) );
  OAI21X1 U157 ( .A(n5), .B(n62), .C(n117), .Y(n149) );
  NAND2X1 U158 ( .A(rx_data[6]), .B(n5), .Y(n117) );
  OAI21X1 U160 ( .A(n5), .B(n61), .C(n119), .Y(n151) );
  NAND2X1 U161 ( .A(rx_data[7]), .B(n5), .Y(n119) );
  NOR2X1 U163 ( .A(n99), .B(n112), .Y(N19) );
  NOR2X1 U166 ( .A(n104), .B(pwrite), .Y(n102) );
  INVX2 U6 ( .A(n19), .Y(n108) );
  INVX2 U8 ( .A(n2), .Y(n5) );
  INVX2 U12 ( .A(data_ready), .Y(n2) );
  INVX2 U18 ( .A(n_rst), .Y(n11) );
  INVX2 U20 ( .A(n31), .Y(n9) );
  INVX2 U23 ( .A(n59), .Y(n12) );
  INVX2 U25 ( .A(n64), .Y(n13) );
  INVX2 U27 ( .A(framing_error), .Y(n14) );
  INVX2 U28 ( .A(n93), .Y(n16) );
  INVX2 U30 ( .A(bit_period_reg1[7]), .Y(n17) );
  INVX2 U31 ( .A(n90), .Y(n18) );
  INVX2 U33 ( .A(bit_period_reg1[6]), .Y(n20) );
  INVX2 U34 ( .A(n87), .Y(n21) );
  INVX2 U36 ( .A(bit_period[13]), .Y(n22) );
  INVX2 U37 ( .A(n83), .Y(n23) );
  INVX2 U38 ( .A(bit_period[12]), .Y(n24) );
  INVX2 U40 ( .A(n27), .Y(n25) );
  INVX2 U43 ( .A(n78), .Y(n26) );
  INVX2 U44 ( .A(n28), .Y(n29) );
  INVX2 U46 ( .A(n73), .Y(n30) );
  INVX2 U47 ( .A(bit_period[9]), .Y(n32) );
  INVX2 U49 ( .A(bit_period[8]), .Y(n33) );
  INVX2 U50 ( .A(n7), .Y(n34) );
  INVX2 U54 ( .A(n10), .Y(n35) );
  INVX2 U55 ( .A(data_size[1]), .Y(n36) );
  INVX2 U57 ( .A(data_size[0]), .Y(n39) );
  INVX2 U65 ( .A(bit_period[7]), .Y(n40) );
  INVX2 U67 ( .A(bit_period[6]), .Y(n41) );
  INVX2 U71 ( .A(bit_period[5]), .Y(n42) );
  INVX2 U76 ( .A(bit_period[4]), .Y(n43) );
  INVX2 U78 ( .A(n37), .Y(n47) );
  INVX2 U79 ( .A(n38), .Y(n56) );
  INVX2 U83 ( .A(bit_period[1]), .Y(n57) );
  INVX2 U89 ( .A(bit_period[0]), .Y(n58) );
  INVX2 U92 ( .A(data_buffer_reg[7]), .Y(n61) );
  INVX2 U97 ( .A(data_buffer_reg[6]), .Y(n62) );
  INVX2 U100 ( .A(data_buffer_reg[5]), .Y(n65) );
  INVX2 U103 ( .A(data_buffer_reg[4]), .Y(n66) );
  INVX2 U106 ( .A(data_buffer_reg[3]), .Y(n72) );
  INVX2 U109 ( .A(data_buffer_reg[2]), .Y(n74) );
  INVX2 U112 ( .A(data_buffer_reg[1]), .Y(n77) );
  INVX2 U118 ( .A(data_buffer_reg[0]), .Y(n79) );
  INVX2 U119 ( .A(n97), .Y(n84) );
  INVX2 U122 ( .A(n82), .Y(n85) );
  INVX2 U125 ( .A(n54), .Y(n88) );
  INVX2 U128 ( .A(n63), .Y(n91) );
  INVX2 U129 ( .A(n98), .Y(n95) );
  INVX2 U133 ( .A(n102), .Y(n99) );
  INVX2 U136 ( .A(n60), .Y(n101) );
  INVX2 U137 ( .A(psel), .Y(n104) );
  INVX2 U138 ( .A(n15), .Y(n106) );
  INVX2 U141 ( .A(n8), .Y(n110) );
  INVX2 U144 ( .A(penable), .Y(n112) );
  INVX2 U147 ( .A(pwrite), .Y(n114) );
  INVX2 U150 ( .A(paddr[2]), .Y(n116) );
  INVX2 U153 ( .A(n4), .Y(n118) );
  INVX2 U156 ( .A(paddr[1]), .Y(n172) );
  INVX2 U159 ( .A(paddr[0]), .Y(n173) );
  INVX2 U162 ( .A(pwdata[7]), .Y(n174) );
  INVX2 U164 ( .A(pwdata[6]), .Y(n175) );
  INVX2 U165 ( .A(pwdata[5]), .Y(n176) );
  INVX2 U167 ( .A(pwdata[4]), .Y(n177) );
  INVX2 U196 ( .A(pwdata[1]), .Y(n178) );
  INVX2 U197 ( .A(pwdata[0]), .Y(n179) );
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
  NOR2X1 U7 ( .A(n4), .B(new_sample), .Y(start_bit_detected) );
  INVX2 U6 ( .A(old_sample), .Y(n4) );
endmodule


module flex_stp_sr_9_0 ( clk, n_rst, shift_enable, serial_in, parallel_out );
  output [8:0] parallel_out;
  input clk, n_rst, shift_enable, serial_in;
  wire   n3, n11, n13, n15, n17, n19, n21, n23, n25, n27, n29, n1, n2, n4, n5,
         n6, n7, n8, n9, n10, n30;

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
  OAI21X1 U2 ( .A(n30), .B(n1), .C(n3), .Y(n13) );
  NAND2X1 U3 ( .A(parallel_out[0]), .B(n1), .Y(n3) );
  OAI22X1 U4 ( .A(n1), .B(n10), .C(n2), .D(n30), .Y(n15) );
  OAI22X1 U6 ( .A(n1), .B(n9), .C(n2), .D(n10), .Y(n17) );
  OAI22X1 U8 ( .A(n1), .B(n8), .C(n2), .D(n9), .Y(n19) );
  OAI22X1 U10 ( .A(n1), .B(n7), .C(n2), .D(n8), .Y(n21) );
  OAI22X1 U12 ( .A(n1), .B(n6), .C(n2), .D(n7), .Y(n23) );
  OAI22X1 U14 ( .A(n1), .B(n5), .C(n2), .D(n6), .Y(n25) );
  OAI22X1 U16 ( .A(n1), .B(n4), .C(n2), .D(n5), .Y(n27) );
  OAI21X1 U19 ( .A(n2), .B(n4), .C(n11), .Y(n29) );
  NAND2X1 U20 ( .A(serial_in), .B(n2), .Y(n11) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U7 ( .A(shift_enable), .Y(n1) );
  INVX2 U9 ( .A(parallel_out[8]), .Y(n4) );
  INVX2 U11 ( .A(parallel_out[7]), .Y(n5) );
  INVX2 U13 ( .A(parallel_out[6]), .Y(n6) );
  INVX2 U15 ( .A(parallel_out[5]), .Y(n7) );
  INVX2 U17 ( .A(parallel_out[4]), .Y(n8) );
  INVX2 U18 ( .A(parallel_out[3]), .Y(n9) );
  INVX2 U21 ( .A(parallel_out[2]), .Y(n10) );
  INVX2 U31 ( .A(parallel_out[1]), .Y(n30) );
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
  wire   n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n4, n5, n6, n7;
  wire   [2:0] s;
  wire   [2:0] next_s;

  DFFSR \s_reg[0]  ( .D(next_s[0]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(s[0])
         );
  DFFSR \s_reg[2]  ( .D(next_s[2]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(s[2])
         );
  DFFSR \s_reg[1]  ( .D(next_s[1]), .CLK(clk), .R(n_rst), .S(1'b1), .Q(s[1])
         );
  NOR2X1 U10 ( .A(n6), .B(n8), .Y(sbc_enable) );
  NAND2X1 U11 ( .A(n9), .B(n7), .Y(n8) );
  OAI21X1 U12 ( .A(n6), .B(n10), .C(n11), .Y(next_s[2]) );
  AOI21X1 U13 ( .A(enable_timer), .B(packet_done), .C(n4), .Y(n11) );
  OR2X1 U14 ( .A(framing_error), .B(s[1]), .Y(n10) );
  OAI21X1 U15 ( .A(framing_error), .B(n9), .C(n13), .Y(next_s[1]) );
  NAND3X1 U16 ( .A(n14), .B(n12), .C(n13), .Y(next_s[0]) );
  AOI21X1 U17 ( .A(s[0]), .B(n15), .C(sbc_clear), .Y(n13) );
  NOR2X1 U18 ( .A(n9), .B(s[2]), .Y(sbc_clear) );
  NAND2X1 U19 ( .A(s[0]), .B(n7), .Y(n9) );
  NOR2X1 U20 ( .A(packet_done), .B(s[2]), .Y(n15) );
  NAND3X1 U21 ( .A(n5), .B(n7), .C(s[2]), .Y(n12) );
  NAND3X1 U22 ( .A(n5), .B(n7), .C(start_bit_detected), .Y(n14) );
  NOR2X1 U23 ( .A(n7), .B(n16), .Y(load_buffer) );
  NAND2X1 U24 ( .A(s[2]), .B(n5), .Y(n16) );
  NOR2X1 U25 ( .A(s[2]), .B(n17), .Y(enable_timer) );
  NAND2X1 U26 ( .A(s[1]), .B(s[0]), .Y(n17) );
  INVX2 U6 ( .A(n12), .Y(n4) );
  INVX2 U7 ( .A(s[0]), .Y(n5) );
  INVX2 U8 ( .A(s[2]), .Y(n6) );
  INVX2 U9 ( .A(s[1]), .Y(n7) );
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
  wire   N7, N8, N9, N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20,
         N21, n42, n43, n44, n45, n46, n47, n48, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n102, n103, n1, n2, n3, n4, n5, n6, n7, n8, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35;
  wire   [13:0] next_count;

  DFFSR \count_out_reg[0]  ( .D(next_count[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[0]) );
  DFFSR \count_out_reg[10]  ( .D(next_count[10]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[10]) );
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
  DFFSR \count_out_reg[11]  ( .D(next_count[11]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[11]) );
  DFFSR \count_out_reg[12]  ( .D(next_count[12]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[12]) );
  DFFSR \count_out_reg[13]  ( .D(next_count[13]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(count_out[13]) );
  DFFSR rollover_flag_reg ( .D(N21), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  AND2X2 U18 ( .A(n42), .B(n43), .Y(N21) );
  NOR2X1 U37 ( .A(n44), .B(n45), .Y(n43) );
  NAND3X1 U38 ( .A(n46), .B(n47), .C(n48), .Y(n45) );
  XNOR2X1 U39 ( .A(rollover_val[10]), .B(next_count[10]), .Y(n48) );
  OAI21X1 U40 ( .A(n6), .B(n2), .C(n50), .Y(next_count[10]) );
  NAND2X1 U41 ( .A(N17), .B(n4), .Y(n50) );
  XNOR2X1 U42 ( .A(rollover_val[11]), .B(next_count[11]), .Y(n47) );
  OAI21X1 U43 ( .A(n31), .B(n2), .C(n51), .Y(next_count[11]) );
  NAND2X1 U44 ( .A(N18), .B(n4), .Y(n51) );
  XNOR2X1 U45 ( .A(rollover_val[1]), .B(next_count[1]), .Y(n46) );
  OAI21X1 U46 ( .A(n7), .B(n2), .C(n52), .Y(next_count[1]) );
  NAND2X1 U47 ( .A(N8), .B(n4), .Y(n52) );
  NAND3X1 U48 ( .A(n53), .B(n54), .C(n55), .Y(n44) );
  NOR2X1 U49 ( .A(n56), .B(n57), .Y(n55) );
  XOR2X1 U50 ( .A(rollover_val[4]), .B(next_count[4]), .Y(n57) );
  OAI21X1 U51 ( .A(n25), .B(n2), .C(n58), .Y(next_count[4]) );
  NAND2X1 U52 ( .A(N11), .B(n4), .Y(n58) );
  XOR2X1 U53 ( .A(rollover_val[3]), .B(next_count[3]), .Y(n56) );
  OAI21X1 U54 ( .A(n24), .B(n2), .C(n59), .Y(next_count[3]) );
  NAND2X1 U55 ( .A(N10), .B(n4), .Y(n59) );
  XNOR2X1 U56 ( .A(rollover_val[2]), .B(next_count[2]), .Y(n54) );
  OAI21X1 U57 ( .A(n8), .B(n2), .C(n60), .Y(next_count[2]) );
  NAND2X1 U58 ( .A(N9), .B(n4), .Y(n60) );
  XNOR2X1 U59 ( .A(rollover_val[0]), .B(next_count[0]), .Y(n53) );
  OAI21X1 U60 ( .A(n5), .B(n2), .C(n61), .Y(next_count[0]) );
  AOI22X1 U61 ( .A(n62), .B(n3), .C(N7), .D(n4), .Y(n61) );
  NOR2X1 U62 ( .A(clear), .B(n34), .Y(n62) );
  NOR2X1 U63 ( .A(n64), .B(n65), .Y(n42) );
  NAND3X1 U64 ( .A(n66), .B(n67), .C(n68), .Y(n65) );
  XNOR2X1 U65 ( .A(rollover_val[13]), .B(next_count[13]), .Y(n68) );
  OAI21X1 U66 ( .A(n33), .B(n2), .C(n69), .Y(next_count[13]) );
  NAND2X1 U67 ( .A(N20), .B(n4), .Y(n69) );
  XNOR2X1 U68 ( .A(rollover_val[12]), .B(next_count[12]), .Y(n67) );
  OAI21X1 U69 ( .A(n32), .B(n2), .C(n70), .Y(next_count[12]) );
  NAND2X1 U70 ( .A(N19), .B(n4), .Y(n70) );
  XNOR2X1 U71 ( .A(rollover_val[5]), .B(next_count[5]), .Y(n66) );
  OAI21X1 U72 ( .A(n26), .B(n2), .C(n71), .Y(next_count[5]) );
  NAND2X1 U73 ( .A(N12), .B(n4), .Y(n71) );
  NAND3X1 U74 ( .A(n72), .B(n73), .C(n74), .Y(n64) );
  NOR2X1 U75 ( .A(n75), .B(n76), .Y(n74) );
  XOR2X1 U76 ( .A(rollover_val[7]), .B(next_count[7]), .Y(n76) );
  OAI21X1 U77 ( .A(n28), .B(n2), .C(n77), .Y(next_count[7]) );
  NAND2X1 U78 ( .A(N14), .B(n4), .Y(n77) );
  XOR2X1 U79 ( .A(rollover_val[9]), .B(next_count[9]), .Y(n75) );
  OAI21X1 U80 ( .A(n30), .B(n2), .C(n78), .Y(next_count[9]) );
  NAND2X1 U81 ( .A(N16), .B(n4), .Y(n78) );
  XNOR2X1 U82 ( .A(rollover_val[8]), .B(next_count[8]), .Y(n73) );
  OAI21X1 U83 ( .A(n29), .B(n2), .C(n79), .Y(next_count[8]) );
  NAND2X1 U84 ( .A(N15), .B(n4), .Y(n79) );
  XNOR2X1 U85 ( .A(rollover_val[6]), .B(next_count[6]), .Y(n72) );
  OAI21X1 U86 ( .A(n27), .B(n2), .C(n80), .Y(next_count[6]) );
  NAND2X1 U87 ( .A(N13), .B(n4), .Y(n80) );
  NAND3X1 U88 ( .A(n63), .B(n35), .C(count_enable), .Y(n81) );
  NAND2X1 U89 ( .A(n82), .B(n83), .Y(n63) );
  NOR2X1 U90 ( .A(n84), .B(n85), .Y(n83) );
  NAND3X1 U91 ( .A(n86), .B(n87), .C(n88), .Y(n85) );
  XOR2X1 U92 ( .A(n6), .B(rollover_val[10]), .Y(n88) );
  XOR2X1 U93 ( .A(n31), .B(rollover_val[11]), .Y(n87) );
  XOR2X1 U94 ( .A(n7), .B(rollover_val[1]), .Y(n86) );
  NAND3X1 U95 ( .A(n89), .B(n90), .C(n91), .Y(n84) );
  NOR2X1 U96 ( .A(n92), .B(n93), .Y(n91) );
  XOR2X1 U97 ( .A(rollover_val[4]), .B(count_out[4]), .Y(n93) );
  XOR2X1 U98 ( .A(rollover_val[3]), .B(count_out[3]), .Y(n92) );
  XOR2X1 U99 ( .A(n8), .B(rollover_val[2]), .Y(n90) );
  XOR2X1 U100 ( .A(n5), .B(rollover_val[0]), .Y(n89) );
  NOR2X1 U101 ( .A(n94), .B(n95), .Y(n82) );
  NAND3X1 U102 ( .A(n96), .B(n97), .C(n98), .Y(n95) );
  XOR2X1 U103 ( .A(n33), .B(rollover_val[13]), .Y(n98) );
  XOR2X1 U104 ( .A(n32), .B(rollover_val[12]), .Y(n97) );
  XOR2X1 U105 ( .A(n26), .B(rollover_val[5]), .Y(n96) );
  NAND3X1 U106 ( .A(n99), .B(n100), .C(n101), .Y(n94) );
  NOR2X1 U107 ( .A(n102), .B(n103), .Y(n101) );
  XOR2X1 U108 ( .A(rollover_val[7]), .B(count_out[7]), .Y(n103) );
  XOR2X1 U109 ( .A(rollover_val[9]), .B(count_out[9]), .Y(n102) );
  XOR2X1 U110 ( .A(n29), .B(rollover_val[8]), .Y(n100) );
  XOR2X1 U111 ( .A(n27), .B(rollover_val[6]), .Y(n99) );
  flex_counter_000e_DW01_inc_0 add_41 ( .A(count_out), .SUM({N20, N19, N18, 
        N17, N16, N15, N14, N13, N12, N11, N10, N9, N8, N7}) );
  AND2X2 U19 ( .A(n35), .B(n34), .Y(n1) );
  INVX2 U20 ( .A(n1), .Y(n2) );
  INVX2 U21 ( .A(n81), .Y(n4) );
  INVX2 U22 ( .A(n63), .Y(n3) );
  INVX2 U23 ( .A(count_out[0]), .Y(n5) );
  INVX2 U24 ( .A(count_out[10]), .Y(n6) );
  INVX2 U25 ( .A(count_out[1]), .Y(n7) );
  INVX2 U26 ( .A(count_out[2]), .Y(n8) );
  INVX2 U27 ( .A(count_out[3]), .Y(n24) );
  INVX2 U28 ( .A(count_out[4]), .Y(n25) );
  INVX2 U29 ( .A(count_out[5]), .Y(n26) );
  INVX2 U30 ( .A(count_out[6]), .Y(n27) );
  INVX2 U31 ( .A(count_out[7]), .Y(n28) );
  INVX2 U32 ( .A(count_out[8]), .Y(n29) );
  INVX2 U33 ( .A(count_out[9]), .Y(n30) );
  INVX2 U34 ( .A(count_out[11]), .Y(n31) );
  INVX2 U35 ( .A(count_out[12]), .Y(n32) );
  INVX2 U36 ( .A(count_out[13]), .Y(n33) );
  INVX2 U112 ( .A(count_enable), .Y(n34) );
  INVX2 U113 ( .A(clear), .Y(n35) );
endmodule


module flex_counter_NUM_CNT_BITS4 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N11, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n39, n40, n41, n42, n43, n44, n1, n2, n3, n4, n5, n6, n7,
         n8, n14, n15;
  wire   [3:0] next_count;

  DFFSR \count_out_reg[0]  ( .D(next_count[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(next_count[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n1), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(next_count[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[3]) );
  DFFSR rollover_flag_reg ( .D(N11), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  NOR2X1 U18 ( .A(n24), .B(n25), .Y(N11) );
  NAND2X1 U19 ( .A(n26), .B(n27), .Y(n25) );
  XNOR2X1 U20 ( .A(rollover_val[2]), .B(n1), .Y(n27) );
  AOI22X1 U21 ( .A(n29), .B(count_out[2]), .C(n7), .D(n2), .Y(n28) );
  XNOR2X1 U22 ( .A(rollover_val[1]), .B(next_count[1]), .Y(n26) );
  OAI21X1 U23 ( .A(n3), .B(n6), .C(n30), .Y(next_count[1]) );
  NAND3X1 U24 ( .A(count_out[0]), .B(n6), .C(n5), .Y(n30) );
  NAND2X1 U25 ( .A(n31), .B(n32), .Y(n24) );
  XNOR2X1 U26 ( .A(rollover_val[3]), .B(next_count[3]), .Y(n32) );
  OAI21X1 U27 ( .A(n33), .B(n8), .C(n34), .Y(next_count[3]) );
  NAND3X1 U28 ( .A(count_out[2]), .B(n8), .C(n2), .Y(n34) );
  NAND3X1 U29 ( .A(count_out[1]), .B(count_out[0]), .C(n5), .Y(n35) );
  AOI21X1 U30 ( .A(n5), .B(n7), .C(n29), .Y(n33) );
  OAI21X1 U31 ( .A(count_out[1]), .B(n36), .C(n3), .Y(n29) );
  OAI22X1 U32 ( .A(count_enable), .B(clear), .C(count_out[0]), .D(n36), .Y(n37) );
  XNOR2X1 U33 ( .A(rollover_val[0]), .B(next_count[0]), .Y(n31) );
  OAI22X1 U34 ( .A(count_out[0]), .B(n36), .C(clear), .D(n38), .Y(
        next_count[0]) );
  AOI22X1 U35 ( .A(n4), .B(count_enable), .C(count_out[0]), .D(n14), .Y(n38)
         );
  NAND3X1 U36 ( .A(n39), .B(n15), .C(count_enable), .Y(n36) );
  NAND3X1 U37 ( .A(n40), .B(n41), .C(n42), .Y(n39) );
  NOR2X1 U38 ( .A(n43), .B(n44), .Y(n42) );
  XOR2X1 U39 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n44) );
  XOR2X1 U40 ( .A(rollover_val[3]), .B(count_out[3]), .Y(n43) );
  XOR2X1 U41 ( .A(rollover_val[2]), .B(n7), .Y(n41) );
  XOR2X1 U42 ( .A(rollover_val[1]), .B(n6), .Y(n40) );
  INVX2 U8 ( .A(n28), .Y(n1) );
  INVX2 U9 ( .A(n35), .Y(n2) );
  INVX2 U10 ( .A(n37), .Y(n3) );
  INVX2 U11 ( .A(n39), .Y(n4) );
  INVX2 U12 ( .A(n36), .Y(n5) );
  INVX2 U13 ( .A(count_out[1]), .Y(n6) );
  INVX2 U14 ( .A(count_out[2]), .Y(n7) );
  INVX2 U15 ( .A(count_out[3]), .Y(n8) );
  INVX2 U16 ( .A(count_enable), .Y(n14) );
  INVX2 U17 ( .A(clear), .Y(n15) );
endmodule


module timer ( clk, n_rst, enable_timer, shift_enable, packet_done, data_size, 
        bit_period );
  input [3:0] data_size;
  input [13:0] bit_period;
  input clk, n_rst, enable_timer;
  output shift_enable, packet_done;
  wire   \_2_net_[3] , \_2_net_[2] , \_2_net_[1] , n4, n5, n1, n2, n3, n6, n7;

  XOR2X1 U5 ( .A(data_size[3]), .B(n4), .Y(\_2_net_[3] ) );
  NOR2X1 U6 ( .A(n5), .B(n6), .Y(n4) );
  XOR2X1 U7 ( .A(n6), .B(n5), .Y(\_2_net_[2] ) );
  NAND2X1 U8 ( .A(data_size[1]), .B(data_size[0]), .Y(n5) );
  XOR2X1 U9 ( .A(data_size[1]), .B(data_size[0]), .Y(\_2_net_[1] ) );
  flex_counter_000e clk_divder ( .clk(clk), .n_rst(n1), .clear(n3), 
        .count_enable(enable_timer), .rollover_val(bit_period), 
        .rollover_flag(shift_enable) );
  flex_counter_NUM_CNT_BITS4 controller ( .clk(clk), .n_rst(n1), .clear(n3), 
        .count_enable(shift_enable), .rollover_val({\_2_net_[3] , \_2_net_[2] , 
        \_2_net_[1] , n7}), .rollover_flag(packet_done) );
  INVX2 U2 ( .A(n2), .Y(n1) );
  INVX2 U3 ( .A(n_rst), .Y(n2) );
  INVX2 U4 ( .A(enable_timer), .Y(n3) );
  INVX2 U10 ( .A(data_size[2]), .Y(n6) );
  INVX2 U11 ( .A(data_size[0]), .Y(n7) );
endmodule


module stop_bit_chk ( clk, n_rst, sbc_clear, sbc_enable, stop_bit, 
        framing_error );
  input clk, n_rst, sbc_clear, sbc_enable, stop_bit;
  output framing_error;
  wire   n4, n5, n2, n3;

  DFFSR framing_error_reg ( .D(n5), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        framing_error) );
  NOR2X1 U5 ( .A(sbc_clear), .B(n4), .Y(n5) );
  AOI22X1 U6 ( .A(framing_error), .B(n3), .C(sbc_enable), .D(n2), .Y(n4) );
  INVX2 U3 ( .A(stop_bit), .Y(n2) );
  INVX2 U4 ( .A(sbc_enable), .Y(n3) );
endmodule


module rx_data_buff ( clk, n_rst, load_buffer, packet_data, data_read, rx_data, 
        data_ready, overrun_error );
  input [7:0] packet_data;
  output [7:0] rx_data;
  input clk, n_rst, load_buffer, data_read;
  output data_ready, overrun_error;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n30, n31, n2, n11, n15, n17, n19,
         n21, n23, n25, n27, n29, n32, n33;

  DFFSR \rx_data_reg[7]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n11), .Q(
        rx_data[7]) );
  DFFSR \rx_data_reg[6]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n11), .Q(
        rx_data[6]) );
  DFFSR \rx_data_reg[5]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n11), .Q(
        rx_data[5]) );
  DFFSR \rx_data_reg[4]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n11), .Q(
        rx_data[4]) );
  DFFSR \rx_data_reg[3]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n11), .Q(
        rx_data[3]) );
  DFFSR \rx_data_reg[2]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n11), .Q(
        rx_data[2]) );
  DFFSR \rx_data_reg[1]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n11), .Q(
        rx_data[1]) );
  DFFSR \rx_data_reg[0]  ( .D(n32), .CLK(clk), .R(1'b1), .S(n11), .Q(
        rx_data[0]) );
  DFFSR data_ready_reg ( .D(n31), .CLK(clk), .R(n11), .S(1'b1), .Q(data_ready)
         );
  DFFSR overrun_error_reg ( .D(n30), .CLK(clk), .R(n11), .S(1'b1), .Q(
        overrun_error) );
  AOI22X1 U4 ( .A(rx_data[0]), .B(n2), .C(packet_data[0]), .D(load_buffer), 
        .Y(n1) );
  AOI22X1 U6 ( .A(rx_data[1]), .B(n2), .C(packet_data[1]), .D(load_buffer), 
        .Y(n3) );
  AOI22X1 U8 ( .A(rx_data[2]), .B(n2), .C(packet_data[2]), .D(load_buffer), 
        .Y(n4) );
  AOI22X1 U10 ( .A(rx_data[3]), .B(n2), .C(packet_data[3]), .D(load_buffer), 
        .Y(n5) );
  AOI22X1 U12 ( .A(rx_data[4]), .B(n2), .C(packet_data[4]), .D(load_buffer), 
        .Y(n6) );
  AOI22X1 U14 ( .A(rx_data[5]), .B(n2), .C(packet_data[5]), .D(load_buffer), 
        .Y(n7) );
  AOI22X1 U16 ( .A(rx_data[6]), .B(n2), .C(packet_data[6]), .D(load_buffer), 
        .Y(n8) );
  AOI22X1 U18 ( .A(rx_data[7]), .B(n2), .C(packet_data[7]), .D(load_buffer), 
        .Y(n9) );
  NOR2X1 U19 ( .A(data_read), .B(n10), .Y(n30) );
  AOI21X1 U20 ( .A(data_ready), .B(load_buffer), .C(overrun_error), .Y(n10) );
  OAI21X1 U21 ( .A(data_read), .B(n33), .C(n2), .Y(n31) );
  INVX2 U3 ( .A(n15), .Y(n11) );
  INVX2 U5 ( .A(n_rst), .Y(n15) );
  INVX2 U7 ( .A(load_buffer), .Y(n2) );
  INVX2 U9 ( .A(n8), .Y(n17) );
  INVX2 U11 ( .A(n9), .Y(n19) );
  INVX2 U13 ( .A(n6), .Y(n21) );
  INVX2 U15 ( .A(n7), .Y(n23) );
  INVX2 U17 ( .A(n5), .Y(n25) );
  INVX2 U22 ( .A(n4), .Y(n27) );
  INVX2 U23 ( .A(n3), .Y(n29) );
  INVX2 U34 ( .A(n1), .Y(n32) );
  INVX2 U35 ( .A(data_ready), .Y(n33) );
endmodule


module rcv_block ( clk, n_rst, serial_in, data_read, rx_data, data_ready, 
        overrun_error, framing_error, data_size, bit_period );
  output [7:0] rx_data;
  input [3:0] data_size;
  input [13:0] bit_period;
  input clk, n_rst, serial_in, data_read;
  output data_ready, overrun_error, framing_error;
  wire   start, shift_en, stop, done, sbc_clr, sbc_en, ld_buf, timer_en, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n1, n2, n3, n4, n5, n6, n7,
         n8, n9, n10, n11;
  wire   [7:0] packet_data_in;
  wire   [7:0] packet_data_out;

  NOR2X1 U13 ( .A(n12), .B(n1), .Y(packet_data_in[7]) );
  OAI22X1 U14 ( .A(n1), .B(n13), .C(n12), .D(n2), .Y(packet_data_in[6]) );
  OAI22X1 U15 ( .A(n2), .B(n13), .C(n12), .D(n3), .Y(packet_data_in[5]) );
  OAI21X1 U16 ( .A(n13), .B(n3), .C(n14), .Y(packet_data_in[4]) );
  AOI22X1 U17 ( .A(n15), .B(packet_data_out[7]), .C(packet_data_out[4]), .D(n8), .Y(n14) );
  OAI21X1 U18 ( .A(n13), .B(n4), .C(n16), .Y(packet_data_in[3]) );
  AOI22X1 U19 ( .A(n15), .B(packet_data_out[6]), .C(packet_data_out[3]), .D(n8), .Y(n16) );
  OAI21X1 U20 ( .A(n13), .B(n5), .C(n17), .Y(packet_data_in[2]) );
  AOI22X1 U21 ( .A(n15), .B(packet_data_out[5]), .C(packet_data_out[2]), .D(n8), .Y(n17) );
  OAI21X1 U22 ( .A(n13), .B(n6), .C(n18), .Y(packet_data_in[1]) );
  AOI22X1 U23 ( .A(packet_data_out[4]), .B(n15), .C(packet_data_out[1]), .D(n8), .Y(n18) );
  OAI21X1 U24 ( .A(n13), .B(n7), .C(n19), .Y(packet_data_in[0]) );
  AOI22X1 U25 ( .A(packet_data_out[3]), .B(n15), .C(packet_data_out[0]), .D(n8), .Y(n19) );
  NAND2X1 U26 ( .A(n13), .B(n10), .Y(n12) );
  NOR2X1 U27 ( .A(n20), .B(data_size[1]), .Y(n15) );
  NAND2X1 U28 ( .A(data_size[1]), .B(n9), .Y(n13) );
  NAND3X1 U29 ( .A(data_size[0]), .B(n11), .C(data_size[2]), .Y(n20) );
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
  INVX2 U2 ( .A(packet_data_out[7]), .Y(n1) );
  INVX2 U3 ( .A(packet_data_out[6]), .Y(n2) );
  INVX2 U4 ( .A(packet_data_out[5]), .Y(n3) );
  INVX2 U5 ( .A(packet_data_out[4]), .Y(n4) );
  INVX2 U6 ( .A(packet_data_out[3]), .Y(n5) );
  INVX2 U7 ( .A(packet_data_out[2]), .Y(n6) );
  INVX2 U8 ( .A(packet_data_out[1]), .Y(n7) );
  INVX2 U9 ( .A(n12), .Y(n8) );
  INVX2 U10 ( .A(n20), .Y(n9) );
  INVX2 U11 ( .A(n15), .Y(n10) );
  INVX2 U12 ( .A(data_size[3]), .Y(n11) );
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

