.TITLE General BLE output

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
V_FLUT vdd_f ground 0.8

********************************************************************************
** Measurement
********************************************************************************

* inv_flut_mux_1 delay
.MEASURE TRAN meas_inv_flut_mux_1_tfall TRIG V(n_1_2) VAL='0.8/2' RISE=1
+    TARG V(Xthemux.n_2_1) VAL='0.8/2' FALL=1
.MEASURE TRAN meas_inv_flut_mux_1_trise TRIG V(n_1_2) VAL='0.8/2' FALL=1
+    TARG V(Xthemux.n_2_1) VAL='0.8/2' RISE=1

* inv_flut_mux_2 delays
.MEASURE TRAN meas_inv_flut_mux_2_tfall TRIG V(n_1_2) VAL='0.8/2' FALL=1
+    TARG V(n_local_out) VAL='0.8/2' FALL=1
.MEASURE TRAN meas_inv_flut_mux_2_trise TRIG V(n_1_2) VAL='0.8/2' RISE=1
+    TARG V(n_local_out) VAL='0.8/2' RISE=1

* Total delays
.MEASURE TRAN meas_total_tfall TRIG V(n_1_1) VAL='0.8/2' FALL=1
+    TARG V(n_local_out) VAL='0.8/2' FALL=1
.MEASURE TRAN meas_total_trise TRIG V(n_1_1) VAL='0.8/2' RISE=1
+    TARG V(n_local_out) VAL='0.8/2' RISE=1

.MEASURE TRAN meas_logic_low_voltage FIND V(n_general_out) AT=3n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current  INTEG I(V_FLUT) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-((meas_current)/4n)*0.8'

********************************************************************************
** Circuit
********************************************************************************

Xlut n_in n_1_1 vdd vdd vdd vdd vdd vdd vdd ground lut
Xwireflut n_1_1 n_1_2 wire Rw=wire_lut_to_flut_mux_res Cw=wire_lut_to_flut_mux_cap
Xthemux n_1_2 n_1_3 vdd ground vdd_f ground flut_mux
Xwireovercc n_1_3 n_1_4 wire Rw=wire_carry_chain_5_res Cw=wire_carry_chain_5_cap
Xccmux n_1_4 n_local_out vdd ground vdd ground carry_chain_mux
Xgeneral_ble_output_load n_general_out n_hang1 vsram vsram_n vdd ground general_ble_output_load
.END