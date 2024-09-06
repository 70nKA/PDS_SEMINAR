`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:14:54 09/06/2024 
// Design Name: 
// Module Name:    sobel 
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
module sobel
	 (
        input i_clk,
        input [71:0] i_pixel_data,
        input i_pixel_data_valid,
        output reg [7:0] o_convolved_data,
        output reg o_convolved_data_valid
    );

    integer i; 

    // Define kernel1 and kernel2 as constants
    localparam [71:0] kernel1 = {8'd255, 8'd0, 8'd255,
        8'd2, 8'd0, 8'd254, 8'd1, 8'd0, 8'd255}; // {-1, 0, -1, 2, 0, -2, 1, 0, -1}
    localparam [71:0] kernel2 = {8'd255, 8'd254, 8'd255,
        8'd0, 8'd0, 8'd0, 8'd1, 8'd2, 8'd1};   // {-1, -2, -1, 0, 0, 0, 1, 2, 1}

    // Keep multData1 and multData2 as vectors
    reg [98:0] multData1;  // 9 elements * 11 bits = 99 bits
    reg [98:0] multData2;  // 9 elements * 11 bits = 99 bits
    
    reg [10:0] sumDataInt1;
    reg [10:0] sumDataInt2;
    reg [10:0] sumData1;
    reg [10:0] sumData2;
    reg multDataValid;
    reg sumDataValid;

    reg [20:0] convolved_data_int1;
    reg [20:0] convolved_data_int2;
    wire [21:0] convolved_data_int;
    reg convolved_data_int_valid;

    always @(posedge i_clk) begin
        i = 0;  // Initialize loop variable
        while (i < 9) begin
            // Assign each 11-bit segment in the vectors for multiplication
            multData1[i*11 +: 11] <= $signed(kernel1[i*8 +: 8]) * $signed({1'b0, i_pixel_data[i*8 +: 8]});
            multData2[i*11 +: 11] <= $signed(kernel2[i*8 +: 8]) * $signed({1'b0, i_pixel_data[i*8 +: 8]});
            i = i + 1;  // Increment loop variable
        end
        multDataValid <= i_pixel_data_valid;
    end

    always @(*) begin
        sumDataInt1 = 0;
        sumDataInt2 = 0;
        
        i = 0;  // Initialize loop variable
        while (i < 9) begin
            // Summing each 11-bit segment in the vectors
            sumDataInt1 = $signed(sumDataInt1) + $signed(multData1[i*11 +: 11]);
            sumDataInt2 = $signed(sumDataInt2) + $signed(multData2[i*11 +: 11]);
            i = i + 1;  // Increment loop variable
        end
    end

    always @(posedge i_clk) begin
        sumData1 <= sumDataInt1;
        sumData2 <= sumDataInt2;
        sumDataValid <= multDataValid;
    end

    always @(posedge i_clk) begin
        convolved_data_int1 <= $signed(sumData1) * $signed(sumData1);
        convolved_data_int2 <= $signed(sumData2) * $signed(sumData2);
        convolved_data_int_valid <= sumDataValid;
    end

    assign convolved_data_int = convolved_data_int1 + convolved_data_int2;

    always @(posedge i_clk) begin
        if (convolved_data_int > 4000) begin
            o_convolved_data <= 8'hff;
        end else begin
            o_convolved_data <= 8'h00;
            o_convolved_data_valid <= convolved_data_int_valid;
        end
    end

endmodule
