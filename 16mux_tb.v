`timescale 1ns/1ps

module mux16_tb;

    // Testbench signals
    reg [15:0] a;    // Input bus to the mux
    reg [3:0]  s;    // Select lines
    wire       f;    // Output of the mux

    // Instantiate the DUT (Device Under Test)
    mux16 m (
        .in(a),
        .sel(s),
        .out(f)
    );

    // Test stimulus
    initial begin
        // Setup for waveform dump
        $dumpfile("16mux_tb.vcd");  // VCD file for GTKWave
        $dumpvars(0, mux16_tb);     // Dump all TB variables

        // Monitor values during simulation
        $monitor($time, " a=%h, s=%h, f=%b", a, s, f);

        // Apply test vectors
        #5  a = 16'h3F0A; s = 4'h0;  // Select bit 0
        #5             s = 4'h1;     // Select bit 1
        #5             s = 4'h6;     // Select bit 6
        #5             s = 4'hC;     // Select bit 12

        #5  $finish; // End simulation
    end

endmodule
