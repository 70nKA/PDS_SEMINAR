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
		output wire max_tick
	);
	
	reg [7:0] n_reg;
	wire [7:0] n_next;

	always@(posedge clk, posedge reset)
		if(reset == 1'b1)
			n_reg <= 1;
		else if(max_tick == 1'b1)
			n_reg <= 1;
		else
			n_reg <= n_next;

	assign n_next = n_reg + 1;
	assign max_tick = (n_reg == n_conut) ? 1 : 0;
endmodule
