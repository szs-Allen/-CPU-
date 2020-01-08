`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/03 23:02:17
// Design Name: 
// Module Name: dm_4k
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


module dm_4k(addr,din,we,clk,dout);
    input [31:0] addr;
    input [31:0] din;
    input we;
    input clk;
    output [31:0] dout;
    reg [31:0] dm [0:1023];
    
    assign dout = dm[addr[11:2]];
    
    always@(posedge clk)
    begin
        if(we)
           dm[addr[11:2]]<=din;
    end
    
    integer i;
    initial begin 
        for (i=0; i<1023; i=i+1)
            dm[i] = 0;
    end
endmodule
