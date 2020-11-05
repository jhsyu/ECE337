module ahb_lite_slave(
    input logic clk,
    input logic n_rst,
    input logic modwait,
    input logic err,
    input logic hsel,
    input logic hsize,
    input logic hwrite,
    input logic coeff_clr, // add clear signal
    input logic [1:0] coefficient_num,
    input logic [1:0] htrans,
    input logic [3:0] haddr,
    input logic [15:0] hwdata,
    input logic [15:0] fir_out,

    output logic data_ready,
    output logic hresp, 
    output logic new_coefficient_set,
    output logic [15:0] sample_data,
    output logic [15:0] fir_coefficient,
    output logic [15:0] hrdata
);

    localparam HTRANS_NONSEQ    = 2'd2;
    localparam HTRANS_IDLE      = 2'd0;

    // write register
    logic [15:0] next_sample_data;

    logic [15:0] f0_reg;
    logic [15:0] next_f0_reg;

    logic [15:0] f1_reg;
    logic [15:0] next_f1_reg;

    logic [15:0] f2_reg;
    logic [15:0] next_f2_reg;

    logic [15:0] f3_reg;
    logic [15:0] next_f3_reg;

    logic [7:0] new_coeff;
    logic [7:0] next_new_coeff;

    logic next_new_coefficient_set;

    logic [15:0] status;
    assign status = {7'b0, err, 7'b0, modwait || new_coefficient_set};

    logic [3:0] haddr_reg;

    logic hwrite_reg;
    logic hsel_reg;
    logic [1:0] htrans_reg;
    logic hsize_reg;

    logic next_data_ready;
  
    // err logic
    always_comb begin
        if(haddr == 4'hf) hresp = 1'b1;
        else if(hwrite && (haddr < 4'h4)) hresp = 1'b1;
        else hresp = 1'b0;
    end

    // write logic
    always_comb begin
        // set default values
        next_sample_data = sample_data;
        next_f0_reg = f0_reg;
        next_f1_reg = f1_reg;
        next_f2_reg = f2_reg;
        next_f3_reg = f3_reg;
        next_new_coeff = new_coeff;
        next_data_ready = data_ready;
        if(hsel && ~hsize_reg && hwrite_reg &&  htrans_reg == HTRANS_NONSEQ) begin
            // 1 byte reading. 
            case(haddr_reg)
                4'h4: next_sample_data = {sample_data[15:8] ,hwdata[7:0]};
                4'h5: next_sample_data = {hwdata[7:0], sample_data[7:0]};
                4'h6: next_f0_reg = {f0_reg[15:8], hwdata[7:0]};
                4'h7: next_f0_reg = {hwdata[7:0], f0_reg[7:0]};
                4'h8: next_f1_reg = {f1_reg[15:8], hwdata[7:0]};
                4'h9: next_f1_reg = {hwdata[7:0], f1_reg[7:0]};
                4'ha: next_f2_reg = {f2_reg[15:8], hwdata[7:0]};
                4'hb: next_f2_reg = {hwdata[7:0], f2_reg[7:0]};
                4'hc: next_f3_reg = {f3_reg[15:8], hwdata[7:0]};
                4'hd: next_f3_reg = {hwdata[7:0], f3_reg[7:0]};
                4'he: next_new_coeff = hwdata[7:0];
            endcase
        end
        else if(hsel && hsize_reg && hwrite_reg &&  htrans_reg == HTRANS_NONSEQ) begin
            // 2 byte writing. 
            case(haddr_reg)
                4'h4: next_sample_data = hwdata;
                4'h5: next_sample_data = hwdata;
                4'h6: next_f0_reg = hwdata;
                4'h7: next_f0_reg = hwdata;
                4'h8: next_f1_reg = hwdata;
                4'h9: next_f1_reg = hwdata;
                4'ha: next_f2_reg = hwdata;
                4'hb: next_f2_reg = hwdata;
                4'hc: next_f3_reg = hwdata;
                4'hd: next_f3_reg = hwdata;
                4'he: next_new_coeff = hwdata[7:0];
            endcase
        end

        // data ready logic
        if(modwait) begin
            next_data_ready = 0;
        end
        else if(hsel && hwrite_reg && htrans_reg == HTRANS_NONSEQ && (haddr_reg[3:1] == 3'b010)) begin
            next_data_ready = 1;
        end
   

        // cofficient load logic
        if(coeff_clr) begin
            next_new_coeff = '0;
        end
        case(coefficient_num)
            2'd0: fir_coefficient = f0_reg;
            2'd1: fir_coefficient = f1_reg;
            2'd2: fir_coefficient = f2_reg;
            2'd3: fir_coefficient = f3_reg;
            default: fir_coefficient = '0;
        endcase
    end

    // read logic 
    always_comb begin
        // hsize == 0 : 1 byte read. 
        if(hsel && ~hsize_reg && ~hwrite_reg &&  htrans_reg == HTRANS_NONSEQ) begin
            case(haddr_reg)
                4'h0: hrdata = {8'b0, status[7:0]};
                4'h1: hrdata = {8'b0, status[15:8]};
                4'h2: hrdata = {8'b0, fir_out[7:0]};
                4'h3: hrdata = {8'b0, fir_out[15:8]};
                4'h4: hrdata = {8'b0, sample_data[7:0]};
                4'h5: hrdata = {8'b0, sample_data[15:8]};
                4'h6: hrdata = {8'b0, f0_reg[7:0]};
                4'h7: hrdata = {8'b0, f0_reg[15:8]};
                4'h8: hrdata = {8'b0, f1_reg[7:0]};
                4'h9: hrdata = {8'b0, f1_reg[15:8]};
                4'ha: hrdata = {8'b0, f2_reg[7:0]};
                4'hb: hrdata = {8'b0, f2_reg[15:8]};
                4'hc: hrdata = {8'b0, f3_reg[7:0]};
                4'hd: hrdata = {8'b0, f3_reg[15:8]};
                4'he: hrdata = new_coeff;
                default: hrdata = '0;
            endcase
        end

        else if(hsel && hsize_reg && ~hwrite_reg && htrans_reg == HTRANS_NONSEQ) begin
            // hsize == 1: 2 byte reading. 
            case(haddr_reg)
                4'h0: hrdata = status;
                4'h1: hrdata = status;
                4'h2: hrdata = fir_out;
                4'h3: hrdata = fir_out;
                4'h4: hrdata = sample_data;
                4'h5: hrdata = sample_data;
                4'h6: hrdata = f0_reg;
                4'h7: hrdata = f0_reg;
                4'h8: hrdata = f1_reg;
                4'h9: hrdata = f1_reg;
                4'ha: hrdata = f2_reg;
                4'hb: hrdata = f2_reg;
                4'hc: hrdata = f3_reg;
                4'hd: hrdata = f3_reg;
                4'he: hrdata = {8'b0, new_coeff};
                default: hrdata = '0;
            endcase
        end
        else hrdata = '0;
    end

    // registers
    // hwrite, hsize, htrans, haddr register 
    always_ff @(posedge clk, negedge n_rst) begin
        if(n_rst == 0) begin
            hwrite_reg <= '0;
            htrans_reg <= '0;
            hsize_reg <= '0;
            haddr_reg <= '0;
        end
        else begin
            hwrite_reg <= hwrite;
            htrans_reg <= htrans;
            hsize_reg <= hsize;
            haddr_reg <= haddr;

        end
    end

    // fir coefficient register
    always_ff @(posedge clk, negedge n_rst) begin
        if(n_rst == 0) begin
            f0_reg <= '0;
            f1_reg <= '0;
            f2_reg <= '0;
            f3_reg <= '0;
        end
        else begin
            f0_reg <= next_f0_reg;
            f1_reg <= next_f1_reg;
            f2_reg <= next_f2_reg;
            f3_reg <= next_f3_reg;
        end
    end

    always_ff @(posedge clk, negedge n_rst) begin
        if(n_rst == 0) begin
            new_coeff <= '0;
            data_ready <= '0;
            sample_data <= '0;

        end
        else begin
            new_coeff <= next_new_coeff;
            data_ready <= next_data_ready;
            sample_data <= next_sample_data;
        end
    end
    // new_coefficient_set register. 
    always_ff @(posedge clk, negedge n_rst) begin
        if (~n_rst) begin
            new_coefficient_set <= '0;
        end
        else begin
            new_coefficient_set <= next_new_coefficient_set;
        end
    end

    always_comb begin
        if (coeff_clr) begin
            next_new_coefficient_set = 1'b0;
        end
        else begin
            next_new_coefficient_set = next_new_coeff[0];
        end
    end

endmodule