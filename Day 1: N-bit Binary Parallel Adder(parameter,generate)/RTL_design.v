
module BPA #(parameter SIZE=16) (rst,a,b,cin,sum,carry_out);//SIZE defines the size of the adder eg: SIZE=16 in here
input rst;
input [SIZE-1:0]a,b,cin;
output [SIZE-1:0]sum;
output carry_out;

wire [SIZE:0] carry;

assign carry[0]=cin;

genvar i;
generate
    for(i=0; i<SIZE; i=i+1)
        begin 
          full_adder fa(.rst(rst),.a(a[i]),.b(b[i]),.cin(carry[i]),.sum(sum[i]),.cout(carry[i+1]));
        end
endgenerate

assign carry_out=carry[SIZE];
endmodule


//---------------------------------------------- Full Adder module ----------------------------------------
module full_adder(rst,a,b,cin,sum,cout);
input rst;
input a,b,cin;
output reg sum,cout;

always @(*)
    begin
        if(rst==1)
          {sum,cout}=0;
        else  
            begin
                sum=a^b^cin;
                cout=((a&b)|(b&cin)|(a&cin));
            end
    end
endmodule

