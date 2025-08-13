`timescale 1ns / 1ps



module tb_SubBytes;

    // Inputs
    reg clk;
    reg [127:0] data;

    // Outputs
    wire [127:0] s_data_out;

    // Instantiate the SubBytes module
    SubBytes uut (
        .clk(clk),
        .data(data),
        .s_data_out(s_data_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Generate a clock with a period of 10 time units
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        data = 128'h89d810e8855ace682d1843d8cb128fe4; // Initial data
        #10;

        // Add more vectors if needed
        #50;

        // Finish simulation
        $stop;
    end

    // Monitor output
    initial begin
        $monitor("Time: %0d, Data In: %h, S-Data Out: %h", $time, data, s_data_out);
    end

endmodule
