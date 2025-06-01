`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2024 06:58:23 PM
// Design Name: 
// Module Name: LED_Catcher_Top_Module
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


module LED_Catcher_Top_Module(
    input clk, 
    input rst, 
    input [15:0] switch, 
    output [15:0] state,
    output [7:0] AN,
    output [6:0] CAT
);

    
    // Instantiate LED catcher game module
    wire [15:0] BCD;
    LED_catcher LED_Catcher_Game (clk, rst, switch, BCD, state);
    
    
    // Instantiate seven segment display
    Seven_Seg_Display_Driver Seven_Seg_Display (BCD, clk, rst, AN, CAT);


endmodule
