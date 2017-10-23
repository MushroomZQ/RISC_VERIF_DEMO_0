virtual class top_base_seq extends uvm_sequence#(top_rom_ram_in);

    function new(string name = "top_base_seq");
        super.new(name);
    endfunction

endclass

class top_first_rom_seq extends top_base_seq;

    `uvm_object_utils(top_first_rom_seq)

    top_rom_ram_in rom_trans;

    function new(string name = "top_first_rom_seq");
        super.new(name);
    endfunction

    virtual task body();
        `uvm_create(rom_trans);
        `uvm_info(get_type_name(), "randomize data", UVM_LOW);
        rom_trans.data = $urandom();
        rom_trans.source = 1'b0;
        `uvm_info(get_type_name(), "send data", UVM_LOW);
        `uvm_send(rom_trans);

       /*repeat(10) begin
           `uvm_do(reg_trans);
		   //`uvm_info(get_type_name(), "send out trans", UVM_LOW);
       end*/
       //#1000;
    endtask

endclass: top_first_rom_seq

class top_first_ram_seq extends top_base_seq;

    `uvm_object_utils(top_first_ram_seq)

    top_rom_ram_in ram_trans;

    function new(string name = "top_first_ram_seq");
        super.new(name);
    endfunction

    virtual task body();
        `uvm_create(ram_trans);
        `uvm_info(get_type_name(), "randomize data", UVM_LOW);
        ram_trans.data = $urandom();
        ram_trans.source = 1'b1;
        `uvm_info(get_type_name(), "send data", UVM_LOW);
        `uvm_send(ram_trans);

       /*repeat(10) begin
           `uvm_do(reg_trans);
		   //`uvm_info(get_type_name(), "send out trans", UVM_LOW);
       end*/
       //#1000;
    endtask

endclass: top_first_ram_seq

