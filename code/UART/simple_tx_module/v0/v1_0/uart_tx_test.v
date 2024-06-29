`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:52:10 06/29/2024
// Design Name:   uart_tx
// Module Name:   /home/ise/code/UART/simple_tx_module/v0/v1_0/uart_tx_test.v
// Project Name:  UART
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: uart_tx
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module uart_tx_test;

	// Inputs
	reg clk;
	reg reset;
	reg tx_start;
	reg s_tick;
	reg [7:0] din;

	// Outputs
	wire tx_done_tick;
	wire tx;
	
	reg baud_rate;
	reg [7:0] sample_rate;

	// Instantiate the Unit Under Test (UUT)
	uart_tx uut (
		.clk(clk), 
		.reset(reset), 
		.tx_start(tx_start), 
		.s_tick(s_tick), 
		.din(din), 
		.tx_done_tick(tx_done_tick), 
		.tx(tx)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		tx_start = 0;
		s_tick = 0;
		din = 0;
		
		baud_rate = 0;
		sample_rate = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		reset = 0;
		
		#26041.7;
		#26041.7;
		
		din = 8'b00110011;
		
		#26041.7;
		#26041.7;
		
		tx_start = 1;
		
		#26041.7;
		tx_start = 0;
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

	always @(posedge clk, posedge reset) 
		if (reset)
			begin
				s_tick <= 0;
				sample_rate <= 0;
			end
		else if(sample_rate == 163)
			begin
				sample_rate <= 0;
				s_tick <= 1;
			end
		else
			begin
				sample_rate <= sample_rate + 1;
				s_tick <= 0;
			end
			
endmodule



