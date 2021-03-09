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
    reg out ;
    reg tem;
    reg tem2;
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
    in);
    input [3: 0] in ;
    output [3:0] out ;
    reg [15:0] configure ;
    assign out[0] = configure[0]&in[0] | configure[1]&in[1] | configure[2]&in[2] | configure[3]&in[3] ;
    assign out[1] = configure[4]&in[0] | configure[5]&in[1] | configure[6]&in[2] | configure[7]&in[3] ;
    assign out[2] = configure[8]&in[0] | configure[9]&in[1] | configure[10]&in[2] | configure[11]&in[3] ;
    assign out[3] = configure[12]&in[0] | configure[13]&in[1] | configure[14]&in[2] | configure[15]&in[3] ;

endmodule

