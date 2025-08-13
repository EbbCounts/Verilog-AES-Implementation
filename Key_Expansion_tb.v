`timescale 1ns / 1ps



module Key_Expansion_tb;

    // Inputs
    reg clk;
    reg [127:0] key;

    // Outputs
    wire [127:0] key_s0, key_s1, key_s2, key_s3, key_s4, key_s5, key_s6, key_s7, key_s8, key_s9, key_s10;

    // Instantiate the KeyExpansion module
    KeyExpansion uut (
        .clk(clk),
        .key(key),
        .key_s0(key_s0),
        .key_s1(key_s1),
        .key_s2(key_s2),
        .key_s3(key_s3),
        .key_s4(key_s4),
        .key_s5(key_s5),
        .key_s6(key_s6),
        .key_s7(key_s7),
        .key_s8(key_s8),
        .key_s9(key_s9),
        .key_s10(key_s10)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Generate a clock with a period of 10 time units
    end

    // Test stimulus
    initial begin
        // Monitor key expansion results
        $monitor("Time: %0t, Key S0: %h, Key S1: %h, Key S2: %h, Key S3: %h, Key S4: %h, Key S5: %h, Key S6: %h, Key S7: %h, Key S8: %h, Key S9: %h, Key S10: %h", 
                 $time, key_s0, key_s1, key_s2, key_s3, key_s4, key_s5, key_s6, key_s7, key_s8, key_s9, key_s10);

        // Test vector 1
        key = 128'h000102030405060708090a0b0c0d0e0f; // Example AES key
        #100; // Allow time for key expansion

        
        // End simulation
        $stop;
    end

endmodule
