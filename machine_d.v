`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2021 14:01:37
// Design Name: 
// Module Name: machine_d
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


module machine_d(
    input x,
    input rst,  
    input clk,
    output F);

    reg [2:0] present_state = 3'b000;
    wire [2:0] next_state;
    
    dff DA
    (
        .d(present_state[2] | (present_state[1] & x)),
        .rst(rst),
        .clk(clk),
        .q(next_state[2]));
    
    dff DB
    (
        .d((present_state[1] & ~x) | (~present_state[2] & ~present_state[1] & x)),
        .rst(rst),
        .clk(clk),
        .q(next_state[1]));
    
    dff DC
    (
        .d((~present_state[0] & ~x) | (present_state[0] & x)),
        .rst(rst),
        .clk(clk),
        .q(next_state[0]));
    
    always @(rst or next_state) begin
        if(rst == 1'b1)
            present_state <= 3'b000;
        else
            present_state <= next_state;
    end
    
    assign F = present_state[2] & present_state[0];
    assign state = present_state;
endmodule

