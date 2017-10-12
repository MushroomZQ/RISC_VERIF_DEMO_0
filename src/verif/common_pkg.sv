`include "common_if.sv"
package common_exe_pkg;
    //`include "uvm_macros.svh"
    import uvm_pkg::*;

    `include "common_transaction.sv"
    `include "common_seq.sv"
    `include "common_sqr.sv"
    `include "common_driver.sv"
    `include "common_monitor.sv"
    `include "common_scoreboard.sv"
    `include "common_predictor.sv"
    `include "common_agent.sv"
    `include "common_env.sv"
    `include "common_tb.sv"
    `include "common_testcase.sv"
endpackage: common_exe_pkg

