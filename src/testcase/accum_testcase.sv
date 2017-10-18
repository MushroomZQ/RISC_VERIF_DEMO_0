class accum_testcase extends uvm_test;

    `uvm_component_utils(accum_testcase)

    accum_tb tb;

    function new(string name="accum_testcase", uvm_component parent=null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        tb = accum_tb::type_id::create("tb", this);
    endfunction

    task run_phase(uvm_phase phase);
        
        accum_first_seq acc_seq;
        acc_seq = accum_first_seq::type_id::create("acc_seq", this);

        phase.raise_objection(this);
        for(int i=0; i<25; i++) begin
            acc_seq.start(tb.env.acc_agt.acc_sqr);
        end
        phase.drop_objection(this);
    endtask

endclass: accum_testcase

