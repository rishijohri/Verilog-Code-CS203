module test (
);
    reg clock = 1'b0;
    always #10 clock = ~clock ;
    reg in0, in1, in2, in3, in4, in5, in6, in7;
    wire out0;
    reg  c0, c1, c2;
    reg [31:0] tb_mem [0:13];
    reg zero = 1'b0;
    master shifter(clock, in0, in1, in2, in3, in4, in5, in6, in7, c0, c1, c2, zero, out, , , , , , , );
    initial begin
        $readmemh("mul.mem", tb_mem);
        $display("memory is %h , %h , %h , %h , %h, %h, %h, %h", tb_mem[0], tb_mem[1], tb_mem[2], tb_mem[3], tb_mem[4], tb_mem[5], tb_mem[6], tb_mem[7]);
        shifter.s0.configure[15:0] = tb_mem[6];
        shifter.s1.configure[15:0] = tb_mem[6];
        shifter.s2.configure[15:0] = tb_mem[6];
        shifter.s3.configure[15:0] = tb_mem[6];
        shifter.s4.configure[15:0] = tb_mem[7];
        shifter.s5.configure[15:0] = tb_mem[7];
        shifter.s6.configure[15:0] = tb_mem[7];
        shifter.s7.configure[15:0] = tb_mem[7];
        shifter.s8.configure[15:0] = tb_mem[8];
        shifter.s9.configure[15:0] = tb_mem[9];
        shifter.s10.configure[15:0] = tb_mem[10];
        shifter.sc.configure[15:0] = tb_mem[11];
        shifter.sf.configure[15:0] = tb_mem[12];
        shifter.clk_modifier.mem[32] = tb_mem[2];
        shifter.clk_modifier.mem[31:0] = tb_mem[13];
        shifter.l0.mem[31:0] = tb_mem[0];
        shifter.l0.mem[32] = tb_mem[2];
        shifter.l1.mem[31:0] = tb_mem[0];
        shifter.l1.mem[32] = tb_mem[2];
        shifter.l2.mem[31:0] = tb_mem[0];
        shifter.l2.mem[32] = tb_mem[2];
        shifter.l3.mem[31:0] = tb_mem[0];
        shifter.l3.mem[32] = tb_mem[2];
        shifter.l4.mem[31:0] = tb_mem[3];
        shifter.l4.mem[32] = tb_mem[2];
        shifter.l5.mem[31:0] = tb_mem[3];
        shifter.l5.mem[32] = tb_mem[2];
        shifter.l6.mem[31:0] = tb_mem[3];
        shifter.l6.mem[32] = tb_mem[2];
        shifter.l7.mem[31:0] = tb_mem[3];
        shifter.l7.mem[32] = tb_mem[2];
        shifter.l8.mem[31:0] = tb_mem[4];
        shifter.l8.mem[32] = tb_mem[2];
        shifter.l9.mem[31:0] = tb_mem[4];
        shifter.l9.mem[32] = tb_mem[2];
        shifter.l10.mem[31:0] = tb_mem[3];
        shifter.l10.mem[32] = tb_mem[2];
        shifter.l11.mem[31:0] = tb_mem[3];
        shifter.l11.mem[32] = tb_mem[2];
        shifter.l12.mem[31:0] = tb_mem[3];
        shifter.l12.mem[32] = tb_mem[2];
        shifter.l13.mem[31:0] = tb_mem[5];
        shifter.l13.mem[32] = tb_mem[2];
    end
    initial begin
        in0 = 1'b0;
        in1 = 1'b0;
        in2 = 1'b0;
        in3 = 1'b0;
        in4 = 1'b0;
        in5 = 1'b0;
        in6 = 1'b0;
        in7 = 1'b0;
        c0 = 1'b0;
        c1 = 1'b0;
        c2 = 1'b0;
        #16
        $display("output is %b", out);
        in0 = 1'b0;
        in1 = 1'b0;
        in2 = 1'b0;
        in3 = 1'b0;
        in4 = 1'b1;
        in5 = 1'b0;
        in6 = 1'b0;
        in7 = 1'b0;
        c0 = 1'b0;
        c1 = 1'b0;
        c2 = 1'b1;
        #16
        $display("output is %b", out);
        in0 = 1'b0;
        in1 = 1'b0;
        in2 = 1'b0;
        in3 = 1'b0;
        in4 = 1'b0;
        in5 = 1'b0;
        in6 = 1'b0;
        in7 = 1'b1;
        c0 = 1'b1;
        c1 = 1'b1;
        c2 = 1'b1;
        #16
        $display("output is %b", out);
        $finish;
    end
    initial
    begin
        $dumpfile("dump.vcd");
        $dumpvars;
    end
endmodule