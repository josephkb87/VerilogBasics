// This is where your design code will go
//SR flip flop
module SRFF(Q,Qbar,clk,S,R);
  output reg Q,Qbar;
  input S,R,clk;
  always @(posedge clk)
    begin
      if(S==1)  //Set state
        begin
          Q<=1;
          Qbar<=0;
        end
      else if(R==1)  //Reset State
        begin
          Q<=0;
          Qbar<=1;
        end
      else if(S==0 & R==0) //Memory state
        begin
          Q<=Q;
          Qbar<=Qbar;
        end
    end
endmodule