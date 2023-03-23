.TITLE A nand2 path

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
V_nand2 vdd_nand2 ground 0.8

********************************************************************************
** Measurement
********************************************************************************

* inv_pgateoutputcrossbar delay
.MEASURE TRAN meas_inv_pgateoutputcrossbar_1_tfall TRIG V(n_1_1) VAL='0.8/2' RISE=1
+    TARG V(xoutputcrossbar.n_1_1) VAL='0.8/2' FALL=1
.MEASURE TRAN meas_inv_pgateoutputcrossbar_1_trise TRIG V(n_1_1) VAL='0.8/2' FALL=1
+    TARG V(xoutputcrossbar.n_1_1) VAL='0.8/2' RISE=1

* inv_pgateoutputcrossbar delay
.MEASURE TRAN meas_inv_pgateoutputcrossbar_2_tfall TRIG V(n_1_1) VAL='0.8/2' FALL=1
+    TARG V(xoutputcrossbar.n_1_2) VAL='0.8/2' FALL=1
.MEASURE TRAN meas_inv_pgateoutputcrossbar_2_trise TRIG V(n_1_1) VAL='0.8/2' RISE=1
+    TARG V(xoutputcrossbar.n_1_2) VAL='0.8/2' RISE=1

* inv_pgateoutputcrossbar delay
.MEASURE TRAN meas_inv_pgateoutputcrossbar_3_tfall TRIG V(n_1_1) VAL='0.8/2' RISE=1
+    TARG V(xoutputcrossbar.n_1_3) VAL='0.8/2' FALL=1
.MEASURE TRAN meas_inv_pgateoutputcrossbar_3_trise TRIG V(n_1_1) VAL='0.8/2' FALL=1
+    TARG V(xoutputcrossbar.n_1_3) VAL='0.8/2' RISE=1

* Total delays
.MEASURE TRAN meas_total_tfall TRIG V(n_1_1) VAL='0.8/2' FALL=1
+    TARG V(n_1_2) VAL='0.8/2' RISE=1
.MEASURE TRAN meas_total_trise TRIG V(n_1_1) VAL='0.8/2' RISE=1
+    TARG V(n_1_2) VAL='0.8/2' FALL=1

.MEASURE TRAN meas_logic_low_voltage FIND V(n_in) AT=3n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current  INTEG I(V_nand2) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-(meas_current/8n)*0.8'

********************************************************************************
** Circuit
********************************************************************************

X_inv_samp n_in n_1_1 vdd ground inv Wn=min_tran_width Wp=min_tran_width
xoutputcrossbar n_1_1 n_1_2 vdd_nand2 vsram ground pgateoutputcrossbar
Xff n_1_2 n_hang2 vdd ground vdd nnd ground vdd ground vdd vdd ground ff
.END