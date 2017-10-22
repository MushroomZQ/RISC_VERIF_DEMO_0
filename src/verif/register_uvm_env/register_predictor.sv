class register_predictor extends uvm_component;

    register_transaction_out output_reg_trans;
    bit state;

    `uvm_analysis_imp_decl(_mon_pred)
    uvm_analysis_imp_mon_pred#(register_transaction_in, register_predictor) mon_pred_imp;
    uvm_analysis_port#(register_transaction_out) pred_scbd_ap;

    `uvm_component_utils(register_predictor)

    function new(string name, uvm_component parent);
        super.new(name, parent);
        state = 1'b0;
        mon_pred_imp = new("mon_pred_imp", this);
        pred_scbd_ap = new("pred_scbd_ap", this);
        output_reg_trans = new();
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction

    function void write_mon_pred(register_transaction_in _trans);
        do_prediction(_trans);
    endfunction

    function void do_prediction(register_transaction_in _trans);
        //output_reg_trans = new();

		if(_trans.ena) begin
			if(state == 1'b0) begin
				output_reg_trans.opc_iraddr[15:8] = _trans.data;
                //output_reg_trans.valid = _trans.ena;
                state = 1'b1;
			end
			else if(state == 1'b1) begin
				output_reg_trans.opc_iraddr[7:0] = _trans.data;
                //output_reg_trans.valid = _trans.ena;
                state = 1'b0;
			end
			else begin
				`uvm_error(get_type_name(), "the state is wrong");
			end
		end
		else begin
			`uvm_info(get_type_name(), "this trans is droped caused by no vaild ena signal", UVM_LOW);
		end
        //output_reg_trans = _trans;
        pred_scbd_ap.write(output_reg_trans);
    endfunction

endclass: register_predictor
