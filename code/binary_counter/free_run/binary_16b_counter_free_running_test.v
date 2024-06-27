`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:06:36 06/27/2024
// Design Name:   binary_16b_counter_free_running
// Module Name:   /home/ise/code/binary_counter/free_run/binary_16b_counter_free_running_test.v
// Project Name:  binary_counter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: binary_16b_counter_free_running
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module binary_16b_counter_free_running_test;

	// Inputs
	reg clk;
	reg reset;
	reg [15:0] max_count;

	// Outputs
	wire max_tick;
	
	reg baud_rate;

	// Instantiate the Unit Under Test (UUT)
	binary_16b_counter_free_running uut (
		.clk(clk), 
		.reset(reset), 
		.max_count(max_count), 
		.max_tick(max_tick)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		max_count = 0;
		
		baud_rate = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset = 0;
		
		#20;
		max_count = 163;

	end
	
	always #10 clk = ~clk;
	always #26041.7 baud_rate = ~baud_rate;
	
      
endmodule

