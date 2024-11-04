`timescale 1ns / 1ps

module tb_carry_skip_adder();
reg rst_tb;
reg [15:0]a_tb,b_tb;
reg cin_tb;
wire [15:0]sum_tb;
wire cout_tb;

top_carry_skip_adder #(.N(16)) dut(.rst(rst_tb),.a(a_tb),.b(b_tb),.cin(cin_tb),.sum(sum_tb),.cout_top(cout_tb));
//carry_skip_adder dut(.rst(rst_tb),.a(a_tb),.b(b_tb),.cin(cin_tb),.sum(sum_tb),.cout(cout_tb));
initial 
    begin
        rst_tb=1;
        {a_tb,b_tb,cin_tb}=0;
       #5;
        rst_tb=0;
       #100;
       $finish;
        
    end
always 
    begin
    #5; a_tb=a_tb+1;
        b_tb=b_tb+1;
    end
    
endmodule



