`timescale 1ns/1ps

module regfile_tb;

    logic        clk;
    logic        rst_n;

    logic [4:0]  address1;
    logic [4:0]  address2;
    logic [31:0] read_data1;
    logic [31:0] read_data2;

    logic        write_enable;
    logic [31:0] write_data;
    logic [4:0]  address3;


    // Register file
    regfile dut (
        .clk(clk),
        .rst_n(rst_n),

        .address1(address1),
        .address2(address2),
        .read_data1(read_data1),
        .read_data2(read_data2),

        .write_enable(write_enable),
        .write_data(write_data),
        .address3(address3)
    );


    // Clock
    initial begin

        clk = 1'b0;

        forever #5 clk = ~clk;

    end


    // Test
    initial begin

        // Initial values
        rst_n = 1'b0;

        address1 = 5'd0;
        address2 = 5'd0;

        write_enable = 1'b0;
        write_data = 32'd0;
        address3 = 5'd0;


        // -------------------------
        // RESET
        // -------------------------

        #10;

        rst_n = 1'b1;


        // -------------------------
        // WRITE x1 = 100
        // -------------------------

        write_enable = 1'b1;
        address3 = 5'd1;
        write_data = 32'd100;

        #10;


        // -------------------------
        // WRITE x2 = 200
        // -------------------------

        address3 = 5'd2;
        write_data = 32'd200;

        #10;


        // -------------------------
        // READ x1 and x2
        // -------------------------

        write_enable = 1'b0;

        address1 = 5'd1;
        address2 = 5'd2;

        #10;


        // -------------------------
        // TRY TO WRITE x0 = 999
        // -------------------------

        write_enable = 1'b1;
        address3 = 5'd0;
        write_data = 32'd999;

        #10;


        // -------------------------
        // READ x0 and x1
        // -------------------------

        write_enable = 1'b0;

        address1 = 5'd0;
        address2 = 5'd1;

        #10;


        $finish;

    end

endmodule
