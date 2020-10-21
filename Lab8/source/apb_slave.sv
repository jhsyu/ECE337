// $Id: $
// File name:   apb_slave.sv
// Created:     10/20/2020
// Author:      Jiahao Xu
// Lab Section: 337-002
// Version:     1.0  Initial Design Entry
// Description: .
module apb_slave(
    clk, n_rst,
    rx_data, data_ready, 
    overrun_error, framing_error, 
    data_read, 
    psel, penable, pwrite, 
    paddr, prdata, pwdata, pslverr, 
    data_size, bit_period
);
    input wire clk, n_rst, data_ready; 
    input wire [7:0] rx_data; 
    input wire psel, penable, pwrite; 
    input wire [2:0] paddr;
    input wire [7:0] pwdata;
    input wire overrun_error, framing_error; 
    output reg data_read;
    output reg [3:0] data_size;
    output reg [13:0] bit_period;
    output reg pslverr;
    output reg [7:0] prdata; 

    // 0x0 data status register     r
    logic [7:0] data_status_reg;
    // 0x1 error status register    r
    logic [7:0] error_status;
    // 0x2 bit_period config reg    rw
    logic [7:0] bit_period_reg0; 
    logic [7:0] bit_period_reg1;
    logic [7:0] next_bit_period_reg0;
    logic [7:0] next_bit_period_reg1;
    // 0x4 data_size config reg     rw
    logic [7:0] data_size_reg; 
    logic [7:0] next_data_size_reg;
    // 0x6 data buffer              r
    logic [7:0] data_buffer_reg;
    logic [7:0] next_data_buffer_reg;

    // selection lines.
    logic [2:0] read_sel, write_sel;

    // prdata registers. 
    logic [7:0] prdata_reg;
    logic [7:0] next_prdata_reg;

    // data_read strobe. 
    logic next_data_read;

    // output logic
    assign data_status_reg = {7'b0, data_ready}; 
    assign bit_period = {bit_period_reg1 [5:0], bit_period_reg0};
    assign data_size = data_size_reg;
    assign prdata = prdata_reg;

    // error logic
    always_comb begin
        error_status = 8'd0;
        if(framing_error)
            error_status = 8'd1;
        else if(overrun_error)
            error_status = 8'd2; 
    end    
    // controll logic.
    always_comb begin
        pslverr = 1'b0;
        read_sel = 3'b0;
        write_sel = 3'b0;
       if (psel && pwrite && penable) begin // write mode
            case (paddr)
                3'd2:   write_sel = paddr;
                3'd3:   write_sel = paddr;
                3'd4:   write_sel = paddr; 
                default:pslverr = 1'b1;
            endcase   
       end 
       else if (psel && ~pwrite) begin // read mode
            case (paddr)
                3'd7:   pslverr = 1'b1;
                default:read_sel = paddr;
            endcase
       end
    end    

    // read data. 
    always_comb begin
        case (read_sel)
            3'd0:   next_prdata_reg = data_status_reg;
            3'd1:   next_prdata_reg = error_status;
            3'd2:   next_prdata_reg = bit_period_reg0;
            3'd3:   next_prdata_reg = bit_period_reg1;
            3'd4:   next_prdata_reg = data_size_reg;
            3'd6:   next_prdata_reg = data_buffer_reg;
            default:next_prdata_reg = prdata_reg;
        endcase
    end 

    // write data. 
    always_comb begin
        next_bit_period_reg0 = bit_period_reg0;
        next_bit_period_reg1 = bit_period_reg1;
        next_data_size_reg = data_size_reg;
        case (write_sel)
            3'd2:   next_bit_period_reg0 = pwdata[7:0];
            3'd3:   next_bit_period_reg1 = pwdata[7:0];
            3'd4:   next_data_size_reg = pwdata[3:0];
        endcase
    end

    always_comb begin   // update data_buffer
        if (data_ready) begin
            next_data_read = 1'b1;
            next_data_buffer_reg = rx_data;
        end
        else begin
            next_data_read = data_read;
            next_data_buffer_reg = data_buffer_reg;
        end
    end
    
    // update registers. 
    always_ff @(posedge clk, negedge n_rst) begin
        if (~n_rst) begin
            prdata_reg <= 0;
            data_size_reg <= 0;
            bit_period_reg0 <= 0;
            bit_period_reg1 <= 0;
            data_buffer_reg <= 0;
            data_read <= 0;
        end
        else begin
            prdata_reg <= next_prdata_reg;
            data_size_reg <= next_data_size_reg;
            bit_period_reg0 <= next_bit_period_reg0;
            bit_period_reg1 <= next_bit_period_reg1;
            data_buffer_reg <= next_data_buffer_reg;
            data_read <= next_data_read;
        end
    end

endmodule