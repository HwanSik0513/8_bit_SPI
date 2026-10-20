#SPI Bridge Top - Cadence Genus Synthesis
# Technology : GPDK045
# Top Module : spi_bridge_top
# ============================================================

set TOP_DESIGN spi_bridge_top

set LOG_DIR      "./log"
set RPT_DIR      "./report"
set UNMAPPED_DIR "./unmapped"
set MAPPED_DIR   "./mapped"

file mkdir $LOG_DIR
file mkdir $RPT_DIR
file mkdir $UNMAPPED_DIR
file mkdir $MAPPED_DIR

# ------------------------------------------------------------
# Libraries
# ------------------------------------------------------------
set STD_LIB_PATH "../../../GPDK045/digital/gsclib045_all_v4.4/gsclib045/timing"
set IO_LIB_PATH  "../../../GPDK045/digital/giolib045_v3.5/timing"
set LEF_LIB_PATH "../../../GPDK045/digital/gsclib045_all_v4.4/gsclib045/lef ../../../GPDK045/digital/giolib045_v3.5/lef"
set QRC_FILE_PATH "../../../GPDK045/digital/gsclib045_all_v4.4/gsclib045_tech/qrc/qx"

set LIB_LIST {fast_vdd1v0_basicCells.lib slow_vdd1v0_basicCells.lib pads_SS_s1vg.lib}
set LEF_LIST {gsclib045_tech.lef gsclib045_macro.lef giolib045.lef}
set QRC_LIST {gpdk045.tch}

set_db auto_ungroup none
set_db max_cpus_per_server 2

set_db syn_generic_effort high
set_db syn_map_effort high
set_db syn_opt_effort high

set_db init_lib_search_path [concat $STD_LIB_PATH $IO_LIB_PATH $LEF_LIB_PATH $QRC_FILE_PATH]

read_libs $LIB_LIST
read_physical -lef $LEF_LIST
read_qrc $QRC_LIST

set_db hdl_array_naming_style %s_%d
set_db / .uniquify_naming_style ${TOP_DESIGN}_%s_%d

# ------------------------------------------------------------
# RTL Sources
# ------------------------------------------------------------
set RTL_SOURCES "../RTL/Async_fifo.v \
                 ../RTL/Pulse_sync.v \
                 ../RTL/Register_block.v \
                 ../RTL/Reset_sync.v \
                 ../RTL/Sclk_gen.v \
                 ../RTL/Spi_master.v \
                 ../RTL/Spi_slave.v \
                 ../RTL/Spi_bridge_top.v"

read_hdl $RTL_SOURCES
elaborate $TOP_DESIGN

time_info Elaboration

set_db optimize_merge_flops false
set_db optimize_merge_latches false

uniquify -verbose $TOP_DESIGN

check_design > ${RPT_DIR}/00_check_design.rpt
check_design -unresolved >> ${RPT_DIR}/00_check_design.rpt

# ------------------------------------------------------------
# Constraints
# ------------------------------------------------------------
source -verbose ./cons/spi_bridge_top.sdc
source -verbose ./cons/dont_use_45nm.tcl

check_timing_intent -verbose > ${RPT_DIR}/01_check_timing_intent.rpt

report_port -delay -driver [all_inputs] > ${RPT_DIR}/02_report_port.rpt
report_port -delay -load [all_outputs] >> ${RPT_DIR}/02_report_port.rpt

# ------------------------------------------------------------
# Generic Synthesis
# ------------------------------------------------------------
syn_generic

time_info GENERIC
report_datapath > ${RPT_DIR}/03_report_datapath_generic.rpt

write_snapshot -outdir $RPT_DIR -tag syn_generic
write_db -to_file ${UNMAPPED_DIR}/syn_generic.db

# ------------------------------------------------------------
# Technology Mapping
# ------------------------------------------------------------
syn_map

time_info MAPPED
report_datapath > ${RPT_DIR}/04_report_datapath_map.rpt

foreach cg [vfind / -cost_group *] {
    report timing -cost_group [list $cg] > ${RPT_DIR}/05_[basename $cg]_post_syn_map.rpt
}

write_snapshot -outdir $RPT_DIR -tag syn_map
write_db -to_file ${MAPPED_DIR}/syn_map.db

# ------------------------------------------------------------
# Optimization
# ------------------------------------------------------------
syn_opt

report_constraint -all_violators > ${RPT_DIR}/06_report_constraint.rpt

write_snapshot -outdir $RPT_DIR -tag syn_opt

time_info OPT

foreach cg [vfind / -cost_group *] {
    report timing -cost_group [list $cg] > ${RPT_DIR}/07_[basename $cg]_post_syn_opt.rpt
}

write_db -to_file ${MAPPED_DIR}/syn_opt.db

# ------------------------------------------------------------
# Final Reports
# ------------------------------------------------------------
report_analysis_views -type all > ${RPT_DIR}/08_${TOP_DESIGN}_SYN_analysis_view.rpt
report_area > ${RPT_DIR}/09_${TOP_DESIGN}_SYN_area.rpt
report_clocks > ${RPT_DIR}/10_${TOP_DESIGN}_SYN_clock.rpt
report_clocks -generated >> ${RPT_DIR}/10_${TOP_DESIGN}_SYN_clock.rpt
report_datapath > ${RPT_DIR}/11_${TOP_DESIGN}_SYN_datapath.rpt
report_design_rules > ${RPT_DIR}/12_${TOP_DESIGN}_SYN_design_rules.rpt
report_gates > ${RPT_DIR}/13_${TOP_DESIGN}_SYN_gate.rpt
report_gates -power >> ${RPT_DIR}/13_${TOP_DESIGN}_SYN_gate.rpt
report_hierarchy > ${RPT_DIR}/14_${TOP_DESIGN}_SYN_hier.rpt
report_memory_cells > ${RPT_DIR}/15_${TOP_DESIGN}_SYN_mem_cell.rpt
report_messages -all > ${RPT_DIR}/16_${TOP_DESIGN}_SYN_message.rpt
report_nets -hierarchical > ${RPT_DIR}/17_${TOP_DESIGN}_SYN_net.rpt
report_power > ${RPT_DIR}/18_${TOP_DESIGN}_SYN_pwr.rpt
report_qor > ${RPT_DIR}/19_${TOP_DESIGN}_SYN_qor.rpt
report_timing -nworst 100 -net > ${RPT_DIR}/20_${TOP_DESIGN}_SYN_timing.rpt

report_summary

# ------------------------------------------------------------
# Export Mapped Design
# ------------------------------------------------------------
write_design -basename ${MAPPED_DIR}/${TOP_DESIGN}_mapped

write_hdl > ${MAPPED_DIR}/${TOP_DESIGN}_syn_final.v
write_sdc > ${MAPPED_DIR}/${TOP_DESIGN}_syn_final.sdc

write_sdf -timescale ns -nonegchecks -recrem split -edges check_edge -setuphold split > ${MAPPED_DIR}/${TOP_DESIGN}_delays.sdf

# ------------------------------------------------------------
# Finish
# ------------------------------------------------------------
time_info FINAL

puts "============================"
puts "Synthesis Finished ........."
puts "============================"

