xrun -64bit \
	+max_err_count+50 \
	+define_function_sim \
	-access +rwc \
	-gui \
	+libext+.v \
	../TESTBENCH/tb_spi_bridge_top.v \
	../../RTL/*.v \
	/GPDK045/digital/giolib045_v3.5/vlog/pads_FF_s1vg.v \
	/GPDK045/digital/gsclib045_all_v4.4/gsclib045/verilog/slow_vdd1v0_basicCells.v \
	-l func_sim.log



