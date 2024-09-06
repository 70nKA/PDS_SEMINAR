`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:39:11 06/15/2024 
// Design Name: 
// Module Name:    uart_rx 
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
		parameter SAMPLE_RATE = 16,
		parameter FLAG_SET = 1,
		parameter FLAG_RESET = 0,
		parameter START_BIT_DURATION = 8,
		parameter DATA_BIT_DURATION = 16,
		parameter DATA_BIT_NUM = 8,
		parameter STOP_BIT_DURATION = 16
	)
	(
	input wire clk, baud_rate_sample_clk,
	input wire reset, rx,
	output wire [7:0] rx_data,
	output reg rx_done
	);
	
	reg [3:0] n_tick;
	
	reg [1:0] state, state_next;
	reg flag_state;

	reg [7:0] rx_data_reg, rx_data_reg_next;
	reg flag_rx_data_reg;
	
	reg [3:0] n_bit, n_bit_next;
	reg flag_bit;
	
	localparam [1:0]
		idle = 0,
		start = 1,
		data = 2,
		stop = 3;
		
	initial
		begin
			rx_done = 0;
			n_tick = 0;
			
			state = idle;
			state_next = idle;
			flag_state = FLAG_RESET;
			
			rx_data_reg = 0;
			rx_data_reg_next = 0;
			flag_rx_data_reg = FLAG_RESET;
			
			n_bit = 0;
			n_bit_next = 0;
			flag_bit = FLAG_RESET;
		end
		
	always@(posedge reset)
		if(reset)
			begin
				rx_done <= 0;
				n_tick <= 0;
			
				state <= idle;
				state_next <= idle;
				flag_state <= FLAG_RESET;
			
				rx_data_reg <= 0;
				rx_data_reg_next <= 0;
				flag_rx_data_reg <= FLAG_RESET;
			
				n_bit <= 0;
				n_bit_next <= 0;
				flag_bit <= FLAG_RESET;
			end
	
	always@(negedge rx) 
		begin
			case(state)
				idle:
					begin
						if(~rx)
							begin
								state_next <= start;
								flag_state <= FLAG_SET;
								n_tick <= 0;
								n_bit <= 0;
							end
					end
			endcase
		end
		
	always@(posedge baud_rate_sample_clk)
		begin
			case(state)
				start:
					begin
						if(n_tick == START_BIT_DURATION - 1)
							begin
								state_next <= data;
								flag_state <= FLAG_SET;
								n_tick <= 0;
							end
						else
							n_tick <= n_tick + 1;
					end
				data:
					begin
						if(n_tick == DATA_BIT_DURATION - 1)
							begin
								rx_data_reg_next[n_bit] <= rx;
								n_tick <= 0;

								flag_rx_data_reg <= FLAG_SET;
								flag_bit <= 1;
								
								if(n_bit == DATA_BIT_NUM - 1)
									begin
										n_bit_next <= 0;
										state_next <= stop;
										flag_state <= FLAG_SET;
									end
								else
									n_bit_next <= n_bit + 1;
							end
						else
								n_tick <= n_tick + 1;
					end
				stop:
					begin
						if(n_tick == 15)
							begin
								n_tick <= 0;
								rx_done <= 1;
								state_next <= idle;
								flag_state <= FLAG_SET;
							end
						else
							n_tick <= n_tick + 1;
		end
			endcase
		end

	always@(posedge clk)
		if(flag_state)
			begin
				state <= state_next;
				flag_state <= FLAG_RESET;
			end
	
	always@(posedge clk)
		if(flag_bit)
			begin
				n_bit <= n_bit_next;
				flag_bit <= 0;
			end
			
	always@(posedge clk)
		if(flag_rx_data_reg)
			begin
				rx_data_reg <= rx_data_reg_next;
				flag_rx_data_reg <= 0;
			end
	
	assign rx_data = rx_data_reg;

endmodule
