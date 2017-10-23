UVM_HOME = /tool/cbar/apps/vcs-mx/2015.09-SP2-10/etc/uvm-1.2
VERDI_HOME = /tool/cbar/apps/verdi/2015.09-SP2-10
UVM_VERBOSITY = UVM_LOW
TEST_NAME = $(TEST)

#VCS =	vcs -sverilog -timescale=1ns/1ns \
#+acc +vpi -PP \
#+define+UVM_OBJECT_MUST_HAVE_CONSTRUCTOR \
#+incdir+$(UVM_HOME)/src $(UVM_HOME)/src/uvm.sv \
#-cm line+cond+fsm+branch+tgl -cm_dir ./coverage.vdb \
#$(UVM_HOME)/src/dpi/uvm_dpi.cc -CFLAGS -DVCS -debug_all -P ${VERDI_HOME}/share/PLI/VCS/linux/novas.tab ${VERDI_HOME}/share/PLI/VCS/linux/pli.a +incdir+$(VCS_HOME)/etc/uvm-1.2
#-ntb_opts uvm-1.1


VCS =	vcs -sverilog -timescale=1ns/1ns \
	+acc +vpi -PP \
	+define+UVM_OBJECT_MUST_HAVE_CONSTRUCTOR \
	-cm line+cond+fsm+branch+tgl -cm_dir ./coverage.vdb \
	-ntb_opts uvm-1.2 \
	-CFLAGS -DVCS -debug_all -P ${VERDI_HOME}/share/PLI/VCS/linux/novas.tab ${VERDI_HOME}/share/PLI/VCS/linux/pli.a

SIMV = ./simv +UVM_VERBOSITY=$(UVM_VERBOSITY) \
	+UVM_TESTNAME=$(TEST_NAME) +UVM_TR_RECORD +UVM_LOG_RECORD \
	+verbose=1 -l vcs.log

x:	comp run 

comp:
	#$(VCS) +incdir+./src/rtl+./src/verif+./src/testcase ./src/verif/top_tb.sv -l ./cmp.log
	$(VCS) +incdir+./src/rtl+./src/verif+./src/testcase ./src/verif/risc_top_tb.sv -l ./cmp.log

run:
	$(SIMV)

verdi: 
	verdi -sv -f filelist -ssf test.fsdb

clean:
	rm -rf coverage.vdb csrc DVEfiles inter.vpd simv simv.daidir ucli.key vc_hdrs.h vcs.log .inter.vpd.uvm verdiLog driver_direct_testbench novas.rc novas.conf test.fsdb vcdplus.vpd
	ls
