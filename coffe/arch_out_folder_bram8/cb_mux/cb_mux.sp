.TITLE Connection block multiplexer

********************************************************************************
** Include libraries, parameters and other
********************************************************************************

.LIB "../includes.l" INCLUDES

********************************************************************************
** Setup and input
********************************************************************************

.control 
 TRAN 1p 4n  
OPTIONS BRIEF=1

quit 
 .endc 
 * Input signal 
 Vground ground 0 0 

VIN n_in ground PULSE (0 0.8 0 0 0 2n 4n)

* Power rail for the circuit under test.
* This allows us to measure power of a circuit under test without measuring the power of wave shaping and load circuitry.
V_CB_MUX vdd_cb_mux ground 0.8

********************************************************************************
** Measurement
********************************************************************************

* inv_cb_mux_1 delay
.MEASURE TRAN meas_inv_cb_mux_1_tfall TRIG V(Xrouting_wire_load_1.Xrouting_wire_load_tile_1.n_1_cb_on_1) VAL='0.8/2' RISE=1
+    TARG V(Xrouting_wire_load_1.Xrouting_wire_load_tile_1.Xcb_load_on_1.Xcb_mux_driver.n_1_1) VAL='0.8/2' FALL=1
.MEASURE TRAN meas_inv_cb_mux_1_trise TRIG V(Xrouting_wire_load_1.Xrouting_wire_load_tile_1.n_1_cb_on_1) VAL='0.8/2' FALL=1
+    TARG V(Xrouting_wire_load_1.Xrouting_wire_load_tile_1.Xcb_load_on_1.Xcb_mux_driver.n_1_1) VAL='0.8/2' RISE=1

* inv_cb_mux_2 delays
.MEASURE TRAN meas_inv_cb_mux_2_tfall TRIG V(Xrouting_wire_load_1.Xrouting_wire_load_tile_1.n_1_cb_on_1) VAL='0.8/2' FALL=1
+    TARG V(Xlocal_routing_wire_load_1.n_28) VAL='0.8/2' FALL=1
.MEASURE TRAN meas_inv_cb_mux_2_trise TRIG V(Xrouting_wire_load_1.Xrouting_wire_load_tile_1.n_1_cb_on_1) VAL='0.8/2' RISE=1
+    TARG V(Xlocal_routing_wire_load_1.n_28) VAL='0.8/2' RISE=1

* Total delays
.MEASURE TRAN meas_total_tfall TRIG V(Xrouting_wire_load_1.Xrouting_wire_load_tile_1.n_1_cb_on_1) VAL='0.8/2' FALL=1
+    TARG V(Xlocal_routing_wire_load_1.n_28) VAL='0.8/2' FALL=1
.MEASURE TRAN meas_total_trise TRIG V(Xrouting_wire_load_1.Xrouting_wire_load_tile_1.n_1_cb_on_1) VAL='0.8/2' RISE=1
+    TARG V(Xlocal_routing_wire_load_1.n_28) VAL='0.8/2' RISE=1

.MEASURE TRAN meas_logic_low_voltage FIND V(Xlocal_routing_wire_load_1.n_28) AT=3n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current  INTEG I(V_CB_MUX) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-(meas_current/4n)*0.8'

********************************************************************************
** Circuit
********************************************************************************

Xsb_mux_on_1 n_in n_1_1 vsram vsram_n vdd ground sb_mux_on
Xrouting_wire_load_1 n_1_1 n_1_2 n_1_3 vsram vsram_n vdd ground vdd vdd_cb_mux routing_wire_load
Xlocal_routing_wire_load_1 n_1_3 n_1_4 vsram vsram_n vdd ground vdd local_routing_wire_load
Xlut_a_driver_1 n_1_4 n_hang1 vsram vsram_n n_hang2 n_hang3 vdd ground lut_a_driver

.END