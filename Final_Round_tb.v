`timescale 1ns / 1ps



module Final_Round_tb;

    // Inputs
    reg clk;
    reg [127:0] data_in;
    reg [127:0] key_in;

    // Output
    wire [127:0] data_out_last;

    // Instantiate the Final_Round module
    Final_Round uut (
        .clk(clk),
        .data_in(data_in),
        .key_in(key_in),
        .data_out_last(data_out_last)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Generate a 100 MHz clock (10 ns period)
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        data_in = 128'hbd6e7c3df2b5779e0b61216e8b10b689; // Example plaintext
        key_in = 128'h13111d7fe3944a17f307a78b4d2b30c5; // Example key

        // Display the output for debugging
        $monitor("At time %t, data_in = %h, key_in = %h, data_out_last = %h", $time, data_in, key_in, data_out_last);

        
        // Wait for some time to observe the result
        #50;

        // Finish simulation
        $finish;
    end

    // Optional: Waveform dump for debugging
    initial begin
        $dumpfile("Final_Round_tb.vcd");
        $dumpvars(0, Final_Round_tb);
    end

endmodule

