`timescale 1ns/1ps

module sign_tb;

    logic [31:0] instruction;
    logic [2:0]  imm_source;
    logic [31:0] immediate;

    // Instantiate the sign extender
    sign dut (
        .instruction(instruction),
        .imm_source(imm_source),
        .immediate(immediate)
    );

    initial begin

        // Test 1: I-type, ADDI x1, x2, -5
        instruction = 32'hFFB10093;
        imm_source  = 3'b000;
        #10;
        $display("I-type: immediate = %h, expected = FFFFFFFB",
                 immediate);

        // Test 2: S-type, SW x5, -8(x2)
        instruction = 32'hFE512C23;
        imm_source  = 3'b001;
        #10;
        $display("S-type: immediate = %h, expected = FFFFFFF8",
                 immediate);

        // Test 3: B-type, BEQ x0, x0, +8
        instruction = 32'h00000463;
        imm_source  = 3'b010;
        #10;
        $display("B-type: immediate = %h, expected = 00000008",
                 immediate);

        // Test 4: J-type, JAL x1, +8
        instruction = 32'h008000EF;
        imm_source  = 3'b011;
        #10;
        $display("J-type: immediate = %h, expected = 00000008",
                 immediate);

        // Test 5: U-type, LUI x1, 0x12345000
        instruction = 32'h123450B7;
        imm_source  = 3'b100;
        #10;
        $display("U-type: immediate = %h, expected = 12345000",
                 immediate);

        // Test 6: Unsupported format
        instruction = 32'hFFFFFFFF;
        imm_source  = 3'b101;
        #10;
        $display("Default: immediate = %h, expected = 00000000",
                 immediate);

        $finish;
    end

endmodule
