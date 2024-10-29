`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:08:53 10/02/2024
// Design Name:   ltu_clk_div
// Module Name:   /home/ise/code/ltu/ltu-clk_div_test.v
// Project Name:  ltu
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ltu_clk_div
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ltu_clk_div_test;

	// Inputs
	reg clk;
	reg reset;
	reg [1:0] LTUCLKDIVSET;

	// Outputs
	wire [1:0] LTUCLKDIVGET;

	// Instantiate the Unit Under Test (UUT)
	ltu_clk_div uut (
		.clk(clk), 
		.reset(reset), 
		.LTUCLKDIVSET(LTUCLKDIVSET), 
		.LTUCLKDIVGET(LTUCLKDIVGET)
	);

	initial begin
		// Initialize Inputs
		clk = 1;
		reset = 1;
		LTUCLKDIVSET = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset = 0;

		#1000;
		LTUCLKDIVSET = 1;
		#1000;
		LTUCLKDIVSET = 2;
		#1000;
		LTUCLKDIVSET = 3;
		#1000;
		$stop;
	end
	
	always #8 clk = ~clk;
      
endmodule

