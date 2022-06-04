// We will look at how to model Sequential elements
// Using the D Latch to model Sequential elements
module D-latch (D, Clk, Q);
    input D, Clk;
    output Q;
    reg Q;
    always @(D or Clk)
        if (Clk)
            Q = D;
endmodule

// Using the D Flip Flop to model Sequential elements
module D-flipflop (D, Clk, Q);
    input D, Clk;
    output Q;
    reg Q;
    always @(posedge Clk)
        Q = D;
endmodule

// D Flip-flop with Reset

module dff_reset(D, Clock, Resetn, Q);
    input D, Clock, Resetn;
    output Q;
    reg Q;
    always @(negedge Resetn or posedge
        Clock)
        if (!Resetn)
            Q <= 0;
        else
            Q <= D;
endmodule

//Blocking Assignment (=)
// DFF-blocking
module DFF-blocking(D, Clock, Q1, Q2);
    input D, Clock;
    output Q1, Q2;
    reg Q1, Q2;
    always @(posedge Clock)
        begin
// blocking assignment – series
            execution
                Q1 = D;
            Q2 = Q1;
        end
endmodule

// Non-blocking Assignment (<=)
module DFF-non-blocking(D, Clock, Q1, Q2);
    input D, Clock;
    output Q1, Q2;
    reg Q1, Q2;
    always @(posedge Clock)
        begin
// non blocking assignment - can be done in
            parallel (or any order)
    Q1 <= D;
    Q2 <= Q1;
    end
endmodule