`timescale 1ns/1ps

`include "../testcase/testcase_pkg.sv"
`include "../rtl/risc_lit_top.v"

module top_tb;
    import register_uvm_env_pkg::*;
    import testcase_pkg::*;

    reg reset;
    reg clk;
    reg [(3*8):0] mnemonic; //array that holds 3 8-bit ASCII characters
    reg [12:0] PC_addr;
    reg [12:0] IR_addr;
    wire [7:0] data;
    wire [12:0] addr;
    wire rd,wr,halt,ram_sel,rom_sel;

    risc_top_if input_risc_top_if(.clk(clk),
                            .rst(reset)
                            );

    risc_top_if output_risc_top_if(.clk(clk),
                            .rst(reset)
                            );

    risc_lit_top t_cpu ( .clk(clk),
                .reset(reset),
                .halt(output_risc_top_if.halt),
                .rd(output_risc_top_if.rd),
                .wr(output_risc_top_if.wr),
                .addr(output_risc_top_if.addr),
                .rom_in(input_risc_top_if.rom_in),
                .ram_in(input_risc_top_if.ram_in),
                .ram_out(output_risc_top_if.ram_out)
                );

    /*ram t_ram ( .addr(addr[9:0]),
                .read(rd),
                .write(wr),
                .ena(ram_sel),
                .data(data)
                );

    rom t_rom ( .addr(addr),
                .read(rd),
                .ena(rom_sel),
                .data(data)
                );

    addr_decode t_addr_decode ( .addr(addr),
                                .ram_sel(ram_sel),
                                .rom_sel(rom_sel)
                                );*/

    initial begin
        $fsdbDumpfile("./test.fsdb");
        $fsdbDumpvars(0, top_tb);
    end

    initial begin
        uvm_config_db#(virtual risc_top_if)::set(uvm_root::get(), "", "input_risc_top_if", input_risc_top_if);
        uvm_config_db#(virtual risc_top_if)::set(uvm_root::get(), "", "output_risc_top_if", output_risc_top_if);
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

