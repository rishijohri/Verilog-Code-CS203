module logic_tile(
    out, 
    clock, 
    in1, 
    in2, 
    in3, 
    in4, 
    in5
);
    input in1, in2, in3, in4, in5, clock ;
    output out ;
    reg tem;
    reg tem2;
    initial begin
        tem2 = 1'b0;
    end
    reg out ;
    reg [32:0] mem;
    always @(*) begin
        case({in5, in4, in3, in2, in1})
            5'b00000 : tem = mem[0] ;
            5'b00001 : tem = mem[1] ;
            5'b00010 : tem = mem[2] ;
            5'b00011 : tem = mem[3] ;
            5'b00100 : tem = mem[4] ;
            5'b00101 : tem = mem[5] ;
            5'b00110 : tem = mem[6] ;
            5'b00111 : tem = mem[7] ;
            5'b01000 : tem = mem[8] ;
            5'b01001 : tem = mem[9] ;
            5'b01010 : tem = mem[10] ;
            5'b01011 : tem = mem[11] ;
            5'b01100 : tem = mem[12] ;
            5'b01101 : tem = mem[13] ;
            5'b01110 : tem = mem[14] ;
            5'b01111 : tem = mem[15] ;
            5'b10000 : tem = mem[16] ;
            5'b10001 : tem = mem[17] ;
            5'b10010 : tem = mem[18] ;
            5'b10011 : tem = mem[19] ;
            5'b10100 : tem = mem[20] ;
            5'b10101 : tem = mem[21] ;
            5'b10110 : tem = mem[22] ;
            5'b10111 : tem = mem[23] ;
            5'b11000 : tem = mem[24] ;
            5'b11001 : tem = mem[25] ;
            5'b11010 : tem = mem[26] ;
            5'b11011 : tem = mem[27] ;
            5'b11100 : tem = mem[28] ;
            5'b11101 : tem = mem[29] ;
            5'b11110 : tem = mem[30] ;
            5'b11111 : tem = mem[31] ;
        endcase
    end
    always @(posedge clock) begin
        tem2 = tem;
    end
    always @(*) begin
        case (mem[32])
            1'b0 : out = tem ;
            1'b1 : out = tem2 ;
        endcase
    end
endmodule

module switch_box_4x4(
    out, 
    in
);
    input [3: 0] in ;
    output [3:0] out ;
    reg [15:0] configure ;
    assign out[0] = configure[0]&in[0] | configure[1]&in[1] | configure[2]&in[2] | configure[3]&in[3] ;
    assign out[1] = configure[4]&in[0] | configure[5]&in[1] | configure[6]&in[2] | configure[7]&in[3] ;
    assign out[2] = configure[8]&in[0] | configure[9]&in[1] | configure[10]&in[2] | configure[11]&in[3] ;
    assign out[3] = configure[12]&in[0] | configure[13]&in[1] | configure[14]&in[2] | configure[15]&in[3] ;

endmodule

module master(
    clk,
    in0,
    in1,
    in2, 
    in3, 
    in4, 
    in5, 
    in6, 
    in7,
    cn0,
    cn1,
    cn2,
    cn3,
    out0,
    out1,
    out2,
    out3,
    out4,
    out5,
    out6,
    out7
);
    input in0, in1, in2, in3, in4, in5, in6, in7, cn0, cn1, cn2, cn3, clk;
    output out0, out1, out2, out3, out4, out5, out6, out7 ;
    reg out0, out1, out2, out3, out4, out5, out6, out7 ;
    reg zero = 1'b0;
    wire [3:0] rs0;
    wire [3:0] rs1;
    wire [3:0] rs2;
    wire [3:0] rs3;
    wire [3:0] rs4;
    wire [3:0] rs5;
    wire [3:0] rs6;
    wire [3:0] rs7;
    wire [3:0] rs8;
    wire [3:0] rs9;
    wire [3:0] rs10;
    wire [3:0] rsc;
    wire [3:0] rsf;
    wire ol0;
    wire ol1;
    wire ol2;
    wire ol3;
    wire ol4;
    wire ol5;
    wire ol6;
    wire ol7;
    wire ol8;
    wire ol9;
    wire ol10;
    wire ol11;
    wire ol12;
    wire ol13;
    wire upd_clk ;
    switch_box_4x4 s0(rs0, {zero, ol1, cn0, in4});
    switch_box_4x4 s1(rs1, {ol0, ol2, ol4, in5});
    switch_box_4x4 s2(rs2, {ol1, ol3, ol5, in6});
    switch_box_4x4 s3(rs3, {ol2, ol4, ol6, in7});
    switch_box_4x4 s4(rs4, {ol3, ol5, cn0, in0});
    switch_box_4x4 s5(rs5, {ol4, ol6, ol4, in1});
    switch_box_4x4 s6(rs6, {ol5, ol7, ol5, in2});
    switch_box_4x4 s7(rs7, {ol6, cn3, ol6, in3});
    switch_box_4x4 s8(rs8, {ol3, ol2, ol1, ol0});
    switch_box_4x4 s9(rs9, {ol3, ol2, ol1, ol0});
    switch_box_4x4 s10(rs10, {zero, cn1, cn0, ol7});
    switch_box_4x4 sc(rsc, {cn3, cn2, cn1, cn0});
    switch_box_4x4 sf(rsf, {ol13, ol8, ol12, ol7});
    logic_tile clk_modifier(upd_clk,clk, rsc[0], rsc[1], clk, zero, zero);
    logic_tile l0(ol0, upd_clk, in0, rs0[0], rs0[1], rsc[0], rsc[1] );
    logic_tile l1(ol1, upd_clk, in1, rs1[0], rs1[1], rsc[0], rsc[1] );
    logic_tile l2(ol2, upd_clk, in2, rs2[0], rs2[1], rsc[0], rsc[1] );
    logic_tile l3(ol3, upd_clk, in3, rs3[0], rs3[1], rsc[0], rsc[1] );
    logic_tile l4(ol4, upd_clk, in4, rs4[0], rs4[1], rsc[0], rsc[1] );
    logic_tile l5(ol5, upd_clk, in5, rs5[0], rs5[1], rsc[0], rsc[1] );
    logic_tile l6(ol6, upd_clk, in6, rs6[0], rs6[1], rsc[0], rsc[1] );
    logic_tile l7(ol7, upd_clk, in7, rs7[0], rs7[1], rsc[0], rsc[1] ); 
    logic_tile l8(ol8, upd_clk, rs8[0], rs8[1], rs8[2], rs8[3], rs10[0]);
    logic_tile l9(ol9, upd_clk, rs9[0], rs9[1], rs9[2], rs9[3], rs10[0]);
    logic_tile l10(ol10, upd_clk, rs9[0], rs9[1], rs9[2], rs9[3], rs10[0]);
    logic_tile l11(ol11, upd_clk, rs9[0], rs9[1], rs9[2], rs9[3], rs10[0]);
    logic_tile l12(ol12, upd_clk, rs9[0], rs9[1], rs9[2], rs9[3], rs10[0]);
    logic_tile l13(ol13, upd_clk, ol8, ol9, cn0, zero, zero);
    always @(*) begin
        assign out0 = rsf[1]; 
        assign out1 = ol9;
        assign out2 = ol10;
        assign out3 = ol11;
        assign out4 = ol4;
        assign out5 = ol5;
        assign out6 = ol6;
        assign out7 = rsf[0];
    end
endmodule

