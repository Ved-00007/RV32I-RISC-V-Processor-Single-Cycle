`timescale 1ns/1ps

module alu_tb;

    logic [3:0]  alu_control;
    logic [31:0] src1;
    logic [31:0] src2;

    logic [31:0] alu_result;
    logic        zero;
    logic        last_bit;

    import optimus_prime::*;

    alu dut (
        .alu_control(alu_control),
        .src1(src1),
        .src2(src2),
        .alu_result(alu_result),
        .zero(zero),
        .last_bit(last_bit)
    );

    initial begin

        // ADD
        alu_control = ALU_ADD;
        src1 = 32'd10;
        src2 = 32'd5;
        #10;

        // SUB
        alu_control = ALU_SUB;
        src1 = 32'd10;
        src2 = 32'd5;
        #10;

        // AND
        alu_control = ALU_AND;
        src1 = 32'h0000000F;
        src2 = 32'h00000003;
        #10;

        // OR
        alu_control = ALU_OR;
        src1 = 32'h0000000F;
        src2 = 32'h00000003;
        #10;

        // SLL
        alu_control = ALU_SLL;
        src1 = 32'd1;
        src2 = 32'd3;
        #10;

        // SLT
        alu_control = ALU_SLT;
        src1 = 32'd5;
        src2 = 32'd10;
        #10;

        // SRL
        alu_control = ALU_SRL;
        src1 = 32'd16;
        src2 = 32'd2;
        #10;

        // SLTU
        alu_control = ALU_SLTU;
        src1 = 32'd5;
        src2 = 32'd10;
        #10;

        // XOR
        alu_control = ALU_XOR;
        src1 = 32'h0000000F;
        src2 = 32'h00000003;
        #10;

        // SRA
        alu_control = ALU_SRA;
        src1 = 32'h80000000;
        src2 = 32'd2;
        #10;

        $finish;

    end

endmodule
