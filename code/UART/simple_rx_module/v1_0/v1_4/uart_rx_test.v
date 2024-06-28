`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   07:42:59 06/27/2024
// Design Name:   uart_rx
// Module Name:   /home/ise/code/UART/v1_4/uart_rx_test.v
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
	
	reg baud_rate;
	reg [7:0] sample_rate;

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
		
		baud_rate = 0;
		sample_rate = 0;

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
	
	initial begin
        $monitor("Time=%0d, rx=%b, state=%b, b_reg=%b, dout=%b, rx_done_tick=%b",
                 $time, rx, uut.state_reg, uut.b_reg, dout, rx_done_tick);
	end
      
endmodule

