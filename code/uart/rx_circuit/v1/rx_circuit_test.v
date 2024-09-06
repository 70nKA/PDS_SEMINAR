`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:17:51 09/06/2024
// Design Name:   rx_circuit
// Module Name:   /home/ise/code/uart/rx_circuit/v1/rx_circuit_test.v
// Project Name:  uart
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: rx_circuit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module rx_circuit_test;

	// Inputs
	reg clk;
	reg reset;
	reg rx;
	reg s_tick;

	// Outputs
	wire rx_done_tick;
	wire [7:0] o_rx_data;
	
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
