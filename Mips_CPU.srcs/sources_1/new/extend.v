`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/03 23:56:31
// Design Name: 
// Module Name: SignExtend
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module SignExtend(x,se,Y);
    input [15:0] x;
	input se;
	output [31:0] Y;
	wire [31:0] E0, E1;
	wire [15:0] e = {16{x[15]}};
	parameter z = 16'b0;
	assign E0 = {z,x};
	assign E1 = {e,x};
	Mux2x32 i(E0,E1,se,Y);
endmodule
