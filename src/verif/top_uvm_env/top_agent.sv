class top_agent extends uvm_agent;

    top_sequencer top_sqr;
    top_driver top_drv;
    top_monitor top_mon;

    `uvm_component_utils(top_agent)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        top_sqr = top_sequencer::type_id::create("top_sqr", this);
        top_drv = top_driver::type_id::create("top_drv", this);
        top_mon = top_monitor::type_id::create("top_mon", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        top_drv.seq_item_port.connect(top_sqr.seq_item_export);
    endfunction

endclass: top_agent

