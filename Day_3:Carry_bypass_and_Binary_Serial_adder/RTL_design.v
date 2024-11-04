`timescale 1ns / 1ps

//Note : N should be multiples of 4
//make changes according to your requirement


//-------------------------to module for carry skip adder-------------------

module top_carry_skip_adder #(parameter N=16)(rst,a,b,cin,sum,cout_top);
input rst;
input [N-1:0]a,b;
input cin;
output [N-1:0]sum;
output cout_top;
//output [N*4-1:0]Cp;

wire [N:0] carry_top;

assign carry_top[0]=cin;

genvar i;
    generate 
       for(i=0; i<N/4; i=i+1)
        begin
            
            carry_skip_adder dut_1(.rst(rst),.a(a[((i+1)*4)-1:i*4]),.b(b[((i+1)*4)-1:i*4]),.cin(carry_top[i]),.sum(sum[((i+1)*4)-1:i*4]),.cout(carry_top[i+1]));
 
        end
    endgenerate
    
assign cout_top=carry_top[N];

endmodule
//---------------------------------------------------carry_skip_adder main -------------------------------
module carry_skip_adder(rst,a,b,cin,sum,cout);

input rst;
input [3:0]a,b;
input cin;
output [3:0]sum;
output cout;

wire [3:0]Cp;
wire [3:0] carry_in;
wire and_4;

assign Cp=a^b;
assign and_4=Cp[3]&&Cp[2]&&Cp[1]&&Cp[0];
assign cout=and_4?cin:carry_in[3];

full_adder fa_0(.rst(rst),.a(a[0]),.b(b[0]),.cin(cin),.sum(sum[0]),.cout(carry_in[0]));
full_adder fa_1(.rst(rst),.a(a[1]),.b(b[1]),.cin(carry_in[0]),.sum(sum[1]),.cout(carry_in[1]));
full_adder fa_2(.rst(rst),.a(a[2]),.b(b[2]),.cin(carry_in[1]),.sum(sum[2]),.cout(carry_in[2]));
full_adder fa_3(.rst(rst),.a(a[3]),.b(b[3]),.cin(carry_in[2]),.sum(sum[3]),.cout(carry_in[3]));

endmodule

//---------------------------------------------- Full Adder module ----------------------------------------
module full_adder(rst,a,b,cin,sum,cout);
input rst;
input a,b,cin;
output reg sum,cout;

always @(*)
    begin
        if(rst==1)
          {sum,cout}<=0;
        else  
            begin
                sum<=a^b^cin;
                cout<=((a&b)|(b&cin)|(a&cin));
            end
    end
endmodule
