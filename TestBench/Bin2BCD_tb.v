`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2024 05:23:59 PM
// Design Name: 
// Module Name: Bin2BCD_tb
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

// Testbench for 10 bit binary to 16 bit BCD converter
module Bin2BCD_tb();

    // Instantiate regs and wires
    reg [9:0] Bin;
    wire [15:0] BCD;
    
    
    // Instantiate test module
    Bin2BCD Bin2BCD_test (Bin, BCD);
    
    // Testbench
    initial begin 
        
        Bin = 0;
    end
    
    always begin 
    
        #5 Bin = Bin + 1;    
    end
    
    initial #5000 $finish;

endmodule
