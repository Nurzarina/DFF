module DFF (
    input wire clk,
    input wire reset,
    input wire d,
    output reg q
);

always @(posedge clk or posedge reset) begin
    if (reset) begin
        q <= 1'b0;          // Initialize q to 0 on reset
    end else begin
        q <= d;             // Otherwise, capture data on rising edge of clock
    end
end
endmodule
