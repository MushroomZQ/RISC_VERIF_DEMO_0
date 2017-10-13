`include "./src/verif/register_uvm_env/register_if.sv"
package register_uvm_env_pkg;
    //`include "uvm_macros.svh"
    import uvm_pkg::*;

    `include "./src/verif/register_uvm_env/register_transaction.sv"
    `include "./src/verif/register_uvm_env/register_seq.sv"
    `include "./src/verif/register_uvm_env/register_sqr.sv"
    `include "./src/verif/register_uvm_env/register_driver.sv"
    `include "./src/verif/register_uvm_env/register_monitor.sv"
    `include "./src/verif/register_uvm_env/register_scoreboard.sv"
    `include "./src/verif/register_uvm_env/register_predictor.sv"
    `include "./src/verif/register_uvm_env/register_agent.sv"
    `include "./src/verif/register_uvm_env/register_env.sv"
    `include "./src/verif/register_uvm_env/register_tb.sv"
    //`include "register_testcase.sv"
endpackage: register_uvm_env_pkg

