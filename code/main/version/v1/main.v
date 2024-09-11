`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:46:46 09/06/2024 
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
        output wire VGA_BLUE
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

    // Generate a slower clock for VGA if necessary
    reg clk_count;
    reg clk_vga;

    initial begin
        clk_count <= 0;
        clk_vga <= 0;
    end

    always @(posedge clk) begin
        clk_vga <= clk_count;
        clk_count <= clk_count + 1;
    end

    // UART RX Module
    uart_rx_115200 uart_rx_mod
    (
        .clk(clk), .reset(reset),
        .rx(rx), .read_req(read_req),
        .rx_fifo_capacity(rx_fifo_capacity),
        .read_data(read_data)
    );

    // FIFO to Line Buffer Interface
    uart_fifo2line_buffer uart_fifo_line_buff_interface
    (
        .clk(clk), .reset(reset),
        .rx_fifo_capacity(rx_fifo_capacity),
        .interrupt(interrupt),
        .line_counter(),
        .read_req(read_req),
        .read_data_valid(read_data_valid)
    );

    // Line Buffer Logic
    line_buffer_logic line_buffer_logic_mod
    (
        .i_clk(clk), .i_rst(reset),
        .i_pixel_data(read_data),
        .i_pixel_data_valid(read_data_valid),
        .o_pixel_data(line_buff_data),
        .o_pixel_data_valid(line_buff_data_valid),
        .o_intr(interrupt)
    );

    // Sobel Edge Detection
    sobel sobel_mod
    (
        .i_clk(clk),
        .i_pixel_data(line_buff_data),
        .i_pixel_data_valid(line_buff_data_valid),
        .o_convolved_data(sobel_data),
        .o_convolved_data_valid(sobel_data_valid)
    );

    // Convert Sobel Output to Black and White
    sobel2black_white sobel2black_white_mod
    (
        .clk(clk), .reset(reset),
        .data(sobel_data),
        .data_valid(sobel_data_valid),
        .bite(vga_bite)
    );

    // VGA Controller
    vga_controller vga_con_mod
    (
        .clk(clk_vga), 
        .rst(reset), 
        .o_hs(VGA_HS),
        .o_vs(VGA_VS),
        .o_x(), // You might need to handle x and y positions based on your resolution
        .o_y()
    );

    // VGA Image Mapping
    vga_image vga_image_mod
    (
        .color_in(vga_bite),
        .i_VGA_RED(VGA_RED),
        .i_VGA_GREEN(VGA_GREEN),
        .i_VGA_BLUE(VGA_BLUE)
    );

endmodule
