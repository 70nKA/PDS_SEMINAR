`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:59:50 09/06/2024
// Design Name:   baud_rate_115200_gen
// Module Name:   /home/ise/code/tu/uart/baud_rate_gen/v1/baud_rate_115200_gen_test.v
// Project Name:  tu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: baud_rate_115200_gen
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module baud_rate_115200_gen_test;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire tick;

	// Instantiate the Unit Under Test (UUT)
	baud_rate_115200_gen uut (
		.clk(clk), 
		.reset(reset), 
		.tick(tick)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;

		// Wait 100 ns for global reset to finish
		#100;
		
		reset = 0;
        
		// Add stimulus here

	end
	
	always #10 clk = ~clk;
      
endmodule
