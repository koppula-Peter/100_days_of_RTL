
`timescale 10ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.12.2024 01:46:07
// Design Name: 
// Module Name: tb_clock_gen
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

`timescale 1ns/1ps

module tb_clk_generator;

    reg enable;
    wire clk_out_ref;
    wire clk_out_phase;

    // Instantiate the DUT with a more manageable frequency
    // For example: frequency = 1e9 Hz => period = 1 ns
    // duty_cycle = 50% => t_on = 0.5 ns, t_off = 0.5 ns
    clk_generator #(
        .frequency(1e9), 
        .duty_cycle(50),
        .phase(40)
    ) dut (
        .en(enable),
        .clk_out_ref(clk_out_ref),
        .clk_out_phase(clk_out_phase)
    );

    initial begin
        $dumpfile("tb_clk_generator.vcd");
        $dumpvars(0, tb_clk_generator);
    end

    initial begin
        // Initially, enable = 0 (no clock output)
        enable = 0;
        #10;  // Wait 10 ns

        // Enable clock generation
        enable = 1;
        #100000; // Run for 100 ns with enable = 1

        // Disable clock generation
        enable = 0;
        #20;  // Wait some time to observe outputs after disable
        $finish;
    end

    // Optional: Monitor signals for debugging
    initial begin
        $monitor("Time=%t ns, enable=%b, clk_out_ref=%b, clk_out_phase=%b",
                 $time, enable, clk_out_ref, clk_out_phase);
    end

endmodule
