class register_transaction extends uvm_sequence_item;
    rand bit [7:0] data;
	rand bit ena;

	rand bit state;

	bit [15:0] opc_iraddr;

    `uvm_object_utils_begin(register_transaction)
        `uvm_field_int(data, UVM_ALL_ON)
        `uvm_field_int(ena, UVM_ALL_ON)
        `uvm_field_int(opc_iraddr, UVM_ALL_ON)
    `uvm_object_utils_end

    function new(string name = "register_transaction");
        super.new(name);
		opc_iraddr = 16'bxxxxxxxxxxxxxxxx;
		state = 0;
    endfunction

endclass: register_transaction

