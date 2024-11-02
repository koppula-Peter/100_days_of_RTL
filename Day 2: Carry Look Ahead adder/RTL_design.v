`timescale 1ns / 1ps

module carry_look_ahead #(parameter N=16)(rst,a,b,cin,sum,carry_out);
input rst;
input [N-1:0]a,b;
input cin;
output [N-1:0]sum;
output carry_out;

wire [N-1:0] Cg,Cp;
wire [N:0] Cgen;  //Cg --> carry generate, Cp --> carry propagate
wire [N-1:0] carry;

assign Cg=a&b;
assign Cp=a^b;

assign Cgen[0]=cin;
//assign Cgen1 = Cgen;
genvar j;
generate
   for(j=0;j<N;j=j+1)
    begin
        carry_generator dut_2(.Cg(Cg[j]),.Cp(Cp[j]),.Ci(Cgen[j]),.Cgen(Cgen[j+1]));    
    end  
endgenerate

genvar i;
generate
   for(i=0;i<N;i=i+1)
    begin
        full_adder dut_1(.rst(rst),.a(a[i]),.b(b[i]),.cin(Cgen[i]),.sum(sum[i]),.cout(carry[i])); 
    end
endgenerate
    

assign carry_out=Cgen[N];

endmodule


//---------------------------------------------Carry generator block (sub module) ----------------------------------

module carry_generator(Cg,Cp,Ci,Cgen);
input Cg,Cp,Ci;
output Cgen;
    
    assign Cgen=Cg|(Ci&Cp);
endmodule

//--------------------------------------------------------------------------------------------------------------

//---------------------------------------------full adder (sub module) ----------------------------------

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

//--------------------------------------------------------------------------------------------------------------
