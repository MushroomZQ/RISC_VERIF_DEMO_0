class top_risc_tb extends uvm_env;

    `uvm_component_utils(top_risc_tb)

    top_env env;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = top_env::type_id::create("env", this);
    endfunction

endclass: top_risc_tb

