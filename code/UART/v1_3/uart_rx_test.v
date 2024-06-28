`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:54:23 06/19/2024
// Design Name:   uart_rx
// Module Name:   /home/ise/code/UART/v1_3/uart_rx_test.v
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
	
	//reg [2:0] cnt;

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
		reset = 1;
		rx = 1;
		s_tick = 0;
		//cnt = 0;

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
	
	always #0.25 clk = ~clk;
	
	always@(posedge clk)
	begin
		s_tick <= 1;
		#0.125;
		s_tick <= 0;
	end
      
endmodule

