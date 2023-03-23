.TITLE Carry Chain

********************************************************************************
** Include libraries, parameters and other
********************************************************************************

.LIB "../includes.l" INCLUDES

********************************************************************************
** Setup and input
********************************************************************************

.control 
 TRAN 1p 26n  
OPTIONS BRIEF=1

quit 
 .endc 
 * Input signal 
 Vground ground 0 0 
 
VIN n_in ground PULSE (0 0.8 0 0 0 2n 4n)

* Power rail for the circuit under test.
* This allows us to measure power of a circuit under test without measuring the power of wave shaping and load circuitry.
V_test vdd_test ground 0.8

********************************************************************************
** Measurement
********************************************************************************

* inv_carry_chain_1 delay
.MEASURE TRAN meas_inv_carry_chain_1_tfall TRIG V(n_1_1) VAL='0.8/2' RISE=1
+    TARG V(Xcarrychain.n_cin_in_bar) VAL='0.8/2' FALL=1
.MEASURE TRAN meas_inv_carry_chain_1_trise TRIG V(n_1_1) VAL='0.8/2' FALL=1
+    TARG V(Xcarrychain.n_cin_in_bar) VAL='0.8/2' RISE=1

* inv_carry_chain_2 delays
.MEASURE TRAN meas_inv_carry_chain_2_tfall TRIG V(n_1_1) VAL='0.8/2' RISE=1
+    TARG V(n_sum_out) VAL='0.8/2' FALL=1
.MEASURE TRAN meas_inv_carry_chain_2_trise TRIG V(n_1_1) VAL='0.8/2' FALL=1
+    TARG V(n_sum_out) VAL='0.8/2' RISE=1

* Total delays
.MEASURE TRAN meas_total_tfall TRIG V(n_1_1) VAL='0.8/2' RISE=1
+    TARG V(n_1_2) VAL='0.8/2' FALL=1
.MEASURE TRAN meas_total_trise TRIG V(n_1_1) VAL='0.8/2' FALL=1
+    TARG V(n_1_2) VAL='0.8/2' RISE=1

.MEASURE TRAN meas_logic_low_voltage FIND V(ground) AT=3n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current  INTEG I(V_test) FROM=0ns TO=26ns
.MEASURE TRAN meas_avg_power PARAM = '-((meas_current)/26n)*0.8'

********************************************************************************
** Circuit
********************************************************************************

Xcarrychain_shape vdd ground n_in n_0_1 n_hang n_p_1 vdd ground FA_carry_chain
Xcarrychain_shape1 vdd ground n_0_1 n_0_2 n_hangz n_p_0 vdd ground FA_carry_chain
Xcarrychain_shape2 vdd ground n_0_2 n_1_1 n_hangzz n_p_z vdd ground FA_carry_chain
Xcarrychain vdd ground n_1_1 n_1_2 n_sum_out n_p_2 vdd_test ground FA_carry_chain
Xcarrychain_load vdd ground n_1_2 n_1_3 n_sum_out2 n_p_3 vdd ground FA_carry_chain
.END