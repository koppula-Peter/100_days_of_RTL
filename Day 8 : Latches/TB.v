
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.12.2024 11:55:27
// Design Name: 
// Module Name: tb_latches
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


`timescale 1ns / 1ps

module tb_latches;

    // Testbench inputs
    reg a, b;

    // Testbench outputs
    wire sr_q, sr_qn;
    wire jk_q, jk_qn;
    wire d_q, d_qn;

    // Instantiate the latches module
    latches uut (
        .a(a),
        .b(b),
        .sr_q(sr_q),
        .sr_qn(sr_qn),
        .jk_q(jk_q),
        .jk_qn(jk_qn),
        .d_q(d_q),
        .d_qn(d_qn)
    );

    // Testbench variables
    initial begin
        // Initialize inputs
        a = 0; b = 0;
        #10;

        // Test SR latch behavior
        $display("Testing SR Latch");
        a = 1; b = 0; #10;
        $display("SR Set: sr_q = %b, sr_qn = %b", sr_q, sr_qn);

        a = 0; b = 1; #10;
        $display("SR Reset: sr_q = %b, sr_qn = %b", sr_q, sr_qn);

        a = 0; b = 0; #10;
        $display("SR Hold: sr_q = %b, sr_qn = %b", sr_q, sr_qn);

        a = 1; b = 1; #10;
        $display("SR Invalid: sr_q = %b, sr_qn = %b", sr_q, sr_qn);

        // Test JK latch behavior
        $display("\nTesting JK Latch");
        a = 1; b = 0; #10;
        $display("JK Set: jk_q = %b, jk_qn = %b", jk_q, jk_qn);

        a = 0; b = 1; #10;
        $display("JK Reset: jk_q = %b, jk_qn = %b", jk_q, jk_qn);

        a = 0; b = 0; #10;
        $display("JK Hold: jk_q = %b, jk_qn = %b", jk_q, jk_qn);

        a = 1; b = 1; #10;
        $display("JK Toggle: jk_q = %b, jk_qn = %b", jk_q, jk_qn);

        // Test D latch behavior
        $display("\nTesting D Latch");
        a = 1; #10;
        $display("D Set: d_q = %b, d_qn = %b", d_q, d_qn);

        a = 0; #10;
        $display("D Reset: d_q = %b, d_qn = %b", d_q, d_qn);

        $finish;
    end

endmodule

