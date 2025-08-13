`timescale 1ns / 1ps


module sbox(data,dout);
	 input [7:0] data;
	 output reg [7:0] dout;
	 
    // memory to hold S-box values
     reg [7:0] Sbox [0:255];
 
     initial begin
         $readmemh("sbox.mem", Sbox);  // Load the memory from the .mem file
     end
 
     always @(data) begin
         dout = Sbox[data];
     end
endmodule
