class alu_predictor extends uvm_component;

    alu_transaction_in input_trans;
    alu_transaction_out output_trans;

    `uvm_analysis_imp_decl(_mon_pred)
    uvm_analysis_imp_mon_pred#(alu_transaction_in, alu_predictor) mon_pred_imp;
    uvm_analysis_port#(alu_transaction_out) pred_scbd_ap;

    `uvm_component_utils(alu_predictor)

    function new(string name, uvm_component parent);
        super.new(name, parent);
        mon_pred_imp = new("mon_pred_imp", this);
        pred_scbd_ap = new("pred_scbd_ap", this);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction

    function void write_mon_pred(alu_transaction_in _trans);
        do_prediction(_trans);
    endfunction

    function void do_prediction(alu_transaction_in _trans);
        output_trans = new();
        case(_trans.opcode)
            3'b000: output_trans.alu_out = _trans.accum;
            3'b001: output_trans.alu_out = _trans.accum;
            3'b010: output_trans.alu_out = _trans.accum + _trans.data;
            3'b011: output_trans.alu_out = _trans.accum & _trans.data;
            3'b100: output_trans.alu_out = _trans.accum ^ _trans.data;
            3'b101: output_trans.alu_out = _trans.data;
            3'b110: output_trans.alu_out = _trans.accum;
            3'b111: output_trans.alu_out = _trans.accum;
            default: output_trans.alu_out = 8'bxxxx_xxxx;
        endcase
        output_trans.zero = !_trans.accum;
        pred_scbd_ap.write(output_trans);
    endfunction

endclass: alu_predictor
