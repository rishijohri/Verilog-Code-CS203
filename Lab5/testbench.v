module testbench(

);
    reg clock = 1'b0;
    always #10 clock = ~clock ;
    reg [7:0] d;
    wire [7:0] out;
    reg shl, sh, l, si;
    reg [31:0] tb_mem [0:4];
    shift_register register(d, shl, sh, l, si, clock, out);
    initial begin
        $readmemh("configure.mem", tb_mem);
        $display("memory is %h , %h , %h , %h , %h", tb_mem[0], tb_mem[1], tb_mem[2], tb_mem[3], tb_mem[4]);
        register.reduction.configure[15:0] = tb_mem[4];
        register.clk_modifier.mem[32] = tb_mem[1];
        register.clk_modifier.mem[31:0] = tb_mem[0];
        register.L0.mem[31:0] = tb_mem[2];
        register.L0.mem[32] = tb_mem[3];
        register.L1.mem[31:0] = tb_mem[2];
        register.L1.mem[32] = tb_mem[3];
        register.L2.mem[31:0] = tb_mem[2];
        register.L2.mem[32] = tb_mem[3];
        register.L3.mem[31:0] = tb_mem[2];
        register.L3.mem[32] = tb_mem[3];
        register.L4.mem[31:0] = tb_mem[2];
        register.L4.mem[32] = tb_mem[3];
        register.L5.mem[31:0] = tb_mem[2];
        register.L5.mem[32] = tb_mem[3];
        register.L6.mem[31:0] = tb_mem[2];
        register.L6.mem[32] = tb_mem[3];
        register.L7.mem[31:0] = tb_mem[2];
        register.L7.mem[32] = tb_mem[3];
    end
    initial begin
        d = 8'b01001001;
        sh = 1'b0;
        shl = 1'b0;
        l = 1'b1;
        si = 1'b0;
        #16
        $display("LOAD input is %b and output is %b", d, out);
        d = 8'b01011001;
        sh = 1'b1;
        shl = 1'b0;
        l = 1'b0;
        si = 1'b1;
        #16
        $display("SHIFT RIGHT si= %b input is %b and output is %b",si, d, out);
        d = 8'b01001001;
        sh = 1'b0;
        shl = 1'b1;
        l = 1'b0;
        si = 1'b0;
        #16
        $display("SHIFT LEFT input is %b and output is %b", d, out);
        d = 8'b01001001;
        sh = 1'b0;
        shl = 1'b0;
        l = 1'b0;
        si = 1'b0;
        #16
        $display("NO CHANGE input is %b and output is %b", d, out);
        d = 8'b11111111;
        sh = 1'b0;
        shl = 1'b0;
        l = 1'b1;
        si = 1'b0;
        #16
        $display("LOAD input is %b and output is %b", d, out);
        d = 8'b01011001;
        sh = 1'b1;
        shl = 1'b0;
        l = 1'b0;
        si = 1'b0;
        #16
        $display("SHIFT RIGHT si= %b input is %b and output is %b",si, d, out);
        d = 8'b01011001;
        sh = 1'b1;
        shl = 1'b0;
        l = 1'b0;
        si = 1'b0;
        #16
        $display("SHIFT RIGHT si= %b input is %b and output is %b",si,  d, out);
        d = 8'b01001001;
        sh = 1'b0;
        shl = 1'b1;
        l = 1'b0;
        si = 1'b0;
        #16
        $display("SHIFT LEFT input is %b and output is %b", d, out);
        d = 8'b01011001;
        sh = 1'b1;
        shl = 1'b0;
        l = 1'b0;
        si = 1'b0;
        #16
        $display("SHIFT RIGHT si= %b input is %b and output is %b",si, d, out);
        d = 8'b01011001;
        sh = 1'b1;
        shl = 1'b0;
        l = 1'b0;
        si = 1'b1;
        #16
        $display("SHIFT RIGHT si= %b input is %b and output is %b",si, d, out);
        d = 8'b01001001;
        sh = 1'b0;
        shl = 1'b1;
        l = 1'b0;
        si = 1'b0;
        #16
        $display("SHIFT LEFT input is %b and output is %b", d, out);
        d = 8'b01001001;
        sh = 1'b0;
        shl = 1'b0;
        l = 1'b0;
        si = 1'b1;
        #16
        $display("NO CHANGE input is %b and output is %b", d, out);
        $finish;
    end
    initial
    begin
        $dumpfile("dump.vcd");
        $dumpvars;
    end
endmodule