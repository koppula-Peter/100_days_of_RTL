`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.12.2024 17:44:12
// Design Name: 
// Module Name: latches
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


module latches(input a,b, output sr_q_nor,sr_q_nand,sr_qn_nor,sr_qn_nand,jk_q_nor,jk_qn_nor,jk_q_nand,jk_qn_nand,d_q_nor,d_qn_nor,d_q_nand,d_qn_nand);
wire [1:0] sr_nand,sa_nor,jk_nand,jk_nor,d_nand,d_nor,w_nand, w_nor;
wire a_not;

//---------------------------------SR Latch 
//(NOR-based)
/*
         + ---------- +
  b -----|R         q |--------- sr_q
         |            |
         |    SR      |
  a -----|S        qn |--------- sr_qn
         |            |
         + ---------- +
*/

nor nor1(sa_nor[0],a,sa_nor[1]);//r--a -> set
nor nor2(sa_nor[1],b,sa_nor[0]);//s--b -> reset

assign  sr_q_nor  = sa_nor[0];
assign  sr_qn_nor = sa_nor[1];


//(NAND-based)
/*
         + ---------- +
  a -----|S_bar     q |--------- sr_q
         |            |
         |      SR    |
  b -----|R_bar    qn |--------- sr_qn
         |            |
         + ---------- +
*/

nand na1(sr_nand[0],a,sr_nand[1]);//s--a -> set_bar
nand na2(sr_nand[1],b,sr_nand[0]);//r--b -> reset_bar

assign  sr_q_nand  = sr_nand[0];
assign  sr_qn_nand = sr_nand[1];



//---------------------------------JK Latch


// (NOR-based)
/*
         + ---------- +
  a -----|j         q |--------- sr_q
         |            |
         |    SR      |
  b -----|k        qn |--------- sr_qn
         |            |
         + ---------- +
*/

and a1(w_nor[0],a,jk_nor[0]);//r--a -> set
and a2(w_nor[1],b,jk_nor[1]);//s--b -> reset

nor n3(jk_nor[0],w_nor[0],jk_nor[1]);
nor n4(jk_nor[1],w_nor[1],jk_nor[0]);

assign jk_q_nor  = jk_nor[0];
assign jk_qn_nand = jk_nor[1];

// (NAND-based)
/*
         + ---------- +
  a -----|j         q |--------- sr_q
         |            |
         |    SR      |
  b -----|k        qn |--------- sr_qn
         |            |
         + ---------- +
*/

and a3(w_nor[0],a,jk_nor[0]);//r--a -> set
and a4(w_nor[1],b,jk_nor[1]);//s--b -> reset

nor nand3(jk_nor[0],w_nor[0],jk_nor[1]);
nor nand4(jk_nor[1],w_nor[1],jk_nor[0]);

assign jk_q_nor  = jk_nor[0];
assign jk_qn_nand = jk_nor[1];

//---------------------------------D Latch 
//(NOR-based)

/*
         + ---------- +
  a -----|R         q |--------- sr_q
         |            |
         |    SR      |
a_not ---|S        qn |--------- sr_qn
         |            |
         + ---------- +
*/

not g1(a_not,a);
nor nor5(d_nor[0],a_not,d_nor[1]);//r--a -> set
nor nor6(d_nor[1],a,d_nor[0]);//s--b -> reset

assign d_q_nor  = d_nor[0];
assign d_qn_nor = d_nor[1];

endmodule
