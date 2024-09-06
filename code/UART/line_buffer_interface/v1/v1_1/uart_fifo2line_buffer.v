`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:35:13 09/06/2024 
// Design Name: 
// Module Name:    uart_fifo2line_buffer 
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
module uart_fifo2line_buffer
	(
		input wire clk, reset,
		input wire [13:0] rx_fifo_capacity,
		input wire interrupt,
		output wire [8:0] line_counter,
		output wire read_req,
		output wire read_data_valid
	);
	
	reg read_req_reg, read_req_next;
	reg read_data_valid_reg, 
	    read_data_valid_next;
	reg interrupt_reg, interrupt_next;
	
	localparam [2:0]
		s_init = 3'b000,
		s_main = 3'b001,
		s_idle = 3'b010,
		s_import_data = 3'b011,
		s_import_data_end = 3'b100;
	
	reg [2:0] state, state_next;
	reg [2:0] state_import, state_import_next;
	
	reg [11:0] byte_counter, byte_counter_next;
	reg [8:0] line_counter_reg, line_counter_next;
	
	always@(posedge clk, posedge reset)
		if(reset)
			begin
				state <= s_init;
				state_import <= s_idle;

				byte_counter <= 0;
				line_counter_reg <= 0;

				read_req_reg <= 0;
				read_data_valid_reg <= 0;
				interrupt_reg <= 0;
			end
		else
			begin
				state <= state_next;
				state_import <= state_import_next;
				
				byte_counter <= byte_counter_next;
				line_counter_reg <= line_counter_next;

				read_data_valid_reg <= read_data_valid_next;
				read_req_reg <= read_req_next;
				interrupt_reg <= interrupt_next;
			end
			
			
	always@(*)
		begin
			state_next = state;
			state_import_next = state_import;
			
			byte_counter_next = byte_counter;
			line_counter_next = line_counter_reg;
			
			read_data_valid_next = read_data_valid_reg;
			read_req_next = read_req_reg;
			
			interrupt_next = interrupt_reg;
			
			case(state)
				s_init:
					case(state_import)
						s_idle:
							if(rx_fifo_capacity == 4*512 + 1)
								begin
									state_import_next = s_import_data;
									
									read_data_valid_next = 1;

									byte_counter_next = 0;
								end
						s_import_data:
							case(byte_counter)
								0: begin
										read_req_next = 1;
											
										byte_counter_next = byte_counter + 1;
									end
								511: begin
										line_counter_next = line_counter_reg + 1;
										byte_counter_next = byte_counter + 1;
									end
								1023: begin
										line_counter_next = line_counter_reg + 1;
										byte_counter_next = byte_counter + 1;
									end
								1535: begin
										line_counter_next = line_counter_reg + 1;
										byte_counter_next = byte_counter + 1;
									end
								2046: begin
										read_data_valid_next = 0;
											
										byte_counter_next = byte_counter + 1;
									end
								2047: begin
										read_req_next = 0;

										byte_counter_next = byte_counter + 1;
									end
								2049: begin
										state_next = s_main;
										state_import_next = s_idle;
										
										line_counter_next = line_counter_reg + 1;
										byte_counter_next = 0;										
									end
								default: byte_counter_next = byte_counter + 1;
							endcase
					endcase
				s_main:
					begin
						if(interrupt)
							interrupt_next = 1;
							
						case(state_import)
							s_idle:
								if(interrupt_reg)
									begin
										if(line_counter_reg < 511)
											begin
												if(rx_fifo_capacity == 512 + 1)
													begin
														state_import_next = s_import_data;
															
														read_data_valid_next = 1;
														interrupt_next = 0;

														byte_counter_next = 0;
													end
											end
										else
											begin
												if(rx_fifo_capacity == 512)
													begin
														state_import_next = s_import_data_end;
																
														read_data_valid_next = 1;
														interrupt_next = 0;

														byte_counter_next = 0;
													end
											end
									end
							s_import_data:
								case(byte_counter)
									0: begin
											read_req_next = 1;
												
											byte_counter_next = byte_counter + 1;
										end
									510: begin
											read_data_valid_next = 0;
												
											byte_counter_next = byte_counter + 1;
										end
									511: begin
											read_req_next = 0;
												
											byte_counter_next = byte_counter + 1;
										end
									513: begin
											state_import_next = s_idle;
											
											line_counter_next = line_counter_reg + 1;
											byte_counter_next = 0;
										end
									default: byte_counter_next = byte_counter + 1;
								endcase
							s_import_data_end:
								case(byte_counter)
									0: begin
											read_req_next = 1;
												
											byte_counter_next = byte_counter + 1;
										end
									510: begin
											read_data_valid_next = 0;
											read_req_next = 0;

											byte_counter_next = byte_counter + 1;
										end
									513: begin
											state_next = s_init;
											state_import_next = s_idle;

											line_counter_next = 0;
											byte_counter_next = 0;
										end
									default: byte_counter_next = byte_counter + 1;
								endcase
						endcase
					end
			endcase
		end

	assign read_req = read_req_reg;
	assign read_data_valid = read_data_valid_reg;
	assign line_counter = line_counter_reg;
endmodule
