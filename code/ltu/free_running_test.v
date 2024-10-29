`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:10:04 10/29/2024
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
	wire tick;

	// Instantiate the Unit Under Test (UUT)
	free_running uut (
		.clk(clk), 
		.reset(reset), 
		.enable(enable), 
		.max_cnt(max_cnt), 
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
		
		#5000;
        
		// Add stimulus here
		max_cnt = 28;
		#5000;
		$stop;
	end
   
	always #10 clk = ~clk;
endmodule

