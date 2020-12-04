//  Module: bit_stuffer
//
module bit_stuffer
    (
        input logic clk, 
        input logic n_rst, 
        input logic shift_en, 
        input logic d_orig, 
        output logic stuff_bit_out
    );

    logic clear; 
    // clear the counter, 
    // since there is a re-synchronize activity. 
    assign clear = ~d_orig & shift_en; 
    flex_counter #(.NUM_BITS(3)) cnt (
        .clk(clk), 
        .n_rst(n_rst), 
        .clear(clear), 
        .count_enable(shift_en), 
        .rollover_val(3'd6), 
        .rollover_flag(stuff_bit_out)
    );

    
endmodule: bit_stuffer
