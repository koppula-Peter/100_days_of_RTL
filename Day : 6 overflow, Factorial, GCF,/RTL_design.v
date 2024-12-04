`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.12.2024 00:34:10
// Design Name: 
// Module Name: day_6
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

module  overflow #(parameter N=16) (a,b,res);// inputs a,b should be in 2s complement form if its a negative number
  input [N-1:0] a,b;
  output res;

  wire [N-1:0] a_temp,b_temp;
  
  assign a_temp = a[N-1] ? (~a)+1 :  a;
  assign b_temp = b[N-1] ? (~b)+1 :  b;
  assign res = b_temp[N-1] ^ a_temp[N-1]; 

endmodule


module gcf #(parameter N=16) (a,b,res);
  input [N-1:0] a,b;
  output reg [N-1:0] res;

    integer i,j,ptr1,ptr2;
    
    reg [N-1:0] a_temp [2**(N-1):0],b_temp[2**(N-1):0];
    
always @(*)
    begin
        for(i=2; i<=(2**(N-1)); i=i+1)
            begin
                if(a%i==0)
                    a_temp [i] = i;
                else
                    a_temp [i] = 0;
            end
        
        for(j=2; j<=(2**(N-1)); j=j+1)
            begin
                if(b%j==0)
                    b_temp [j] = j;
                else
                    b_temp [j] = 0;
            end
            
        for(ptr1=0; ptr1<=(2**(N-1)); ptr1=ptr1+1)
            for(ptr2=0; ptr2<=(2**(N-1)); ptr2=ptr2+1)
              if(a_temp[ptr1] == b_temp[ptr2])
                  res =  b_temp[ptr2];
    end
endmodule


module factorial #(parameter N=16)(input [N-1:0] data_in, output reg [N-1:0] data_out);
reg [N-1:0] fact;
integer i;

always @(*)
    begin
        fact =1;
        for(i=1; i<=data_in; i=i+1)
          fact <= fact * i;
    end

endmodule
