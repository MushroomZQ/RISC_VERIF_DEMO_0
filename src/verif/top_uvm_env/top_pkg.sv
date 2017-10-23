`include "./src/verif/top_uvm_env/top_if.sv"
package top_uvm_env_pkg;
    //`include "uvm_macros.svh"
    import uvm_pkg::*;

    `include "./src/verif/top_uvm_env/top_transaction.sv"
    `include "./src/verif/top_uvm_env/top_seq.sv"
    `include "./src/verif/top_uvm_env/top_sqr.sv"
    `include "./src/verif/top_uvm_env/top_driver.sv"
    `include "./src/verif/top_uvm_env/top_monitor.sv"
    `include "./src/verif/top_uvm_env/top_scoreboard.sv"
    `include "./src/verif/top_uvm_env/top_predictor.sv"
    `include "./src/verif/top_uvm_env/top_agent.sv"
    `include "./src/verif/top_uvm_env/top_env.sv"
    `include "./src/verif/top_uvm_env/top_tb.sv"
    //`include "top_testcase.sv"
endpackage: top_uvm_env_pkg

