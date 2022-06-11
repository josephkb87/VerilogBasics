//dut= save in dut.v

module and_gate(out,a,b); // defining our output as out, and inputs as a & b

    input a,b; //inputs as a & b

    output out; //output as out

    assign out = a & b; //this assigns our output

    //and a1(out,a,b); for gate level abstraction

endmodule

// write the testbench or Simulation code

// testbench