class top_rom_ram_in extends uvm_sequence_item;
    rand bit [7:0] data;
    bit source;//0: rom, 1: ram;

    `uvm_object_utils_begin(top_rom_ram_in)
        `uvm_field_int(data, UVM_ALL_ON)
        `uvm_field_int(source, UVM_ALL_ON | UVM_NOCOMPARE)
    `uvm_object_utils_end

    function new(string name = "top_rom_ram_in");
        super.new(name);
        source = 1'bx;
    endfunction

endclass: top_rom_ram_in

/*class top_ram_in extends uvm_sequence_item;
    rand bit [7:0] data;

    `uvm_object_utils_begin(top_ram_in)
        `uvm_field_int(data, UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name = "top_ram_in");
        super.new(name);
    endfunction

endclass: top_ram_in*/

class top_risc_out extends uvm_sequence_item;

	bit wr;
    bit rd;
    bit halt;
    bit [7:0] ram_out;
    bit [12:0] addr;

    `uvm_object_utils_begin(top_risc_out)
        `uvm_field_int(wr, UVM_ALL_ON)
        `uvm_field_int(rd, UVM_ALL_ON)
        `uvm_field_int(halt, UVM_ALL_ON)
        `uvm_field_int(ram_out, UVM_ALL_ON)
        `uvm_field_int(addr, UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name = "top_risc_out");
        super.new(name);
		wr = 0;
        rd = 0;
        halt = 0;
        ram_out = 8'bxxxx_xxxx;
        addr = 13'bx_xxxx_xxxx;
    endfunction

endclass: top_risc_out

