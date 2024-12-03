module  overflow #(parameter N=16) (a,b,res);
  input [N-1:0] a,b;
  output [N-1:0] res;

  wire []
  assign a_temp = a(N-1) ? (~a)+1 :  a;
  assign b_temp = b(N-1) ? (~b)+1 :  b;
  assign res = b_temp(N-1) ^ a_temp(N-1); 




endmodule

  // module cp_2s #(parameter N=16) (input [N-1:0]in, output [N-1:0]out);
  //   asssign out = (~in)+1;
  //  endmodule
      
      
