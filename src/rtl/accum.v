module accum(accum,
            data,
            ena,
            valid,
            clk1,
            rst
            );

    input clk1;
    input rst;
    input ena;
    input [7:0] data;

    output [7:0] accum;
    output valid;

    reg [7:0] accum;
    reg valid;

    always@(posedge clk1) begin
        if(rst) begin
            accum <= 8'b00000000;
            valid <= 1'b0;
        end
        else if(ena) begin
            accum <= data;
            valid <= 1'b1;
        end
    end

endmodule
