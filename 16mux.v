// 2-to-1 Multiplexer module
module mux2 (
    input [1:0] in,  // 2-bit input bus
    input sel,       // 1-bit select signal
    output out       // Output bit
);
    wire t1, t2, t3;

    // Inverter to invert the select signal
    not g1 (t1, sel);  
    
    // AND gates to select the appropriate input based on the select signal
    and g2 (t2, in[0], t1);  // Select in[0] when sel is 0
    and g3 (t3, in[1], sel);  // Select in[1] when sel is 1
    
    // OR gate to combine the outputs of the AND gates
    or g4 (out, t2, t3);  // Output is one of the inputs based on the select signal
endmodule

// 4-to-1 Multiplexer module using two 2-to-1 multiplexers
module mux4 (
    input [3:0] in,    // 4-bit input bus
    input [1:0] sel,   // 2-bit select signal
    output out         // Output bit
);
    wire [1:0] t;  // Intermediate wires to hold outputs of the 2 mux2 blocks

    // Instantiate two 2-to-1 multiplexers for the first 2 bits and last 2 bits of the input
    mux2 m0 (in[1:0], sel[0], t[0]);  // Select between in[0] and in[1] based on sel[0]
    mux2 m1 (in[3:2], sel[0], t[1]);  // Select between in[2] and in[3] based on sel[0]
    
    // Use another 2-to-1 multiplexer to select between t[0] and t[1] based on sel[1]
    mux2 m2 (t, sel[1], out);  // Final output based on sel[1]
endmodule

// 16-to-1 Multiplexer module using multiple 4-to-1 multiplexers
module mux16 (
    input  [15:0] in,   // 16-bit input bus
    input  [3:0]  sel,  // 4-bit select signal (to select 1 of 16 inputs)
    output        out   // Selected output bit
);

    wire [3:0] t;  // Intermediate wires for outputs of the 4 mux4 blocks

    // Instantiate four 4-to-1 multiplexers to handle each group of 4 inputs
    mux4 m0 (in[3:0],   sel[1:0], t[0]);   // Select between in[0] to in[3]
    mux4 m1 (in[7:4],   sel[1:0], t[1]);   // Select between in[4] to in[7]
    mux4 m2 (in[11:8],  sel[1:0], t[2]);   // Select between in[8] to in[11]
    mux4 m3 (in[15:12], sel[1:0], t[3]);   // Select between in[12] to in[15]

    // Use another 4-to-1 multiplexer to select between the outputs of the previous muxes
    mux4 m4 (t, sel[3:2], out);  // Final selection based on the higher 2 bits of sel

endmodule
