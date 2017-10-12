interface register_if(input clk,
            input rst);
    logic [7:0] data;
    logic ena;
	logic [15:0] opc_iraddr;
	logic valid;
endinterface