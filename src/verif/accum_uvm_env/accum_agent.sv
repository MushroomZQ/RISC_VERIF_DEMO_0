class accum_agent extends uvm_agent;

    accum_sequencer acc_sqr;
    accum_driver acc_drv;
    accum_monitor acc_mon;

    `uvm_component_utils(accum_agent)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        acc_sqr = accum_sequencer::type_id::create("acc_sqr", this);
        acc_drv = accum_driver::type_id::create("acc_drv", this);
        acc_mon = accum_monitor::type_id::create("acc_mon", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        acc_drv.seq_item_port.connect(acc_sqr.seq_item_export);
    endfunction

endclass: accum_agent

