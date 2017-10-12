virtual class register_base_seq extends uvm_sequence#(register_transaction);

    function new(string name = "register_base_seq");
        super.new(name);
    endfunction

endclass

class register_first_seq extends register_base_seq;

    `uvm_object_utils(register_first_seq)

    register_transaction reg_trans;

    function new(string name = "register_first_seq");
        super.new(name);
    endfunction

    virtual task body();
        /*`uvm_create(my_trans);
        `uvm_info("my_first_seq", "randomize data", UVM_LOW);
        my_trans.data = $urandom();
        `uvm_info("my_first_seq", "send data", UVM_LOW);
        `uvm_send(my_trans);*/
       repeat(10) begin
           `uvm_do(reg_trans);
		   //`uvm_info(get_type_name(), "send out trans", UVM_LOW);
       end
       #1000;
    endtask

endclass: register_first_seq

