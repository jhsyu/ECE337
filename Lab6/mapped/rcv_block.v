/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Wed Oct  7 02:02:58 2020
/////////////////////////////////////////////////////////////


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


module flex_counter_NUM_CNT_BITS4_1 ( clk, n_rst, clear, count_enable, 
        rollover_val, count_out, rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n35, N11, n13, n2, n3, n4, n5, n6, n12, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34;
  wire   [3:0] next_count;

  DFFSR \count_out_reg[0]  ( .D(next_count[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[0]) );
  DFFSR \count_out_reg[1]  ( .D(next_count[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n13), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(next_count[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(count_out[3]) );
  DFFSR rollover_flag_reg ( .D(N11), .CLK(clk), .R(n_rst), .S(1'b1), .Q(n35)
         );
  BUFX2 U8 ( .A(n35), .Y(rollover_flag) );
  INVX1 U9 ( .A(n2), .Y(next_count[3]) );
  INVX1 U10 ( .A(n3), .Y(next_count[1]) );
  NOR2X1 U11 ( .A(n4), .B(n5), .Y(N11) );
  NAND2X1 U12 ( .A(n6), .B(n12), .Y(n5) );
  XOR2X1 U13 ( .A(n2), .B(rollover_val[3]), .Y(n12) );
  MUX2X1 U14 ( .B(n14), .A(n15), .S(count_out[3]), .Y(n2) );
  OAI21X1 U15 ( .A(count_out[2]), .B(n16), .C(n17), .Y(n15) );
  NOR2X1 U16 ( .A(n18), .B(n19), .Y(n14) );
  XOR2X1 U17 ( .A(n3), .B(rollover_val[1]), .Y(n6) );
  MUX2X1 U18 ( .B(n20), .A(n21), .S(count_out[1]), .Y(n3) );
  AND2X1 U19 ( .A(count_out[0]), .B(n22), .Y(n20) );
  NAND2X1 U20 ( .A(n23), .B(n24), .Y(n4) );
  XNOR2X1 U21 ( .A(rollover_val[0]), .B(next_count[0]), .Y(n24) );
  OAI22X1 U22 ( .A(count_out[0]), .B(n16), .C(clear), .D(n25), .Y(
        next_count[0]) );
  MUX2X1 U23 ( .B(count_out[0]), .A(n26), .S(count_enable), .Y(n25) );
  INVX1 U24 ( .A(n27), .Y(n26) );
  XNOR2X1 U25 ( .A(rollover_val[2]), .B(n13), .Y(n23) );
  MUX2X1 U26 ( .B(n19), .A(n17), .S(count_out[2]), .Y(n13) );
  AOI21X1 U27 ( .A(n28), .B(n22), .C(n21), .Y(n17) );
  OAI22X1 U28 ( .A(count_enable), .B(clear), .C(count_out[0]), .D(n16), .Y(n21) );
  NAND3X1 U29 ( .A(count_out[1]), .B(count_out[0]), .C(n22), .Y(n19) );
  INVX1 U30 ( .A(n16), .Y(n22) );
  NAND3X1 U31 ( .A(n27), .B(n29), .C(count_enable), .Y(n16) );
  INVX1 U32 ( .A(clear), .Y(n29) );
  NAND3X1 U33 ( .A(n30), .B(n31), .C(n32), .Y(n27) );
  NOR2X1 U34 ( .A(n33), .B(n34), .Y(n32) );
  XNOR2X1 U35 ( .A(rollover_val[1]), .B(n28), .Y(n34) );
  INVX1 U36 ( .A(count_out[1]), .Y(n28) );
  XOR2X1 U37 ( .A(rollover_val[0]), .B(count_out[0]), .Y(n33) );
  XOR2X1 U38 ( .A(rollover_val[2]), .B(n18), .Y(n31) );
  INVX1 U39 ( .A(count_out[2]), .Y(n18) );
  XNOR2X1 U40 ( .A(count_out[3]), .B(rollover_val[3]), .Y(n30) );
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
  INVX1 U3 ( .A(enable_timer), .Y(n1) );
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
  wire   n15, n17, n19, n21, n23, n25, n27, n29, n30, n31, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11;

  DFFSR \rx_data_reg[7]  ( .D(n29), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[7]) );
  DFFSR \rx_data_reg[6]  ( .D(n27), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[6]) );
  DFFSR \rx_data_reg[5]  ( .D(n25), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[5]) );
  DFFSR \rx_data_reg[4]  ( .D(n23), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[4]) );
  DFFSR \rx_data_reg[3]  ( .D(n21), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[3]) );
  DFFSR \rx_data_reg[2]  ( .D(n19), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[2]) );
  DFFSR \rx_data_reg[1]  ( .D(n17), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[1]) );
  DFFSR \rx_data_reg[0]  ( .D(n15), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        rx_data[0]) );
  DFFSR data_ready_reg ( .D(n31), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        data_ready) );
  DFFSR overrun_error_reg ( .D(n30), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        overrun_error) );
  OAI21X1 U3 ( .A(data_read), .B(n1), .C(n2), .Y(n31) );
  INVX1 U4 ( .A(load_buffer), .Y(n2) );
  INVX1 U5 ( .A(data_ready), .Y(n1) );
  NOR2X1 U6 ( .A(data_read), .B(n3), .Y(n30) );
  AOI21X1 U7 ( .A(load_buffer), .B(data_ready), .C(overrun_error), .Y(n3) );
  INVX1 U8 ( .A(n4), .Y(n29) );
  MUX2X1 U9 ( .B(rx_data[7]), .A(packet_data[7]), .S(load_buffer), .Y(n4) );
  INVX1 U10 ( .A(n5), .Y(n27) );
  MUX2X1 U11 ( .B(rx_data[6]), .A(packet_data[6]), .S(load_buffer), .Y(n5) );
  INVX1 U12 ( .A(n6), .Y(n25) );
  MUX2X1 U13 ( .B(rx_data[5]), .A(packet_data[5]), .S(load_buffer), .Y(n6) );
  INVX1 U14 ( .A(n7), .Y(n23) );
  MUX2X1 U15 ( .B(rx_data[4]), .A(packet_data[4]), .S(load_buffer), .Y(n7) );
  INVX1 U16 ( .A(n8), .Y(n21) );
  MUX2X1 U17 ( .B(rx_data[3]), .A(packet_data[3]), .S(load_buffer), .Y(n8) );
  INVX1 U18 ( .A(n9), .Y(n19) );
  MUX2X1 U19 ( .B(rx_data[2]), .A(packet_data[2]), .S(load_buffer), .Y(n9) );
  INVX1 U20 ( .A(n10), .Y(n17) );
  MUX2X1 U21 ( .B(rx_data[1]), .A(packet_data[1]), .S(load_buffer), .Y(n10) );
  INVX1 U22 ( .A(n11), .Y(n15) );
  MUX2X1 U23 ( .B(rx_data[0]), .A(packet_data[0]), .S(load_buffer), .Y(n11) );
endmodule


module rcv_block ( clk, n_rst, serial_in, data_read, rx_data, data_ready, 
        overrun_error, framing_error );
  output [7:0] rx_data;
  input clk, n_rst, serial_in, data_read;
  output data_ready, overrun_error, framing_error;
  wire   start, shift_en, stop, done, sbc_clr, sbc_en, ld_buf, timer_en;
  wire   [7:0] packet_data;

  start_bit_det det0 ( .clk(clk), .n_rst(n_rst), .serial_in(serial_in), 
        .start_bit_detected(start) );
  sr_9bit sr0 ( .clk(clk), .n_rst(n_rst), .shift_strobe(shift_en), .serial_in(
        serial_in), .packet_data(packet_data), .stop_bit(stop) );
  rcu cu0 ( .clk(clk), .n_rst(n_rst), .start_bit_detected(start), 
        .packet_done(done), .framing_error(framing_error), .sbc_clear(sbc_clr), 
        .sbc_enable(sbc_en), .load_buffer(ld_buf), .enable_timer(timer_en) );
  timer tm0 ( .clk(clk), .n_rst(n_rst), .enable_timer(timer_en), 
        .shift_enable(shift_en), .packet_done(done) );
  stop_bit_chk det1 ( .clk(clk), .n_rst(n_rst), .sbc_clear(sbc_clr), 
        .sbc_enable(sbc_en), .stop_bit(stop), .framing_error(framing_error) );
  rx_data_buff buff0 ( .clk(clk), .n_rst(n_rst), .load_buffer(ld_buf), 
        .packet_data(packet_data), .data_read(data_read), .rx_data(rx_data), 
        .data_ready(data_ready), .overrun_error(overrun_error) );
endmodule

