`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/04 00:01:26
// Design Name: 
// Module Name: CONUNIT
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


module CONUNIT(Op, Func, Z, Regrt, Se, Wreg, Aluqb, Aluc, Wmem, Pcsrc, Reg2reg);
    input [5:0] Op,Func;
	input Z;
	output Regrt, Se, Wreg, Aluqb, Wmem, Reg2reg;
	output [2:0] Pcsrc;
	output [2:0] Aluc;
	
	wire R_type = ~|Op;
	wire Op_addu = R_type & Func[5] & ~Func[4] & ~Func[3] & ~Func[2] & ~Func[1] & Func[0] ;
    wire Op_subu = R_type & Func[5] & ~Func[4] & ~Func[3] & ~Func[2] & Func[1] & Func[0] ;
    wire Op_and = R_type & Func[5] & ~Func[4] & ~Func[3] & Func[2] & ~Func[1] & ~Func[0] ;
    wire Op_or  = R_type & Func[5] & ~Func[4] & ~Func[3] & Func[2] & ~Func[1] & Func[0] ;
    wire Op_jr = R_type & ~Func[5] & ~Func[4] & Func[3] & ~Func[2] & ~Func[1] & ~Func[0] ;
    
    wire Op_addi = ~Op[5] & ~Op[4] & Op[3] & ~Op[2] & ~Op[1] & ~Op[0] ;
    wire Op_andi = ~Op[5] & ~Op[4] & Op[3] & Op[2] & ~Op[1] & ~Op[0] ;
    wire Op_lui = ~Op[5] & ~Op[4] & Op[3] & Op[2] & Op[1] & Op[0] ;
    wire Op_ori = ~Op[5] & ~Op[4] & Op[3] & Op[2] & ~Op[1] & Op[0] ;
    wire Op_lw = Op[5] & ~Op[4] & ~Op[3] & ~Op[2] & Op[1] & Op[0] ;
    wire Op_sw = Op[5] & ~Op[4] & Op[3] & ~Op[2] & Op[1] & Op[0] ;
    wire Op_beq = ~Op[5] & ~Op[4] & ~Op[3] & Op[2] & ~Op[1] & ~Op[0] ;
    wire Op_bne = ~Op[5] & ~Op[4] & ~Op[3] & Op[2] & ~Op[1] & Op[0] ;
    wire Op_j = ~Op[5] & ~Op[4] & ~Op[3] & ~Op[2] & Op[1] & ~Op[0] ;
    wire Op_jal = ~Op[5] & ~Op[4] & ~Op[3] & ~Op[2] & Op[1] & Op[0] ;   
    
    assign Regrt = Op_addi | Op_andi | Op_lui | Op_ori | Op_lw | Op_sw | Op_beq | Op_beq | Op_bne | Op_bne | Op_j | Op_jal;
    assign Se = Op_addi | Op_lui | Op_lw | Op_sw | Op_beq | Op_beq | Op_bne | Op_bne;
    assign Wreg = Op_addu | Op_subu | Op_and | Op_or  | Op_addi | Op_andi | Op_lui | Op_ori | Op_lw | Op_jal ;
    assign Aluqb = Op_addu | Op_subu | Op_and | Op_or  | Op_beq | Op_beq | Op_bne | Op_bne | Op_j | Op_jr | Op_jal;
    assign Wmem = Op_sw;
    assign Reg2reg = Op_addu | Op_subu | Op_and | Op_or  | Op_addi | Op_andi | Op_lui | Op_ori | Op_sw | Op_beq | Op_beq | Op_bne | Op_bne | Op_j | Op_jr | Op_jal;
    assign Aluc[0] = Op_subu | Op_or  | Op_ori | Op_beq | Op_beq | Op_bne | Op_bne;
    assign Aluc[1] = Op_and | Op_or  | Op_andi | Op_ori;
    assign Aluc[2] = Op_lui;
    assign Pcsrc[0] = Op_j | Op_jr;
    assign Pcsrc[1] = Op_beq&Z | Op_bne&~Z | Op_j;
    assign Pcsrc[2] = Op_jr | Op_jal;
endmodule
