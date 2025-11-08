# MIPS-Pipelined-Microprocessor

This project implements a 5-stage pipelined processor based on a subset of the MIPS ISA, designed to demonstrate instruction-level parallelism and effective hazard resolution techniques using Verilog HDL.

⚙️ Key Features

Pipeline Stages: IF, ID, EXE, MEM, WB

Implemented Instructions (8): Add, Sub, And, Or, Beq, Lw, Sw, Slt

Forwarding Unit:

Handles data hazards between EXE/MEM ↔ ID/EXE and MEM/WB ↔ ID/EXE for both Rt and Rs registers.

Hazard Detection Unit:

Detects load-use hazards and inserts a stall when a dependent instruction follows a load.

Branch (BEQ) Handling:

Branch condition evaluated in the ID stage, reducing control stalls to one cycle.

Data Memory: 4096 bits | Instruction Memory: 1024 bits | Register File: 32 registers

🧩 Tools & Technologies

Language: Verilog HDL

Simulation Tool: Xilinx ISE

Design Methodology: Modular datapath components (Control Unit, ALU, Register File, Forwarding & Hazard Units)

🧪 Testing & Verification

Simulated and verified full pipeline operation on Xilinx ISE.

Ensured correct execution flow, data forwarding, and accurate branch resolution under all supported instructions.
