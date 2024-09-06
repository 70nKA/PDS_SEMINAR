`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:27:32 09/06/2024 
// Design Name: 
// Module Name:    vga_image 
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
module vga_image
    (
        input color_in,
        output i_VGA_RED,
        output i_VGA_GREEN,
        output i_VGA_BLUE
    );

    assign i_VGA_RED = (color_in == 1)? 1 : 0;
    assign i_VGA_GREEN = (color_in == 1)? 1 : 0;
    assign i_VGA_BLUE = (color_in == 1)? 1 : 0; 
endmodule
