class machine_predictor extends uvm_component;

    machine_transaction_in input_trans;
    machine_transaction_out output_trans;

    `uvm_analysis_imp_decl(_mon_pred)
    uvm_analysis_imp_mon_pred#(machine_transaction_in, machine_predictor) mon_pred_imp;
    uvm_analysis_port#(machine_transaction_out) pred_scbd_ap;

    `uvm_component_utils(machine_predictor)

    function new(string name, uvm_component parent);
        super.new(name, parent);
        mon_pred_imp = new("mon_pred_imp", this);
        pred_scbd_ap = new("pred_scbd_ap", this);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
    endfunction

    function void write_mon_pred(machine_transaction_in _trans);
        do_prediction(_trans);
    endfunction

    function void do_prediction(machine_transaction_in _trans);
        output_trans = new();
        if(!_trans.ena) begin 
            output_trans.inc_pc = 1'b0;
            output_trans.load_acc = 1'b0;
            output_trans.load_pc = 1'b0;
            output_trans.rd = 1'b0;
            output_trans.wr = 1'b0; 
            output_trans.load_ir = 1'b0;
            output_trans.datactl_ena = 1'b0;
            output_trans.halt = 1'b0;
        end
        else begin
        case(_trans.state)
            3'b000: output_trans.state = 3'b001;
                    output_trans.inc_pc = 1'b0;
                    output_trans.load_acc = 1'b0;
                    output_trans.load_pc = 1'b0;
                    output_trans.rd = 1'b1;
                    output_trans.wr = 1'b0; 
                    output_trans.load_ir = 1'b1;
                    output_trans.datactl_ena = 1'b0;
                    output_trans.halt = 1'b0;
            3'b001: output_trans.state = 3'b010;
                    output_trans.inc_pc = 1'b1;
                    output_trans.load_acc = 1'b0;
                    output_trans.load_pc = 1'b0;
                    output_trans.rd = 1'b1;
                    output_trans.wr = 1'b0; 
                    output_trans.load_ir = 1'b1;
                    output_trans.datactl_ena = 1'b0;
                    output_trans.halt = 1'b0;
            3'b010: output_trans.state = 3'b011;
                    output_trans.inc_pc = 1'b0;
                    output_trans.load_acc = 1'b0;
                    output_trans.load_pc = 1'b0;
                    output_trans.rd = 1'b0;
                    output_trans.wr = 1'b0; 
                    output_trans.load_ir = 1'b0;
                    output_trans.datactl_ena = 1'b0;
                    output_trans.halt = 1'b0;
            3'b011: output_trans.state = 3'b100;
                    if(_trans.opcode == 3'b000) begin
                        output_trans.inc_pc = 1'b1;
                        output_trans.load_acc = 1'b0;
                        output_trans.load_pc = 1'b0;
                        output_trans.rd = 1'b0;
                        output_trans.wr = 1'b0; 
                        output_trans.load_ir = 1'b0;
                        output_trans.datactl_ena = 1'b0;
                        output_trans.halt = 1'b1;
                    end
                    else begin
                        output_trans.inc_pc = 1'b1;
                        output_trans.load_acc = 1'b0;
                        output_trans.load_pc = 1'b0;
                        output_trans.rd = 1'b0;
                        output_trans.wr = 1'b0; 
                        output_trans.load_ir = 1'b0;
                        output_trans.datactl_ena = 1'b0;
                        output_trans.halt = 1'b0;
                    end
            3'b100: output_trans.state = 3'b101;
                    if(_trans.opcode == 3'b111) begin
                        output_trans.inc_pc = 1'b0;
                        output_trans.load_acc = 1'b0;
                        output_trans.load_pc = 1'b1;
                        output_trans.rd = 1'b0;
                        output_trans.wr = 1'b0; 
                        output_trans.load_ir = 1'b0;
                        output_trans.datactl_ena = 1'b0;
                        output_trans.halt = 1'b0;
                    end
                    else if(_trans.opcode == 3'b010 || _trans.opcode == 3'b011 || _trans.opcode == 3'b100 || _trans.opcode == 3'b101) begin
                        output_trans.inc_pc = 1'b0;
                        output_trans.load_acc = 1'b0;
                        output_trans.load_pc = 1'b0;
                        output_trans.rd = 1'b1;
                        output_trans.wr = 1'b0; 
                        output_trans.load_ir = 1'b0;
                        output_trans.datactl_ena = 1'b0;
                        output_trans.halt = 1'b0;
                    end
                    else if(_trans.opcode == 3'b110) begin
                        output_trans.inc_pc = 1'b0;
                        output_trans.load_acc = 1'b0;
                        output_trans.load_pc = 1'b0;
                        output_trans.rd = 1'b0;
                        output_trans.wr = 1'b0; 
                        output_trans.load_ir = 1'b0;
                        output_trans.datactl_ena = 1'b1;
                        output_trans.halt = 1'b0;
                    end
                    else begin
                        output_trans.inc_pc = 1'b0;
                        output_trans.load_acc = 1'b0;
                        output_trans.load_pc = 1'b0;
                        output_trans.rd = 1'b0;
                        output_trans.wr = 1'b0; 
                        output_trans.load_ir = 1'b0;
                        output_trans.datactl_ena = 1'b0;
                        output_trans.halt = 1'b0;
                    end
            3'b101: output_trans.state = 3'b110;
                    if(_trans.opcode == 3'b010 || _trans.opcode == 3'b011 || _trans.opcode == 3'b100 || _trans.opcode == 3'b101) begin
                        output_trans.inc_pc = 1'b0;
                        output_trans.load_acc = 1'b1;
                        output_trans.load_pc = 1'b0;
                        output_trans.rd = 1'b1;
                        output_trans.wr = 1'b0; 
                        output_trans.load_ir = 1'b0;
                        output_trans.datactl_ena = 1'b0;
                        output_trans.halt = 1'b0;
                    end
                    else if(_trans.opcode == 3'b001 || _trans.zero == 1'b1) begin
                        output_trans.inc_pc = 1'b1;
                        output_trans.load_acc = 1'b0;
                        output_trans.load_pc = 1'b0;
                        output_trans.rd = 1'b0;
                        output_trans.wr = 1'b0; 
                        output_trans.load_ir = 1'b0;
                        output_trans.datactl_ena = 1'b0;
                        output_trans.halt = 1'b0;
                    end
                    else if(_trans.opcode == 3'b111) begin
                        output_trans.inc_pc = 1'b1;
                        output_trans.load_acc = 1'b0;
                        output_trans.load_pc = 1'b1;
                        output_trans.rd = 1'b0;
                        output_trans.wr = 1'b0; 
                        output_trans.load_ir = 1'b0;
                        output_trans.datactl_ena = 1'b0;
                        output_trans.halt = 1'b0;
                    end
                    else if(_trans.opcode == 3'b110) begin
                        output_trans.inc_pc = 1'b0;
                        output_trans.load_acc = 1'b0;
                        output_trans.load_pc = 1'b0;
                        output_trans.rd = 1'b0;
                        output_trans.wr = 1'b1; 
                        output_trans.load_ir = 1'b0;
                        output_trans.datactl_ena = 1'b1;
                        output_trans.halt = 1'b0;
                    end
                    else begin
                        output_trans.inc_pc = 1'b0;
                        output_trans.load_acc = 1'b0;
                        output_trans.load_pc = 1'b0;
                        output_trans.rd = 1'b0;
                        output_trans.wr = 1'b0; 
                        output_trans.load_ir = 1'b0;
                        output_trans.datactl_ena = 1'b0;
                        output_trans.halt = 1'b0;
                    end
            3'b110: output_trans.state = 3'b111;
                    if(_trans.opcode == 3'b110) begin
                        output_trans.inc_pc = 1'b0;
                        output_trans.load_acc = 1'b0;
                        output_trans.load_pc = 1'b0;
                        output_trans.rd = 1'b0;
                        output_trans.wr = 1'b0; 
                        output_trans.load_ir = 1'b0;
                        output_trans.datactl_ena = 1'b1;
                        output_trans.halt = 1'b0;
                    end
                    else if(_trans.opcode == 3'b010 || _trans.opcode == 3'b011 || _trans.opcode == 3'b100 || _trans.opcode == 3'b101) begin
                        output_trans.inc_pc = 1'b0;
                        output_trans.load_acc = 1'b0;
                        output_trans.load_pc = 1'b0;
                        output_trans.rd = 1'b1;
                        output_trans.wr = 1'b0; 
                        output_trans.load_ir = 1'b0;
                        output_trans.datactl_ena = 1'b0;
                        output_trans.halt = 1'b0;
                    end
                    else begin
                        output_trans.inc_pc = 1'b0;
                        output_trans.load_acc = 1'b0;
                        output_trans.load_pc = 1'b0;
                        output_trans.rd = 1'b0;
                        output_trans.wr = 1'b0; 
                        output_trans.load_ir = 1'b0;
                        output_trans.datactl_ena = 1'b0;
                        output_trans.halt = 1'b0;
                    end
            3'b111: output_trans.state = 3'b000;
                    if(_trans.opcode == 3'b001 || _trans.zero == 1'b1) begin
                        output_trans.inc_pc = 1'b1;
                        output_trans.load_acc = 1'b0;
                        output_trans.load_pc = 1'b0;
                        output_trans.rd = 1'b0;
                        output_trans.wr = 1'b0; 
                        output_trans.load_ir = 1'b0;
                        output_trans.datactl_ena = 1'b0;
                        output_trans.halt = 1'b0;
                    end
                    else begin
                        output_trans.inc_pc = 1'b0;
                        output_trans.load_acc = 1'b0;
                        output_trans.load_pc = 1'b0;
                        output_trans.rd = 1'b0;
                        output_trans.wr = 1'b0; 
                        output_trans.load_ir = 1'b0;
                        output_trans.datactl_ena = 1'b0;
                        output_trans.halt = 1'b0;
                    end
            default: output_trans.state = 3'b000;
                    output_trans.inc_pc = 1'b0;
                    output_trans.load_acc = 1'b0;
                    output_trans.load_pc = 1'b0;
                    output_trans.rd = 1'b0;
                    output_trans.wr = 1'b0; 
                    output_trans.load_ir = 1'b0;
                    output_trans.datactl_ena = 1'b0;
                    output_trans.halt = 1'b0;
        endcase
        pred_scbd_ap.write(output_trans);
    endfunction

endclass: machine_predictor
