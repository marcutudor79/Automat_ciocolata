`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2022 06:22:22 PM
// Design Name: 
// Module Name: CLCX_REG
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


module CLCX_REG( input a,
                 input b,
                 input clk,
                 input rst,
                 input ack,
                 output reg [2:0] state );

// 1clock / button pressed
reg abuff, bbuff;
wire cents, euro; 

always @(posedge clk)
    abuff <= a;
    
always @(posedge clk)
    bbuff <= b;
   
assign cents = a & ~abuff;
assign euro = b & ~bbuff;

localparam STATE_00 = 3'b000;
localparam STATE_05 = 3'b001;
localparam STATE_10 = 3'b010;
localparam STATE_15 = 3'b011;
localparam STATE_20 = 3'b100;
localparam STATE_25 = 3'b101;
localparam STATE_30 = 3'b110;

//processing states
always @(posedge clk) 
    if (rst)
        state <= STATE_00;
    else 
        case (state)
            
            STATE_00: if (cents)
                        state <= STATE_05;
                      else if (euro)
                        state <= STATE_10;
                      else
                        state <= state;   
            STATE_05: if (cents)
                        state <= STATE_10;
                      else if (euro)
                        state <= STATE_15;
                        
                      else
                        state <= state;
           STATE_10: if (cents)
                        state <= STATE_15;
                     else if (euro)
                        state <= STATE_20;
                     else
                        state <= state;
           STATE_15: if (cents)
                        state <= STATE_20;
                     else if (euro)
                        state <= STATE_25;
                     else 
                        state <= state;
           STATE_20: if (cents)
                        state <= STATE_25;
                     else if (euro)
                        state <= STATE_30;
                     else 
                        state <= state;  
          STATE_25: if (ack)
                        state <= STATE_00;
                     else 
                        state <= state;
          STATE_30: if (ack)
                        state <= STATE_05;
                    else
                        state <= state;
          
          default state <= STATE_00;            
          endcase 
endmodule
