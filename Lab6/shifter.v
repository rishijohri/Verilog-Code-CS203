module testbench(
);
    reg clock = 1'b0;
    always #10 clock = ~clock ;
    reg [7:0] in;
    wire [7:0] out;
    reg shl, sh, l, si;
    reg [31:0] tb_mem [0:13];
    master shifter(clock, in[0], in[1], in[2], in[3], in[4], in[5], in[6], in[7], l, shl, sh, si, out[0], out[1], out[2], out[3], out[4], out[5], out[6], out[7]);
    initial begin
        $readmemh("shift.mem", tb_mem);
        $display("memory is %h , %h , %h , %h , %h, %h, %h, %h", tb_mem[0], tb_mem[1], tb_mem[2], tb_mem[3], tb_mem[4], tb_mem[5], tb_mem[6], tb_mem[7]);
        shifter.s0.configure[15:0] = tb_mem[8];
        shifter.s1.configure[15:0] = tb_mem[8];
        shifter.s2.configure[15:0] = tb_mem[8];
        shifter.s3.configure[15:0] = tb_mem[8];
        shifter.s4.configure[15:0] = tb_mem[8];
        shifter.s5.configure[15:0] = tb_mem[8];
        shifter.s6.configure[15:0] = tb_mem[8];
        shifter.s7.configure[15:0] = tb_mem[8];
        shifter.s8.configure[15:0] = tb_mem[9];
        shifter.s9.configure[15:0] = tb_mem[9];
        shifter.s10.configure[15:0] = tb_mem[10];
        shifter.sc.configure[15:0] = tb_mem[11];
        shifter.sf.configure[15:0] = tb_mem[12];
        shifter.clk_modifier.mem[32] = tb_mem[2];
        shifter.clk_modifier.mem[31:0] = tb_mem[13];
        shifter.l0.mem[31:0] = tb_mem[0];
        shifter.l0.mem[32] = tb_mem[1];
        shifter.l1.mem[31:0] = tb_mem[0];
        shifter.l1.mem[32] = tb_mem[1];
        shifter.l2.mem[31:0] = tb_mem[0];
        shifter.l2.mem[32] = tb_mem[1];
        shifter.l3.mem[31:0] = tb_mem[0];
        shifter.l3.mem[32] = tb_mem[1];
        shifter.l4.mem[31:0] = tb_mem[0];
        shifter.l4.mem[32] = tb_mem[1];
        shifter.l5.mem[31:0] = tb_mem[0];
        shifter.l5.mem[32] = tb_mem[1];
        shifter.l6.mem[31:0] = tb_mem[0];
        shifter.l6.mem[32] = tb_mem[1];
        shifter.l7.mem[31:0] = tb_mem[0];
        shifter.l7.mem[32] = tb_mem[1];
        shifter.l8.mem[31:0] = tb_mem[3];
        shifter.l8.mem[32] = tb_mem[2];
        shifter.l9.mem[31:0] = tb_mem[4];
        shifter.l9.mem[32] = tb_mem[2];
        shifter.l10.mem[31:0] = tb_mem[5];
        shifter.l10.mem[32] = tb_mem[2];
        shifter.l11.mem[31:0] = tb_mem[6];
        shifter.l11.mem[32] = tb_mem[2];
        shifter.l12.mem[31:0] = tb_mem[7];
        shifter.l12.mem[32] = tb_mem[2];
        shifter.l13.mem[31:0] = tb_mem[7];
        shifter.l13.mem[32] = tb_mem[2];
    end
    initial begin
        in = 8'b01001001;
        sh = 1'b0;
        shl = 1'b0;
        l = 1'b1;
        si = 1'b0;
        #17
        $display("LOAD input is %b and output is %b", in, out);
        in = 8'b01011001;
        sh = 1'b1;
        shl = 1'b0;
        l = 1'b0;
        si = 1'b1;
        #16
        $display("SHIFT LEFT input is %b and output is %b", in, out);
        in = 8'b01001001;
        sh = 1'b0;
        shl = 1'b1;
        l = 1'b0;
        si = 1'b1;
        #16
        $display("SHIFT RIGHT si= %b input is %b and output is %b",si, in, out);
        in = 8'b01001001;
        sh = 1'b0;
        shl = 1'b0;
        l = 1'b0;
        si = 1'b0;
        #16
        $display("NO CHANGE input is %b and output is %b", in, out);
        in = 8'b11111111;
        sh = 1'b0;
        shl = 1'b0;
        l = 1'b1;
        si = 1'b0;
        #16
        $display("LOAD input is %b and output is %b", in, out);
        in = 8'b01001001;
        sh = 1'b0;
        shl = 1'b1;
        l = 1'b0;
        si = 1'b0;
        #16
        $display("SHIFT RIGHT si= %b input is %b and output is %b",si, in, out);
        in = 8'b01001001;
        sh = 1'b0;
        shl = 1'b1;
        l = 1'b0;
        si = 1'b0;
        #16
        $display("SHIFT RIGHT si= %b input is %b and output is %b",si, in, out);
        in = 8'b01011001;
        sh = 1'b1;
        shl = 1'b0;
        l = 1'b0;
        si = 1'b1;
        #16
        $display("SHIFT LEFT input is %b and output is %b", in, out);
        in = 8'b01011001;
        sh = 1'b1;
        shl = 1'b0;
        l = 1'b0;
        si = 1'b1;
        #16
        $display("SHIFT LEFT input is %b and output is %b", in, out);
        in = 8'b01011001;
        sh = 1'b1;
        shl = 1'b0;
        l = 1'b0;
        si = 1'b1;
        #16
        $display("SHIFT LEFT input is %b and output is %b", in, out);
        in = 8'b01011001;
        sh = 1'b1;
        shl = 1'b0;
        l = 1'b0;
        si = 1'b1;
        #16
        $display("SHIFT LEFT input is %b and output is %b", in, out);
        $finish;
    end
    initial
    begin
        $dumpfile("dump.vcd");
        $dumpvars;
    end
endmodule