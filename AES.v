`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/21/2024 4:43:12 PM
// Design Name: 
// Module Name: AES
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


module AES(
  input CLK100MHZ,
  input newKey,
  input [127:0] data_in, key,
  //input wire Tx,
  //output wire Rx,
  output [127:0] data_out
  //output wire done
 
  ); 
  
  // UART receiver signals
      wire [255:0] o_Rx_Data;    // 256-bit data output from uart_rx_256bits
      wire uart_data_valid;      // UART data valid signal (high when data is ready)
  
//    wire data_in;
//    assign data_in = o_Rx_Data[255:128];
    
//    wire key;
//    assign key = o_Rx_Data[127:0];
  
  // Key Values for each round
  wire [127:0] key_s, key_s0, key_s1, key_s2, key_s3, key_s4, key_s5, key_s6, key_s7, key_s8, key_s9;

  // Data values for each round
  wire [127:0] r_data_out, r0_data_out, r1_data_out, r2_data_out, r3_data_out, r4_data_out;
  wire [127:0] r5_data_out, r6_data_out, r7_data_out, r8_data_out, r9_data_out;

  // xor operation is the firt round operation
  assign r_data_out = data_in ^ key_s;

  KeyExpansion k(CLK100MHZ, key, key_s, key_s0, key_s1, key_s2, key_s3, key_s4, key_s5, key_s6, key_s7, key_s8, key_s9);

  // Each round of AES involves substitution, shifting rows, mixing columns, and adding the round key
  Round r0(CLK100MHZ, r_data_out, key_s0, r0_data_out);
  Round r1(CLK100MHZ, r0_data_out, key_s1, r1_data_out);
  Round r2(CLK100MHZ, r1_data_out, key_s2, r2_data_out);
  Round r3(CLK100MHZ, r2_data_out, key_s3, r3_data_out);
  Round r4(CLK100MHZ, r3_data_out, key_s4, r4_data_out);
  Round r5(CLK100MHZ, r4_data_out, key_s5, r5_data_out);
  Round r6(CLK100MHZ, r5_data_out, key_s6, r6_data_out);
  Round r7(CLK100MHZ, r6_data_out, key_s7, r7_data_out);
  Round r8(CLK100MHZ, r7_data_out, key_s8, r8_data_out);

  Final_Round r9(CLK100MHZ, r8_data_out, key_s9, r9_data_out);
  //this round has no mixcolumns

  assign data_out = r9_data_out;
  //ciphertext

endmodule