
// Testbench for LED catcher
module LED_catcher_tb();
    
    
    // Instantiate regs and wires
    reg clk, rst;
    reg [15:0] switch;
    wire [15:0] bcd, state;
    
    
    // Instantiate test module
    LED_catcher LED_Catcher_Game_Test(clk, rst, switch, bcd, state);
    
    
    // Testbench sequence
    initial begin
    
        clk = 0; rst = 0; switch = 0;
    end
    
    always begin
    
        #2 switch[15] = ~switch[15];
    end
    
    initial #2000 $finish;
    
    
    always #5 clk = ~clk;
endmodule