`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:07:11 10/15/2024
// Design Name:   free_running
// Module Name:   /home/ise/code/ltu/free_running_test.v
// Project Name:  ltu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: free_running
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module free_running_test;

	// Inputs
	reg clk;
	reg reset;
	reg enable;
	reg [7:0] max_cnt;

	// Outputs
	wire stable;
	wire tick;

	// Instantiate the Unit Under Test (UUT)
	free_running uut (
		.clk(clk), 
		.reset(reset), 
		.enable(enable), 
		.max_cnt(max_cnt), 
		.stable(stable), 
		.tick(tick)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		enable = 0;
		max_cnt = 27;

		// Wait 100 ns for global reset to finish
		#100;
		
		enable = 1;
		
		#100;
		
		reset = 0;
        
		// Add stimulus here
	end
	
	always #10 clk = ~clk;
      
endmodule

