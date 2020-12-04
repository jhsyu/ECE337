//  Module: rcu
//
module rcu
    (
        input logic clk, 
        input logic n_rst, 
        input logic d_edge, 
        input logic shift_en, 
        input logic byte_rcvd, 
        input logic eop, 
        input logic pid_err, 
        input logic [7:0] rcv_data, 

        output logic pid_rst, 
        output logic pid_set, 
        output logic rcving, 
        output logic w_enable, 
        output logic r_error
    );
    // states. 
    localparam IDLE = 4'd0; 
    localparam SYNC = 4'd1; 
    localparam PID_WAIT = 4'd2; 
    localparam PID_RCV = 4'd3; 
    localparam PID_WRITE = 4'd4; 
    localparam PID_CHECK = 4'd5; 
    localparam DATA_WAIT = 4'd6; 
    localparam DATA_RCV = 4'd7; 
    localparam DATA_WRITE = 4'd8; 
    localparam EOP = 4'd9; 
    localparam ERR_IDLE = 4'd10; 
    localparam ERR = 4'd11; 
    localparam ERR_EOP = 4'd12;  

    logic [3:0] s, next_s; 
    logic [4:0] rcu_output; 
    assign {pid_set, pid_rst, r_error, w_enable, rcving} = rcu_output [4:0]; 
    // state regs. 
    always_ff @(posedge clk, negedge n_rst) begin
        if (~n_rst) begin
            s <= IDLE; 
        end
        else begin
            s <= next_s; 
        end
    end
    // next state logic. 
    always_comb begin
        next_s = s; // set the default op to the state reg. 
        case (s)
            IDLE:   next_s = (d_edge) ? SYNC : IDLE;
            SYNC:   begin
                if (byte_rcvd) begin
                    if (rcv_data == 8'h80) begin
                        next_s = PID_WAIT; 
                    end
                    else next_s = ERR; 
                end
                // else: sync. 
            end  
            PID_WAIT: begin
                if (~eop && shift_en) begin
                    next_s = PID_RCV; 
                end
                else if (eop && shift_en) begin
                    next_s = ERR_EOP; 
                end
                // else: PID_WAIT. 
            end
            PID_RCV: begin
                if (byte_rcvd) begin
                    next_s = PID_WRITE; 
                end
                else if (eop && shift_en) begin
                    next_s = ERR_EOP; 
                end
                // else: PID_RCV. 
            end
            PID_WRITE: next_s = PID_CHECK; 
            PID_CHECK: next_s = (pid_err) ? ERR : DATA_WAIT; 
            DATA_WAIT: next_s = (eop && shift_en) ? EOP : DATA_RCV;
            DATA_RCV: begin
                if (eop && shift_en) begin
                    next_s = ERR_EOP; 
                end
                else if (byte_rcvd) begin
                    next_s = DATA_WRITE; 
                end
                // else: DATA_RCV. 
            end
            DATA_WRITE: next_s = DATA_WAIT; 
            EOP: next_s = (d_edge) ? IDLE : EOP; 
            ERR: next_s = (eop && shift_en) ? ERR_EOP : ERR; 
            ERR_EOP: next_s = (d_edge) ? ERR_IDLE : ERR_EOP; 
            ERR_IDLE: next_s = (d_edge) ? SYNC : ERR_IDLE; 
        endcase
    end
    

    
endmodule: rcu
