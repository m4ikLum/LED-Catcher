`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Module Name: Clk_Divider_1KHz

//////////////////////////////////////////////////////////////////////////////////
module Clk_Divider_4KHz(
	input clk_in,
	input rst,
	output reg divided_clk
    );
	 
	 
parameter toggle_value = 25_000-1; // For 4KHz

	 
reg[32:0] cnt;

always@(posedge clk_in or posedge rst)
begin
	if (rst==1) begin
		cnt <= 0;
		divided_clk <= 0;
	end
	else begin
		if (cnt==toggle_value) begin
			cnt <= 0;
			divided_clk <= ~divided_clk;
		end
		else begin
			cnt <= cnt +1;
			divided_clk <= divided_clk;		
		end
	end

end
			  
	


endmodule
