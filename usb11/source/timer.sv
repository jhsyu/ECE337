//  Module: timer
//
module timer
    (
        input logic clk, 
        input logic n_rst, 
        input logic d_edge, 
        input logic rcving, 
        input logic bit_stuff, 
        output logic shift_en, 
        output logic byte_rcvd
    );
    
    

    logic clr, rst, en; 
    assign en = shift_en & ~bit_stuff; 
    assign rst = ~n_rst || ~rcving; 

    localparam WAIT = 3'd0; 
    localparam CYC1 = 3'd1; 
    localparam CYC2 = 3'd2; 
    localparam CYC3 = 3'd3; 
    localparam CYC4 = 3'd4; 
    localparam CNTS = 3'd5; 
    
    // FSM to realize the 4 cycle pulse. 

    flex_counter #(.NUM_CNT_BITS(4)) cnt8 (
        .clk(clk), 
        .n_rst(n_rst), 
        .clear(rcving), 
        .count_enable(en), 
        .rollover_val(4'd8), 
        .rollover_flag(byte_rcvd)
    ); 


    
endmodule: timer
