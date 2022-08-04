// This is where the testbench code will go
// or browse Examples
module srff_tb();
  wire Q,Qbar;
  reg S,R,clk;
  SRFF sr1(Q,Qbar,clk,S,R);
  //clock
  initial begin
    clk=0;
    repeat(50)
      #1 clk=~clk;
  end
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(1);
      S=1;R=0;
      #10 S=0;R=0;
      #10 S=0;R=1;
        #10 S=1;R=0;
        #10 S=1;R=1;
        $finish
    end
    initial
    begin
    $dumpfile("BasicDesignExamples.vcd");
    $dumpvars(1);
    S=1;R=0;
    #10 S=0;R=0;
    #10 S=0;R=1;
    #10 S=1;R=0;
    #10 S=1;R=1;
    $finish
    end

endmodule