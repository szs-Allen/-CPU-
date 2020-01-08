`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/12/03 11:31:21
// Design Name: 
// Module Name: im_4k
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


module im_4k(addr, dout);
    input [31:0] addr;
    output [31:0] dout;
    
    reg [31:0] im [0:1023];
    initial begin 
        $readmemh("C:\\Users\\-dell\\Desktop\\code.txt",im);
    end
    
    integer i;
    initial begin 
        $display("start read the mem");
        for (i=0; i<20;i=i+1)
            $display("%h %h", i, im[i]);
    end
    assign dout = im[addr[11:2]];
endmodule
