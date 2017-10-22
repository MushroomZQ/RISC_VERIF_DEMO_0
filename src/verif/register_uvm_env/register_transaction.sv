class register_transaction_in extends uvm_sequence_item;
    rand bit [7:0] data;
	rand bit ena;

    `uvm_object_utils_begin(register_transaction_in)
        `uvm_field_int(data, UVM_ALL_ON)
        `uvm_field_int(ena, UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name = "register_transaction_in");
        super.new(name);
    endfunction

endclass: register_transaction_in

class register_transaction_out extends uvm_sequence_item;

	bit [15:0] opc_iraddr;
    //bit valid;

    `uvm_object_utils_begin(register_transaction_out)
        `uvm_field_int(opc_iraddr, UVM_ALL_ON)
        //`uvm_field_int(valid, UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name = "register_transaction_out");
        super.new(name);
		opc_iraddr = 16'bxxxxxxxxxxxxxxxx;
        //valid = 0;
    endfunction

endclass: register_transaction_out

