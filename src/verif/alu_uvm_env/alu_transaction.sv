class alu_transaction_in extends uvm_sequence_item;
    rand bit alu_clk;
    rand bit [2:0] opcode;
    rand bit [7:0] accum;
    rand bit [7:0] data;

    `uvm_object_utils_begin(alu_transaction_in)
        `uvm_field_int(alu_clk, UVM_ALL_ON)
        `uvm_field_int(opcode, UVM_ALL_ON)
        `uvm_field_int(accum, UVM_ALL_ON)
        `uvm_field_int(data, UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name = "alu_transaction_in");
        super.new(name);
    endfunction

endclass: alu_transaction_in

class alu_transaction_out extends uvm_sequence_item;
    rand bit zero;
    rand bit [7:0] alu_out;

    `uvm_object_utils_begin(alu_transaction_out)
        `uvm_field_int(zero, UVM_ALL_ON)
        `uvm_field_int(alu_out, UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name = "alu_transaction_out");
        super.new(name);
    endfunction

endclass: alu_transaction_out

