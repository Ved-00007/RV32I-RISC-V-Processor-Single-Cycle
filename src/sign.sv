`timescale 1ns/1ps

module sign (
    input  logic [31:0] instruction,
    input  logic [2:0]  imm_source,
    output logic [31:0] immediate
);

    always_comb begin
        case (imm_source)

            // I-type: ADDI, loads, JALR
            3'b000: begin
                immediate = {{20{instruction[31]}},
                             instruction[31:20]};
            end

            // S-type: Store instructions
            3'b001: begin
                immediate = {{20{instruction[31]}},
                             instruction[31:25],
                             instruction[11:7]};
            end

            // B-type: Branch instructions
            3'b010: begin
                immediate = {{19{instruction[31]}},
                             instruction[31],
                             instruction[7],
                             instruction[30:25],
                             instruction[11:8],
                             1'b0};
            end

            // J-type: JAL
            3'b011: begin
                immediate = {{11{instruction[31]}},
                             instruction[31],
                             instruction[19:12],
                             instruction[20],
                             instruction[30:21],
                             1'b0};
            end

            // U-type: LUI, AUIPC
            3'b100: begin
                immediate = {instruction[31:12], 12'b0};
            end

            // Unsupported immediate format
            default: begin
                immediate = 32'b0;
            end

        endcase
    end

endmodule
