`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:25:54 06/05/2024
// Design Name:   UART_RX_START_BIT
// Module Name:   /home/ise/code/UART/UART_RX_START_BIT_test.v
// Project Name:  UART
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: UART_RX_START_BIT
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module UART_RX_START_BIT_test;

	// Inputs
	reg clk;
	reg baud_rate_clk;
	reg rx;

	// Outputs
	wire reg_rx;
	wire [3:0] tick;

	// Instantiate the Unit Under Test (UUT)
	UART_RX_START_BIT uut (
		.clk(clk), 
		.baud_rate_clk(baud_rate_clk), 
		.rx(rx), 
		.reg_rx(reg_rx),
		.tick(tick)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		baud_rate_clk = 0;
		rx = 1;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		rx = 0;
	end
	
	always #16 baud_rate_clk = ~baud_rate_clk;
	
	always #2 clk = ~clk;
      
endmodule

