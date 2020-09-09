// $Id: $
// File name:   sensor_b.sv
// Created:     9/8/2020
// Author:      Jiahao Xu
// Lab Section: 337-002
// Version:     1.0  Initial Design Entry
// Description: .
module sensor_b (
    sensors,
    error
);
    input wire [3:0] sensors;
    output wire error;

    reg res;

    always @ (sensors) begin
        casez (sensors)
            4'b??00: res = 0;
            4'b0010: res = 0;
            default: res = 1;
        endcase
    end

    assign error = res;
endmodule