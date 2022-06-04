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