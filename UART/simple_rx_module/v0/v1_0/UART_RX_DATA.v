`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:52:18 06/05/2024 
// Design Name: 
// Module Name:    UART_RX_DATA 
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
module UART_RX
	#(
	parameter SAMPLE_RATE=16
	)
	(
	input clk, baud_rate_clk,
	input rx,
	output reg rx_done,
	output reg [1:0] machine_state,
	output reg [7:0] reg_rx,
	output reg [3:0] tick, bit_num
	);

	localparam
		idle = 0,
		start = 1,
		data = 2,
		stop = 3;
		
	//reg machine_state;
	reg [1:0] machine_state_next;
	reg change_state;
	
	initial begin
		reg_rx = 1;
		rx_done = 0;
		machine_state = 0;
		machine_state_next = 0;
		change_state = 0;
		tick = 0;
		bit_num = 0;
	end
	
	always@(posedge clk) begin
	case(machine_state)
		idle: begin
			if(~rx) begin
				machine_state_next <= start;
				change_state <= 1;
			end
		end
	endcase
	end
	
	always@(posedge baud_rate_clk) begin
	case(machine_state)
		start: begin
			if(tick==7) begin
					machine_state_next <= data;
					change_state <= 1;
					tick <= 0;
				end
				else
					tick <= tick + 1;
		end
		data: begin
			if(bit_num < 8) begin
				if(tick==15) begin
					reg_rx[bit_num] <= rx;
					bit_num <= bit_num + 1;
					tick <= 0;
				end
				else
					tick <= tick + 1;
			end
			else begin
				bit_num <= 0;
				machine_state_next <= stop;
				change_state <= 1;
			end
		end
		stop: begin
			if(tick==15) begin
				reg_rx[bit_num] <= rx;
				bit_num <= bit_num + 1;
				tick <= 0;
			end
			else
				tick <= tick + 1;
			end
			else begin
				rx_done <= 1;
				machine_state_next <= idle;
				change_state <= 1;
			end
		end
	endcase
	end
	
	always@(negedge clk) begin
		if(change_state) begin
			machine_state <= machine_state_next;
			change_state <= 0;
		end
	end
endmodule
