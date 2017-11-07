class machine_transaction_in extends uvm_sequence_item;
    //rand bit clk1;
    rand bit [2:0] opcode;
    rand bit zero;
    rand bit ena;
    rand bit [2:0] state;

    `uvm_object_utils_begin(machine_transaction_in)
        //`uvm_field_int(clk1, UVM_ALL_ON)
        `uvm_field_int(opcode, UVM_ALL_ON)
        `uvm_field_int(zero, UVM_ALL_ON)
        `uvm_field_int(ena, UVM_ALL_ON)
        `uvm_field_int(state, UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name = "machine_transaction_in");
        super.new(name);
    endfunction

endclass: machine_transaction_in

class machine_transaction_out extends uvm_sequence_item;
    bit inc_pc;
    bit load_acc;
    bit load_pc;
    bit rd;
    bit wr; 
    bit load_ir;
    bit datactl_ena;
    bit halt;
    bit [2:0] state

    `uvm_object_utils_begin(machine_transaction_out)
        `uvm_field_int(inc_pc, UVM_ALL_ON)
        `uvm_field_int(load_pc, UVM_ALL_ON)
        `uvm_field_int(load_acc, UVM_ALL_ON)
        `uvm_field_int(rd, UVM_ALL_ON)
        `uvm_field_int(wr, UVM_ALL_ON)
        `uvm_field_int(load_ir, UVM_ALL_ON)
        `uvm_field_int(datactl_ena, UVM_ALL_ON)
        `uvm_field_int(halt, UVM_ALL_ON)
        `uvm_field_int(state, UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name = "machine_transaction_out");
        super.new(name);
    endfunction

endclass: machine_transaction_out

