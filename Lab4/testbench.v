module testbench(
);
    reg clock = 1'b0;
    reg in1 ,in2, in3, in4, in5;
    wire out;
    wire [3:0] out2;
    reg [3:0] in ;
    
    always #10 clock = ~clock ;
    logic_tile tile(out, clock, in1, in2, in3, in4, in5);
    switch_box_4x4 switch(out2, in);
    reg [31:0] tb_mem [0:2];
    initial begin
        $readmemh("info.mem", tb_mem);
        switch.configure[15:0] = tb_mem[2];
        tile.mem[32] = tb_mem[1];
        tile.mem[31:0] = tb_mem[0];
    end
    initial begin
        in1 = 1'b1;
        in2 = 1'b1;
        in3 = 1'b1;
        in4 = 1'b1;
        in5 = 1'b1;
        #16
        $display("output LT is %b", out);
        in1 = 1'b0;
        in2 = 1'b0;
        in3 = 1'b0;
        in4 = 1'b0;
        in5 = 1'b0;
        #16
        $display("output LT is %b", out);
        in1 = 1'b0;
        in2 = 1'b0;
        in3 = 1'b1;
        in4 = 1'b0;
        in5 = 1'b1;
        #16
        $display("output LT is %b", out); 
        in = 4'b1010;
        #10
        $display("output switch is %b", out2);
        in = 4'b1000;
        #10
        $display("output switch is %b", out2);
        in = 4'b1011;
        #10
        $display("output switch is %b", out2);
        in = 4'b0010;
        #10
        $display("output switch is %b", out2);
        $finish;
    end
    initial
    begin
        $dumpfile("dump.vcd");
        $dumpvars;
    end
endmodule