module clk_gen(clk, reset, clk1, clk2, clk4, fetch, alu_clk);
    input clk; 
    input reset;
    output clk1; 
    output clk2;
    output clk4; 
    output fetch; 
    output alu_clk;

    wire clk;
    wire reset;

    reg clk2;
    reg clk4;
    reg fetch;
    reg alu_clk;

    reg [7:0] state;

    parameter   S1 = 8'b00000001,
                S2 = 8'b00000010,
                S3 = 8'b00000100,
                S4 = 8'b00001000,
                S5 = 8'b00010000,
                S6 = 8'b00100000,
                S7 = 8'b01000000,
                S8 = 8'b10000000,
                idle = 8'b00000000;

    assign clk1 = ~clk;

    always@(negedge clk) 
        if (reset) begin
            clk2 <= 0;
            clk4 <= 1;
            fetch <= 0;
            alu_clk <= 0;
            state <= idle;
        end
        else begin
            case(state)
                S1: begin
                    clk2 <= ~clk2;
                    alu_clk <= ~alu_clk;
                    state <= S2;
                end
                S2: begin
                    clk2 <= ~clk2;
                    clk4 <= ~clk4;
                    alu_clk <= ~alu_clk;
                    state <= S3;
                end
                S3: begin
                    clk2 <= ~clk2;
                    state <= S4;
                end
                S4: begin
                    clk2 <= ~clk2;
                    clk4 <= ~clk4;
                    fetch <= ~fetch;
                    state <= S5;
                end
                S5: begin
                    clk2 <= ~clk2;
                    state <= S6;
                end
                S6: begin
                    clk2 <= ~clk2;
                    clk4 <= ~clk4;
                    state <= S7;
                end
                S7: begin
                    clk2 <= ~clk2;
                    state <= S8;
                end
                S8: begin
                    clk2 <= ~clk2;
                    clk4 <= ~clk4;
                    fetch <= ~fetch;
                    state <= S1;
                end
                idle: state <= S1;
                default: state <= idle;
            endcase
        end
endmodule