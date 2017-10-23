class top_monitor extends uvm_monitor;

    virtual risc_top_if input_risc_top_if;
    virtual risc_top_if output_risc_top_if;

    uvm_analysis_port#(top_rom_ram_in) mon_pred_ap;
    uvm_analysis_port#(top_risc_out) mon_scbd_ap;

    `uvm_component_utils(top_monitor)

    function new(string name = "top_monitor", uvm_component parent = null);
        super.new(name, parent);
        mon_pred_ap = new("mon_pred_ap", this);
        mon_scbd_ap = new("mon_scbd_ap", this);
    endfunction

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(virtual risc_top_if)::get(uvm_root::get(), "", "input_risc_top_if", input_risc_top_if))
            `uvm_fatal("top_driver", "virtual interface must be set for vif");
        if(!uvm_config_db#(virtual risc_top_if)::get(uvm_root::get(), "", "output_risc_top_if", output_risc_top_if))
            `uvm_fatal("top_driver", "virtual interface must be set for vif");
    endfunction

    task run_phase(uvm_phase phase);
        fork
            collect_input_trans();
            collect_output_trans();
        join
    endtask

    virtual task collect_input_trans();

        top_rom_ram_in top_trans;

        forever begin
            top_trans = new();
            if(input_risc_top_if.rst) begin
                @(negedge input_risc_top_if.rst);
            end
            @(posedge reg_input_if.clk);
            //if (reg_input_if.valid) begin
                if(input_risc_top_if.rom_in) begin
			        top_trans.data = input_risc_top_if.rom_in;
                    top_trans.source = 1'b0;
                end
                else if (input_risc_top_if.ram_in) begin
                    top_trans.data = input_risc_top_if.ram_in;
                    top_trans.source = 1'b1;
                end

                mon_pred_ap.write(top_trans);
            //end
        end
    endtask

    virtual task collect_output_trans();

        top_risc_out top_trans;

        forever begin
            top_trans = new();
            if(output_risc_top_if.rst) begin
                @(negedge output_risc_top_if.rst);
            end
            @(posedge output_risc_top_if.clk);
			//if(output_risc_top_if.valid) begin
				top_trans.halt = output_risc_top_if.halt;
                top_trans.wr = output_risc_top_if.wr;
                top_trans.rd = output_risc_top_if.rd;
                top_trans.ram_out = output_risc_top_if.ram_out;
                top_trans.addr = output_risc_top_if.addr;

				mon_scbd_ap.write(top_trans);
			//end
        end
    endtask
endclass: top_monitor
