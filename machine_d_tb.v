`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.12.2021 14:47:10
// Design Name: 
// Module Name: machine_d_tb
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


module machine_d_tb;
//Inputs
reg clk;
reg rst;
reg x;
//Output
wire F;
machine_d UUT(.x(x), .rst(rst), .clk(clk), .F(F));
reg [21:0] input_data;
integer shift_amount;
initial begin
    input_data = 22'b0001111000000111000100;
    shift_amount = 0;
    x = 0;
    //second output
    rst = 1; #27;
    rst = 0; #98;
    rst = 1; #2;
    rst = 0; #95;
    //First output
    //rst = 1; #15;
    //rst = 0; #160;
    //rst = 1; #10;
    //rst = 0; #75;
    $finish;
end
initial begin //generate clock
    clk = 0;
    forever begin
        #5;
        clk = ~clk;
    end
end
always @(posedge clk) begin
    x = input_data>>shift_amount;
    shift_amount=shift_amount+1;
end
endmodule
