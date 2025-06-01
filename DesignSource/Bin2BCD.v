`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2024 04:37:59 PM
// Design Name: 
// Module Name: Bin2BCD
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

// Convert 10 bit binary to 16 bit BCD
// Uses "double dabble" algorithm
module Bin2BCD(
    input [9:0] Bin,
    output reg [15:0] BCD
    );
    
    
    // Intermediate regs
    reg [15:0] temp_BCD = 0;
    
    
    // Determine BCD representation if binary input changes
    always @ (Bin) begin
    
        // Set temp to 0 to work on blank slate
        temp_BCD = 0;
    
        // Double dabble algorithm
        for (integer i = 0; i < 10; i=i+1) begin
        
            // Make sure temp_BCD is valid BCD representation
            if (temp_BCD[3:0] >= 5)
                temp_BCD[3:0] = temp_BCD[3:0] + 3;
                
            if (temp_BCD[7:4] >= 5)
                temp_BCD[7:4] = temp_BCD[7:4] + 3;
                
            if (temp_BCD[11:8] >= 5)
                temp_BCD[11:8] = temp_BCD[11:8] + 3;
                
            if (temp_BCD[15:12] >= 5)
                temp_BCD[15:12] = temp_BCD[15:12] + 3;
            
        
            // Shift right one bit
            temp_BCD = {temp_BCD[14:0], Bin[9-i]};
        end
    
    
        // Assign computed BCD representation to output
        BCD = temp_BCD;
    end
    
endmodule
