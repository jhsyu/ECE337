/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Sep 23 18:23:35 2020
/////////////////////////////////////////////////////////////


module flex_counter ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N11, n13, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68,
         n69;
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
  INVX1 U43 ( .A(n43), .Y(next_count[3]) );
  INVX1 U44 ( .A(n44), .Y(next_count[1]) );
  NOR2X1 U45 ( .A(n45), .B(n46), .Y(N11) );
  NAND2X1 U46 ( .A(n47), .B(n48), .Y(n46) );
  XOR2X1 U47 ( .A(n43), .B(rollover_val[3]), .Y(n48) );
  MUX2X1 U48 ( .B(n49), .A(n50), .S(count_out[3]), .Y(n43) );
  OAI21X1 U49 ( .A(count_out[2]), .B(n51), .C(n52), .Y(n50) );
  NOR2X1 U50 ( .A(n53), .B(n54), .Y(n49) );
  XOR2X1 U51 ( .A(n44), .B(rollover_val[1]), .Y(n47) );
  MUX2X1 U52 ( .B(n55), .A(n56), .S(count_out[1]), .Y(n44) );
  AND2X1 U53 ( .A(count_out[0]), .B(n57), .Y(n55) );
  NAND2X1 U54 ( .A(n58), .B(n59), .Y(n45) );
  XNOR2X1 U55 ( .A(rollover_val[0]), .B(next_count[0]), .Y(n59) );
  OAI22X1 U56 ( .A(count_out[0]), .B(n51), .C(clear), .D(n60), .Y(
        next_count[0]) );
  MUX2X1 U57 ( .B(count_out[0]), .A(n61), .S(count_enable), .Y(n60) );
  INVX1 U58 ( .A(n62), .Y(n61) );
  XNOR2X1 U59 ( .A(rollover_val[2]), .B(n13), .Y(n58) );
  MUX2X1 U60 ( .B(n54), .A(n52), .S(count_out[2]), .Y(n13) );
  AOI21X1 U61 ( .A(n63), .B(n57), .C(n56), .Y(n52) );
  OAI22X1 U62 ( .A(count_enable), .B(clear), .C(count_out[0]), .D(n51), .Y(n56) );
  NAND3X1 U63 ( .A(count_out[1]), .B(count_out[0]), .C(n57), .Y(n54) );
  INVX1 U64 ( .A(n51), .Y(n57) );
  NAND3X1 U65 ( .A(n62), .B(n64), .C(count_enable), .Y(n51) );
  INVX1 U66 ( .A(clear), .Y(n64) );
  NAND3X1 U67 ( .A(n65), .B(n66), .C(n67), .Y(n62) );
  NOR2X1 U68 ( .A(n68), .B(n69), .Y(n67) );
  XNOR2X1 U69 ( .A(rollover_val[1]), .B(n63), .Y(n69) );
  INVX1 U70 ( .A(count_out[1]), .Y(n63) );
  XOR2X1 U71 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n68) );
  XOR2X1 U72 ( .A(rollover_val[2]), .B(n53), .Y(n66) );
  INVX1 U73 ( .A(count_out[2]), .Y(n53) );
  XNOR2X1 U74 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n65) );
endmodule

