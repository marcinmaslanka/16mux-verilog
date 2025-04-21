module mux16 (
    input  [15:0] in,   // 16-bit input bus
    input  [3:0]  sel,  // 4-bit select signal (to select 1 of 16 inputs)
    output        out   // Selected output bit
);

    // Select one of the 16 input bits based on sel
    assign out = in[sel];

endmodule
