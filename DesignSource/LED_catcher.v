`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2024 05:12:50 PM
// Design Name: 
// Module Name: LED_catcher
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

// NOTE: clk is internal clk
module LED_catcher(
    input clk, 
    input rst,
    input [15:0] switch, 
    output [15:0] bcd,
    output reg [15:0] state
    );
    
    reg [4:0] count;
    reg [9:0] score;
    reg rst2;
    parameter s0    = 16'b1000000000000000, 
              s1    = 16'b0100000000000000, 
              s2    = 16'b0010000000000000, 
              s3    = 16'b0001000000000000, 
              s4    = 16'b0000100000000000, 
              s5    = 16'b0000010000000000, 
              s6    = 16'b0000001000000000,
              s7    = 16'b0000000100000000, 
              s8    = 16'b0000000010000000,
              s9    = 16'b0000000001000000, 
              s10   = 16'b0000000000100000, 
              s11   = 16'b0000000000010000, 
              s12   = 16'b0000000000001000, 
              s13   = 16'b0000000000000100, 
              s14   = 16'b0000000000000010, 
              s15   = 16'b0000000000000001;
              
    
    initial state = s0;
    initial score = 1'b0;
    initial rst2 = 0;
    initial count = 0;
    

    // Switch state from previous clock cycle
    reg [15:0] prev_switch = 0;
    

    // Convert score to BCD representation
    Bin2BCD Bin_to_BCD(score, bcd);
    
    
    // Three second timer indicator
    wire three_seconds_up;
    debouncer_3sec Three_Sec_Timer (clk, rst2, three_seconds_up); 
    
    // 10Hz clk
    wire clk_10Hz;
    Clk_Divider_10Hz clk_divider_10Hz (clk, rst2, clk_10Hz); 
    
    
    reg [15:0] temp_state;
    initial temp_state = s0;
    
    // Control LED sequence (LED goes from left to right and back to left until LED it caught, then it freezes for 3 seconds
    // before it continues again)
    always @(posedge clk_10Hz or posedge rst or posedge three_seconds_up) begin    
        // Record switch state
        prev_switch <= switch;
    
        // Main game mechanism
        if (rst) begin
            state <= s0;
            score <= 0;
            count <= 0;
        end
        else if (three_seconds_up)
            rst2 <= 0;
        else begin
                case(state)
                    s0: begin
                        state <= s1;
                        if(count == 0) begin
                            count <= 1'b1+count;
                        end
                        else if (count == 30)
                            count <= 1; // Make count 1 so that it corresponds with the s1 state
                        end
                       
                        
                    s1: begin
                        if(count == 1) begin
                            state <= s2; 
                        end
                        else if (count == 29) begin
                            state <= s0;
                        end
                        count <= 1'b1+count;
                        end
                        
                    s2: begin
                        if(count == 2) begin
                            state <= s3;   
                        end
                        else if(count == 28)begin
                            state <= s1;
                        end 
                        count = 1'b1 + count;
                        end
                        
                    s3: begin 
                        if(count == 3) begin
                            state <= s4;   
                        end
                        else if(count == 27) begin
                            state <= s2;
                        end
                        count = 1'b1 + count;
                        end
                        
                    s4: begin 
                        if(count == 4) begin
                            state <= s5;   
                        end
                        else if(count == 26) begin
                            state <= s3;
                        end
                        count = 1'b1 + count;
                        end
                        
                                           
                    s5: begin 
                        if(count == 5) begin
                            state <= s6;   
                        end
                        else if(count == 25) begin
                            state <= s4;
                        end
                        count = 1'b1 + count;
                        end
                        
                                           
                    s6: begin 
                        if(count == 6) begin
                            state <= s7;   
                        end
                        else if(count == 24) begin
                            state <= s5;
                        end
                        count = 1'b1 + count;
                        end
                        
                                            
                    s7: begin 
                        if(count == 7) begin
                            state <= s8;   
                        end
                        else if(count == 23) begin
                            state <= s6;
                        end
                        count = 1'b1 + count;
                        end
                        
                                                                   
                    s8: begin 
                        if(count == 8) begin
                            state <= s9;   
                        end
                        else if(count == 22) begin
                            state <= s7;
                        end
                        count = 1'b1 + count;
                        end
                        
                        
                   s9: begin 
                        if(count == 9) begin
                            state <= s10;   
                        end
                        else if(count == 21) begin
                            state <= s8;
                        end
                        count = 1'b1 + count;
                        end
                        
                   s10: begin 
                        if(count == 10) begin
                            state <= s11;
                        end
                        else if(count == 20) begin
                            state <= s9;
                        end
                        count = 1'b1 + count;
                        end
                        
                          
                   s11: begin 
                        if(count == 11) begin
                            state <= s12;   
                        end
                        else if(count == 19) begin
                            state<=s10;
                            
                        end
                        count = 1'b1 + count;
                        end
                        
                           
                   s12: begin 
                        if(count == 12) begin
                            state <= s13;   
                        end
                        else if(count == 18)
                            state<=s11;
                        count = 1'b1 + count;
                        end
                        
                           
                   s13: begin 
                        if(count == 13) begin
                            state <= s14;   
                        end
                        else if(count == 17)
                            state<=s12;
                        count = 1'b1 + count;
                        end
                        
                                               
                   s14: begin
                        if(count == 14) begin
                            state <= s15;   
                        end
                        else if(count == 16)
                            state<=s13;
                        count = 1'b1 + count;
                        end
                                              
                   s15: begin 
                        state <=s14;
                        count = 1'b1 + count;
                        end
                        
        
                endcase
          end
          
          // Update temp_state
          temp_state <= state;
    end
    
    
    // Increment score when user catches LED, freeze for 3 seconds
    genvar i;
    generate
        for (i = 0; i <= 15; i=i+1) begin
        
            always @(switch[i]) begin
            
                // Check if switch is 1, previously it was 0, and the LED associated with the switch is on
                if (switch[i] & temp_state[i] & ~prev_switch[i]) begin
                    rst2 <= 1;
                    score <= score + 1;
                end
             end
        end
    endgenerate

    
    
    
    // NOTE: Might conflict with debouncer
//    always @(posedge three_seconds_up) begin
//        rst2 <= 0;
//    end
  
endmodule
