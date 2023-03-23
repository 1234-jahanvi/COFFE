.TITLE lut_e_driver_not 

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
V_LUT_DRIVER vdd_lut_driver ground 0.8

********************************************************************************
** Measurement
********************************************************************************

* inv_lut_e_driver_not_1 delays
.MEASURE TRAN meas_inv_lut_e_driver_not_1_tfall TRIG V(n_1_2) VAL='0.8/2' RISE=1
+    TARG V(Xlut_e_driver_not_1.n_1_1) VAL='0.8/2' FALL=1
.MEASURE TRAN meas_inv_lut_e_driver_not_1_trise TRIG V(n_1_2) VAL='0.8/2' FALL=1
+    TARG V(Xlut_e_driver_not_1.n_1_1) VAL='0.8/2' RISE=1

* inv_lut_e_driver_not_2 delays
.MEASURE TRAN meas_inv_lut_e_driver_not_2_tfall TRIG V(n_1_2) VAL='0.8/2' FALL=1
+    TARG V(n_out_n) VAL='0.8/2' FALL=1
.MEASURE TRAN meas_inv_lut_e_driver_not_2_trise TRIG V(n_1_2) VAL='0.8/2' RISE=1
+    TARG V(n_out_n) VAL='0.8/2' RISE=1

* Total delays
.MEASURE TRAN meas_total_tfall TRIG V(n_1_2) VAL='0.8/2' FALL=1
+    TARG V(n_out_n) VAL='0.8/2' FALL=1
.MEASURE TRAN meas_total_trise TRIG V(n_1_2) VAL='0.8/2' RISE=1
+    TARG V(n_out_n) VAL='0.8/2' RISE=1

.MEASURE TRAN meas_logic_low_voltage FIND V(n_out) AT=3n

* Measure the power required to propagate a rise and a fall transition through the lut driver at 250MHz.
.MEASURE TRAN meas_current  INTEG I(V_LUT_DRIVER) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-((meas_current)/4n)*0.8'

********************************************************************************
** Circuit
********************************************************************************

Xcb_mux_on_1 n_in n_1_1 vsram vsram_n vdd ground cb_mux_on
Xlocal_routing_wire_load_1 n_1_1 n_1_2 vsram vsram_n vdd ground vdd local_routing_wire_load
Xlut_e_driver_1 n_1_2 n_out vsram vsram_n n_rsel n_2_1 vdd ground lut_e_driver
Xlut_e_driver_not_1 n_2_1 n_out_n vdd_lut_driver ground lut_e_driver_not
Xlut_e_driver_load_1 n_out n_vdd n_ground lut_e_driver_load
Xlut_e_driver_load_2 n_out_n n_vdd n_ground lut_e_driver_load

.END