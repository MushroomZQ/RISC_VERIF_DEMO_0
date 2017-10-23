class top_risc_testcase extends uvm_test;

    `uvm_component_utils(top_risc_testcase)

    top_risc_tb tb;

    function new(string name="top_risc_testcase", uvm_component parent=null);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        tb = top_risc_tb::type_id::create("tb", this);
    endfunction

    task run_phase(uvm_phase phase);
        
        top_first_rom_seq top_rom_seq;
        top_first_ram_seq top_ram_seq;
        top_rom_seq = top_first_rom_seq::type_id::create("top_rom_seq", this);
        top_ram_seq = top_first_ram_seq::type_id::create("top_ram_seq", this);

        phase.raise_objection(this);
        for(int i=0; i<25; i++) begin
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_ram_seq.start(tb.env.top_agt.top_sqr);
        end
        phase.drop_objection(this);
    endtask

endclass: top_risc_testcase
