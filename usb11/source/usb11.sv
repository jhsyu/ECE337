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

    logic dp, dm, eop, d_edge; 
    sync_low  sync0 (.clk(clk), 
                     .n_rst(n_rst), 
                     .async_in(d_minus), 
                     .sync_out(dm)
    );
    sync_high  sync1 (.clk(clk), 
                      .n_rst(n_rst), 
                      .async_in(d_plus), 
                      .sync_out(dp)
    );
    eop_detect eop_det (.d_plus(dp), 
                    .d_minus(dm), 
                    .eop(eop)
    );
    edge_detect edge_det (.d_plus(dp),
                          .d_edge(d_edge)
    );

    
endmodule: usb11
