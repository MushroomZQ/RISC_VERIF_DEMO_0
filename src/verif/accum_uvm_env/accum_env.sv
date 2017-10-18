class accum_env extends uvm_env;

    accum_agent acc_agt;
    accum_predictor acc_pred;
    accum_scoreboard acc_scbd;

    `uvm_component_utils(accum_env)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        acc_agt = accum_agent::type_id::create("acc_agt", this);
        acc_pred = accum_predictor::type_id::create("acc_pred", this);
        acc_scbd = accum_scoreboard::type_id::create("acc_scbd", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        acc_pred.pred_scbd_ap.connect(acc_scbd.pred_scbd_imp);
        acc_agt.acc_mon.mon_pred_ap.connect(acc_pred.mon_pred_imp);
        acc_agt.acc_mon.mon_scbd_ap.connect(acc_scbd.mon_scbd_imp);
    endfunction

endclass: accum_env
