`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:50:19 08/30/2024 
// Design Name: 
// Module Name:    line_buffer_logic 
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
module line_buffer_logic
(
    input i_clk, i_rst,
    input [7:0] i_pixel_data,
    input i_pixel_data_valid,
    output reg [71:0] o_pixel_data,
    output o_pixel_data_valid,
    output reg o_intr
);

    reg [8:0] pixelCounter;
    reg [1:0] currentWrline_buffer;
    reg [3:0] lineBuffDataValid;
    reg [3:0] lineBuffRdData;
    reg [1:0] currentRdline_buffer;
    wire [23:0] lb0data;
    wire [23:0] lb1data;
    wire [23:0] lb2data;
    wire [23:0] lb3data;
    reg [8:0] rdCounter;
    reg rd_line_buffer;
    reg [11:0] totalPixelCounter;
    reg rdState;

    localparam IDLE = 'b0,
               RD_BUFFER = 'b1;

    assign o_pixel_data_valid = rd_line_buffer;

    always @(posedge i_clk)
        if(i_rst)
            totalPixelCounter <= 0;
        else
            begin
                if(i_pixel_data_valid & !rd_line_buffer)
                    totalPixelCounter <= totalPixelCounter + 1;
                else if(!i_pixel_data_valid & rd_line_buffer)
                    totalPixelCounter <= totalPixelCounter - 1;
            end

    always @(posedge i_clk)
    begin
        if(i_rst)
            begin
                rdState <= IDLE;
                rd_line_buffer <= 1'b0;
                o_intr <= 1'b0;
            end
        else
        case(rdState)
            IDLE:
                begin
                    o_intr <= 1'b0;
                    if(totalPixelCounter >= 1536)
                        begin
                            rd_line_buffer <= 1'b1;
                            rdState <= RD_BUFFER;
                        end
                end
            RD_BUFFER:
                begin
                    if(rdCounter == 511)
                        begin
                            rdState <= IDLE;
                            rd_line_buffer <= 1'b0;
                            o_intr <= 1'b1;
                        end
                end
        endcase
    end

    always @(posedge i_clk)
        if(i_rst)
            pixelCounter <= 0;
        else
            if(i_pixel_data_valid)
                pixelCounter <= pixelCounter + 1;

    always @(posedge i_clk)
        if(i_rst)
            currentWrline_buffer <= 0;
        else
            begin
                if(pixelCounter == 511 & i_pixel_data_valid)
                    currentWrline_buffer <= currentWrline_buffer+1;
            end

    always @(*)
        begin
            lineBuffDataValid = 4'h0;
            lineBuffDataValid[currentWrline_buffer] = i_pixel_data_valid;
        end

    always @(posedge i_clk)
        if(i_rst)
            rdCounter <= 0;
        else 
            if(rd_line_buffer)
                rdCounter <= rdCounter + 1;

    always @(posedge i_clk)
        if(i_rst)
            currentRdline_buffer <= 0;
        else
            if(rdCounter == 511 & rd_line_buffer)
                currentRdline_buffer <= currentRdline_buffer + 1;

    always @(*)
        case(currentRdline_buffer)
            0: o_pixel_data = {lb2data,lb1data,lb0data};
            1: o_pixel_data = {lb3data,lb2data,lb1data};
            2: o_pixel_data = {lb0data,lb3data,lb2data};
            3: o_pixel_data = {lb1data,lb0data,lb3data};
        endcase

    always @(*)
        case(currentRdline_buffer)
            0:begin
                lineBuffRdData[0] = rd_line_buffer;
                lineBuffRdData[1] = rd_line_buffer;
                lineBuffRdData[2] = rd_line_buffer;
                lineBuffRdData[3] = 1'b0;
            end
           1:begin
                lineBuffRdData[0] = 1'b0;
                lineBuffRdData[1] = rd_line_buffer;
                lineBuffRdData[2] = rd_line_buffer;
                lineBuffRdData[3] = rd_line_buffer;
            end
           2:begin
                 lineBuffRdData[0] = rd_line_buffer;
                 lineBuffRdData[1] = 1'b0;
                 lineBuffRdData[2] = rd_line_buffer;
                 lineBuffRdData[3] = rd_line_buffer;
           end  
          3:begin
                 lineBuffRdData[0] = rd_line_buffer;
                 lineBuffRdData[1] = rd_line_buffer;
                 lineBuffRdData[2] = 1'b0;
                 lineBuffRdData[3] = rd_line_buffer;
           end        
        endcase

    line_buffer lB0(
        .i_clk(i_clk),
        .i_rst(i_rst),
        .i_data(i_pixel_data),
        .i_data_valid(lineBuffDataValid[0]),
        .o_data(lb0data),
        .i_rd_data(lineBuffRdData[0])
    ); 
    
    line_buffer lB1(
        .i_clk(i_clk),
        .i_rst(i_rst),
        .i_data(i_pixel_data),
        .i_data_valid(lineBuffDataValid[1]),
        .o_data(lb1data),
        .i_rd_data(lineBuffRdData[1])
    ); 
    
    line_buffer lB2(
        .i_clk(i_clk),
        .i_rst(i_rst),
        .i_data(i_pixel_data),
        .i_data_valid(lineBuffDataValid[2]),
        .o_data(lb2data),
        .i_rd_data(lineBuffRdData[2])
    ); 
    
    line_buffer lB3(
        .i_clk(i_clk),
        .i_rst(i_rst),
        .i_data(i_pixel_data),
        .i_data_valid(lineBuffDataValid[3]),
        .o_data(lb3data),
        .i_rd_data(lineBuffRdData[3])
    );    

endmodule
