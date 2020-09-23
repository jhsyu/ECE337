/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Tue Sep 22 23:07:03 2020
/////////////////////////////////////////////////////////////


module flex_counter ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   N11, n13, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55,
         n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69,
         n70;
  wire   [3:0] next_count;

  DFFSR \count_out_reg[0]  ( .D(next_count[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[0]) );
  DFFSR \count_out_reg[3]  ( .D(next_count[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[3]) );
  DFFSR \count_out_reg[1]  ( .D(next_count[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n13), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR rollover_flag_reg ( .D(N11), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  INVX1 U44 ( .A(n44), .Y(next_count[3]) );
  INVX1 U45 ( .A(n45), .Y(next_count[1]) );
  NOR2X1 U46 ( .A(n46), .B(n47), .Y(N11) );
  NAND2X1 U47 ( .A(n48), .B(n49), .Y(n47) );
  XOR2X1 U48 ( .A(n44), .B(rollover_val[3]), .Y(n49) );
  MUX2X1 U49 ( .B(n50), .A(n51), .S(count_out[3]), .Y(n44) );
  OAI21X1 U50 ( .A(count_out[2]), .B(n52), .C(n53), .Y(n51) );
  NOR2X1 U51 ( .A(n54), .B(n55), .Y(n50) );
  XOR2X1 U52 ( .A(n45), .B(rollover_val[1]), .Y(n48) );
  MUX2X1 U53 ( .B(n56), .A(n57), .S(count_out[1]), .Y(n45) );
  AND2X1 U54 ( .A(count_out[0]), .B(n58), .Y(n56) );
  NAND2X1 U55 ( .A(n59), .B(n60), .Y(n46) );
  XNOR2X1 U56 ( .A(rollover_val[0]), .B(next_count[0]), .Y(n60) );
  OAI21X1 U57 ( .A(count_out[0]), .B(n52), .C(n61), .Y(next_count[0]) );
  MUX2X1 U58 ( .B(count_out[0]), .A(n62), .S(count_enable), .Y(n61) );
  NOR2X1 U59 ( .A(clear), .B(n63), .Y(n62) );
  XNOR2X1 U60 ( .A(rollover_val[2]), .B(n13), .Y(n59) );
  MUX2X1 U61 ( .B(n55), .A(n53), .S(count_out[2]), .Y(n13) );
  AOI21X1 U62 ( .A(n64), .B(n58), .C(n57), .Y(n53) );
  OAI21X1 U63 ( .A(count_out[0]), .B(n52), .C(count_enable), .Y(n57) );
  NAND3X1 U64 ( .A(count_out[1]), .B(count_out[0]), .C(n58), .Y(n55) );
  INVX1 U65 ( .A(n52), .Y(n58) );
  NAND3X1 U66 ( .A(n63), .B(n65), .C(count_enable), .Y(n52) );
  INVX1 U67 ( .A(clear), .Y(n65) );
  NAND3X1 U68 ( .A(n66), .B(n67), .C(n68), .Y(n63) );
  NOR2X1 U69 ( .A(n69), .B(n70), .Y(n68) );
  XNOR2X1 U70 ( .A(rollover_val[1]), .B(n64), .Y(n70) );
  INVX1 U71 ( .A(count_out[1]), .Y(n64) );
  XOR2X1 U72 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n69) );
  XOR2X1 U73 ( .A(rollover_val[2]), .B(n54), .Y(n67) );
  INVX1 U74 ( .A(count_out[2]), .Y(n54) );
  XNOR2X1 U75 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n66) );
endmodule

