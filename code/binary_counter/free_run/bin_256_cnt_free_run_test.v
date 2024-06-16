`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:55:53 06/15/2024
// Design Name:   bin_256_cnt_free_run
// Module Name:   /home/ise/code/binary_counter/free_run/bin_256_cnt_free_run_test.v
// Project Name:  binary_counter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: bin_256_cnt_free_run
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module bin_256_cnt_free_run_test;

	// Inputs
	reg clk;
	reg reset;
	reg [7:0] n_conut;

	// Outputs
	wire [7:0] q;

	// Instantiate the Unit Under Test (UUT)
	bin_256_cnt_free_run uut (
		.clk(clk), 
		.reset(reset), 
		.n_conut(n_conut), 
		.q(q)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		n_conut = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		n_conut = 163;
		reset = 1;
		#1;
		reset = 0;

	end
	
	always #0.5 clk = ~clk;
      
endmodule

