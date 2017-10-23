class top_sequencer extends uvm_sequencer#(top_rom_ram_in);

    `uvm_component_utils(top_sequencer)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction 

endclass: top_sequencer
