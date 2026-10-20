######################################################################

# Created by Genus(TM) Synthesis Solution 22.17-s071_1 on Tue Oct 20 19:10:07 KST 2026

# This file contains the Genus script for design:spi_bridge_top

######################################################################

set_db -quiet init_lib_search_path {../../../GPDK045/digital/gsclib045_all_v4.4/gsclib045/timing ../../../GPDK045/digital/giolib045_v3.5/timing ../../../GPDK045/digital/gsclib045_all_v4.4/gsclib045/lef ../../../GPDK045/digital/giolib045_v3.5/lef ../../../GPDK045/digital/gsclib045_all_v4.4/gsclib045_tech/qrc/qx}
set_db -quiet operating_conditions_min PVT_1P1V_0C
set_db -quiet operating_conditions_min_library library:default_emulate_libset_max/fast_vdd1v0
set_db -quiet operating_conditions_library_given true
set_db -quiet design_mode_process 60.0
set_db -quiet phys_assume_met_fill 0.0
set_db -quiet map_placed_for_route_early_global false
set_db -quiet phys_use_invs_extraction true
set_db -quiet phys_route_time_out 120.0
set_db -quiet db_units 2000
set_db -quiet capacitance_per_unit_length_mmmc {}
set_db -quiet resistance_per_unit_length_mmmc {}
set_db -quiet runtime_by_stage {{PBS_Generic-Start 0 21 0.0 18.990662} {to_generic 5 26 4 24} {first_condense 3 29 3 29} {PBS_Generic_Opt-Post 9 30 9.027272 28.017934} {{PBS_Generic-Postgen HBO Optimizations} 0 30 0.0 28.017934} {PBS_TechMap-Start 0 32 0.0 29.995753} {{PBS_TechMap-Premap HBO Optimizations} 0 32 0.0 29.995753} {second_condense 2 34 2 33} {reify 5 39 5 39} {global_incr_map 0 39 0 40} {{PBS_Techmap-Global Mapping} 7 39 7.516904000000004 37.512657000000004} {{PBS_TechMap-Datapath Postmap Operations} 2 42 1.9907249999999976 39.503382} {{PBS_TechMap-Postmap HBO Optimizations} 0 42 -0.008599000000003798 39.494783} {{PBS_TechMap-Postmap Clock Gating} 0 42 0.0 39.494783} {{PBS_TechMap-Postmap Cleanup} 0 42 -0.008323999999994669 39.486459} {PBS_Techmap-Post_MBCI 0 42 0.0 39.486459} {incr_opt 2 46 2 46} }
set_db -quiet timing_adjust_tns_of_complex_flops false
set_db -quiet hdl_array_naming_style %s_%d
set_db -quiet tinfo_tstamp_file .rs_hah003.tstamp
set_db -quiet metric_enable true
set_db -quiet auto_ungroup none
set_db -quiet max_cpus_per_server 2
set_db -quiet syn_generic_effort high
set_db -quiet use_area_from_lef true
set_db -quiet uniquify_naming_style spi_bridge_top_%s_%d
set_db -quiet optimize_merge_flops false
set_db -quiet optimize_merge_latches false
set_db -quiet pin:spi_bridge_top/u_sclk_gen/o_sclk_reg/Q .break_timing_paths true
set_db -quiet phys_use_segment_parasitics true
set_db -quiet probabilistic_extraction true
set_db -quiet ple_correlation_factors {1.9000 2.0000}
set_db -quiet maximum_interval_of_vias inf
set_db -quiet layer_aware_buffer true
set_db -quiet ple_mode global
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/ANTENNA .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY1X1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY1X4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY2X1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY2X4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY3X1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY3X4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY4X1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY4X4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/HOLDX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFNSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFNSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFNSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFNSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFQXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFTRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFTRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFTRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFTRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TIEHI .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TIELO .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX12 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX16 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX20 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX3 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX6 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX12 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX16 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX20 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX3 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX6 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/ANTENNA .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DFFSXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY1X1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY1X4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY2X1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY2X4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY3X1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY3X4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY4X1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/DLY4X4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/HOLDX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFNSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFNSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFNSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFNSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFQXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRHQX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRHQX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRHQX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRHQX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFSXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFTRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFTRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFTRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFTRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/SDFFXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TIEHI .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TIELO .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX12 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX16 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX20 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX3 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX6 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNCAX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX12 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX16 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX20 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX3 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX6 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNTSCAX8 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATNXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATSRX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATSRX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATSRX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATSRXL .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATX1 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATX2 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATX4 .avoid true
set_db -quiet lib_cell:default_emulate_libset_max/fast_vdd1v0/TLATXL .avoid true
set_db -quiet operating_conditions operating_condition:default_emulate_libset_max/slow_vdd1v0/PVT_0P9V_125C
set_db -quiet wireload_selection none
set_db -quiet operating_condition:default_emulate_libset_max/fast_vdd1v0/PVT_1P1V_0C .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/fast_vdd1v0/_nominal_ .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/slow_vdd1v0/PVT_0P9V_125C .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/slow_vdd1v0/_nominal_ .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/giolib045/slow .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/giolib045/_nominal_ .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/fast_vdd1v0/PVT_1P1V_0C .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/fast_vdd1v0/_nominal_ .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/slow_vdd1v0/PVT_0P9V_125C .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/slow_vdd1v0/_nominal_ .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/giolib045/slow .tree_type balanced_tree
set_db -quiet operating_condition:default_emulate_libset_max/giolib045/_nominal_ .tree_type balanced_tree
# BEGIN MSV SECTION
# END MSV SECTION
define_clock -name ACLK -domain domain_1 -period 1000.0 -divide_period 1 -rise 0 -divide_rise 1 -fall 1 -divide_fall 2 -remove -design design:spi_bridge_top port:spi_bridge_top/ACLK
set_db -quiet clock:spi_bridge_top/ACLK .slew {100.0 100.0 100.0 100.0}
set_db -quiet clock:spi_bridge_top/ACLK .clock_network_late_latency {200.0 200.0 200.0 200.0}
set_db -quiet clock:spi_bridge_top/ACLK .clock_source_late_latency {200.0 200.0 200.0 200.0}
set_db -quiet clock:spi_bridge_top/ACLK .clock_setup_uncertainty {100.0 100.0}
define_clock -name SCLK -domain domain_1 -period 4000.0 -divide_period 1 -rise 0 -divide_rise 1 -fall 1 -divide_fall 2 -remove -design design:spi_bridge_top pin:spi_bridge_top/u_sclk_gen/o_sclk_reg/Q
set_db -quiet clock:spi_bridge_top/SCLK .generate_script {::dc::cgc::update_generated_clock {} {4} {} {} 0 {} {}}
set_db -quiet clock:spi_bridge_top/SCLK .generate_point port:spi_bridge_top/ACLK
set_db -quiet clock:spi_bridge_top/SCLK .slew {100.0 100.0 100.0 100.0}
set_db -quiet clock:spi_bridge_top/SCLK .clock_setup_uncertainty {100.0 100.0}
define_cost_group -design design:spi_bridge_top -name ACLK
define_cost_group -design design:spi_bridge_top -name SCLK
external_delay -accumulate -input {0.0 no_value 0.0 no_value} -clock clock:spi_bridge_top/ACLK -name create_clock_delay_domain_1_ACLK_R_0 port:spi_bridge_top/ACLK
set_db -quiet external_delay:spi_bridge_top/create_clock_delay_domain_1_ACLK_R_0 .clock_network_latency_included true
external_delay -accumulate -input {no_value 0.0 no_value 0.0} -clock clock:spi_bridge_top/ACLK -edge_fall -name create_clock_delay_domain_1_ACLK_F_0 port:spi_bridge_top/ACLK
set_db -quiet external_delay:spi_bridge_top/create_clock_delay_domain_1_ACLK_F_0 .clock_network_latency_included true
external_delay -accumulate -input {0.0 no_value 0.0 no_value} -clock clock:spi_bridge_top/SCLK -name create_clock_delay_domain_1_SCLK_R_0 pin:spi_bridge_top/u_sclk_gen/o_sclk_reg/Q
set_db -quiet external_delay:spi_bridge_top/create_clock_delay_domain_1_SCLK_R_0 .clock_network_latency_included true
external_delay -accumulate -input {no_value 0.0 no_value 0.0} -clock clock:spi_bridge_top/SCLK -edge_fall -name create_clock_delay_domain_1_SCLK_F_0 pin:spi_bridge_top/u_sclk_gen/o_sclk_reg/Q
set_db -quiet external_delay:spi_bridge_top/create_clock_delay_domain_1_SCLK_F_0 .clock_network_latency_included true
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:spi_bridge_top/ACLK -name in_del {{port:spi_bridge_top/i_bus_addr[7]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:spi_bridge_top/ACLK -name in_del_1_1 {{port:spi_bridge_top/i_bus_addr[6]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:spi_bridge_top/ACLK -name in_del_2_1 {{port:spi_bridge_top/i_bus_addr[5]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:spi_bridge_top/ACLK -name in_del_3_1 {{port:spi_bridge_top/i_bus_addr[4]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:spi_bridge_top/ACLK -name in_del_4_1 {{port:spi_bridge_top/i_bus_addr[3]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:spi_bridge_top/ACLK -name in_del_5_1 {{port:spi_bridge_top/i_bus_addr[2]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:spi_bridge_top/ACLK -name in_del_6_1 {{port:spi_bridge_top/i_bus_addr[1]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:spi_bridge_top/ACLK -name in_del_7_1 {{port:spi_bridge_top/i_bus_addr[0]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:spi_bridge_top/ACLK -name in_del_8_1 port:spi_bridge_top/i_bus_wr_en
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:spi_bridge_top/ACLK -name in_del_9_1 {{port:spi_bridge_top/i_bus_wdata[7]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:spi_bridge_top/ACLK -name in_del_10_1 {{port:spi_bridge_top/i_bus_wdata[6]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:spi_bridge_top/ACLK -name in_del_11_1 {{port:spi_bridge_top/i_bus_wdata[5]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:spi_bridge_top/ACLK -name in_del_12_1 {{port:spi_bridge_top/i_bus_wdata[4]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:spi_bridge_top/ACLK -name in_del_13_1 {{port:spi_bridge_top/i_bus_wdata[3]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:spi_bridge_top/ACLK -name in_del_14_1 {{port:spi_bridge_top/i_bus_wdata[2]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:spi_bridge_top/ACLK -name in_del_15_1 {{port:spi_bridge_top/i_bus_wdata[1]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:spi_bridge_top/ACLK -name in_del_16_1 {{port:spi_bridge_top/i_bus_wdata[0]}}
external_delay -accumulate -input {no_value no_value 100.0 100.0} -clock clock:spi_bridge_top/ACLK -name in_del_17_1 port:spi_bridge_top/i_bus_rd_en
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:spi_bridge_top/ACLK -name in_del_18_1 {{port:spi_bridge_top/i_bus_addr[7]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:spi_bridge_top/ACLK -name in_del_19_1 {{port:spi_bridge_top/i_bus_addr[6]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:spi_bridge_top/ACLK -name in_del_20_1 {{port:spi_bridge_top/i_bus_addr[5]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:spi_bridge_top/ACLK -name in_del_21_1 {{port:spi_bridge_top/i_bus_addr[4]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:spi_bridge_top/ACLK -name in_del_22_1 {{port:spi_bridge_top/i_bus_addr[3]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:spi_bridge_top/ACLK -name in_del_23_1 {{port:spi_bridge_top/i_bus_addr[2]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:spi_bridge_top/ACLK -name in_del_24_1 {{port:spi_bridge_top/i_bus_addr[1]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:spi_bridge_top/ACLK -name in_del_25_1 {{port:spi_bridge_top/i_bus_addr[0]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:spi_bridge_top/ACLK -name in_del_26_1 port:spi_bridge_top/i_bus_wr_en
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:spi_bridge_top/ACLK -name in_del_27_1 {{port:spi_bridge_top/i_bus_wdata[7]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:spi_bridge_top/ACLK -name in_del_28_1 {{port:spi_bridge_top/i_bus_wdata[6]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:spi_bridge_top/ACLK -name in_del_29_1 {{port:spi_bridge_top/i_bus_wdata[5]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:spi_bridge_top/ACLK -name in_del_30_1 {{port:spi_bridge_top/i_bus_wdata[4]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:spi_bridge_top/ACLK -name in_del_31_1 {{port:spi_bridge_top/i_bus_wdata[3]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:spi_bridge_top/ACLK -name in_del_32_1 {{port:spi_bridge_top/i_bus_wdata[2]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:spi_bridge_top/ACLK -name in_del_33_1 {{port:spi_bridge_top/i_bus_wdata[1]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:spi_bridge_top/ACLK -name in_del_34_1 {{port:spi_bridge_top/i_bus_wdata[0]}}
external_delay -accumulate -input {10.0 10.0 no_value no_value} -clock clock:spi_bridge_top/ACLK -name in_del_35_1 port:spi_bridge_top/i_bus_rd_en
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:spi_bridge_top/ACLK -name ou_del {{port:spi_bridge_top/o_bus_rdata[7]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:spi_bridge_top/ACLK -name ou_del_35_1 {{port:spi_bridge_top/o_bus_rdata[6]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:spi_bridge_top/ACLK -name ou_del_36_1 {{port:spi_bridge_top/o_bus_rdata[5]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:spi_bridge_top/ACLK -name ou_del_37_1 {{port:spi_bridge_top/o_bus_rdata[4]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:spi_bridge_top/ACLK -name ou_del_38_1 {{port:spi_bridge_top/o_bus_rdata[3]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:spi_bridge_top/ACLK -name ou_del_39_1 {{port:spi_bridge_top/o_bus_rdata[2]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:spi_bridge_top/ACLK -name ou_del_40_1 {{port:spi_bridge_top/o_bus_rdata[1]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:spi_bridge_top/ACLK -name ou_del_41_1 {{port:spi_bridge_top/o_bus_rdata[0]}}
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:spi_bridge_top/ACLK -name ou_del_42_1 port:spi_bridge_top/o_overflow
external_delay -accumulate -output {no_value no_value 100.0 100.0} -clock clock:spi_bridge_top/ACLK -name ou_del_43_1 port:spi_bridge_top/o_rx_valid
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:spi_bridge_top/ACLK -name ou_del_44_1 {{port:spi_bridge_top/o_bus_rdata[7]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:spi_bridge_top/ACLK -name ou_del_45_1 {{port:spi_bridge_top/o_bus_rdata[6]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:spi_bridge_top/ACLK -name ou_del_46_1 {{port:spi_bridge_top/o_bus_rdata[5]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:spi_bridge_top/ACLK -name ou_del_47_1 {{port:spi_bridge_top/o_bus_rdata[4]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:spi_bridge_top/ACLK -name ou_del_48_1 {{port:spi_bridge_top/o_bus_rdata[3]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:spi_bridge_top/ACLK -name ou_del_49_1 {{port:spi_bridge_top/o_bus_rdata[2]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:spi_bridge_top/ACLK -name ou_del_50_1 {{port:spi_bridge_top/o_bus_rdata[1]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:spi_bridge_top/ACLK -name ou_del_51_1 {{port:spi_bridge_top/o_bus_rdata[0]}}
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:spi_bridge_top/ACLK -name ou_del_52_1 port:spi_bridge_top/o_overflow
external_delay -accumulate -output {-10.0 -10.0 no_value no_value} -clock clock:spi_bridge_top/ACLK -name ou_del_53_1 port:spi_bridge_top/o_rx_valid
path_group -paths [specify_paths -lenient -to clock:spi_bridge_top/ACLK]  -name ACLK -group cost_group:spi_bridge_top/ACLK -user_priority -1047552
path_group -paths [specify_paths -lenient -to clock:spi_bridge_top/SCLK]  -name SCLK -group cost_group:spi_bridge_top/SCLK -user_priority -1047552
path_disable -paths [specify_paths -lenient -to {port:spi_bridge_top/o_dbg_sclk port:spi_bridge_top/o_dbg_cs_n port:spi_bridge_top/o_dbg_mosi port:spi_bridge_top/o_dbg_miso}]  -name dis_1 -user_priority -761856
path_disable -paths [specify_paths -lenient -from port:spi_bridge_top/ARESETn]  -name dis_2 -user_priority -770048
# BEGIN DFT SECTION
set_db -quiet dft_scan_style muxed_scan
set_db -quiet dft_scanbit_waveform_analysis false
# END DFT SECTION
set_db -quiet design:spi_bridge_top .seq_reason_deleted_internal {{u_spi_master/o_rx_captured_reg_0 unloaded {u_spi_master/o_rx_captured[0]}} {u_spi_master/o_rx_captured_reg_1 unloaded {u_spi_master/o_rx_captured[1]}} {u_spi_master/o_rx_captured_reg_2 unloaded {u_spi_master/o_rx_captured[2]}} {u_spi_master/o_rx_captured_reg_3 unloaded {u_spi_master/o_rx_captured[3]}} {u_spi_master/o_rx_captured_reg_4 unloaded {u_spi_master/o_rx_captured[4]}} {u_spi_master/o_rx_captured_reg_5 unloaded {u_spi_master/o_rx_captured[5]}} {u_spi_master/o_rx_captured_reg_6 unloaded {u_spi_master/o_rx_captured[6]}} {u_spi_master/o_rx_captured_reg_7 unloaded {u_spi_master/o_rx_captured[7]}} {u_spi_master/o_rx_captured_valid_reg unloaded u_spi_master/o_rx_captured_valid} {u_spi_master/r_shift_in_reg_0 unloaded {u_spi_master/r_shift_in[0]}} {u_spi_master/r_shift_in_reg_1 unloaded {u_spi_master/r_shift_in[1]}} {u_spi_master/r_shift_in_reg_2 unloaded {u_spi_master/r_shift_in[2]}} {u_spi_master/r_shift_in_reg_3 unloaded {u_spi_master/r_shift_in[3]}} {u_spi_master/r_shift_in_reg_4 unloaded {u_spi_master/r_shift_in[4]}} {u_spi_master/r_shift_in_reg_5 unloaded {u_spi_master/r_shift_in[5]}} {u_spi_master/r_shift_in_reg_6 unloaded {u_spi_master/r_shift_in[6]}} {u_spi_master/r_shift_in_reg_7 unloaded {u_spi_master/r_shift_in[7]}}}
set_db -quiet design:spi_bridge_top .qos_by_stage {{to_generic {wns -11111111} {tns -111111111} {vep -111111111} {area 5190} {cell_count 905} {utilization  0.00} {runtime 5 26 4 24} }{first_condense {wns -11111111} {tns -111111111} {vep -111111111} {area 5651} {cell_count 1318} {utilization  0.00} {runtime 3 29 3 29} }{second_condense {wns -11111111} {tns -111111111} {vep -111111111} {area 5651} {cell_count 1319} {utilization  0.00} {runtime 2 34 2 33} }{reify {wns 109} {tns 0} {vep 0} {area 3691} {cell_count 896} {utilization  0.00} {runtime 5 39 5 39} }{global_incr_map {wns 109} {tns 0} {vep 0} {area 3547} {cell_count 855} {utilization  0.00} {runtime 0 39 0 40} }{incr_opt {wns 214748365} {tns 0} {vep 0} {area 3531} {cell_count 834} {utilization  0.00} {runtime 2 46 2 46} }}
set_db -quiet design:spi_bridge_top .seq_mbci_coverage 0.0
set_db -quiet design:spi_bridge_top .hdl_filelist {{default -v2001 {SYNTHESIS} {../RTL/Async_fifo.v ../RTL/Pulse_sync.v ../RTL/Register_block.v ../RTL/Reset_sync.v ../RTL/Sclk_gen.v ../RTL/Spi_master.v ../RTL/Spi_slave.v ../RTL/Spi_bridge_top.v} {} {}}}
set_db -quiet design:spi_bridge_top .verification_directory fv/spi_bridge_top
set_db -quiet design:spi_bridge_top .seq_reason_deleted {{u_spi_master/o_rx_captured_reg_0 unloaded} {u_spi_master/o_rx_captured_reg_1 unloaded} {u_spi_master/o_rx_captured_reg_2 unloaded} {u_spi_master/o_rx_captured_reg_3 unloaded} {u_spi_master/o_rx_captured_reg_4 unloaded} {u_spi_master/o_rx_captured_reg_5 unloaded} {u_spi_master/o_rx_captured_reg_6 unloaded} {u_spi_master/o_rx_captured_reg_7 unloaded} {u_spi_master/o_rx_captured_valid_reg unloaded} {u_spi_master/r_shift_in_reg_0 unloaded} {u_spi_master/r_shift_in_reg_1 unloaded} {u_spi_master/r_shift_in_reg_2 unloaded} {u_spi_master/r_shift_in_reg_3 unloaded} {u_spi_master/r_shift_in_reg_4 unloaded} {u_spi_master/r_shift_in_reg_5 unloaded} {u_spi_master/r_shift_in_reg_6 unloaded} {u_spi_master/r_shift_in_reg_7 unloaded}}
set_db -quiet port:spi_bridge_top/ACLK .is_ideal_network true
set_db -quiet port:spi_bridge_top/ACLK .original_name ACLK
set_db -quiet port:spi_bridge_top/ACLK .ideal_network true
set_db -quiet port:spi_bridge_top/ARESETn .driver_pin_rise_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet port:spi_bridge_top/ARESETn .driver_pin_fall_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet port:spi_bridge_top/ARESETn .driver_pin_rise_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet port:spi_bridge_top/ARESETn .driver_pin_fall_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet port:spi_bridge_top/ARESETn .is_ideal_network true
set_db -quiet port:spi_bridge_top/ARESETn .original_name ARESETn
set_db -quiet port:spi_bridge_top/ARESETn .ideal_network true
set_db -quiet {port:spi_bridge_top/i_bus_addr[7]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_addr[7]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_addr[7]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_addr[7]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_addr[7]} .original_name {i_bus_addr[7]}
set_db -quiet {port:spi_bridge_top/i_bus_addr[6]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_addr[6]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_addr[6]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_addr[6]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_addr[6]} .original_name {i_bus_addr[6]}
set_db -quiet {port:spi_bridge_top/i_bus_addr[5]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_addr[5]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_addr[5]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_addr[5]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_addr[5]} .original_name {i_bus_addr[5]}
set_db -quiet {port:spi_bridge_top/i_bus_addr[4]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_addr[4]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_addr[4]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_addr[4]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_addr[4]} .original_name {i_bus_addr[4]}
set_db -quiet {port:spi_bridge_top/i_bus_addr[3]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_addr[3]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_addr[3]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_addr[3]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_addr[3]} .original_name {i_bus_addr[3]}
set_db -quiet {port:spi_bridge_top/i_bus_addr[2]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_addr[2]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_addr[2]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_addr[2]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_addr[2]} .original_name {i_bus_addr[2]}
set_db -quiet {port:spi_bridge_top/i_bus_addr[1]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_addr[1]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_addr[1]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_addr[1]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_addr[1]} .original_name {i_bus_addr[1]}
set_db -quiet {port:spi_bridge_top/i_bus_addr[0]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_addr[0]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_addr[0]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_addr[0]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_addr[0]} .original_name {i_bus_addr[0]}
set_db -quiet port:spi_bridge_top/i_bus_wr_en .driver_pin_rise_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet port:spi_bridge_top/i_bus_wr_en .driver_pin_fall_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet port:spi_bridge_top/i_bus_wr_en .driver_pin_rise_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet port:spi_bridge_top/i_bus_wr_en .driver_pin_fall_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet port:spi_bridge_top/i_bus_wr_en .original_name i_bus_wr_en
set_db -quiet {port:spi_bridge_top/i_bus_wdata[7]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_wdata[7]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_wdata[7]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_wdata[7]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_wdata[7]} .original_name {i_bus_wdata[7]}
set_db -quiet {port:spi_bridge_top/i_bus_wdata[6]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_wdata[6]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_wdata[6]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_wdata[6]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_wdata[6]} .original_name {i_bus_wdata[6]}
set_db -quiet {port:spi_bridge_top/i_bus_wdata[5]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_wdata[5]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_wdata[5]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_wdata[5]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_wdata[5]} .original_name {i_bus_wdata[5]}
set_db -quiet {port:spi_bridge_top/i_bus_wdata[4]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_wdata[4]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_wdata[4]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_wdata[4]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_wdata[4]} .original_name {i_bus_wdata[4]}
set_db -quiet {port:spi_bridge_top/i_bus_wdata[3]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_wdata[3]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_wdata[3]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_wdata[3]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_wdata[3]} .original_name {i_bus_wdata[3]}
set_db -quiet {port:spi_bridge_top/i_bus_wdata[2]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_wdata[2]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_wdata[2]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_wdata[2]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_wdata[2]} .original_name {i_bus_wdata[2]}
set_db -quiet {port:spi_bridge_top/i_bus_wdata[1]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_wdata[1]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_wdata[1]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_wdata[1]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_wdata[1]} .original_name {i_bus_wdata[1]}
set_db -quiet {port:spi_bridge_top/i_bus_wdata[0]} .driver_pin_rise_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_wdata[0]} .driver_pin_fall_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_wdata[0]} .driver_pin_rise_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_wdata[0]} .driver_pin_fall_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet {port:spi_bridge_top/i_bus_wdata[0]} .original_name {i_bus_wdata[0]}
set_db -quiet port:spi_bridge_top/i_bus_rd_en .driver_pin_rise_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet port:spi_bridge_top/i_bus_rd_en .driver_pin_fall_min lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet port:spi_bridge_top/i_bus_rd_en .driver_pin_rise_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet port:spi_bridge_top/i_bus_rd_en .driver_pin_fall_max lib_pin:default_emulate_libset_max/fast_vdd1v0/DFFHQX1/Q
set_db -quiet port:spi_bridge_top/i_bus_rd_en .original_name i_bus_rd_en
set_db -quiet {port:spi_bridge_top/o_bus_rdata[7]} .external_pin_cap_min 20.0
set_db -quiet {port:spi_bridge_top/o_bus_rdata[7]} .external_capacitance_max {20.0 20.0}
set_db -quiet {port:spi_bridge_top/o_bus_rdata[7]} .external_capacitance_min 20.0
set_db -quiet {port:spi_bridge_top/o_bus_rdata[7]} .original_name {o_bus_rdata[7]}
set_db -quiet {port:spi_bridge_top/o_bus_rdata[7]} .external_pin_cap {20.0 20.0}
set_db -quiet {port:spi_bridge_top/o_bus_rdata[6]} .external_pin_cap_min 20.0
set_db -quiet {port:spi_bridge_top/o_bus_rdata[6]} .external_capacitance_max {20.0 20.0}
set_db -quiet {port:spi_bridge_top/o_bus_rdata[6]} .external_capacitance_min 20.0
set_db -quiet {port:spi_bridge_top/o_bus_rdata[6]} .original_name {o_bus_rdata[6]}
set_db -quiet {port:spi_bridge_top/o_bus_rdata[6]} .external_pin_cap {20.0 20.0}
set_db -quiet {port:spi_bridge_top/o_bus_rdata[5]} .external_pin_cap_min 20.0
set_db -quiet {port:spi_bridge_top/o_bus_rdata[5]} .external_capacitance_max {20.0 20.0}
set_db -quiet {port:spi_bridge_top/o_bus_rdata[5]} .external_capacitance_min 20.0
set_db -quiet {port:spi_bridge_top/o_bus_rdata[5]} .original_name {o_bus_rdata[5]}
set_db -quiet {port:spi_bridge_top/o_bus_rdata[5]} .external_pin_cap {20.0 20.0}
set_db -quiet {port:spi_bridge_top/o_bus_rdata[4]} .external_pin_cap_min 20.0
set_db -quiet {port:spi_bridge_top/o_bus_rdata[4]} .external_capacitance_max {20.0 20.0}
set_db -quiet {port:spi_bridge_top/o_bus_rdata[4]} .external_capacitance_min 20.0
set_db -quiet {port:spi_bridge_top/o_bus_rdata[4]} .original_name {o_bus_rdata[4]}
set_db -quiet {port:spi_bridge_top/o_bus_rdata[4]} .external_pin_cap {20.0 20.0}
set_db -quiet {port:spi_bridge_top/o_bus_rdata[3]} .external_pin_cap_min 20.0
set_db -quiet {port:spi_bridge_top/o_bus_rdata[3]} .external_capacitance_max {20.0 20.0}
set_db -quiet {port:spi_bridge_top/o_bus_rdata[3]} .external_capacitance_min 20.0
set_db -quiet {port:spi_bridge_top/o_bus_rdata[3]} .original_name {o_bus_rdata[3]}
set_db -quiet {port:spi_bridge_top/o_bus_rdata[3]} .external_pin_cap {20.0 20.0}
set_db -quiet {port:spi_bridge_top/o_bus_rdata[2]} .external_pin_cap_min 20.0
set_db -quiet {port:spi_bridge_top/o_bus_rdata[2]} .external_capacitance_max {20.0 20.0}
set_db -quiet {port:spi_bridge_top/o_bus_rdata[2]} .external_capacitance_min 20.0
set_db -quiet {port:spi_bridge_top/o_bus_rdata[2]} .original_name {o_bus_rdata[2]}
set_db -quiet {port:spi_bridge_top/o_bus_rdata[2]} .external_pin_cap {20.0 20.0}
set_db -quiet {port:spi_bridge_top/o_bus_rdata[1]} .external_pin_cap_min 20.0
set_db -quiet {port:spi_bridge_top/o_bus_rdata[1]} .external_capacitance_max {20.0 20.0}
set_db -quiet {port:spi_bridge_top/o_bus_rdata[1]} .external_capacitance_min 20.0
set_db -quiet {port:spi_bridge_top/o_bus_rdata[1]} .original_name {o_bus_rdata[1]}
set_db -quiet {port:spi_bridge_top/o_bus_rdata[1]} .external_pin_cap {20.0 20.0}
set_db -quiet {port:spi_bridge_top/o_bus_rdata[0]} .external_pin_cap_min 20.0
set_db -quiet {port:spi_bridge_top/o_bus_rdata[0]} .external_capacitance_max {20.0 20.0}
set_db -quiet {port:spi_bridge_top/o_bus_rdata[0]} .external_capacitance_min 20.0
set_db -quiet {port:spi_bridge_top/o_bus_rdata[0]} .original_name {o_bus_rdata[0]}
set_db -quiet {port:spi_bridge_top/o_bus_rdata[0]} .external_pin_cap {20.0 20.0}
set_db -quiet port:spi_bridge_top/o_overflow .external_pin_cap_min 20.0
set_db -quiet port:spi_bridge_top/o_overflow .external_capacitance_max {20.0 20.0}
set_db -quiet port:spi_bridge_top/o_overflow .external_capacitance_min 20.0
set_db -quiet port:spi_bridge_top/o_overflow .original_name o_overflow
set_db -quiet port:spi_bridge_top/o_overflow .external_pin_cap {20.0 20.0}
set_db -quiet port:spi_bridge_top/o_rx_valid .external_pin_cap_min 20.0
set_db -quiet port:spi_bridge_top/o_rx_valid .external_capacitance_max {20.0 20.0}
set_db -quiet port:spi_bridge_top/o_rx_valid .external_capacitance_min 20.0
set_db -quiet port:spi_bridge_top/o_rx_valid .original_name o_rx_valid
set_db -quiet port:spi_bridge_top/o_rx_valid .external_pin_cap {20.0 20.0}
set_db -quiet port:spi_bridge_top/o_dbg_sclk .external_pin_cap_min 20.0
set_db -quiet port:spi_bridge_top/o_dbg_sclk .external_capacitance_max {20.0 20.0}
set_db -quiet port:spi_bridge_top/o_dbg_sclk .external_capacitance_min 20.0
set_db -quiet port:spi_bridge_top/o_dbg_sclk .original_name o_dbg_sclk
set_db -quiet port:spi_bridge_top/o_dbg_sclk .external_pin_cap {20.0 20.0}
set_db -quiet port:spi_bridge_top/o_dbg_cs_n .external_pin_cap_min 20.0
set_db -quiet port:spi_bridge_top/o_dbg_cs_n .external_capacitance_max {20.0 20.0}
set_db -quiet port:spi_bridge_top/o_dbg_cs_n .external_capacitance_min 20.0
set_db -quiet port:spi_bridge_top/o_dbg_cs_n .original_name o_dbg_cs_n
set_db -quiet port:spi_bridge_top/o_dbg_cs_n .external_pin_cap {20.0 20.0}
set_db -quiet port:spi_bridge_top/o_dbg_mosi .external_pin_cap_min 20.0
set_db -quiet port:spi_bridge_top/o_dbg_mosi .external_capacitance_max {20.0 20.0}
set_db -quiet port:spi_bridge_top/o_dbg_mosi .external_capacitance_min 20.0
set_db -quiet port:spi_bridge_top/o_dbg_mosi .original_name o_dbg_mosi
set_db -quiet port:spi_bridge_top/o_dbg_mosi .external_pin_cap {20.0 20.0}
set_db -quiet port:spi_bridge_top/o_dbg_miso .external_pin_cap_min 20.0
set_db -quiet port:spi_bridge_top/o_dbg_miso .external_capacitance_max {20.0 20.0}
set_db -quiet port:spi_bridge_top/o_dbg_miso .external_capacitance_min 20.0
set_db -quiet port:spi_bridge_top/o_dbg_miso .original_name o_dbg_miso
set_db -quiet port:spi_bridge_top/o_dbg_miso .external_pin_cap {20.0 20.0}
set_db -quiet module:spi_bridge_top/spi_bridge_top_pulse_sync_2 .hdl_filelist {{default -v2001 {SYNTHESIS} {../RTL/Pulse_sync.v} {} {}}}
set_db -quiet inst:spi_bridge_top/u_overflow_pulse_sync/r_dst_sync_d_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_overflow_pulse_sync/r_dst_sync_d_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_overflow_pulse_sync/r_dst_sync_d_reg .original_name u_overflow_pulse_sync/r_dst_sync_d
set_db -quiet inst:spi_bridge_top/u_overflow_pulse_sync/r_dst_sync_d_reg .single_bit_orig_name u_overflow_pulse_sync/r_dst_sync_d
set_db -quiet pin:spi_bridge_top/u_overflow_pulse_sync/r_dst_sync_d_reg/Q .original_name u_overflow_pulse_sync/r_dst_sync_d/q
set_db -quiet inst:spi_bridge_top/u_overflow_pulse_sync/r_dst_sync_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_overflow_pulse_sync/r_dst_sync_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_overflow_pulse_sync/r_dst_sync_reg .original_name u_overflow_pulse_sync/r_dst_sync
set_db -quiet inst:spi_bridge_top/u_overflow_pulse_sync/r_dst_sync_reg .single_bit_orig_name u_overflow_pulse_sync/r_dst_sync
set_db -quiet pin:spi_bridge_top/u_overflow_pulse_sync/r_dst_sync_reg/Q .original_name u_overflow_pulse_sync/r_dst_sync/q
set_db -quiet inst:spi_bridge_top/u_overflow_pulse_sync/r_dst_meta_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_overflow_pulse_sync/r_dst_meta_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_overflow_pulse_sync/r_dst_meta_reg .original_name u_overflow_pulse_sync/r_dst_meta
set_db -quiet inst:spi_bridge_top/u_overflow_pulse_sync/r_dst_meta_reg .single_bit_orig_name u_overflow_pulse_sync/r_dst_meta
set_db -quiet pin:spi_bridge_top/u_overflow_pulse_sync/r_dst_meta_reg/Q .original_name u_overflow_pulse_sync/r_dst_meta/q
set_db -quiet inst:spi_bridge_top/u_overflow_pulse_sync/r_src_toggle_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_overflow_pulse_sync/r_src_toggle_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_overflow_pulse_sync/r_src_toggle_reg .original_name u_overflow_pulse_sync/r_src_toggle
set_db -quiet inst:spi_bridge_top/u_overflow_pulse_sync/r_src_toggle_reg .single_bit_orig_name u_overflow_pulse_sync/r_src_toggle
set_db -quiet pin:spi_bridge_top/u_overflow_pulse_sync/r_src_toggle_reg/Q .original_name u_overflow_pulse_sync/r_src_toggle/q
set_db -quiet module:spi_bridge_top/register_block .hdl_filelist {{default -v2001 {SYNTHESIS} {../RTL/Register_block.v} {} {}}}
set_db -quiet inst:spi_bridge_top/u_register_block/o_tx_clear_req_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_register_block/o_tx_clear_req_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_register_block/o_tx_clear_req_reg .original_name u_register_block/o_tx_clear_req
set_db -quiet inst:spi_bridge_top/u_register_block/o_tx_clear_req_reg .single_bit_orig_name u_register_block/o_tx_clear_req
set_db -quiet pin:spi_bridge_top/u_register_block/o_tx_clear_req_reg/Q .original_name u_register_block/o_tx_clear_req/q
set_db -quiet inst:spi_bridge_top/u_register_block/r_overflow_sticky_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_register_block/r_overflow_sticky_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_register_block/r_overflow_sticky_reg .original_name u_register_block/r_overflow_sticky
set_db -quiet inst:spi_bridge_top/u_register_block/r_overflow_sticky_reg .single_bit_orig_name u_register_block/r_overflow_sticky
set_db -quiet pin:spi_bridge_top/u_register_block/r_overflow_sticky_reg/Q .original_name u_register_block/r_overflow_sticky/q
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_data_buf_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_data_buf_reg_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_data_buf_reg_2 .original_name {{u_register_block/r_rx_data_buf[2]}}
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_data_buf_reg_2 .single_bit_orig_name {u_register_block/r_rx_data_buf[2]}
set_db -quiet pin:spi_bridge_top/u_register_block/r_rx_data_buf_reg_2/Q .original_name {u_register_block/r_rx_data_buf[2]/q}
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_data_buf_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_data_buf_reg_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_data_buf_reg_1 .original_name {{u_register_block/r_rx_data_buf[1]}}
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_data_buf_reg_1 .single_bit_orig_name {u_register_block/r_rx_data_buf[1]}
set_db -quiet pin:spi_bridge_top/u_register_block/r_rx_data_buf_reg_1/Q .original_name {u_register_block/r_rx_data_buf[1]/q}
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_data_buf_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_data_buf_reg_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_data_buf_reg_0 .original_name {{u_register_block/r_rx_data_buf[0]}}
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_data_buf_reg_0 .single_bit_orig_name {u_register_block/r_rx_data_buf[0]}
set_db -quiet pin:spi_bridge_top/u_register_block/r_rx_data_buf_reg_0/Q .original_name {u_register_block/r_rx_data_buf[0]/q}
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_data_buf_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_data_buf_reg_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_data_buf_reg_3 .original_name {{u_register_block/r_rx_data_buf[3]}}
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_data_buf_reg_3 .single_bit_orig_name {u_register_block/r_rx_data_buf[3]}
set_db -quiet pin:spi_bridge_top/u_register_block/r_rx_data_buf_reg_3/Q .original_name {u_register_block/r_rx_data_buf[3]/q}
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_data_buf_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_data_buf_reg_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_data_buf_reg_4 .original_name {{u_register_block/r_rx_data_buf[4]}}
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_data_buf_reg_4 .single_bit_orig_name {u_register_block/r_rx_data_buf[4]}
set_db -quiet pin:spi_bridge_top/u_register_block/r_rx_data_buf_reg_4/Q .original_name {u_register_block/r_rx_data_buf[4]/q}
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_data_buf_reg_7 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_data_buf_reg_7 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_data_buf_reg_7 .original_name {{u_register_block/r_rx_data_buf[7]}}
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_data_buf_reg_7 .single_bit_orig_name {u_register_block/r_rx_data_buf[7]}
set_db -quiet pin:spi_bridge_top/u_register_block/r_rx_data_buf_reg_7/Q .original_name {u_register_block/r_rx_data_buf[7]/q}
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_clear_busy_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_clear_busy_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_clear_busy_reg .original_name u_register_block/r_tx_clear_busy
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_clear_busy_reg .single_bit_orig_name u_register_block/r_tx_clear_busy
set_db -quiet pin:spi_bridge_top/u_register_block/r_tx_clear_busy_reg/Q .original_name u_register_block/r_tx_clear_busy/q
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_data_buf_reg_5 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_data_buf_reg_5 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_data_buf_reg_5 .original_name {{u_register_block/r_rx_data_buf[5]}}
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_data_buf_reg_5 .single_bit_orig_name {u_register_block/r_rx_data_buf[5]}
set_db -quiet pin:spi_bridge_top/u_register_block/r_rx_data_buf_reg_5/Q .original_name {u_register_block/r_rx_data_buf[5]/q}
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_data_buf_reg_6 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_data_buf_reg_6 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_data_buf_reg_6 .original_name {{u_register_block/r_rx_data_buf[6]}}
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_data_buf_reg_6 .single_bit_orig_name {u_register_block/r_rx_data_buf[6]}
set_db -quiet pin:spi_bridge_top/u_register_block/r_rx_data_buf_reg_6/Q .original_name {u_register_block/r_rx_data_buf[6]/q}
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_5 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_5 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_5 .original_name {{u_register_block/r_tx_last_accepted[5]}}
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_5 .single_bit_orig_name {u_register_block/r_tx_last_accepted[5]}
set_db -quiet pin:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_5/Q .original_name {u_register_block/r_tx_last_accepted[5]/q}
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_4 .original_name {{u_register_block/r_tx_last_accepted[4]}}
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_4 .single_bit_orig_name {u_register_block/r_tx_last_accepted[4]}
set_db -quiet pin:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_4/Q .original_name {u_register_block/r_tx_last_accepted[4]/q}
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_7 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_7 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_7 .original_name {{u_register_block/r_tx_last_accepted[7]}}
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_7 .single_bit_orig_name {u_register_block/r_tx_last_accepted[7]}
set_db -quiet pin:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_7/Q .original_name {u_register_block/r_tx_last_accepted[7]/q}
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_6 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_6 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_6 .original_name {{u_register_block/r_tx_last_accepted[6]}}
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_6 .single_bit_orig_name {u_register_block/r_tx_last_accepted[6]}
set_db -quiet pin:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_6/Q .original_name {u_register_block/r_tx_last_accepted[6]/q}
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_3 .original_name {{u_register_block/r_tx_last_accepted[3]}}
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_3 .single_bit_orig_name {u_register_block/r_tx_last_accepted[3]}
set_db -quiet pin:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_3/Q .original_name {u_register_block/r_tx_last_accepted[3]/q}
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_0 .original_name {{u_register_block/r_tx_last_accepted[0]}}
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_0 .single_bit_orig_name {u_register_block/r_tx_last_accepted[0]}
set_db -quiet pin:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_0/Q .original_name {u_register_block/r_tx_last_accepted[0]/q}
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_1 .original_name {{u_register_block/r_tx_last_accepted[1]}}
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_1 .single_bit_orig_name {u_register_block/r_tx_last_accepted[1]}
set_db -quiet pin:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_1/Q .original_name {u_register_block/r_tx_last_accepted[1]/q}
set_db -quiet inst:spi_bridge_top/u_register_block/irq_enable_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_register_block/irq_enable_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_register_block/irq_enable_reg .original_name u_register_block/irq_enable
set_db -quiet inst:spi_bridge_top/u_register_block/irq_enable_reg .single_bit_orig_name u_register_block/irq_enable
set_db -quiet pin:spi_bridge_top/u_register_block/irq_enable_reg/Q .original_name u_register_block/irq_enable/q
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_2 .original_name {{u_register_block/r_tx_last_accepted[2]}}
set_db -quiet inst:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_2 .single_bit_orig_name {u_register_block/r_tx_last_accepted[2]}
set_db -quiet pin:spi_bridge_top/u_register_block/r_tx_last_accepted_reg_2/Q .original_name {u_register_block/r_tx_last_accepted[2]/q}
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_fifo_rd_en_d_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_fifo_rd_en_d_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_fifo_rd_en_d_reg .original_name u_register_block/r_rx_fifo_rd_en_d
set_db -quiet inst:spi_bridge_top/u_register_block/r_rx_fifo_rd_en_d_reg .single_bit_orig_name u_register_block/r_rx_fifo_rd_en_d
set_db -quiet pin:spi_bridge_top/u_register_block/r_rx_fifo_rd_en_d_reg/Q .original_name u_register_block/r_rx_fifo_rd_en_d/q
set_db -quiet inst:spi_bridge_top/u_register_block/r_drain_active_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_register_block/r_drain_active_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_register_block/r_drain_active_reg .original_name u_register_block/r_drain_active
set_db -quiet inst:spi_bridge_top/u_register_block/r_drain_active_reg .single_bit_orig_name u_register_block/r_drain_active
set_db -quiet pin:spi_bridge_top/u_register_block/r_drain_active_reg/Q .original_name u_register_block/r_drain_active/q
set_db -quiet pin:spi_bridge_top/u_register_block/r_drain_active_reg/QN .original_name u_register_block/r_drain_active/q
set_db -quiet inst:spi_bridge_top/u_register_block/rx_data_buf_valid_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_register_block/rx_data_buf_valid_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_register_block/rx_data_buf_valid_reg .original_name u_register_block/rx_data_buf_valid
set_db -quiet inst:spi_bridge_top/u_register_block/rx_data_buf_valid_reg .single_bit_orig_name u_register_block/rx_data_buf_valid
set_db -quiet pin:spi_bridge_top/u_register_block/rx_data_buf_valid_reg/Q .original_name u_register_block/rx_data_buf_valid/q
set_db -quiet module:spi_bridge_top/reset_sync .hdl_filelist {{default -v2001 {SYNTHESIS} {../RTL/Reset_sync.v} {} {}}}
set_db -quiet inst:spi_bridge_top/u_reset_sync_aclk/rst_n_sync_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_reset_sync_aclk/rst_n_sync_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_reset_sync_aclk/rst_n_sync_reg .original_name u_reset_sync_aclk/rst_n_sync
set_db -quiet inst:spi_bridge_top/u_reset_sync_aclk/rst_n_sync_reg .single_bit_orig_name u_reset_sync_aclk/rst_n_sync
set_db -quiet pin:spi_bridge_top/u_reset_sync_aclk/rst_n_sync_reg/Q .original_name u_reset_sync_aclk/rst_n_sync/q
set_db -quiet inst:spi_bridge_top/u_reset_sync_aclk/r_meta_ff_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_reset_sync_aclk/r_meta_ff_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_reset_sync_aclk/r_meta_ff_reg .original_name u_reset_sync_aclk/r_meta_ff
set_db -quiet inst:spi_bridge_top/u_reset_sync_aclk/r_meta_ff_reg .single_bit_orig_name u_reset_sync_aclk/r_meta_ff
set_db -quiet pin:spi_bridge_top/u_reset_sync_aclk/r_meta_ff_reg/Q .original_name u_reset_sync_aclk/r_meta_ff/q
set_db -quiet module:spi_bridge_top/spi_bridge_top_reset_sync_1 .hdl_filelist {{default -v2001 {SYNTHESIS} {../RTL/Reset_sync.v} {} {}}}
set_db -quiet inst:spi_bridge_top/u_reset_sync_sclk/rst_n_sync_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_reset_sync_sclk/rst_n_sync_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_reset_sync_sclk/rst_n_sync_reg .original_name u_reset_sync_sclk/rst_n_sync
set_db -quiet inst:spi_bridge_top/u_reset_sync_sclk/rst_n_sync_reg .single_bit_orig_name u_reset_sync_sclk/rst_n_sync
set_db -quiet pin:spi_bridge_top/u_reset_sync_sclk/rst_n_sync_reg/Q .original_name u_reset_sync_sclk/rst_n_sync/q
set_db -quiet inst:spi_bridge_top/u_reset_sync_sclk/r_meta_ff_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_reset_sync_sclk/r_meta_ff_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_reset_sync_sclk/r_meta_ff_reg .original_name u_reset_sync_sclk/r_meta_ff
set_db -quiet inst:spi_bridge_top/u_reset_sync_sclk/r_meta_ff_reg .single_bit_orig_name u_reset_sync_sclk/r_meta_ff
set_db -quiet pin:spi_bridge_top/u_reset_sync_sclk/r_meta_ff_reg/Q .original_name u_reset_sync_sclk/r_meta_ff/q
set_db -quiet module:spi_bridge_top/async_fifo_DATA_WIDTH8_ADDR_WIDTH4 .hdl_filelist {{default -v2001 {SYNTHESIS} {../RTL/Async_fifo.v} {} {}}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_rclk_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_rclk_reg_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_rclk_reg_3 .original_name {{u_rx_fifo/r_wr_ptr_gray_rclk[3]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_rclk_reg_3 .single_bit_orig_name {u_rx_fifo/r_wr_ptr_gray_rclk[3]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_rclk_reg_3/Q .original_name {u_rx_fifo/r_wr_ptr_gray_rclk[3]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_meta_r_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_meta_r_reg_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_meta_r_reg_3 .original_name {{u_rx_fifo/r_wr_ptr_gray_meta_r[3]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_meta_r_reg_3 .single_bit_orig_name {u_rx_fifo/r_wr_ptr_gray_meta_r[3]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_meta_r_reg_3/Q .original_name {u_rx_fifo/r_wr_ptr_gray_meta_r[3]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_reg_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_reg_3 .original_name {{u_rx_fifo/r_wr_ptr_gray[3]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_reg_3 .single_bit_orig_name {u_rx_fifo/r_wr_ptr_gray[3]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_reg_3/Q .original_name {u_rx_fifo/r_wr_ptr_gray[3]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_rclk_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_rclk_reg_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_rclk_reg_2 .original_name {{u_rx_fifo/r_wr_ptr_gray_rclk[2]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_rclk_reg_2 .single_bit_orig_name {u_rx_fifo/r_wr_ptr_gray_rclk[2]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_rclk_reg_2/Q .original_name {u_rx_fifo/r_wr_ptr_gray_rclk[2]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_meta_r_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_meta_r_reg_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_meta_r_reg_2 .original_name {{u_rx_fifo/r_wr_ptr_gray_meta_r[2]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_meta_r_reg_2 .single_bit_orig_name {u_rx_fifo/r_wr_ptr_gray_meta_r[2]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_meta_r_reg_2/Q .original_name {u_rx_fifo/r_wr_ptr_gray_meta_r[2]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_reg_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_reg_2 .original_name {{u_rx_fifo/r_wr_ptr_gray[2]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_reg_2 .single_bit_orig_name {u_rx_fifo/r_wr_ptr_gray[2]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_reg_2/Q .original_name {u_rx_fifo/r_wr_ptr_gray[2]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_rclk_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_rclk_reg_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_rclk_reg_1 .original_name {{u_rx_fifo/r_wr_ptr_gray_rclk[1]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_rclk_reg_1 .single_bit_orig_name {u_rx_fifo/r_wr_ptr_gray_rclk[1]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_rclk_reg_1/Q .original_name {u_rx_fifo/r_wr_ptr_gray_rclk[1]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_meta_r_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_meta_r_reg_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_meta_r_reg_1 .original_name {{u_rx_fifo/r_wr_ptr_gray_meta_r[1]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_meta_r_reg_1 .single_bit_orig_name {u_rx_fifo/r_wr_ptr_gray_meta_r[1]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_meta_r_reg_1/Q .original_name {u_rx_fifo/r_wr_ptr_gray_meta_r[1]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_reg_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_reg_1 .original_name {{u_rx_fifo/r_wr_ptr_gray[1]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_reg_1 .single_bit_orig_name {u_rx_fifo/r_wr_ptr_gray[1]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_reg_1/Q .original_name {u_rx_fifo/r_wr_ptr_gray[1]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_rclk_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_rclk_reg_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_rclk_reg_0 .original_name {{u_rx_fifo/r_wr_ptr_gray_rclk[0]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_rclk_reg_0 .single_bit_orig_name {u_rx_fifo/r_wr_ptr_gray_rclk[0]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_rclk_reg_0/Q .original_name {u_rx_fifo/r_wr_ptr_gray_rclk[0]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_meta_r_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_meta_r_reg_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_meta_r_reg_0 .original_name {{u_rx_fifo/r_wr_ptr_gray_meta_r[0]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_meta_r_reg_0 .single_bit_orig_name {u_rx_fifo/r_wr_ptr_gray_meta_r[0]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_meta_r_reg_0/Q .original_name {u_rx_fifo/r_wr_ptr_gray_meta_r[0]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_reg_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_reg_0 .original_name {{u_rx_fifo/r_wr_ptr_gray[0]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_reg_0 .single_bit_orig_name {u_rx_fifo/r_wr_ptr_gray[0]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_reg_0/Q .original_name {u_rx_fifo/r_wr_ptr_gray[0]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_rclk_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_rclk_reg_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_rclk_reg_4 .original_name {{u_rx_fifo/r_wr_ptr_gray_rclk[4]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_rclk_reg_4 .single_bit_orig_name {u_rx_fifo/r_wr_ptr_gray_rclk[4]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_rclk_reg_4/Q .original_name {u_rx_fifo/r_wr_ptr_gray_rclk[4]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_meta_r_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_meta_r_reg_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_meta_r_reg_4 .original_name {{u_rx_fifo/r_wr_ptr_gray_meta_r[4]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_meta_r_reg_4 .single_bit_orig_name {u_rx_fifo/r_wr_ptr_gray_meta_r[4]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_meta_r_reg_4/Q .original_name {u_rx_fifo/r_wr_ptr_gray_meta_r[4]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_wclk_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_wclk_reg_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_wclk_reg_2 .original_name {{u_rx_fifo/r_rd_ptr_gray_wclk[2]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_wclk_reg_2 .single_bit_orig_name {u_rx_fifo/r_rd_ptr_gray_wclk[2]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_wclk_reg_2/Q .original_name {u_rx_fifo/r_rd_ptr_gray_wclk[2]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_wclk_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_wclk_reg_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_wclk_reg_3 .original_name {{u_rx_fifo/r_rd_ptr_gray_wclk[3]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_wclk_reg_3 .single_bit_orig_name {u_rx_fifo/r_rd_ptr_gray_wclk[3]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_wclk_reg_3/Q .original_name {u_rx_fifo/r_rd_ptr_gray_wclk[3]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_meta_w_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_meta_w_reg_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_meta_w_reg_2 .original_name {{u_rx_fifo/r_rd_ptr_gray_meta_w[2]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_meta_w_reg_2 .single_bit_orig_name {u_rx_fifo/r_rd_ptr_gray_meta_w[2]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_meta_w_reg_2/Q .original_name {u_rx_fifo/r_rd_ptr_gray_meta_w[2]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_meta_w_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_meta_w_reg_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_meta_w_reg_3 .original_name {{u_rx_fifo/r_rd_ptr_gray_meta_w[3]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_meta_w_reg_3 .single_bit_orig_name {u_rx_fifo/r_rd_ptr_gray_meta_w[3]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_meta_w_reg_3/Q .original_name {u_rx_fifo/r_rd_ptr_gray_meta_w[3]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_reg_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_reg_3 .original_name {{u_rx_fifo/r_rd_ptr_gray[3]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_reg_3 .single_bit_orig_name {u_rx_fifo/r_rd_ptr_gray[3]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_reg_3/Q .original_name {u_rx_fifo/r_rd_ptr_gray[3]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_wclk_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_wclk_reg_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_wclk_reg_1 .original_name {{u_rx_fifo/r_rd_ptr_gray_wclk[1]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_wclk_reg_1 .single_bit_orig_name {u_rx_fifo/r_rd_ptr_gray_wclk[1]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_wclk_reg_1/Q .original_name {u_rx_fifo/r_rd_ptr_gray_wclk[1]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_reg_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_reg_2 .original_name {{u_rx_fifo/r_rd_ptr_gray[2]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_reg_2 .single_bit_orig_name {u_rx_fifo/r_rd_ptr_gray[2]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_reg_2/Q .original_name {u_rx_fifo/r_rd_ptr_gray[2]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_meta_w_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_meta_w_reg_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_meta_w_reg_1 .original_name {{u_rx_fifo/r_rd_ptr_gray_meta_w[1]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_meta_w_reg_1 .single_bit_orig_name {u_rx_fifo/r_rd_ptr_gray_meta_w[1]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_meta_w_reg_1/Q .original_name {u_rx_fifo/r_rd_ptr_gray_meta_w[1]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_reg_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_reg_1 .original_name {{u_rx_fifo/r_rd_ptr_gray[1]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_reg_1 .single_bit_orig_name {u_rx_fifo/r_rd_ptr_gray[1]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_reg_1/Q .original_name {u_rx_fifo/r_rd_ptr_gray[1]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_wclk_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_wclk_reg_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_wclk_reg_0 .original_name {{u_rx_fifo/r_rd_ptr_gray_wclk[0]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_wclk_reg_0 .single_bit_orig_name {u_rx_fifo/r_rd_ptr_gray_wclk[0]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_wclk_reg_0/Q .original_name {u_rx_fifo/r_rd_ptr_gray_wclk[0]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_meta_w_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_meta_w_reg_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_meta_w_reg_0 .original_name {{u_rx_fifo/r_rd_ptr_gray_meta_w[0]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_meta_w_reg_0 .single_bit_orig_name {u_rx_fifo/r_rd_ptr_gray_meta_w[0]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_meta_w_reg_0/Q .original_name {u_rx_fifo/r_rd_ptr_gray_meta_w[0]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_reg_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_reg_0 .original_name {{u_rx_fifo/r_rd_ptr_gray[0]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_reg_0 .single_bit_orig_name {u_rx_fifo/r_rd_ptr_gray[0]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_reg_0/Q .original_name {u_rx_fifo/r_rd_ptr_gray[0]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_wclk_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_wclk_reg_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_wclk_reg_4 .original_name {{u_rx_fifo/r_rd_ptr_gray_wclk[4]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_wclk_reg_4 .single_bit_orig_name {u_rx_fifo/r_rd_ptr_gray_wclk[4]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_wclk_reg_4/Q .original_name {u_rx_fifo/r_rd_ptr_gray_wclk[4]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_meta_w_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_meta_w_reg_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_meta_w_reg_4 .original_name {{u_rx_fifo/r_rd_ptr_gray_meta_w[4]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_meta_w_reg_4 .single_bit_orig_name {u_rx_fifo/r_rd_ptr_gray_meta_w[4]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_meta_w_reg_4/Q .original_name {u_rx_fifo/r_rd_ptr_gray_meta_w[4]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_0_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_0_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_0_0 .original_name {{u_rx_fifo/mem[0][0]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_0_0 .single_bit_orig_name {u_rx_fifo/mem[0][0]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_0_0/Q .original_name {u_rx_fifo/mem[0][0]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_0_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_0_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_0_1 .original_name {{u_rx_fifo/mem[0][1]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_0_1 .single_bit_orig_name {u_rx_fifo/mem[0][1]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_0_1/Q .original_name {u_rx_fifo/mem[0][1]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_0_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_0_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_0_2 .original_name {{u_rx_fifo/mem[0][2]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_0_2 .single_bit_orig_name {u_rx_fifo/mem[0][2]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_0_2/Q .original_name {u_rx_fifo/mem[0][2]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_0_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_0_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_0_3 .original_name {{u_rx_fifo/mem[0][3]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_0_3 .single_bit_orig_name {u_rx_fifo/mem[0][3]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_0_3/Q .original_name {u_rx_fifo/mem[0][3]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_0_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_0_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_0_4 .original_name {{u_rx_fifo/mem[0][4]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_0_4 .single_bit_orig_name {u_rx_fifo/mem[0][4]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_0_4/Q .original_name {u_rx_fifo/mem[0][4]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_0_5 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_0_5 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_0_5 .original_name {{u_rx_fifo/mem[0][5]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_0_5 .single_bit_orig_name {u_rx_fifo/mem[0][5]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_0_5/Q .original_name {u_rx_fifo/mem[0][5]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_0_6 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_0_6 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_0_6 .original_name {{u_rx_fifo/mem[0][6]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_0_6 .single_bit_orig_name {u_rx_fifo/mem[0][6]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_0_6/Q .original_name {u_rx_fifo/mem[0][6]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_0_7 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_0_7 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_0_7 .original_name {{u_rx_fifo/mem[0][7]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_0_7 .single_bit_orig_name {u_rx_fifo/mem[0][7]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_0_7/Q .original_name {u_rx_fifo/mem[0][7]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_1_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_1_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_1_0 .original_name {{u_rx_fifo/mem[1][0]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_1_0 .single_bit_orig_name {u_rx_fifo/mem[1][0]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_1_0/Q .original_name {u_rx_fifo/mem[1][0]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_1_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_1_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_1_1 .original_name {{u_rx_fifo/mem[1][1]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_1_1 .single_bit_orig_name {u_rx_fifo/mem[1][1]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_1_1/Q .original_name {u_rx_fifo/mem[1][1]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_1_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_1_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_1_2 .original_name {{u_rx_fifo/mem[1][2]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_1_2 .single_bit_orig_name {u_rx_fifo/mem[1][2]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_1_2/Q .original_name {u_rx_fifo/mem[1][2]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_1_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_1_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_1_3 .original_name {{u_rx_fifo/mem[1][3]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_1_3 .single_bit_orig_name {u_rx_fifo/mem[1][3]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_1_3/Q .original_name {u_rx_fifo/mem[1][3]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_1_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_1_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_1_4 .original_name {{u_rx_fifo/mem[1][4]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_1_4 .single_bit_orig_name {u_rx_fifo/mem[1][4]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_1_4/Q .original_name {u_rx_fifo/mem[1][4]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_1_5 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_1_5 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_1_5 .original_name {{u_rx_fifo/mem[1][5]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_1_5 .single_bit_orig_name {u_rx_fifo/mem[1][5]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_1_5/Q .original_name {u_rx_fifo/mem[1][5]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_1_6 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_1_6 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_1_6 .original_name {{u_rx_fifo/mem[1][6]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_1_6 .single_bit_orig_name {u_rx_fifo/mem[1][6]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_1_6/Q .original_name {u_rx_fifo/mem[1][6]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_1_7 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_1_7 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_1_7 .original_name {{u_rx_fifo/mem[1][7]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_1_7 .single_bit_orig_name {u_rx_fifo/mem[1][7]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_1_7/Q .original_name {u_rx_fifo/mem[1][7]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_2_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_2_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_2_0 .original_name {{u_rx_fifo/mem[2][0]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_2_0 .single_bit_orig_name {u_rx_fifo/mem[2][0]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_2_0/Q .original_name {u_rx_fifo/mem[2][0]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_2_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_2_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_2_1 .original_name {{u_rx_fifo/mem[2][1]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_2_1 .single_bit_orig_name {u_rx_fifo/mem[2][1]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_2_1/Q .original_name {u_rx_fifo/mem[2][1]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_2_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_2_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_2_2 .original_name {{u_rx_fifo/mem[2][2]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_2_2 .single_bit_orig_name {u_rx_fifo/mem[2][2]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_2_2/Q .original_name {u_rx_fifo/mem[2][2]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_2_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_2_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_2_3 .original_name {{u_rx_fifo/mem[2][3]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_2_3 .single_bit_orig_name {u_rx_fifo/mem[2][3]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_2_3/Q .original_name {u_rx_fifo/mem[2][3]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_2_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_2_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_2_4 .original_name {{u_rx_fifo/mem[2][4]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_2_4 .single_bit_orig_name {u_rx_fifo/mem[2][4]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_2_4/Q .original_name {u_rx_fifo/mem[2][4]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_2_5 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_2_5 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_2_5 .original_name {{u_rx_fifo/mem[2][5]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_2_5 .single_bit_orig_name {u_rx_fifo/mem[2][5]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_2_5/Q .original_name {u_rx_fifo/mem[2][5]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_2_6 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_2_6 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_2_6 .original_name {{u_rx_fifo/mem[2][6]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_2_6 .single_bit_orig_name {u_rx_fifo/mem[2][6]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_2_6/Q .original_name {u_rx_fifo/mem[2][6]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_2_7 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_2_7 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_2_7 .original_name {{u_rx_fifo/mem[2][7]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_2_7 .single_bit_orig_name {u_rx_fifo/mem[2][7]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_2_7/Q .original_name {u_rx_fifo/mem[2][7]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_3_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_3_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_3_0 .original_name {{u_rx_fifo/mem[3][0]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_3_0 .single_bit_orig_name {u_rx_fifo/mem[3][0]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_3_0/Q .original_name {u_rx_fifo/mem[3][0]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_3_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_3_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_3_1 .original_name {{u_rx_fifo/mem[3][1]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_3_1 .single_bit_orig_name {u_rx_fifo/mem[3][1]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_3_1/Q .original_name {u_rx_fifo/mem[3][1]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_3_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_3_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_3_2 .original_name {{u_rx_fifo/mem[3][2]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_3_2 .single_bit_orig_name {u_rx_fifo/mem[3][2]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_3_2/Q .original_name {u_rx_fifo/mem[3][2]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_3_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_3_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_3_3 .original_name {{u_rx_fifo/mem[3][3]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_3_3 .single_bit_orig_name {u_rx_fifo/mem[3][3]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_3_3/Q .original_name {u_rx_fifo/mem[3][3]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_3_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_3_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_3_4 .original_name {{u_rx_fifo/mem[3][4]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_3_4 .single_bit_orig_name {u_rx_fifo/mem[3][4]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_3_4/Q .original_name {u_rx_fifo/mem[3][4]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_3_5 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_3_5 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_3_5 .original_name {{u_rx_fifo/mem[3][5]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_3_5 .single_bit_orig_name {u_rx_fifo/mem[3][5]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_3_5/Q .original_name {u_rx_fifo/mem[3][5]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_3_6 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_3_6 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_3_6 .original_name {{u_rx_fifo/mem[3][6]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_3_6 .single_bit_orig_name {u_rx_fifo/mem[3][6]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_3_6/Q .original_name {u_rx_fifo/mem[3][6]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_3_7 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_3_7 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_3_7 .original_name {{u_rx_fifo/mem[3][7]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_3_7 .single_bit_orig_name {u_rx_fifo/mem[3][7]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_3_7/Q .original_name {u_rx_fifo/mem[3][7]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_4_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_4_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_4_0 .original_name {{u_rx_fifo/mem[4][0]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_4_0 .single_bit_orig_name {u_rx_fifo/mem[4][0]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_4_0/Q .original_name {u_rx_fifo/mem[4][0]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_4_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_4_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_4_1 .original_name {{u_rx_fifo/mem[4][1]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_4_1 .single_bit_orig_name {u_rx_fifo/mem[4][1]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_4_1/Q .original_name {u_rx_fifo/mem[4][1]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_4_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_4_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_4_2 .original_name {{u_rx_fifo/mem[4][2]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_4_2 .single_bit_orig_name {u_rx_fifo/mem[4][2]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_4_2/Q .original_name {u_rx_fifo/mem[4][2]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_4_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_4_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_4_3 .original_name {{u_rx_fifo/mem[4][3]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_4_3 .single_bit_orig_name {u_rx_fifo/mem[4][3]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_4_3/Q .original_name {u_rx_fifo/mem[4][3]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_4_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_4_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_4_4 .original_name {{u_rx_fifo/mem[4][4]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_4_4 .single_bit_orig_name {u_rx_fifo/mem[4][4]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_4_4/Q .original_name {u_rx_fifo/mem[4][4]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_4_5 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_4_5 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_4_5 .original_name {{u_rx_fifo/mem[4][5]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_4_5 .single_bit_orig_name {u_rx_fifo/mem[4][5]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_4_5/Q .original_name {u_rx_fifo/mem[4][5]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_4_6 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_4_6 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_4_6 .original_name {{u_rx_fifo/mem[4][6]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_4_6 .single_bit_orig_name {u_rx_fifo/mem[4][6]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_4_6/Q .original_name {u_rx_fifo/mem[4][6]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_4_7 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_4_7 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_4_7 .original_name {{u_rx_fifo/mem[4][7]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_4_7 .single_bit_orig_name {u_rx_fifo/mem[4][7]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_4_7/Q .original_name {u_rx_fifo/mem[4][7]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_5_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_5_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_5_0 .original_name {{u_rx_fifo/mem[5][0]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_5_0 .single_bit_orig_name {u_rx_fifo/mem[5][0]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_5_0/Q .original_name {u_rx_fifo/mem[5][0]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_5_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_5_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_5_1 .original_name {{u_rx_fifo/mem[5][1]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_5_1 .single_bit_orig_name {u_rx_fifo/mem[5][1]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_5_1/Q .original_name {u_rx_fifo/mem[5][1]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_5_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_5_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_5_2 .original_name {{u_rx_fifo/mem[5][2]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_5_2 .single_bit_orig_name {u_rx_fifo/mem[5][2]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_5_2/Q .original_name {u_rx_fifo/mem[5][2]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_5_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_5_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_5_3 .original_name {{u_rx_fifo/mem[5][3]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_5_3 .single_bit_orig_name {u_rx_fifo/mem[5][3]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_5_3/Q .original_name {u_rx_fifo/mem[5][3]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_5_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_5_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_5_4 .original_name {{u_rx_fifo/mem[5][4]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_5_4 .single_bit_orig_name {u_rx_fifo/mem[5][4]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_5_4/Q .original_name {u_rx_fifo/mem[5][4]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_5_5 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_5_5 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_5_5 .original_name {{u_rx_fifo/mem[5][5]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_5_5 .single_bit_orig_name {u_rx_fifo/mem[5][5]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_5_5/Q .original_name {u_rx_fifo/mem[5][5]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_5_6 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_5_6 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_5_6 .original_name {{u_rx_fifo/mem[5][6]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_5_6 .single_bit_orig_name {u_rx_fifo/mem[5][6]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_5_6/Q .original_name {u_rx_fifo/mem[5][6]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_5_7 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_5_7 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_5_7 .original_name {{u_rx_fifo/mem[5][7]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_5_7 .single_bit_orig_name {u_rx_fifo/mem[5][7]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_5_7/Q .original_name {u_rx_fifo/mem[5][7]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_6_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_6_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_6_0 .original_name {{u_rx_fifo/mem[6][0]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_6_0 .single_bit_orig_name {u_rx_fifo/mem[6][0]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_6_0/Q .original_name {u_rx_fifo/mem[6][0]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_6_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_6_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_6_1 .original_name {{u_rx_fifo/mem[6][1]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_6_1 .single_bit_orig_name {u_rx_fifo/mem[6][1]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_6_1/Q .original_name {u_rx_fifo/mem[6][1]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_6_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_6_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_6_2 .original_name {{u_rx_fifo/mem[6][2]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_6_2 .single_bit_orig_name {u_rx_fifo/mem[6][2]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_6_2/Q .original_name {u_rx_fifo/mem[6][2]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_6_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_6_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_6_3 .original_name {{u_rx_fifo/mem[6][3]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_6_3 .single_bit_orig_name {u_rx_fifo/mem[6][3]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_6_3/Q .original_name {u_rx_fifo/mem[6][3]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_6_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_6_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_6_4 .original_name {{u_rx_fifo/mem[6][4]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_6_4 .single_bit_orig_name {u_rx_fifo/mem[6][4]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_6_4/Q .original_name {u_rx_fifo/mem[6][4]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_6_5 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_6_5 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_6_5 .original_name {{u_rx_fifo/mem[6][5]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_6_5 .single_bit_orig_name {u_rx_fifo/mem[6][5]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_6_5/Q .original_name {u_rx_fifo/mem[6][5]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_6_6 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_6_6 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_6_6 .original_name {{u_rx_fifo/mem[6][6]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_6_6 .single_bit_orig_name {u_rx_fifo/mem[6][6]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_6_6/Q .original_name {u_rx_fifo/mem[6][6]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_6_7 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_6_7 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_6_7 .original_name {{u_rx_fifo/mem[6][7]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_6_7 .single_bit_orig_name {u_rx_fifo/mem[6][7]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_6_7/Q .original_name {u_rx_fifo/mem[6][7]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_7_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_7_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_7_0 .original_name {{u_rx_fifo/mem[7][0]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_7_0 .single_bit_orig_name {u_rx_fifo/mem[7][0]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_7_0/Q .original_name {u_rx_fifo/mem[7][0]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_7_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_7_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_7_1 .original_name {{u_rx_fifo/mem[7][1]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_7_1 .single_bit_orig_name {u_rx_fifo/mem[7][1]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_7_1/Q .original_name {u_rx_fifo/mem[7][1]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_7_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_7_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_7_2 .original_name {{u_rx_fifo/mem[7][2]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_7_2 .single_bit_orig_name {u_rx_fifo/mem[7][2]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_7_2/Q .original_name {u_rx_fifo/mem[7][2]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_7_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_7_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_7_3 .original_name {{u_rx_fifo/mem[7][3]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_7_3 .single_bit_orig_name {u_rx_fifo/mem[7][3]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_7_3/Q .original_name {u_rx_fifo/mem[7][3]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_7_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_7_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_7_4 .original_name {{u_rx_fifo/mem[7][4]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_7_4 .single_bit_orig_name {u_rx_fifo/mem[7][4]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_7_4/Q .original_name {u_rx_fifo/mem[7][4]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_7_5 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_7_5 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_7_5 .original_name {{u_rx_fifo/mem[7][5]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_7_5 .single_bit_orig_name {u_rx_fifo/mem[7][5]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_7_5/Q .original_name {u_rx_fifo/mem[7][5]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_7_6 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_7_6 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_7_6 .original_name {{u_rx_fifo/mem[7][6]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_7_6 .single_bit_orig_name {u_rx_fifo/mem[7][6]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_7_6/Q .original_name {u_rx_fifo/mem[7][6]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_7_7 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_7_7 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_7_7 .original_name {{u_rx_fifo/mem[7][7]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_7_7 .single_bit_orig_name {u_rx_fifo/mem[7][7]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_7_7/Q .original_name {u_rx_fifo/mem[7][7]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_8_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_8_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_8_0 .original_name {{u_rx_fifo/mem[8][0]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_8_0 .single_bit_orig_name {u_rx_fifo/mem[8][0]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_8_0/Q .original_name {u_rx_fifo/mem[8][0]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_8_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_8_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_8_1 .original_name {{u_rx_fifo/mem[8][1]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_8_1 .single_bit_orig_name {u_rx_fifo/mem[8][1]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_8_1/Q .original_name {u_rx_fifo/mem[8][1]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_8_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_8_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_8_2 .original_name {{u_rx_fifo/mem[8][2]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_8_2 .single_bit_orig_name {u_rx_fifo/mem[8][2]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_8_2/Q .original_name {u_rx_fifo/mem[8][2]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_8_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_8_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_8_3 .original_name {{u_rx_fifo/mem[8][3]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_8_3 .single_bit_orig_name {u_rx_fifo/mem[8][3]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_8_3/Q .original_name {u_rx_fifo/mem[8][3]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_8_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_8_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_8_4 .original_name {{u_rx_fifo/mem[8][4]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_8_4 .single_bit_orig_name {u_rx_fifo/mem[8][4]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_8_4/Q .original_name {u_rx_fifo/mem[8][4]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_8_5 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_8_5 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_8_5 .original_name {{u_rx_fifo/mem[8][5]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_8_5 .single_bit_orig_name {u_rx_fifo/mem[8][5]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_8_5/Q .original_name {u_rx_fifo/mem[8][5]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_8_6 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_8_6 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_8_6 .original_name {{u_rx_fifo/mem[8][6]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_8_6 .single_bit_orig_name {u_rx_fifo/mem[8][6]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_8_6/Q .original_name {u_rx_fifo/mem[8][6]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_8_7 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_8_7 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_8_7 .original_name {{u_rx_fifo/mem[8][7]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_8_7 .single_bit_orig_name {u_rx_fifo/mem[8][7]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_8_7/Q .original_name {u_rx_fifo/mem[8][7]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_9_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_9_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_9_0 .original_name {{u_rx_fifo/mem[9][0]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_9_0 .single_bit_orig_name {u_rx_fifo/mem[9][0]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_9_0/Q .original_name {u_rx_fifo/mem[9][0]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_9_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_9_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_9_1 .original_name {{u_rx_fifo/mem[9][1]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_9_1 .single_bit_orig_name {u_rx_fifo/mem[9][1]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_9_1/Q .original_name {u_rx_fifo/mem[9][1]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_9_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_9_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_9_2 .original_name {{u_rx_fifo/mem[9][2]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_9_2 .single_bit_orig_name {u_rx_fifo/mem[9][2]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_9_2/Q .original_name {u_rx_fifo/mem[9][2]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_9_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_9_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_9_3 .original_name {{u_rx_fifo/mem[9][3]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_9_3 .single_bit_orig_name {u_rx_fifo/mem[9][3]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_9_3/Q .original_name {u_rx_fifo/mem[9][3]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_9_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_9_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_9_4 .original_name {{u_rx_fifo/mem[9][4]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_9_4 .single_bit_orig_name {u_rx_fifo/mem[9][4]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_9_4/Q .original_name {u_rx_fifo/mem[9][4]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_9_5 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_9_5 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_9_5 .original_name {{u_rx_fifo/mem[9][5]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_9_5 .single_bit_orig_name {u_rx_fifo/mem[9][5]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_9_5/Q .original_name {u_rx_fifo/mem[9][5]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_9_6 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_9_6 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_9_6 .original_name {{u_rx_fifo/mem[9][6]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_9_6 .single_bit_orig_name {u_rx_fifo/mem[9][6]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_9_6/Q .original_name {u_rx_fifo/mem[9][6]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_9_7 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_9_7 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_9_7 .original_name {{u_rx_fifo/mem[9][7]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_9_7 .single_bit_orig_name {u_rx_fifo/mem[9][7]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_9_7/Q .original_name {u_rx_fifo/mem[9][7]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_10_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_10_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_10_0 .original_name {{u_rx_fifo/mem[10][0]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_10_0 .single_bit_orig_name {u_rx_fifo/mem[10][0]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_10_0/Q .original_name {u_rx_fifo/mem[10][0]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_10_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_10_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_10_1 .original_name {{u_rx_fifo/mem[10][1]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_10_1 .single_bit_orig_name {u_rx_fifo/mem[10][1]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_10_1/Q .original_name {u_rx_fifo/mem[10][1]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_10_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_10_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_10_2 .original_name {{u_rx_fifo/mem[10][2]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_10_2 .single_bit_orig_name {u_rx_fifo/mem[10][2]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_10_2/Q .original_name {u_rx_fifo/mem[10][2]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_10_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_10_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_10_3 .original_name {{u_rx_fifo/mem[10][3]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_10_3 .single_bit_orig_name {u_rx_fifo/mem[10][3]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_10_3/Q .original_name {u_rx_fifo/mem[10][3]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_10_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_10_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_10_4 .original_name {{u_rx_fifo/mem[10][4]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_10_4 .single_bit_orig_name {u_rx_fifo/mem[10][4]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_10_4/Q .original_name {u_rx_fifo/mem[10][4]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_10_5 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_10_5 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_10_5 .original_name {{u_rx_fifo/mem[10][5]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_10_5 .single_bit_orig_name {u_rx_fifo/mem[10][5]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_10_5/Q .original_name {u_rx_fifo/mem[10][5]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_10_6 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_10_6 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_10_6 .original_name {{u_rx_fifo/mem[10][6]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_10_6 .single_bit_orig_name {u_rx_fifo/mem[10][6]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_10_6/Q .original_name {u_rx_fifo/mem[10][6]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_10_7 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_10_7 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_10_7 .original_name {{u_rx_fifo/mem[10][7]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_10_7 .single_bit_orig_name {u_rx_fifo/mem[10][7]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_10_7/Q .original_name {u_rx_fifo/mem[10][7]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_11_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_11_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_11_0 .original_name {{u_rx_fifo/mem[11][0]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_11_0 .single_bit_orig_name {u_rx_fifo/mem[11][0]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_11_0/Q .original_name {u_rx_fifo/mem[11][0]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_11_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_11_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_11_1 .original_name {{u_rx_fifo/mem[11][1]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_11_1 .single_bit_orig_name {u_rx_fifo/mem[11][1]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_11_1/Q .original_name {u_rx_fifo/mem[11][1]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_11_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_11_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_11_2 .original_name {{u_rx_fifo/mem[11][2]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_11_2 .single_bit_orig_name {u_rx_fifo/mem[11][2]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_11_2/Q .original_name {u_rx_fifo/mem[11][2]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_11_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_11_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_11_3 .original_name {{u_rx_fifo/mem[11][3]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_11_3 .single_bit_orig_name {u_rx_fifo/mem[11][3]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_11_3/Q .original_name {u_rx_fifo/mem[11][3]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_11_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_11_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_11_4 .original_name {{u_rx_fifo/mem[11][4]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_11_4 .single_bit_orig_name {u_rx_fifo/mem[11][4]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_11_4/Q .original_name {u_rx_fifo/mem[11][4]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_11_5 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_11_5 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_11_5 .original_name {{u_rx_fifo/mem[11][5]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_11_5 .single_bit_orig_name {u_rx_fifo/mem[11][5]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_11_5/Q .original_name {u_rx_fifo/mem[11][5]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_11_6 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_11_6 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_11_6 .original_name {{u_rx_fifo/mem[11][6]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_11_6 .single_bit_orig_name {u_rx_fifo/mem[11][6]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_11_6/Q .original_name {u_rx_fifo/mem[11][6]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_11_7 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_11_7 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_11_7 .original_name {{u_rx_fifo/mem[11][7]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_11_7 .single_bit_orig_name {u_rx_fifo/mem[11][7]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_11_7/Q .original_name {u_rx_fifo/mem[11][7]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_12_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_12_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_12_0 .original_name {{u_rx_fifo/mem[12][0]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_12_0 .single_bit_orig_name {u_rx_fifo/mem[12][0]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_12_0/Q .original_name {u_rx_fifo/mem[12][0]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_12_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_12_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_12_1 .original_name {{u_rx_fifo/mem[12][1]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_12_1 .single_bit_orig_name {u_rx_fifo/mem[12][1]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_12_1/Q .original_name {u_rx_fifo/mem[12][1]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_12_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_12_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_12_2 .original_name {{u_rx_fifo/mem[12][2]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_12_2 .single_bit_orig_name {u_rx_fifo/mem[12][2]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_12_2/Q .original_name {u_rx_fifo/mem[12][2]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_12_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_12_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_12_3 .original_name {{u_rx_fifo/mem[12][3]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_12_3 .single_bit_orig_name {u_rx_fifo/mem[12][3]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_12_3/Q .original_name {u_rx_fifo/mem[12][3]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_12_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_12_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_12_4 .original_name {{u_rx_fifo/mem[12][4]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_12_4 .single_bit_orig_name {u_rx_fifo/mem[12][4]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_12_4/Q .original_name {u_rx_fifo/mem[12][4]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_12_5 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_12_5 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_12_5 .original_name {{u_rx_fifo/mem[12][5]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_12_5 .single_bit_orig_name {u_rx_fifo/mem[12][5]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_12_5/Q .original_name {u_rx_fifo/mem[12][5]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_12_6 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_12_6 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_12_6 .original_name {{u_rx_fifo/mem[12][6]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_12_6 .single_bit_orig_name {u_rx_fifo/mem[12][6]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_12_6/Q .original_name {u_rx_fifo/mem[12][6]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_12_7 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_12_7 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_12_7 .original_name {{u_rx_fifo/mem[12][7]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_12_7 .single_bit_orig_name {u_rx_fifo/mem[12][7]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_12_7/Q .original_name {u_rx_fifo/mem[12][7]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_13_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_13_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_13_0 .original_name {{u_rx_fifo/mem[13][0]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_13_0 .single_bit_orig_name {u_rx_fifo/mem[13][0]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_13_0/Q .original_name {u_rx_fifo/mem[13][0]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_13_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_13_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_13_1 .original_name {{u_rx_fifo/mem[13][1]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_13_1 .single_bit_orig_name {u_rx_fifo/mem[13][1]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_13_1/Q .original_name {u_rx_fifo/mem[13][1]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_13_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_13_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_13_2 .original_name {{u_rx_fifo/mem[13][2]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_13_2 .single_bit_orig_name {u_rx_fifo/mem[13][2]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_13_2/Q .original_name {u_rx_fifo/mem[13][2]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_13_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_13_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_13_3 .original_name {{u_rx_fifo/mem[13][3]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_13_3 .single_bit_orig_name {u_rx_fifo/mem[13][3]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_13_3/Q .original_name {u_rx_fifo/mem[13][3]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_13_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_13_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_13_4 .original_name {{u_rx_fifo/mem[13][4]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_13_4 .single_bit_orig_name {u_rx_fifo/mem[13][4]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_13_4/Q .original_name {u_rx_fifo/mem[13][4]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_13_5 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_13_5 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_13_5 .original_name {{u_rx_fifo/mem[13][5]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_13_5 .single_bit_orig_name {u_rx_fifo/mem[13][5]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_13_5/Q .original_name {u_rx_fifo/mem[13][5]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_13_6 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_13_6 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_13_6 .original_name {{u_rx_fifo/mem[13][6]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_13_6 .single_bit_orig_name {u_rx_fifo/mem[13][6]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_13_6/Q .original_name {u_rx_fifo/mem[13][6]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_13_7 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_13_7 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_13_7 .original_name {{u_rx_fifo/mem[13][7]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_13_7 .single_bit_orig_name {u_rx_fifo/mem[13][7]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_13_7/Q .original_name {u_rx_fifo/mem[13][7]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_14_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_14_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_14_0 .original_name {{u_rx_fifo/mem[14][0]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_14_0 .single_bit_orig_name {u_rx_fifo/mem[14][0]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_14_0/Q .original_name {u_rx_fifo/mem[14][0]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_14_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_14_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_14_1 .original_name {{u_rx_fifo/mem[14][1]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_14_1 .single_bit_orig_name {u_rx_fifo/mem[14][1]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_14_1/Q .original_name {u_rx_fifo/mem[14][1]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_14_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_14_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_14_2 .original_name {{u_rx_fifo/mem[14][2]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_14_2 .single_bit_orig_name {u_rx_fifo/mem[14][2]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_14_2/Q .original_name {u_rx_fifo/mem[14][2]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_14_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_14_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_14_3 .original_name {{u_rx_fifo/mem[14][3]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_14_3 .single_bit_orig_name {u_rx_fifo/mem[14][3]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_14_3/Q .original_name {u_rx_fifo/mem[14][3]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_14_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_14_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_14_4 .original_name {{u_rx_fifo/mem[14][4]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_14_4 .single_bit_orig_name {u_rx_fifo/mem[14][4]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_14_4/Q .original_name {u_rx_fifo/mem[14][4]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_14_5 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_14_5 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_14_5 .original_name {{u_rx_fifo/mem[14][5]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_14_5 .single_bit_orig_name {u_rx_fifo/mem[14][5]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_14_5/Q .original_name {u_rx_fifo/mem[14][5]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_14_6 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_14_6 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_14_6 .original_name {{u_rx_fifo/mem[14][6]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_14_6 .single_bit_orig_name {u_rx_fifo/mem[14][6]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_14_6/Q .original_name {u_rx_fifo/mem[14][6]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_14_7 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_14_7 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_14_7 .original_name {{u_rx_fifo/mem[14][7]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_14_7 .single_bit_orig_name {u_rx_fifo/mem[14][7]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_14_7/Q .original_name {u_rx_fifo/mem[14][7]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_15_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_15_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_15_0 .original_name {{u_rx_fifo/mem[15][0]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_15_0 .single_bit_orig_name {u_rx_fifo/mem[15][0]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_15_0/Q .original_name {u_rx_fifo/mem[15][0]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_15_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_15_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_15_1 .original_name {{u_rx_fifo/mem[15][1]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_15_1 .single_bit_orig_name {u_rx_fifo/mem[15][1]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_15_1/Q .original_name {u_rx_fifo/mem[15][1]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_15_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_15_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_15_2 .original_name {{u_rx_fifo/mem[15][2]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_15_2 .single_bit_orig_name {u_rx_fifo/mem[15][2]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_15_2/Q .original_name {u_rx_fifo/mem[15][2]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_15_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_15_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_15_3 .original_name {{u_rx_fifo/mem[15][3]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_15_3 .single_bit_orig_name {u_rx_fifo/mem[15][3]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_15_3/Q .original_name {u_rx_fifo/mem[15][3]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_15_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_15_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_15_4 .original_name {{u_rx_fifo/mem[15][4]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_15_4 .single_bit_orig_name {u_rx_fifo/mem[15][4]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_15_4/Q .original_name {u_rx_fifo/mem[15][4]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_15_5 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_15_5 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_15_5 .original_name {{u_rx_fifo/mem[15][5]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_15_5 .single_bit_orig_name {u_rx_fifo/mem[15][5]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_15_5/Q .original_name {u_rx_fifo/mem[15][5]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_15_6 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_15_6 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_15_6 .original_name {{u_rx_fifo/mem[15][6]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_15_6 .single_bit_orig_name {u_rx_fifo/mem[15][6]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_15_6/Q .original_name {u_rx_fifo/mem[15][6]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_15_7 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_15_7 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_15_7 .original_name {{u_rx_fifo/mem[15][7]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/mem_reg_15_7 .single_bit_orig_name {u_rx_fifo/mem[15][7]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/mem_reg_15_7/Q .original_name {u_rx_fifo/mem[15][7]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_empty_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_empty_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_empty_reg .original_name u_rx_fifo/o_empty
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_empty_reg .single_bit_orig_name u_rx_fifo/o_empty
set_db -quiet pin:spi_bridge_top/u_rx_fifo/o_empty_reg/Q .original_name u_rx_fifo/o_empty/q
set_db -quiet pin:spi_bridge_top/u_rx_fifo/o_empty_reg/QN .original_name u_rx_fifo/o_empty/q
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_full_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_full_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_full_reg .original_name u_rx_fifo/o_full
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_full_reg .single_bit_orig_name u_rx_fifo/o_full
set_db -quiet pin:spi_bridge_top/u_rx_fifo/o_full_reg/Q .original_name u_rx_fifo/o_full/q
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_rd_data_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_rd_data_reg_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_rd_data_reg_0 .original_name {{u_rx_fifo/o_rd_data[0]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_rd_data_reg_0 .single_bit_orig_name {u_rx_fifo/o_rd_data[0]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/o_rd_data_reg_0/Q .original_name {u_rx_fifo/o_rd_data[0]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_rd_data_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_rd_data_reg_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_rd_data_reg_1 .original_name {{u_rx_fifo/o_rd_data[1]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_rd_data_reg_1 .single_bit_orig_name {u_rx_fifo/o_rd_data[1]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/o_rd_data_reg_1/Q .original_name {u_rx_fifo/o_rd_data[1]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_rd_data_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_rd_data_reg_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_rd_data_reg_2 .original_name {{u_rx_fifo/o_rd_data[2]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_rd_data_reg_2 .single_bit_orig_name {u_rx_fifo/o_rd_data[2]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/o_rd_data_reg_2/Q .original_name {u_rx_fifo/o_rd_data[2]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_rd_data_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_rd_data_reg_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_rd_data_reg_3 .original_name {{u_rx_fifo/o_rd_data[3]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_rd_data_reg_3 .single_bit_orig_name {u_rx_fifo/o_rd_data[3]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/o_rd_data_reg_3/Q .original_name {u_rx_fifo/o_rd_data[3]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_rd_data_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_rd_data_reg_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_rd_data_reg_4 .original_name {{u_rx_fifo/o_rd_data[4]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_rd_data_reg_4 .single_bit_orig_name {u_rx_fifo/o_rd_data[4]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/o_rd_data_reg_4/Q .original_name {u_rx_fifo/o_rd_data[4]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_rd_data_reg_5 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_rd_data_reg_5 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_rd_data_reg_5 .original_name {{u_rx_fifo/o_rd_data[5]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_rd_data_reg_5 .single_bit_orig_name {u_rx_fifo/o_rd_data[5]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/o_rd_data_reg_5/Q .original_name {u_rx_fifo/o_rd_data[5]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_rd_data_reg_6 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_rd_data_reg_6 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_rd_data_reg_6 .original_name {{u_rx_fifo/o_rd_data[6]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_rd_data_reg_6 .single_bit_orig_name {u_rx_fifo/o_rd_data[6]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/o_rd_data_reg_6/Q .original_name {u_rx_fifo/o_rd_data[6]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_rd_data_reg_7 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_rd_data_reg_7 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_rd_data_reg_7 .original_name {{u_rx_fifo/o_rd_data[7]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/o_rd_data_reg_7 .single_bit_orig_name {u_rx_fifo/o_rd_data[7]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/o_rd_data_reg_7/Q .original_name {u_rx_fifo/o_rd_data[7]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_bin_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_bin_reg_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_bin_reg_4 .original_name {{u_rx_fifo/r_rd_ptr_bin[4]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_bin_reg_4 .single_bit_orig_name {u_rx_fifo/r_rd_ptr_bin[4]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_rd_ptr_bin_reg_4/Q .original_name {u_rx_fifo/r_rd_ptr_bin[4]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_reg_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_reg_4 .original_name {{u_rx_fifo/r_rd_ptr_gray[4]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_reg_4 .single_bit_orig_name {u_rx_fifo/r_rd_ptr_gray[4]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_rd_ptr_gray_reg_4/Q .original_name {u_rx_fifo/r_rd_ptr_gray[4]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_bin_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_bin_reg_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_bin_reg_0 .original_name {{u_rx_fifo/r_wr_ptr_bin[0]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_bin_reg_0 .single_bit_orig_name {u_rx_fifo/r_wr_ptr_bin[0]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_wr_ptr_bin_reg_0/Q .original_name {u_rx_fifo/r_wr_ptr_bin[0]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_bin_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_bin_reg_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_bin_reg_1 .original_name {{u_rx_fifo/r_wr_ptr_bin[1]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_bin_reg_1 .single_bit_orig_name {u_rx_fifo/r_wr_ptr_bin[1]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_wr_ptr_bin_reg_1/Q .original_name {u_rx_fifo/r_wr_ptr_bin[1]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_bin_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_bin_reg_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_bin_reg_2 .original_name {{u_rx_fifo/r_wr_ptr_bin[2]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_bin_reg_2 .single_bit_orig_name {u_rx_fifo/r_wr_ptr_bin[2]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_wr_ptr_bin_reg_2/Q .original_name {u_rx_fifo/r_wr_ptr_bin[2]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_bin_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_bin_reg_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_bin_reg_3 .original_name {{u_rx_fifo/r_wr_ptr_bin[3]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_bin_reg_3 .single_bit_orig_name {u_rx_fifo/r_wr_ptr_bin[3]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_wr_ptr_bin_reg_3/Q .original_name {u_rx_fifo/r_wr_ptr_bin[3]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_bin_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_bin_reg_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_bin_reg_4 .original_name {{u_rx_fifo/r_wr_ptr_bin[4]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_bin_reg_4 .single_bit_orig_name {u_rx_fifo/r_wr_ptr_bin[4]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_wr_ptr_bin_reg_4/Q .original_name {u_rx_fifo/r_wr_ptr_bin[4]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_reg_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_reg_4 .original_name {{u_rx_fifo/r_wr_ptr_gray[4]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_reg_4 .single_bit_orig_name {u_rx_fifo/r_wr_ptr_gray[4]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_wr_ptr_gray_reg_4/Q .original_name {u_rx_fifo/r_wr_ptr_gray[4]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_bin_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_bin_reg_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_bin_reg_3 .original_name {{u_rx_fifo/r_rd_ptr_bin[3]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_bin_reg_3 .single_bit_orig_name {u_rx_fifo/r_rd_ptr_bin[3]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_rd_ptr_bin_reg_3/Q .original_name {u_rx_fifo/r_rd_ptr_bin[3]/q}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_rd_ptr_bin_reg_3/QN .original_name {u_rx_fifo/r_rd_ptr_bin[3]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_bin_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_bin_reg_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_bin_reg_0 .original_name {{u_rx_fifo/r_rd_ptr_bin[0]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_bin_reg_0 .single_bit_orig_name {u_rx_fifo/r_rd_ptr_bin[0]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_rd_ptr_bin_reg_0/Q .original_name {u_rx_fifo/r_rd_ptr_bin[0]/q}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_rd_ptr_bin_reg_0/QN .original_name {u_rx_fifo/r_rd_ptr_bin[0]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_bin_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_bin_reg_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_bin_reg_1 .original_name {{u_rx_fifo/r_rd_ptr_bin[1]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_bin_reg_1 .single_bit_orig_name {u_rx_fifo/r_rd_ptr_bin[1]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_rd_ptr_bin_reg_1/Q .original_name {u_rx_fifo/r_rd_ptr_bin[1]/q}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_rd_ptr_bin_reg_1/QN .original_name {u_rx_fifo/r_rd_ptr_bin[1]/q}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_bin_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_bin_reg_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_bin_reg_2 .original_name {{u_rx_fifo/r_rd_ptr_bin[2]}}
set_db -quiet inst:spi_bridge_top/u_rx_fifo/r_rd_ptr_bin_reg_2 .single_bit_orig_name {u_rx_fifo/r_rd_ptr_bin[2]}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_rd_ptr_bin_reg_2/Q .original_name {u_rx_fifo/r_rd_ptr_bin[2]/q}
set_db -quiet pin:spi_bridge_top/u_rx_fifo/r_rd_ptr_bin_reg_2/QN .original_name {u_rx_fifo/r_rd_ptr_bin[2]/q}
set_db -quiet module:spi_bridge_top/sclk_gen .hdl_filelist {{default -v2001 {SYNTHESIS} {../RTL/Sclk_gen.v} {} {}}}
set_db -quiet inst:spi_bridge_top/u_sclk_gen/o_sclk_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_sclk_gen/o_sclk_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_sclk_gen/o_sclk_reg .original_name u_sclk_gen/o_sclk
set_db -quiet inst:spi_bridge_top/u_sclk_gen/o_sclk_reg .single_bit_orig_name u_sclk_gen/o_sclk
set_db -quiet pin:spi_bridge_top/u_sclk_gen/o_sclk_reg/Q .original_name u_sclk_gen/o_sclk/q
set_db -quiet pin:spi_bridge_top/u_sclk_gen/o_sclk_reg/Q .dont_touch false
set_db -quiet pin:spi_bridge_top/u_sclk_gen/o_sclk_reg/Q .dont_touch_file { }
set_db -quiet pin:spi_bridge_top/u_sclk_gen/o_sclk_reg/Q .dont_touch_reason user_attribute
set_db -quiet inst:spi_bridge_top/u_sclk_gen/r_toggle_phase_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_sclk_gen/r_toggle_phase_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_sclk_gen/r_toggle_phase_reg .original_name u_sclk_gen/r_toggle_phase
set_db -quiet inst:spi_bridge_top/u_sclk_gen/r_toggle_phase_reg .single_bit_orig_name u_sclk_gen/r_toggle_phase
set_db -quiet pin:spi_bridge_top/u_sclk_gen/r_toggle_phase_reg/Q .original_name u_sclk_gen/r_toggle_phase/q
set_db -quiet pin:spi_bridge_top/u_sclk_gen/r_toggle_phase_reg/QN .original_name u_sclk_gen/r_toggle_phase/q
set_db -quiet module:spi_bridge_top/spi_master .is_sop_cluster true
set_db -quiet module:spi_bridge_top/spi_master .hdl_filelist {{default -v2001 {SYNTHESIS} {../RTL/Spi_master.v} {} {}}}
set_db -quiet inst:spi_bridge_top/u_spi_master/bit_cnt_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_master/bit_cnt_reg_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_master/bit_cnt_reg_0 .original_name {{u_spi_master/bit_cnt[0]}}
set_db -quiet inst:spi_bridge_top/u_spi_master/bit_cnt_reg_0 .single_bit_orig_name {u_spi_master/bit_cnt[0]}
set_db -quiet pin:spi_bridge_top/u_spi_master/bit_cnt_reg_0/Q .original_name {u_spi_master/bit_cnt[0]/q}
set_db -quiet inst:spi_bridge_top/u_spi_master/bit_cnt_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_master/bit_cnt_reg_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_master/bit_cnt_reg_1 .original_name {{u_spi_master/bit_cnt[1]}}
set_db -quiet inst:spi_bridge_top/u_spi_master/bit_cnt_reg_1 .single_bit_orig_name {u_spi_master/bit_cnt[1]}
set_db -quiet pin:spi_bridge_top/u_spi_master/bit_cnt_reg_1/Q .original_name {u_spi_master/bit_cnt[1]/q}
set_db -quiet inst:spi_bridge_top/u_spi_master/bit_cnt_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_master/bit_cnt_reg_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_master/bit_cnt_reg_2 .original_name {{u_spi_master/bit_cnt[2]}}
set_db -quiet inst:spi_bridge_top/u_spi_master/bit_cnt_reg_2 .single_bit_orig_name {u_spi_master/bit_cnt[2]}
set_db -quiet pin:spi_bridge_top/u_spi_master/bit_cnt_reg_2/Q .original_name {u_spi_master/bit_cnt[2]/q}
set_db -quiet inst:spi_bridge_top/u_spi_master/idle_cnt_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_master/idle_cnt_reg_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_master/idle_cnt_reg_0 .original_name {{u_spi_master/idle_cnt[0]}}
set_db -quiet inst:spi_bridge_top/u_spi_master/idle_cnt_reg_0 .single_bit_orig_name {u_spi_master/idle_cnt[0]}
set_db -quiet pin:spi_bridge_top/u_spi_master/idle_cnt_reg_0/Q .original_name {u_spi_master/idle_cnt[0]/q}
set_db -quiet inst:spi_bridge_top/u_spi_master/idle_cnt_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_master/idle_cnt_reg_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_master/idle_cnt_reg_1 .original_name {{u_spi_master/idle_cnt[1]}}
set_db -quiet inst:spi_bridge_top/u_spi_master/idle_cnt_reg_1 .single_bit_orig_name {u_spi_master/idle_cnt[1]}
set_db -quiet pin:spi_bridge_top/u_spi_master/idle_cnt_reg_1/Q .original_name {u_spi_master/idle_cnt[1]/q}
set_db -quiet inst:spi_bridge_top/u_spi_master/idle_cnt_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_master/idle_cnt_reg_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_master/idle_cnt_reg_2 .original_name {{u_spi_master/idle_cnt[2]}}
set_db -quiet inst:spi_bridge_top/u_spi_master/idle_cnt_reg_2 .single_bit_orig_name {u_spi_master/idle_cnt[2]}
set_db -quiet pin:spi_bridge_top/u_spi_master/idle_cnt_reg_2/Q .original_name {u_spi_master/idle_cnt[2]/q}
set_db -quiet inst:spi_bridge_top/u_spi_master/idle_cnt_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_master/idle_cnt_reg_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_master/idle_cnt_reg_3 .original_name {{u_spi_master/idle_cnt[3]}}
set_db -quiet inst:spi_bridge_top/u_spi_master/idle_cnt_reg_3 .single_bit_orig_name {u_spi_master/idle_cnt[3]}
set_db -quiet pin:spi_bridge_top/u_spi_master/idle_cnt_reg_3/Q .original_name {u_spi_master/idle_cnt[3]/q}
set_db -quiet inst:spi_bridge_top/u_spi_master/idle_cnt_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_master/idle_cnt_reg_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_master/idle_cnt_reg_4 .original_name {{u_spi_master/idle_cnt[4]}}
set_db -quiet inst:spi_bridge_top/u_spi_master/idle_cnt_reg_4 .single_bit_orig_name {u_spi_master/idle_cnt[4]}
set_db -quiet pin:spi_bridge_top/u_spi_master/idle_cnt_reg_4/Q .original_name {u_spi_master/idle_cnt[4]/q}
set_db -quiet inst:spi_bridge_top/u_spi_master/idle_cnt_reg_5 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_master/idle_cnt_reg_5 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_master/idle_cnt_reg_5 .original_name {{u_spi_master/idle_cnt[5]}}
set_db -quiet inst:spi_bridge_top/u_spi_master/idle_cnt_reg_5 .single_bit_orig_name {u_spi_master/idle_cnt[5]}
set_db -quiet pin:spi_bridge_top/u_spi_master/idle_cnt_reg_5/Q .original_name {u_spi_master/idle_cnt[5]/q}
set_db -quiet inst:spi_bridge_top/u_spi_master/idle_cnt_reg_6 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_master/idle_cnt_reg_6 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_master/idle_cnt_reg_6 .original_name {{u_spi_master/idle_cnt[6]}}
set_db -quiet inst:spi_bridge_top/u_spi_master/idle_cnt_reg_6 .single_bit_orig_name {u_spi_master/idle_cnt[6]}
set_db -quiet pin:spi_bridge_top/u_spi_master/idle_cnt_reg_6/Q .original_name {u_spi_master/idle_cnt[6]/q}
set_db -quiet inst:spi_bridge_top/u_spi_master/idle_cnt_reg_7 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_master/idle_cnt_reg_7 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_master/idle_cnt_reg_7 .original_name {{u_spi_master/idle_cnt[7]}}
set_db -quiet inst:spi_bridge_top/u_spi_master/idle_cnt_reg_7 .single_bit_orig_name {u_spi_master/idle_cnt[7]}
set_db -quiet pin:spi_bridge_top/u_spi_master/idle_cnt_reg_7/Q .original_name {u_spi_master/idle_cnt[7]/q}
set_db -quiet inst:spi_bridge_top/u_spi_master/o_cs_n_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_master/o_cs_n_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_master/o_cs_n_reg .original_name u_spi_master/o_cs_n
set_db -quiet inst:spi_bridge_top/u_spi_master/o_cs_n_reg .single_bit_orig_name u_spi_master/o_cs_n
set_db -quiet pin:spi_bridge_top/u_spi_master/o_cs_n_reg/Q .original_name u_spi_master/o_cs_n/q
set_db -quiet pin:spi_bridge_top/u_spi_master/o_cs_n_reg/QN .original_name u_spi_master/o_cs_n/q
set_db -quiet inst:spi_bridge_top/u_spi_master/o_mosi_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_master/o_mosi_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_master/o_mosi_reg .original_name u_spi_master/o_mosi
set_db -quiet inst:spi_bridge_top/u_spi_master/o_mosi_reg .single_bit_orig_name u_spi_master/o_mosi
set_db -quiet pin:spi_bridge_top/u_spi_master/o_mosi_reg/Q .original_name u_spi_master/o_mosi/q
set_db -quiet pin:spi_bridge_top/u_spi_master/o_mosi_reg/QN .original_name u_spi_master/o_mosi/q
set_db -quiet inst:spi_bridge_top/u_spi_master/r_shift_out_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_master/r_shift_out_reg_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_master/r_shift_out_reg_0 .original_name {{u_spi_master/r_shift_out[0]}}
set_db -quiet inst:spi_bridge_top/u_spi_master/r_shift_out_reg_0 .single_bit_orig_name {u_spi_master/r_shift_out[0]}
set_db -quiet pin:spi_bridge_top/u_spi_master/r_shift_out_reg_0/Q .original_name {u_spi_master/r_shift_out[0]/q}
set_db -quiet inst:spi_bridge_top/u_spi_master/r_shift_out_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_master/r_shift_out_reg_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_master/r_shift_out_reg_1 .original_name {{u_spi_master/r_shift_out[1]}}
set_db -quiet inst:spi_bridge_top/u_spi_master/r_shift_out_reg_1 .single_bit_orig_name {u_spi_master/r_shift_out[1]}
set_db -quiet pin:spi_bridge_top/u_spi_master/r_shift_out_reg_1/Q .original_name {u_spi_master/r_shift_out[1]/q}
set_db -quiet inst:spi_bridge_top/u_spi_master/r_shift_out_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_master/r_shift_out_reg_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_master/r_shift_out_reg_2 .original_name {{u_spi_master/r_shift_out[2]}}
set_db -quiet inst:spi_bridge_top/u_spi_master/r_shift_out_reg_2 .single_bit_orig_name {u_spi_master/r_shift_out[2]}
set_db -quiet pin:spi_bridge_top/u_spi_master/r_shift_out_reg_2/Q .original_name {u_spi_master/r_shift_out[2]/q}
set_db -quiet inst:spi_bridge_top/u_spi_master/r_shift_out_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_master/r_shift_out_reg_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_master/r_shift_out_reg_3 .original_name {{u_spi_master/r_shift_out[3]}}
set_db -quiet inst:spi_bridge_top/u_spi_master/r_shift_out_reg_3 .single_bit_orig_name {u_spi_master/r_shift_out[3]}
set_db -quiet pin:spi_bridge_top/u_spi_master/r_shift_out_reg_3/Q .original_name {u_spi_master/r_shift_out[3]/q}
set_db -quiet inst:spi_bridge_top/u_spi_master/r_shift_out_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_master/r_shift_out_reg_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_master/r_shift_out_reg_4 .original_name {{u_spi_master/r_shift_out[4]}}
set_db -quiet inst:spi_bridge_top/u_spi_master/r_shift_out_reg_4 .single_bit_orig_name {u_spi_master/r_shift_out[4]}
set_db -quiet pin:spi_bridge_top/u_spi_master/r_shift_out_reg_4/Q .original_name {u_spi_master/r_shift_out[4]/q}
set_db -quiet inst:spi_bridge_top/u_spi_master/r_shift_out_reg_5 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_master/r_shift_out_reg_5 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_master/r_shift_out_reg_5 .original_name {{u_spi_master/r_shift_out[5]}}
set_db -quiet inst:spi_bridge_top/u_spi_master/r_shift_out_reg_5 .single_bit_orig_name {u_spi_master/r_shift_out[5]}
set_db -quiet pin:spi_bridge_top/u_spi_master/r_shift_out_reg_5/Q .original_name {u_spi_master/r_shift_out[5]/q}
set_db -quiet inst:spi_bridge_top/u_spi_master/r_shift_out_reg_6 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_master/r_shift_out_reg_6 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_master/r_shift_out_reg_6 .original_name {{u_spi_master/r_shift_out[6]}}
set_db -quiet inst:spi_bridge_top/u_spi_master/r_shift_out_reg_6 .single_bit_orig_name {u_spi_master/r_shift_out[6]}
set_db -quiet pin:spi_bridge_top/u_spi_master/r_shift_out_reg_6/Q .original_name {u_spi_master/r_shift_out[6]/q}
set_db -quiet inst:spi_bridge_top/u_spi_master/r_shift_out_reg_7 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_master/r_shift_out_reg_7 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_master/r_shift_out_reg_7 .original_name {{u_spi_master/r_shift_out[7]}}
set_db -quiet inst:spi_bridge_top/u_spi_master/r_shift_out_reg_7 .single_bit_orig_name {u_spi_master/r_shift_out[7]}
set_db -quiet pin:spi_bridge_top/u_spi_master/r_shift_out_reg_7/Q .original_name {u_spi_master/r_shift_out[7]/q}
set_db -quiet inst:spi_bridge_top/u_spi_master/r_tx_byte_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_master/r_tx_byte_reg_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_master/r_tx_byte_reg_0 .original_name {{u_spi_master/r_tx_byte[0]}}
set_db -quiet inst:spi_bridge_top/u_spi_master/r_tx_byte_reg_0 .single_bit_orig_name {u_spi_master/r_tx_byte[0]}
set_db -quiet pin:spi_bridge_top/u_spi_master/r_tx_byte_reg_0/Q .original_name {u_spi_master/r_tx_byte[0]/q}
set_db -quiet inst:spi_bridge_top/u_spi_master/r_tx_byte_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_master/r_tx_byte_reg_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_master/r_tx_byte_reg_1 .original_name {{u_spi_master/r_tx_byte[1]}}
set_db -quiet inst:spi_bridge_top/u_spi_master/r_tx_byte_reg_1 .single_bit_orig_name {u_spi_master/r_tx_byte[1]}
set_db -quiet pin:spi_bridge_top/u_spi_master/r_tx_byte_reg_1/Q .original_name {u_spi_master/r_tx_byte[1]/q}
set_db -quiet inst:spi_bridge_top/u_spi_master/r_tx_byte_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_master/r_tx_byte_reg_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_master/r_tx_byte_reg_2 .original_name {{u_spi_master/r_tx_byte[2]}}
set_db -quiet inst:spi_bridge_top/u_spi_master/r_tx_byte_reg_2 .single_bit_orig_name {u_spi_master/r_tx_byte[2]}
set_db -quiet pin:spi_bridge_top/u_spi_master/r_tx_byte_reg_2/Q .original_name {u_spi_master/r_tx_byte[2]/q}
set_db -quiet inst:spi_bridge_top/u_spi_master/r_tx_byte_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_master/r_tx_byte_reg_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_master/r_tx_byte_reg_3 .original_name {{u_spi_master/r_tx_byte[3]}}
set_db -quiet inst:spi_bridge_top/u_spi_master/r_tx_byte_reg_3 .single_bit_orig_name {u_spi_master/r_tx_byte[3]}
set_db -quiet pin:spi_bridge_top/u_spi_master/r_tx_byte_reg_3/Q .original_name {u_spi_master/r_tx_byte[3]/q}
set_db -quiet inst:spi_bridge_top/u_spi_master/r_tx_byte_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_master/r_tx_byte_reg_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_master/r_tx_byte_reg_4 .original_name {{u_spi_master/r_tx_byte[4]}}
set_db -quiet inst:spi_bridge_top/u_spi_master/r_tx_byte_reg_4 .single_bit_orig_name {u_spi_master/r_tx_byte[4]}
set_db -quiet pin:spi_bridge_top/u_spi_master/r_tx_byte_reg_4/Q .original_name {u_spi_master/r_tx_byte[4]/q}
set_db -quiet inst:spi_bridge_top/u_spi_master/r_tx_byte_reg_5 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_master/r_tx_byte_reg_5 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_master/r_tx_byte_reg_5 .original_name {{u_spi_master/r_tx_byte[5]}}
set_db -quiet inst:spi_bridge_top/u_spi_master/r_tx_byte_reg_5 .single_bit_orig_name {u_spi_master/r_tx_byte[5]}
set_db -quiet pin:spi_bridge_top/u_spi_master/r_tx_byte_reg_5/Q .original_name {u_spi_master/r_tx_byte[5]/q}
set_db -quiet inst:spi_bridge_top/u_spi_master/r_tx_byte_reg_6 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_master/r_tx_byte_reg_6 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_master/r_tx_byte_reg_6 .original_name {{u_spi_master/r_tx_byte[6]}}
set_db -quiet inst:spi_bridge_top/u_spi_master/r_tx_byte_reg_6 .single_bit_orig_name {u_spi_master/r_tx_byte[6]}
set_db -quiet pin:spi_bridge_top/u_spi_master/r_tx_byte_reg_6/Q .original_name {u_spi_master/r_tx_byte[6]/q}
set_db -quiet inst:spi_bridge_top/u_spi_master/r_tx_byte_reg_7 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_master/r_tx_byte_reg_7 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_master/r_tx_byte_reg_7 .original_name {{u_spi_master/r_tx_byte[7]}}
set_db -quiet inst:spi_bridge_top/u_spi_master/r_tx_byte_reg_7 .single_bit_orig_name {u_spi_master/r_tx_byte[7]}
set_db -quiet pin:spi_bridge_top/u_spi_master/r_tx_byte_reg_7/Q .original_name {u_spi_master/r_tx_byte[7]/q}
set_db -quiet inst:spi_bridge_top/u_spi_master/setup_cnt_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_master/setup_cnt_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_master/setup_cnt_reg .original_name u_spi_master/setup_cnt
set_db -quiet inst:spi_bridge_top/u_spi_master/setup_cnt_reg .single_bit_orig_name u_spi_master/setup_cnt
set_db -quiet pin:spi_bridge_top/u_spi_master/setup_cnt_reg/Q .original_name u_spi_master/setup_cnt/q
set_db -quiet inst:spi_bridge_top/u_spi_master/state_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_master/state_reg_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_master/state_reg_0 .original_name {{u_spi_master/state[0]}}
set_db -quiet inst:spi_bridge_top/u_spi_master/state_reg_0 .single_bit_orig_name {u_spi_master/state[0]}
set_db -quiet pin:spi_bridge_top/u_spi_master/state_reg_0/Q .original_name {u_spi_master/state[0]/q}
set_db -quiet inst:spi_bridge_top/u_spi_master/state_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_master/state_reg_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_master/state_reg_1 .original_name {{u_spi_master/state[1]}}
set_db -quiet inst:spi_bridge_top/u_spi_master/state_reg_1 .single_bit_orig_name {u_spi_master/state[1]}
set_db -quiet pin:spi_bridge_top/u_spi_master/state_reg_1/Q .original_name {u_spi_master/state[1]/q}
set_db -quiet pin:spi_bridge_top/u_spi_master/state_reg_1/QN .original_name {u_spi_master/state[1]/q}
set_db -quiet module:spi_bridge_top/spi_slave .hdl_filelist {{default -v2001 {SYNTHESIS} {../RTL/Spi_slave.v} {} {}}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/o_tx_clear_done_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/o_tx_clear_done_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/o_tx_clear_done_reg .original_name u_spi_slave/o_tx_clear_done
set_db -quiet inst:spi_bridge_top/u_spi_slave/o_tx_clear_done_reg .single_bit_orig_name u_spi_slave/o_tx_clear_done
set_db -quiet pin:spi_bridge_top/u_spi_slave/o_tx_clear_done_reg/Q .original_name u_spi_slave/o_tx_clear_done/q
set_db -quiet inst:spi_bridge_top/u_spi_slave/bit_cnt_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/bit_cnt_reg_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/bit_cnt_reg_0 .original_name {{u_spi_slave/bit_cnt[0]}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/bit_cnt_reg_0 .single_bit_orig_name {u_spi_slave/bit_cnt[0]}
set_db -quiet pin:spi_bridge_top/u_spi_slave/bit_cnt_reg_0/Q .original_name {u_spi_slave/bit_cnt[0]/q}
set_db -quiet inst:spi_bridge_top/u_spi_slave/bit_cnt_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/bit_cnt_reg_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/bit_cnt_reg_1 .original_name {{u_spi_slave/bit_cnt[1]}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/bit_cnt_reg_1 .single_bit_orig_name {u_spi_slave/bit_cnt[1]}
set_db -quiet pin:spi_bridge_top/u_spi_slave/bit_cnt_reg_1/Q .original_name {u_spi_slave/bit_cnt[1]/q}
set_db -quiet inst:spi_bridge_top/u_spi_slave/bit_cnt_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/bit_cnt_reg_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/bit_cnt_reg_2 .original_name {{u_spi_slave/bit_cnt[2]}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/bit_cnt_reg_2 .single_bit_orig_name {u_spi_slave/bit_cnt[2]}
set_db -quiet pin:spi_bridge_top/u_spi_slave/bit_cnt_reg_2/Q .original_name {u_spi_slave/bit_cnt[2]/q}
set_db -quiet inst:spi_bridge_top/u_spi_slave/o_miso_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/o_miso_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/o_miso_reg .original_name u_spi_slave/o_miso
set_db -quiet inst:spi_bridge_top/u_spi_slave/o_miso_reg .single_bit_orig_name u_spi_slave/o_miso
set_db -quiet pin:spi_bridge_top/u_spi_slave/o_miso_reg/Q .original_name u_spi_slave/o_miso/q
set_db -quiet pin:spi_bridge_top/u_spi_slave/o_miso_reg/QN .original_name u_spi_slave/o_miso/q
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_clr_active_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_clr_active_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_clr_active_reg .original_name u_spi_slave/r_clr_active
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_clr_active_reg .single_bit_orig_name u_spi_slave/r_clr_active
set_db -quiet pin:spi_bridge_top/u_spi_slave/r_clr_active_reg/Q .original_name u_spi_slave/r_clr_active/q
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_clr_settle_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_clr_settle_reg_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_clr_settle_reg_0 .original_name {{u_spi_slave/r_clr_settle[0]}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_clr_settle_reg_0 .single_bit_orig_name {u_spi_slave/r_clr_settle[0]}
set_db -quiet pin:spi_bridge_top/u_spi_slave/r_clr_settle_reg_0/Q .original_name {u_spi_slave/r_clr_settle[0]/q}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_clr_settle_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_clr_settle_reg_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_clr_settle_reg_1 .original_name {{u_spi_slave/r_clr_settle[1]}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_clr_settle_reg_1 .single_bit_orig_name {u_spi_slave/r_clr_settle[1]}
set_db -quiet pin:spi_bridge_top/u_spi_slave/r_clr_settle_reg_1/Q .original_name {u_spi_slave/r_clr_settle[1]/q}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_clr_settle_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_clr_settle_reg_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_clr_settle_reg_2 .original_name {{u_spi_slave/r_clr_settle[2]}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_clr_settle_reg_2 .single_bit_orig_name {u_spi_slave/r_clr_settle[2]}
set_db -quiet pin:spi_bridge_top/u_spi_slave/r_clr_settle_reg_2/Q .original_name {u_spi_slave/r_clr_settle[2]/q}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_rx_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_rx_reg_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_rx_reg_0 .original_name {{u_spi_slave/r_shift_rx[0]}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_rx_reg_0 .single_bit_orig_name {u_spi_slave/r_shift_rx[0]}
set_db -quiet pin:spi_bridge_top/u_spi_slave/r_shift_rx_reg_0/Q .original_name {u_spi_slave/r_shift_rx[0]/q}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_rx_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_rx_reg_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_rx_reg_1 .original_name {{u_spi_slave/r_shift_rx[1]}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_rx_reg_1 .single_bit_orig_name {u_spi_slave/r_shift_rx[1]}
set_db -quiet pin:spi_bridge_top/u_spi_slave/r_shift_rx_reg_1/Q .original_name {u_spi_slave/r_shift_rx[1]/q}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_rx_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_rx_reg_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_rx_reg_2 .original_name {{u_spi_slave/r_shift_rx[2]}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_rx_reg_2 .single_bit_orig_name {u_spi_slave/r_shift_rx[2]}
set_db -quiet pin:spi_bridge_top/u_spi_slave/r_shift_rx_reg_2/Q .original_name {u_spi_slave/r_shift_rx[2]/q}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_rx_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_rx_reg_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_rx_reg_3 .original_name {{u_spi_slave/r_shift_rx[3]}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_rx_reg_3 .single_bit_orig_name {u_spi_slave/r_shift_rx[3]}
set_db -quiet pin:spi_bridge_top/u_spi_slave/r_shift_rx_reg_3/Q .original_name {u_spi_slave/r_shift_rx[3]/q}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_rx_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_rx_reg_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_rx_reg_4 .original_name {{u_spi_slave/r_shift_rx[4]}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_rx_reg_4 .single_bit_orig_name {u_spi_slave/r_shift_rx[4]}
set_db -quiet pin:spi_bridge_top/u_spi_slave/r_shift_rx_reg_4/Q .original_name {u_spi_slave/r_shift_rx[4]/q}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_rx_reg_5 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_rx_reg_5 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_rx_reg_5 .original_name {{u_spi_slave/r_shift_rx[5]}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_rx_reg_5 .single_bit_orig_name {u_spi_slave/r_shift_rx[5]}
set_db -quiet pin:spi_bridge_top/u_spi_slave/r_shift_rx_reg_5/Q .original_name {u_spi_slave/r_shift_rx[5]/q}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_rx_reg_6 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_rx_reg_6 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_rx_reg_6 .original_name {{u_spi_slave/r_shift_rx[6]}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_rx_reg_6 .single_bit_orig_name {u_spi_slave/r_shift_rx[6]}
set_db -quiet pin:spi_bridge_top/u_spi_slave/r_shift_rx_reg_6/Q .original_name {u_spi_slave/r_shift_rx[6]/q}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_rx_reg_7 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_rx_reg_7 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_rx_reg_7 .original_name {{u_spi_slave/r_shift_rx[7]}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_rx_reg_7 .single_bit_orig_name {u_spi_slave/r_shift_rx[7]}
set_db -quiet pin:spi_bridge_top/u_spi_slave/r_shift_rx_reg_7/Q .original_name {u_spi_slave/r_shift_rx[7]/q}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_tx_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_tx_reg_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_tx_reg_0 .original_name {{u_spi_slave/r_shift_tx[0]}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_tx_reg_0 .single_bit_orig_name {u_spi_slave/r_shift_tx[0]}
set_db -quiet pin:spi_bridge_top/u_spi_slave/r_shift_tx_reg_0/Q .original_name {u_spi_slave/r_shift_tx[0]/q}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_tx_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_tx_reg_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_tx_reg_1 .original_name {{u_spi_slave/r_shift_tx[1]}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_tx_reg_1 .single_bit_orig_name {u_spi_slave/r_shift_tx[1]}
set_db -quiet pin:spi_bridge_top/u_spi_slave/r_shift_tx_reg_1/Q .original_name {u_spi_slave/r_shift_tx[1]/q}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_tx_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_tx_reg_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_tx_reg_2 .original_name {{u_spi_slave/r_shift_tx[2]}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_tx_reg_2 .single_bit_orig_name {u_spi_slave/r_shift_tx[2]}
set_db -quiet pin:spi_bridge_top/u_spi_slave/r_shift_tx_reg_2/Q .original_name {u_spi_slave/r_shift_tx[2]/q}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_tx_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_tx_reg_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_tx_reg_3 .original_name {{u_spi_slave/r_shift_tx[3]}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_tx_reg_3 .single_bit_orig_name {u_spi_slave/r_shift_tx[3]}
set_db -quiet pin:spi_bridge_top/u_spi_slave/r_shift_tx_reg_3/Q .original_name {u_spi_slave/r_shift_tx[3]/q}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_tx_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_tx_reg_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_tx_reg_4 .original_name {{u_spi_slave/r_shift_tx[4]}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_tx_reg_4 .single_bit_orig_name {u_spi_slave/r_shift_tx[4]}
set_db -quiet pin:spi_bridge_top/u_spi_slave/r_shift_tx_reg_4/Q .original_name {u_spi_slave/r_shift_tx[4]/q}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_tx_reg_5 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_tx_reg_5 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_tx_reg_5 .original_name {{u_spi_slave/r_shift_tx[5]}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_tx_reg_5 .single_bit_orig_name {u_spi_slave/r_shift_tx[5]}
set_db -quiet pin:spi_bridge_top/u_spi_slave/r_shift_tx_reg_5/Q .original_name {u_spi_slave/r_shift_tx[5]/q}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_tx_reg_6 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_tx_reg_6 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_tx_reg_6 .original_name {{u_spi_slave/r_shift_tx[6]}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_tx_reg_6 .single_bit_orig_name {u_spi_slave/r_shift_tx[6]}
set_db -quiet pin:spi_bridge_top/u_spi_slave/r_shift_tx_reg_6/Q .original_name {u_spi_slave/r_shift_tx[6]/q}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_tx_reg_7 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_tx_reg_7 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_tx_reg_7 .original_name {{u_spi_slave/r_shift_tx[7]}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_shift_tx_reg_7 .single_bit_orig_name {u_spi_slave/r_shift_tx[7]}
set_db -quiet pin:spi_bridge_top/u_spi_slave/r_shift_tx_reg_7/Q .original_name {u_spi_slave/r_shift_tx[7]/q}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_cur_from_hold_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_cur_from_hold_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_cur_from_hold_reg .original_name u_spi_slave/r_tx_cur_from_hold
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_cur_from_hold_reg .single_bit_orig_name u_spi_slave/r_tx_cur_from_hold
set_db -quiet pin:spi_bridge_top/u_spi_slave/r_tx_cur_from_hold_reg/Q .original_name u_spi_slave/r_tx_cur_from_hold/q
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_reg_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_reg_0 .original_name {{u_spi_slave/r_tx_hold[0]}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_reg_0 .single_bit_orig_name {u_spi_slave/r_tx_hold[0]}
set_db -quiet pin:spi_bridge_top/u_spi_slave/r_tx_hold_reg_0/Q .original_name {u_spi_slave/r_tx_hold[0]/q}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_reg_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_reg_1 .original_name {{u_spi_slave/r_tx_hold[1]}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_reg_1 .single_bit_orig_name {u_spi_slave/r_tx_hold[1]}
set_db -quiet pin:spi_bridge_top/u_spi_slave/r_tx_hold_reg_1/Q .original_name {u_spi_slave/r_tx_hold[1]/q}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_reg_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_reg_2 .original_name {{u_spi_slave/r_tx_hold[2]}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_reg_2 .single_bit_orig_name {u_spi_slave/r_tx_hold[2]}
set_db -quiet pin:spi_bridge_top/u_spi_slave/r_tx_hold_reg_2/Q .original_name {u_spi_slave/r_tx_hold[2]/q}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_reg_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_reg_3 .original_name {{u_spi_slave/r_tx_hold[3]}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_reg_3 .single_bit_orig_name {u_spi_slave/r_tx_hold[3]}
set_db -quiet pin:spi_bridge_top/u_spi_slave/r_tx_hold_reg_3/Q .original_name {u_spi_slave/r_tx_hold[3]/q}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_reg_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_reg_4 .original_name {{u_spi_slave/r_tx_hold[4]}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_reg_4 .single_bit_orig_name {u_spi_slave/r_tx_hold[4]}
set_db -quiet pin:spi_bridge_top/u_spi_slave/r_tx_hold_reg_4/Q .original_name {u_spi_slave/r_tx_hold[4]/q}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_reg_5 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_reg_5 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_reg_5 .original_name {{u_spi_slave/r_tx_hold[5]}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_reg_5 .single_bit_orig_name {u_spi_slave/r_tx_hold[5]}
set_db -quiet pin:spi_bridge_top/u_spi_slave/r_tx_hold_reg_5/Q .original_name {u_spi_slave/r_tx_hold[5]/q}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_reg_6 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_reg_6 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_reg_6 .original_name {{u_spi_slave/r_tx_hold[6]}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_reg_6 .single_bit_orig_name {u_spi_slave/r_tx_hold[6]}
set_db -quiet pin:spi_bridge_top/u_spi_slave/r_tx_hold_reg_6/Q .original_name {u_spi_slave/r_tx_hold[6]/q}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_reg_7 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_reg_7 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_reg_7 .original_name {{u_spi_slave/r_tx_hold[7]}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_reg_7 .single_bit_orig_name {u_spi_slave/r_tx_hold[7]}
set_db -quiet pin:spi_bridge_top/u_spi_slave/r_tx_hold_reg_7/Q .original_name {u_spi_slave/r_tx_hold[7]/q}
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_valid_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_valid_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_valid_reg .original_name u_spi_slave/r_tx_hold_valid
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_hold_valid_reg .single_bit_orig_name u_spi_slave/r_tx_hold_valid
set_db -quiet pin:spi_bridge_top/u_spi_slave/r_tx_hold_valid_reg/Q .original_name u_spi_slave/r_tx_hold_valid/q
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_pop_d_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_pop_d_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_pop_d_reg .original_name u_spi_slave/r_tx_pop_d
set_db -quiet inst:spi_bridge_top/u_spi_slave/r_tx_pop_d_reg .single_bit_orig_name u_spi_slave/r_tx_pop_d
set_db -quiet pin:spi_bridge_top/u_spi_slave/r_tx_pop_d_reg/Q .original_name u_spi_slave/r_tx_pop_d/q
set_db -quiet inst:spi_bridge_top/u_spi_slave/state_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/state_reg_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/state_reg_1 .original_name {{u_spi_slave/state[1]}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/state_reg_1 .single_bit_orig_name {u_spi_slave/state[1]}
set_db -quiet pin:spi_bridge_top/u_spi_slave/state_reg_1/Q .original_name {u_spi_slave/state[1]/q}
set_db -quiet inst:spi_bridge_top/u_spi_slave/state_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_spi_slave/state_reg_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_spi_slave/state_reg_0 .original_name {{u_spi_slave/state[0]}}
set_db -quiet inst:spi_bridge_top/u_spi_slave/state_reg_0 .single_bit_orig_name {u_spi_slave/state[0]}
set_db -quiet pin:spi_bridge_top/u_spi_slave/state_reg_0/Q .original_name {u_spi_slave/state[0]/q}
set_db -quiet pin:spi_bridge_top/u_spi_slave/state_reg_0/QN .original_name {u_spi_slave/state[0]/q}
set_db -quiet module:spi_bridge_top/spi_bridge_top_pulse_sync_1 .hdl_filelist {{default -v2001 {SYNTHESIS} {../RTL/Pulse_sync.v} {} {}}}
set_db -quiet inst:spi_bridge_top/u_tx_clear_done_sync/r_dst_sync_d_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_clear_done_sync/r_dst_sync_d_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_clear_done_sync/r_dst_sync_d_reg .original_name u_tx_clear_done_sync/r_dst_sync_d
set_db -quiet inst:spi_bridge_top/u_tx_clear_done_sync/r_dst_sync_d_reg .single_bit_orig_name u_tx_clear_done_sync/r_dst_sync_d
set_db -quiet pin:spi_bridge_top/u_tx_clear_done_sync/r_dst_sync_d_reg/Q .original_name u_tx_clear_done_sync/r_dst_sync_d/q
set_db -quiet inst:spi_bridge_top/u_tx_clear_done_sync/r_dst_sync_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_clear_done_sync/r_dst_sync_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_clear_done_sync/r_dst_sync_reg .original_name u_tx_clear_done_sync/r_dst_sync
set_db -quiet inst:spi_bridge_top/u_tx_clear_done_sync/r_dst_sync_reg .single_bit_orig_name u_tx_clear_done_sync/r_dst_sync
set_db -quiet pin:spi_bridge_top/u_tx_clear_done_sync/r_dst_sync_reg/Q .original_name u_tx_clear_done_sync/r_dst_sync/q
set_db -quiet inst:spi_bridge_top/u_tx_clear_done_sync/r_dst_meta_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_clear_done_sync/r_dst_meta_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_clear_done_sync/r_dst_meta_reg .original_name u_tx_clear_done_sync/r_dst_meta
set_db -quiet inst:spi_bridge_top/u_tx_clear_done_sync/r_dst_meta_reg .single_bit_orig_name u_tx_clear_done_sync/r_dst_meta
set_db -quiet pin:spi_bridge_top/u_tx_clear_done_sync/r_dst_meta_reg/Q .original_name u_tx_clear_done_sync/r_dst_meta/q
set_db -quiet inst:spi_bridge_top/u_tx_clear_done_sync/r_src_toggle_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_clear_done_sync/r_src_toggle_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_clear_done_sync/r_src_toggle_reg .original_name u_tx_clear_done_sync/r_src_toggle
set_db -quiet inst:spi_bridge_top/u_tx_clear_done_sync/r_src_toggle_reg .single_bit_orig_name u_tx_clear_done_sync/r_src_toggle
set_db -quiet pin:spi_bridge_top/u_tx_clear_done_sync/r_src_toggle_reg/Q .original_name u_tx_clear_done_sync/r_src_toggle/q
set_db -quiet module:spi_bridge_top/pulse_sync .hdl_filelist {{default -v2001 {SYNTHESIS} {../RTL/Pulse_sync.v} {} {}}}
set_db -quiet inst:spi_bridge_top/u_tx_clear_req_sync/r_dst_sync_d_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_clear_req_sync/r_dst_sync_d_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_clear_req_sync/r_dst_sync_d_reg .original_name u_tx_clear_req_sync/r_dst_sync_d
set_db -quiet inst:spi_bridge_top/u_tx_clear_req_sync/r_dst_sync_d_reg .single_bit_orig_name u_tx_clear_req_sync/r_dst_sync_d
set_db -quiet pin:spi_bridge_top/u_tx_clear_req_sync/r_dst_sync_d_reg/Q .original_name u_tx_clear_req_sync/r_dst_sync_d/q
set_db -quiet inst:spi_bridge_top/u_tx_clear_req_sync/r_dst_sync_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_clear_req_sync/r_dst_sync_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_clear_req_sync/r_dst_sync_reg .original_name u_tx_clear_req_sync/r_dst_sync
set_db -quiet inst:spi_bridge_top/u_tx_clear_req_sync/r_dst_sync_reg .single_bit_orig_name u_tx_clear_req_sync/r_dst_sync
set_db -quiet pin:spi_bridge_top/u_tx_clear_req_sync/r_dst_sync_reg/Q .original_name u_tx_clear_req_sync/r_dst_sync/q
set_db -quiet inst:spi_bridge_top/u_tx_clear_req_sync/r_dst_meta_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_clear_req_sync/r_dst_meta_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_clear_req_sync/r_dst_meta_reg .original_name u_tx_clear_req_sync/r_dst_meta
set_db -quiet inst:spi_bridge_top/u_tx_clear_req_sync/r_dst_meta_reg .single_bit_orig_name u_tx_clear_req_sync/r_dst_meta
set_db -quiet pin:spi_bridge_top/u_tx_clear_req_sync/r_dst_meta_reg/Q .original_name u_tx_clear_req_sync/r_dst_meta/q
set_db -quiet inst:spi_bridge_top/u_tx_clear_req_sync/r_src_toggle_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_clear_req_sync/r_src_toggle_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_clear_req_sync/r_src_toggle_reg .original_name u_tx_clear_req_sync/r_src_toggle
set_db -quiet inst:spi_bridge_top/u_tx_clear_req_sync/r_src_toggle_reg .single_bit_orig_name u_tx_clear_req_sync/r_src_toggle
set_db -quiet pin:spi_bridge_top/u_tx_clear_req_sync/r_src_toggle_reg/Q .original_name u_tx_clear_req_sync/r_src_toggle/q
set_db -quiet module:spi_bridge_top/async_fifo_DATA_WIDTH8_ADDR_WIDTH2 .hdl_filelist {{default -v2001 {SYNTHESIS} {../RTL/Async_fifo.v} {} {}}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_wclk_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_wclk_reg_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_wclk_reg_0 .original_name {{u_tx_fifo/r_rd_ptr_gray_wclk[0]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_wclk_reg_0 .single_bit_orig_name {u_tx_fifo/r_rd_ptr_gray_wclk[0]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_wclk_reg_0/Q .original_name {u_tx_fifo/r_rd_ptr_gray_wclk[0]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_wclk_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_wclk_reg_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_wclk_reg_1 .original_name {{u_tx_fifo/r_rd_ptr_gray_wclk[1]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_wclk_reg_1 .single_bit_orig_name {u_tx_fifo/r_rd_ptr_gray_wclk[1]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_wclk_reg_1/Q .original_name {u_tx_fifo/r_rd_ptr_gray_wclk[1]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_meta_w_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_meta_w_reg_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_meta_w_reg_1 .original_name {{u_tx_fifo/r_rd_ptr_gray_meta_w[1]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_meta_w_reg_1 .single_bit_orig_name {u_tx_fifo/r_rd_ptr_gray_meta_w[1]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_meta_w_reg_1/Q .original_name {u_tx_fifo/r_rd_ptr_gray_meta_w[1]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_rclk_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_rclk_reg_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_rclk_reg_0 .original_name {{u_tx_fifo/r_wr_ptr_gray_rclk[0]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_rclk_reg_0 .single_bit_orig_name {u_tx_fifo/r_wr_ptr_gray_rclk[0]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_rclk_reg_0/Q .original_name {u_tx_fifo/r_wr_ptr_gray_rclk[0]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_rclk_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_rclk_reg_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_rclk_reg_1 .original_name {{u_tx_fifo/r_wr_ptr_gray_rclk[1]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_rclk_reg_1 .single_bit_orig_name {u_tx_fifo/r_wr_ptr_gray_rclk[1]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_rclk_reg_1/Q .original_name {u_tx_fifo/r_wr_ptr_gray_rclk[1]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_meta_w_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_meta_w_reg_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_meta_w_reg_0 .original_name {{u_tx_fifo/r_rd_ptr_gray_meta_w[0]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_meta_w_reg_0 .single_bit_orig_name {u_tx_fifo/r_rd_ptr_gray_meta_w[0]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_meta_w_reg_0/Q .original_name {u_tx_fifo/r_rd_ptr_gray_meta_w[0]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_reg_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_reg_1 .original_name {{u_tx_fifo/r_rd_ptr_gray[1]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_reg_1 .single_bit_orig_name {u_tx_fifo/r_rd_ptr_gray[1]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_reg_1/Q .original_name {u_tx_fifo/r_rd_ptr_gray[1]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_meta_r_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_meta_r_reg_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_meta_r_reg_0 .original_name {{u_tx_fifo/r_wr_ptr_gray_meta_r[0]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_meta_r_reg_0 .single_bit_orig_name {u_tx_fifo/r_wr_ptr_gray_meta_r[0]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_meta_r_reg_0/Q .original_name {u_tx_fifo/r_wr_ptr_gray_meta_r[0]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_meta_r_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_meta_r_reg_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_meta_r_reg_1 .original_name {{u_tx_fifo/r_wr_ptr_gray_meta_r[1]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_meta_r_reg_1 .single_bit_orig_name {u_tx_fifo/r_wr_ptr_gray_meta_r[1]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_meta_r_reg_1/Q .original_name {u_tx_fifo/r_wr_ptr_gray_meta_r[1]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_reg_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_reg_0 .original_name {{u_tx_fifo/r_rd_ptr_gray[0]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_reg_0 .single_bit_orig_name {u_tx_fifo/r_rd_ptr_gray[0]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_reg_0/Q .original_name {u_tx_fifo/r_rd_ptr_gray[0]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_reg_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_reg_1 .original_name {{u_tx_fifo/r_wr_ptr_gray[1]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_reg_1 .single_bit_orig_name {u_tx_fifo/r_wr_ptr_gray[1]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_reg_1/Q .original_name {u_tx_fifo/r_wr_ptr_gray[1]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_reg_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_reg_0 .original_name {{u_tx_fifo/r_wr_ptr_gray[0]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_reg_0 .single_bit_orig_name {u_tx_fifo/r_wr_ptr_gray[0]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_reg_0/Q .original_name {u_tx_fifo/r_wr_ptr_gray[0]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_wclk_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_wclk_reg_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_wclk_reg_2 .original_name {{u_tx_fifo/r_rd_ptr_gray_wclk[2]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_wclk_reg_2 .single_bit_orig_name {u_tx_fifo/r_rd_ptr_gray_wclk[2]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_wclk_reg_2/Q .original_name {u_tx_fifo/r_rd_ptr_gray_wclk[2]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_rclk_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_rclk_reg_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_rclk_reg_2 .original_name {{u_tx_fifo/r_wr_ptr_gray_rclk[2]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_rclk_reg_2 .single_bit_orig_name {u_tx_fifo/r_wr_ptr_gray_rclk[2]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_rclk_reg_2/Q .original_name {u_tx_fifo/r_wr_ptr_gray_rclk[2]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_meta_r_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_meta_r_reg_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_meta_r_reg_2 .original_name {{u_tx_fifo/r_wr_ptr_gray_meta_r[2]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_meta_r_reg_2 .single_bit_orig_name {u_tx_fifo/r_wr_ptr_gray_meta_r[2]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_meta_r_reg_2/Q .original_name {u_tx_fifo/r_wr_ptr_gray_meta_r[2]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_meta_w_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_meta_w_reg_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_meta_w_reg_2 .original_name {{u_tx_fifo/r_rd_ptr_gray_meta_w[2]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_meta_w_reg_2 .single_bit_orig_name {u_tx_fifo/r_rd_ptr_gray_meta_w[2]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_meta_w_reg_2/Q .original_name {u_tx_fifo/r_rd_ptr_gray_meta_w[2]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_0_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_0_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_0_0 .original_name {{u_tx_fifo/mem[0][0]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_0_0 .single_bit_orig_name {u_tx_fifo/mem[0][0]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/mem_reg_0_0/Q .original_name {u_tx_fifo/mem[0][0]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_0_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_0_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_0_1 .original_name {{u_tx_fifo/mem[0][1]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_0_1 .single_bit_orig_name {u_tx_fifo/mem[0][1]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/mem_reg_0_1/Q .original_name {u_tx_fifo/mem[0][1]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_0_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_0_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_0_2 .original_name {{u_tx_fifo/mem[0][2]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_0_2 .single_bit_orig_name {u_tx_fifo/mem[0][2]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/mem_reg_0_2/Q .original_name {u_tx_fifo/mem[0][2]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_0_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_0_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_0_3 .original_name {{u_tx_fifo/mem[0][3]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_0_3 .single_bit_orig_name {u_tx_fifo/mem[0][3]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/mem_reg_0_3/Q .original_name {u_tx_fifo/mem[0][3]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_0_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_0_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_0_4 .original_name {{u_tx_fifo/mem[0][4]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_0_4 .single_bit_orig_name {u_tx_fifo/mem[0][4]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/mem_reg_0_4/Q .original_name {u_tx_fifo/mem[0][4]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_0_5 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_0_5 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_0_5 .original_name {{u_tx_fifo/mem[0][5]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_0_5 .single_bit_orig_name {u_tx_fifo/mem[0][5]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/mem_reg_0_5/Q .original_name {u_tx_fifo/mem[0][5]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_0_6 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_0_6 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_0_6 .original_name {{u_tx_fifo/mem[0][6]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_0_6 .single_bit_orig_name {u_tx_fifo/mem[0][6]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/mem_reg_0_6/Q .original_name {u_tx_fifo/mem[0][6]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_0_7 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_0_7 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_0_7 .original_name {{u_tx_fifo/mem[0][7]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_0_7 .single_bit_orig_name {u_tx_fifo/mem[0][7]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/mem_reg_0_7/Q .original_name {u_tx_fifo/mem[0][7]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_1_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_1_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_1_0 .original_name {{u_tx_fifo/mem[1][0]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_1_0 .single_bit_orig_name {u_tx_fifo/mem[1][0]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/mem_reg_1_0/Q .original_name {u_tx_fifo/mem[1][0]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_1_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_1_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_1_1 .original_name {{u_tx_fifo/mem[1][1]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_1_1 .single_bit_orig_name {u_tx_fifo/mem[1][1]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/mem_reg_1_1/Q .original_name {u_tx_fifo/mem[1][1]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_1_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_1_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_1_2 .original_name {{u_tx_fifo/mem[1][2]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_1_2 .single_bit_orig_name {u_tx_fifo/mem[1][2]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/mem_reg_1_2/Q .original_name {u_tx_fifo/mem[1][2]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_1_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_1_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_1_3 .original_name {{u_tx_fifo/mem[1][3]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_1_3 .single_bit_orig_name {u_tx_fifo/mem[1][3]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/mem_reg_1_3/Q .original_name {u_tx_fifo/mem[1][3]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_1_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_1_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_1_4 .original_name {{u_tx_fifo/mem[1][4]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_1_4 .single_bit_orig_name {u_tx_fifo/mem[1][4]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/mem_reg_1_4/Q .original_name {u_tx_fifo/mem[1][4]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_1_5 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_1_5 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_1_5 .original_name {{u_tx_fifo/mem[1][5]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_1_5 .single_bit_orig_name {u_tx_fifo/mem[1][5]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/mem_reg_1_5/Q .original_name {u_tx_fifo/mem[1][5]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_1_6 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_1_6 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_1_6 .original_name {{u_tx_fifo/mem[1][6]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_1_6 .single_bit_orig_name {u_tx_fifo/mem[1][6]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/mem_reg_1_6/Q .original_name {u_tx_fifo/mem[1][6]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_1_7 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_1_7 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_1_7 .original_name {{u_tx_fifo/mem[1][7]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_1_7 .single_bit_orig_name {u_tx_fifo/mem[1][7]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/mem_reg_1_7/Q .original_name {u_tx_fifo/mem[1][7]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_2_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_2_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_2_0 .original_name {{u_tx_fifo/mem[2][0]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_2_0 .single_bit_orig_name {u_tx_fifo/mem[2][0]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/mem_reg_2_0/Q .original_name {u_tx_fifo/mem[2][0]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_2_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_2_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_2_1 .original_name {{u_tx_fifo/mem[2][1]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_2_1 .single_bit_orig_name {u_tx_fifo/mem[2][1]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/mem_reg_2_1/Q .original_name {u_tx_fifo/mem[2][1]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_2_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_2_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_2_2 .original_name {{u_tx_fifo/mem[2][2]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_2_2 .single_bit_orig_name {u_tx_fifo/mem[2][2]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/mem_reg_2_2/Q .original_name {u_tx_fifo/mem[2][2]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_2_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_2_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_2_3 .original_name {{u_tx_fifo/mem[2][3]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_2_3 .single_bit_orig_name {u_tx_fifo/mem[2][3]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/mem_reg_2_3/Q .original_name {u_tx_fifo/mem[2][3]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_2_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_2_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_2_4 .original_name {{u_tx_fifo/mem[2][4]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_2_4 .single_bit_orig_name {u_tx_fifo/mem[2][4]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/mem_reg_2_4/Q .original_name {u_tx_fifo/mem[2][4]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_2_5 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_2_5 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_2_5 .original_name {{u_tx_fifo/mem[2][5]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_2_5 .single_bit_orig_name {u_tx_fifo/mem[2][5]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/mem_reg_2_5/Q .original_name {u_tx_fifo/mem[2][5]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_2_6 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_2_6 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_2_6 .original_name {{u_tx_fifo/mem[2][6]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_2_6 .single_bit_orig_name {u_tx_fifo/mem[2][6]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/mem_reg_2_6/Q .original_name {u_tx_fifo/mem[2][6]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_2_7 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_2_7 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_2_7 .original_name {{u_tx_fifo/mem[2][7]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_2_7 .single_bit_orig_name {u_tx_fifo/mem[2][7]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/mem_reg_2_7/Q .original_name {u_tx_fifo/mem[2][7]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_3_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_3_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_3_0 .original_name {{u_tx_fifo/mem[3][0]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_3_0 .single_bit_orig_name {u_tx_fifo/mem[3][0]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/mem_reg_3_0/Q .original_name {u_tx_fifo/mem[3][0]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_3_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_3_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_3_1 .original_name {{u_tx_fifo/mem[3][1]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_3_1 .single_bit_orig_name {u_tx_fifo/mem[3][1]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/mem_reg_3_1/Q .original_name {u_tx_fifo/mem[3][1]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_3_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_3_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_3_2 .original_name {{u_tx_fifo/mem[3][2]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_3_2 .single_bit_orig_name {u_tx_fifo/mem[3][2]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/mem_reg_3_2/Q .original_name {u_tx_fifo/mem[3][2]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_3_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_3_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_3_3 .original_name {{u_tx_fifo/mem[3][3]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_3_3 .single_bit_orig_name {u_tx_fifo/mem[3][3]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/mem_reg_3_3/Q .original_name {u_tx_fifo/mem[3][3]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_3_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_3_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_3_4 .original_name {{u_tx_fifo/mem[3][4]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_3_4 .single_bit_orig_name {u_tx_fifo/mem[3][4]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/mem_reg_3_4/Q .original_name {u_tx_fifo/mem[3][4]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_3_5 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_3_5 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_3_5 .original_name {{u_tx_fifo/mem[3][5]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_3_5 .single_bit_orig_name {u_tx_fifo/mem[3][5]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/mem_reg_3_5/Q .original_name {u_tx_fifo/mem[3][5]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_3_6 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_3_6 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_3_6 .original_name {{u_tx_fifo/mem[3][6]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_3_6 .single_bit_orig_name {u_tx_fifo/mem[3][6]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/mem_reg_3_6/Q .original_name {u_tx_fifo/mem[3][6]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_3_7 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_3_7 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_3_7 .original_name {{u_tx_fifo/mem[3][7]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/mem_reg_3_7 .single_bit_orig_name {u_tx_fifo/mem[3][7]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/mem_reg_3_7/Q .original_name {u_tx_fifo/mem[3][7]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_empty_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_empty_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_empty_reg .original_name u_tx_fifo/o_empty
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_empty_reg .single_bit_orig_name u_tx_fifo/o_empty
set_db -quiet pin:spi_bridge_top/u_tx_fifo/o_empty_reg/Q .original_name u_tx_fifo/o_empty/q
set_db -quiet pin:spi_bridge_top/u_tx_fifo/o_empty_reg/QN .original_name u_tx_fifo/o_empty/q
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_full_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_full_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_full_reg .original_name u_tx_fifo/o_full
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_full_reg .single_bit_orig_name u_tx_fifo/o_full
set_db -quiet pin:spi_bridge_top/u_tx_fifo/o_full_reg/Q .original_name u_tx_fifo/o_full/q
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_rd_data_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_rd_data_reg_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_rd_data_reg_0 .original_name {{u_tx_fifo/o_rd_data[0]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_rd_data_reg_0 .single_bit_orig_name {u_tx_fifo/o_rd_data[0]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/o_rd_data_reg_0/Q .original_name {u_tx_fifo/o_rd_data[0]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_rd_data_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_rd_data_reg_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_rd_data_reg_1 .original_name {{u_tx_fifo/o_rd_data[1]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_rd_data_reg_1 .single_bit_orig_name {u_tx_fifo/o_rd_data[1]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/o_rd_data_reg_1/Q .original_name {u_tx_fifo/o_rd_data[1]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_rd_data_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_rd_data_reg_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_rd_data_reg_2 .original_name {{u_tx_fifo/o_rd_data[2]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_rd_data_reg_2 .single_bit_orig_name {u_tx_fifo/o_rd_data[2]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/o_rd_data_reg_2/Q .original_name {u_tx_fifo/o_rd_data[2]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_rd_data_reg_3 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_rd_data_reg_3 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_rd_data_reg_3 .original_name {{u_tx_fifo/o_rd_data[3]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_rd_data_reg_3 .single_bit_orig_name {u_tx_fifo/o_rd_data[3]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/o_rd_data_reg_3/Q .original_name {u_tx_fifo/o_rd_data[3]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_rd_data_reg_4 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_rd_data_reg_4 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_rd_data_reg_4 .original_name {{u_tx_fifo/o_rd_data[4]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_rd_data_reg_4 .single_bit_orig_name {u_tx_fifo/o_rd_data[4]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/o_rd_data_reg_4/Q .original_name {u_tx_fifo/o_rd_data[4]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_rd_data_reg_5 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_rd_data_reg_5 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_rd_data_reg_5 .original_name {{u_tx_fifo/o_rd_data[5]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_rd_data_reg_5 .single_bit_orig_name {u_tx_fifo/o_rd_data[5]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/o_rd_data_reg_5/Q .original_name {u_tx_fifo/o_rd_data[5]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_rd_data_reg_6 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_rd_data_reg_6 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_rd_data_reg_6 .original_name {{u_tx_fifo/o_rd_data[6]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_rd_data_reg_6 .single_bit_orig_name {u_tx_fifo/o_rd_data[6]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/o_rd_data_reg_6/Q .original_name {u_tx_fifo/o_rd_data[6]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_rd_data_reg_7 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_rd_data_reg_7 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_rd_data_reg_7 .original_name {{u_tx_fifo/o_rd_data[7]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/o_rd_data_reg_7 .single_bit_orig_name {u_tx_fifo/o_rd_data[7]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/o_rd_data_reg_7/Q .original_name {u_tx_fifo/o_rd_data[7]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_bin_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_bin_reg_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_bin_reg_0 .original_name {{u_tx_fifo/r_rd_ptr_bin[0]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_bin_reg_0 .single_bit_orig_name {u_tx_fifo/r_rd_ptr_bin[0]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/r_rd_ptr_bin_reg_0/Q .original_name {u_tx_fifo/r_rd_ptr_bin[0]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_bin_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_bin_reg_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_bin_reg_1 .original_name {{u_tx_fifo/r_rd_ptr_bin[1]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_bin_reg_1 .single_bit_orig_name {u_tx_fifo/r_rd_ptr_bin[1]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/r_rd_ptr_bin_reg_1/Q .original_name {u_tx_fifo/r_rd_ptr_bin[1]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_bin_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_bin_reg_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_bin_reg_2 .original_name {{u_tx_fifo/r_rd_ptr_bin[2]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_bin_reg_2 .single_bit_orig_name {u_tx_fifo/r_rd_ptr_bin[2]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/r_rd_ptr_bin_reg_2/Q .original_name {u_tx_fifo/r_rd_ptr_bin[2]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_reg_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_reg_2 .original_name {{u_tx_fifo/r_rd_ptr_gray[2]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_reg_2 .single_bit_orig_name {u_tx_fifo/r_rd_ptr_gray[2]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/r_rd_ptr_gray_reg_2/Q .original_name {u_tx_fifo/r_rd_ptr_gray[2]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_bin_reg_0 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_bin_reg_0 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_bin_reg_0 .original_name {{u_tx_fifo/r_wr_ptr_bin[0]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_bin_reg_0 .single_bit_orig_name {u_tx_fifo/r_wr_ptr_bin[0]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/r_wr_ptr_bin_reg_0/Q .original_name {u_tx_fifo/r_wr_ptr_bin[0]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_bin_reg_1 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_bin_reg_1 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_bin_reg_1 .original_name {{u_tx_fifo/r_wr_ptr_bin[1]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_bin_reg_1 .single_bit_orig_name {u_tx_fifo/r_wr_ptr_bin[1]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/r_wr_ptr_bin_reg_1/Q .original_name {u_tx_fifo/r_wr_ptr_bin[1]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_bin_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_bin_reg_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_bin_reg_2 .original_name {{u_tx_fifo/r_wr_ptr_bin[2]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_bin_reg_2 .single_bit_orig_name {u_tx_fifo/r_wr_ptr_bin[2]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/r_wr_ptr_bin_reg_2/Q .original_name {u_tx_fifo/r_wr_ptr_bin[2]/q}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_reg_2 .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_reg_2 .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_reg_2 .original_name {{u_tx_fifo/r_wr_ptr_gray[2]}}
set_db -quiet inst:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_reg_2 .single_bit_orig_name {u_tx_fifo/r_wr_ptr_gray[2]}
set_db -quiet pin:spi_bridge_top/u_tx_fifo/r_wr_ptr_gray_reg_2/Q .original_name {u_tx_fifo/r_wr_ptr_gray[2]/q}
set_db -quiet inst:spi_bridge_top/r_spi_busy_sync_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/r_spi_busy_sync_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/r_spi_busy_sync_reg .original_name r_spi_busy_sync
set_db -quiet inst:spi_bridge_top/r_spi_busy_sync_reg .single_bit_orig_name r_spi_busy_sync
set_db -quiet pin:spi_bridge_top/r_spi_busy_sync_reg/Q .original_name r_spi_busy_sync/q
set_db -quiet inst:spi_bridge_top/r_spi_busy_meta_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/r_spi_busy_meta_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/r_spi_busy_meta_reg .original_name r_spi_busy_meta
set_db -quiet inst:spi_bridge_top/r_spi_busy_meta_reg .single_bit_orig_name r_spi_busy_meta
set_db -quiet pin:spi_bridge_top/r_spi_busy_meta_reg/Q .original_name r_spi_busy_meta/q
set_db -quiet inst:spi_bridge_top/r_spi_busy_sclk_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/r_spi_busy_sclk_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/r_spi_busy_sclk_reg .original_name r_spi_busy_sclk
set_db -quiet inst:spi_bridge_top/r_spi_busy_sclk_reg .single_bit_orig_name r_spi_busy_sclk
set_db -quiet pin:spi_bridge_top/r_spi_busy_sclk_reg/Q .original_name r_spi_busy_sclk/q
set_db -quiet inst:spi_bridge_top/r_rx_full_sync_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/r_rx_full_sync_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/r_rx_full_sync_reg .original_name r_rx_full_sync
set_db -quiet inst:spi_bridge_top/r_rx_full_sync_reg .single_bit_orig_name r_rx_full_sync
set_db -quiet pin:spi_bridge_top/r_rx_full_sync_reg/Q .original_name r_rx_full_sync/q
set_db -quiet inst:spi_bridge_top/r_rx_full_meta_reg .orig_hdl_instantiated false
set_db -quiet inst:spi_bridge_top/r_rx_full_meta_reg .gint_phase_inversion false
set_db -quiet inst:spi_bridge_top/r_rx_full_meta_reg .original_name r_rx_full_meta
set_db -quiet inst:spi_bridge_top/r_rx_full_meta_reg .single_bit_orig_name r_rx_full_meta
set_db -quiet pin:spi_bridge_top/r_rx_full_meta_reg/Q .original_name r_rx_full_meta/q
# BEGIN PMBIST SECTION
# END PMBIST SECTION
# BEGIN PHYSICAL ANNOTATION SECTION
# END PHYSICAL ANNOTATION SECTION
# BEGIN GLO TBR TABLE
set_db -quiet design:spi_bridge_top .set_boundary_change_new {start restore}
set_db -quiet design:spi_bridge_top .set_boundary_change_new {finish restore}
# END GLO TBR TABLE
set_db -quiet source_verbose true
#############################################################
#####   FLOW WRITE   ########################################
##
## Written by Genus(TM) Synthesis Solution version 22.17-s071_1
## flowkit v22.15-s003_1
## Written on 19:10:08 20-Oct 2026
#############################################################
#####   Flow Definitions   ##################################

#############################################################
#####   Step Definitions   ##################################


#############################################################
#####   Attribute Definitions   #############################

if {[is_attribute flow_edit_end_steps -obj_type root]} {set_db flow_edit_end_steps {}}
if {[is_attribute flow_edit_start_steps -obj_type root]} {set_db flow_edit_start_steps {}}
if {[is_attribute flow_footer_tcl -obj_type root]} {set_db flow_footer_tcl {}}
if {[is_attribute flow_header_tcl -obj_type root]} {set_db flow_header_tcl {}}
if {[is_attribute flow_metadata -obj_type root]} {set_db flow_metadata {}}
if {[is_attribute flow_setup_config -obj_type root]} {set_db flow_setup_config {HUDDLE {!!map {}}}}
if {[is_attribute flow_step_begin_tcl -obj_type root]} {set_db flow_step_begin_tcl {}}
if {[is_attribute flow_step_check_tcl -obj_type root]} {set_db flow_step_check_tcl {}}
if {[is_attribute flow_step_end_tcl -obj_type root]} {set_db flow_step_end_tcl {}}
if {[is_attribute flow_step_order -obj_type root]} {set_db flow_step_order {}}
if {[is_attribute flow_summary_tcl -obj_type root]} {set_db flow_summary_tcl {}}
if {[is_attribute flow_template_feature_definition -obj_type root]} {set_db flow_template_feature_definition {}}
if {[is_attribute flow_template_type -obj_type root]} {set_db flow_template_type {}}
if {[is_attribute flow_template_tools -obj_type root]} {set_db flow_template_tools {}}
if {[is_attribute flow_template_version -obj_type root]} {set_db flow_template_version {}}
if {[is_attribute flow_user_templates -obj_type root]} {set_db flow_user_templates {}}


#############################################################
#####   Flow History   ######################################

if {[is_attribute flow_user_templates -obj_type root]} {set_db flow_user_templates {}}
if {[is_attribute flow_plugin_steps -obj_type root]} {set_db flow_plugin_steps {}}
if {[is_attribute flow_template_type -obj_type root]} {set_db flow_template_type {}}
if {[is_attribute flow_template_tools -obj_type root]} {set_db flow_template_tools {}}
if {[is_attribute flow_template_version -obj_type root]} {set_db flow_template_version {}}
if {[is_attribute flow_template_feature_definition -obj_type root]} {set_db flow_template_feature_definition {}}
if {[is_attribute flow_remark -obj_type root]} {set_db flow_remark {}}
if {[is_attribute flow_features -obj_type root]} {set_db flow_features {}}
if {[is_attribute flow_feature_values -obj_type root]} {set_db flow_feature_values {}}
if {[is_attribute flow_write_db_args -obj_type root]} {set_db flow_write_db_args {}}
if {[is_attribute flow_write_db_sdc -obj_type root]} {set_db flow_write_db_sdc true}
if {[is_attribute flow_write_db_common -obj_type root]} {set_db flow_write_db_common false}
if {[is_attribute flow_post_db_overwrite -obj_type root]} {set_db flow_post_db_overwrite {}}
if {[is_attribute flow_step_order -obj_type root]} {set_db flow_step_order {}}
if {[is_attribute flow_step_begin_tcl -obj_type root]} {set_db flow_step_begin_tcl {}}
if {[is_attribute flow_step_end_tcl -obj_type root]} {set_db flow_step_end_tcl {}}
if {[is_attribute flow_step_last -obj_type root]} {set_db flow_step_last {}}
if {[is_attribute flow_step_current -obj_type root]} {set_db flow_step_current {}}
if {[is_attribute flow_step_canonical_current -obj_type root]} {set_db flow_step_canonical_current {}}
if {[is_attribute flow_step_next -obj_type root]} {set_db flow_step_next {}}
if {[is_attribute flow_working_directory -obj_type root]} {set_db flow_working_directory .}
if {[is_attribute flow_branch -obj_type root]} {set_db flow_branch {}}
if {[is_attribute flow_caller_data -obj_type root]} {set_db flow_caller_data {}}
if {[is_attribute flow_metrics_snapshot_uuid -obj_type root]} {set_db flow_metrics_snapshot_uuid {}}
if {[is_attribute flow_starting_db -obj_type root]} {set_db flow_starting_db {}}
if {[is_attribute flow_db_directory -obj_type root]} {set_db flow_db_directory dbs}
if {[is_attribute flow_report_directory -obj_type root]} {set_db flow_report_directory reports}
if {[is_attribute flow_log_directory -obj_type root]} {set_db flow_log_directory logs}
if {[is_attribute flow_mail_to -obj_type root]} {set_db flow_mail_to {}}
if {[is_attribute flow_exit_when_done -obj_type root]} {set_db flow_exit_when_done false}
if {[is_attribute flow_mail_on_error -obj_type root]} {set_db flow_mail_on_error false}
if {[is_attribute flow_summary_tcl -obj_type root]} {set_db flow_summary_tcl {}}
if {[is_attribute flow_history -obj_type root]} {set_db flow_history {}}
if {[is_attribute flow_step_last_status -obj_type root]} {set_db flow_step_last_status not_run}
if {[is_attribute flow_step_last_msg -obj_type root]} {set_db flow_step_last_msg {}}
if {[is_attribute flow_run_tag -obj_type root]} {set_db flow_run_tag {}}
if {[is_attribute flow_current_cache -obj_type root]} {set_db flow_current_cache {}}
if {[is_attribute flow_step_order_cache -obj_type root]} {set_db flow_step_order_cache {}}
if {[is_attribute flow_step_results_cache -obj_type root]} {set_db flow_step_results_cache {}}
if {[is_attribute flow_metadata -obj_type root]} {set_db flow_metadata {}}
if {[is_attribute flow_execute_in_global -obj_type root]} {set_db flow_execute_in_global true}
if {[is_attribute flow_overwrite_db -obj_type root]} {set_db flow_overwrite_db false}
if {[is_attribute flow_print_run_information -obj_type root]} {set_db flow_print_run_information false}
if {[is_attribute flow_verbose -obj_type root]} {set_db flow_verbose true}
if {[is_attribute flow_print_run_information_full -obj_type root]} {set_db flow_print_run_information_full false}
if {[is_attribute flow_header_tcl -obj_type root]} {set_db flow_header_tcl {}}
if {[is_attribute flow_footer_tcl -obj_type root]} {set_db flow_footer_tcl {}}
if {[is_attribute flow_init_header_tcl -obj_type root]} {set_db flow_init_header_tcl {}}
if {[is_attribute flow_init_footer_tcl -obj_type root]} {set_db flow_init_footer_tcl {}}
if {[is_attribute flow_edit_start_steps -obj_type root]} {set_db flow_edit_start_steps {}}
if {[is_attribute flow_edit_end_steps -obj_type root]} {set_db flow_edit_end_steps {}}
if {[is_attribute flow_step_last_number -obj_type root]} {set_db flow_step_last_number 0}
if {[is_attribute flow_autoload_applets -obj_type root]} {set_db flow_autoload_applets false}
if {[is_attribute flow_autoload_dir -obj_type root]} {set_db flow_autoload_dir error}
if {[is_attribute flow_skip_auto_db_save -obj_type root]} {set_db flow_skip_auto_db_save true}
if {[is_attribute flow_skip_auto_generate_metrics -obj_type root]} {set_db flow_skip_auto_generate_metrics false}
if {[is_attribute flow_top -obj_type root]} {set_db flow_top {}}
if {[is_attribute flow_hier_path -obj_type root]} {set_db flow_hier_path {}}
if {[is_attribute flow_schedule -obj_type root]} {set_db flow_schedule {}}
if {[is_attribute flow_step_check_tcl -obj_type root]} {set_db flow_step_check_tcl {}}
if {[is_attribute flow_script -obj_type root]} {set_db flow_script {}}
if {[is_attribute flow_yaml_script -obj_type root]} {set_db flow_yaml_script {}}
if {[is_attribute flow_cla_enabled_features -obj_type root]} {set_db flow_cla_enabled_features {}}
if {[is_attribute flow_cla_inject_tcl -obj_type root]} {set_db flow_cla_inject_tcl {}}
if {[is_attribute flow_error_message -obj_type root]} {set_db flow_error_message {}}
if {[is_attribute flow_error_errorinfo -obj_type root]} {set_db flow_error_errorinfo {}}
if {[is_attribute flow_exclude_time_for_init_flow -obj_type root]} {set_db flow_exclude_time_for_init_flow false}
if {[is_attribute flow_error_write_db -obj_type root]} {set_db flow_error_write_db true}
if {[is_attribute flow_advanced_metric_isolation -obj_type root]} {set_db flow_advanced_metric_isolation flow}
if {[is_attribute flow_yaml_root -obj_type root]} {set_db flow_yaml_root {}}
if {[is_attribute flow_yaml_root_dir -obj_type root]} {set_db flow_yaml_root_dir {}}
if {[is_attribute flow_setup_config -obj_type root]} {set_db flow_setup_config {HUDDLE {!!map {}}}}

#############################################################
#####   User Defined Attributes   ###########################

