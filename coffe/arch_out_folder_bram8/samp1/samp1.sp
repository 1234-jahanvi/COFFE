.TITLE Sense amp

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

VIN n_in ground PULSE ( 0 0.8_lp 0 0 0 4n 8n)
VIww wordline ground PULSE (0 0.8_lp 0 0 0 4n 8n)
* Power rail for the circuit under test.
* This allows us to measure power of a circuit under test without measuring the power of wave shaping and load circuitry.
V_se vdd_se ground 0.8_lp
V_left tgate_r ground 0.8_lp
V_right tgate_l ground sense_v

********************************************************************************
** Measurement
********************************************************************************

* Total delays
.MEASURE TRAN meas_total_tfall TRIG V(n_in) VAL='0.8_lp/2' RISE=1
+    TARG V(n_out) VAL='sense_v' RISE=1
.MEASURE TRAN meas_total_trise TRIG V(n_in) VAL='0.8_lp/2' RISE=1
+    TARG V(n_out) VAL='sense_v' RISE=1

.MEASURE TRAN meas_logic_low_voltage FIND V(ground) AT=1n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current  INTEG I(V_se) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-(meas_current/4n)*0.8_lp'

********************************************************************************
** Circuit
********************************************************************************

.IC V(xsamp1.n_1_2) = 'sense_v'
.IC V(xsamp1.n_1_1) = '0.8_lp'
xsamp1 n_in tgate_l tgate_r n_out vdd_se ground samp1
.END