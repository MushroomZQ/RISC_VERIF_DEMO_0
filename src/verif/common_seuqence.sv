class clk_gen_sequence extends uvm_sequence#(clk_gen_transaction);
    `uvm_object_utils(clk_gen_sequence)

    function new(string name = "")
        super.new(name);
    endfunction: new

    task body();
        clk_gen_transaction clk_tx;

        repeat(100) begin
            clk_tx = clk_gen_transaction::type_id::create(.name("clk_tx"), .contxt(get_full_name()));
            start_item(clk_tx);
            assert(clk_tx.randomize());
            finish_item(clk_tx);
        end
    endtask: body
endclass: clk_gen_sequence

typedef uvm_sequencer#(clk_gen_transaction) clk_gen_sequencer;
