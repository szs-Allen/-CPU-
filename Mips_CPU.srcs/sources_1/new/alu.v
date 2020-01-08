`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/03 10:33:27
// Design Name: 
// Module Name: ALU
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


module ALU(A, B, ALUOp, result, zero);
    input [31:0] A;
    input [31:0] B;
    input [2:0] ALUOp;
    output reg [31:0] result;
    output reg zero;
    
    always@(ALUOp or A or B) 
	begin
        case(ALUOp)
            3'b000: result = A+B;
            3'b001: result = A-B;
            3'b010: result = A&B;
            3'b011: result = A|B;
            3'b100: result = B<<16;
		endcase
		assign zero = (result == 0) ? 1:0;
	end
endmodule
