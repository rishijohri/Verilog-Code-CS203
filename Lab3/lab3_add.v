module full_adder (
    sum,
    cout,
    a,
    b,
    cin
);
    input a, b, cin ;
    output sum, cout;
    wire axb ;
    assign #4 sum = a^b^cin;
    assign #3 cout = (a&b) | (a&cin) | (b&cin);
endmodule

module add16_rc (
    sum16, cout, a16, b16, cin
);
    input [15:0]a16;
    input [15:0] b16;
    input cin;
    wire [16:0] carry;
    assign carry[0] = cin;
    output [15:0]sum16;
    output cout;
    genvar i;
    generate for (i = 0;i<16 ;i=i+1 ) begin
        full_adder g1(sum16[i], carry[i+1], a16[i], b16[i], carry[i]);
    end
    endgenerate
    assign cout = carry[16];
endmodule

module carry_generator (
    couts, p, g, cin
);
    input [3:0] g;
    input [3:0] p;
    input cin;
    output [3:0] couts;
    assign #2 couts[0] = g[0]|(p[0]&cin);
    assign #2 couts[1] = g[1]|(p[1]&couts[0]);
    assign #2 couts[2] = g[2]|(p[2]&couts[1]);
    assign #2 couts[3] = g[3]|(p[3]&couts[2]);
endmodule

module full_adder_pg (
    sum, cout, p, g, a, b, cin
);
    input a, b, cin;
    output sum, cout, p, g;
    assign #4 sum = a^b^cin;
    assign #1 g = a&b;
    assign #1 p = a|b;
    assign #1 cout = g|(p&cin);
endmodule

module add4_cla (
    sum4, cout, a4, b4, cin
);
    input [3:0]a4;
    input [3:0] b4;
    input cin;
    wire [4:0] carry;
    assign carry[0] = cin;
    output [3:0]sum4;
    output cout;
    wire [3:0] g;
    wire [3:0] p;
    genvar i;
    generate
        for (i = 0; i<4 ;i=i+1 ) begin
            full_adder_pg pg1( , ,p[i], g[i], a4[i], b4[i], );
        end
    endgenerate
    wire [3:0]couts;
    carry_generator cry(couts, p, g, cin);
    wire [4:0] final;
    assign #4 sum4[0] = a4[0]^b4[0]^cin;
    assign #4 sum4[1] = a4[1]^b4[1]^couts[0];
    assign  #4 sum4[2] = a4[2]^b4[2]^couts[1];
    assign  #4 sum4[3] = a4[3]^b4[3]^couts[2];
    assign cout = couts[3];
endmodule

module add16_cla (
    sum16, cout, a16, b16, cin
);
    input [15:0] a16;
    input [15:0] b16;
    input cin;
    output [15:0] sum16;
    output cout;
    wire [16:0] carry;
    wire [3:0] gstr;
    wire [3:0] pstr;
    wire [15:0] g;
    wire [15: 0] p;
    wire [4:0] couts;
    assign couts[0] = cin;
    genvar i;
    generate
        for (i =0 ;i<16 ;i=i+1 ) begin
            full_adder_pg g1( , , p[i], g[i], a16[i], b16[i], );
        end
    endgenerate
    genvar j;
    generate for (j =0 ;j<13 ; j=j+4) begin
        assign  gstr[j/4] = g[j+3] | g[j+2]&p[j+3] | g[j+1]&p[j+2]&p[j+3] | g[j]&p[j+1]&p[j+2]&p[j+3];
        assign  pstr[j/4] = p[j]&p[j+1]&p[j+2]&p[j+3];
        //assign couts[1+j/4] = gstr[j/4]|(couts[j/4]&p[j/4]);
    end
    endgenerate
    assign #2 couts[1] = gstr[0] | couts[0]&pstr[0];
    assign #4 couts[2] = gstr[1] | gstr[0]&pstr[1] | couts[0]&pstr[0]&pstr[1];
    assign #4 couts[3] = gstr[2] | gstr[1]&pstr[2] | gstr[0]&pstr[1]&pstr[2] | couts[0]&pstr[0]&pstr[1]&pstr[2];
    assign #6 couts[4] = gstr[3] | gstr[1]&pstr[2]&pstr[3] | gstr[0]&pstr[1]&pstr[2]&pstr[3] | couts[0]&pstr[0]&pstr[1]&pstr[2]&pstr[3];
    add4_cla f1(sum16[3:0], , a16[3:0], b16[3:0], couts[0]);
    add4_cla f2(sum16[7:4], , a16[7:4], b16[7:4], couts[1]);
    add4_cla f3(sum16[11:8], , a16[11:8], b16[11:8], couts[2]);
    add4_cla f4(sum16[15:12], , a16[15:12], b16[15:12], couts[3]);
    assign cout = couts[4];
endmodule


