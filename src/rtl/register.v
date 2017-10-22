module register(input       ena,//input valid
                input       clk1,
                input       rst,
                input [7:0] data,
                output[15:0] opc_iraddr
				//output      valid//output valid
                );

    reg [15:0]  opc_iraddr;
    reg         state;
	//reg			valid;

    always@(posedge clk1) begin
        if(rst) begin
            opc_iraddr <= 16'b0000000000000000;
            state <= 1'b0;
			//valid <= 1'b0;
        end
        else begin
            if(ena) begin
                case(state)
                    1'b0: begin
                        opc_iraddr[15:8] <= data;
                        state <= 1;
						//valid <= 1'b1;
                    end
                    1'b1: begin
                        opc_iraddr[7:0] <= data;
                        state <= 0;
						//valid <= 1'b1;
                    end
                    default: begin
                        opc_iraddr[15:0] <= 16'bxxxxxxxxxxxxxxxx;
                        state <= 1'bx;
						//valid <= 1'b0;
                    end
                endcase
            end
            else begin
                state <= 1'b0;
				//valid <= 1'b0;
            end
        end
    end
endmodule
