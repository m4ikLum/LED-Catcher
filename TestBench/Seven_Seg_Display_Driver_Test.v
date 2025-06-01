`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2024 04:39:41 PM
// Design Name: 
// Module Name: Seven_Seg_Display_Driver_Test
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


module Seven_Seg_Display_Driver_Test(
    input [15:0] BCD,
    input clk,
    input rst,
    output [3:0] AN,
    output [6:0] CAT
    );
    
    // Instantiate wires
    wire clk_4KHz;
    
    // Instantiate relevant modules
    Seven_Seg_Display_Driver Seven_Seg_Display (BCD, clk_4KHz, AN, CAT);
    Clk_Divider_4KHz slow_clk (clk, rst, clk_4KHz);
    
endmodule
