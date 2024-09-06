`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:40:25 09/06/2024 
// Design Name: 
// Module Name:    sobel2black_white 
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
module sobel2black_white
	(
		input clk, reset,
		input wire [7:0] data,
		input wire data_valid,
		output wire bite
	);
	
	reg [7:0] bite_reg, bite_next;
	
	always@(posedge clk, posedge reset)
		if(reset)
			bite_reg <= 0;
		else
			bite_reg <= bite_next;
	
	always@*
		begin
			bite_next = bite_reg;
			
			if(data_valid)
				bite_next = data;
		end

	assign bite = (bite_reg > 100) ? 0 : 1;
endmodule
