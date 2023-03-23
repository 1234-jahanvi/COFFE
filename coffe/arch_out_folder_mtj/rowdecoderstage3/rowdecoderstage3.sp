.TITLE thirdstage

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

VIN n_in ground PULSE (0 0.8_lp 0 0 0 2n 4n)
* Power rail for the circuit under test.
* This allows us to measure power of a circuit under test without measuring the power of wave shaping and load circuitry.
V_third1 vdd_third1 ground 0.8_lp

V_third2 vdd_third2 ground 0.8_lp

********************************************************************************
** Measurement
********************************************************************************

* inv_nandrowdecoderstage3 delay
.MEASURE TRAN meaz2_inv_nand3_rowdecoderstage3_1_tfall TRIG V(n_2_24) VAL='0.8_lp/2' RISE=1
+    TARG V(X2loadnand24.n_1_1) VAL='0.8_lp/2' FALL=1
.MEASURE TRAN meaz2_inv_nand3_rowdecoderstage3_1_trise TRIG V(n_2_24) VAL='0.8_lp/2' FALL=1
+    TARG V(X2loadnand24.n_1_1) VAL='0.8_lp/2' RISE=1

* invrowdecoderstage3_2 delay
.MEASURE TRAN meaz2_inv_rowdecoderstage3_2_tfall TRIG V(n_2_24) VAL='0.8_lp/2' FALL=1
+    TARG V(X2loadnand24.n_out) VAL='0.8_lp/2' FALL=1
.MEASURE TRAN meaz2_inv_rowdecoderstage3_2_trise TRIG V(n_2_24) VAL='0.8_lp/2' RISE=1
+    TARG V(X2loadnand24.n_out) VAL='0.8_lp/2' RISE=1

* Total delays
.MEASURE TRAN meaz2_total_tfall TRIG V(n_2_24) VAL='0.8_lp/2' FALL=1
+    TARG V(X2loadnand24.n_out) VAL='0.8_lp/2' FALL=1
.MEASURE TRAN meaz2_total_trise TRIG V(n_2_24) VAL='0.8_lp/2' RISE=1
+    TARG V(X2loadnand24.n_out) VAL='0.8_lp/2' RISE=1

.MEASURE TRAN meas_logic_low_voltage FIND V(n_in) AT=3n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meaz2_current  INTEG I(V_third2) FROM=0ns TO=4ns
.MEASURE TRAN meaz2_avg_power PARAM = '-(meaz2_current/4n)*0.8_lp'

********************************************************************************
** Circuit
********************************************************************************

Xnandv n_in n_2_1 vdd_lp ground rowdecoderstage13
X2loadnand1 n_2_1 n_hang2_2 vdd_lp ground rowdecoderstage3
X2wire1 n_2_1 n_2_2 wire Rw=wire_rowdecoderstage0_res/24 Cw=wire_rowdecoderstage0_cap/24
X2loadnand2 n_2_2 n_hang2_3 vdd_lp ground rowdecoderstage3
X2wire2 n_2_2 n_2_3 wire Rw=wire_rowdecoderstage0_res/24 Cw=wire_rowdecoderstage0_cap/24
X2loadnand3 n_2_3 n_hang2_4 vdd_lp ground rowdecoderstage3
X2wire3 n_2_3 n_2_4 wire Rw=wire_rowdecoderstage0_res/24 Cw=wire_rowdecoderstage0_cap/24
X2loadnand4 n_2_4 n_hang2_5 vdd_lp ground rowdecoderstage3
X2wire4 n_2_4 n_2_5 wire Rw=wire_rowdecoderstage0_res/24 Cw=wire_rowdecoderstage0_cap/24
X2loadnand5 n_2_5 n_hang2_6 vdd_lp ground rowdecoderstage3
X2wire5 n_2_5 n_2_6 wire Rw=wire_rowdecoderstage0_res/24 Cw=wire_rowdecoderstage0_cap/24
X2loadnand6 n_2_6 n_hang2_7 vdd_lp ground rowdecoderstage3
X2wire6 n_2_6 n_2_7 wire Rw=wire_rowdecoderstage0_res/24 Cw=wire_rowdecoderstage0_cap/24
X2loadnand7 n_2_7 n_hang2_8 vdd_lp ground rowdecoderstage3
X2wire7 n_2_7 n_2_8 wire Rw=wire_rowdecoderstage0_res/24 Cw=wire_rowdecoderstage0_cap/24
X2loadnand8 n_2_8 n_hang2_9 vdd_lp ground rowdecoderstage3
X2wire8 n_2_8 n_2_9 wire Rw=wire_rowdecoderstage0_res/24 Cw=wire_rowdecoderstage0_cap/24
X2loadnand9 n_2_9 n_hang2_10 vdd_lp ground rowdecoderstage3
X2wire9 n_2_9 n_2_10 wire Rw=wire_rowdecoderstage0_res/24 Cw=wire_rowdecoderstage0_cap/24
X2loadnand10 n_2_10 n_hang2_11 vdd_lp ground rowdecoderstage3
X2wire10 n_2_10 n_2_11 wire Rw=wire_rowdecoderstage0_res/24 Cw=wire_rowdecoderstage0_cap/24
X2loadnand11 n_2_11 n_hang2_12 vdd_lp ground rowdecoderstage3
X2wire11 n_2_11 n_2_12 wire Rw=wire_rowdecoderstage0_res/24 Cw=wire_rowdecoderstage0_cap/24
X2loadnand12 n_2_12 n_hang2_13 vdd_lp ground rowdecoderstage3
X2wire12 n_2_12 n_2_13 wire Rw=wire_rowdecoderstage0_res/24 Cw=wire_rowdecoderstage0_cap/24
X2loadnand13 n_2_13 n_hang2_14 vdd_lp ground rowdecoderstage3
X2wire13 n_2_13 n_2_14 wire Rw=wire_rowdecoderstage0_res/24 Cw=wire_rowdecoderstage0_cap/24
X2loadnand14 n_2_14 n_hang2_15 vdd_lp ground rowdecoderstage3
X2wire14 n_2_14 n_2_15 wire Rw=wire_rowdecoderstage0_res/24 Cw=wire_rowdecoderstage0_cap/24
X2loadnand15 n_2_15 n_hang2_16 vdd_lp ground rowdecoderstage3
X2wire15 n_2_15 n_2_16 wire Rw=wire_rowdecoderstage0_res/24 Cw=wire_rowdecoderstage0_cap/24
X2loadnand16 n_2_16 n_hang2_17 vdd_lp ground rowdecoderstage3
X2wire16 n_2_16 n_2_17 wire Rw=wire_rowdecoderstage0_res/24 Cw=wire_rowdecoderstage0_cap/24
X2loadnand17 n_2_17 n_hang2_18 vdd_lp ground rowdecoderstage3
X2wire17 n_2_17 n_2_18 wire Rw=wire_rowdecoderstage0_res/24 Cw=wire_rowdecoderstage0_cap/24
X2loadnand18 n_2_18 n_hang2_19 vdd_lp ground rowdecoderstage3
X2wire18 n_2_18 n_2_19 wire Rw=wire_rowdecoderstage0_res/24 Cw=wire_rowdecoderstage0_cap/24
X2loadnand19 n_2_19 n_hang2_20 vdd_lp ground rowdecoderstage3
X2wire19 n_2_19 n_2_20 wire Rw=wire_rowdecoderstage0_res/24 Cw=wire_rowdecoderstage0_cap/24
X2loadnand20 n_2_20 n_hang2_21 vdd_lp ground rowdecoderstage3
X2wire20 n_2_20 n_2_21 wire Rw=wire_rowdecoderstage0_res/24 Cw=wire_rowdecoderstage0_cap/24
X2loadnand21 n_2_21 n_hang2_22 vdd_lp ground rowdecoderstage3
X2wire21 n_2_21 n_2_22 wire Rw=wire_rowdecoderstage0_res/24 Cw=wire_rowdecoderstage0_cap/24
X2loadnand22 n_2_22 n_hang2_23 vdd_lp ground rowdecoderstage3
X2wire22 n_2_22 n_2_23 wire Rw=wire_rowdecoderstage0_res/24 Cw=wire_rowdecoderstage0_cap/24
X2loadnand23 n_2_23 n_hang2_24 vdd_lp ground rowdecoderstage3
X2wire23 n_2_23 n_2_24 wire Rw=wire_rowdecoderstage0_res/24 Cw=wire_rowdecoderstage0_cap/24
X2loadnand24 n_2_24 n_2_25 vdd_third2 ground rowdecoderstage3
X2wordline n_2_25 n_2_26 vdd_lp ground wordline_driver
.END