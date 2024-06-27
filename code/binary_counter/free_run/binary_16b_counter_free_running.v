`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:29:15 06/27/2024 
// Design Name: 
// Module Name:    binary_16b_counter_free_running 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module binary_16b_counter_free_running
	(
		input wire clk, reset,
		input [15:0] max_count,
		output wire max_tick
	);
	reg [15:0] q;

	always @(posedge clk, posedge reset) 
		if (reset) 
			q <= 0;
		else if(q == max_count)
			q <= 0;
		else
			q <= q + 1;

	assign max_tick = (q == max_count) ? 1'b1 : 1'b0;
endmodule
