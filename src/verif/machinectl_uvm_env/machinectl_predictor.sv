class machinectl_predictor extends uvm_component;

    machinectl_transaction_in input_trans;
    machinectl_transaction_out output_trans;
    machinectl_transaction_in input_trans_queue[$:0];

    `uvm_analysis_imp_decl(_mon_pred)
    uvm_analysis_imp_mon_pred#(machinectl_transaction_in, machinectl_predictor) mon_pred_imp;
    uvm_analysis_port#(machinectl_transaction_out) pred_scbd_ap;

    `uvm_component_utils(machinectl_predictor)

    function new(string name, uvm_component parent);
        super.new(name, parent);
        mon_pred_imp = new("mon_pred_imp", this);
        pred_scbd_ap = new("pred_scbd_ap", this);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction

    function void write_mon_pred(machinectl_transaction_in _trans);
        input_trans_queue.push_back(_trans);
        do_prediction(_trans);
    endfunction

    function void do_prediction(machinectl_transaction_in _trans);
        machinectl_transaction_in last_trans;
        last_trans = new();
        output_trans = new();
        if(input_trans_queue.size() >= 1)begin
            last_trans = input_trans_queue.pop_front();
            if( (!last_trans.fetch && _trans.fetch) || (!last_trans.rst && _trans.rst) ) begin
                if(_trans.rst) begin
                    output_trans.ena = 1'b0;
                end
                else
                    output_trans.ena = 1'b1;
                end
                pred_scbd_ap.write(output_trans);
            end
            else

            end
        end
    endfunction

endclass: machinectl_predictor
