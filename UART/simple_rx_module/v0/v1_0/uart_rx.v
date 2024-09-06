`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:12:53 06/05/2024 
// Design Name: 
// Module Name:    UART_RX 
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
module uart_rx
	#(
	parameter SAMPLE_RATE=16
	)
	(
	input clk, baud_rate_clk,
	input reset, rx,
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
	reg [3:0] bit_num_next;
	reg [7:0] reg_rx_next;
	reg change_state;
	reg change_bit;
	reg change_reg_rx;
	
	initial begin
		reg_rx <= 0;
		reg_rx_next <= 0;
		rx_done <= 0;
		machine_state <= idle;
		machine_state_next <= idle;
		change_state <= 0;
		change_bit <= 0;
		change_reg_rx <= 0;
		tick <= 0;
		bit_num <= 0;
		bit_num_next <= 0;
	end
	
	always@(posedge reset) begin
		if(reset) begin
			reg_rx <= 0;
			reg_rx_next <= 0;
			rx_done <= 0;
			machine_state <= idle;
			machine_state_next <= idle;
			change_state <= 0;
			change_bit <= 0;
			change_reg_rx <= 0;
			tick <= 0;
			bit_num <= 0;
			bit_num_next <= 0;;
		end
	end
	
	always@(negedge rx) begin
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
			if(bit_num < 7) begin
				if(tick==15) begin
					reg_rx_next[bit_num] <= rx;
					change_reg_rx <= 1;
					bit_num_next <= bit_num + 1;
					change_bit <= 1;
					tick <= 0;
				end
				else
					tick <= tick + 1;
			end
			if(bit_num == 7) begin
				if(tick==15) begin
					reg_rx_next[bit_num] <= rx;
					change_reg_rx <= 1;
					bit_num_next <= 0;
					change_bit <= 1;
					tick <= 0;
					machine_state_next <= stop;
					change_state <= 1;
				end
				else
					tick <= tick + 1;
			end
		end
		stop: begin
			if(tick==15) begin
				tick <= 0;
				rx_done <= 1;
				machine_state_next <= idle;
				change_state <= 1;
			end
			else
				tick <= tick + 1;
		end
	endcase
	end
	
	always@(posedge clk) begin
		if(change_state) begin
			machine_state <= machine_state_next;
			change_state <= 0;
		end
	end
	
	always@(posedge clk) begin
		if(change_bit) begin
			bit_num <= bit_num_next;
			change_bit <= 0;
		end
	end
	
	always@(posedge clk) begin
		if(change_reg_rx) begin
			reg_rx <= reg_rx_next;
			change_reg_rx <= 0;
		end
	end
endmodule
