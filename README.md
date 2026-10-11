# RV32I RISC-V Processor

A 32-bit RISC-V processor project developed using **SystemVerilog and Xilinx Vivado**. The goal is to build a single-cycle processor incrementally by implementing and testing individual modules.

## Modules

## Modules

## Modules

ALU (alu.sv) – Performs arithmetic and logical operations.
Register File (regfile.sv) – Stores and provides access to processor registers.
Sign Extension (signext.sv) – Extends immediate values to 32 bits.
Instruction Reader (reader.sv) – Reads instructions for execution.
Control Unit (control.sv) – Generates control signals based on instructions.
Load/Store Decoder (load_store_decoder.sv) – Decodes load and store operations.
Memory (memory.sv) – Handles instruction and data memory operations.
CPU (cpu.sv) – Integrates the modules into a single-cycle processor.

## Tools Used

- SystemVerilog
- Xilinx Vivado

## Project Status

Under development. The ALU, register file, and sign extension modules have been implemented. The remaining modules will be developed and tested before integration into the complete processor.
