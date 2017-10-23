class top_driver extends uvm_driver#(top_rom_ram_in);

    `uvm_component_utils(top_driver)

    virtual risc_top_if input_risc_top_if;

    function new(string name="top_driver", uvm_component parent = null);
        super.new(name, parent);
    endfunction
   
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        `uvm_info(get_type_name(), "build_phase is called", UVM_LOW);
        if(!uvm_config_db#(virtual risc_top_if)::get(uvm_root::get(), "", "input_risc_top_if", input_risc_top_if))
            `uvm_fatal(get_type_name(), "virtual interface must be set for vif")

    endfunction

    virtual task run_phase(uvm_phase phase);
        @(posedge input_risc_top_if.rst);
        `uvm_info(get_type_name(), "main_phase is called", UVM_LOW);
        fork
            get_and_drive();
            rst_dut();
        join
    endtask

    virtual task get_and_drive();
        forever begin
            @(posedge input_risc_top_if.clk);
            if(input_risc_top_if.rst) begin
                @(negedge input_risc_top_if.rst);
                @(posedge input_risc_top_if.clk);
            end
            seq_item_port.get_next_item(req);
                `uvm_info(get_type_name(), "get data from seq", UVM_LOW);
                if(req.source == 1'b0)
                    input_risc_top_if.rom_in <= req.data;
                else
                    input_risc_top_if.ram_in <= req.data;
                //input_risc_top_if.valid <= req.ena;
                //@(posedge reg_input_if.clk);
                //reg_input_if.valid <= 1'b0;
            seq_item_port.item_done();
        end
    endtask: get_and_drive

    virtual task rst_dut();
        forever begin
            @(posedge input_risc_top_if.rst);
            input_risc_top_if.rom_in <= 8'bxxxx_xxxx;
            input_risc_top_if.ram_in <= 8'bxxxx_xxxx;
            //input_risc_top_if.valid <= 1'b0;
        end
    endtask: rst_dut

endclass: top_driver
