class accum_sequencer extends uvm_sequencer#(accum_transaction);

    `uvm_component_utils(accum_sequencer)


    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction 

endclass: accum_sequencer
