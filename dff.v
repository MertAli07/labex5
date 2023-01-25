`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2021 13:53:51
// Design Name: 
// Module Name: dff
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

module dff (input d,  
              input rst,  
              input clk,  
              output reg q);  
              
              always @(posedge clk or posedge rst)
              begin
              if(rst == 1'b1)
                q <= 1'b0;
              else
                q <= d;
              end
endmodule  

