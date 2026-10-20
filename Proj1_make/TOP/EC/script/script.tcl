# ===========================================
# SPI_Bridge - Logic Equivalence Checking
# TOOL	   : Cadence Conformal LEC
# Golden   : RTL Design
# Revised  : Genus Synthesiszd Gate-Level Netlist
# TOP	   : spi_bridge_top
# ===========================================


set log file ./log/spi_bridge_lec.log -replace

read library -verilog -both \
	../../../GPDK045/digital/gsclib045_all_v4.4/gsclib045/verilog/slow_vdd1v0_basicCells.v \
	../../../GPDK045/digital/gsclib045_all_v4.4/gsclib045/verilog/fast_vdd1v0_basicCells.v \
	../../../GPDK045/digital/giolib045_v3.5/vlog/pads_SS_s1vg.v

read design \
	../RTL/Async_fifo.v \
	../RTL/Pulse_sync.v \
	../RTL/Register_block.v \
	../RTL/Reset_sync.v \
	../RTL/Sclk_gen.v \
	../RTL/Spi_master.v \
	../RTL/Spi_slave.v \
	../RTL/Spi_bridge_top.v \
	-verilog -golden

read design \
	../SYN/mapped/spi_bridge_top_syn_final.v \
	-verilog -revised

set system mode lec

add compare points -all

compare

report verification
report statistics
