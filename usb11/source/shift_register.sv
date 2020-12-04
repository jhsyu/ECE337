//  Module: shift_register
//  a serial to parallel data-receving register. 
// data size: 8 bit
module shift_register
    (
        input logic clk, 
        input logic n_rst, 
        input logic shift_en, 
        input logic stuff_bit, 
        input logic d_orig, 
        output logic [7:0] rcv_data
    );
    logic shift_enable; 
    assign shift_enable = shift_en & (~stuff_bit); 
    // the bit_stuffer module sends a stuff_bit pulse 
    // indicating the bit loss. 
    flex_stp_sr #(.NUM_BITS(8), .SHIFT_MSB(0)) wrap (
        .clk(clk),
        .n_rst(n_rst),
        .shift_enable(shift_enable),
        .serial_in(d_orig),
        .parallel_out(rcv_data)
    );
endmodule: shift_register
