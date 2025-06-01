`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2024 09:53:04 PM
// Design Name: 
// Module Name: Cathode_Driver
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

// Determine which segments in a seven segment display to light up
module Cathode_Driver(
    input [3:0] BCD,
    output reg [6:0] CAT
    );
    
    initial CAT = 7'b0000001;
    
    // Determine which segments to light up
    always @(BCD) begin
    
        case (BCD)
        
            0: CAT <=7'b0000001; // 0
            1: CAT <=7'b1001111; // 1
            2: CAT <=7'b0010010; // 2
            3: CAT <=7'b0000110; // 3
            4: CAT <=7'b1001100; // 4
            5: CAT <=7'b0100100; // 5
            6: CAT <=7'b0100000; // 6
            7: CAT <=7'b0001111; // 7
            8: CAT <=7'b0000000; // 8
            9: CAT <=7'b0000100; // 9
            default: CAT <= 7'b0000001; // 0
        endcase
    
    end
    
endmodule
