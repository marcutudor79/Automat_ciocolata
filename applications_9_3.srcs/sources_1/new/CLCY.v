`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2022 06:41:37 PM
// Design Name: 
// Module Name: CLCY
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module CLCY( input [2:0] state,
             output reg led );

localparam STATE_00 = 3'b000;
localparam STATE_05 = 3'b001;
localparam STATE_10 = 3'b010;
localparam STATE_15 = 3'b011;
localparam STATE_20 = 3'b100;
localparam STATE_25 = 3'b101;
localparam STATE_30 = 3'b110;
             
always @(*)
    case (state)
        STATE_00: led = 0;
        STATE_05: led = 0;
        STATE_10: led = 0;
        STATE_15: led = 0;
        STATE_20: led = 0;
        STATE_25: led = 1;
        STATE_30: led = 1;
    endcase
                 
endmodule
