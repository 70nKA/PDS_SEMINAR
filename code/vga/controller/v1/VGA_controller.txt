`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:59:11 08/30/2024 
// Design Name: 
// Module Name:    VGA_controller 
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
module VGA_controller(
    input clk, 
    input rst, 
    output o_hs,  // horizontal sync signal
    output o_vs,  // vertical sync signal
    output [8:0] o_x,  // x position of the current pixel (now 9-bit to limit to 256)
    output [8:0] o_y   // y position of the current pixel (9-bit to limit to 256)
);
 
    // VGA parameters for resolution 640x480
    localparam HS_STA = 16;               // start of horizontal sync
    localparam HS_END = 16 + 96;          // end of horizontal sync
    localparam HA_STA = 16 + 96 + 48;     // start of horizontal active pixel
    localparam VS_STA = 480 + 10;         // start of vertical sync
    localparam VS_END = 480 + 10 + 2;     // end of vertical sync
    localparam HA_END = HA_STA + 256;     // end of horizontal active pixel (256 pixels width)
    localparam VA_END = 256;              // end of vertical active pixel (256 pixels height)
    localparam LINE = 800;                // total line width (in clocks)
    localparam SCREEN = 521;              // total screen height (in lines)
    
    reg [9:0] h_count;
    reg [9:0] v_count; 

    // generate hsync and vsync signals
    assign o_hs = ~((h_count >= HS_STA) & (h_count < HS_END));
    assign o_vs = ~((v_count >= VS_STA) & (v_count < VS_END));

    // keep x and y within the active pixel interval
    assign o_x = (h_count < HA_STA || h_count >= HA_END) ? 0 : (h_count - HA_STA);
    assign o_y = (v_count >= VA_END) ? (VA_END - 1) : (v_count);

    always @ (posedge clk)
    begin
        if (rst) // frame reset
            begin
                h_count <= 0;
                v_count <= 0;
            end
        if (h_count == LINE) 
            begin
                h_count <= 0;
                v_count <= v_count + 1;
            end
        else 
            h_count <= h_count + 1;

        if (v_count == SCREEN) 
            v_count <= 0;
    end
endmodule

