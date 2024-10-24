// Testbench for D Flip Flop

module DFF_tb;

    // Inputs
    reg clk;
    reg reset;
    reg d;

    // Output
    wire q;

    // Instantiate the D Flip Flop
    DFF uut (
        .clk(clk),
        .reset(reset),
        .d(d),
        .q(q)
    );

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    // Testbench logic
    initial begin
        // Initialize inputs
        clk = 0;
        reset = 0;
        d = 0;

        // Test Case 1 : Reset the flip-flop
        reset = 1;
        #10;
        reset = 0;

        // Test Case 2: Set D to 1, expect Q to follow D
        d = 1;
        #10;

        // Test Case 3: Set D to 0, expect Q to follow D
        d = 0;
        #10;

        // Test Case 4: Activate reset during operation
        d = 1;
        #5 reset = 1;
        #5 reset = 0;

        // Test Case 5: Another D input change
        d = 1;
        #10;

        $finish;
    end

    // Monitor signals during simulation & dump waveforms for analysis in GTKWave
    initial begin
        $monitor("At time %t, clk=%b, reset%b, d=%b, q=%b", $time, clk, reset, d, q);
        $dumpfile("DFF_tb.vcd");
        $dumpvars(0,DFF_tb);
    end

endmodule
