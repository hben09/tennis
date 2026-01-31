`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2023 06:21:01 PM
// Design Name: 
// Module Name: ball
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


module ball(
    output reg [15:0]pos,
    output reg hittable_one,
    output reg hittable_two,
    output reg start_game,
    input button_one,
    input button_two,
    input match_one,
    input match_two,
    input return_one,
    input return_two,
    input clk,
    input rst
//    input slowclk
    );
   
    parameter S1  = 16'b1000000000000000;
    parameter S2  = 16'b0100000000000000;
    parameter S3  = 16'b0010000000000000;
    parameter S4  = 16'b0001000000000000;
    parameter S5  = 16'b0000100000000000;
    parameter S6  = 16'b0000010000000000;
    parameter S7  = 16'b0000001000000000;
    parameter S8  = 16'b0000000100000000;
    parameter S9  = 16'b0000000010000000;
    parameter S10 = 16'b0000000001000000;
    parameter S11 = 16'b0000000000100000;
    parameter S12 = 16'b0000000000010000;
    parameter S13 = 16'b0000000000001000;
    parameter S14 = 16'b0000000000000100;
    parameter S15 = 16'b0000000000000010;
    parameter S16 = 16'b0000000000000001;
   
    reg serving_state = 0;
    reg direc = 0;
    reg serving_direc = 0;
    
    reg [24:0]counter = 0;
    reg [24:0]count = 25'b1111111111111111111111111;

always@(posedge clk or posedge rst) begin
   if(rst) begin
        pos <= S1;
        hittable_one <= 0;
        hittable_two <= 0;
        serving_state <= 1;
        serving_direc <= 0;
        direc <= 0;
        start_game <= 0;
    end
    else begin
        if(match_one || match_two) begin
            serving_direc <= ~serving_direc;
            start_game <= 0;
            serving_state <= 1;
            count <= 25'b1111111111111111111111111;
        end
        else if(serving_state && ~serving_direc) begin
            pos <= S1;
            hittable_one <= 0;
            hittable_two <= 0;
            if(button_one) begin
                start_game <= 1;
                serving_state <= 0;
            end
        end
        else if(serving_state && serving_direc) begin
            pos <= S16;
            hittable_one <= 0;
            hittable_two <= 0;
            if(button_two) begin
                start_game <= 1;
                serving_state <= 0;
            end
        end
        
        if(return_one || return_two) begin
            count <= count - 25'b0001100110011001100110011;
        end
        
        if(counter == count) begin
            if(~direc && start_game) begin
                    case(pos)
                        S1: pos <= S2;
                        S2: pos <= S3;
                        S3: pos <= S4;
                        S4: pos <= S5;
                        S5: pos <= S6;
                        S6: pos <= S7;
                        S7: pos <= S8;
                        S8: pos <= S9;
                        S9: pos <= S10;
                        S10: pos <= S11;
                        S11: pos <= S12;
                        S12: pos <= S13;
                        S13: pos <= S14;
                        S14: pos <= S15;
                        S15: begin pos <= S16; hittable_two <= 1; end
                        S16: begin pos <= S15; direc <= 1; hittable_two <= 0;end
                    endcase
                end
                else if(direc && start_game) begin
                    case(pos)
                        S1: begin pos <= S2; direc <= 0; hittable_one <= 0;end
                        S2: begin pos <= S1; hittable_one <= 1; end
                        S3: pos <= S2;
                        S4: pos <= S3;
                        S5: pos <= S4;
                        S6: pos <= S5;
                        S7: pos <= S6;
                        S8: pos <= S7;
                        S9: pos <= S8;
                        S10: pos <= S9;
                        S11: pos <= S10;
                        S12: pos <= S11;
                        S13: pos <= S12;
                        S14: pos <= S13;
                        S15: pos <= S14;
                        S16: pos <= S15;
                    endcase
                end
                counter <= 0;
            end
            else begin
                counter <= counter + 1;
            end
        end
    end
endmodule