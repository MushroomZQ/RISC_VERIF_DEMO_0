`timescale 1ns/1ps

`include "common_pkg.sv"
`include "../rtl/register.v"
`include "../rtl/clk_gen.v"

module top_tb;
    import common_exe_pkg::*;

    reg clk;
    reg reset;

	reg clk2;
	reg clk4;
	reg fetch;
	reg alu_clk;

	reg [15:0] opc_iraddr;

	wire ena;
	wire clk1;
	wire [7:0] data;

    register_input_if reg_input_if(.clk(clk1), 
							.rst(reset)
							);
    register_output_if reg_output_if(.clk(clk1), 
							.rst(reset)
							);

	clk_gen clk_gen_imp(.clk(clk),
						.reset(reset),
						.clk1(clk1),
						.clk2(clk2),
						.clk4(clk4),
						.fetch(fetch),
						.alu_clk(alu_clk)
						);

	register register_imp(.clk1(clk1),
						  .rst(reset),
						  .ena(reg_input_if.valid),
						  .data(reg_input_if.data),
						  .opc_iraddr(reg_output_if.opc_iraddr),
                          .valid(reg_output_if.valid)
						);

    initial begin
        $fsdbDumpfile("./test.fsdb");
        $fsdbDumpvars(0, top_tb);
    end

    initial begin
        uvm_config_db#(virtual register_input_if)::set(uvm_root::get(), "", "reg_input_if", reg_input_if);
        uvm_config_db#(virtual register_output_if)::set(uvm_root::get(), "", "reg_output_if", reg_output_if);
    end

    initial begin
        run_test();
    end

    //assign reg_input_if.clk = clk1;
    //assign reg_input_if.rst = reset;

    //assign reg_output_if.clk = clk1;
    //assign reg_output_if.rst = reset;

    initial begin
        clk <= 1'b0;
        reset <= 1'b0;
        forever begin
            #5 clk <= ~clk;
        end
    end

    initial begin
        #100;
        reset = 1'b1;
        #20;
        reset = 1'b0;
    end

endmodule

