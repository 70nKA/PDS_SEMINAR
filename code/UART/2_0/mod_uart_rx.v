`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    08:28:25 06/15/2024 
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
	#(
	parameter SAMPLE_RATE = 4
	)
	(
	input wire clk, reset,
	input wire rx,
	output wire [7:0] rx_data,
	output wire rx_done,
	output reg baud_rate_sample_clk
   );

	//reg baud_rate_sample_clk;
	
	wire [7:0] q;
	
	bin_256_cnt_free_run counter
	(
		.clk(clk),
		.reset(reset),
		.n_conut(SAMPLE_RATE),
		.q(q)
	);
	
	uart_rx mod_rx
	(
		.clk(clk),
		.baud_rate_sample_clk(baud_rate_sample_clk),
		.reset(reset),
		.rx(rx),
		.rx_data(rx_data),
		.rx_done(rx_done)
	);
	
	always@(posedge clk)
		begin
			if(reset)
				baud_rate_sample_clk = 0;
			else
				begin
					if(q == SAMPLE_RATE)
						baud_rate_sample_clk = ~baud_rate_sample_clk;
				end
		end
endmodule
