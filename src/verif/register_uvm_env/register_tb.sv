class register_tb extends uvm_env;

    `uvm_component_utils(register_tb)

    register_env env;

    function new(string name, uvm_component parent);
        super.new(name, parent);
    endfunction

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        env = register_env::type_id::create("env", this);
    endfunction

endclass: register_tb

