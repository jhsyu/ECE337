// $Id: $
// File name:   sensor_s.sv
// Created:     9/8/2020
// Author:      Jiahao Xu
// Lab Section: 337-002
// Version:     1.0  Initial Design Entry
// Description: 
module sensor_s (
    sensors,
    error
);
    input wire [3:0] sensors;
    output wire error;

    wire int_or1;
    wire int_and1;
    OR2X1 O1(.Y(int_or1), .A(sensors[2]), .B(sensors[3]));
    AND2X1 A1(.Y(int_and1), .A(int_or1), .B(sensors[1]));
    OR2X1 O2(.Y(error), .A(sensors[0]), .B(int_and1));
endmodule