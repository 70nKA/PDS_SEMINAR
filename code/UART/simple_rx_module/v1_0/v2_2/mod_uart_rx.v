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
		output reg flag_done,
		output reg [7:0]	rx_reg
   );
	
	wire max_tick;
	wire rx_done_tick;
	
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
			.rx_done_tick(rx_done_tick),
			.dout(dout)
		);
		
	always@(posedge clk, posedge reset)
		if(reset)
			begin
				rx_reg <= 0;
				flag_done <= 0;
			end
		else if(rx_done_tick)
			begin
				rx_reg <= dout;
				flag_done <= 1;
			end
		else
			begin
				rx_reg <= rx_reg;
				flag_done <= flag_done;
			end

endmodule