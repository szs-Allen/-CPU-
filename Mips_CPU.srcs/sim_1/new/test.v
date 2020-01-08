`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/03 11:16:29
// Design Name: 
// Module Name: test
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


module test();
    reg CLK;
    reg Reset;
    mips test1(.clk(CLK),.reset(Reset));
    
    initial begin
        CLK = 0;
        Reset = 0;
        CLK = !CLK;
        
        forever #1
        begin
            Reset =1;
            CLK = !CLK;
        end
    end
endmodule
