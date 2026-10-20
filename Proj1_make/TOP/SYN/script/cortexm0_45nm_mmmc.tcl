### Template Script for RTL->Gate-Level Flow (generated from GENUS 17.10-p007_1) 

if {[file exists /proc/cpuinfo]} {
  sh grep "model name" /proc/cpuinfo
  sh grep "cpu MHz"    /proc/cpuinfo
}

puts "Hostname : [info hostname]"

######################################################################
# Preset global variables and attributes
######################################################################

set TOP_DESIGN  cmsdk_mcu

set LOG_DIR     "./log"
set RPT_DIR     "./report"
set UNMAPPED_DIR   "./unmapped"
set MAPPED_DIR     "./mapped"

#GPDK 045 SVT
set STD_LIB_PATH "../../../GPDK045/digital/gsclib045_all_v4.4/gsclib045/timing"
set IO_LIB_PATH "../../../GPDK045/digital/giolib045_v3.5/timing"
set LEF_LIB_PATH "../../../GPDK045/digital/gsclib045_all_v4.4/gsclib045/lef ../../../GPDK045/digital/giolib045_v3.5/lef"
set RTL_PATH     "../RTL/"
set QRC_FILE_PATH "../../../GPDK045/digital/gsclib045_all_v4.4/gsclib045_tech/qrc/qx"

#GPDK 045 SVT
set LIB_LIST {fast_vdd1v0_basicCells.lib slow_vdd1v0_basicCells.lib pads_SS_s1vg.lib}
set LEF_LIST {gsclib045_tech.lef gsclib045_macro.lef giolib045.lef}
set QRC_LIST {gpdk045.tch}

set RTL_SOURCES "../RTL/cmsdk_mcu.v \
		../RTL/verilog_smkcow/cmsdk_mcu_clkctrl.v \
		../RTL/verilog_smkcow/cmsdk_mcu_pin_mux.v \
		../../../cortexm0_designstart/implementation/cortex_m0_mcu_system_cadence_7ns/mapped/cmsdk_mcu_system_syn_final.v \
"
set_db auto_ungroup none
set_db max_cpus_per_server 2

##Set synthesizing effort for each synthesis stage
set_db syn_generic_effort high; # Default medium
set_db syn_map_effort high;     # Default medium
set_db syn_opt_effort high;     # Default medium

set_db init_lib_search_path [concat $STD_LIB_PATH $IO_LIB_PATH $LEF_LIB_PATH $QRC_FILE_PATH]
set_db init_hdl_search_path [concat $RTL_PATH]

#read_libs and read_mmmc commands conflicts each other
#read_libs ${LIB_LIST}
read_mmmc cons/cmsdk_mcu.mmmc.view
#source cons/cmsdk_mcu.mmmc.view
read_physical -lef ${LEF_LIST}
read_qrc ${QRC_LIST}

##generates <signal>_reg[<bit_width>] format
set_db hdl_array_naming_style %s_%d
set_db / .uniquify_naming_style ${TOP_DESIGN}_%s_%d

####################################################################
## Load Design
####################################################################

#read_hdl -f $RTL_SOURCES -define Func_mode -define cadence_045nm
# -f option is for the case that all files are defined in a specific file
read_hdl $RTL_SOURCES 

elaborate ${TOP_DESIGN}
puts "Runtime & Memory after 'read_hdl'"
time_info Elaboration

init_design

set_db hinst:u_cmsdk_mcu_system .preserve true
set_db optimize_merge_flops false
set_db optimize_merge_latches false

uniquify -verbose ${TOP_DESIGN}

check_design > ${RPT_DIR}/00_check_design.rpt


####################################################################
## Constraints Setup
####################################################################

#read_sdc  ./cons/cmsdk_mcu.sdc
#source -verbose  ./cons/cmsdk_mcu.sdc     ; #This command can't write report by using the mark '>'
source -verbose  ./cons/dont_use_45nm.tcl ; #This command can't write report by using the mark '>'
puts "The number of exceptions is [llength [vfind "design:$TOP_DESIGN" -exception *]]"
#set_db "design:$DESIGN" .force_wireload <wireload name> 

check_timing_intent -verbose > ${RPT_DIR}/01_check_timing.rpt

report_port -delay -driver [all_inputs] > ${RPT_DIR}/02_report_port.rpt
report_port -delay -load [all_outputs] >> ${RPT_DIR}/02_report_port.rpt

echo -n "\n TIMEX > compile is ready :            ";
sh date

####################################################################################################
## Synthesizing to generic 
####################################################################################################

syn_generic ; #This command can't write report by using the mark '>'
#syn_generic -physical
puts "Runtime & Memory after 'syn_generic'"
time_info GENERIC
report_datapath > ${RPT_DIR}/03_report_datapath_generic.rpt

write_snapshot -outdir ${RPT_DIR} -tag syn_generic
# Below 2 lines are the same with the above command :: write_snapshot
#report_summary -directory $_REPORTS_PATH
#summary_table -directory ${RPT_DIR}

write_db -to_file  ${UNMAPPED_DIR}/syn_generic.db

####################################################################################################
## Synthesizing to gates
####################################################################################################

syn_map ; #This command can't write report by using the mark '>'
#syn_map -physical
puts "Runtime & Memory after 'syn_map'"
time_info MAPPED

report_datapath > ${RPT_DIR}/04_report_datapath_map.rpt

foreach cg [vfind / -cost_group *] {
  report timing -cost_group [list $cg] > ${RPT_DIR}/05_[basename $cg]_post_syn_map.rpt
  }

write_snapshot -outdir ${RPT_DIR} -tag syn_map
# Below line is the same with the above command :: write_snapshot
#summary_table -directory ${RPT_DIR}

write_db -to_file ${MAPPED_DIR}/syn_map.db

#######################################################################################################
## Optimize Netlist + Incremental
#######################################################################################################

syn_opt ; #This command can't write report by using the mark '>'
#syn_opt -incremental
#syn_opt -physical

report_constraint -all_violators > ${RPT_DIR}/06_report_constraint.rpt

write_snapshot -outdir ${RPT_DIR} -tag syn_opt
# Below line is the same with the above command :: write_snapshot
#summary_table -directory ${RPT_DIR}

puts "Runtime & Memory after syn_opt"
time_info OPT

foreach cg [vfind / -cost_group *] {
  report timing -cost_group [list $cg] > ${RPT_DIR}/07_[basename $cg]_post_syn_opt.rpt
  }

write_db -to_file ${MAPPED_DIR}/syn_opt.db


echo -n "\n TIMEX > Compile is completed :            ";
sh date

######################################################################################################
## REPORTS 
######################################################################################################

report_analysis_views -type all           > ${RPT_DIR}/08_${TOP_DESIGN}_SYN_analysis_view.rpt 
report_area                               > ${RPT_DIR}/09_${TOP_DESIGN}_SYN_area.rpt 
report_clocks                             > ${RPT_DIR}/10_${TOP_DESIGN}_SYN_clock.rpt 
report_clocks -generated                 >> ${RPT_DIR}/10_${TOP_DESIGN}_SYN_clock.rpt
report_datapath                           > ${RPT_DIR}/11_${TOP_DESIGN}_SYN_datapath.rpt
report_design_rules                       > ${RPT_DIR}/12_${TOP_DESIGN}_SYN_design_rules.rpt 
report_gates                              > ${RPT_DIR}/13_${TOP_DESIGN}_SYN_gate.rpt 
report_gates -power                      >> ${RPT_DIR}/13_${TOP_DESIGN}_SYN_gate.rpt 
report_hierarchy                          > ${RPT_DIR}/14_${TOP_DESIGN}_SYN_hier.rpt 
report_memory_cells                       > ${RPT_DIR}/15_${TOP_DESIGN}_SYN_mem_cell.rpt 
report_messages -all                      > ${RPT_DIR}/16_${TOP_DESIGN}_SYN_message.rpt 
report_nets -hierarchical                 > ${RPT_DIR}/17_${TOP_DESIGN}_SYN_net.rpt 
report_power                              > ${RPT_DIR}/18_${TOP_DESIGN}_SYN_pwr.rpt
report_qor                                > ${RPT_DIR}/19_${TOP_DESIGN}_SYN_qor.rpt 
report_timing -nworst 100 -net            > ${RPT_DIR}/20_${TOP_DESIGN}_SYN_timing.rpt 
report_summary 			          > ${RPT_DIR}/21_${TOP_DESIGN}_SYN_summary.rpt 


######################################################################################################
## write Innovus file set (verilog, SDC, config, etc.)
######################################################################################################

#source -echo ./script/report_syn.tcl
write_design -basename ${MAPPED_DIR}/${TOP_DESIGN}_mapped
write_hdl  > ${MAPPED_DIR}/${TOP_DESIGN}_syn_final.v
write_sdc  > ${MAPPED_DIR}/${TOP_DESIGN}_syn_final.sdc
write_sdf -timescale ns -nonegchecks -recrem split -edges check_edge  -setuphold split > ${MAPPED_DIR}/${TOP_DESIGN}_delays.sdf

#################################
### write_do_lec
#################################

#write_do_lec -golden_design ${MAPPED_DIR}/${TOP_DESIGN}_rtl_2_lec.v -revised_design ${MAPPED_DIR}/${TOP_DESIGN}_syn_final.v -logfile  ${LOG_DIR}/rtl_2_lec_final.log > ${MAPPED_DIR}/rtl_2_lec_final.do

echo -n "\n TIMEX > End :             " ;
sh date

puts "Final Runtime & Memory."
time_info FINAL
puts "============================"
puts "Synthesis Finished ........."
puts "============================"

#quit
