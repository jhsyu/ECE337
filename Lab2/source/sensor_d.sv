// $Id: $
// File name:   sensor_d.sv
// Created:     9/8/2020
// Author:      Jiahao Xu
// Lab Section: 337-002
// Version:     1.0  Initial Design Entry
// Description: 
module sensor_d (
    sensors,
    error
);
    input wire [3:0] sensors;
    output wire error;

    assign error = sensors[0] | sensors[1] & (sensors[2] | sensors[3]);
endmodule