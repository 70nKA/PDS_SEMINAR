`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:15:44 06/27/2024 
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
		input wire clk, reset,
		input wire rx,
		output reg [7:0]	rx_reg
   );
	
	wire max_tick;
	wire flag_done;
	wire [7:0] dout;
	
	binary_16b_counter_free_running sample_rate
		(
			.clk(clk),
			.reset(reset),
			.max_count(16'b0000000010100011),
			.max_tick(max_tick)
		);
	
	uart_rx uart_rx_inst
		(
			.clk(clk),
			.reset(reset),
			.rx(rx),
			.s_tick(max_tick),
			.rx_done_tick(flag_done),
			.dout(dout)
		);
		
	always@(posedge flag_done, posedge reset)
		if(reset)
			rx_reg <= 0;
		else
			rx_reg <= dout;

endmodule
