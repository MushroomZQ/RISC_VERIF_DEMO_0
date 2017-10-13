class register_env extends uvm_env;

    register_agent reg_agt;
    register_predictor reg_pred;
    register_scoreboard reg_scbd;

    `uvm_component_utils(register_env)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        reg_agt = register_agent::type_id::create("reg_agt", this);
        reg_pred = register_predictor::type_id::create("reg_pred", this);
        reg_scbd = register_scoreboard::type_id::create("reg_scbd", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        reg_pred.pred_scbd_ap.connect(reg_scbd.pred_scbd_imp);
        reg_agt.reg_mon.mon_pred_ap.connect(reg_pred.mon_pred_imp);
        reg_agt.reg_mon.mon_scbd_ap.connect(reg_scbd.mon_scbd_imp);
    endfunction

endclass: register_env