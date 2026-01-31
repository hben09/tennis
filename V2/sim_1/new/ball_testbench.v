`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2023 06:26:40 PM
// Design Name: 
// Module Name: ball_testbench
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


module ball_testbench(
    );
    
wire [15:0]pos;
wire hittable_one, hittable_two, start_game;
reg button_one, button_two, match_one, match_two, clk, rst;

//ball b(pos, hittable_one, hittable_two, start_game, button_one, button_two, match_one, match_two, clk, rst, slowclk, squash);
ball b(pos, hittable_one, hittable_two, start_game, button_one, button_two, match_one, match_two, clk, rst);


initial begin
    rst = 1;
    clk = 0;
    match_one = 0;
    match_two = 0;
    #(20) rst = 0;
 
    button_one = 0;
    button_two = 0;
    
    #(60) button_one = 1;
    #(100) button_one = 0;
    
end

always begin
    #(10) clk = ~clk;
end
    
endmodule