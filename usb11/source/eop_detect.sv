//  Module: eop_detect
//
module eop_detect (
    input logic d_plus, 
    input logic d_minus, 
    output logic eop
    );

    always_comb begin
        if (d_plus == 1'b0 && d_minus == 1'b0) eop = 1'b1;
        else eop = 1'b0;
    end
    
endmodule: eop_detect
