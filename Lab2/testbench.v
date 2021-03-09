module testBench (
);
    reg rin1, rin2, rin3, rinb1, rinb2, rinb3;
    wire wout, woutb;
    xor3_b ha_inst3(.in1(rinb1), .in2(rinb2), .in3(rinb3), .out(woutb));
    xor3 ha_inst2(.in1(rin1), .in2(rin2), .in3(rin3), .out(wout));
    initial begin
        rinb1 = 1'b0 ; rinb2 = 1'b0; rinb3 = 1'b0 ;
        #10
        $display("xor3_b output is %b from input %b and %b and %b", woutb, rinb1, rinb2, rinb3);
        rinb1 = 1'b0 ; rinb2 = 1'b1; rinb3 = 1'b0 ;
        #10
        $display("xor3_b output is %b from input %b and %b and %b", woutb, rinb1, rinb2, rinb3);
        rinb1 = 1'b0 ; rinb2 = 1'b0; rinb3 = 1'b1 ;
        #10
        $display("xor3_b output is %b from input %b and %b and %b", woutb, rinb1, rinb2, rinb3);
        rinb1 = 1'b1 ; rinb2 = 1'b0; rinb3 = 1'b0 ;
        #10
        $display("xor3_b output is %b from input %b and %b and %b", woutb, rinb1, rinb2, rinb3);
        rinb1 = 1'b1 ; rinb2 = 1'b1; rinb3 = 1'b0 ;
        #10
        $display("xor3_b output is %b from input %b and %b and %b", woutb, rinb1, rinb2, rinb3);
        rinb1 = 1'b0 ; rinb2 = 1'b1; rinb3 = 1'b1 ;
        #10
        $display("xor3_b output is %b from input %b and %b and %b", woutb, rinb1, rinb2, rinb3);
        rinb1 = 1'b1 ; rinb2 = 1'b0; rinb3 = 1'b1 ;
        #10
        $display("xor3_b output is %b from input %b and %b and %b", woutb, rinb1, rinb2, rinb3);
        rinb1 = 1'b1 ; rinb2 = 1'b1; rinb3 = 1'b1 ;
        #10
        $display("xor3_b output is %b from input %b and %b and %b", woutb, rinb1, rinb2, rinb3);
    end
    initial begin
        rin1 = 1'b0 ; rin2 = 1'b0; rin3 = 1'b0 ;
        #10
        $display("output is %b from input %b and %b and %b", wout, rin1, rin2, rin3);
        rin1 = 1'b0 ; rin2 = 1'b1; rin3 = 1'b0 ;
        #10
        $display("output is %b from input %b and %b and %b", wout, rin1, rin2, rin3);
        rin1 = 1'b0 ; rin2 = 1'b0; rin3 = 1'b1 ;
        #10
        $display("output is %b from input %b and %b and %b", wout, rin1, rin2, rin3);
        rin1 = 1'b1 ; rin2 = 1'b0; rin3 = 1'b0 ;
        #10
        $display("output is %b from input %b and %b and %b", wout, rin1, rin2, rin3);
        rin1 = 1'b1 ; rin2 = 1'b1; rin3 = 1'b0 ;
        #10
        $display("output is %b from input %b and %b and %b", wout, rin1, rin2, rin3);
        rin1 = 1'b0 ; rin2 = 1'b1; rin3 = 1'b1 ;
        #10
        $display("output is %b from input %b and %b and %b", wout, rin1, rin2, rin3);
        rin1 = 1'b1 ; rin2 = 1'b0; rin3 = 1'b1 ;
        #10
        $display("output is %b from input %b and %b and %b", wout, rin1, rin2, rin3);
        rin1 = 1'b1 ; rin2 = 1'b1; rin3 = 1'b1 ;
        #10
        $display("output is %b from input %b and %b and %b", wout, rin1, rin2, rin3);
    end
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
    end
endmodule

