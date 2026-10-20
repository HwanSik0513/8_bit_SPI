######################################################################
# spi_bridge_top.sdc -- 1 GHz (1.0 ns) synthesis constraints, Cadence Genus
#   Basis : professor's cmsdk_mcu.sdc (clock / delay / PVT structure) plus the
#           RTL-aware items from the original SDC (generated-clock pin check,
#           bus-port-only delays, no asynchronous clock-group declaration)
#   RTL   : spi_bridge_top, sclk_gen, async_fifo, pulse_sync, reset_sync,
#           spi_master, spi_slave, register_block
#           (ASIC build: XILINX_BUFG is not defined)
#   Time unit: ns.  Items marked [TO VERIFY] were not run in Genus.
######################################################################

set STD_LIB_slow slow_vdd1v0_basicCells.lib:slow_vdd1v0
set STD_LIB_fast fast_vdd1v0_basicCells.lib:fast_vdd1v0

set_units -capacitance 1000.0fF
set_units -time 1000.0ps

#############################
reset_design
#############################

#----------------------------------------------------------------
# 1. Clocks
#----------------------------------------------------------------
# 1 GHz = 1.0 ns. If the professor's "use 80% of the target speed" convention
# applies here, change this to 0.8 (confirm with the professor).
# If a sweep script defines CLK_PERIOD beforehand, that value is used.
if {![info exists CLK_PERIOD]} { set CLK_PERIOD 1.0 }

create_clock -name ACLK -period $CLK_PERIOD [get_ports ACLK]

# External clock source + network latency of 0.2 ns (professor's value)
set_clock_latency -source -max 0.2 [get_clocks ACLK]
set_clock_latency -max 0.2 [get_clocks ACLK]

# 60 ps skew + 20 ps jitter + 20 ps setup margin, etc.: 0.1 ns in total
# (professor's value). Note: at 1 GHz this is 10% of the period. [TO VERIFY]
set_clock_uncertainty -setup 0.1 [get_clocks ACLK]
set_clock_transition 0.1 [get_clocks ACLK]

# SCLK = ACLK / 4 (register output o_sclk in sclk_gen). The two clocks are
# synchronous and related, so they are NOT declared with
# set_clock_groups -asynchronous.
# After synthesis the register is expected to be named o_sclk_reg. [TO VERIFY]
set SCLK_PIN [get_pins -quiet u_sclk_gen/o_sclk_reg/Q]
if {[llength $SCLK_PIN] != 1} { set SCLK_PIN [get_pins -quiet u_sclk_gen/o_sclk] }
if {[llength $SCLK_PIN] != 1} {
    error "SCLK source pin not found (u_sclk_gen/o_sclk_reg/Q or u_sclk_gen/o_sclk); inspect hierarchy"
}
create_generated_clock -name SCLK -source [get_ports ACLK] -divide_by 4 $SCLK_PIN

set_clock_uncertainty -setup 0.1 [get_clocks SCLK]
set_clock_transition 0.1 [get_clocks SCLK]

#----------------------------------------------------------------
# 2. Input / output delays (ACLK-domain register bus only)
#----------------------------------------------------------------
# Professor's values: max 0.1 / min 0.01. The 1.0 ns used in the original SDC
# equals the whole period at 1 GHz and is not achievable.
# Replace with the real values once the external bus master timing is defined.
# [TO VERIFY]
set BUS_IN   [get_ports {i_bus_addr* i_bus_wr_en i_bus_wdata* i_bus_rd_en}]
set ACLK_OUT [get_ports {o_bus_rdata* o_overflow o_rx_valid}]

set_input_delay  -max 0.1  -clock [get_clocks ACLK] $BUS_IN
set_input_delay  -min 0.01 -clock [get_clocks ACLK] $BUS_IN
set_output_delay -max 0.1  -clock [get_clocks ACLK] $ACLK_OUT
set_output_delay -min -0.01 -clock [get_clocks ACLK] $ACLK_OUT

# Note: i_bus_addr -> o_bus_rdata is a purely combinational path (read mux,
# no register). After subtracting input delay 0.1, output delay 0.1 and
# uncertainty 0.1, only about 0.7 ns is left for the mux, so this is the most
# likely path to fail first at 1 GHz. If it fails, discuss registering the
# read data in the RTL with the professor.

# Debug pins: observation only. No external receiver timing is specified, so
# they are excluded from timing at the synthesis stage. Replace with an SCLK
# based output delay once a real board / testbench budget exists.
set_false_path -to [get_ports {o_dbg_sclk o_dbg_cs_n o_dbg_mosi o_dbg_miso}]

#----------------------------------------------------------------
# 3. Driving cell / load (placeholders, no-pad configuration)
#----------------------------------------------------------------
# Taken from the "Select this point!" line (no-pad case) of the professor's
# file. [TO VERIFY: cell name and values]
set_driving_cell -lib_cell DFFHQX1 -pin Q [remove_from_collection [all_inputs] [get_ports ACLK]]
set_load 0.02 [all_outputs]

#----------------------------------------------------------------
# 4. Operating conditions (same as the professor:
#    setup = slow 0.9V/125C, hold = fast 1.1V/0C)
#----------------------------------------------------------------
set_operating_conditions \
    -max_library [get_libs $STD_LIB_slow] -max PVT_0P9V_125C \
    -min_library [get_libs $STD_LIB_fast] -min PVT_1P1V_0C

#----------------------------------------------------------------
# 5. Attributes
#----------------------------------------------------------------
# Keep the 2-FF synchronizer flops untouched so the tool cannot merge or
# restructure them:
#   r_*_meta*, r_dst_meta / r_dst_sync, r_*_gray_*_meta_*,
#   r_*_gray_wclk / rclk, r_spi_busy_*, r_rx_full_*
set SYNC_CELLS [get_cells -quiet -hierarchical {*meta*_reg* *sync*_reg* *gray_wclk_reg* *gray_rclk_reg*}]
if {[llength $SYNC_CELLS] > 0} { set_dont_touch $SYNC_CELLS }

set_ideal_network [get_ports {ACLK ARESETn}]

#----------------------------------------------------------------
# 6. Reset
#----------------------------------------------------------------
# ARESETn only feeds the asynchronous inputs of the two reset_sync instances
# (deassertion is synchronized per clock domain). Recovery / removal on this
# path is intentionally not checked.
set_false_path -from [get_ports ARESETn]

#----------------------------------------------------------------
# 7. CDC (ACLK <-> SCLK). Not closed with false paths: only the arrival
#    time is bounded.
#----------------------------------------------------------------
# -datapath_only : ignore clock phase / skew between the two clocks and limit
# only the data path delay.
# (a) All first-stage D pins of the synchronizers: the four Gray pointer
#     crossings (also bounds the bit-to-bit skew), the three pulse_sync
#     instances, and the spi_busy / rx_full level synchronizers.
set CDC_MAX_DELAY $CLK_PERIOD
set META_D [get_pins -quiet -hierarchical {*meta*_reg*/D}]
#if {[llength $META_D] > 0} { set_max_delay $CDC_MAX_DELAY -datapath_only -to $META_D }

# (b) FIFO memory -> read-data register (read happens after the write pointer
#     has been synchronized, so two periods are allowed)
set MEM_Q  [get_cells -quiet -hierarchical {*mem_reg*}]
set RDD    [get_cells -quiet -hierarchical {*o_rd_data_reg*}]
#if {[llength $MEM_Q] > 0 && [llength $RDD] > 0} {
#    set_max_delay [expr {2 * $CLK_PERIOD}] -datapath_only -from $MEM_Q -to $RDD
#}
# [TO VERIFY] Check with reports that the patterns above match the real names
# after synthesis.
# SDC constraints do not replace full CDC verification (structural and
# reset-domain checks): a separate CDC tool is required (not performed).
