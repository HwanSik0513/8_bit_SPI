#######################
#### Chip Finish ######
#######################
restoreDesign RouteDesign.dat

# Add Filler
getFillerMode -quiet
addFiller -cell FILL1 FILL8 FILL64 FILL4 FILL32 FILL2 FILL16 -prefix FILLER
extractRC
# If there is no error, save Design
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

