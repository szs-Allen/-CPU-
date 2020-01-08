`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/03 23:29:39
// Design Name: 
// Module Name: shifter
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


module shifter32_L2(x, sh);
    input [31:0] x;
    output [31:0] sh;
    parameter z = 2'b00;
    assign sh = {x[29:0],z};
endmodule

module shifter_combination(x,PC_add4,Sh);
    input [25:0] x;
    input [31:0] PC_add4;
    output [31:0] Sh;
    
    parameter z = 2'b00;
	assign Sh = {PC_add4[31:28],x[25:0],z};
endmodule
