class clk_gen_transaction extends uvm_sequence_item;
    rand bit clk;
    rand bit reset;

    bit clk1, clk2, clk4, fetch, alu_clk;

    function new(string name = "")
        super.new(name);
    endfunction: new

    `uvm_object_utils_begin(clk_gen_transaction)
        `uvm_field_int(clk, UVM_ALL_ON)
        `uvm_field_int(reset, UVM_ALL_ON)
        `uvm_field_int(clk1, UVM_ALL_ON)
        `uvm_field_int(clk2, UVM_ALL_ON)
        `uvm_field_int(clk4, UVM_ALL_ON)
        `uvm_field_int(fetch, UVM_ALL_ON)
        `uvm_field_int(alu_clk, UVM_ALL_ON)
    `uvm_object_utils_end
endclass: clk_gen_transaction

class register_transaction extends uvm_sequence_item;
    rand bit ena;
    rand bit[7:0] data;

    bit[15:0] opc_iraddr;

    function new(string name = "")
        super.new(name);
    endfunction: new

    `uvm_object_utils_begin(register_transaction)
        `uvm_field_int(ena, UVM_ALL_ON)
        `uvm_field_int(data, UVM_ALL_ON)
        `uvm_field_int(opc_iraddr, UVM_ALL_ON)
    `uvm_object_utils_end
endclass: register_transaction
