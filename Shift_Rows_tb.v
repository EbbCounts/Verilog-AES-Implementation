`timescale 1ns / 1ps



module tb_ShiftRow;

    // Inputs
    reg clk;
    reg [127:0] data_in;

    // Outputs
    wire [127:0] data_out;

    // Instantiate the ShiftRow module
    ShiftRow uut (
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
        $monitor("Time: %0t, Data In: %h, Data Out: %h", 
                 $time, data_in, data_out);

        // Test case 1: Sequential bytes
        data_in = 128'ha761ca9b97be8b45d8ad1a611fc97369;
        #10; // Allow time for the shift to propagate

        // End simulation
        $stop;
    end

endmodule
