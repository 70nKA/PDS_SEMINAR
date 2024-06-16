`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:41:56 06/15/2024 
// Design Name: 
// Module Name:    bin_cnt_free_run 
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
module bin_256_cnt_free_run
	(
		input wire clk, reset,
		input [7:0] n_conut,
		output wire [7:0] q
	);
	
	reg [7:0] n_reg;
	wire [7:0] n_next;
	
	wire max_tick;

	always@(posedge clk, posedge reset)
		if(reset || max_tick)
			n_reg <= 0;
		else
			n_reg <= n_next;
	
	assign q = n_reg;
	assign n_next = n_reg + 1;
	assign max_tick = (n_reg == n_conut) ? 1 : 0;
endmodule
