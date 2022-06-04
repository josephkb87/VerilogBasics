// We will look at Mealy vs Moore FSM
// Mealy FSM
// o/p based on present state & input
// o/p changes during transition THEREFORE not synchronised with clock and temporarily unstable clock

// Moore FSM
// O/P based on state only
//o/p is associtaed with state


// Sequence Detector: Verilog (Moore FSM)
// FSM Synthesis + Simulation
module seq3_detect_moore(x,clk, y);
// Moore machine for a three-1s sequence detection
    input x, clk;
    output y;
    reg [1:0] state;
    parameter S0=2'b00, S1=2'b01, S2=2'b10,
              S3=2'b11;
// Define the sequential block
    always @(posedge clk)
        case (state)
            S0: if (x) state <= S1;
            else state <= S0;
            S1: if (x) state <= S2;
            else state <= S0;
            S2: if (x) state <= S3;
            else state <= S0;
            S3: if (x) state <= S3;
            else state <= S0;
        endcase
// Define output during S3
    assign y = (state == S3);
endmodule

// Sequence Detector: Verilog (Mealy FSM)
// FSM Synthesis + Simulation
module seq3_detect_mealy(x,clk, y);
// Mealy machine for a three-1s sequence detection
    input x, clk;
    output y;
    reg y;
    reg [1:0] pstate, nstate; //present and next states
    parameter S0=2'b00, S1=2'b01, S2=2'b10, S3=2'b11;
// Next state and output combinational logic
// Use blocking assignments "="
    always @(x or pstate)
        case (pstate)
            S0: if (x) begin nstate = S1; y = 0; end
            else begin nstate = S0; y = 0; end
            S1: if (x) begin nstate = S2; y = 0; end
            else begin nstate = S0; y = 0; end
            S2: if (x) begin nstate = S3; y = 0; end
            else begin nstate = S0; y = 0; end
            S3: if (x) begin nstate = S3; y = 1; end
            else begin nstate = S0; y = 0; end
        endcase
// Sequential logic, use nonblocking assignments "<="
    always @(posedge clk)
        pstate <= nstate;
endmodule
