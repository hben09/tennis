`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2023 06:19:41 PM
// Design Name: 
// Module Name: player_testbench
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


module player_testbench(

    );
    
    wire return;
    wire [1:0] life;
    wire match;
    reg button, hittable_ball, start_game, clk, rst, squash_en;
    
    player b(return, life, match, button, hittable_ball, start_game, clk, rst, squash_en);

initial begin
    rst = 1;
    squash_en = 0;
    clk = 0;
    button = 0;
    hittable_ball = 0;
    start_game = 1;
    
    #(10) rst = 0;
    
    #(20) hittable_ball = 1;
//    #(10) button = 1;
//    #(20) button = 0;
    #(50) hittable_ball = 0;
    
    
//    #(5) button = 1;
//    #(20) button = 0;
//    #(5) button = 1;
//    #(20) button = 0;
//    #(5) button = 1;
//    #(20) button = 0;


    #(100) hittable_ball = 1;
    #(50) hittable_ball = 0;
    
    
    #(10) button = 1;
    #(100) button = 0;
end

always begin
    #(10) clk = ~clk;
end
    
endmodule
