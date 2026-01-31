`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/21/2023 12:17:11 PM
// Design Name: 
// Module Name: player
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


module player(
    output reg return,
    output reg [1:0]life,
    output reg match,
    input button,
    input hittable_ball,
    input start_game,
    input clk,
    input rst
    );
   
    reg ball_hit = 0;
    reg hittable = 0;
    
always@(posedge clk or posedge rst) begin

    if(hittable_ball) begin
        hittable <= 1;
    end
    else begin
        hittable <= hittable;
    end

    if(return) begin
        return <= 0;
    end
    else begin
        return <= return;
    end


    if(rst) begin
        return <= 0;
        match <= 0;
        life <= 2'b11;
    end
    else begin
        if(button) begin
            if(start_game && hittable_ball) begin
                return <= 1;
                ball_hit <= 1;
            end
            else if(~hittable_ball && start_game) begin
                life <= life - 1;
                if(life == 2'b01) begin
                    match <= 1;
                    return <= 0;
                    life <= 2'b11;
                end
            end
        end
        else if(start_game && ~hittable_ball && ~ball_hit && hittable) begin
            match <= 1;
            return <= 0;
            hittable <= 0;
        end
        else if(start_game && ~hittable_ball && ball_hit && hittable) begin
            ball_hit <= 0;
            hittable <= 0;
        end
        else begin
            return <= 0;
            match <= 0;
        end
    end
end

endmodule