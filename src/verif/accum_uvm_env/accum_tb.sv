class accum_tb extends uvm_env;

    `uvm_component_utils(accum_tb)

    accum_env env;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = accum_env::type_id::create("env", this);
    endfunction

endclass: accum_tb

