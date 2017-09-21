class clk_gen_driver extends uvm_driver#(clk_gen_transaction);
    `uvm_component_utils(clk_gen_driver)

    virtual clk_gen_if vif;

    function new(string name, uvm_component parent)
        super.new(name, parent);
    endfunction: new

    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        void'(uvm_resource_db#(virtual clk_gen_if)::read_by_name(.scope("ifs"), .name("clk_gen_if"), .val(clk_gen_vif)));
    endfunction: build_phase

    task run_phase(uvm_phase phase);
        drive();
    endtask: run_phase

    virtual task drive();
        clk_gen_transaction clk_gen_tx;

        forever begin
            begin
                seq_item_port.get_next_item(clk_gen_tx);
            end
        end
    endtask: drive
endclass: clk_gen_driver
