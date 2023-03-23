.TITLE Dedicated Routing Driver

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
V_TEST vdd_test ground 0.8

********************************************************************************
** Measurement
********************************************************************************

* inv_dsp_slice_ddriver_1 delay
.MEASURE TRAN meas_inv_dsp_slice_ddriver_1_tfall TRIG V(n_1_1) VAL='0.8/2' RISE=1
+    TARG V(Xdriver.n_1_2) VAL='0.8/2' FALL=1
.MEASURE TRAN meas_inv_dsp_slice_ddriver_1_trise TRIG V(n_1_1) VAL='0.8/2' FALL=1
+    TARG V(Xdriver.n_1_2) VAL='0.8/2' RISE=1

* inv_dsp_slice_ddriver_2 delays
.MEASURE TRAN meas_inv_dsp_slice_ddriver_2_tfall TRIG V(n_1_1) VAL='0.8/2' FALL=1
+    TARG V(Xdriver.n_1_4) VAL='0.8/2' FALL=1
.MEASURE TRAN meas_inv_dsp_slice_ddriver_2_trise TRIG V(n_1_1) VAL='0.8/2' RISE=1
+    TARG V(Xdriver.n_1_4) VAL='0.8/2' RISE=1

* inv_dsp_slice_ddriver_3 delay
.MEASURE TRAN meas_inv_dsp_slice_ddriver_3_tfall TRIG V(n_1_1) VAL='0.8/2' RISE=1
+    TARG V(Xdriver.n_1_6) VAL='0.8/2' FALL=1
.MEASURE TRAN meas_inv_dsp_slice_ddriver_3_trise TRIG V(n_1_1) VAL='0.8/2' FALL=1
+    TARG V(Xdriver.n_1_6) VAL='0.8/2' RISE=1

* inv_dsp_slice_ddriver_4 delays
.MEASURE TRAN meas_inv_dsp_slice_ddriver_4_tfall TRIG V(n_1_1) VAL='0.8/2' FALL=1
+    TARG V(Xdriver.n_1_2) VAL='0.8/2' FALL=1
.MEASURE TRAN meas_inv_dsp_slice_ddriver_4_trise TRIG V(n_1_1) VAL='0.8/2' RISE=1
+    TARG V(Xdriver.n_1_2) VAL='0.8/2' RISE=1

* Total delays
.MEASURE TRAN meas_total_tfall TRIG V(n_1_1) VAL='0.8/2' FALL=1
+    TARG V(n_1_3) VAL='0.8/2' FALL=1
.MEASURE TRAN meas_total_trise TRIG V(n_1_1) VAL='0.8/2' RISE=1
+    TARG V(n_1_3) VAL='0.8/2' RISE=1

.MEASURE TRAN meas_logic_low_voltage FIND V(ground) AT=3n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current  INTEG I(V_TEST) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-((meas_current)/4n)*0.8'

********************************************************************************
** Circuit
********************************************************************************

Xinv_ff_output_driver_0 n_in n_1_0 vdd ground inv Wn=inv_ff_output_driver_nmos Wp=inv_ff_output_driver_pmos
Xinv_ff_output_driver n_1_0 n_1_1 vdd ground inv Wn=inv_ff_output_driver_nmos Wp=inv_ff_output_driver_pmos
Xdriver n_1_1 n_1_2 vdd_test ground dsp_slice_ddriver
Xwirer_edi n_1_2 n_1_3 wire Rw=wire_dsp_slice_2_res Cw=wire_dsp_slice_2_cap 
Xff n_1_3 n_hang2 vdd ground vdd nnd ground vdd ground vdd vdd ground ff
.END