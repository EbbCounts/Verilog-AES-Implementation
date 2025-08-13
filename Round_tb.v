`timescale 1ns / 1ps



module Round_tb;

    // Inputs
    reg clk;
    reg [127:0] data_in;
    reg [127:0] key_in;

    // Outputs
    wire [127:0] data_out;

    // Instantiate the round module
    Round uut (
        .clk(clk),
        .data_in(data_in),
        .key_in(key_in),
        .data_out(data_out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Generate a 100 MHz clock (10 ns period)
    end

    // Test stimulus
    initial begin
        // Initialize inputs
        //round 2 sim
        data_in = 128'h89d810e8855ace682d1843d8cb128fe4; // Example plaintext
        key_in = 128'hb692cf0b643dbdf1be9bc5006830b3fe; // Example key

        // Display the output for debugging
        $monitor("At time %t, data_in = %h, key_in = %h, data_out = %h", $time, data_in, key_in, data_out);

        // Wait for some time to observe the result
        #50;

        // Finish simulation
        $finish;
    end

    // Optional: Waveform dump for debugging
    initial begin
        $dumpfile("round_testbench.vcd");
        $dumpvars(0, Round_tb);
    end

endmodule

