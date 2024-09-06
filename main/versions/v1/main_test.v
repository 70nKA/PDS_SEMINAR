`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:15:13 09/06/2024
// Design Name:   main
// Module Name:   /home/ise/code/main/versions/v1/main_test.v
// Project Name:  main
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module main_test;

	// Inputs
	reg clk;
	reg reset;
	reg rx;

	// Outputs
	wire [8:0] line_counter;
	wire [71:0] sobel_data;
	wire sobel_data_valid;
	
	// Helpers
	reg baud_rate;

	reg [9:0] pc_byte;
	reg [3:0] counter_loop;
	reg [11:0] counter_byte;

	// Instantiate the Unit Under Test (UUT)
	main uut (
		.clk(clk), 
		.reset(reset), 
		.rx(rx), 
		.line_counter(line_counter),
		.sobel_data(sobel_data), 
		.sobel_data_valid(sobel_data_valid)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		rx = 1;
		baud_rate = 0;

		pc_byte = 10'b1000011110;

		// Wait 100 ns for global reset to finish
		#100;
		reset = 0;
        
		// Add stimulus here

	end
	
	always #10 clk = ~clk;
	always #4340.28 baud_rate = ~baud_rate;
	
	always@(posedge baud_rate, posedge reset)
		if(reset)
			begin
				counter_loop <= 0;
				counter_byte <= 0;
			end
		else
			begin
				if(counter_loop < 10)
					begin
						rx <= pc_byte[counter_loop];
						counter_loop <= counter_loop + 1;
					end
				else
					begin
						counter_loop <= 0;
						if(line_counter == 7)
							begin
								#100000;
								$stop;
							end
					end
			end
endmodule
