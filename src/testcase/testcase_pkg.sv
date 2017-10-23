`include "../verif/register_uvm_env/register_pkg.sv"
`include "../verif/accum_uvm_env/accum_pkg.sv"
`include "../verif/top_uvm_env/top_pkg.sv"

package testcase_pkg;
    import uvm_pkg::*;
    import register_uvm_env_pkg::*;
    import accum_uvm_env_pkg::*;
    import top_uvm_env_pkg::*;

    `include "register_testcase.sv"
    `include "accum_testcase.sv"
    `include "top_risc_testcase.sv"
endpackage: testcase_pkg
