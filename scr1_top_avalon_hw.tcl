package require -exact qsys 16.1

set_module_property DESCRIPTION "Syntacore SCR1 RISC-V Core with Avalon-MM Interfaces"
set_module_property NAME scr1_top_avalon
set_module_property VERSION 1.0
set_module_property AUTHOR "Syntacore / User"
set_module_property DISPLAY_NAME "SCR1 RISC-V Processor (Avalon-MM)"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true

# 
# File Sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
set_fileset_property QUARTUS_SYNTH TOP_LEVEL scr1_top_avalon
add_fileset_file scr1_ahb.svh SYSTEM_VERILOG_INCLUDE PATH src_SCR1/scr1_ahb.svh
add_fileset_file scr1_arch_description.svh SYSTEM_VERILOG_INCLUDE PATH src_SCR1/scr1_arch_description.svh
add_fileset_file scr1_csr.svh SYSTEM_VERILOG_INCLUDE PATH src_SCR1/scr1_csr.svh
add_fileset_file scr1_dm.svh SYSTEM_VERILOG_INCLUDE PATH src_SCR1/scr1_dm.svh
add_fileset_file scr1_hdu.svh SYSTEM_VERILOG_INCLUDE PATH src_SCR1/scr1_hdu.svh
add_fileset_file scr1_ipic.svh SYSTEM_VERILOG_INCLUDE PATH src_SCR1/scr1_ipic.svh
add_fileset_file scr1_memif.svh SYSTEM_VERILOG_INCLUDE PATH src_SCR1/scr1_memif.svh
add_fileset_file scr1_riscv_isa_decoding.svh SYSTEM_VERILOG_INCLUDE PATH src_SCR1/scr1_riscv_isa_decoding.svh
add_fileset_file scr1_scu.svh SYSTEM_VERILOG_INCLUDE PATH src_SCR1/scr1_scu.svh
add_fileset_file scr1_search_ms1.svh SYSTEM_VERILOG_INCLUDE PATH src_SCR1/scr1_search_ms1.svh
add_fileset_file scr1_tapc.svh SYSTEM_VERILOG_INCLUDE PATH src_SCR1/scr1_tapc.svh
add_fileset_file scr1_tdu.svh SYSTEM_VERILOG_INCLUDE PATH src_SCR1/scr1_tdu.svh
add_fileset_file scr1_arch_types.svh SYSTEM_VERILOG_INCLUDE PATH src_SCR1/scr1_arch_types.svh
add_fileset_file scr1_cg.sv SYSTEM_VERILOG PATH src_SCR1/scr1_cg.sv
add_fileset_file scr1_clk_ctrl.sv SYSTEM_VERILOG PATH src_SCR1/scr1_clk_ctrl.sv
add_fileset_file scr1_core_top.sv SYSTEM_VERILOG PATH src_SCR1/scr1_core_top.sv
add_fileset_file scr1_dm.sv SYSTEM_VERILOG PATH src_SCR1/scr1_dm.sv
add_fileset_file scr1_dmem_ahb.sv SYSTEM_VERILOG PATH src_SCR1/scr1_dmem_ahb.sv
add_fileset_file scr1_dmem_router.sv SYSTEM_VERILOG PATH src_SCR1/scr1_dmem_router.sv
add_fileset_file scr1_dmi.sv SYSTEM_VERILOG PATH src_SCR1/scr1_dmi.sv
add_fileset_file scr1_dp_memory.sv SYSTEM_VERILOG PATH src_SCR1/scr1_dp_memory.sv
add_fileset_file scr1_imem_ahb.sv SYSTEM_VERILOG PATH src_SCR1/scr1_imem_ahb.sv
add_fileset_file scr1_imem_router.sv SYSTEM_VERILOG PATH src_SCR1/scr1_imem_router.sv
add_fileset_file scr1_ipic.sv SYSTEM_VERILOG PATH src_SCR1/scr1_ipic.sv
add_fileset_file scr1_mem_axi.sv SYSTEM_VERILOG PATH src_SCR1/scr1_mem_axi.sv
add_fileset_file scr1_pipe_csr.sv SYSTEM_VERILOG PATH src_SCR1/scr1_pipe_csr.sv
add_fileset_file scr1_pipe_exu.sv SYSTEM_VERILOG PATH src_SCR1/scr1_pipe_exu.sv
add_fileset_file scr1_pipe_hdu.sv SYSTEM_VERILOG PATH src_SCR1/scr1_pipe_hdu.sv
add_fileset_file scr1_pipe_ialu.sv SYSTEM_VERILOG PATH src_SCR1/scr1_pipe_ialu.sv
add_fileset_file scr1_pipe_idu.sv SYSTEM_VERILOG PATH src_SCR1/scr1_pipe_idu.sv
add_fileset_file scr1_pipe_ifu.sv SYSTEM_VERILOG PATH src_SCR1/scr1_pipe_ifu.sv
add_fileset_file scr1_pipe_lsu.sv SYSTEM_VERILOG PATH src_SCR1/scr1_pipe_lsu.sv
add_fileset_file scr1_pipe_mprf.sv SYSTEM_VERILOG PATH src_SCR1/scr1_pipe_mprf.sv
add_fileset_file scr1_pipe_tdu.sv SYSTEM_VERILOG PATH src_SCR1/scr1_pipe_tdu.sv
add_fileset_file scr1_pipe_top.sv SYSTEM_VERILOG PATH src_SCR1/scr1_pipe_top.sv
add_fileset_file scr1_reset_cells.sv SYSTEM_VERILOG PATH src_SCR1/scr1_reset_cells.sv
add_fileset_file scr1_scu.sv SYSTEM_VERILOG PATH src_SCR1/scr1_scu.sv
add_fileset_file scr1_tapc.sv SYSTEM_VERILOG PATH src_SCR1/scr1_tapc.sv
add_fileset_file scr1_tapc_shift_reg.sv SYSTEM_VERILOG PATH src_SCR1/scr1_tapc_shift_reg.sv
add_fileset_file scr1_tapc_synchronizer.sv SYSTEM_VERILOG PATH src_SCR1/scr1_tapc_synchronizer.sv
add_fileset_file scr1_tcm.sv SYSTEM_VERILOG PATH src_SCR1/scr1_tcm.sv
add_fileset_file scr1_timer.sv SYSTEM_VERILOG PATH src_SCR1/scr1_timer.sv
add_fileset_file scr1_top_ahb.sv SYSTEM_VERILOG PATH src_SCR1/scr1_top_ahb.sv
add_fileset_file scr1_tracelog.sv SYSTEM_VERILOG PATH src_SCR1/scr1_tracelog.sv
add_fileset_file ahb_avalon_bridge.sv SYSTEM_VERILOG PATH src_SCR1/ahb_avalon_bridge.sv
add_fileset_file scr1_top_avalon.sv SYSTEM_VERILOG PATH src_SCR1/scr1_top_avalon.sv TOP_LEVEL_FILE


# 
# connection point clock_sink
# 
add_interface clock_sink clock end
set_interface_property clock_sink clockRate 100000000
set_interface_property clock_sink ENABLED true
set_interface_property clock_sink EXPORT_OF ""
set_interface_property clock_sink PORT_NAME_MAP ""
set_interface_property clock_sink CMSIS_SVD_VARIABLES ""
set_interface_property clock_sink SVD_ADDRESS_GROUP ""
set_interface_property clock_sink IPXACT_REGISTER_MAP_VARIABLES ""
set_interface_property clock_sink SV_INTERFACE_TYPE ""
set_interface_property clock_sink SV_INTERFACE_MODPORT_TYPE ""

add_interface_port clock_sink clk clk Input 1


# 
# connection point reset_sink
# 
add_interface reset_sink reset end
set_interface_property reset_sink associatedClock clock_sink
set_interface_property reset_sink synchronousEdges DEASSERT
set_interface_property reset_sink ENABLED true
set_interface_property reset_sink EXPORT_OF ""
set_interface_property reset_sink PORT_NAME_MAP ""
set_interface_property reset_sink CMSIS_SVD_VARIABLES ""
set_interface_property reset_sink SVD_ADDRESS_GROUP ""
set_interface_property reset_sink IPXACT_REGISTER_MAP_VARIABLES ""
set_interface_property reset_sink SV_INTERFACE_TYPE ""
set_interface_property reset_sink SV_INTERFACE_MODPORT_TYPE ""
# add_interface_port reset_sink rst_n reset_n Input 1
add_interface_port reset_sink reset_n reset_n Input 1

# 
# Instruction Master (imem)
# 
add_interface imem avalon start
set_interface_property imem addressGroup 0
set_interface_property imem addressUnits SYMBOLS
set_interface_property imem associatedClock clock_sink
set_interface_property imem associatedReset reset_sink
set_interface_property imem bitsPerSymbol 8
set_interface_property imem burstOnBurstBoundariesOnly false
set_interface_property imem doStreamReads false
set_interface_property imem doStreamWrites false
set_interface_property imem holdTime 0
set_interface_property imem linewrapBursts false
set_interface_property imem maximumPendingReadTransactions 0
set_interface_property imem maximumPendingWriteTransactions 0
set_interface_property imem readLatency 0
set_interface_property imem readWaitTime 0
set_interface_property imem setupTime 0
set_interface_property imem timingUnits Cycles
set_interface_property imem writeWaitTime 0

add_interface_port imem imem_address address Output 32
add_interface_port imem imem_read read Output 1
add_interface_port imem imem_byteenable byteenable Output 4
add_interface_port imem imem_waitrequest waitrequest Input 1
add_interface_port imem imem_readdatavalid readdatavalid Input 1
add_interface_port imem imem_readdata readdata Input 32
# add_interface_port imem imem_response response Input 2

# 
# Data Master (dmem)
#
add_interface dmem avalon start
set_interface_property dmem addressGroup 0
set_interface_property dmem addressUnits SYMBOLS
set_interface_property dmem associatedClock clock_sink
set_interface_property dmem associatedReset reset_sink
set_interface_property dmem bitsPerSymbol 8
set_interface_property dmem burstOnBurstBoundariesOnly false
set_interface_property dmem doStreamReads false
set_interface_property dmem doStreamWrites false
set_interface_property dmem holdTime 0
set_interface_property dmem linewrapBursts false
set_interface_property dmem maximumPendingReadTransactions 0
set_interface_property dmem maximumPendingWriteTransactions 0
set_interface_property dmem readLatency 0
set_interface_property dmem readWaitTime 0
set_interface_property dmem setupTime 0
set_interface_property dmem timingUnits Cycles
set_interface_property dmem writeWaitTime 0

add_interface_port dmem dmem_address address Output 32
add_interface_port dmem dmem_write write Output 1
add_interface_port dmem dmem_read read Output 1
add_interface_port dmem dmem_byteenable byteenable Output 4
add_interface_port dmem dmem_writedata writedata Output 32
add_interface_port dmem dmem_waitrequest waitrequest Input 1
add_interface_port dmem dmem_readdatavalid readdatavalid Input 1
add_interface_port dmem dmem_readdata readdata Input 32
# add_interface_port dmem dmem_response response Input 2

# 
# connection point conduit_control
# 
add_interface conduit_control conduit end
set_interface_property conduit_control associatedClock ""
set_interface_property conduit_control associatedReset ""
set_interface_property conduit_control ENABLED true
set_interface_property conduit_control EXPORT_OF ""
set_interface_property conduit_control PORT_NAME_MAP ""
set_interface_property conduit_control CMSIS_SVD_VARIABLES ""
set_interface_property conduit_control SVD_ADDRESS_GROUP ""
set_interface_property conduit_control IPXACT_REGISTER_MAP_VARIABLES ""
set_interface_property conduit_control SV_INTERFACE_TYPE ""
set_interface_property conduit_control SV_INTERFACE_MODPORT_TYPE ""

add_interface_port conduit_control pwrup_rst_n pwrup_rst_n Input 1
add_interface_port conduit_control cpu_rst_n cpu_rst_n Input 1
add_interface_port conduit_control test_mode test_mode Input 1
add_interface_port conduit_control test_rst_n test_rst_n Input 1
add_interface_port conduit_control rtc_clk rtc_clk Input 1


# 
# connection point conduit_fuses
# 
add_interface conduit_fuses conduit end
set_interface_property conduit_fuses associatedClock ""
set_interface_property conduit_fuses associatedReset ""
set_interface_property conduit_fuses ENABLED true
set_interface_property conduit_fuses EXPORT_OF ""
set_interface_property conduit_fuses PORT_NAME_MAP ""
set_interface_property conduit_fuses CMSIS_SVD_VARIABLES ""
set_interface_property conduit_fuses SVD_ADDRESS_GROUP ""
set_interface_property conduit_fuses IPXACT_REGISTER_MAP_VARIABLES ""
set_interface_property conduit_fuses SV_INTERFACE_TYPE ""
set_interface_property conduit_fuses SV_INTERFACE_MODPORT_TYPE ""

add_interface_port conduit_fuses fuse_mhartid fuse_mhartid Input 32
add_interface_port conduit_fuses fuse_idcode fuse_idcode Input 32


# 
# connection point conduit_irq
# 
add_interface conduit_irq conduit end
set_interface_property conduit_irq associatedClock ""
set_interface_property conduit_irq associatedReset ""
set_interface_property conduit_irq ENABLED true
set_interface_property conduit_irq EXPORT_OF ""
set_interface_property conduit_irq PORT_NAME_MAP ""
set_interface_property conduit_irq CMSIS_SVD_VARIABLES ""
set_interface_property conduit_irq SVD_ADDRESS_GROUP ""
set_interface_property conduit_irq IPXACT_REGISTER_MAP_VARIABLES ""
set_interface_property conduit_irq SV_INTERFACE_TYPE ""
set_interface_property conduit_irq SV_INTERFACE_MODPORT_TYPE ""

add_interface_port conduit_irq irq_lines irq_lines Input 16

# 
# connection point conduit_jtag
# 
add_interface conduit_jtag conduit end
set_interface_property conduit_jtag associatedClock ""
set_interface_property conduit_jtag associatedReset ""
set_interface_property conduit_jtag ENABLED true
set_interface_property conduit_jtag EXPORT_OF ""
set_interface_property conduit_jtag PORT_NAME_MAP ""
set_interface_property conduit_jtag CMSIS_SVD_VARIABLES ""
set_interface_property conduit_jtag SVD_ADDRESS_GROUP ""
set_interface_property conduit_jtag IPXACT_REGISTER_MAP_VARIABLES ""
set_interface_property conduit_jtag SV_INTERFACE_TYPE ""
set_interface_property conduit_jtag SV_INTERFACE_MODPORT_TYPE ""

add_interface_port conduit_jtag trst_n trst_n Input 1
add_interface_port conduit_jtag tck tck Input 1
add_interface_port conduit_jtag tms tms Input 1
add_interface_port conduit_jtag tdi tdi Input 1
add_interface_port conduit_jtag tdo tdo Output 1
add_interface_port conduit_jtag tdo_en tdo_en Output 1