`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/22/2022 06:47:13 PM
// Design Name: 
// Module Name: topmodule
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


module topmodule( input a,
                  input b,
                  input rst,
                  input clk,
                  input ack,
                  output led,
                  output AN0,
                  output AN1,
                  output AN2,
                  output AN3,
                  output AN4,
                  output AN5,
                  output AN6,
                  output AN7,
                  output [7:0] CN );

wire [2:0] state;

CLCX_REG dt1 ( .a(a),
               .b(b),
               .clk(clk),
               .rst(rst),
               .ack(ack),
               .state(state) );
               
CLCY dt2 ( .state(state),
           .led(led) );               

display dt3 ( .state(state),
              .clk(clk),
              .D1(AN0),
              .CN(CN),
              .D2(AN1) );
              
assign AN2 = 1;
assign AN3 = 1;  
assign AN4 = 1;  
assign AN5 = 1;
assign AN6 = 1;
assign AN7 = 1;
                      

endmodule
