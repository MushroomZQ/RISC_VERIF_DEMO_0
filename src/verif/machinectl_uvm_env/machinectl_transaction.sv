class machinectl_transaction_in extends uvm_sequence_item;
    rand bit fetch;
    rand bit rst;

    `uvm_object_utils_begin(machinectl_transaction_in)
        `uvm_field_int(fetch, UVM_ALL_ON)
        `uvm_field_int(rst, UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name = "machinectl_transaction_in");
        super.new(name);
    endfunction

endclass: machinectl_transaction_in

class machinectl_transaction_out extends uvm_sequence_item;
    rand bit ena;

    `uvm_object_utils_begin(machinectl_transaction_out)
        `uvm_field_int(ena, UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name = "machinectl_transaction_out");
        super.new(name);
    endfunction

endclass: machinectl_transaction_out

