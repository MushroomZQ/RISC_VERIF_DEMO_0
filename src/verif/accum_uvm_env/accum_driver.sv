class accum_driver extends uvm_driver#(accum_transaction);

    `uvm_component_utils(accum_driver)

    virtual accum_if acc_input_if;

    function new(string name="accum_driver", uvm_component parent = null);
        super.new(name, parent);
    endfunction
   
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("accum_driver", "build_phase is called", UVM_LOW);
        if(!uvm_config_db#(virtual accum_if)::get(uvm_root::get(), "", "acc_input_if", acc_input_if))
            `uvm_fatal("accum_driver", "virtual interface must be set for vif")

    endfunction

    virtual task run_phase(uvm_phase phase);
        @(posedge acc_input_if.rst);
        `uvm_info("accum_driver", "main_phase is called", UVM_LOW);
        fork
            get_and_drive();
            rst_dut();
        join
    endtask

    virtual task get_and_drive();
        forever begin
            @(posedge acc_input_if.clk);
            if(acc_input_if.rst) begin
                @(negedge acc_input_if.rst);
                @(posedge acc_input_if.clk);
            end
            seq_item_port.get_next_item(req);
                acc_input_if.data <= req.data;
                acc_input_if.valid <= 1'b1;
                @(posedge acc_input_if.clk);
                acc_input_if.valid <= 1'b0;
            seq_item_port.item_done();
        end
    endtask: get_and_drive

    virtual task rst_dut();
        forever begin
            @(posedge acc_input_if.rst);
            acc_input_if.data <= 8'b00000000;
            acc_input_if.valid <= 1'b0;
        end
    endtask: rst_dut

endclass: accum_driver
