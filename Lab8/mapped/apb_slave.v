/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Oct 20 21:26:03 2020
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
  wire   n106, n109, n112, n115, n118, n121, n124, n127, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238;
  wire   [7:6] bit_period_reg1;
  wire   [7:0] next_prdata_reg;
  wire   [7:0] data_buffer_reg;
  wire   [7:0] next_bit_period_reg0;
  wire   [7:0] next_bit_period_reg1;
  wire   [7:0] next_data_size_reg;
  assign data_read = 1'b0;

  DFFSR \data_size_reg_reg[3]  ( .D(next_data_size_reg[3]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(data_size[3]) );
  DFFSR \data_size_reg_reg[2]  ( .D(next_data_size_reg[2]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(data_size[2]) );
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
  DFFSR \bit_period_reg0_reg[3]  ( .D(next_bit_period_reg0[3]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period[3]) );
  DFFSR \bit_period_reg0_reg[2]  ( .D(next_bit_period_reg0[2]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period[2]) );
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
  DFFSR \bit_period_reg1_reg[3]  ( .D(next_bit_period_reg1[3]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period[11]) );
  DFFSR \bit_period_reg1_reg[2]  ( .D(next_bit_period_reg1[2]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period[10]) );
  DFFSR \bit_period_reg1_reg[1]  ( .D(next_bit_period_reg1[1]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period[9]) );
  DFFSR \bit_period_reg1_reg[0]  ( .D(next_bit_period_reg1[0]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(bit_period[8]) );
  DFFSR \data_buffer_reg_reg[7]  ( .D(n127), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buffer_reg[7]) );
  DFFSR \prdata_reg_reg[7]  ( .D(next_prdata_reg[7]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(prdata[7]) );
  DFFSR \data_buffer_reg_reg[6]  ( .D(n124), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buffer_reg[6]) );
  DFFSR \prdata_reg_reg[6]  ( .D(next_prdata_reg[6]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(prdata[6]) );
  DFFSR \data_buffer_reg_reg[5]  ( .D(n121), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buffer_reg[5]) );
  DFFSR \prdata_reg_reg[5]  ( .D(next_prdata_reg[5]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(prdata[5]) );
  DFFSR \data_buffer_reg_reg[4]  ( .D(n118), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buffer_reg[4]) );
  DFFSR \prdata_reg_reg[4]  ( .D(next_prdata_reg[4]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(prdata[4]) );
  DFFSR \data_buffer_reg_reg[3]  ( .D(n115), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buffer_reg[3]) );
  DFFSR \prdata_reg_reg[3]  ( .D(next_prdata_reg[3]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(prdata[3]) );
  DFFSR \data_buffer_reg_reg[2]  ( .D(n112), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buffer_reg[2]) );
  DFFSR \prdata_reg_reg[2]  ( .D(next_prdata_reg[2]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(prdata[2]) );
  DFFSR \data_buffer_reg_reg[1]  ( .D(n109), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buffer_reg[1]) );
  DFFSR \prdata_reg_reg[1]  ( .D(next_prdata_reg[1]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(prdata[1]) );
  DFFSR \data_buffer_reg_reg[0]  ( .D(n106), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(data_buffer_reg[0]) );
  DFFSR \prdata_reg_reg[0]  ( .D(next_prdata_reg[0]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(prdata[0]) );
  OAI21X1 U180 ( .A(n148), .B(n149), .C(n150), .Y(pslverr) );
  NAND3X1 U181 ( .A(n151), .B(n152), .C(psel), .Y(n150) );
  INVX1 U182 ( .A(n153), .Y(n151) );
  NAND2X1 U183 ( .A(n154), .B(n155), .Y(next_prdata_reg[7]) );
  AOI22X1 U184 ( .A(bit_period_reg1[7]), .B(n156), .C(bit_period[7]), .D(n157), 
        .Y(n155) );
  AOI22X1 U185 ( .A(prdata[7]), .B(n158), .C(data_buffer_reg[7]), .D(n159), 
        .Y(n154) );
  NAND2X1 U186 ( .A(n160), .B(n161), .Y(next_prdata_reg[6]) );
  AOI22X1 U187 ( .A(bit_period_reg1[6]), .B(n156), .C(bit_period[6]), .D(n157), 
        .Y(n161) );
  AOI22X1 U188 ( .A(prdata[6]), .B(n158), .C(data_buffer_reg[6]), .D(n159), 
        .Y(n160) );
  NAND2X1 U189 ( .A(n162), .B(n163), .Y(next_prdata_reg[5]) );
  AOI22X1 U190 ( .A(bit_period[13]), .B(n156), .C(bit_period[5]), .D(n157), 
        .Y(n163) );
  AOI22X1 U191 ( .A(prdata[5]), .B(n158), .C(data_buffer_reg[5]), .D(n159), 
        .Y(n162) );
  NAND2X1 U192 ( .A(n164), .B(n165), .Y(next_prdata_reg[4]) );
  AOI22X1 U193 ( .A(bit_period[12]), .B(n156), .C(bit_period[4]), .D(n157), 
        .Y(n165) );
  AOI22X1 U194 ( .A(prdata[4]), .B(n158), .C(data_buffer_reg[4]), .D(n159), 
        .Y(n164) );
  NAND2X1 U195 ( .A(n166), .B(n167), .Y(next_prdata_reg[3]) );
  AOI21X1 U196 ( .A(bit_period[3]), .B(n157), .C(n168), .Y(n167) );
  OAI22X1 U197 ( .A(n169), .B(n170), .C(n171), .D(n172), .Y(n168) );
  AOI22X1 U198 ( .A(prdata[3]), .B(n158), .C(data_buffer_reg[3]), .D(n159), 
        .Y(n166) );
  NAND2X1 U199 ( .A(n173), .B(n174), .Y(next_prdata_reg[2]) );
  AOI21X1 U200 ( .A(bit_period[2]), .B(n157), .C(n175), .Y(n174) );
  OAI22X1 U201 ( .A(n169), .B(n176), .C(n171), .D(n177), .Y(n175) );
  AOI22X1 U202 ( .A(prdata[2]), .B(n158), .C(data_buffer_reg[2]), .D(n159), 
        .Y(n173) );
  NAND3X1 U203 ( .A(n178), .B(n179), .C(n180), .Y(next_prdata_reg[1]) );
  AOI21X1 U204 ( .A(data_size[1]), .B(n181), .C(n182), .Y(n180) );
  OAI22X1 U205 ( .A(n171), .B(n183), .C(n184), .D(n185), .Y(n182) );
  NAND2X1 U206 ( .A(overrun_error), .B(n186), .Y(n185) );
  NAND3X1 U207 ( .A(n187), .B(n188), .C(n189), .Y(n184) );
  INVX1 U208 ( .A(framing_error), .Y(n188) );
  INVX1 U209 ( .A(n156), .Y(n171) );
  INVX1 U210 ( .A(n169), .Y(n181) );
  NAND2X1 U211 ( .A(data_buffer_reg[1]), .B(n159), .Y(n179) );
  AOI22X1 U212 ( .A(bit_period[1]), .B(n157), .C(prdata[1]), .D(n158), .Y(n178) );
  OR2X1 U213 ( .A(n190), .B(n191), .Y(next_prdata_reg[0]) );
  OAI21X1 U214 ( .A(n192), .B(n193), .C(n194), .Y(n191) );
  AOI22X1 U215 ( .A(bit_period[0]), .B(n157), .C(prdata[0]), .D(n158), .Y(n194) );
  NOR2X1 U216 ( .A(n189), .B(n195), .Y(n158) );
  INVX1 U217 ( .A(n196), .Y(n157) );
  NAND3X1 U218 ( .A(n195), .B(n189), .C(n197), .Y(n196) );
  INVX1 U219 ( .A(n159), .Y(n192) );
  NOR2X1 U220 ( .A(n189), .B(n187), .Y(n159) );
  OAI21X1 U221 ( .A(n169), .B(n198), .C(n199), .Y(n190) );
  AOI22X1 U222 ( .A(n200), .B(n201), .C(bit_period[8]), .D(n156), .Y(n199) );
  NOR2X1 U223 ( .A(n187), .B(n195), .Y(n156) );
  INVX1 U224 ( .A(n202), .Y(n201) );
  MUX2X1 U225 ( .B(framing_error), .A(data_ready), .S(n195), .Y(n202) );
  NOR2X1 U226 ( .A(n197), .B(n203), .Y(n200) );
  INVX1 U227 ( .A(n187), .Y(n197) );
  INVX1 U228 ( .A(data_size[0]), .Y(n198) );
  NAND3X1 U229 ( .A(n195), .B(n187), .C(n203), .Y(n169) );
  INVX1 U230 ( .A(n189), .Y(n203) );
  NAND2X1 U231 ( .A(n204), .B(paddr[2]), .Y(n189) );
  NAND2X1 U232 ( .A(n204), .B(paddr[1]), .Y(n187) );
  INVX1 U233 ( .A(n205), .Y(n204) );
  INVX1 U234 ( .A(n186), .Y(n195) );
  NOR2X1 U235 ( .A(n205), .B(n206), .Y(n186) );
  NAND3X1 U236 ( .A(n153), .B(n152), .C(psel), .Y(n205) );
  INVX1 U237 ( .A(pwrite), .Y(n152) );
  NAND3X1 U238 ( .A(paddr[1]), .B(paddr[0]), .C(paddr[2]), .Y(n153) );
  MUX2X1 U239 ( .B(n170), .A(n207), .S(n208), .Y(next_data_size_reg[3]) );
  INVX1 U240 ( .A(data_size[3]), .Y(n170) );
  MUX2X1 U241 ( .B(n176), .A(n209), .S(n208), .Y(next_data_size_reg[2]) );
  INVX1 U242 ( .A(data_size[2]), .Y(n176) );
  INVX1 U243 ( .A(n210), .Y(next_data_size_reg[1]) );
  MUX2X1 U244 ( .B(data_size[1]), .A(pwdata[1]), .S(n208), .Y(n210) );
  INVX1 U245 ( .A(n211), .Y(next_data_size_reg[0]) );
  MUX2X1 U246 ( .B(data_size[0]), .A(pwdata[0]), .S(n208), .Y(n211) );
  AND2X1 U247 ( .A(n212), .B(paddr[2]), .Y(n208) );
  INVX1 U248 ( .A(n213), .Y(next_bit_period_reg1[7]) );
  MUX2X1 U249 ( .B(pwdata[7]), .A(bit_period_reg1[7]), .S(n214), .Y(n213) );
  INVX1 U250 ( .A(n215), .Y(next_bit_period_reg1[6]) );
  MUX2X1 U251 ( .B(pwdata[6]), .A(bit_period_reg1[6]), .S(n214), .Y(n215) );
  INVX1 U252 ( .A(n216), .Y(next_bit_period_reg1[5]) );
  MUX2X1 U253 ( .B(pwdata[5]), .A(bit_period[13]), .S(n214), .Y(n216) );
  INVX1 U254 ( .A(n217), .Y(next_bit_period_reg1[4]) );
  MUX2X1 U255 ( .B(pwdata[4]), .A(bit_period[12]), .S(n214), .Y(n217) );
  MUX2X1 U256 ( .B(n207), .A(n172), .S(n214), .Y(next_bit_period_reg1[3]) );
  INVX1 U257 ( .A(bit_period[11]), .Y(n172) );
  INVX1 U258 ( .A(pwdata[3]), .Y(n207) );
  MUX2X1 U259 ( .B(n209), .A(n177), .S(n214), .Y(next_bit_period_reg1[2]) );
  INVX1 U260 ( .A(bit_period[10]), .Y(n177) );
  INVX1 U261 ( .A(pwdata[2]), .Y(n209) );
  MUX2X1 U262 ( .B(n218), .A(n183), .S(n214), .Y(next_bit_period_reg1[1]) );
  INVX1 U263 ( .A(bit_period[9]), .Y(n183) );
  INVX1 U264 ( .A(pwdata[1]), .Y(n218) );
  INVX1 U265 ( .A(n219), .Y(next_bit_period_reg1[0]) );
  MUX2X1 U266 ( .B(pwdata[0]), .A(bit_period[8]), .S(n214), .Y(n219) );
  INVX1 U267 ( .A(n220), .Y(next_bit_period_reg0[7]) );
  MUX2X1 U268 ( .B(pwdata[7]), .A(bit_period[7]), .S(n221), .Y(n220) );
  INVX1 U269 ( .A(n222), .Y(next_bit_period_reg0[6]) );
  MUX2X1 U270 ( .B(pwdata[6]), .A(bit_period[6]), .S(n221), .Y(n222) );
  INVX1 U271 ( .A(n223), .Y(next_bit_period_reg0[5]) );
  MUX2X1 U272 ( .B(pwdata[5]), .A(bit_period[5]), .S(n221), .Y(n223) );
  INVX1 U273 ( .A(n224), .Y(next_bit_period_reg0[4]) );
  MUX2X1 U274 ( .B(pwdata[4]), .A(bit_period[4]), .S(n221), .Y(n224) );
  INVX1 U275 ( .A(n225), .Y(next_bit_period_reg0[3]) );
  MUX2X1 U276 ( .B(pwdata[3]), .A(bit_period[3]), .S(n221), .Y(n225) );
  INVX1 U277 ( .A(n226), .Y(next_bit_period_reg0[2]) );
  MUX2X1 U278 ( .B(pwdata[2]), .A(bit_period[2]), .S(n221), .Y(n226) );
  INVX1 U279 ( .A(n227), .Y(next_bit_period_reg0[1]) );
  MUX2X1 U280 ( .B(pwdata[1]), .A(bit_period[1]), .S(n221), .Y(n227) );
  INVX1 U281 ( .A(n228), .Y(next_bit_period_reg0[0]) );
  MUX2X1 U282 ( .B(pwdata[0]), .A(bit_period[0]), .S(n221), .Y(n228) );
  NAND3X1 U283 ( .A(paddr[1]), .B(n214), .C(n212), .Y(n221) );
  NAND2X1 U284 ( .A(n212), .B(paddr[0]), .Y(n214) );
  NOR2X1 U285 ( .A(n149), .B(n229), .Y(n212) );
  INVX1 U286 ( .A(n148), .Y(n229) );
  MUX2X1 U287 ( .B(n230), .A(paddr[2]), .S(paddr[1]), .Y(n148) );
  NAND2X1 U288 ( .A(n206), .B(paddr[2]), .Y(n230) );
  INVX1 U289 ( .A(paddr[0]), .Y(n206) );
  NAND3X1 U290 ( .A(penable), .B(psel), .C(pwrite), .Y(n149) );
  INVX1 U291 ( .A(n231), .Y(n127) );
  MUX2X1 U292 ( .B(data_buffer_reg[7]), .A(rx_data[7]), .S(data_ready), .Y(
        n231) );
  INVX1 U293 ( .A(n232), .Y(n124) );
  MUX2X1 U294 ( .B(data_buffer_reg[6]), .A(rx_data[6]), .S(data_ready), .Y(
        n232) );
  INVX1 U295 ( .A(n233), .Y(n121) );
  MUX2X1 U296 ( .B(data_buffer_reg[5]), .A(rx_data[5]), .S(data_ready), .Y(
        n233) );
  INVX1 U297 ( .A(n234), .Y(n118) );
  MUX2X1 U298 ( .B(data_buffer_reg[4]), .A(rx_data[4]), .S(data_ready), .Y(
        n234) );
  INVX1 U299 ( .A(n235), .Y(n115) );
  MUX2X1 U300 ( .B(data_buffer_reg[3]), .A(rx_data[3]), .S(data_ready), .Y(
        n235) );
  INVX1 U301 ( .A(n236), .Y(n112) );
  MUX2X1 U302 ( .B(data_buffer_reg[2]), .A(rx_data[2]), .S(data_ready), .Y(
        n236) );
  INVX1 U303 ( .A(n237), .Y(n109) );
  MUX2X1 U304 ( .B(data_buffer_reg[1]), .A(rx_data[1]), .S(data_ready), .Y(
        n237) );
  MUX2X1 U305 ( .B(n193), .A(n238), .S(data_ready), .Y(n106) );
  INVX1 U306 ( .A(rx_data[0]), .Y(n238) );
  INVX1 U307 ( .A(data_buffer_reg[0]), .Y(n193) );
endmodule

