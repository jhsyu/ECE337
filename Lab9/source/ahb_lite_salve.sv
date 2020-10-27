// $Id: $
// File name:   ahb_lite_salve.sv
// Created:     10/27/2020
// Author:      Jiahao Xu
// Lab Section: 337-002
// Version:     1.0  Initial Design Entry
// Description: .
module ahb_lite_salve (
    input logic clk, 
    input logic n_rst,
    input logic modwait, 
    input logic err, 
    input logic hsel, 
    input logic hsize, 
    input logic hwrite, 
    input logic [1:0] coefficient_num, 
    input logic [1:0] htrans,
    input logic [3:0] haddr, 
    input logic [15:0] hwdata,
    input logic [15:0] fir_out, 

    output logic hresp, 
    output logic data_ready,
    output logic new_coefficient_set, 
    output logic [15:0] hrdata, 
    output logic [15:0] sample_data, 
    output logic [15:0] fir_coefficient 
);
    // intermdeiate variables.
    logic [15:0] next_hrdata; 
    logic [3:0] addr_reg, next_addr_reg;
    logic [3:0] read_sel, write_sel, next_write_sel;
    logic next_data_ready;

    // registers. 
    logic [15:0] status;                // 0x0
    logic [15:0] result;                // 0x2
    logic [15:0] sample, next_sample;   // 0x4
    logic [15:0] f0_reg, next_f0_reg;   // 0x6
    logic [15:0] f1_reg, next_f1_reg;   // 0x8
    logic [15:0] f2_reg, next_f2_reg;   // 0xA
    logic [15:0] f3_reg, next_f3_reg;   // 0xC
    logic [ 7:0] coeff_set_confrm, next_coeff_set_confrm; //0xE

    // input not used yet: 
    // hsize, 
    // [1:0] htrans,


    // output not determined yet:  
    // new_coefficient_set, 

    always_ff@(posedge clk, negedge n_rst) begin
        if (~n_rst) begin
            result <= 16'b0;   // 0x2
            sample <= 16'b0;   // 0x4
            f0_reg <= 16'b0;   // 0x6
            f1_reg <= 16'b0;   // 0x8
            f2_reg <= 16'b0;   // 0xA
            f3_reg <= 16'b0;   // 0xC
            coeff_set_confrm <= 8'b0; //0xE
        end
        else begin
            result <= fir_out;   // 0x2
            sample <= next_sample;  // 0x4
            f0_reg <= next_f0_reg;  // 0x6
            f1_reg <= next_f1_reg;  // 0x8
            f2_reg <= next_f2_reg;  // 0xA
            f3_reg <= next_f3_reg;  // 0xC
            coeff_set_confrm <= next_coeff_set_confrm; //0xE
        end
    end


    // controller logic. 
    always_comb begin
        if (hsel && hwrite) begin   //writing process. 
            // overlapping case: 
            // address in 1st cycle, data writing 2nd cycle. 
            // no need to delay/synchronize, 
            // since the address will be store in a reg. 
            // reg: write_sel
            if (haddr == 4'h4 || haddr == 4'h6 || haddr == 4'h8 ||
                haddr == 4'ha || haddr == 4'hc || haddr == 4'he) begin
                next_write_sel = haddr; 
            end
            else begin
                next_write_sel = 4'h0;
            end
        end
        else if (hsel && ~hwrite) begin     // read process. 
            // since the read data is stored in hrdata register,
            // the data read has been delayed for one cycle, 
            // no need to put a reg to store haddr. 
            // connect read_sel directly to haddr. 
            read_sel = haddr;
        end
        else // default value for variables changed above. 
            read_sel = 4'b0;
            next_write_sel = 4'b0;
    end

    // hrdata mux. 
    always_comb begin
        // set default val for hrdata. 
        next_hrdata = 16'b0;
        case (read_sel)
            4'h0: next_hrdata = status;
            4'h2: next_hrdata = result; 
            4'h4: next_hrdata = sample;
            4'h6: next_hrdata = f0_reg;
            4'h8: next_hrdata = f1_reg;
            4'hA: next_hrdata = f2_reg;
            4'hC: next_hrdata = f3_reg;
            4'hE: next_hrdata = next_coeff_set_confrm; 
            default: 
                  next_hrdata = 16'b0;
        endcase
    end

    // write logic
    always_comb begin
        // set default value. 
        next_sample = sample;   // 0x4
        next_f0_reg = f0_reg;   // 0x6
        next_f1_reg = f1_reg;   // 0x8
        next_f2_reg = f2_reg;   // 0xA
        next_f3_reg = f3_reg;   // 0xC
        next_coeff_set_confrm = coeff_set_confrm; // 0xE

        case (write_sel)
            4'h4: next_sample = hwdata;
            4'h6: next_f0_reg = hwdata;
            4'h8: next_f1_reg = hwdata;
            4'ha: next_f2_reg = hwdata;
            4'hc: next_f3_reg = hwdata;
            4'he: next_coeff_set_confrm = hwdata[7:0]; 
        endcase
    end
    
    // data ready logic.
    always_ff@(posedge clk, negedge n_rst) begin
        if(~n_rst) data_ready <= 1'b0;
        else data_ready <= next_data_ready;
    end
    always_comb begin
        // sample register will update next cycle. 
        if(hsel && hwrite && (write_sel == 4'h4)) next_data_ready = 1'b1;
        else next_data_ready = 1'b0;
    end

    // load coefficient to fir module. 
    assign new_coefficient_set = coeff_set_confrm;
    always_comb begin
        case (coefficient_num)
            2'd0:   fir_coefficient = f0_reg; 
            2'd1:   fir_coefficient = f1_reg;    
            2'd2:   fir_coefficient = f2_reg; 
            2'd3:   fir_coefficient = f3_reg;  
            default:fir_coefficient = 16'b0;
        endcase
    end
 

    // outputs logic
    assign status = {7'b0, err, 7'b0, modwait}; // 0x0 status reg
    assign sample_data = sample;

    // error logic
    always_comb begin
        hresp = 1'b0;
        if (hsel && hwrite && (haddr == 4'hf || haddr < 4'h4)) begin 
            // invalid address when write data
            hresp = 1'b1;
        end
        else if (hsel && ~hwrite && haddr == 4'hf) begin 
            // invalid address when read data
            hresp = 1'b1;
        end
    end

endmodule