`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2024 09:22:47 PM
// Design Name: 
// Module Name: Seven_Seg_Display_Driver
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

// Takes in BCD input and in turn drives the 4 seven segment displays
// Should be refreshed at 1 KHz, so clk needs to be 1 KHz
module Seven_Seg_Display_Driver(
    input [15:0] BCD,
    input clk,
    input rst,
    output [7:0] AN,
    output [6:0] CAT
    );
    
    
    // Register to store BCD digits to be represented in seven segment display
    reg [3:0] driven_digit = 0;
    
    // Register to determine which digit will be driven
    reg [1:0] counter = 0;
    
    // Instantiate wires
    wire clk_4KHz;
    
    
    // Instantiate anode and cathode drivers
    Anode_Driver An_Driver (counter, AN);
    Cathode_Driver Cat_Driver (driven_digit, CAT);
    
    // Clk Divider
    Clk_Divider_4KHz slow_clk (clk, rst, clk_4KHz);
    
    
    // Iterate through each 7 segment display to update their representations
    always @ (posedge clk_4KHz) begin
    
        // Update counter (will count 0-3 and loop back)
        // NOTE: The driver updates the correct digits only when counter is updated before assigning the driving digits
        counter = counter + 1'b1;
    
        // Determine what digit to drive
        case (counter)
            0: driven_digit = BCD[3:0]; 
            1: driven_digit = BCD[7:4];
            2: driven_digit = BCD[11:8];
            3: driven_digit = BCD[15:12];
            default: driven_digit = 0;
        endcase
    end
    
endmodule
