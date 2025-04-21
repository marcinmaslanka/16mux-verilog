# 16-to-1 Multiplexer in Verilog

This project implements and tests a 16-to-1 multiplexer (`mux16`) in Verilog. A 16:1 multiplexer selects one of 16 input bits based on a 4-bit select signal and outputs the selected bit.

## 📁 Files

- `mux16.v`: Verilog module for the 16-to-1 multiplexer.
- `mux16_tb.v`: Testbench to simulate and verify the functionality of the multiplexer.
- `16mux_tb.vcd`: Output waveform file for visual inspection with a waveform viewer (e.g., GTKWave).

## 🔧 Module Description

### `mux16.v`

```verilog
module mux16 (in, sel, out);
    input [15:0] in;    // 16 input lines
    input [3:0] sel;    // 4-bit select signal
    output out;         // Output of selected input

    assign out = in[sel];  // Output assigned based on selected input
endmodule
```

![Screenshot From 2025-04-21 17-00-16](https://github.com/user-attachments/assets/49638a4e-5bcb-4f19-856e-e8892f59d154)


## 🧪 Testbench Overview
mux16_tb.v
The testbench:

Initializes inputs and applies various test vectors to mux16.

Monitors the output using $monitor.

Generates a waveform file 16mux_tb.vcd for use in GTKWave.

Example Output:


/home/marcin/Pictures/Screenshots/Screenshot From 2025-04-21 17-01-53.png

## ▶️ Simulation Instructions
Using Icarus Verilog (iverilog + GTKWave)
Compile the design and testbench:

```bash
iverilog -o mux16_tb.vvp mux16.v mux16_tb.v
Run the simulation:
```

```bash
vvp mux16_tb.vvp
```

View waveform (optional):

```bash
gtkwave 16mux_tb.vcd
```

![Uploading Screenshot From 2025-04-21 17-03-43.png…]()


## 🧠 Concepts Demonstrated
Behavioral modeling in Verilog

Multiplexer logic using vector indexing

Writing and simulating a basic testbench

VCD file generation for waveform analysis

---

