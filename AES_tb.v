`timescale 1ns / 1ps



module AES_tb;

    // Inputs
    reg CLK100MHZ;
    reg newKey;
    reg [127:0] data_in;
    reg [127:0] key;

    // Output
    wire [127:0] data_out;

    // Instantiate the AES_main module
    AES_main uut (
        .CLK100MHZ(CLK100MHZ),
        .newKey(newKey),
        .data_in(data_in),
        .key(key),
        .data_out(data_out)
    );

    // Clock generation
    initial begin
        CLK100MHZ = 0;
        forever #5 CLK100MHZ = ~CLK100MHZ; // Generate a 100MHz clock (10ns period)
    end

    // Test stimulus
    initial begin
        // Initial values
        //data_in = 128'h00112233445566778899aabbccddeeff; // Example plaintext
        data_in = 128'h00112233445566778899aabbccddeeff; // Example plaintext
        //key = 128'h000102030405060708090a0b0c0d0e0f;     // Example key
        key = 128'hd6aa74fdd2af72fadaa678f1d6ab76fe;     // Example key
        newKey = 1'b0; // Hold newKey low to allow key expansion to complete

        // Run for a while and observe the result
        #100;
        
        // Stop simulation after the test
        $stop;
    end

endmodule


