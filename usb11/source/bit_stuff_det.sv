//  Module: bit_stuff_det
//
module bit_stuff_det
    (
        input logic clk, 
        input logic n_rst, 
        input logic shift_en, 
        input logic d_orig, 
        output logic bit_stuff
    );

    logic clear; 
    // count six '1' in the decoded data stream. 
    assign clear = ~d_orig & shift_en; 
    // if there is no consecutive 1's, clear the counter. 
    flex_counter #(.NUM_CNT_BITS(3)) cnt (
        .clk(clk), 
        .n_rst(n_rst), 
        .clear(clear), 
        .count_enable(shift_en), 
        .rollover_val(3'd6), 
        .rollover_flag(bit_stuff)
    );

    
endmodule: bit_stuff_det
