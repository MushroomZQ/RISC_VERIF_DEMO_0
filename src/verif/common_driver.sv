class register_driver extends uvm_driver#(register_transaction);

    `uvm_component_utils(register_driver)

    virtual register_if reg_input_if;

    function new(string name="register_driver", uvm_component parent = null);
        super.new(name, parent);
    endfunction
   
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info("register_driver", "build_phase is called", UVM_LOW);
        if(!uvm_config_db#(virtual register_if)::get(uvm_root::get(), "", "reg_input_if", reg_input_if))
            `uvm_fatal("register_driver", "virtual interface must be set for vif")

    endfunction

    virtual task run_phase(uvm_phase phase);

        `uvm_info("register_driver", "main_phase is called", UVM_LOW);
        fork
            get_and_drive();
            rst_dut();
        join
    endtask

    virtual task get_and_drive();
        forever begin
            @(posedge reg_input_if.clk);
            if(reg_input_if.rst) begin
                @(negedge reg_input_if.rst);
                @(posedge reg_input_if.clk);
            end
            seq_item_port.get_next_item(req);
                `uvm_info("register_driver", "get data from seq", UVM_LOW);
                reg_input_if.data <= req.data;
                reg_input_if.ena <= req.ena;
                //@(posedge input_if.clk);
                //input_if.valid <= 1'b0;
            seq_item_port.item_done();
        end
    endtask: get_and_drive

    virtual task rst_dut();
        forever begin
            @(posedge reg_input_if.rst);
            reg_input_if.data <= 8'b00000000;
            reg_input_if.ena <= 1'b0;
			reg_input_if.opc_iraddr <= 16'b0000000000000000;
			reg_input_if.valid <= 1'b0;
        end
    endtask: rst_dut

endclass: register_driver