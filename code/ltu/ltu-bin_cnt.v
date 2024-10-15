`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:47:03 10/15/2024 
// Design Name: 
// Module Name:    ltu_bin_cnt 
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
module free_running
	(
		input wire clk, reset,
		input wire enable,
		input wire [7:0] max_cnt,
		output wire stable,
		output wire tick
	);
	
	localparam
		state_transit = 1'b0,
		state_count = 1'b1;

	reg state_reg, state_next;

	reg [7:0] max_cnt_reg;
	reg [7:0] counter_reg, counter_next;
	reg tick_reg, tick_next;
	
	wire max_cnt_transit;
	wire transit_state;
	
	assign max_cnt_transit = (max_cnt_reg != max_cnt) ? 1'b0 : 1'b1;
	assign transit_state = (max_cnt_transit) ? 1'b0 :
	                       (reset) ? 1'b0 : 1'b1;
	
	assign stable = (state_reg == state_transit) ? 1'b0 : 1'b1;
	assign tick = tick_reg;

	always @(posedge clk, posedge enable, posedge reset) 
		if(~enable)
			begin
				state_reg <= state_transit;
				max_cnt_reg <= 0;
				counter_reg <= 0;
				tick_reg <= 0;
			end
		else
			begin
				if(reset)
					begin
						state_reg <= state_transit;
						max_cnt_reg <= 0;
						counter_reg <= 0;
						tick_reg <= 0;
					end
				else
					begin
						state_reg <= state_next;
						counter_reg <= counter_next;
						tick_reg <= tick_next;

						if(max_cnt != 0)
							max_cnt_reg <= max_cnt;
						else
							max_cnt_reg <= 1;
					end
			end
	
	always@*
		begin
			state_next = state_reg;
			counter_next = counter_reg;
			tick_next = tick_reg;
			
			case(state_reg)
				state_transit:
					if(~transit_state)
						begin
							state_next = state_count;
							counter_next = 0;
							tick_next = 1;
						end
				state_count:
					if(~transit_state)
						if(counter_reg == max_cnt)
							begin
								counter_next = 0;
								tick_next = 1;
							end
						else
							begin
								counter_next <= counter_reg + 1;
								tick_next = 0;
							end
					else
						begin
							state_next = state_transit;
							tick_next = 0;
						end
			endcase
		end	
endmodule
