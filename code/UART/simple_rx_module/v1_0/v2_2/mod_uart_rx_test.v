`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:26:31 06/27/2024
// Design Name:   mod_uart_rx
// Module Name:   /home/ise/code/UART/v2_2/mod_uart_rx_test.v
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
	wire [7:0] rx_reg;
	wire flag_done;
	
	reg baud_rate;

	// Instantiate the Unit Under Test (UUT)
	mod_uart_rx uut (
		.clk(clk), 
		.reset(reset), 
		.rx(rx),
		.flag_done(flag_done),
		.rx_reg(rx_reg)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		rx = 1;
		
		baud_rate = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		reset = 0;
		
		#52083.4;
		
		rx = 0;
		#52083.4;
		
		rx = 1;
		#52083.4;
		rx = 0;
		#52083.4;
		rx = 0;
		#52083.4;
		rx = 0;
		#52083.4;
		
		rx = 1;
		#52083.4;
		rx = 0;
		#52083.4;
		rx = 1;
		#52083.4;
		rx = 1;
		#52083.4;

		rx = 1;
		#26041.7;
		#26041.7;
		
		reset = 1;
		
		#52083.4;
		reset = 0;
		#52083.4;
		
		rx = 0;
		#52083.4;
		
		rx = 0;
		#52083.4;
		rx = 0;
		#52083.4;
		rx = 1;
		#52083.4;
		rx = 1;
		#52083.4;
		
		rx = 0;
		#52083.4;
		rx = 1;
		#52083.4;
		rx = 0;
		#52083.4;
		rx = 0;
		#52083.4;

		rx = 1;
		#26041.7;
		#26041.7;
		#52083.4;
		#52083.4;
		
		$stop;
	end
	
	always #10 clk = ~clk;
	always #26041.7 baud_rate = ~baud_rate;
      
endmodule
