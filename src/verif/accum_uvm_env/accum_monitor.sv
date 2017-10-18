class accum_monitor extends uvm_monitor;

    virtual accum_if acc_output_if;
    virtual accum_if acc_input_if;

    uvm_analysis_port#(accum_transaction) mon_pred_ap;
    uvm_analysis_port#(accum_transaction) mon_scbd_ap;

    `uvm_component_utils(accum_monitor)

    function new(string name = "accum_monitor", uvm_component parent = null);
        super.new(name, parent);
        mon_pred_ap = new("mon_pred_ap", this);
        mon_scbd_ap = new("mon_scbd_ap", this);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(virtual accum_if)::get(uvm_root::get(), "", "acc_output_if", acc_output_if))
            `uvm_fatal("accum_driver", "virtual interface must be set for vif");
        if(!uvm_config_db#(virtual accum_if)::get(uvm_root::get(), "", "acc_input_if", acc_input_if))
            `uvm_fatal("accum_driver", "virtual interface must be set for vif");
    endfunction

    task run_phase(uvm_phase phase);
        fork
            collect_input_trans();
            collect_output_trans();
        join
    endtask

    virtual task collect_input_trans();

        accum_transaction acc_trans;

        forever begin
            acc_trans = new();
            if(acc_input_if.rst) begin
                @(negedge acc_input_if.rst);
            end
            @(posedge acc_input_if.valid);
            acc_trans.data = acc_input_if.data;

            mon_pred_ap.write(acc_trans);
        end
    endtask

    virtual task collect_output_trans();

        accum_transaction acc_trans;

        forever begin
            acc_trans = new();
            if(acc_output_if.rst) begin
                @(negedge acc_output_if.rst);
            end
            @(posedge acc_output_if.valid);
            acc_trans.data = acc_output_if.data;

            mon_scbd_ap.write(acc_trans);
        end
    endtask

endclass: accum_monitor
