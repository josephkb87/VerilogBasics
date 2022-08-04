// Simulation for simple circuit  collection of waveforms
// We make a module circuit_with_delay_and_instantiate it
// stimulus signals are applied sequentially
// this results into colection of waveforms
module stimcrct;
    reg A,B,C; // reg keyword indicates that values are stored(driven)
    wire x,y;
    circuit_with_delay cwd(A,B,C,x,y);
    initial
        begin
            A = 1'b0; B = 1'b0; C = 1'b0;
            #100
                A = 1'b1; B = 1'b1; C = 1'b1;
            #100 $finish; // $finish indicates simulation should end
        end
endmodule
//Description of circuit with delay
// NOT synthesizable !
module circuit_with_delay (A,B,C,x,y);
    input A,B,C;
    output x,y;
    wire e;
    and #(30) g1(e,A,B);
    or #(20) g3(x,e,y);
    not #(10) g2(y,C);
endmodule