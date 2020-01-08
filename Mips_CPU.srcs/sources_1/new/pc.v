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
    input Clk;//时钟信号
    input Reset;//重置信号
    input [31:0] Result;
    output reg [31:0] Address;
    
    //初始化Address信息为0
    initial begin
        Address<=32'h00003000;
    end
    //在Clk上升沿或者Reset的下降沿进入
    always@(posedge Clk or negedge Reset)
    begin
        if(!Reset)//如果Reset=0则重置Address为0
        begin
            Address<=32'h00003000;
        end
        else
        begin//如果Reset!=0则将下一条命令的地址存入Address
            $display("%h",Result);
            Address<=Result;
        end
    end
endmodule
