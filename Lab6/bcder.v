module test (
);
    reg clock = 1'b0;
    always #10 clock = ~clock ;
    reg [3:0] d0;
    reg [3:0] d1;
    wire [3:0] out;
    wire carry;
    reg c;
    reg [31:0] tb_mem [0:13];
    master shifter(clock, d0[0], d0[1], d0[2], d0[3], d1[0], d1[1], d1[2], d1[3], c, c, c, c, out[0], out[1], out[2], out[3], , , , carry);
    initial begin
        $readmemh("bcd.mem", tb_mem);
        $display("memory is %h , %h , %h , %h , %h, %h, %h, %h", tb_mem[0], tb_mem[1], tb_mem[2], tb_mem[3], tb_mem[4], tb_mem[5], tb_mem[6], tb_mem[7]);
        shifter.s0.configure[15:0] = tb_mem[10];
        shifter.s1.configure[15:0] = tb_mem[10];
        shifter.s2.configure[15:0] = tb_mem[10];
        shifter.s3.configure[15:0] = tb_mem[10];
        shifter.s4.configure[15:0] = tb_mem[10];
        shifter.s5.configure[15:0] = tb_mem[10];
        shifter.s6.configure[15:0] = tb_mem[10];
        shifter.s7.configure[15:0] = tb_mem[10];
        shifter.s8.configure[15:0] = tb_mem[11];
        shifter.s9.configure[15:0] = tb_mem[11];
        shifter.s10.configure[15:0] = tb_mem[12];
        shifter.sc.configure[15:0] = tb_mem[12];
        shifter.sf.configure[15:0] = tb_mem[13];
        shifter.clk_modifier.mem[32] = tb_mem[2];
        shifter.clk_modifier.mem[31:0] = tb_mem[4];
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
        shifter.l9.mem[31:0] = tb_mem[5];
        shifter.l9.mem[32] = tb_mem[2];
        shifter.l10.mem[31:0] = tb_mem[6];
        shifter.l10.mem[32] = tb_mem[2];
        shifter.l11.mem[31:0] = tb_mem[7];
        shifter.l11.mem[32] = tb_mem[2];
        shifter.l12.mem[31:0] = tb_mem[8];
        shifter.l12.mem[32] = tb_mem[2];
        shifter.l13.mem[31:0] = tb_mem[9];
        shifter.l13.mem[32] = tb_mem[2];
    end
    initial begin
        d0 = 4'b1001;
        d1 = 4'b0111;
        c = 1'b0;
        #16
        $display("inputs %b and %b and carry %b have output is %b and carry is %b",d0, d1, c, out, carry);
        d0 = 4'b1001;
        d1 = 4'b0111;
        c = 1'b1;
        #16
        $display("inputs %b and %b and carry %b have output is %b and carry is %b",d0, d1, c, out, carry);
        d0 = 4'b0010;
        d1 = 4'b0110;
        c = 1'b0;
        #16
        $display("inputs %b and %b and carry %b have output is %b and carry is %b",d0, d1, c, out, carry);
        d0 = 4'b1001;
        d1 = 4'b0101;
        c = 1'b1;
        #16
        $display("inputs %b and %b and carry %b have output is %b and carry is %b",d0, d1, c, out, carry);
        $finish;
    end
    initial
    begin
        $dumpfile("dump.vcd");
        $dumpvars;
    end
endmodule