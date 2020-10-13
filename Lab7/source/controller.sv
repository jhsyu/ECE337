// $Id: $
// File name:   controller.sv
// Created:     10/13/2020
// Author:      Jiahao Xu
// Lab Section: 337-002
// Version:     1.0  Initial Design Entry
// Description: .
module controller(clk, n_rst, dr, lc, overflow, 
                  cnt_up, clear, modwait, err, 
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
    localparam IDLE     = 5'b00000;
    localparam LOADD    = 5'b00001;
    localparam ZERO     = 5'b00010;
    localparam SORT1    = 5'b00011;
    localparam SORT2    = 5'b00100;
    localparam SORT3    = 5'b00101;
    localparam SORT4    = 5'b00110;
    localparam MUL1     = 5'b00111;
    localparam ADD1     = 5'b01000;
    localparam MUL2     = 5'b01001;
    localparam SUB2     = 5'b01010;
    localparam MUL3     = 5'b01011;
    localparam ADD3     = 5'b01100;
    localparam MUL4     = 5'b01101;
    localparam SUB4     = 5'b01110;
    localparam EIDLE    = 5'b01111;

    localparam LOADC0   = 5'b10000;
    localparam LOADC1   = 5'b10001;
    localparam LOADC2   = 5'b10010;
    localparam LOADC3   = 5'b10011;




    //state registers. 
    reg [4:0] s, next_s; 

    // output registers.
    reg [2:0] out0;


    // state registers. 
    always_ff @ (posedge clk, negedge n_rst) begin
        if (!n_rst) s <= IDLE; // reset to IDLE. 
        else s <= next_s;
    end

    // next state logic
    always_comb begin
        case (s)
            IDLE:   next_s = (lc) ? LOADC0  : 
                             (dr) ? LOADD   : IDLE;
            LOADD:  next_s = (dr) ? ZERO    : EIDLE;
            ZERO:   next_s = SORT1;
            SORT1:  next_s = SORT2;
            SORT2:  next_s = SORT3;
            SORT3:  next_s = SORT4;
            SORT4:  next_s = MUL1; 
            MUL1:   next_s = (overflow) ? EIDLE : ADD1;
            ADD1:   next_s = (overflow) ? EIDLE : MUL2;
            MUL2:   next_s = (overflow) ? EIDLE : SUB2;
            SUB2:   next_s = (overflow) ? EIDLE : MUL3;
            MUL3:   next_s = (overflow) ? EIDLE : ADD3;
            ADD3:   next_s = (overflow) ? EIDLE : MUL4;
            MUL4:   next_s = (overflow) ? EIDLE : SUB4;
            SUB4:   next_s = (overflow) ? EIDLE : IDLE; 
            EIDLE:  next_s = (~(dr||lc))? EIDLE : LOADD; 

            LOADC0: next_s = (lc) ? LOADC1 : LOADC0;
            LOADC1: next_s = (lc) ? LOADC2 : LOADC1;
            LOADC2: next_s = (lc) ? LOADC3 : LOADC2;
            LOADC3: next_s = IDLE;

            default: next_s = EIDLE;
        endcase
    end
    
    // output logic
    always_comb begin
        case (s)
            IDLE:   {op, dest, src1, src2} = {NOP,  R00, R00, R00};
            ZERO:   {op, dest, src1, src2} = {SUB,  R00, R00, R00};
            SORT1:  {op, dest, src1, src2} = {COPY, R01, R02, R00};
            SORT2:  {op, dest, src1, src2} = {COPY, R02, R03, R00};
            SORT3:  {op, dest, src1, src2} = {COPY, R03, R04, R00};
            SORT4:  {op, dest, src1, src2} = {COPY, R04, R05, R00};
            MUL1:   {op, dest, src1, src2} = {MUL,  R10, R01, R06};
            ADD1:   {op, dest, src1, src2} = {ADD,  R00, R00, R10};
            MUL2:   {op, dest, src1, src2} = {MUL,  R10, R02, R07};
            SUB2:   {op, dest, src1, src2} = {SUB,  R00, R00, R10};
            MUL3:   {op, dest, src1, src2} = {MUL,  R10, R03, R08};
            ADD3:   {op, dest, src1, src2} = {ADD,  R00, R00, R10};
            MUL4:   {op, dest, src1, src2} = {MUL,  R10, R04, R09};
            SUB4:   {op, dest, src1, src2} = {SUB,  R00, R00, R10};
            EIDLE:  {op, dest, src1, src2} = {NOP,  R00, R00, R00};

            LOADD:  {op, dest, src1, src2} = {LOAD1, R05, R00, R00};
            LOADC0: {op, dest, src1, src2} = {LOAD2, R09, R00, R00};
            LOADC1: {op, dest, src1, src2} = {LOAD2, R08, R00, R00};
            LOADC2: {op, dest, src1, src2} = {LOAD2, R07, R00, R00};
            LOADC3: {op, dest, src1, src2} = {LOAD2, R06, R00, R00};

            default:{op, dest, src1, src2} = {NOP,   R00, R00, R00};
        endcase
    end
    assign clear = lc;
    assign err = (s == EIDLE) ? 1'b1 : 1'b0;
    assign cnt_up = (s == LOADD) ? 1'b1: 1'b0;
    assign modwait = (s==IDLE||s==EIDLE) ? 1'b0 : 1'b1;
endmodule
