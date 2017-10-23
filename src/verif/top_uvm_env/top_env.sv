class top_env extends uvm_env;

    top_agent top_agt;
    top_predictor top_pred;
    top_scoreboard top_scbd;

    `uvm_component_utils(top_env)

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        top_agt = top_agent::type_id::create("top_agt", this);
        top_pred = top_predictor::type_id::create("top_pred", this);
        top_scbd = top_scoreboard::type_id::create("top_scbd", this);
    endfunction

    function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        top_pred.pred_scbd_ap.connect(top_scbd.pred_scbd_imp);
        top_agt.top_mon.mon_pred_ap.connect(top_pred.mon_pred_imp);
        top_agt.top_mon.mon_scbd_ap.connect(top_scbd.mon_scbd_imp);
    endfunction

endclass: top_env
