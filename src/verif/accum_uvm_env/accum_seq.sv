virtual class accum_base_seq extends uvm_sequence#(accum_transaction);

    function new(string name = "accum_base_seq");
        super.new(name);
    endfunction

endclass

class accum_first_seq extends accum_base_seq;

    `uvm_object_utils(accum_first_seq)

    accum_transaction acc_trans;

    function new(string name = "accum_first_seq");
        super.new(name);
    endfunction

    virtual task body();
        `uvm_create(acc_trans);
        `uvm_info("my_first_seq", "randomize data", UVM_LOW);
        acc_trans.data = $urandom();
        //acc_trans.ena = 1'b1;
        `uvm_info("my_first_seq", "send data", UVM_LOW);
        `uvm_send(acc_trans);

       /*repeat(10) begin
           `uvm_do(reg_trans);
		   //`uvm_info(get_type_name(), "send out trans", UVM_LOW);
       end*/
       //#1000;
    endtask

endclass: accum_first_seq

