`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:28:31 08/20/2024
// Design Name:   async_fifo
// Module Name:   /home/ise/code/fifo/async_fifo_test.v
// Project Name:  fifo
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: async_fifo
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module async_fifo_test;

	// Inputs
	reg aclr;
	reg wrclk;
	reg wrreq;
	reg [7:0] data;
	reg rdclk;
	reg rdreq;

	// Outputs
	wire wrempty;
	wire wrfull;
	wire wr_almost_empty;
	wire wr_almost_full;
	wire [2:0] wrusedw;
	wire [7:0] q;
	wire rdempty;
	wire rdfull;
	wire rd_almost_empty;
	wire rd_almost_full;
	wire [2:0] rdusedw;
	
	// Helpers
	localparam N_WORD = 16;
	reg [3:0] i_word;
	reg [1:0] wr_cnt;

	// Instantiate the Unit Under Test (UUT)
	async_fifo uut (
		.aclr(aclr), 
		.wrclk(wrclk), 
		.wrreq(wrreq), 
		.data(data), 
		.wrempty(wrempty), 
		.wrfull(wrfull), 
		.wr_almost_empty(wr_almost_empty), 
		.wr_almost_full(wr_almost_full), 
		.wrusedw(wrusedw), 
		.rdclk(rdclk), 
		.rdreq(rdreq), 
		.q(q), 
		.rdempty(rdempty), 
		.rdfull(rdfull), 
		.rd_almost_empty(rd_almost_empty), 
		.rd_almost_full(rd_almost_full), 
		.rdusedw(rdusedw)
	);

	initial begin
		// Initialize Inputs
		aclr = 1;
		wrclk = 0;
		wrreq = 0;
		data = 8'b00000000;
		rdclk = 0;
		rdreq = 0;
		i_word = 8'b00000000;
		
		wr_cnt = 2'b00;

		// Wait 100 ns for global reset to finish
		#100;
      aclr = 0;
		// Add stimulus here

	end
	
	always #2 wrclk = ~wrclk;
	always #1 rdclk = ~rdclk;
	
	always@(posedge wrclk)
		if(aclr == 0) 
			begin
				if(wrfull == 0)
					case(wr_cnt)
						0: begin
							data <= i_word;
							wr_cnt <= wr_cnt + 1;
						end
						1: begin
							wrreq <= 1;
							wr_cnt <= wr_cnt + 1;
						end
						2: begin
							wrreq <= 0;
							wr_cnt <= 0;
							if(i_word < N_WORD - 1)
								i_word <= i_word + 1;
							else
								$stop;
						end
					endcase
				else begin
					wrreq <= 0;
					wr_cnt <= 0;
				end
			end
	
	always@(posedge rdclk)
	begin
		if(rdempty == 0)
			rdreq <= 1;
	end
	
	always@(negedge wrclk)
	begin
		rdreq <= 0;
	end
      
endmodule
