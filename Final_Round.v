`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/22/2024 02:41:32 PM
// Design Name: 
// Module Name: Final_Round
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


module Final_Round (clk,data_in,key_in,data_out_last);
    input clk;
    input [127:0]data_in;
    input [127:0]key_in;
    output [127:0] data_out_last;
    
    wire [127:0] sub_data_out,shift_data_out;
    
    SubBytes s1(clk,data_in,sub_data_out);
    ShiftRow s2(clk,sub_data_out,shift_data_out);
    assign data_out_last=shift_data_out^key_in;

endmodule
