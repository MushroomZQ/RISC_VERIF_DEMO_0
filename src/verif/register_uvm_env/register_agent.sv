class register_agent extends uvm_agent;

    register_sequencer reg_sqr;
    register_driver reg_drv;
    register_monitor reg_mon;

    `uvm_component_utils(register_agent)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        reg_sqr = register_sequencer::type_id::create("reg_sqr", this);
        reg_drv = register_driver::type_id::create("reg_drv", this);
        reg_mon = register_monitor::type_id::create("reg_mon", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        reg_drv.seq_item_port.connect(reg_sqr.seq_item_export);
    endfunction

endclass: register_agent

