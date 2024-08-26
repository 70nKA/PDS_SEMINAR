`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:58:25 08/21/2024 
// Design Name: 
// Module Name:    uart_baud_rate_gen 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 115200 baud rate UART generator
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module uart_baud_rate_gen
	(
	input wire clk, reset,
	output wire tick
	);
	
	localparam BAUD_RATE_COUNT_NUMBER = 13'b11;
	localparam BAUD_RATE_COUNT_NORMAL = 3'b010;

	localparam FIRST_EDGE_COUNT = 4'b1000;
	localparam SECOND_EDGE_COUNT = 6'b110010;
	
	localparam [1:0]
		init1_init2 = 2'b00,
		run1_init2 = 2'b01,
		run1_run2 = 2'b10;
	
	reg [1:0] state_reg, state_next;
	
	reg [2:0] counter_number_reg,
				 counter_number_next;
				  
	reg [2:0] counter1_reg,
				 counter1_next;

	reg [5:0] counter2_reg,
				 counter2_next;
	
	binary_16b_counter_free_running bin_counter
	(
		.clk(clk), .reset(reset),
		.max_count({BAUD_RATE_COUNT_NUMBER, counter_number_reg}),
		.max_tick(tick)
	);
	
	always@(posedge clk, posedge reset)
		if(reset)
			begin
				state_reg <= init1_init2;
				counter_number_reg <= BAUD_RATE_COUNT_NORMAL;
				counter1_reg <= 0;
				counter2_reg <= 0;
			end
		else
			begin
				state_reg <= state_next;
				counter_number_reg <= counter_number_next;
				counter1_reg <= counter1_next;
				counter2_reg <= counter2_next;
			end
			
	always@(*)
		begin
			state_next = state_reg;
			counter_number_next = counter_number_reg;
			counter1_next = counter1_reg;
			counter2_next = counter2_reg;
			
			if(tick)
				case(state_reg)
					init:
						if(counter1_reg == (FIRST_EDGE_COUNT - 1))
							begin
								state_next = run;
								
								counter1_next = 0;
								counter2_next = counter2_reg + 1;

								counter_number_next = counter_number_reg + 1;
							end
						else
							counter1_next = counter1_reg + 1;
					run:
						begin
							if(counter1_reg == 0)
								begin
									counter1_next = counter1_reg + 1;
									counter_number_next = BAUD_RATE_COUNT_NORMAL;
								end
							else if(counter1_reg == (FIRST_EDGE_COUNT - 1))
								begin
									counter1_next = 0;
									
									if(counter1_reg == (SECOND_EDGE_COUNT - 1))
										begin
											counter2_next = 0;
											counter_number_next = counter_number_reg + 2;
										end
									else
										begin
											counter2_next = counter2_reg + 1;
											counter_number_next = counter_number_reg + 1;
										end
								end
							else
								counter1_next = counter1_reg + 1;
						end
				endcase
		end
			
	

endmodule
