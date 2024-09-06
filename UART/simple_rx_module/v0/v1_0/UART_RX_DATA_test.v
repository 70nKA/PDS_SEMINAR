`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   10:52:44 06/05/2024
// Design Name:   UART_RX_DATA
// Module Name:   /home/ise/code/UART/UART_RX_DATA_test.v
// Project Name:  UART
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: UART_RX_DATA
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module UART_RX_DATA_test;

	reg [3:0] tick_test;
	reg start;

	// Inputs
	reg clk;
	reg baud_rate_clk;
	reg rx;

	// Outputs
	wire [1:0] machine_state;
	wire [7:0] reg_rx;
	wire [3:0] tick;
	wire [3:0] bit_num;

	// Instantiate the Unit Under Test (UUT)
	UART_RX_DATA uut (
		.clk(clk), 
		.baud_rate_clk(baud_rate_clk),
		.rx(rx), 
		.machine_state(machine_state), 
		.reg_rx(reg_rx), 
		.tick(tick), 
		.bit_num(bit_num)
	);

	initial begin
		// Initialize Inputs
		start = 1;
		clk = 0;
		baud_rate_clk = 0;
		rx = 1;
		tick_test <= 0;
		// Wait 100 ns for global reset to finish
		#16;
        
		// Add stimulus here
	end
	
	always #0.05 clk = ~clk;
	
	always #3 baud_rate_clk = ~baud_rate_clk;
	
	always@(posedge baud_rate_clk) begin
		if(machine_state == 2) begin
			if(tick_test == 15) begin
				case(bit_num)
					0: rx <= 0;
					1: rx <= 1;
					2: rx <= 0;
					3: rx <= 0;
					4: rx <= 0;
					5: rx <= 0;
					6: rx <= 1;
					7: rx <= 1;
				endcase
				tick_test <= 0;
			end
			else
				tick_test <= tick_test + 1;
		end
		else if(machine_state == 1) begin
			tick_test <= tick_test + 1;
			rx <= 0;
		end
		else
			rx <= 0;
	end
      
endmodule

