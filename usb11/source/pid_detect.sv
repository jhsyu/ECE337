//  Module: pid_detect
//
module pid_detect
    (
        input logic clk, 
        input logic n_rst, 
        input logic pid_set, 
        input logic pid_rst,
        input logic [3:0] pid_in, 
        output logic [3:0] pid_out, 
        output logic pid_err
    );

    logic [3:0] next_pid_out; 

    always_ff @(posedge clk, negedge n_rst) begin
        if (~n_rst) begin
            pid_out <= '1; 
        end
        else pid_out <= next_pid_out; 
    end

    always_comb begin
        if (pid_set) begin
            next_pid_out = pid_in; 
        end
        else if (pid_rst) begin
            next_pid_out = '1; 
        end
        else next_pid_out = pid_out;  
    end
    
    assign pid_err =    (pid_out == 4'b0001) ? 1'b0 : 
                        (pid_out == 4'b0010) ? 1'b0 : 
                        (pid_out == 4'b0011) ? 1'b0 : 
                        (pid_out == 4'b1001) ? 1'b0 : 
                        (pid_out == 4'b1011) ? 1'b0 : 
                        (pid_out == 4'b1010) ? 1'b0 : 
                        (pid_out == 4'b1110) ? 1'b0 : 1'b1;  
    
    
endmodule: pid_detect
