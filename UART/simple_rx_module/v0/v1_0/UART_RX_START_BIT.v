`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:17:42 06/05/2024 
// Design Name: 
// Module Name:    UART_RX_START_BIT 
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
module UART_RX_START_BIT
	#(
	parameter SAMPLE_RATE=16
	)
	(
	input clk, baud_rate_clk,
	input rx,
	output reg reg_rx,
	output reg [3:0] tick
	);

	localparam
		idle = 0,
		start = 1;
		
	reg machine_state;
	reg machine_state_next;
	reg change_state;
	
	initial begin
		reg_rx = 1;
		machine_state = 0;
		machine_state_next = 0;
		change_state = 0;
		tick = 0;
	end
		
	always@(clk) begin
	case(machine_state)
		0: begin
			if(~rx) begin
				machine_state_next <= start;
				change_state <= 1;
			end
		end
	endcase
	end
	
	always@(baud_rate_clk) begin
	case(machine_state)
		1: begin
			if(tick==7) begin
					reg_rx <= 0;
					#10;
					$stop;
				end
				else
					tick <= tick + 1;
		end
	endcase
	end
	
	always@(clk) begin
		if(change_state)
			machine_state <= machine_state_next;
	end
endmodule
