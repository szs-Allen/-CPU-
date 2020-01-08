`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/03 10:28:02
// Design Name: 
// Module Name: mips
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


module mips(clk,reset);
    input clk;//时钟信号
    input reset;//复位信号
    
    wire [31:0] Result;
    wire [31:0] Address;
    
    wire [31:0] Inst,NextAddress,ALU_R,Qb,Qa;
    wire [31:0] PC_add4;
    wire [31:0] EXTIMM;
    wire [31:0] EXTIMML2;
    wire [31:0] InstL2;
    wire [31:0] D,Y,Dout,R;
    wire [31:0] mux4x32_2;
    wire Z,Regrt,Se,Wreg,Aluqb,Reg2reg,Cout,Wmem;
    wire [2:0] Pcsrc;
    wire [2:0] Aluc;
    wire [4:0] Wr;
    //取指令、读寄存器、计算、访问内存、写会寄存器
    PC pc(clk,reset,Result,Address);
    PCadd4 pcadd4(Address,PC_add4);
    im_4k instmem(Address,Inst);
    
    CONUNIT conunit(Inst[31:26],Inst[5:0],Z,Regrt,Se,Wreg,Aluqb,Aluc,Wmem,Pcsrc,Reg2reg);
    Mux2x5 mux2x5(Inst[15:11],Inst[20:16],Regrt,Wr);
    
    shifter_combination shifter1(Inst[25:0],PC_add4,InstL2);
    
    RegisterFile regfile(Inst[25:21],Inst[20:16],D,Wr,Wreg,clk,reset,Qa,Qb,Pcsrc,PC_add4);
    
    ALU alu(Qa,Y,Aluc,R,Z);
    
    dm_4k datamem(R,Qb,Wmem,clk,Dout);
    Mux2x32 mux2x322(Dout,R,Reg2reg,D);
    SignExtend ext16t32(Inst[15:0],Se,EXTIMM);
    
    Mux2x32 mux2x321(EXTIMM,Qb,Aluqb,Y);
    shifter32_L2 shifter2(EXTIMM,EXTIMML2);
    CLA_32 cla_32(PC_add4,EXTIMML2,0,mux4x32_2,Cout);
    
    Mux5x32 mux5x32(PC_add4,0,mux4x32_2,InstL2,Qa,Pcsrc,Result);
    
    assign NextAddress = Result;
    assign ALU_R = R;
endmodule














