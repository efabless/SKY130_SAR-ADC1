

set ::env(DESIGN_NAME) adc_clkgen_with_edgedetect

# technically unused because combinatoric. Values are workarounds.
# otherwise the flow will fail with STA errors, or because the
# STA report will not be found although STA is skipped intentionally
 set ::env(CLOCK_PORT) ""
 set ::env(CLOCK_NET) ""
 set ::env(CLOCK_TREE_SYNTH) 0
 set ::env(CLOCK_PERIOD) 1000000

# Files
 set ::env(VERILOG_FILES) [glob $::env(DESIGN_DIR)/src/*.v]
 set ::env(EXTRA_LEFS) [glob $::env(DESIGN_DIR)/src/*.lef]
 set ::env(EXTRA_LIBS) [glob $::env(DESIGN_DIR)/src/*.lib]
 set ::env(EXTRA_GDS_FILES) [glob $::env(DESIGN_DIR)/src/*.gds]
 set ::env(SYNTH_READ_BLACKBOX_LIB) 1

# Floorplanning
 set ::env(FP_SIZING) "absolute"
# set ::env(DIE_AREA) "0 0 184 84"
 set ::env(DIE_AREA) "0 0 184 78"
 set ::env(BOTTOM_MARGIN_MULT) 1
 set ::env(TOP_MARGIN_MULT) 1
 set ::env(LEFT_MARGIN_MULT) 9
 set ::env(RIGHT_MARGIN_MULT) 9

 # -synth explore report: AREA 2 leads to best area but highest delay
 set ::env(SYNTH_STRATEGY) "AREA 2"
 set ::env(SYNTH_MAX_FANOUT) 10


 set ::env(FP_PDN_HOFFSET) 24
 set ::env(FP_PDN_VOFFSET) 48
 set ::env(FP_PDN_HPITCH) 24
 set ::env(FP_PDN_VPITCH) 96
 set ::env(FP_PIN_ORDER_CFG) $::env(DESIGN_DIR)/pin_order.cfg

# PDN on Macro Level or Core Level
 set ::env(DESIGN_IS_CORE) 0
 set ::env(FP_PDN_CORE_RING) 0
 set ::env(RT_MAX_LAYER) {met4}
 set ::env(VDD_NETS) [list {VPWR} {VPB}]
 set ::env(GND_NETS) [list {VGND} {VNB}]

# Placement
 set ::env(PL_BASIC_PLACEMENT) 0
 set ::env(PL_TARGET_DENSITY) {0.75}
 set ::env(PL_RESIZER_TIMING_OPTIMIZATIONS) {0}
 set ::env(PL_RESIZER_DESIGN_OPTIMIZATIONS) {0}
# set ::env(PL_ROUTABILITY_DRIVEN) {1}
# set ::env(PL_TIME_DRIVEN) {1}
 set ::env(DIODE_INSERTION_STRATEGY) 3

# needed for Customcell DlyPoly6ns
 set ::env(FP_TAPCELL_DIST) 14.26


# Router
 set ::env(GLB_RESIZER_TIMING_OPTIMIZATIONS) {0}


# LVS
 set ::env(MAGIC_EXT_USE_GDS) {1}


set filename $::env(DESIGN_DIR)/$::env(PDK)_$::env(STD_CELL_LIBRARY)_config.tcl
if { [file exists $filename] == 1} {
	source $filename
}



# OpenROAD reports unconnected nodes as a warning.
# OpenLane typically treats unconnected node warnings 
# as a critical issue, and simply quits.
#
# We'll be leaving it up to the designer's discretion to
# enable/disable this: if LVS passes you're probably fine
# with this option being turned off.
# set ::env(FP_PDN_CHECK_NODES) 0


