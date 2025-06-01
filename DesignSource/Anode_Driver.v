`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2024 09:53:04 PM
// Design Name: 
// Module Name: Anode_Driver
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

// Determine which anode to drive (which digit to drive) in seven segment display
// based on control input
module Anode_Driver(
    input [1:0] control,
    output reg [7:0] AN
    );
    
    initial AN = 8'b11111111;
    
    // Set which seven segment display to be refreshed
    always @ (control) begin
    
        case (control)
        
            0: AN = 8'b11111110;        // AN0 Display
            1: AN = 8'b11111101;        // AN1 Display
            2: AN = 8'b11111011;        // AN2 Display
            3: AN = 8'b11110111;        // AN3 Display
            4: AN = 8'b11101111;        // AN4 Display
            5: AN = 8'b11011111;        // AN5 Display
            6: AN = 8'b10111111;        // AN6 Display
            7: AN = 8'b01111111;        // AN7 Display
            default: AN = 8'b11111110;  // AN0 Display
        endcase
    end
    
endmodule
