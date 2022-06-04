/dut= save in dut.v

module and_gate(out,a,b);

   input a,b;

   output out;

   assign out = a & b;

   //and a1(out,a,b); for gate level abstraction

endmodule