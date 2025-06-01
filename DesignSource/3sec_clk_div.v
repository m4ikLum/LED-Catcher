`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

// Module Name: Clk_Divider_10Hz

//////////////////////////////////////////////////////////////////////////////////
module three_sec_clk_div (
	input clk_in,
	input rst,
	output reg divided_clk
    );
	 
	 
parameter toggle_value = 300_000_000; // For 1/3 Hz

	 
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
