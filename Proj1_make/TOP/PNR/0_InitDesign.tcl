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

exit
