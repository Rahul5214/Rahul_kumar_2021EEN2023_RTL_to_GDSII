`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Rahul Kumar
// Module Name: counter_tb
// Project Name: Counter
// Description: Test bench for Mod 5 Counter
//////////////////////////////////////////////////////////////////////////////////

module counter_tb();   

	reg clk;
	reg rst;
	wire [2:0] count;
	
	initial begin
		clk=0;           	// start clock with low value
		rst=0; #20;       	// keep reset = 0 for 20 ns 
		rst=1; #100;        // then making reset = 1 for 100 ns
		$finish;      		// stop the simulation after 120 ns
	end

// instantiating module counter here

	counter DUT (.clk(clk),
				 .rst(rst), 
				 .count(count));
					
	always #5 clk = ~clk;  	// generating clock signal with period = 10 ns


endmodule
