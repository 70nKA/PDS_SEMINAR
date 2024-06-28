`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:07:20 06/15/2024
// Design Name:   uart_rx
// Module Name:   /home/ise/code/UART/v1_2/uart_rx_test.v
// Project Name:  UART
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: uart_rx
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module uart_rx_test;

	// Inputs
	reg clk;
	reg baud_rate_sample_clk;
	reg reset;
	reg rx;

	// Outputs
	wire [7:0] rx_data;
	wire rx_done;

	// Instantiate the Unit Under Test (UUT)
	uart_rx uut (
		.clk(clk), 
		.baud_rate_sample_clk(baud_rate_sample_clk), 
		.reset(reset), 
		.rx(rx), 
		.rx_data(rx_data), 
		.rx_done(rx_done)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		baud_rate_sample_clk = 0;
		reset = 0;
		rx = 1;

		// Wait 100 ns for global reset to finish
		#100;
		
		reset = 1;
		#1;
		reset = 0;
        
		// Add stimulus here
		
		#0.85
		rx = 0;
		#4;
		
		rx = 1;
		#4;
		rx = 0;
		#4;
		rx = 1;
		#4;
		rx = 0;
		#4;
		rx = 1;
		#4;
		rx = 1;
		#4;
		rx = 0;
		#4;
		rx = 1;
		#4;
		
		rx = 1;
		#4;
	end
	
	always #0.005 clk = ~clk;
	always #0.125 baud_rate_sample_clk = ~baud_rate_sample_clk;
      
endmodule

