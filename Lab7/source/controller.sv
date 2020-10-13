// $Id: $
// File name:   controller.sv
// Created:     10/13/2020
// Author:      Jiahao Xu
// Lab Section: 337-002
// Version:     1.0  Initial Design Entry
// Description: .
module controller(clk, n_rst, dr, lc, overflow, 
                  cnt_up, clear, modewait, err, 
                  op, src1, src2, dest);
    input wire clk, n_rst, dr, lc, overflow;
    output reg cnt_up, clear, modwait, err;
    output reg [2:0] op;
    output reg [3:0] src1, src2, dest;

    // opcode local variables. 
    localparam NOP      = 3'b000;
    localparam COPY     = 3'b001;
    localparam LOAD1    = 3'b010;
    localparam LOAD2    = 3'b011;
    localparam ADD      = 3'b100;
    localparam SUB      = 3'b101;
    localparam MUL      = 3'b110;

    // register address local variables. 
    localparam R00 = 4'b0000;
    localparam R01 = 4'b0001;
    localparam R02 = 4'b0010;
    localparam R03 = 4'b0011;
    localparam R04 = 4'b0100;
    localparam R05 = 4'b0101;
    localparam R06 = 4'b0110;
    localparam R07 = 4'b0111;
    localparam R08 = 4'b1000;
    localparam R09 = 4'b1001;
    localparam R10 = 4'b1010;

    // local variables defines state. 
    localparam IDLE     = 5'b0000;
    localparam LOADD     = 5'b0001;
    localparam ZERO     = 5'b0010;
    localparam SORT1    = 5'b0011;
    localparam SORT2    = 5'b0100;
    localparam SORT3    = 5'b0101;
    localparam SORT4    = 5'b0110;
    localparam MUL1     = 5'b0111;
    localparam ADD1     = 5'b1000;
    localparam MUL2     = 5'b1001;
    localparam SUB2     = 5'b1010;
    localparam MUL3     = 5'b1011;
    localparam ADD3     = 5'b1100;
    localparam MUL4     = 5'b1101;
    localparam SUB4     = 5'b1110;
    localparam ERR_IDLE = 5'b1111;



    //state registers. 
    reg [4:0] s, next_s; 

    // state registers. 
    always_ff @ (posedge clk, negedge n_rst) begin
        if (!n_rst) s <= IDLE; // reset to idle. 
        else s <= next_s;
    end

    // next state logic
    always_comb begin
        case (s)
            IDLE: next_s =  (dr) ? LOADD : IDLE;
            default: 
        endcase
    end
    

endmodule
