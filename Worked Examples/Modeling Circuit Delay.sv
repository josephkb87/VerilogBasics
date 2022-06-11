// This is for simulation only (not for synthesis)
// ° Timescale directive indicates units of time for simulation
// ° ‘timescale 1ns / 100ps
// ° #(30) indicates an input to output delay for gate g1 of 30 ns
// ° #(10) indicates an input to output delay
// Description of circuit with delay

module circuit_with_delay (A,B,C,x,y);
    input A,B,C;
    output x,y;
    wire e;
    and #(30) g1(e,A,B);
    or #(20) g3(x,e,y);
    not #(10) g2(y,C);
endmodule