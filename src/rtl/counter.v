module counter (pc_addr,
                ir_addr,
                load,
                clock,
                rst
                );

    input [12:0] pc_addr;
    input        load;
    input        clock;
    input        rst;

    output [12:0] pc_addr;

    reg [12:0] pc_addr;

    always @(posedge clock or posedge rst) begin
        if(rst) 
            pc_addr <= 13'b0_0000_0000_0000;
        else if(load)
            pc_addr <= ir_addr;
        else
            pc_addr <= pc_addr+1;
    end

endmodule
