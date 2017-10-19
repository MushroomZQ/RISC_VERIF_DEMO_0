module machinectl(ena,
                fetch,
                rst
                );

    input fetch;
    input rst;
    output ena;
    reg ena;

    always@(posedge fetch or posedge rst) begin
        if(rst)
            ena <= 0;
        else
            ena <= 1;
    end

endmodule
