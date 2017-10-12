class register_testcase extends uvm_test;

    `uvm_component_utils(register_testcase)

    register_tb tb;

    function new(string name="register_testcase", uvm_component parent=null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        tb = register_tb::type_id::create("tb", this);
    endfunction

    task run_phase(uvm_phase phase);
        
        register_first_seq reg_seq;
        reg_seq = register_first_seq::type_id::create("reg_seq", this);

        phase.raise_objection(this);
        for(int i=0; i<25; i++) begin
            reg_seq.start(tb.env.reg_agt.reg_sqr);
        end
        phase.drop_objection(this);
    endtask

endclass: register_testcase

