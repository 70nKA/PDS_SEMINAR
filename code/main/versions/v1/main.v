`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:00:03 09/06/2024 
// Design Name: 
// Module Name:    main 
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
module main
	(
		input clk, reset,
		input rx,
		output wire [8:0] line_counter,
		output wire [71:0] sobel_data,
		output wire sobel_data_valid
   );
	
	wire [7:0] read_data;
	
	wire [13:0] rx_fifo_capacity;
	wire interrupt;

	wire read_req;
	wire read_data_valid;
	
	uart_rx_115200_mod uart_rx_mod
	(
		.clk(clk), .reset(reset),
		.rx(rx), .read_req(read_req),
		.rx_fifo_capacity(rx_fifo_capacity),
		.read_data(read_data)
   );
	
	uart_fifo2line_buffer
	uart_fifo_line_buff_interface
	(
		.clk(clk), .reset(reset),
		.rx_fifo_capacity(rx_fifo_capacity),
		.interrupt(interrupt),
		.line_counter(line_counter),
		.read_req(read_req),
		.read_data_valid(read_data_valid)
	);
	
	line_buffer_logic line_buffer_logic_mod
	(
		.i_clk(clk), .i_rst(reset),
		.i_pixel_data(read_data),
		.i_pixel_data_valid(read_data_valid),
		.o_pixel_data(sobel_data),
		.o_pixel_data_valid(sobel_data_valid),
		.o_intr(interrupt)
	);

endmodule
