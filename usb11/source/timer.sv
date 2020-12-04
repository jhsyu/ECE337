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
    logic clr; 
    assign clr = bit_stuff || d_edge; 
    logic flag, next_flag; 
    logic [3:0] count_val; 
    // flag == 0 indicates 4 cycle not completed yet. 
    // flag == 1 indicates 4 cycle pulse completed. 
    // used as the enable signal of the second counter
    // that counts every 8 cycle. 
    always_ff @(posedge clk, negedge n_rst) begin
        if (~n_rst) begin
            flag <= 1'b0;
        end
        else begin
            flag <= next_flag; 
        end
    end

    always_comb begin
        // if bit_stuff or d_edge assert, flag reset to 0. 
        // if current flag is 1, keep 1. 
        // if current flag is 0, 
        //     1. next_flag is 1 if have waited 4 cycle. 
        //     2. next_flag is 0 if not 4 cycle yet. 
        if (bit_stuff || d_edge) begin
            next_flag = 1'b0;
        end
        else if (flag == 1'b1 || count_val == 4'd4) begin
            next_flag = 1'b1; 
        end
        else begin
            next_flag = 1'b0; 
        end
    end
    
    logic shift_en0, shift_en1;
    assign shift_en = shift_en0 || shift_en1; 
    
    flex_counter #(.NUM_CNT_BITS(4)) cnt (
        .clk(clk), 
        .n_rst(n_rst), 
        .clear(d_edge), 
        .count_enable(~flag), 
        .count_out(count_val), 
        .rollover_val(4'd4), 
        .rollover_flag(shift_en0)
    ); 


    flex_counter #(.NUM_CNT_BITS(4)) cnt8 (
        .clk(clk), 
        .n_rst(n_rst), 
        .clear(d_edge), 
        .count_enable(flag), 
        .rollover_val(4'd8), 
        .rollover_flag(shift_en1)
    ); 


    
endmodule: timer
