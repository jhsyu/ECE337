// $Id: $
// File name:   apb_uart_rx.sv
// Created:     10/20/2020
// Author:      Jiahao Xu
// Lab Section: 337-002
// Version:     1.0  Initial Design Entry
// Description: .
module apb_uart_rx(
    clk, n_rst, serial_in, 
    psel, penable, pwrite, 
    paddr, pwdata, prdata, 
    pslverr
);

    input wire clk, n_rst, serial_in;
    input wire psel, penable, pwrite;
    input wire [2:0] paddr;
    input wire [7:0] pwdata; 
    output reg [7:0] prdata;
    output reg pslverr;

    logic [7:0] rx_data;
    logic overrun_error, framing_error, data_read, data_ready;
    logic [3:0] data_size;
    logic [13:0] bit_period;

    apb_slave apb_slv(
        .clk(clk),
        .n_rst(n_rst), 
        .rx_data(rx_data),
        .data_ready(data_ready),
        .overrun_error(overrun_error), 
        .framing_error(framing_error), 
        .data_read(data_read), 
        .psel(psel), 
        .paddr(paddr), 
        .penable(penable), 
        .pwrite(pwrite), 
        .pwdata(pwdata), 
        .prdata(prdata), 
        .pslverr(pslverr), 
        .data_size(data_size), 
        .bit_period(bit_period)
    );

    rcv_block uart0(
        .clk(clk), 
        .n_rst(n_rst), 
        .serial_in(serial_in), 
        .data_read(data_read), 
        .rx_data(rx_data), 
        .data_ready(data_ready), 
        .overrun_error(overrun_error), 
        .framing_error(framing_error),
        .data_size(data_size), 
        .bit_period(bit_period)
    );





endmodule