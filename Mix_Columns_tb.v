`timescale 1ns / 1ps



module MixColumns_tb;

    // Inputs
    reg clk;
    reg [127:0] data_in;

    // Outputs
    wire [127:0] data_out;

    // Instantiate the MixColumns module
    MixColumns uut (
        .clk(clk),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Generate a clock with a period of 10 time units
    end

    // Test stimulus
    initial begin
        // Monitor data_in and data_out
        $monitor("Time: %0t, Data In: %h, Data Out: %h", $time, data_in, data_out);

        // Test vector 1
        data_in = 128'ha7be1a6997ad739bd8c9ca451f618b61; // Example input
        #10; // Wait for one clock cycle

        // Finish simulation
        $stop;
    end

endmodule

