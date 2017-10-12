class register_sequencer extends uvm_sequencer#(register_transaction);

    `uvm_component_utils(register_sequencer)


    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction 

endclass: register_sequencer