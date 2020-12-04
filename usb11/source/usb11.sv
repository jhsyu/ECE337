//  Module: usb11
//
module usb11(
    input logic clk, 
    input logic n_rst,
    input logic d_plus, 
    input logic d_minus, 
    input logic ren, 
    output logic full, 
    output logic empty, 
    output logic [7:0] rdata, 
    output logic [3:0] PID
    );
    
    logic dp, dm, eop, d_edge, d_orig, shift_en, rcving, bit_stuff, byte_rcvd; 
    logic [7:0] rcv_data; 
    logic pid_set, pid_err, pid_rst; 
    // eop detect logic. 
    assign eop = (~dp && ~dm) ? 1'b1 : 1'b0;  
    
    sync_low  sync0 (
        .clk(clk), 
        .n_rst(n_rst), 
        .async_in(d_minus), 
        .sync_out(dm)
    );
    sync_high  sync1 (
        .clk(clk), 
        .n_rst(n_rst), 
        .async_in(d_plus), 
        .sync_out(dp)
    );
    edge_detect edge_det (
        .d_plus(dp),
        .d_edge(d_edge)
    );
    decoder dec (
        .clk(clk), 
        .n_rst(n_rst), 
        .d_plus(dp), 
        .shift_en(shift_en), 
        .eop(eop), 
        .d_orig(d_orig)
    );
    bit_stuff_det btstf_det (
        .clk(clk), 
        .n_rst(n_rst), 
        .shift_en(shift_en), 
        .d_orig(d_orig), 
        .bit_stuff(bit_stuff)
    ); 
    timer tim (
        .clk(clk), 
        .n_rst(n_rst), 
        .d_edge(d_edge), 
        .rcving(rcving), 
        .bit_stuff(bit_stuff), 
        .shift_en(shift_en), 
        .byte_rcvd(byte_rcvd)
    ); 
    shift_register sr (
        .clk(clk), 
        .n_rst(n_rst), 
        .shift_en(shift_en), 
        .stuff_bit(bit_stuff), 
        .d_orig(d_orig), 
        .rcv_data(rcv_data)
    );
    rcu cu (
        .clk(clk), 
        .n_rst(n_rst), 
        .d_edge(d_edge), 
        .shift_en(shift_en), 
        .byte_rcvd(byte_rcvd), 
        .eop(eop), 
        .rcv_data(rcv_data), 
        .pid_err(pid_err), 
        .pid_set(pid_set), 
        .pid_rst(pid_rst), 
        .rcving(rcving), 
        .w_enable(w_enable), 
        .r_error(r_error)
    );

    pid_detect pid_det (
        .clk(clk), 
        .n_rst(n_rst), 
        .pid_err(pid_err), 
        .pid_set(pid_set), 
        .pid_rst(pid_rst), 
        .pid_in(rcv_data[3:0]), 
        .pid_out(PID)
    );

    fifo rx_fifo (
        .r_clk(clk),
        .w_clk(clk),
        .n_rst(n_rst),
        .r_enable(r_enable), 
        .w_enable(w_enable), 
        .w_data(rcv_data), 
        .r_data(r_data), 
        .empty(empty), 
        .full(full)    
    ); 





    
endmodule: usb11
