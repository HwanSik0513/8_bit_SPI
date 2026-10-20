##############
# Route
##############

restoreDesign PostCTSopt.dat

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

exit
