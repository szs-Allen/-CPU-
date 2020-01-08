`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/03 11:00:23
// Design Name: 
// Module Name: PC
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


module PC(Clk,Reset,Result,Address);
    input Clk;//ʱ���ź�
    input Reset;//�����ź�
    input [31:0] Result;
    output reg [31:0] Address;
    
    //��ʼ��Address��ϢΪ0
    initial begin
        Address<=32'h00003000;
    end
    //��Clk�����ػ���Reset���½��ؽ���
    always@(posedge Clk or negedge Reset)
    begin
        if(!Reset)//���Reset=0������AddressΪ0
        begin
            Address<=32'h00003000;
        end
        else
        begin//���Reset!=0����һ������ĵ�ַ����Address
            $display("%h",Result);
            Address<=Result;
        end
    end
endmodule
