class register_monitor extends uvm_monitor;
    `uvm_component_utils(common_monitor)

    uvm_analysis_port#(register_transaction) mon_pred_ap;
    uvm_analysis_port#(register_transaction) mon_scbd_ap;

    virtual register_if reg_vif;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        void'(uvm_resource_db#(virtual register_if)::read_by_name(.scope("ifs"), .name("register_if"), .val(reg_vif)));

        mon_pred_ap = new(.name("mon_pred_ap"), .parent(this));
        mon_scbd_ap = new(.name("mon_scbd_ap"), .parent(this));
    endfunction: build_phase

    task run_phase(uvm_phase phase);

    endtask: run_phase
endclass: register_monitor


