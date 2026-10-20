###############
#### ECO ######
###############
restoreDesign RouteDesign.dat
source innovus.eco

# After inserting repeat cells, 
# Ctrl+F and Turn on Auto Zoom 
# and Press the find button with using the word "*FE_ECO* 

# RC Extraction
extractRC

# Timing Check right-after ECO routing
timeDesign -postRoute
timeDesign -postRoute -hold

# If many violatios are occured, Optimize Design
setAnalysisMode -analysisType single -checkType setup ; # After change to single mode
optDesign -postRoute -setup; # 0 : Optimization and resolve the Setup Violation 

setAnalysisMode -analysisType single -checkType hold
optDesign -postRoute -hold; # 1 : Optimization and resolve the Hold Violation 

# Timing Check after Optimization
timeDesign -postRoute 	; # Setup time report
timeDesign -postRoute -hold; # Hold time report

# DRC again
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

# Below line is useful and temporaily when you want auto DRC fix
#setAnalysisMode -analysisType onChipVariation
#optDesign -postRoute -drv ; # auto DRC Fix

# LVS : Connectivity 
verifyConnectivity -type all -geomConnect -error 1000 -warning 50

# Violation Browser
setLayerPreference violation -isVisible 1
violationBrowser -all -no_display_false -displayByLayer

######################################################################
# Save Design for tempus : It is useful to read design easily in Tempus
######################################################################
extractRC
saveDesign -rc -def RouteDesign_ECO_mmmc1

#######################
#### Chip Finish ######
#######################
#restoreDesign RouteDesign_ECO_mmmc1.dat

# Add Filler
getFillerMode -quiet
addFiller -cell FILL1 FILL8 FILL64 FILL4 FILL32 FILL2 FILL16 -prefix FILLER
extractRC
# If there is no error, save Design
saveDesign -rc -def ChipFinish_after_ECO

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

exit
