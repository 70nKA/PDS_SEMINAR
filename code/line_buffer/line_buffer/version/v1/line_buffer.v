`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:19:46 08/30/2024 
// Design Name: 
// Module Name:    line_buffer 
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
module line_buffer
	#(
		parameter LINE_BUFF_SIZE = 512
	)
	(
		input i_clk, i_rst,
		input [7:0] i_data,
		input i_data_valid,
		output [23:0] o_data,
		input i_rd_data
	);

	reg [7:0] line [LINE_BUFF_SIZE-1:0];
	reg [8:0] wrPntr;
	reg [8:0] rdPntr;

	always @(posedge i_clk)
		if(i_data_valid)
			line[wrPntr] <= i_data;

	always @(posedge i_clk)
		if(i_rst)
			wrPntr <= 'd0;
		else if(i_data_valid)
			wrPntr <= wrPntr + 'd1;

	assign o_data = {line[rdPntr],
	              line[rdPntr+1],
					  line[rdPntr+2]};

	always @(posedge i_clk)
		if(i_rst)
			rdPntr <= 'd0;
		else if(i_rd_data)
			rdPntr <= rdPntr + 'd1;
endmodule
