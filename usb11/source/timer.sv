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
    logic [3:0] count, next_count;
    logic next_shift_en; 

    always_ff @(posedge clk, negedge n_rst) begin
        if (~n_rst) begin
            // begin over. count 4 cycles. 
            count <= 4'd6; 
            shift_en <= 1'b0; 
        end
        else begin
            count <= next_count; 
            shift_en <= next_shift_en; 
        end
    end

    always_comb begin
        if (rcving) begin
            // if d_edge pulse, count 4 cycles. 
            if (d_edge) begin
                next_count = 4'd6; 
                next_shift_en = 1'b0; 
            end
            else if (count == 4'd8) begin
                next_count = 4'd1; 
                next_shift_en = 1'b1;
            end
            else begin
                next_count = count + 1; 
                next_shift_en = 1'b0; 
            end            
        end
        else begin
            next_count = 4'd0; 
            next_shift_en = 1'b0; 
        end
    end

    flex_counter #(.NUM_CNT_BITS(4)) cnt_bit (
        .clk(clk), 
        .n_rst(n_rst), 
        .clear(d_edge), 
        .count_enable(shift_en && ~bit_stuff), 
        .rollover_val(4'd8), 
        .rollover_flag(byte_rcvd)
    ); 

    
endmodule: timer
