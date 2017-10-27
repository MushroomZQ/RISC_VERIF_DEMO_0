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
        //for(int i=0; i<25; i++) begin
            top_rom_seq.randomize with {data == 8'b111_00000;};//00
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b0011_1100;};
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b000_00000;};//02
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b0000_0000;};
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b000_00000;};//04
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b0000_0000;};
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b101_11000;};//06
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b0000_0000;};
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b001_00000;};//08
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b0000_0000;};
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b000_00000;};//0a
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b0000_0000;};
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b101_11000;};//0c
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b0000_0001;};
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b001_00000;};//0e
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b0000_0000;};
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b111_00000;};//10
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b0001_0100;};
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b000_00000;};//12
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b0000_0000;};
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b110_11000;};//14
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b0000_0010;};
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b101_11000;};//16
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b0000_0000;};
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b110_11000;};//18
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b0000_0010;};
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b101_11000;};//1a
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b0000_0010;};
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b001_00000;};//1c
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b0000_0000;};
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b000_00000;};//1e
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b0000_0000;};
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b100_11000;};//20
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b0000_0001;};
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b001_00000;};//22
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b0000_0000;};
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b111_00000;};//24
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b0010_1000;};
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b000_00000;};//26
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b0000_0000;};
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b100_11000;};//28
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b0000_0001;};
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b001_00000;};//2a
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b0000_0000;};
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b000_00000;};//2c
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b0000_0000;};
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b000_00000;};//2e
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b0000_0000;};
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b111_00000;};//30
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b0000_0000;};
            top_rom_seq.start(tb.env.top_agt.top_sqr);
             for(int i=0; i<10; i++) begin
            top_rom_seq.randomize();
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            end
            top_rom_seq.randomize with {data == 8'b111_00000;};//3c
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b0000_0110;};
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            top_rom_seq.randomize with {data == 8'b000_00000;};//3e
            top_rom_seq.start(tb.env.top_agt.top_sqr);
            

            top_ram_seq.randomize with {data == 8'b0000_0000;};
            top_ram_seq.start(tb.env.top_agt.top_sqr);
            top_ram_seq.randomize with {data == 8'b1111_1111;};
            top_ram_seq.start(tb.env.top_agt.top_sqr);
            top_ram_seq.randomize with {data == 8'b10101010;};
            top_ram_seq.start(tb.env.top_agt.top_sqr);

            //top_ram_seq.start(tb.env.top_agt.top_sqr);
        //end
        phase.drop_objection(this);
    endtask

endclass: top_risc_testcase
