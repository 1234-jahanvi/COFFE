.TITLE wordline driver

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
V_wordline vdd_wordline ground 0.8_lp

********************************************************************************
** Measurement
********************************************************************************

* inv_wordline_driver delay
.MEASURE TRAN meas_inv_nand3_wordline_driver_1_tfall TRIG V(n_1_1) VAL='0.8_lp/2' RISE=1
+    TARG V(Xwordline.n_1_1) VAL='0.8_lp/2' FALL=1
.MEASURE TRAN meas_inv_nand3_wordline_driver_1_trise TRIG V(n_1_1) VAL='0.8_lp/2' FALL=1
+    TARG V(Xwordline.n_1_1) VAL='0.8_lp/2' RISE=1

* inv_wordline_driver delay
.MEASURE TRAN meas_inv_wordline_driver_2_tfall TRIG V(n_1_1) VAL='0.8_lp/2' FALL=1
+    TARG V(Xwordline.n_1_2) VAL='0.8_lp/2' FALL=1
.MEASURE TRAN meas_inv_wordline_driver_2_trise TRIG V(n_1_1) VAL='0.8_lp/2' RISE=1
+    TARG V(Xwordline.n_1_2) VAL='0.8_lp/2' RISE=1

* inv_wordline_driver delay
.MEASURE TRAN meas_inv_wordline_driver_3_tfall TRIG V(n_1_1) VAL='0.8_lp/2' RISE=1
+    TARG V(Xwordline.n_1_3) VAL='0.8_lp/2' FALL=1
.MEASURE TRAN meas_inv_wordline_driver_3_trise TRIG V(n_1_1) VAL='0.8_lp/2' FALL=1
+    TARG V(Xwordline.n_1_3) VAL='0.8_lp/2' RISE=1

* inv_wordline_driver delay
.MEASURE TRAN meas_inv_wordline_driver_4_tfall TRIG V(n_1_1) VAL='0.8_lp/2' FALL=1
+    TARG V(n_1_65) VAL='0.8_lp * 0.1' FALL=1
.MEASURE TRAN meas_inv_wordline_driver_4_trise TRIG V(n_1_1) VAL='0.8_lp/2' RISE=1
+    TARG V(n_1_65) VAL='0.8_lp * 0.9' RISE=1

* Total delays
.MEASURE TRAN meaz1_total_tfall TRIG V(n_1_1) VAL='0.8_lp/2' FALL=1
+    TARG V(n_1_65) VAL='0.8_lp * 0.1' FALL=1
.MEASURE TRAN meaz1_total_trise TRIG V(n_1_1) VAL='0.8_lp/2' RISE=1
+    TARG V(n_1_65) VAL='0.8_lp * 0.9' RISE=1

.MEASURE TRAN meas_logic_low_voltage FIND V(n_in) AT=3n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current  INTEG I(V_wordline) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-(meas_current/4n)*0.8_lp'

********************************************************************************
** Circuit
********************************************************************************

Xnandu n_in n_1_1 vdd_lp ground rowdecoderstage3
Xwordline n_1_1 n_1_2 vdd_wordline ground wordline_driver
Xmemcell2 n_1_2 ground ground ground ground ground vdd_lp ground memorycell
Xwirel2 n_1_2 n_1_3 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell3 n_1_3 ground ground ground ground ground vdd_lp ground memorycell
Xwirel3 n_1_3 n_1_4 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell4 n_1_4 ground ground ground ground ground vdd_lp ground memorycell
Xwirel4 n_1_4 n_1_5 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell5 n_1_5 ground ground ground ground ground vdd_lp ground memorycell
Xwirel5 n_1_5 n_1_6 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell6 n_1_6 ground ground ground ground ground vdd_lp ground memorycell
Xwirel6 n_1_6 n_1_7 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell7 n_1_7 ground ground ground ground ground vdd_lp ground memorycell
Xwirel7 n_1_7 n_1_8 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell8 n_1_8 ground ground ground ground ground vdd_lp ground memorycell
Xwirel8 n_1_8 n_1_9 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell9 n_1_9 ground ground ground ground ground vdd_lp ground memorycell
Xwirel9 n_1_9 n_1_10 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell10 n_1_10 ground ground ground ground ground vdd_lp ground memorycell
Xwirel10 n_1_10 n_1_11 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell11 n_1_11 ground ground ground ground ground vdd_lp ground memorycell
Xwirel11 n_1_11 n_1_12 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell12 n_1_12 ground ground ground ground ground vdd_lp ground memorycell
Xwirel12 n_1_12 n_1_13 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell13 n_1_13 ground ground ground ground ground vdd_lp ground memorycell
Xwirel13 n_1_13 n_1_14 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell14 n_1_14 ground ground ground ground ground vdd_lp ground memorycell
Xwirel14 n_1_14 n_1_15 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell15 n_1_15 ground ground ground ground ground vdd_lp ground memorycell
Xwirel15 n_1_15 n_1_16 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell16 n_1_16 ground ground ground ground ground vdd_lp ground memorycell
Xwirel16 n_1_16 n_1_17 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell17 n_1_17 ground ground ground ground ground vdd_lp ground memorycell
Xwirel17 n_1_17 n_1_18 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell18 n_1_18 ground ground ground ground ground vdd_lp ground memorycell
Xwirel18 n_1_18 n_1_19 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell19 n_1_19 ground ground ground ground ground vdd_lp ground memorycell
Xwirel19 n_1_19 n_1_20 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell20 n_1_20 ground ground ground ground ground vdd_lp ground memorycell
Xwirel20 n_1_20 n_1_21 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell21 n_1_21 ground ground ground ground ground vdd_lp ground memorycell
Xwirel21 n_1_21 n_1_22 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell22 n_1_22 ground ground ground ground ground vdd_lp ground memorycell
Xwirel22 n_1_22 n_1_23 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell23 n_1_23 ground ground ground ground ground vdd_lp ground memorycell
Xwirel23 n_1_23 n_1_24 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell24 n_1_24 ground ground ground ground ground vdd_lp ground memorycell
Xwirel24 n_1_24 n_1_25 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell25 n_1_25 ground ground ground ground ground vdd_lp ground memorycell
Xwirel25 n_1_25 n_1_26 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell26 n_1_26 ground ground ground ground ground vdd_lp ground memorycell
Xwirel26 n_1_26 n_1_27 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell27 n_1_27 ground ground ground ground ground vdd_lp ground memorycell
Xwirel27 n_1_27 n_1_28 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell28 n_1_28 ground ground ground ground ground vdd_lp ground memorycell
Xwirel28 n_1_28 n_1_29 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell29 n_1_29 ground ground ground ground ground vdd_lp ground memorycell
Xwirel29 n_1_29 n_1_30 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell30 n_1_30 ground ground ground ground ground vdd_lp ground memorycell
Xwirel30 n_1_30 n_1_31 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell31 n_1_31 ground ground ground ground ground vdd_lp ground memorycell
Xwirel31 n_1_31 n_1_32 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell32 n_1_32 ground ground ground ground ground vdd_lp ground memorycell
Xwirel32 n_1_32 n_1_33 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell33 n_1_33 ground ground ground ground ground vdd_lp ground memorycell
Xwirel33 n_1_33 n_1_34 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell34 n_1_34 ground ground ground ground ground vdd_lp ground memorycell
Xwirel34 n_1_34 n_1_35 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell35 n_1_35 ground ground ground ground ground vdd_lp ground memorycell
Xwirel35 n_1_35 n_1_36 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell36 n_1_36 ground ground ground ground ground vdd_lp ground memorycell
Xwirel36 n_1_36 n_1_37 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell37 n_1_37 ground ground ground ground ground vdd_lp ground memorycell
Xwirel37 n_1_37 n_1_38 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell38 n_1_38 ground ground ground ground ground vdd_lp ground memorycell
Xwirel38 n_1_38 n_1_39 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell39 n_1_39 ground ground ground ground ground vdd_lp ground memorycell
Xwirel39 n_1_39 n_1_40 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell40 n_1_40 ground ground ground ground ground vdd_lp ground memorycell
Xwirel40 n_1_40 n_1_41 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell41 n_1_41 ground ground ground ground ground vdd_lp ground memorycell
Xwirel41 n_1_41 n_1_42 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell42 n_1_42 ground ground ground ground ground vdd_lp ground memorycell
Xwirel42 n_1_42 n_1_43 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell43 n_1_43 ground ground ground ground ground vdd_lp ground memorycell
Xwirel43 n_1_43 n_1_44 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell44 n_1_44 ground ground ground ground ground vdd_lp ground memorycell
Xwirel44 n_1_44 n_1_45 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell45 n_1_45 ground ground ground ground ground vdd_lp ground memorycell
Xwirel45 n_1_45 n_1_46 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell46 n_1_46 ground ground ground ground ground vdd_lp ground memorycell
Xwirel46 n_1_46 n_1_47 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell47 n_1_47 ground ground ground ground ground vdd_lp ground memorycell
Xwirel47 n_1_47 n_1_48 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell48 n_1_48 ground ground ground ground ground vdd_lp ground memorycell
Xwirel48 n_1_48 n_1_49 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell49 n_1_49 ground ground ground ground ground vdd_lp ground memorycell
Xwirel49 n_1_49 n_1_50 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell50 n_1_50 ground ground ground ground ground vdd_lp ground memorycell
Xwirel50 n_1_50 n_1_51 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell51 n_1_51 ground ground ground ground ground vdd_lp ground memorycell
Xwirel51 n_1_51 n_1_52 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell52 n_1_52 ground ground ground ground ground vdd_lp ground memorycell
Xwirel52 n_1_52 n_1_53 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell53 n_1_53 ground ground ground ground ground vdd_lp ground memorycell
Xwirel53 n_1_53 n_1_54 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell54 n_1_54 ground ground ground ground ground vdd_lp ground memorycell
Xwirel54 n_1_54 n_1_55 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell55 n_1_55 ground ground ground ground ground vdd_lp ground memorycell
Xwirel55 n_1_55 n_1_56 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell56 n_1_56 ground ground ground ground ground vdd_lp ground memorycell
Xwirel56 n_1_56 n_1_57 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell57 n_1_57 ground ground ground ground ground vdd_lp ground memorycell
Xwirel57 n_1_57 n_1_58 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell58 n_1_58 ground ground ground ground ground vdd_lp ground memorycell
Xwirel58 n_1_58 n_1_59 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell59 n_1_59 ground ground ground ground ground vdd_lp ground memorycell
Xwirel59 n_1_59 n_1_60 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell60 n_1_60 ground ground ground ground ground vdd_lp ground memorycell
Xwirel60 n_1_60 n_1_61 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell61 n_1_61 ground ground ground ground ground vdd_lp ground memorycell
Xwirel61 n_1_61 n_1_62 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell62 n_1_62 ground ground ground ground ground vdd_lp ground memorycell
Xwirel62 n_1_62 n_1_63 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell63 n_1_63 ground ground ground ground ground vdd_lp ground memorycell
Xwirel63 n_1_63 n_1_64 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell64 n_1_64 ground ground ground ground ground vdd_lp ground memorycell
Xwirel64 n_1_64 n_1_65 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
Xmemcell65 n_1_65 ground ground ground ground ground vdd_lp ground memorycell
Xwirel65 n_1_65 n_1_66 wire Rw=wire_wordline_driver_res/64 Cw=wire_wordline_driver_cap/64
.END