`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Testbench for Flip_Flops
//////////////////////////////////////////////////////////////////////////////////

module tb_sr_ff;
    reg clk, rst, s, r;
    wire sr_q;

    sr_ff uut(
        .clk(clk),
        .rst(rst),
        .s(s),
        .r(r),
        .sr_q(sr_q)
    );

    initial begin
        // Clock Generation
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        // Test Cases
        $display("Starting SR Flip-Flop Testbench");

        // Reset Behavior
        rst = 1; s = 0; r = 0;
        #10 rst = 0;  // Release reset

        // Test case: Set condition
        #10 s = 1; r = 0;
        #10 s = 0;

        // Test case: Reset condition
        #10 s = 0; r = 1;
        #10 r = 0;

        // Test case: No change condition
        #10 s = 0; r = 0;

        // Test case: Invalid condition
        #10 s = 1; r = 1;

        // Terminate
        #10 $stop;
    end
endmodule

module tb_jk_ff;
    reg clk, rst, j, k;
    wire jk_q;

    jk_ff uut(
        .clk(clk),
        .rst(rst),
        .j(j),
        .k(k),
        .jk_q(jk_q)
    );

    initial begin
        // Clock Generation
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        // Test Cases
        $display("Starting JK Flip-Flop Testbench");

        // Reset Behavior
        rst = 1; j = 0; k = 0;
        #10 rst = 0;  // Release reset

        // Test case: No change
        #10 j = 0; k = 0;

        // Test case: Reset
        #10 j = 0; k = 1;

        // Test case: Set
        #10 j = 1; k = 0;

        // Test case: Toggle
        #10 j = 1; k = 1;

        // Terminate
        #10 $stop;
    end
endmodule

module tb_dff;
    reg clk, rst, d;
    wire d_q;

    dff uut(
        .clk(clk),
        .rst(rst),
        .d(d),
        .d_q(d_q)
    );

    initial begin
        // Clock Generation
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        // Test Cases
        $display("Starting D Flip-Flop Testbench");

        // Reset Behavior
        rst = 1; d = 0;
        #10 rst = 0;  // Release reset

        // Test case: Hold value
        #10 d = 0;
        #10 d = 1;

        // Test case: Change value
        #10 d = 0;

        // Test case: Edge toggle
        #10 d = 1;
        #10 d = 0;

        // Terminate
        #10 $stop;
    end
endmodule

module tb_t_ff;
    reg clk, rst, t;
    wire t_q;

    t_ff uut(
        .clk(clk),
        .rst(rst),
        .t(t),
        .t_q(t_q)
    );

    initial begin
        // Clock Generation
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        // Test Cases
        $display("Starting T Flip-Flop Testbench");

        // Reset Behavior
        rst = 1; t = 0;
        #10 rst = 0;  // Release reset

        // Test case: Hold value
        #10 t = 0;

        // Test case: Toggle on high T
        #10 t = 1;
        #10 t = 0;
        #10 t = 1;

        // Test case: Continuous toggling
        #10 t = 1;
        #10 t = 1;

        // Terminate
        #10 $stop;
    end
endmodule


