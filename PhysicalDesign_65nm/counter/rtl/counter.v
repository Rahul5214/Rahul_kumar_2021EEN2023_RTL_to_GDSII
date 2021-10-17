`timescale 1ns / 1ps

module counter(
		clk,
		rst,
		count
	);
	
	parameter MOD = 5;     				// Mod value
	input clk;             				// Clock signal
	input rst;             				// Reset signal
	output reg [2:0] count; 			// Three bit output

	always@(negedge clk) begin  		// Falling edge of the clock
		
		if(!rst || count == MOD-1)  	// count = 0, if reset is low or 
			count<=0;   				// count has reached to value 4
  
		else                      		// Increament the value of count
			count<=count+1;
	end

endmodule

