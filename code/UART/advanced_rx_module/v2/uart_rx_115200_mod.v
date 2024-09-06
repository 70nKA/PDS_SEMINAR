`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:05:19 09/06/2024 
// Design Name: 
// Module Name:    uart_rx_115200_mod 
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
module uart_rx_115200_mod
	(
		input wire clk, reset,
		input wire rx,
		input wire read_req,
		output wire [13:0] rx_fifo_capacity,
		output wire [7:0] read_data
   );
	
	wire baud_rate;
	
	wire rx_tick;
	wire rx_done_tick;
	wire [7:0] rx_data;
	
	uart_baud_rate_gen rx_baud_rate_gen
	(
		.clk(clk), .reset(reset),
		.tick(rx_tick)
	);
	
	uart_baud_rate_devisor baud_rate_gen
	(
		.clk(rx_tick), .reset(reset),
		.tick(baud_rate)
	);
	
	async_fifo
	#(.LOG_DEPTH(14), .WIDTH(8),
     .ALMOST_FULL_VALUE(14336),
     .ALMOST_EMPTY_VALUE(2))
	rx_fifo
	(
    .aclr(reset),
	 .wrclk(baud_rate),
    .wrreq(rx_done_tick),
    .data(rx_data),
    .wrempty(),
    .wrfull(),
    .wr_almost_empty(),
    .wr_almost_full(),
    .wrusedw(),
    
    .rdclk(clk),
    .rdreq(read_req),
    .q(read_data),
    .rdempty(),
    .rdfull(),
    .rd_almost_empty(),    
    .rd_almost_full(),    
    .rdusedw(rx_fifo_capacity)
	);

	uart_rx rx_cicuit
	(
		.clk(clk), .reset(reset),
		.s_tick(rx_tick),
		.rx(rx), 
		.rx_done_tick(rx_done_tick),
		.dout(rx_data)
	);
endmodule

module uart_baud_rate_devisor
	#(
		parameter DEVISOR = 16
	)
	(
		input wire clk, reset,
		output reg tick
	);
	
	reg [2:0] counter;
	
	always@(posedge clk, posedge reset)
		if(reset)
			begin
				counter <= 0;
				tick <= 0;
			end
		else
			if(counter == (DEVISOR/2 - 1))
				begin
					counter <= 0;
					tick <= ~tick;
				end
			else
				counter <= counter + 1;
endmodule
