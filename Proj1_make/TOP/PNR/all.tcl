
########################################
# InitDesign (Setup, Floorplan)
########################################

## Initialization
set init_gnd_net VSS
set init_lef_file {../../../GPDK045/digital/gsclib045_all_v4.4/gsclib045_tech/lef/gsclib045_tech.lef ../../../GPDK045/digital/gsclib045_all_v4.4/gsclib045/lef/gsclib045_macro.lef ../../../GPDK045/digital/gsclib045_all_v4.4/gsclib045/lef/gsclib045_multibitsDFF.lef ../../../GPDK045/digital/giolib045_v3.5/lef/giolib045_modify.lef}
set init_verilog ../SYN/mapped/cmsdk_mcu_syn_final.v
set init_mmmc_file cmsdk_mcu.mmmc.view
set init_io_file init.io
set init_top_cell cmsdk_mcu
set init_pwr_net VDD
init_design

## Check Design
checkDesign -io -netlist -physicalLibrary -powerGround -tieHilo -timingLibrary -spef -floorplan -place -outdir checkDesign

##################################################
## Floorplan :: Below is for CHIP AREA (4030,4030)
##################################################
floorPlan -site CoreSite -r 0.999507042254 0.7 1200 1200 1200 1200

## Move IO Cells (PDVDD, PDVSS)
selectInst pad46
placeInstance pad46 0.0 580.0 R270
selectInst pad47
placeInstance pad47 0.0 510.0 R270
selectInst pad36
placeInstance pad36 0.0 1280.0 R270
selectInst pad35
placeInstance pad35 0.0 1350.0 R270
selectInst pad23
placeInstance pad23 0.0 2190.0 R270
selectInst pad22
placeInstance pad22 0.0 2260.0 R270
selectInst pad21
placeInstance pad21 0.0 2330.0 R270
selectInst pad12
placeInstance pad12 0.0 2960.0 R270
selectInst pad11
placeInstance pad11 0.0 3030.0 R270
selectInst pad7
placeInstance pad7 0.0 3310.0 R270
selectInst pad67
placeInstance pad67 1420.0 0.0 R0
selectInst pad68
placeInstance pad68 1490.0 0.0 R0
selectInst pad88
placeInstance pad88 2890.0 0.0 R0
selectInst pad87
placeInstance pad87 2820.0 0.0 R0
selectInst pad118
placeInstance pad118 3790.0 1490.0 R90
selectInst pad119
placeInstance pad119 3790.0 1560.0 R90
selectInst pad138
placeInstance pad138 3790.0 2890.0 R90
selectInst pad139
placeInstance pad139 3790.0 2960.0 R90
selectInst pad182
placeInstance pad182 1560.0 3790.0 R180
selectInst pad181
placeInstance pad181 1630.0 3790.0 R180
selectInst pad161
placeInstance pad161 3030.0 3790.0 R180
selectInst pad160
placeInstance pad160 3100.0 3790.0 R180

## IO Filler Insertion
addIoFiller -cell padIORINGFEED60 padIORINGFEED10 padIORINGFEED5 padIORINGFEED3 padIORINGFEED1 -prefix FILLER -side n
addIoFiller -cell padIORINGFEED60 padIORINGFEED10 padIORINGFEED5 padIORINGFEED3 padIORINGFEED1 -prefix FILLER -side s
addIoFiller -cell padIORINGFEED60 padIORINGFEED10 padIORINGFEED5 padIORINGFEED3 padIORINGFEED1 -prefix FILLER -side w
addIoFiller -cell padIORINGFEED60 padIORINGFEED10 padIORINGFEED5 padIORINGFEED3 padIORINGFEED1 -prefix FILLER -side e


## If there is no error, Save Design
saveDesign -def InitDesign


########################################
# PowerPlan 
########################################

#restoreDesign InitDesign.dat

## Global Net Connection
globalNetConnect VDD -type pgpin -pin VDD -instanceBasename *
globalNetConnect VSS -type pgpin -pin VSS -instanceBasename *
globalNetConnect VDD -type tiehi -instanceBasename *
globalNetConnect VSS -type tielo -instanceBasename *
setTieHiLoMode -reset
setTieHiLoMode -cell {  TIELO TIEHI } -honorDontTouch false -createHierPort false

## Make Rectangular Ring  :: inner Ring
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer Metal11 -stacked_via_bottom_layer Metal1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }

addRing -nets {VDD VSS} -type core_rings -follow core -layer {top Metal11 bottom Metal11 left Metal10 right Metal10} -width {top 5 bottom 5 left 5 right 5} -spacing {top 5 bottom 5 left 5 right 5} -offset {top 5 bottom 5 left 5 right 5} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None

## Make STD cells's Power Rail
setSrouteMode -viaConnectToShape { noshape }

sroute -connect { corePin } -layerChangeRange { Metal1(1) Metal11(11) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { Metal1(1) Metal11(11) } -nets { VDD VSS } -allowLayerChange 1 -targetViaLayerRange { Metal1(1) Metal11(11) }

## Make Vertical Stripe in Core Area 
setAddStripeMode -ignore_block_check false -break_at none -route_over_rows_only false -rows_without_stripes_only false -extend_to_closest_target none -stop_at_last_wire_for_area false -partial_set_thru_domain false -ignore_nondefault_domains false -trim_antenna_back_to_shape none -spacing_type edge_to_edge -spacing_from_block 0 -stripe_min_length stripe_width -stacked_via_top_layer Metal11 -stacked_via_bottom_layer Metal1 -via_using_exact_crossover_size false -split_vias false -orthogonal_only true -allow_jog { padcore_ring  block_ring } -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape   }

addStripe -nets {VDD VSS} -layer Metal10 -direction vertical -width 5 -spacing 5 -set_to_set_distance 100 -start_from left -start_offset 10 -stop_offset 0 -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit Metal11 -padcore_ring_bottom_layer_limit Metal1 -block_ring_top_layer_limit Metal11 -block_ring_bottom_layer_limit Metal1 -use_wire_group 0 -snap_wire_center_to_grid None


## Make Outer Rectangular Ring
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer Metal11 -stacked_via_bottom_layer Metal1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }

addRing -nets {VDD VSS} -type core_rings -follow core -layer {top Metal11 bottom Metal11 left Metal10 right Metal10} -width {top 5 bottom 5 left 5 right 5} -spacing {top 5 bottom 5 left 5 right 5} -offset {top 1000 bottom 1000 left 1000 right 1000} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None

## Connect between Pad and Outer Rectangular Ring
setSrouteMode -viaConnectToShape { noshape }

sroute -connect { padPin } -layerChangeRange { Metal1(1) Metal11(11) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -allowJogging 1 -crossoverViaLayerRange { Metal1(1) Metal11(11) } -nets { VDD VSS } -allowLayerChange 1 -targetViaLayerRange { Metal1(1) Metal11(11) }


# Connect between Inner and Outer Rectangular Ring :: Vertical direction
setAddStripeMode -ignore_block_check false -break_at none -route_over_rows_only false -rows_without_stripes_only false -extend_to_closest_target none -stop_at_last_wire_for_area false -partial_set_thru_domain false -ignore_nondefault_domains false -trim_antenna_back_to_shape none -spacing_type edge_to_edge -spacing_from_block 0 -stripe_min_length stripe_width -stacked_via_top_layer Metal11 -stacked_via_bottom_layer Metal1 -via_using_exact_crossover_size false -split_vias false -orthogonal_only true -allow_jog { padcore_ring  block_ring } -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape   }

addStripe -nets {VDD VSS} -layer Metal10 -direction vertical -width 5 -spacing 5 -set_to_set_distance 100 -start_from left -start_offset 50 -stop_offset 0 -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit Metal11 -padcore_ring_bottom_layer_limit Metal1 -block_ring_top_layer_limit Metal11 -block_ring_bottom_layer_limit Metal1 -use_wire_group 0 -snap_wire_center_to_grid None



# Connect between Inner and Outer Rectangular Ring :: Horizontal direction
setAddStripeMode -ignore_block_check false -break_at none -route_over_rows_only false -rows_without_stripes_only false -extend_to_closest_target none -stop_at_last_wire_for_area false -partial_set_thru_domain false -ignore_nondefault_domains false -trim_antenna_back_to_shape none -spacing_type edge_to_edge -spacing_from_block 0 -stripe_min_length stripe_width -stacked_via_top_layer Metal11 -stacked_via_bottom_layer Metal1 -via_using_exact_crossover_size false -split_vias false -orthogonal_only true -allow_jog { padcore_ring  block_ring } -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape   }

addStripe -nets {VDD VSS} -layer Metal11 -direction horizontal -width 5 -spacing 5 -set_to_set_distance 100 -start_from bottom -start_offset 50 -stop_offset 0 -switch_layer_over_obs false -max_same_layer_jog_length 2 -padcore_ring_top_layer_limit Metal11 -padcore_ring_bottom_layer_limit Metal1 -block_ring_top_layer_limit Metal11 -block_ring_bottom_layer_limit Metal1 -use_wire_group 0 -snap_wire_center_to_grid None

## verifyConnectiviy -only Soft PG Connect 
verifyConnectivity -type all -noOpen -noAntenna -noWeakConnect -noUnConnPin -noUnroutedNet -error 1000 -warning 50

## If there is no error, Save Design
saveDesign -def PowerPlan

######################################3
## Placement & Optimization
######################################3
#restoreDesign PowerPlan.dat 
set_db place_global_cong_effort high

# First placement
place_design

# Check the Placement Density 
checkPlace cmsdk_mcu.checkPlace

# Early GlobalRoute :: analisys of Congestion and Timing after Placement 
setRouteMode -earlyGlobalMinRouteLayer 1 -earlyGlobalMaxRouteLayer 11 -earlyGlobalHonorMsvRouteConstraint false -earlyGlobalRoutePartitionPinGuide true
earlyGlobalRoute
reportCongestion -hotSpot
reportCongestion -overflow

# View Density Map 
setDrawView place
setLayerPreference densityMap -isVisible 1
setLayerPreference densityMap -isVisible 0

## View Pin Density Map
setLayerPreference pinDensityMap -isVisible 1
setLayerPreference pinDensityMap -isVisible 0

# Placement Optimization 
place_opt_design

# Early GlobalRoute :: analisys of Congestion and Timing after Placement 
earlyGlobalRoute
reportCongestion -hotSpot
reportCongestion -overflow

#Timing summary
timeDesign -preCTS -outDir reports/timing/preCTS

#checkDesign :: Density 
checkDesign -place

# If there is no error, Save Design
saveDesign -def PlaceOpt

########################################
# CTS & Optimization
########################################

#restoreDesign PlaceOpt.dat
# Target about skew
set_ccopt_property target_skew 0.01  

create_ccopt_clock_tree_spec
# CTS and report all timing WNS, TNS results
ccopt_design

# Propagated Clock
set_interactive_constraint_modes [all_constraint_modes -active] ;# set_propagated_clock command needs the existing mode is active  :: Mode is named FUNC and you can check with the command 'all_constraint_modes command'
set_propagated_clock [all_clocks]

# Check right-after CTS
timeDesign -postCTS -outDir reports/timing/postCTS
report_ccopt_clock_trees -file reports/clock/clock_trees.rpt
report_ccopt_skew_groups -file reports/clock/skew_groups.rpt
report_clock_timing -type skew -nworst 5 > reports/clock/skew.rpt

# Optimization of my design after CTS
optDesign -postCTS 	; # Setup/DRV concurrently
optDesign -postCTS -hold ;# Only for hold violation
timeDesign -postCTS -outDir reports/timing/postCTS

# If there is no error, Save Design
saveDesign -def PostCTSopt

##############
# Route
##############

#restoreDesign PostCTSopt.dat

# Route Auto : To Detail
setNanoRouteMode -quiet -drouteFixAntenna 1
setNanoRouteMode -quiet -routeInsertAntennaDiode 0
setNanoRouteMode -quiet -routeWithTimingDriven 1
setNanoRouteMode -quiet -routeWithEco 0
setNanoRouteMode -quiet -routeWithLithoDriven 0
setNanoRouteMode -quiet -droutePostRouteLithoRepair 0
setNanoRouteMode -quiet -routeWithSiDriven 1
setNanoRouteMode -quiet -routeTdrEffort 8
setNanoRouteMode -quiet -drouteAutoStop 0
setNanoRouteMode -quiet -routeSelectedNetOnly 0
setNanoRouteMode -quiet -routeTopRoutingLayer 11
setNanoRouteMode -quiet -routeBottomRoutingLayer 1
setNanoRouteMode -quiet -drouteEndIteration 5
setNanoRouteMode -quiet -routeWithTimingDriven true
setNanoRouteMode -quiet -routeWithSiDriven true
routeDesign -globalDetail

# DRC
get_verify_drc_mode -disable_rules -quiet
get_verify_drc_mode -quiet -area
get_verify_drc_mode -quiet -layer_range
get_verify_drc_mode -check_ndr_spacing -quiet
get_verify_drc_mode -check_only -quiet
get_verify_drc_mode -check_same_via_cell -quiet
get_verify_drc_mode -exclude_pg_net -quiet
get_verify_drc_mode -ignore_trial_route -quiet
get_verify_drc_mode -max_wrong_way_halo -quiet
get_verify_drc_mode -use_min_spacing_on_block_obs -quiet
get_verify_drc_mode -limit -quiet
set_verify_drc_mode -disable_rules {} -check_ndr_spacing auto -check_only default -check_same_via_cell true -exclude_pg_net false -ignore_trial_route false -ignore_cell_blockage false -use_min_spacing_on_block_obs auto -report cmsdk_mcu.drc.rpt -limit 1000

verify_drc
set_verify_drc_mode -area {0 0 0 0}

# Auto DRC Fix
setAnalysisMode -analysisType onChipVariation
optDesign -postRoute -drv ; # auto DRC Fix

# LVS : Connectivity 
verifyConnectivity -type all -geomConnect -error 1000 -warning 50

# Violation Browser
setLayerPreference violation -isVisible 1
violationBrowser -all -no_display_false -displayByLayer

# Net Parasitic RC Extraction
extractRC

# Timing optimization
# smkcow
# Upper side, I suggest the below command to do auto fix DRC
# setAnalysisMode -analysisType onChipVariation 
#
# After that, I used the below <optDesign> command to make the design free about timing violations
# optDesign -postRoute -setup; # Optimization and resolve the Setup Violation 
# 
# However, optDesign command didn't do well so I decided to change analysisType to single 
# It was more helpful to make the design better

setDelayCalMode -SIAware false ; # Delete SI effect -> base delay is only used
setAnalysisMode -analysisType single -checkType setup ; # After change to single mode
optDesign -postRoute -setup; # 0 : Optimization and resolve the Setup Violation 

setAnalysisMode -analysisType single -checkType hold
optDesign -postRoute -hold; # 1 : Optimization and resolve the Hold Violation 

timeDesign -postRoute 	; # Setup time report
timeDesign -postRoute -hold; # Hold time report

# If there is no error, save Design
# option1 : innovus and tempus : It is useful to read design easily in Tempus
saveDesign -rc -def RouteDesign

# option2 : tempus -stylus
#saveDesign -rc -mmmc2 RouteDesign_mmmc2

#The current design in memory uses the MMMC1 format, and Stylus write_db can only save an MMMC2 format DB.  You should either use saveDesign -mmmc2 to save and convert it to MMMC2, or use Stylus read_db to auto-convert the MMMC1 DB to an MMMC2 DB when reading it into Stylus.

# without -stylus option : MMMC1 format
# with -stylus option : MMMC2 format
# Below command is for stylus 
#write_db -rc_extract postRoute


##################
# Power Analysis
##################

set_power_analysis_mode -reset

# You can switch some options :: analysis_view, corner
set_power_analysis_mode -method static -analysis_view FUNC_SS_WORST -corner max -create_binary_db true -write_static_currents true -honor_negative_energy true -ignore_control_signals true

## Once again : Global Net Connection
globalNetConnect VDD -type pgpin -pin VDD -instanceBasename *
globalNetConnect VSS -type pgpin -pin VSS -instanceBasename *
globalNetConnect VDD -type tiehi -instanceBasename *
globalNetConnect VSS -type tielo -instanceBasename *

set_power_output_dir -reset
set_power_output_dir ./run1 ; 		#You can define the folder name
set_dynamic_power_simulation -reset ; 	# If you want to do the static power simulation
set_default_switching_activity -reset
set_default_switching_activity -input_activity 0.2 -period 8.0 ;# 8ns operation
read_activity_file -reset ; 		#If you don't have fsdb or vcd file, reset at here
set_power -reset
set_powerup_analysis -reset
report_power -rail_analysis_format VS -outfile ./run1/cmsdk_mcu.rpt

########################
# Rail IR-DROP Analysis
########################
# There are Some Errors during Rail IR-drop report
# Skip This step
# Alternatively, Use Voltus to Anlyze 
########################


#######################
#### Chip Finish ######
#######################
#restoreDesign RouteDesign.dat

# Add Filler
getFillerMode -quiet
addFiller -cell FILL1 FILL8 FILL64 FILL4 FILL32 FILL2 FILL16 -prefix FILLER
extractRC
# If there is no error, save Design
#saveDesign -rc -def ChipFinish_after_ECO
saveDesign -rc -def ChipFinish

#####################
#### Write Out ######
#####################
# Write Out Files
# GDS file : without layermap file for GPDK045
streamOut cmsdk_mcu.gds -libName DesignLib -units 2000 -mode ALL

# Write Out Constraint
writeTimingCon cmsdk_mcu.sdc

# Netlist  file : -flat options is useful to next tool stages
saveNetlist -flat -excludeCellInst "PADVDD PADVSS PADVSSIOR PADVDDIOR" cmsdk_mcu.v

# SDF OUT, but I recommend to use sdf file which is from Tempus tool
# SDF version 3.0 :: RECREM included in the SDF file
write_sdf cmsdk_mcu.sdf

# SDF version 2.1
write_sdf -version 2.1 cmsdk_mcu.sdf_2.1


