`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Testbench for Latches Module
//////////////////////////////////////////////////////////////////////////////////

module latches_tb;

    // Inputs
    reg a;
    reg b;
    reg preset,clr;

    // Outputs
    wire sr_q_nor, sr_qn_nor, sr_q_nand, sr_qn_nand;
    wire jk_q_nor, jk_qn_nor, jk_q_nand, jk_qn_nand;
    wire d_q_nor, d_qn_nor, d_q_nand, d_qn_nand;

    // Instantiate the Unit Under Test (UUT)
    latches uut (
        .a(a), 
        .b(b), 
        .sr_q_nor(sr_q_nor), 
        .sr_qn_nor(sr_qn_nor), 
        .sr_q_nand(sr_q_nand), 
        .sr_qn_nand(sr_qn_nand), 
        .jk_q_nor(jk_q_nor), 
        .jk_qn_nor(jk_qn_nor), 
        .jk_q_nand(jk_q_nand), 
        .jk_qn_nand(jk_qn_nand), 
        .d_q_nor(d_q_nor), 
        .d_qn_nor(d_qn_nor), 
        .d_q_nand(d_q_nand), 
        .d_qn_nand(d_qn_nand),
        .preset(preset),
        .clr(clr)
    );

    initial begin
        // Initialize Inputs
        $display("Starting Simulation");
         preset=0; clr=1;
        #10;
         preset=0; clr=0;
         
        #1;  a = 0; b = 0;
        #1;  a = 0; b = 1;
        #1;  a = 1; b = 0;
        #1;  a = 1; b = 1;
        #1;
        //$display("[SR NOR] a=%b b=%b => Q=%b Qn=%b", a, b, sr_q_nor, sr_qn_nor);
        $monitor("[jk NOR] j=%b k=%b => Q=%b Qn=%b", a, b, jk_q_nor, jk_qn_nor);
//        $display("[SR NAND] a=%b b=%b => Q=%b Qn=%b", a, b, sr_q_nand, sr_qn_nand);

//        a = 0; b = 1;
//        #10;
//        $display("[SR NOR] a=%b b=%b => Q=%b Qn=%b", a, b, sr_q_nor, sr_qn_nor);
//        $display("[SR NAND] a=%b b=%b => Q=%b Qn=%b", a, b, sr_q_nand, sr_qn_nand);

//        a = 1; b = 0;
//        #10;
//        $display("[SR NOR] a=%b b=%b => Q=%b Qn=%b", a, b, sr_q_nor, sr_qn_nor);
//        $display("[SR NAND] a=%b b=%b => Q=%b Qn=%b", a, b, sr_q_nand, sr_qn_nand);

//        a = 1; b = 1;
//        #10;
//        $display("[SR NOR] a=%b b=%b => Q=%b Qn=%b", a, b, sr_q_nor, sr_qn_nor);
//        $display("[SR NAND] a=%b b=%b => Q=%b Qn=%b", a, b, sr_q_nand, sr_qn_nand);

//        // Test JK Latch
//        a = 0; b = 0;
//        #10;
//        $display("[JK NOR] a=%b b=%b => Q=%b Qn=%b", a, b, jk_q_nor, jk_qn_nor);
//        $display("[JK NAND] a=%b b=%b => Q=%b Qn=%b", a, b, jk_q_nand, jk_qn_nand);

//        a = 0; b = 1;
//        #10;
//        $display("[JK NOR] a=%b b=%b => Q=%b Qn=%b", a, b, jk_q_nor, jk_qn_nor);
//        $display("[JK NAND] a=%b b=%b => Q=%b Qn=%b", a, b, jk_q_nand, jk_qn_nand);

//        a = 1; b = 0;
//        #10;
//        $display("[JK NOR] a=%b b=%b => Q=%b Qn=%b", a, b, jk_q_nor, jk_qn_nor);
//        $display("[JK NAND] a=%b b=%b => Q=%b Qn=%b", a, b, jk_q_nand, jk_qn_nand);

//        a = 1; b = 1;
//        #10;
//        $display("[JK NOR] a=%b b=%b => Q=%b Qn=%b", a, b, jk_q_nor, jk_qn_nor);
//        $display("[JK NAND] a=%b b=%b => Q=%b Qn=%b", a, b, jk_q_nand, jk_qn_nand);

//        // Test D Latch
//        a = 0; b = 0;
//        #10;
//        $display("[D NOR] a=%b b=%b => Q=%b Qn=%b", a, b, d_q_nor, d_qn_nor);
//        $display("[D NAND] a=%b b=%b => Q=%b Qn=%b", a, b, d_q_nand, d_qn_nand);

//        a = 1; b = 0;
//        #10;
//        $display("[D NOR] a=%b b=%b => Q=%b Qn=%b", a, b, d_q_nor, d_qn_nor);
//        $display("[D NAND] a=%b b=%b => Q=%b Qn=%b", a, b, d_q_nand, d_qn_nand);

        // End simulation
        $finish;
    end

endmodule
