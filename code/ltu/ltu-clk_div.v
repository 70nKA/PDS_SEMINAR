`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:02:51 10/02/2024 
// Design Name: 
// Module Name:    ltu-clk_div 
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
module ltu_clk_div
	(
		input wire clk, reset,
		input wire [1:0] LTUCLKDIVSET,
		// 
		// Description LTUCLKDIVSET:
		//
		// register for configuring clk devider:
		//	LTUCLKDIVSET == 00 => DIV == 2
		//	LTUCLKDIVSET == 01 => DIV == 4
		//	LTUCLKDIVSET == 10 => DIV == 8
		//	LTUCLKDIVSET == 11 => DIV == 16
		//
		output wire [1:0] LTUCLKDIVGET
		// 
		// Description LTUCLKDIVGET:
		//
		// module output register:
		//	LTUCLKDIVGET[1] == 0 => LTUCLKDIVGET[0] vaule is currently invaild
		//	LTUCLKDIVGET[1] == 1 => LTUCLKDIVGET[0] vaule is currently vaild
		//	LTUCLKDIVGET[0] => new clk source
		//
	);
	
	localparam
		state_transit = 1'b0,
		state_count = 1'b1;

	reg state_reg, state_next;

	reg [2:0] div_reg, div_next;
	wire div_transit;

	reg [7:0] counter_reg, counter_next;

	reg tick_reg, tick_next;

	assign div_transit = (div_reg != div_next) ? 1'b0 : 1'b1;
	assign transit_state = (div_transit) ? 1'b0 :
	                       (reset) ? 1'b0 : 1'b1;
								  
	// LTUCLKDIVGET[1] == 1 => output LTUCLKDIVGET[0] valid
	// LTUCLKDIVGET[1] == 0 => output LTUCLKDIVGET[0] invaild
	assign LTUCLKDIVGET[1] = (state_reg == state_transit) ? 1'b0 : 1'b1;
									 
	// LTUCLKDIVGET[0] => new clk source
	assign LTUCLKDIVGET[0] = tick_reg;

	always@(posedge clk, posedge reset)
		if(reset)
			begin
				state_reg <= state_transit;
				div_reg <= 0;
				counter_reg <= 0;
				tick_reg <= 1;
			end
		else
			begin
				state_reg <= state_next;
				div_reg <= div_next;
				counter_reg <= counter_next;
				tick_reg <= tick_next;
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
						if(counter_reg == div_reg)
							begin
								counter_next <= 0;
								tick_next <= ~tick_reg;
							end
						else
							counter_next <= counter_reg + 1;
					else
						state_next = state_transit;
			endcase
		end
	
	always@*
		begin
			div_next = div_reg;

			case(LTUCLKDIVSET)
				0: div_next = 0;
				1: div_next = 1;
				2: div_next = 3;
				3: div_next = 7;
			endcase
		end
endmodule
