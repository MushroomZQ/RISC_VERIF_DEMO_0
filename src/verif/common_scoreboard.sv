class register_scoreboard extends uvm_scoreboard;
    register_transaction pred_queue[$];
    register_transaction real_trans;
    register_transaction ref_trans;

    int match;

    //my_monitor(output_monitor)->my_scoreboard
    `uvm_analysis_imp_decl (_mon_scbd)
    uvm_analysis_imp_mon_scbd#(register_transaction, register_scoreboard) mon_scbd_imp;

	//my_predictor->my_scoreboard
	`uvm_analysis_imp_decl (_pred_scbd)
	uvm_analysis_imp_pred_scbd#(register_transaction, register_scoreboard) pred_scbd_imp;

    `uvm_component_utils(register_scoreboard)

    function new(string name, uvm_component parent);
        super.new(name, parent);
        mon_scbd_imp = new("mon_scbd_imp", this);
        pred_scbd_imp = new("pred_scbd_imp", this);
        match = 0;
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction

    function void write_pred_scbd(register_transaction _trans);
        `uvm_info(get_type_name(), $psprintf("\npush back predictor transaction: \n%s", _trans.sprint()), UVM_LOW);
        pred_queue.push_back(_trans);
    endfunction

    function void write_mon_scbd(register_transaction _trans);
        real_trans = new();
        ref_trans = new();
		`uvm_info(get_type_name(), "into compare", UVM_LOW);
        real_trans = _trans;
        ref_trans = pred_queue.pop_front();
        if(real_trans.compare(ref_trans)) begin
            match = 1;
            `uvm_info(get_type_name(), "compare pass", UVM_LOW);
        end
        else begin
            match = 0;
            `uvm_info(get_type_name(), $psprintf("\nreal_trans is \n%s",real_trans.sprint()), UVM_LOW);
            `uvm_info(get_type_name(), $psprintf("\nref_trans is \n%s",ref_trans.sprint()), UVM_LOW);
            `uvm_error(get_type_name(), $psprintf("compare mismatch!!!\n"));
        end
    endfunction

endclass: register_scoreboard