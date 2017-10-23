interface risc_top_if ( input clk,
                        input rst);
    logic halt;
    logic rd;
    logic wr;
    logic [12:0] addr;
    logic [7:0] rom_in;
    logic [7:0] ram_in;
    logic [7:0] ram_out;
endinterface

interface ram_if();
    logic [9:0] addr;
    logic read;
    logic write;
    logic ena;
    logic [7:0] data;
endinterface

interface rom_if();
    logic [12:0] addr;
    logic read;
    logic ena;
    logic [7:0] data;
endinterface

interface addr_decode_if();
    logic [12:0] addr;
    logic rom_sel;
    logic ram_sel;
endinterface

