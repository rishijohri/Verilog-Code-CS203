module testbench (
);
    reg[15:0] rin1; 
    reg[15:0] rin2;
    reg rin3;
    wire[15:0] wout;
    wire o;
    reg[15:0] rinb1; 
    reg[15:0] rinb2;
    reg rinb3;
    wire[15:0] woutb;
    wire ob;
    add16_cla full(wout, o, rin1, rin2, rin3);
    add16_rc long(woutb, ob, rinb1, rinb2, rinb3);
    initial begin
        rin1 = 16'b0000000000000000; 
        rin2 = 16'b0000000000000000;
        rin3 = 1'b0;
        #10
        $display("sum : %b  cout : %b  input1: %b  input2: %b  cin: %b", wout, o, rin1, rin2, rin3);
        rin1 = 16'b0000000000000000; 
        rin2 = 16'b0000000000000000;
        rin3 = 1'b1;
        #10
        $display("sum : %b  cout : %b  input1: %b  input2: %b  cin: %b", wout, o, rin1, rin2, rin3);
        rin1 = 16'b1111111111111111; 
        rin2 = 16'b0000000000000001;
        rin3 = 1'b0;
        #10
        $display("sum : %b  cout : %b  input1: %b  input2: %b  cin: %b", wout, o, rin1, rin2, rin3);
        rin1 = 16'b0011111000000000; 
        rin2 = 16'b0000111110000000;
        rin3 = 1'b0;
        #10
        $display("sum : %b  cout : %b  input1: %b  input2: %b  cin: %b", wout, o, rin1, rin2, rin3);
        rin1 = 16'b1100000000011100; 
        rin2 = 16'b0000011110000000;
        rin3 = 1'b0;
        #10
        $display("sum : %b  cout : %b  input1: %b  input2: %b  cin: %b", wout, o, rin1, rin2, rin3);
        rin1 = 16'b0000000000000000; 
        rin2 = 16'b0000000000000000;
        rin3 = 1'b0;
        #10
        $display("sum : %b  cout : %b  input1: %b  input2: %b  cin: %b", wout, o, rin1, rin2, rin3);
        rin1 = 16'b1111111111111111; 
        rin2 = 16'b1111111111111111;
        rin3 = 1'b0;
        #10
        $display("sum : %b  cout : %b  input1: %b  input2: %b  cin: %b", wout, o, rin1, rin2, rin3);
        rin1 = 16'b1010101010101010; 
        rin2 = 16'b0000000000000001;
        rin3 = 1'b1;
        #10
        $display("sum : %b  cout : %b  input1: %b  input2: %b  cin: %b", wout, o, rin1, rin2, rin3);
    end
    initial begin
        rinb1 = 16'b0000000000000000; 
        rinb2 = 16'b0000000000000000;
        rinb3 = 1'b0;
        #10
        $display("RC sum : %b  cout : %b  input1: %b  input2: %b  cin: %b", woutb, ob, rinb1, rinb2, rinb3);
        rinb1 = 16'b0000000000000000; 
        rinb2 = 16'b0000000000000000;
        rinb3 = 1'b1;
        #10
        $display("RC sum : %b  cout : %b  input1: %b  input2: %b  cin: %b", woutb, ob, rinb1, rinb2, rinb3);
        rinb1 = 16'b1111111111111111; 
        rinb2 = 16'b0000000000000001;
        rinb3 = 1'b0;
        #10
        $display("RC sum : %b  cout : %b  input1: %b  input2: %b  cin: %b", woutb, ob, rinb1, rinb2, rinb3);
        rinb1 = 16'b0011111000000000; 
        rinb2 = 16'b0000111110000000;
        rinb3 = 1'b0;
        #10
        $display("RC sum : %b  cout : %b  input1: %b  input2: %b  cin: %b", woutb, ob, rinb1, rinb2, rinb3);
        rinb1 = 16'b1100000000011100; 
        rinb2 = 16'b0000011110000000;
        rinb3 = 1'b0;
        #10
        $display("RC sum : %b  cout : %b  input1: %b  input2: %b  cin: %b", woutb, ob, rinb1, rinb2, rinb3);
        rinb1 = 16'b0000000000000000; 
        rinb2 = 16'b0000000000000000;
        rinb3 = 1'b0;
        #10
        $display("RC sum : %b  cout : %b  input1: %b  input2: %b  cin: %b", woutb, ob, rinb1, rinb2, rinb3);
        rinb1 = 16'b1111111111111111; 
        rinb2 = 16'b1111111111111111;
        rinb3 = 1'b0;
        #10
        $display("RC sum : %b  cout : %b  input1: %b  input2: %b  cin: %b", woutb, ob, rinb1, rinb2, rinb3);
        rinb1 = 16'b1010101010101010; 
        rinb2 = 16'b0000000000000001;
        rinb3 = 1'b1;
        #10
        $display("RC sum : %b  cout : %b  input1: %b  input2: %b  cin: %b", woutb, ob, rinb1, rinb2, rinb3);
    end
    initial
    begin
        $dumpfile("dump.vcd");
        $dumpvars;
    end
endmodule