`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2024 06:59:54 PM
// Design Name: 
// Module Name: debouncer
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

// Updates input after it is steady for 3 seconds
// NOTE: Used to make sure LEDs in LED catcher is frozen for 3 seconds after user 
// "catched" LED
// NOTE: Assumes that input clk is internal clk (100 MHz)
module debouncer_3sec (
    input clk, PB,
    output reg clean_state

    );
    
    parameter count = 300_000_000;  // Change this parameter to change time to update clean_state
    
    reg [15:0] PB_cnt;
    initial PB_cnt = 0;
    initial clean_state = 0;

    always @(posedge clk) begin
    if(PB == clean_state)
        PB_cnt <= 0;
    else begin
        if(PB_cnt == count)
        //if(PB_cnt == 16'b1111111111111111)
            clean_state <= PB;
        else
           PB_cnt <= PB_cnt + 1'b1;
    end

    end
    

endmodule
