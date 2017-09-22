interface clk_gen_if;
    //input signals
    logic clk; 
    logic reset; 
    
    //output signals
    logic clk1;
    logic clk2; 
    logic clk4; 
    logic fetch; 
    logic alu_clk;
endinterface: clk_gen_if

interface register_if;
    //input signals
    logic ena; 
    logic clk1;
    logic rst;
    logic [7:0] data;
    
    //output signals
    logic [15:0] opc_iraddr;
endinterface: register_if
