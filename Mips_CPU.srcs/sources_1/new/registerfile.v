`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/04 00:03:53
// Design Name: 
// Module Name: registerfile
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


module RegisterFile(ReadReg1, ReadReg2, WriteData, WriteReg, RegWrite, CLK, Reset, ReadData1, ReadData2, Pcsrc, PcAdd4);
    input [4:0] ReadReg1;//rs
    input [4:0] ReadReg2;//rt����������
    input [31:0] WriteData;//д�������
    input [4:0] WriteReg;//д���ַ
    input RegWrite;//д�ź�
    input CLK;
    input Reset;
    output reg[31:0] ReadData1;
    output reg[31:0] ReadData2;
    input [2:0] Pcsrc;
    input [31:0] PcAdd4;
    
    initial begin
        ReadData1<=0;
        ReadData2<=0;
    end
    
    reg [31:0] regFile[0:31];
    integer i;
    
    initial begin
        for (i=0; i<32; i=i+1)
            regFile[i]<=0;
    end
    
    always@(ReadReg1 or ReadReg2)
    begin
        ReadData1 = regFile[ReadReg1];
        ReadData2 = regFile[ReadReg2];
    end
    
    always@(negedge CLK)
    begin
        if(RegWrite && WriteReg)
        begin
            regFile[WriteReg] = WriteData; 
        end
    end
    
    always@(negedge CLK)
    begin
        if(Pcsrc == 3'b100 && RegWrite)
        begin
            regFile[31]=PcAdd4;
        end
    end
endmodule























