`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:11:49 06/29/2024 
// Design Name: 
// Module Name:    mod_uart_tx 
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
module mod_uart_tx
	(
		input wire clk, reset,
		input wire start,
		input wire [7:0] send,
		output reg tx_done,
		output wire tx
   );
	
	wire max_tick;
	wire tx_done_tick;
	
	binary_16b_counter_free_running sample_rate
	(
		.clk(clk),
		.reset(reset),
		.max_count(16'b0000000010100011),
		.max_tick(max_tick)
	);
	
	uart_tx uart_tx_inst
	(
		.clk(clk),
		.reset(reset),
		.tx_start(start),
		.s_tick(max_tick),
		.din(send),
		.tx_done_tick(tx_done_tick),
		.tx(tx)
	);

	always@(posedge clk, posedge reset)
		if(reset)
			tx_done <= 0;
		else if(tx_done_tick)
			tx_done <= 1;
		else
			tx_done <= tx_done;
			
endmodule
