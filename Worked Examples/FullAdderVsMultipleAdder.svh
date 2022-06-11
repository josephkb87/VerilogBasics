// Full Adder Implementation
module FullAdder(a,b,cin,cout,sum);
    input a, b, cin; // inputs
    output cout, sum; // output
    wire w1, w2, w3, w4; // internal nets
    xor #(10) (w1, a, b); // delay time of 10 units
    xor #(10) (sum, w1, cin);
    and #(8) (w2, a, b);
    and #(8) (w3, a, cin);
    and #(8) (w4, b, cin);
    or #(10, 8)(cout, w2, w3, w4); // (rise time of 10, fall 8)
endmodule

// Multiple ways of implementing Full Adder
module FullAdder2(a,b,cin,sum,cout);
    input a,b,cin;
    output sum, cout;
    reg sum, cout; // registers retain value
    always @ (a or b or cin) // Anytime a or b or cin CHANGE, run the process
    begin sum <= a ^ b ^ cin;
    cout <= (a & b) | (a & cin) | (b & cin);
end
endmodule

// Ripple Carry Adder for 4-bit Adder
module adder4(A, B, cin, S, cout);
input[3:0] A, B;
input cin;
output[3:0] S;
output cout;
wire c1, c2, c3;
// 4 instantiated 1-bit Full Adders
FullAdder fa0(A[0], B[0], cin, c1, S[0]);
FullAdder fa1(A[1], B[1], c1, c2, S[1]);
FullAdder fa2(A[2], B[2], c2, c3, S[2]);
FullAdder fa3(A[3], B[3], c3, cout, S[3]);
endmodule

// Specifying Boolean Expressions
//Circuit specified with Boolean equations//
module circuit_bln (x,y,A,B,C,D);
input A,B,C,D;
output x,y;
assign x = A | (B & C) | (~B & C);
assign y = (~B & C) | (B & ~C & ~D);
endmodule

// User Defined Primitives
//User defined primitive(UDP)
primitive crctp (x,A,B,C);
    output x;
    input A,B,C;
//Truth table for x(A,B,C) = Minterms (0,2,4,6,7)
    table
// A B C : x (Note that this is only a comment)
        0 0 0 : 1;
        0 0 1 : 0;
        0 1 0 : 1;
        0 1 1 : 0;
        1 0 0 : 1;
        1 0 1 : 0;
        1 1 0 : 1;
        1 1 1 : 1;
    endtable   // Allows definition of truth table
endprimitive   // Only one output is allowed

// DataFow Description of a 2-to-4 line-decoder
//Dataflow description of a 2-to-4-line decoder
    module decoder_df (A,B,E,D);
input A,B,E;
output [0:3] D;
assign D[0] = ~(~A & ~B & ~E),
    D[1] = ~(~A & B & ~E),
    D[2] = ~(A & ~B & ~E),
    D[3] = ~(A & B & ~E);
endmodule

// Dataflow description of a 4bit comparator
module mag_comp (A,B,ALTB,AGTB,AEQB);
    input [3:0] A,B;
    output ALTB,AGTB,AEQB;
    assign ALTB = (A < B),
        AGTB = (A > B),
        AEQB = (A == B);
endmodule

//Behavioral description of 2-to-1-line multiplexer
module mux2x1_bh(A,B,select,OUT);
    input A,B,select;
    output OUT;
    reg OUT;
    always @ (select or A or B) // always keyword used to indicate action based on variable change
                                //Conditional statements (if, else) allow for output choices
                                // Generally conditional statements lead to multiplexers
        if (select == 1) OUT = A;
        else OUT = B;
endmodule