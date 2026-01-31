`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2023 11:42:44 AM
// Design Name: 
// Module Name: ball_debug
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


module ball_debug(
    output [15:0] pos,
    output hittable_one, hittable_two,
    input clk, rst, button_one, button_two, squash_en
    );
    
    Task3_Debouncer b1(clean_one, button_one, clk, rst);
    Task3_Debouncer b2(clean_two, button_two, clk, rst);
    
    ball b(pos, hittable_one, hittable_two, start_game, clean_one, clean_two, match_one, match_two, return_one, return_two, clk, rst, squash_en);
    player p1(return_one, life_one, match_one, clean_one, hittable_one, start_game, clk, rst, 0);
    player p2(return_two, life_two, match_two, clean_two, hittable_two, start_game, clk, rst, squash_en);
    
endmodule
