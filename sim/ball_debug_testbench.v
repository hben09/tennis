`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2023 01:06:27 PM
// Design Name: 
// Module Name: ball_DEBUG_testbench
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


module ball_DEBUG_testbench();

wire [15:0] pos;
wire return, match_one;

reg clk, rst, button_one, button_two;

ball_debug bd(pos, return, match_one, clk, rst, button_one, button_two);

initial begin
    clk = 0;
    rst = 1;
    #(10) rst = 0;
    button_one = 0;
    button_two = 0;
    
    #(50) button_one = 1;
    #(200) button_one = 0;
end

always begin
    #(10) clk = ~clk;
end
endmodule
