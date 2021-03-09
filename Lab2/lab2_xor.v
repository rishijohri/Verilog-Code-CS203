module xor2 (
    out, in1, in2
);
    input in1, in2;
    output out;
    assign innot2 = ~in2 ;
    assign innot1 = ~in1 ;
    assign sum1 = in1 & innot2 ;
    assign sum2 = in2 & innot1 ;
    assign out = sum1 ^ sum2 ;

    
endmodule

module xor3 (
    out, in1, in2, in3
);
    input in1, in2, in3;
    output out ;
    wire inter ;
    xor2 oneg(.in1(in1), .in2(in2), .out(inter));
    xor2 twog(.in1(in3), .in2(inter), .out(out));
endmodule

module xor3_b (
    out, in1, in2, in3
);
    input in1, in2, in3;
    output out ;
    assign innot1 = ~in1;
    assign innot2 = ~in2;
    assign innot3 = ~in3;
    assign sum1 = innot1 & in2;
    assign sum2 = innot2 & in1;
    assign part1 = sum1 | sum2;
    assign partnot1 = ~part1;
    assign finsum1 = part1 & innot3 ;
    assign finsum2 = partnot1 & in3 ;
    assign out = finsum1 | finsum2 ;
endmodule
