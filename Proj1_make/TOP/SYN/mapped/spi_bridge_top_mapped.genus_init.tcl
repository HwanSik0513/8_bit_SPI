################################################################################
#
# Init setup file
# Created by Genus(TM) Synthesis Solution on 10/20/2026 19:10:09
#
################################################################################
if { ![is_common_ui_mode] } { error "ERROR: This script requires common_ui to be active."}

read_physical -lef {/home/hah003/PROJ1/Proj1_make/TOP/SYN/../../../GPDK045/digital/gsclib045_all_v4.4/gsclib045/lef/gsclib045_tech.lef /home/hah003/PROJ1/Proj1_make/TOP/SYN/../../../GPDK045/digital/gsclib045_all_v4.4/gsclib045/lef/gsclib045_macro.lef /home/hah003/PROJ1/Proj1_make/TOP/SYN/../../../GPDK045/digital/giolib045_v3.5/lef/giolib045.lef}

read_netlist ./mapped/spi_bridge_top_mapped.v

init_design
