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


module latches(input a,b,preset,clr, output sr_q_nor,sr_q_nand,sr_qn_nor,sr_qn_nand,jk_q_nor,jk_qn_nor,jk_q_nand,jk_qn_nand,d_q_nor,d_qn_nor,d_q_nand,d_qn_nand);
wire [1:0] sr_nand,sa_nor,jk_nand,jk_nor,d_nand,d_nor,w_nand, w_nor,w1_nand, w1_nor;
wire a_not;

//---------------------------------SR Latch 
//(NOR-based)
/*
         + ---------- +
  a -----|R         q |--------- sr_q_nor
         |            |
         |    SR      |
  b -----|S        qn |--------- sr_qn_nor
         |            |
         + ---------- +
*/

nor n1(sa_nor[0],a,sa_nor[1]);//r--a -> reset
nor n2(sa_nor[1],b,sa_nor[0]);//s--b -> set

assign  sr_q_nor  = sa_nor[0];
assign  sr_qn_nor = sa_nor[1];


//(NAND-based)
/*
         + ---------- +
  a -----|S_bar     q |--------- sr_q_nand
         |            |
         |      SR    |
  b -----|R_bar    qn |--------- sr_qn_nand
         |            |
         + ---------- +
*/

nand n3(sr_nand[0],a,sr_nand[1]);//s--a -> set_bar
nand n4(sr_nand[1],b,sr_nand[0]);//r--b -> reset_bar

assign  sr_q_nand  = sr_nand[0];
assign  sr_qn_nand = sr_nand[1];



//---------------------------------JK Latch


// (NOR-based)
/*
         + ---------- +
  a -----|K         q |--------- jk_q_nor
         |            |
         |    SR      |
  b -----|J        qn |--------- jk_qn_nor
         |            |
         + ---------- +
*/

and #1 a1(w_nor[0],a,jk_nor[0]);//r--a -> reset
and #1 a2(w_nor[1],b,jk_nor[1]);//s--b -> set

nor n5(jk_nor[0],w_nor[0],jk_nor[1],clr);
nor n6(jk_nor[1],w_nor[1],jk_nor[0],clr);




//assign w_nor[0] = ~(a && jk_nor[0]); 
//assign w_nor[1] = ~(b && jk_nor[1]); 

//assign jk_nor[0] = ~(w_nor[0] || jk_nor[0] || clr); 
//assign jk_nor[1] = ~(w_nor[0] || jk_nor[1] || clr); 

assign jk_q_nor  = jk_nor[0];
assign jk_qn_nor = jk_nor[1];


// (NAND-based)
/*
         + ---------- +
  a -----|K         q |--------- jk_q_nand
         |            |
         |    SR      |
  b -----|J        qn |--------- jk_qn_nand
         |            |
         + ---------- +
*/

nand a3(w_nand[0],a,jk_nand[1],~clr);//r--a -> set
nand a4(w_nand[1],b,jk_nand[0],~preset);//s--b -> reset

nand n7(jk_nand[0],w_nand[0],jk_nand[1],~preset);
nand n8(jk_nand[1],w_nand[1],jk_nand[0],~clr);

assign jk_q_nand  = jk_nand[0];
assign jk_qn_nand = jk_nand[1];

//---------------------------------D Latch 
//(NOR-based)

/*
         + ---------- +
 a_not---|R         q |--------- d_q_nor
         |            |
         |    SR      |
    a ---|S        qn |--------- d_qn_nor
         |            |
         + ---------- +
*/

not g1(a_not,a);

and a5(w1_nor[0],a_not,jk_nor[0]);//
and a6(w1_nor[1],a,jk_nor[1]);//

nor n9(d_nor[0],w1_nor[0],d_nor[1],clr);//
nor n10(d_nor[1],w1_nor[1],d_nor[0],clr);//

assign d_q_nor  = d_nor[0];
assign d_qn_nor = d_nor[1];


//(NAND-based)

/*
         + ---------- +
  a -----|R         q |--------- d_q_nand
         |            |
         |    SR      |
a_not ---|S        qn |--------- d_qn_nand
         |            |
         + ---------- +
*/

not g2(a_not,a);

nand a7(w1_nand[0],a_not,jk_nand[1],~clr);//
nand a8(w1_nand[1],a,jk_nand[0],~preset);//

nand n11(d_nand[0],w1_nand[0],d_nand[1],~preset);//
nand n12(d_nand[1],w1_nand[1],d_nand[0],~clr);//

assign d_q_nand  = d_nand[0];
assign d_qn_nand = d_nand[1];

endmodule
