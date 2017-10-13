virtual class register_base_seq extends uvm_sequence#(register_transaction_in);

    function new(string name = "register_base_seq");
        super.new(name);
    endfunction

endclass

class register_first_seq extends register_base_seq;

    `uvm_object_utils(register_first_seq)

    register_transaction_in reg_trans;

    function new(string name = "register_first_seq");
        super.new(name);
    endfunction

    virtual task body();
        `uvm_create(reg_trans);
        `uvm_info("my_first_seq", "randomize data", UVM_LOW);
        reg_trans.data = $urandom();
        reg_trans.ena = 1'b1;
        `uvm_info("my_first_seq", "send data", UVM_LOW);
        `uvm_send(reg_trans);

       /*repeat(10) begin
           `uvm_do(reg_trans);
		   //`uvm_info(get_type_name(), "send out trans", UVM_LOW);
       end*/
       //#1000;
    endtask

endclass: register_first_seq

