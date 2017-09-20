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
