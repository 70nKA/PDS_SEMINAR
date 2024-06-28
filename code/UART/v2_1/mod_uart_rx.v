`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:33:06 06/19/2024 
// Design Name: 
// Module Name:    mod_uart_rx 
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
module mod_uart_rx
	(
	input clk, reset,
	input [7:0] sample_max_count,
	input rx,
	output reg [7:0] rx_reg
	);
	
	wire w_tick;
	wire rx_done_tick;
	wire [7:0] rx_wire;
	
	bin_256_cnt_free_run sample_pulses
	(
		.clk(clk),
		.reset(reset),
		.n_conut(sample_max_count),
		.max_tick(w_tick)
	);

	uart_rx rx_log
	(
		.clk(clk),
		.reset(reset),
		.rx(rx),
		.s_tick(w_tick),
		.rx_done_tick(rx_done_tick),
		.dout(rx_wire)
	);
	
	always@(posedge reset, posedge rx_done_tick)
		if(reset)
			rx_reg <= 0;
		else
			rx_reg <= rx_wire;

endmodule
