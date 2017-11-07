//`include "./src/verif/accum_uvm_env/accum_if.sv"
package alu_uvm_env_pkg;
    //`include "uvm_macros.svh"
    import uvm_pkg::*;

    `include "./src/verif/alu_uvm_env/alu_transaction.sv"
    //`include "./src/verif/accum_uvm_env/accum_seq.sv"
    //`include "./src/verif/accum_uvm_env/accum_sqr.sv"
    //`include "./src/verif/accum_uvm_env/accum_driver.sv"
    //`include "./src/verif/accum_uvm_env/accum_monitor.sv"
    //`include "./src/verif/accum_uvm_env/accum_scoreboard.sv"
    `include "./src/verif/alu_uvm_env/alu_predictor.sv"
    //`include "./src/verif/accum_uvm_env/accum_agent.sv"
    //`include "./src/verif/accum_uvm_env/accum_env.sv"
    //`include "./src/verif/accum_uvm_env/accum_tb.sv"
    //`include "accum_testcase.sv"
endpackage: alu_uvm_env_pkg

