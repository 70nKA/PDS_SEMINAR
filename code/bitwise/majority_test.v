`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:21:30 10/29/2024
// Design Name:   majority
// Module Name:   /home/ise/code/bitwise/majority_test.v
// Project Name:  bitwise
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: majority
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module majority_test;

	// Inputs
	reg [2:0] mp;

	// Outputs
	wire m;
	
	// Helpers
	reg clk;
	reg init;

	// Instantiate the Unit Under Test (UUT)
	majority uut (
		.mp(mp), 
		.m(m)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		init = 0;
		mp = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always #10 clk = ~clk;
	
	always@(posedge clk)
		begin
			if(mp == 0)
				if(init)
					#20 $stop;
				else
					begin
						init = 1;
						mp <=  mp + 1;
					end
			else
				 mp <=  mp + 1;
		end
      
endmodule

