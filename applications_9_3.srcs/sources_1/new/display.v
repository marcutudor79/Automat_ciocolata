`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2022 07:37:36 PM
// Design Name: 
// Module Name: display
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


module display( input [2:0] state,
                input clk,               
                output  reg D1,
                output  reg D2,
                output reg [7:0] CN );
reg on;
reg [10:0] clk2 = 0;
reg [7:0] CD1;
reg [7:0] CD2;
                
localparam STATE_00 = 3'b000;
localparam STATE_05 = 3'b001;
localparam STATE_10 = 3'b010;
localparam STATE_15 = 3'b011;
localparam STATE_20 = 3'b100;
localparam STATE_25 = 3'b101;
localparam STATE_30 = 3'b110;                

always @(*) 
    case (state)
        STATE_00: begin
                  CD1 = 8'b00111111;
                  CD2 = 8'b00111111;
                  end
        STATE_05: begin        
                  CD1 = 8'b01101101;
                  CD2 = 8'b00111111;
                  end
        STATE_10: begin
                  CD1 = 8'b0111111;
                  CD2 = 8'b0000110;                  
                  end
        STATE_15: begin
                  CD1 = 8'b01101101;
                  CD2 = 8'b00000110;
                  end
        STATE_20: begin
                  CD1 = 8'b00111111;
                  CD2 = 8'b01011011;
                  end
        STATE_25: begin
                  CD1 = 8'b01101101;
                  CD2 = 8'b01011011;
                  end
        STATE_30: begin
                  CD1 = 8'b00111111;
                  CD2 = 8'b01001111;
                  end
        default: begin
                 CD1 = 8'b00111111;
                 CD2 = 8'b00111111;
                 end                           
        endcase
    
always @(posedge clk)
    clk2 <= clk2 + 1;
    
always @(posedge clk)
    if (clk2 == 11'b11111111111 )
        on <= ~on;     
    
always @(*)
    if (on) begin
       D1 = 1;
       D2 = 0;
       CN = ~CD2; 
    end 
    
    else begin
       D1 = 0;
       D2 = 1;
       CN = ~CD1;
    end            
         
endmodule
