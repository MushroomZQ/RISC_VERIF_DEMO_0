interface register_input_if(input clk,
            input rst);
    logic [7:0] data;
	logic valid;
endinterface

interface register_output_if(input clk,
            input rst);
	logic [15:0] opc_iraddr;
	//logic valid;
endinterface
