## 16-to-1 Multiplexer in Verilog
This project implements a hierarchical 16-to-1 multiplexer (mux16) using smaller multiplexer building blocks in Verilog: mux2 and mux4. 
The mux16 module selects one of 16 input bits based on a 4-bit select signal and outputs the selected bit.

## 📁 Files
mux16.v: Verilog source code with modules mux2, mux4, and mux16.

mux16_tb.v: Testbench to simulate and verify the functionality of the 16-to-1 multiplexer.

16mux_tb.vcd: Output waveform file for visual inspection (e.g., in GTKWave).

## 🔧 Module Structure
🔸 mux2
A basic 2-to-1 multiplexer implemented using logic gates.

🔸 mux4
A 4-to-1 multiplexer built hierarchically using three mux2 instances.

🔸 mux16
The main 16-to-1 multiplexer, implemented using four mux4 modules and one final mux4 to select from their outputs.


##🧪 Testbench Overview – mux16_tb.v
The testbench:

Instantiates the mux16 module

Drives test inputs to verify output for different select values

Uses $monitor to display the changes in real time

Generates a waveform dump file (16mux_tb.vcd)

Example Output Screenshot:
![Screenshot From 2025-04-21 17-01-53](https://github.com/user-attachments/assets/83c7daee-d558-416b-87ec-bd6595548e1a)


## ▶️ Simulation Instructions
Using Icarus Verilog + GTKWave
1. Compile:

```bash
iverilog -o mux16_tb.vvp mux16.v mux16_tb.v
2. Run Simulation:
```

```bash
vvp mux16_tb.vvp
```

3. View Waveform:

```bash
gtkwave 16mux_tb.vcd
```

![Screenshot From 2025-04-21 17-03-43](https://github.com/user-attachments/assets/41946240-67d6-4efc-b115-442bfe7565bb)


## 🧠 Concepts Demonstrated
Hierarchical digital design using Verilog

Logic gate-level modeling (mux2)

Reusability through parameterized structures

Simulation and verification using testbenches

VCD file generation and waveform analysis with GTKWave

---

