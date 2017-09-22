`include "../rtl/clk_gen.v"
`include "clk_gen_if.sv"

module clk_gen_tb_top;
    import uvm_pkg::*;

    clk_gen_if clk_gen_vif();

    clk_gen clk_gen(clk_gen_vif.clk, 
                    clk_gen_vif.reset,
                    clk_gen_vif.clk1,
                    clk_gen_vif.clk2, 
                    clk_gen_vif.clk4, 
                    clk_gen_vif.fetch, 
                    clk_gen_vif.alu_clk);

    initial begin
        $fsdbDumpfile("./test.fsdb");
        $fsdbDumpvars(0, clk_gen_tb_top);
    end

    initial begin
		//Registers the Interface in the configuration block so that other
		//blocks can use it
		uvm_resource_db#(virtual clk_gen_if)::set(.scope("ifs"), .name("clk_gen_if"), .val(clk_gen_vif));

		//Executes the test
		run_test();
	end

	//Variable initialization
	initial begin
	    clk_gen_vif.clk <= 1'b1;
		clk_gen_vif.reset <= 1'b0;
	end

	//Clock generation
	always
		#5 clk_gen_vif.clk = ~clk_gen_vif.clk;
		#20 clk_gen_vif.reset = 1'b1;
		#20 clk_gen_vif.reset = 1'b0;
endmodule

module register_tb_top;
    import uvm_pkg::*;

    register_if register_vif();

    register register(register_vif.ena, 
                      register_vif.clk1,
                      register_vif.rst,
                      register_vif.data1,
                      register_vif.opc_iraddr);

    initial begin
        $fsdbDumpfile("./test.fsdb");
        $fsdbDumpvars(0, clk_gen_tb_top);
    end

    initial begin
		//Registers the Interface in the configuration block so that other
		//blocks can use it
		uvm_resource_db#(virtual register_vif)::set(.scope("ifs"), .name("register_vif"), .val(register_vif));

		//Executes the test
		run_test();
	end

	//Variable initialization
	initial begin
	    register_vif.clk1 <= 1'b1;
		register_vif.rst <= 1'b0;
	end

	//Clock generation
	always
		#5 register_vif.clk = ~register_vif.clk;
		#20 register_vif.rst = 1'b1;
		#20 register_vif.rst = 1'b0;
endmodule
