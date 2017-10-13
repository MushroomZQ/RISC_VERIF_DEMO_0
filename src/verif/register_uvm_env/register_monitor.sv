class register_monitor extends uvm_monitor;

    virtual register_output_if reg_output_if;
    virtual register_input_if reg_input_if;

    uvm_analysis_port#(register_transaction_in) mon_pred_ap;
    uvm_analysis_port#(register_transaction_out) mon_scbd_ap;

    `uvm_component_utils(register_monitor)

    function new(string name = "register_monitor", uvm_component parent = null);
        super.new(name, parent);
        mon_pred_ap = new("mon_pred_ap", this);
        mon_scbd_ap = new("mon_scbd_ap", this);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(virtual register_output_if)::get(uvm_root::get(), "", "reg_output_if", reg_output_if))
            `uvm_fatal("register_driver", "virtual interface must be set for vif");
        if(!uvm_config_db#(virtual register_input_if)::get(uvm_root::get(), "", "reg_input_if", reg_input_if))
            `uvm_fatal("register_driver", "virtual interface must be set for vif");
    endfunction

    task run_phase(uvm_phase phase);
        fork
            collect_input_trans();
            collect_output_trans();
        join
    endtask

    virtual task collect_input_trans();

        register_transaction_in reg_trans;

        forever begin
            reg_trans = new();
            if(reg_input_if.rst) begin
                @(negedge reg_input_if.rst);
            end
            @(posedge reg_input_if.valid);
            //if (reg_input_if.valid) begin
			    reg_trans.ena = reg_input_if.valid;
                reg_trans.data = reg_input_if.data;

                mon_pred_ap.write(reg_trans);
            //end
        end
    endtask

    virtual task collect_output_trans();

        register_transaction_out reg_trans;

        forever begin
            reg_trans = new();
            if(reg_output_if.rst) begin
                @(negedge reg_output_if.rst);
            end
            @(posedge reg_output_if.clk);
			if(reg_output_if.valid) begin
				reg_trans.opc_iraddr = reg_output_if.opc_iraddr;
				reg_trans.valid = reg_output_if.valid;

				mon_scbd_ap.write(reg_trans);
			end
        end
    endtask
endclass: register_monitor
