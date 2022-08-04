// Synthesizable Combinational logic vs Sequential logic
// Combinational logic
// Observation
wire A_in, B_in, C_in;
reg A_out, B_out, C_out;
always @( posedge clk ) // non blocking assignments
    begin
        A_out <= A_in; // <= is block wih default value to avoid inadvertent introduction of latches
        B_out <= B_in; //
        C_out <= C_in;
    end
assign B_in = A_out + 1; // continous assignments
assign C_in = B_out + 1;

// Sequential logic
wire A_in, B_in, C_in;
reg A_out, B_out, C_out;
always @( posedge clk )
    begin
        A_out <= A_in;
        B_out <= A_out + 1;
        C_out <= B_out + 1;
    end