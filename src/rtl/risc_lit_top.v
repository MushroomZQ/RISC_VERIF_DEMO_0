`include "clk_gen.v"
`include "register.v"
`include "accum.v"
`include "alu.v"
`include "datactl.v"
`include "adr.v"
`include "counter.v"
`include "machinectl.v"
`include "machine.v"

module risc_lit_top(clk,
                    reset,
                    halt,
                    rd,
                    wr,
                    addr,
                    rom_in,
                    ram_in,
                    ram_out
                    );

    input clk;
    input reset;

    output rd;
    output wr;
    output [12:0] addr;
    output halt;

    input [7:0] rom_in;
    input [7:0] ram_in;
    output [7:0] ram_out;

    wire clk;
    wire reset;

    wire rd;
    wire wr;
    wire addr;
    wire halt;
    wire [7:0] rom_in;
    wire [7:0] ram_in;
    wire [7:0] ram_out;

    wire [12:0] addr;
    wire clk1;
    wire fetch;
    wire alu_clk;
    wire [2:0] opcode;
    wire [12:0] ir_addr;
    wire [12:0] pc_addr;
    wire [7:0] alu_out;
    wire [7:0] accum;
    wire zero;
    wire inc_pc;
    wire load_acc;
    wire load_ir;
    wire data_ena;
    wire contr_ena;

    clk_gen m_clk_gen ( .clk(clk),
                        .clk1(clk1),
                        .fetch(fetch),
                        .alu_clk(alu_clk),
                        .reset(reset)
                        );

    register m_register(.data(rom_in),
                        .ena(load_ir),
                        .rst(reset),
                        .clk1(clk1),
                        .opc_iraddr({opcode,ir_addr})
                        );

    accum m_accum ( .data(alu_out),
                    .ena(load_acc),
                    .clk1(clk1),
                    .rst(reset),
                    .accum(accum)
                    );

    alu m_alu ( .data(ram_in),
                .accum(accum),
                .alu_clk(alu_clk),
                .opcode(opcode),
                .alu_out(alu_out),
                .zero(zero)
                );

    machinect1 m_machinec1( .ena(contr_ena),
                            .fetch(fetch),
                            .rst(reset)
                            );

    machine m_machine ( .inc_pc(inc_pc),
                        .load_acc(load_acc),
                        .load_pc(load_pc),
                        .rd(rd),
                        .wr(wr),
                        .load_ir(load_ir),
                        .clk1(clk1),
                        .datactl_ena(data_ena),
                        .halt(halt),
                        .zero(zero),
                        .ena(contr_ena),
                        .opcode(opcode)
                        );

    datactl m_datactl ( .in(alu_out),
                        .data_ena(data_ena),
                        .data(ram_out)
                        );

    adr m_adr ( .fetch(fetch),
                .ir_addr(ir_addr),
                .pc_addr(pc_addr),
                .addr(addr)
                );

    counter m_counter ( .ir_addr(ir_addr),
                        .load(load_pc),
                        .clock(inc_pc),
                        .rst(reset),
                        .pc_addr(pc_addr)
                        );

endmodule


