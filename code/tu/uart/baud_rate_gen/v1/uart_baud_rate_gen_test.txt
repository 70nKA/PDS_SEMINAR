`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:01:39 08/21/2024
// Design Name:   uart_baud_rate_gen
// Module Name:   /home/ise/code/binary_counter/uart/baud_rate_115200/v2/uart_baud_rate_gen_test.v
// Project Name:  binary_counter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: uart_baud_rate_gen
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module uart_baud_rate_gen_test;

	// Inputs
	reg clk;
	reg reset;

	// Outputs
	wire tick;

	// Instantiate the Unit Under Test (UUT)
	uart_baud_rate_gen uut (
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

