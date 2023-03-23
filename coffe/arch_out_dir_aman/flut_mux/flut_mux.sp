.TITLE General BLE output

********************************************************************************
** Include libraries, parameters and other
********************************************************************************

.LIB "../includes.l" INCLUDES

********************************************************************************
** Setup and input
********************************************************************************

.TRAN 1p 4n SWEEP DATA=sweep_data
.OPTIONS BRIEF=1

* Input signal
VIN n_in gnd PULSE (0 supply_v 0 0 0 2n 4n)

* Power rail for the circuit under test.
* This allows us to measure power of a circuit under test without measuring the power of wave shaping and load circuitry.
V_FLUT vdd_f gnd supply_v

********************************************************************************
** Measurement
********************************************************************************

* inv_flut_mux_1 delay
.MEASURE TRAN meas_inv_flut_mux_1_tfall TRIG V(n_1_2) VAL='supply_v/2' RISE=1
+    TARG V(Xthemux.n_2_1) VAL='supply_v/2' FALL=1
.MEASURE TRAN meas_inv_flut_mux_1_trise TRIG V(n_1_2) VAL='supply_v/2' FALL=1
+    TARG V(Xthemux.n_2_1) VAL='supply_v/2' RISE=1

* inv_flut_mux_2 delays
.MEASURE TRAN meas_inv_flut_mux_2_tfall TRIG V(n_1_2) VAL='supply_v/2' FALL=1
+    TARG V(n_local_out) VAL='supply_v/2' FALL=1
.MEASURE TRAN meas_inv_flut_mux_2_trise TRIG V(n_1_2) VAL='supply_v/2' RISE=1
+    TARG V(n_local_out) VAL='supply_v/2' RISE=1

* Total delays
.MEASURE TRAN meas_total_tfall TRIG V(n_1_1) VAL='supply_v/2' FALL=1
+    TARG V(n_local_out) VAL='supply_v/2' FALL=1
.MEASURE TRAN meas_total_trise TRIG V(n_1_1) VAL='supply_v/2' RISE=1
+    TARG V(n_local_out) VAL='supply_v/2' RISE=1

.MEASURE TRAN meas_logic_low_voltage FIND V(n_general_out) AT=3n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current INTEGRAL I(V_FLUT) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-((meas_current)/4n)*supply_v'

********************************************************************************
** Circuit
********************************************************************************

Xlut n_in n_1_1 vdd vdd vdd vdd vdd vdd vdd gnd lut
Xwireflut n_1_1 n_1_2 wire Rw=wire_lut_to_flut_mux_res Cw=wire_lut_to_flut_mux_cap
Xthemux n_1_2 n_1_3 vdd gnd vdd_f gnd flut_mux
Xlut_output_load n_1_3 n_local_out n_general_out vsram vsram_n vdd gnd vdd vdd lut_output_load

Xgeneral_ble_output_load n_general_out n_hang1 vsram vsram_n vdd gnd general_ble_output_load
.END