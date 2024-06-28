`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:51:13 06/15/2024
// Design Name:   mod_uart_rx
// Module Name:   /home/ise/code/UART/2_0/mod_uart_rx_test.v
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
	reg rx;

	// Outputs
	wire [7:0] rx_data;
	wire rx_done;

	// Instantiate the Unit Under Test (UUT)
	mod_uart_rx uut (
		.clk(clk), 
		.reset(reset), 
		.rx(rx), 
		.rx_data(rx_data), 
		.rx_done(rx_done)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		rx = 1;

		// Wait 100 ns for global reset to finish
		#100;
		
		#2
		reset = 0;
		
		#8
		rx = 0;
		#8;
		
		rx = 1;
		#8;
		rx = 0;
		#8;
		rx = 1;
		#8;
		rx = 0;
		#8;
		rx = 1;
		#8;
		rx = 1;
		#8;
		rx = 0;
		#8;
		rx = 1;
		#8;
		
		rx = 1;
		#8;
      $stop;
		// Add stimulus here

	end
	
	always #0.03125 clk = ~clk;
      
endmodule

