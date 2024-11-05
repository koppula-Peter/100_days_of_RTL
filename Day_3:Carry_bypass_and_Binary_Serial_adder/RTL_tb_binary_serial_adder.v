`timescale 1ns / 1ps

module tb_binar_serial_adder();
reg rst_tb;
reg clk;
reg [15:0]a_tb,b_tb;
reg cin_tb;
wire [15:0]sum_tb;
wire cout_tb;

top_binary_serial_adder #(.N(16)) dut(.clk(clk),.rst(rst_tb),.a(a_tb),.b(b_tb),.cin(cin_tb),.sum(sum_tb),.cout(cout_tb));
//carry_skip_adder dut(.rst(rst_tb),.a(a_tb),.b(b_tb),.cin(cin_tb),.sum(sum_tb),.cout(cout_tb));
initial 
    begin
        rst_tb=1;
        clk=0;
        a_tb=0;
        b_tb=0;
        cin_tb=0;
       #5;
        rst_tb=0;
       #10;
        a_tb='d101;
        b_tb='d108;
        cin_tb=0;
       #10;
        a_tb='d101;
        b_tb='d108;
        cin_tb='d1;
       #10;
        a_tb='d999;
        b_tb='d1;
        cin_tb=0;
       #10;
        a_tb='d999;
        b_tb='d1;
        cin_tb=1;
       #10;
        a_tb='d255;
        b_tb='d255;
        cin_tb=0;
        
       #100;
       $finish;
        
    end   
    
    
    always #5 clk=~clk;
endmodule




//module tb_sr();

//shift_registers #(.N(16)) sr_1(.clk(clk),.rst(rst),.d_ina(d_ina),.d_inb(d_inb),.d_in_sum(d_in_sum),.q_outa(q_outa),.q_outb(q_outb),.q_out_sum(q_out_sum));



//endmodule

