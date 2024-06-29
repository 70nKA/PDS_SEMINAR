`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:41:45 06/29/2024
// Design Name:   mod_uart_tx
// Module Name:   /home/ise/code/UART/simple_tx_module/v0/mod_uart_tx_test.v
// Project Name:  UART
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mod_uart_tx
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mod_uart_tx_test;

	// Inputs
	reg clk;
	reg reset;
	reg start;
	reg [7:0] send;
	
	// Outputs
	wire tx_done;
	wire tx;
	
	reg baud_rate;

	// Instantiate the Unit Under Test (UUT)
	mod_uart_tx uut (
		.clk(clk), 
		.reset(reset), 
		.start(start),
		.send(send),
		.tx_done(tx_done),
		.tx(tx)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		start = 0;
		send = 0;
		
		baud_rate = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		reset = 0;
		
		#26041.7;
		#26041.7;
		
		send = 8'b00110011;
		
		#26041.7;
		#26041.7;
		
		start = 1;
		
		#26041.7;
		start = 0;
		#26041.7;
		
		
		#26041.7;
		#26041.7;
		
		#26041.7;
		#26041.7;
		
		#26041.7;
		#26041.7;
		
		#26041.7;
		#26041.7;
		
		#26041.7;
		#26041.7;
		
		#26041.7;
		#26041.7;
		
		#26041.7;
		#26041.7;
		
		#26041.7;
		#26041.7;
		
		#26041.7;
		#26041.7;
		
		#26041.7;
		#26041.7;
		
		$stop;
	end
	
	always #10 clk = ~clk;
	always #26041.7 baud_rate = ~baud_rate;
      
endmodule

