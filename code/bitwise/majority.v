`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:46:59 10/29/2024 
// Design Name: 
// Module Name:    majority 
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
module majority
	(
		input wire [2:0] mp,
		output wire m
   );
	
	wire mp2, mp1, mp0;

	nand(mp2, mp[2], mp[1]);
	nand(mp1, mp[1], mp[0]);
	nand(mp0, mp[0], mp[2]);
	
	nand(m, mp2, mp1, mp0);
endmodule
