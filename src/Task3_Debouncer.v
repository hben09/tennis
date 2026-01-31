`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/27/2023 03:17:52 PM
// Design Name: 
// Module Name: Task3_Debouncer
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


module Task3_Debouncer(
output reg clean,
input Button, clk, rst
    );

reg [22:0]deb_count = 23'b00000000000000000000000;
reg output_exist = 1'b0;

always @(posedge clk or posedge rst)
begin
     if(rst == 1'b1)
        begin
        clean = 0;
        deb_count = 23'b00000000000000000000000;
        output_exist = 0;
        end
     else
     begin
     if(Button == 1'b1)
        begin
        if(output_exist == 1'b0)
            begin
            if(deb_count == 23'b10011000100101101000000)
//            if(deb_count == 23'b0000000000000000000100)
                begin
                clean <= 1'b1;
                deb_count <= 23'b00000000000000000000000;
                output_exist <= 1'b1;
                end
            else
                deb_count = deb_count + 23'b00000000000000000000001;
            end
        else
            clean <= 0;
        end    
    else
        begin
        clean = 0;
        deb_count = 23'b00000000000000000000000;
        output_exist = 0;
        end
    end
end
          
endmodule