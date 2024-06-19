`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:08:43 06/19/2024
// Design Name:   mod_uart_rx
// Module Name:   /home/ise/code/UART/v2_1/mod_uart_rx_test.v
// Project Name:  UART
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mod_uart_rx
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mod_uart_rx_test;

	// Inputs
	reg clk;
	reg reset;
	reg [7:0] sample_max_count;
	reg rx;

	// Outputs
	wire [7:0] rx_reg;

	// Instantiate the Unit Under Test (UUT)
	mod_uart_rx uut (
		.clk(clk), 
		.reset(reset), 
		.sample_max_count(sample_max_count),
		.rx(rx),
		.rx_reg(rx_reg)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		sample_max_count = 4;
		rx = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		#4
		reset = 0;
		#4
		rx = 0;
		
		#8
		rx = 1;
		#8
		rx = 0;
		#8
		rx = 1;
		#8
		rx = 1;
		
		#8
		rx = 0;
		#8
		rx = 0;
		#8
		rx = 1;
		#8
		rx = 0;
		
		#8
		rx = 1;
	end
	
	always #0.0625 clk = ~clk;
      
endmodule

