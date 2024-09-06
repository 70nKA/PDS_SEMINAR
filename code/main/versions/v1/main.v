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
		output wire VGA_HS,
		output wire VGA_VS,
		output wire VGA_RED,
		output wire VGA_GREEN,
		output wire VGA_BULE
   );
	
	wire [7:0] read_data;
	
	wire [13:0] rx_fifo_capacity;
	wire interrupt;

	wire read_req;
	wire read_data_valid;
	
	wire [71:0] line_buff_data;
	wire line_buff_data_valid;
	
	wire [7:0] sobel_data;
	wire sobel_data_valid;
	
	wire vga_bite;
	
	reg clk_count;
	reg clk_vga;
	
	initial
		begin
			clk_count <= 0;
			clk_vga <= 0;
		end
	
	always@(posedge clk)
		begin
			clk_vga <= clk_count;
			clk_count <= clk_count + 1;
		end
	
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
		.line_counter(),
		.read_req(read_req),
		.read_data_valid(read_data_valid)
	);
	
	line_buffer_logic line_buffer_logic_mod
	(
		.i_clk(clk), .i_rst(reset),
		.i_pixel_data(read_data),
		.i_pixel_data_valid(read_data_valid),
		.o_pixel_data(line_buff_data),
		.o_pixel_data_valid(line_buff_data_valid),
		.o_intr(interrupt)
	);
	
	sobel sobel_mod
    (
        .i_clk(clk),
        .i_pixel_data(line_buff_data),
        .i_pixel_data_valid(line_buff_data_valid),
        .o_convolved_data(sobel_data),
        .o_convolved_data_valid(sobel_data_valid)
    );
	 
	sobel2black_white sobel2black_white_mod
	(
		.clk(clk), .reset(reset),
		.data(sobel_data),
		.data_valid(sobel_data_valid),
		.bite(vga_bite)
	);
	 
	 VGA_controller VGA_con_mod
	 (
		.clk(clk_vga), 
		.rst(reset), 
		.o_hs(VGA_HS),
		.o_vs(VGA_VS),
		.o_x(),
		.o_y()
	);

	VGA_image VGA_image_mod
    (
        .color_in(vga_bite),
        .i_VGA_RED(VGA_RED),
        .i_VGA_GREEN(VGA_GREEN),
        .i_VGA_BLUE(VGA_BULE)
    );

endmodule

module sobel2black_white
	(
		input clk, reset,
		input wire [7:0] data,
		input wire data_valid,
		output wire bite
	);
	
	reg [7:0] bite_reg, bite_next;
	
	always@(posedge clk, posedge reset)
		if(reset)
			bite_reg <= 0;
		else
			bite_reg <= bite_next;
	
	always@*
		begin
			bite_next = bite_reg;
			
			if(data_valid)
				bite_next = data;
		end

	assign bite = (bite_reg > 100) ? 0 : 1;
endmodule
