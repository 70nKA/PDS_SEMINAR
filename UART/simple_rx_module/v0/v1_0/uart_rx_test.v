`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   15:22:09 06/05/2024
// Design Name:   uart_rx
// Module Name:   /home/ise/code/UART/uart_rx_test.v
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

	reg [3:0] tick_test;
	reg [1:0]stop;

	// Inputs
	reg clk;
	reg baud_rate_clk;
	reg reset;
	reg rx;

	// Outputs
	wire rx_done;
	wire [1:0] machine_state;
	wire [7:0] reg_rx;
	wire [3:0] tick;
	wire [3:0] bit_num;

	// Instantiate the Unit Under Test (UUT)
	uart_rx uut (
		.clk(clk), 
		.baud_rate_clk(baud_rate_clk), 
		.rx(rx), 
		.reset(reset), 
		.rx_done(rx_done), 
		.machine_state(machine_state), 
		.reg_rx(reg_rx), 
		.tick(tick), 
		.bit_num(bit_num)
	);

	initial begin
		// Initialize Inputs;
		clk = 0;
		baud_rate_clk = 0;
		tick_test <= 0;
		reset <= 0;
		rx <= 1;
		stop <= 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	always #0.005 clk = ~clk;
	
	always #1 baud_rate_clk = ~baud_rate_clk;
	
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
		else if(machine_state == 3) begin
			rx <= 1;
			stop <= 1;
		end
		else
			if(stop) begin
				rx <= 1;
				if(tick_test == 15) begin
					reset <= 1;
					#10;
					if(stop == 2)
						$stop;
					else begin
						tick_test <= 0;
						rx <= 0;
						stop <= 0;
					end
				end
				else
					tick_test <= tick_test + 1;
			end
			else
				rx <= 0;
	end
      
endmodule

