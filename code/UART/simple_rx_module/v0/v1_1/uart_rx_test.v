`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:22:29 06/15/2024
// Design Name:   uart_rx
// Module Name:   /home/ise/code/UART/v1_1/uart_rx_test.v
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
	reg reset;
	reg rx;
	reg s_tick;

	// Outputs
	wire rx_done_tick;
	wire [7:0] dout;

	// Instantiate the Unit Under Test (UUT)
	uart_rx uut (
		.clk(clk), 
		.reset(reset), 
		.rx(rx), 
		.s_tick(s_tick), 
		.rx_done_tick(rx_done_tick), 
		.dout(dout)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		rx = 1;
		s_tick = 0;

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

	always #2 clk = ~clk;
	always #0.125 s_tick = ~s_tick;
      
endmodule

