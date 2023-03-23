.TITLE bitline charging process in MTJ-based RAM block

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

VIN n_in_b ground PULSE (0 0.8_lp 0 0 0 4n 8n)
VINb n_in ground PULSE (0.8_lp 0 0 0 0 4n 8n)
* Power rail for the circuit under test.
* This allows us to measure power of a circuit under test without measuring the power of wave shaping and load circuitry.
V_charge vdd_charge ground 0.8_lp

********************************************************************************
** Measurement
********************************************************************************

* Total delays
.MEASURE TRAN meas_total_tfall TRIG V(n_in) VAL='0.8_lp/2' FALL=1
+    TARG V(n_br_512) VAL='target_bl' RISE=1
.MEASURE TRAN meas_total_trise TRIG V(n_in) VAL='0.8_lp/2' FALL=1
+    TARG V(n_br_512) VAL='target_bl' RISE=1 

.MEASURE TRAN meas_logic_low_voltage FIND V(ground) AT=3n

.MEASURE TRAN meas_outputtarget FIND V(n_br_512) AT=4n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current  INTEG I(V_charge) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-(meas_current/4n)*0.8_lp'

********************************************************************************
** Circuit
********************************************************************************

Xprechargesa n_1_1 n_2_1 ground ground n_hang_out vclmpmtj vrefmtj ground n_in_b vdd_charge ground mtj_subcircuits_sa
Xwritedriver ground ground n_1_1 ground vdd_lp ground mtj_subcircuits_writedriver
Xwritedriver_ref ground ground n_2_1 ground vdd_lp ground mtj_subcircuits_writedriver
Xcs n_1_1 n_bl_0 n_in n_in_b vdd_lp ground mtj_subcircuits_cs
Xcs_ref n_2_1 n_br_0 n_in n_in_b vdd_lp ground mtj_subcircuits_cs
Xwire0 n_bl_0 n_bl_1 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ0 ground ground n_bl_1 ground ground ground vdd_lp ground memorycell
X2wire0 n_br_0 n_br_1 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ0 ground ground n_br_1 ground ground ground vdd_lp ground memorycell
Xwire1 n_bl_1 n_bl_2 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ1 ground ground n_bl_2 ground ground ground vdd_lp ground memorycell
X2wire1 n_br_1 n_br_2 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ1 ground ground n_br_2 ground ground ground vdd_lp ground memorycell
Xwire2 n_bl_2 n_bl_3 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ2 ground ground n_bl_3 ground ground ground vdd_lp ground memorycell
X2wire2 n_br_2 n_br_3 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ2 ground ground n_br_3 ground ground ground vdd_lp ground memorycell
Xwire3 n_bl_3 n_bl_4 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ3 ground ground n_bl_4 ground ground ground vdd_lp ground memorycell
X2wire3 n_br_3 n_br_4 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ3 ground ground n_br_4 ground ground ground vdd_lp ground memorycell
Xwire4 n_bl_4 n_bl_5 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ4 ground ground n_bl_5 ground ground ground vdd_lp ground memorycell
X2wire4 n_br_4 n_br_5 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ4 ground ground n_br_5 ground ground ground vdd_lp ground memorycell
Xwire5 n_bl_5 n_bl_6 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ5 ground ground n_bl_6 ground ground ground vdd_lp ground memorycell
X2wire5 n_br_5 n_br_6 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ5 ground ground n_br_6 ground ground ground vdd_lp ground memorycell
Xwire6 n_bl_6 n_bl_7 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ6 ground ground n_bl_7 ground ground ground vdd_lp ground memorycell
X2wire6 n_br_6 n_br_7 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ6 ground ground n_br_7 ground ground ground vdd_lp ground memorycell
Xwire7 n_bl_7 n_bl_8 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ7 ground ground n_bl_8 ground ground ground vdd_lp ground memorycell
X2wire7 n_br_7 n_br_8 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ7 ground ground n_br_8 ground ground ground vdd_lp ground memorycell
Xwire8 n_bl_8 n_bl_9 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ8 ground ground n_bl_9 ground ground ground vdd_lp ground memorycell
X2wire8 n_br_8 n_br_9 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ8 ground ground n_br_9 ground ground ground vdd_lp ground memorycell
Xwire9 n_bl_9 n_bl_10 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ9 ground ground n_bl_10 ground ground ground vdd_lp ground memorycell
X2wire9 n_br_9 n_br_10 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ9 ground ground n_br_10 ground ground ground vdd_lp ground memorycell
Xwire10 n_bl_10 n_bl_11 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ10 ground ground n_bl_11 ground ground ground vdd_lp ground memorycell
X2wire10 n_br_10 n_br_11 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ10 ground ground n_br_11 ground ground ground vdd_lp ground memorycell
Xwire11 n_bl_11 n_bl_12 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ11 ground ground n_bl_12 ground ground ground vdd_lp ground memorycell
X2wire11 n_br_11 n_br_12 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ11 ground ground n_br_12 ground ground ground vdd_lp ground memorycell
Xwire12 n_bl_12 n_bl_13 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ12 ground ground n_bl_13 ground ground ground vdd_lp ground memorycell
X2wire12 n_br_12 n_br_13 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ12 ground ground n_br_13 ground ground ground vdd_lp ground memorycell
Xwire13 n_bl_13 n_bl_14 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ13 ground ground n_bl_14 ground ground ground vdd_lp ground memorycell
X2wire13 n_br_13 n_br_14 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ13 ground ground n_br_14 ground ground ground vdd_lp ground memorycell
Xwire14 n_bl_14 n_bl_15 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ14 ground ground n_bl_15 ground ground ground vdd_lp ground memorycell
X2wire14 n_br_14 n_br_15 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ14 ground ground n_br_15 ground ground ground vdd_lp ground memorycell
Xwire15 n_bl_15 n_bl_16 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ15 ground ground n_bl_16 ground ground ground vdd_lp ground memorycell
X2wire15 n_br_15 n_br_16 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ15 ground ground n_br_16 ground ground ground vdd_lp ground memorycell
Xwire16 n_bl_16 n_bl_17 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ16 ground ground n_bl_17 ground ground ground vdd_lp ground memorycell
X2wire16 n_br_16 n_br_17 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ16 ground ground n_br_17 ground ground ground vdd_lp ground memorycell
Xwire17 n_bl_17 n_bl_18 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ17 ground ground n_bl_18 ground ground ground vdd_lp ground memorycell
X2wire17 n_br_17 n_br_18 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ17 ground ground n_br_18 ground ground ground vdd_lp ground memorycell
Xwire18 n_bl_18 n_bl_19 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ18 ground ground n_bl_19 ground ground ground vdd_lp ground memorycell
X2wire18 n_br_18 n_br_19 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ18 ground ground n_br_19 ground ground ground vdd_lp ground memorycell
Xwire19 n_bl_19 n_bl_20 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ19 ground ground n_bl_20 ground ground ground vdd_lp ground memorycell
X2wire19 n_br_19 n_br_20 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ19 ground ground n_br_20 ground ground ground vdd_lp ground memorycell
Xwire20 n_bl_20 n_bl_21 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ20 ground ground n_bl_21 ground ground ground vdd_lp ground memorycell
X2wire20 n_br_20 n_br_21 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ20 ground ground n_br_21 ground ground ground vdd_lp ground memorycell
Xwire21 n_bl_21 n_bl_22 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ21 ground ground n_bl_22 ground ground ground vdd_lp ground memorycell
X2wire21 n_br_21 n_br_22 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ21 ground ground n_br_22 ground ground ground vdd_lp ground memorycell
Xwire22 n_bl_22 n_bl_23 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ22 ground ground n_bl_23 ground ground ground vdd_lp ground memorycell
X2wire22 n_br_22 n_br_23 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ22 ground ground n_br_23 ground ground ground vdd_lp ground memorycell
Xwire23 n_bl_23 n_bl_24 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ23 ground ground n_bl_24 ground ground ground vdd_lp ground memorycell
X2wire23 n_br_23 n_br_24 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ23 ground ground n_br_24 ground ground ground vdd_lp ground memorycell
Xwire24 n_bl_24 n_bl_25 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ24 ground ground n_bl_25 ground ground ground vdd_lp ground memorycell
X2wire24 n_br_24 n_br_25 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ24 ground ground n_br_25 ground ground ground vdd_lp ground memorycell
Xwire25 n_bl_25 n_bl_26 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ25 ground ground n_bl_26 ground ground ground vdd_lp ground memorycell
X2wire25 n_br_25 n_br_26 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ25 ground ground n_br_26 ground ground ground vdd_lp ground memorycell
Xwire26 n_bl_26 n_bl_27 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ26 ground ground n_bl_27 ground ground ground vdd_lp ground memorycell
X2wire26 n_br_26 n_br_27 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ26 ground ground n_br_27 ground ground ground vdd_lp ground memorycell
Xwire27 n_bl_27 n_bl_28 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ27 ground ground n_bl_28 ground ground ground vdd_lp ground memorycell
X2wire27 n_br_27 n_br_28 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ27 ground ground n_br_28 ground ground ground vdd_lp ground memorycell
Xwire28 n_bl_28 n_bl_29 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ28 ground ground n_bl_29 ground ground ground vdd_lp ground memorycell
X2wire28 n_br_28 n_br_29 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ28 ground ground n_br_29 ground ground ground vdd_lp ground memorycell
Xwire29 n_bl_29 n_bl_30 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ29 ground ground n_bl_30 ground ground ground vdd_lp ground memorycell
X2wire29 n_br_29 n_br_30 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ29 ground ground n_br_30 ground ground ground vdd_lp ground memorycell
Xwire30 n_bl_30 n_bl_31 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ30 ground ground n_bl_31 ground ground ground vdd_lp ground memorycell
X2wire30 n_br_30 n_br_31 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ30 ground ground n_br_31 ground ground ground vdd_lp ground memorycell
Xwire31 n_bl_31 n_bl_32 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ31 ground ground n_bl_32 ground ground ground vdd_lp ground memorycell
X2wire31 n_br_31 n_br_32 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ31 ground ground n_br_32 ground ground ground vdd_lp ground memorycell
Xwire32 n_bl_32 n_bl_33 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ32 ground ground n_bl_33 ground ground ground vdd_lp ground memorycell
X2wire32 n_br_32 n_br_33 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ32 ground ground n_br_33 ground ground ground vdd_lp ground memorycell
Xwire33 n_bl_33 n_bl_34 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ33 ground ground n_bl_34 ground ground ground vdd_lp ground memorycell
X2wire33 n_br_33 n_br_34 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ33 ground ground n_br_34 ground ground ground vdd_lp ground memorycell
Xwire34 n_bl_34 n_bl_35 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ34 ground ground n_bl_35 ground ground ground vdd_lp ground memorycell
X2wire34 n_br_34 n_br_35 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ34 ground ground n_br_35 ground ground ground vdd_lp ground memorycell
Xwire35 n_bl_35 n_bl_36 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ35 ground ground n_bl_36 ground ground ground vdd_lp ground memorycell
X2wire35 n_br_35 n_br_36 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ35 ground ground n_br_36 ground ground ground vdd_lp ground memorycell
Xwire36 n_bl_36 n_bl_37 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ36 ground ground n_bl_37 ground ground ground vdd_lp ground memorycell
X2wire36 n_br_36 n_br_37 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ36 ground ground n_br_37 ground ground ground vdd_lp ground memorycell
Xwire37 n_bl_37 n_bl_38 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ37 ground ground n_bl_38 ground ground ground vdd_lp ground memorycell
X2wire37 n_br_37 n_br_38 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ37 ground ground n_br_38 ground ground ground vdd_lp ground memorycell
Xwire38 n_bl_38 n_bl_39 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ38 ground ground n_bl_39 ground ground ground vdd_lp ground memorycell
X2wire38 n_br_38 n_br_39 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ38 ground ground n_br_39 ground ground ground vdd_lp ground memorycell
Xwire39 n_bl_39 n_bl_40 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ39 ground ground n_bl_40 ground ground ground vdd_lp ground memorycell
X2wire39 n_br_39 n_br_40 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ39 ground ground n_br_40 ground ground ground vdd_lp ground memorycell
Xwire40 n_bl_40 n_bl_41 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ40 ground ground n_bl_41 ground ground ground vdd_lp ground memorycell
X2wire40 n_br_40 n_br_41 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ40 ground ground n_br_41 ground ground ground vdd_lp ground memorycell
Xwire41 n_bl_41 n_bl_42 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ41 ground ground n_bl_42 ground ground ground vdd_lp ground memorycell
X2wire41 n_br_41 n_br_42 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ41 ground ground n_br_42 ground ground ground vdd_lp ground memorycell
Xwire42 n_bl_42 n_bl_43 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ42 ground ground n_bl_43 ground ground ground vdd_lp ground memorycell
X2wire42 n_br_42 n_br_43 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ42 ground ground n_br_43 ground ground ground vdd_lp ground memorycell
Xwire43 n_bl_43 n_bl_44 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ43 ground ground n_bl_44 ground ground ground vdd_lp ground memorycell
X2wire43 n_br_43 n_br_44 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ43 ground ground n_br_44 ground ground ground vdd_lp ground memorycell
Xwire44 n_bl_44 n_bl_45 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ44 ground ground n_bl_45 ground ground ground vdd_lp ground memorycell
X2wire44 n_br_44 n_br_45 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ44 ground ground n_br_45 ground ground ground vdd_lp ground memorycell
Xwire45 n_bl_45 n_bl_46 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ45 ground ground n_bl_46 ground ground ground vdd_lp ground memorycell
X2wire45 n_br_45 n_br_46 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ45 ground ground n_br_46 ground ground ground vdd_lp ground memorycell
Xwire46 n_bl_46 n_bl_47 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ46 ground ground n_bl_47 ground ground ground vdd_lp ground memorycell
X2wire46 n_br_46 n_br_47 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ46 ground ground n_br_47 ground ground ground vdd_lp ground memorycell
Xwire47 n_bl_47 n_bl_48 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ47 ground ground n_bl_48 ground ground ground vdd_lp ground memorycell
X2wire47 n_br_47 n_br_48 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ47 ground ground n_br_48 ground ground ground vdd_lp ground memorycell
Xwire48 n_bl_48 n_bl_49 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ48 ground ground n_bl_49 ground ground ground vdd_lp ground memorycell
X2wire48 n_br_48 n_br_49 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ48 ground ground n_br_49 ground ground ground vdd_lp ground memorycell
Xwire49 n_bl_49 n_bl_50 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ49 ground ground n_bl_50 ground ground ground vdd_lp ground memorycell
X2wire49 n_br_49 n_br_50 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ49 ground ground n_br_50 ground ground ground vdd_lp ground memorycell
Xwire50 n_bl_50 n_bl_51 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ50 ground ground n_bl_51 ground ground ground vdd_lp ground memorycell
X2wire50 n_br_50 n_br_51 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ50 ground ground n_br_51 ground ground ground vdd_lp ground memorycell
Xwire51 n_bl_51 n_bl_52 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ51 ground ground n_bl_52 ground ground ground vdd_lp ground memorycell
X2wire51 n_br_51 n_br_52 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ51 ground ground n_br_52 ground ground ground vdd_lp ground memorycell
Xwire52 n_bl_52 n_bl_53 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ52 ground ground n_bl_53 ground ground ground vdd_lp ground memorycell
X2wire52 n_br_52 n_br_53 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ52 ground ground n_br_53 ground ground ground vdd_lp ground memorycell
Xwire53 n_bl_53 n_bl_54 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ53 ground ground n_bl_54 ground ground ground vdd_lp ground memorycell
X2wire53 n_br_53 n_br_54 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ53 ground ground n_br_54 ground ground ground vdd_lp ground memorycell
Xwire54 n_bl_54 n_bl_55 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ54 ground ground n_bl_55 ground ground ground vdd_lp ground memorycell
X2wire54 n_br_54 n_br_55 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ54 ground ground n_br_55 ground ground ground vdd_lp ground memorycell
Xwire55 n_bl_55 n_bl_56 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ55 ground ground n_bl_56 ground ground ground vdd_lp ground memorycell
X2wire55 n_br_55 n_br_56 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ55 ground ground n_br_56 ground ground ground vdd_lp ground memorycell
Xwire56 n_bl_56 n_bl_57 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ56 ground ground n_bl_57 ground ground ground vdd_lp ground memorycell
X2wire56 n_br_56 n_br_57 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ56 ground ground n_br_57 ground ground ground vdd_lp ground memorycell
Xwire57 n_bl_57 n_bl_58 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ57 ground ground n_bl_58 ground ground ground vdd_lp ground memorycell
X2wire57 n_br_57 n_br_58 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ57 ground ground n_br_58 ground ground ground vdd_lp ground memorycell
Xwire58 n_bl_58 n_bl_59 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ58 ground ground n_bl_59 ground ground ground vdd_lp ground memorycell
X2wire58 n_br_58 n_br_59 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ58 ground ground n_br_59 ground ground ground vdd_lp ground memorycell
Xwire59 n_bl_59 n_bl_60 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ59 ground ground n_bl_60 ground ground ground vdd_lp ground memorycell
X2wire59 n_br_59 n_br_60 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ59 ground ground n_br_60 ground ground ground vdd_lp ground memorycell
Xwire60 n_bl_60 n_bl_61 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ60 ground ground n_bl_61 ground ground ground vdd_lp ground memorycell
X2wire60 n_br_60 n_br_61 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ60 ground ground n_br_61 ground ground ground vdd_lp ground memorycell
Xwire61 n_bl_61 n_bl_62 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ61 ground ground n_bl_62 ground ground ground vdd_lp ground memorycell
X2wire61 n_br_61 n_br_62 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ61 ground ground n_br_62 ground ground ground vdd_lp ground memorycell
Xwire62 n_bl_62 n_bl_63 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ62 ground ground n_bl_63 ground ground ground vdd_lp ground memorycell
X2wire62 n_br_62 n_br_63 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ62 ground ground n_br_63 ground ground ground vdd_lp ground memorycell
Xwire63 n_bl_63 n_bl_64 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ63 ground ground n_bl_64 ground ground ground vdd_lp ground memorycell
X2wire63 n_br_63 n_br_64 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ63 ground ground n_br_64 ground ground ground vdd_lp ground memorycell
Xwire64 n_bl_64 n_bl_65 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ64 ground ground n_bl_65 ground ground ground vdd_lp ground memorycell
X2wire64 n_br_64 n_br_65 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ64 ground ground n_br_65 ground ground ground vdd_lp ground memorycell
Xwire65 n_bl_65 n_bl_66 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ65 ground ground n_bl_66 ground ground ground vdd_lp ground memorycell
X2wire65 n_br_65 n_br_66 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ65 ground ground n_br_66 ground ground ground vdd_lp ground memorycell
Xwire66 n_bl_66 n_bl_67 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ66 ground ground n_bl_67 ground ground ground vdd_lp ground memorycell
X2wire66 n_br_66 n_br_67 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ66 ground ground n_br_67 ground ground ground vdd_lp ground memorycell
Xwire67 n_bl_67 n_bl_68 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ67 ground ground n_bl_68 ground ground ground vdd_lp ground memorycell
X2wire67 n_br_67 n_br_68 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ67 ground ground n_br_68 ground ground ground vdd_lp ground memorycell
Xwire68 n_bl_68 n_bl_69 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ68 ground ground n_bl_69 ground ground ground vdd_lp ground memorycell
X2wire68 n_br_68 n_br_69 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ68 ground ground n_br_69 ground ground ground vdd_lp ground memorycell
Xwire69 n_bl_69 n_bl_70 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ69 ground ground n_bl_70 ground ground ground vdd_lp ground memorycell
X2wire69 n_br_69 n_br_70 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ69 ground ground n_br_70 ground ground ground vdd_lp ground memorycell
Xwire70 n_bl_70 n_bl_71 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ70 ground ground n_bl_71 ground ground ground vdd_lp ground memorycell
X2wire70 n_br_70 n_br_71 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ70 ground ground n_br_71 ground ground ground vdd_lp ground memorycell
Xwire71 n_bl_71 n_bl_72 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ71 ground ground n_bl_72 ground ground ground vdd_lp ground memorycell
X2wire71 n_br_71 n_br_72 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ71 ground ground n_br_72 ground ground ground vdd_lp ground memorycell
Xwire72 n_bl_72 n_bl_73 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ72 ground ground n_bl_73 ground ground ground vdd_lp ground memorycell
X2wire72 n_br_72 n_br_73 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ72 ground ground n_br_73 ground ground ground vdd_lp ground memorycell
Xwire73 n_bl_73 n_bl_74 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ73 ground ground n_bl_74 ground ground ground vdd_lp ground memorycell
X2wire73 n_br_73 n_br_74 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ73 ground ground n_br_74 ground ground ground vdd_lp ground memorycell
Xwire74 n_bl_74 n_bl_75 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ74 ground ground n_bl_75 ground ground ground vdd_lp ground memorycell
X2wire74 n_br_74 n_br_75 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ74 ground ground n_br_75 ground ground ground vdd_lp ground memorycell
Xwire75 n_bl_75 n_bl_76 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ75 ground ground n_bl_76 ground ground ground vdd_lp ground memorycell
X2wire75 n_br_75 n_br_76 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ75 ground ground n_br_76 ground ground ground vdd_lp ground memorycell
Xwire76 n_bl_76 n_bl_77 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ76 ground ground n_bl_77 ground ground ground vdd_lp ground memorycell
X2wire76 n_br_76 n_br_77 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ76 ground ground n_br_77 ground ground ground vdd_lp ground memorycell
Xwire77 n_bl_77 n_bl_78 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ77 ground ground n_bl_78 ground ground ground vdd_lp ground memorycell
X2wire77 n_br_77 n_br_78 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ77 ground ground n_br_78 ground ground ground vdd_lp ground memorycell
Xwire78 n_bl_78 n_bl_79 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ78 ground ground n_bl_79 ground ground ground vdd_lp ground memorycell
X2wire78 n_br_78 n_br_79 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ78 ground ground n_br_79 ground ground ground vdd_lp ground memorycell
Xwire79 n_bl_79 n_bl_80 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ79 ground ground n_bl_80 ground ground ground vdd_lp ground memorycell
X2wire79 n_br_79 n_br_80 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ79 ground ground n_br_80 ground ground ground vdd_lp ground memorycell
Xwire80 n_bl_80 n_bl_81 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ80 ground ground n_bl_81 ground ground ground vdd_lp ground memorycell
X2wire80 n_br_80 n_br_81 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ80 ground ground n_br_81 ground ground ground vdd_lp ground memorycell
Xwire81 n_bl_81 n_bl_82 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ81 ground ground n_bl_82 ground ground ground vdd_lp ground memorycell
X2wire81 n_br_81 n_br_82 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ81 ground ground n_br_82 ground ground ground vdd_lp ground memorycell
Xwire82 n_bl_82 n_bl_83 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ82 ground ground n_bl_83 ground ground ground vdd_lp ground memorycell
X2wire82 n_br_82 n_br_83 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ82 ground ground n_br_83 ground ground ground vdd_lp ground memorycell
Xwire83 n_bl_83 n_bl_84 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ83 ground ground n_bl_84 ground ground ground vdd_lp ground memorycell
X2wire83 n_br_83 n_br_84 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ83 ground ground n_br_84 ground ground ground vdd_lp ground memorycell
Xwire84 n_bl_84 n_bl_85 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ84 ground ground n_bl_85 ground ground ground vdd_lp ground memorycell
X2wire84 n_br_84 n_br_85 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ84 ground ground n_br_85 ground ground ground vdd_lp ground memorycell
Xwire85 n_bl_85 n_bl_86 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ85 ground ground n_bl_86 ground ground ground vdd_lp ground memorycell
X2wire85 n_br_85 n_br_86 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ85 ground ground n_br_86 ground ground ground vdd_lp ground memorycell
Xwire86 n_bl_86 n_bl_87 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ86 ground ground n_bl_87 ground ground ground vdd_lp ground memorycell
X2wire86 n_br_86 n_br_87 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ86 ground ground n_br_87 ground ground ground vdd_lp ground memorycell
Xwire87 n_bl_87 n_bl_88 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ87 ground ground n_bl_88 ground ground ground vdd_lp ground memorycell
X2wire87 n_br_87 n_br_88 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ87 ground ground n_br_88 ground ground ground vdd_lp ground memorycell
Xwire88 n_bl_88 n_bl_89 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ88 ground ground n_bl_89 ground ground ground vdd_lp ground memorycell
X2wire88 n_br_88 n_br_89 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ88 ground ground n_br_89 ground ground ground vdd_lp ground memorycell
Xwire89 n_bl_89 n_bl_90 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ89 ground ground n_bl_90 ground ground ground vdd_lp ground memorycell
X2wire89 n_br_89 n_br_90 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ89 ground ground n_br_90 ground ground ground vdd_lp ground memorycell
Xwire90 n_bl_90 n_bl_91 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ90 ground ground n_bl_91 ground ground ground vdd_lp ground memorycell
X2wire90 n_br_90 n_br_91 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ90 ground ground n_br_91 ground ground ground vdd_lp ground memorycell
Xwire91 n_bl_91 n_bl_92 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ91 ground ground n_bl_92 ground ground ground vdd_lp ground memorycell
X2wire91 n_br_91 n_br_92 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ91 ground ground n_br_92 ground ground ground vdd_lp ground memorycell
Xwire92 n_bl_92 n_bl_93 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ92 ground ground n_bl_93 ground ground ground vdd_lp ground memorycell
X2wire92 n_br_92 n_br_93 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ92 ground ground n_br_93 ground ground ground vdd_lp ground memorycell
Xwire93 n_bl_93 n_bl_94 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ93 ground ground n_bl_94 ground ground ground vdd_lp ground memorycell
X2wire93 n_br_93 n_br_94 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ93 ground ground n_br_94 ground ground ground vdd_lp ground memorycell
Xwire94 n_bl_94 n_bl_95 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ94 ground ground n_bl_95 ground ground ground vdd_lp ground memorycell
X2wire94 n_br_94 n_br_95 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ94 ground ground n_br_95 ground ground ground vdd_lp ground memorycell
Xwire95 n_bl_95 n_bl_96 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ95 ground ground n_bl_96 ground ground ground vdd_lp ground memorycell
X2wire95 n_br_95 n_br_96 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ95 ground ground n_br_96 ground ground ground vdd_lp ground memorycell
Xwire96 n_bl_96 n_bl_97 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ96 ground ground n_bl_97 ground ground ground vdd_lp ground memorycell
X2wire96 n_br_96 n_br_97 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ96 ground ground n_br_97 ground ground ground vdd_lp ground memorycell
Xwire97 n_bl_97 n_bl_98 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ97 ground ground n_bl_98 ground ground ground vdd_lp ground memorycell
X2wire97 n_br_97 n_br_98 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ97 ground ground n_br_98 ground ground ground vdd_lp ground memorycell
Xwire98 n_bl_98 n_bl_99 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ98 ground ground n_bl_99 ground ground ground vdd_lp ground memorycell
X2wire98 n_br_98 n_br_99 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ98 ground ground n_br_99 ground ground ground vdd_lp ground memorycell
Xwire99 n_bl_99 n_bl_100 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ99 ground ground n_bl_100 ground ground ground vdd_lp ground memorycell
X2wire99 n_br_99 n_br_100 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ99 ground ground n_br_100 ground ground ground vdd_lp ground memorycell
Xwire100 n_bl_100 n_bl_101 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ100 ground ground n_bl_101 ground ground ground vdd_lp ground memorycell
X2wire100 n_br_100 n_br_101 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ100 ground ground n_br_101 ground ground ground vdd_lp ground memorycell
Xwire101 n_bl_101 n_bl_102 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ101 ground ground n_bl_102 ground ground ground vdd_lp ground memorycell
X2wire101 n_br_101 n_br_102 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ101 ground ground n_br_102 ground ground ground vdd_lp ground memorycell
Xwire102 n_bl_102 n_bl_103 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ102 ground ground n_bl_103 ground ground ground vdd_lp ground memorycell
X2wire102 n_br_102 n_br_103 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ102 ground ground n_br_103 ground ground ground vdd_lp ground memorycell
Xwire103 n_bl_103 n_bl_104 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ103 ground ground n_bl_104 ground ground ground vdd_lp ground memorycell
X2wire103 n_br_103 n_br_104 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ103 ground ground n_br_104 ground ground ground vdd_lp ground memorycell
Xwire104 n_bl_104 n_bl_105 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ104 ground ground n_bl_105 ground ground ground vdd_lp ground memorycell
X2wire104 n_br_104 n_br_105 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ104 ground ground n_br_105 ground ground ground vdd_lp ground memorycell
Xwire105 n_bl_105 n_bl_106 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ105 ground ground n_bl_106 ground ground ground vdd_lp ground memorycell
X2wire105 n_br_105 n_br_106 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ105 ground ground n_br_106 ground ground ground vdd_lp ground memorycell
Xwire106 n_bl_106 n_bl_107 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ106 ground ground n_bl_107 ground ground ground vdd_lp ground memorycell
X2wire106 n_br_106 n_br_107 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ106 ground ground n_br_107 ground ground ground vdd_lp ground memorycell
Xwire107 n_bl_107 n_bl_108 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ107 ground ground n_bl_108 ground ground ground vdd_lp ground memorycell
X2wire107 n_br_107 n_br_108 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ107 ground ground n_br_108 ground ground ground vdd_lp ground memorycell
Xwire108 n_bl_108 n_bl_109 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ108 ground ground n_bl_109 ground ground ground vdd_lp ground memorycell
X2wire108 n_br_108 n_br_109 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ108 ground ground n_br_109 ground ground ground vdd_lp ground memorycell
Xwire109 n_bl_109 n_bl_110 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ109 ground ground n_bl_110 ground ground ground vdd_lp ground memorycell
X2wire109 n_br_109 n_br_110 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ109 ground ground n_br_110 ground ground ground vdd_lp ground memorycell
Xwire110 n_bl_110 n_bl_111 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ110 ground ground n_bl_111 ground ground ground vdd_lp ground memorycell
X2wire110 n_br_110 n_br_111 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ110 ground ground n_br_111 ground ground ground vdd_lp ground memorycell
Xwire111 n_bl_111 n_bl_112 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ111 ground ground n_bl_112 ground ground ground vdd_lp ground memorycell
X2wire111 n_br_111 n_br_112 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ111 ground ground n_br_112 ground ground ground vdd_lp ground memorycell
Xwire112 n_bl_112 n_bl_113 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ112 ground ground n_bl_113 ground ground ground vdd_lp ground memorycell
X2wire112 n_br_112 n_br_113 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ112 ground ground n_br_113 ground ground ground vdd_lp ground memorycell
Xwire113 n_bl_113 n_bl_114 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ113 ground ground n_bl_114 ground ground ground vdd_lp ground memorycell
X2wire113 n_br_113 n_br_114 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ113 ground ground n_br_114 ground ground ground vdd_lp ground memorycell
Xwire114 n_bl_114 n_bl_115 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ114 ground ground n_bl_115 ground ground ground vdd_lp ground memorycell
X2wire114 n_br_114 n_br_115 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ114 ground ground n_br_115 ground ground ground vdd_lp ground memorycell
Xwire115 n_bl_115 n_bl_116 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ115 ground ground n_bl_116 ground ground ground vdd_lp ground memorycell
X2wire115 n_br_115 n_br_116 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ115 ground ground n_br_116 ground ground ground vdd_lp ground memorycell
Xwire116 n_bl_116 n_bl_117 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ116 ground ground n_bl_117 ground ground ground vdd_lp ground memorycell
X2wire116 n_br_116 n_br_117 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ116 ground ground n_br_117 ground ground ground vdd_lp ground memorycell
Xwire117 n_bl_117 n_bl_118 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ117 ground ground n_bl_118 ground ground ground vdd_lp ground memorycell
X2wire117 n_br_117 n_br_118 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ117 ground ground n_br_118 ground ground ground vdd_lp ground memorycell
Xwire118 n_bl_118 n_bl_119 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ118 ground ground n_bl_119 ground ground ground vdd_lp ground memorycell
X2wire118 n_br_118 n_br_119 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ118 ground ground n_br_119 ground ground ground vdd_lp ground memorycell
Xwire119 n_bl_119 n_bl_120 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ119 ground ground n_bl_120 ground ground ground vdd_lp ground memorycell
X2wire119 n_br_119 n_br_120 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ119 ground ground n_br_120 ground ground ground vdd_lp ground memorycell
Xwire120 n_bl_120 n_bl_121 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ120 ground ground n_bl_121 ground ground ground vdd_lp ground memorycell
X2wire120 n_br_120 n_br_121 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ120 ground ground n_br_121 ground ground ground vdd_lp ground memorycell
Xwire121 n_bl_121 n_bl_122 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ121 ground ground n_bl_122 ground ground ground vdd_lp ground memorycell
X2wire121 n_br_121 n_br_122 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ121 ground ground n_br_122 ground ground ground vdd_lp ground memorycell
Xwire122 n_bl_122 n_bl_123 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ122 ground ground n_bl_123 ground ground ground vdd_lp ground memorycell
X2wire122 n_br_122 n_br_123 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ122 ground ground n_br_123 ground ground ground vdd_lp ground memorycell
Xwire123 n_bl_123 n_bl_124 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ123 ground ground n_bl_124 ground ground ground vdd_lp ground memorycell
X2wire123 n_br_123 n_br_124 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ123 ground ground n_br_124 ground ground ground vdd_lp ground memorycell
Xwire124 n_bl_124 n_bl_125 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ124 ground ground n_bl_125 ground ground ground vdd_lp ground memorycell
X2wire124 n_br_124 n_br_125 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ124 ground ground n_br_125 ground ground ground vdd_lp ground memorycell
Xwire125 n_bl_125 n_bl_126 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ125 ground ground n_bl_126 ground ground ground vdd_lp ground memorycell
X2wire125 n_br_125 n_br_126 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ125 ground ground n_br_126 ground ground ground vdd_lp ground memorycell
Xwire126 n_bl_126 n_bl_127 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ126 ground ground n_bl_127 ground ground ground vdd_lp ground memorycell
X2wire126 n_br_126 n_br_127 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ126 ground ground n_br_127 ground ground ground vdd_lp ground memorycell
Xwire127 n_bl_127 n_bl_128 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ127 ground ground n_bl_128 ground ground ground vdd_lp ground memorycell
X2wire127 n_br_127 n_br_128 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ127 ground ground n_br_128 ground ground ground vdd_lp ground memorycell
Xwire128 n_bl_128 n_bl_129 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ128 ground ground n_bl_129 ground ground ground vdd_lp ground memorycell
X2wire128 n_br_128 n_br_129 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ128 ground ground n_br_129 ground ground ground vdd_lp ground memorycell
Xwire129 n_bl_129 n_bl_130 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ129 ground ground n_bl_130 ground ground ground vdd_lp ground memorycell
X2wire129 n_br_129 n_br_130 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ129 ground ground n_br_130 ground ground ground vdd_lp ground memorycell
Xwire130 n_bl_130 n_bl_131 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ130 ground ground n_bl_131 ground ground ground vdd_lp ground memorycell
X2wire130 n_br_130 n_br_131 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ130 ground ground n_br_131 ground ground ground vdd_lp ground memorycell
Xwire131 n_bl_131 n_bl_132 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ131 ground ground n_bl_132 ground ground ground vdd_lp ground memorycell
X2wire131 n_br_131 n_br_132 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ131 ground ground n_br_132 ground ground ground vdd_lp ground memorycell
Xwire132 n_bl_132 n_bl_133 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ132 ground ground n_bl_133 ground ground ground vdd_lp ground memorycell
X2wire132 n_br_132 n_br_133 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ132 ground ground n_br_133 ground ground ground vdd_lp ground memorycell
Xwire133 n_bl_133 n_bl_134 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ133 ground ground n_bl_134 ground ground ground vdd_lp ground memorycell
X2wire133 n_br_133 n_br_134 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ133 ground ground n_br_134 ground ground ground vdd_lp ground memorycell
Xwire134 n_bl_134 n_bl_135 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ134 ground ground n_bl_135 ground ground ground vdd_lp ground memorycell
X2wire134 n_br_134 n_br_135 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ134 ground ground n_br_135 ground ground ground vdd_lp ground memorycell
Xwire135 n_bl_135 n_bl_136 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ135 ground ground n_bl_136 ground ground ground vdd_lp ground memorycell
X2wire135 n_br_135 n_br_136 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ135 ground ground n_br_136 ground ground ground vdd_lp ground memorycell
Xwire136 n_bl_136 n_bl_137 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ136 ground ground n_bl_137 ground ground ground vdd_lp ground memorycell
X2wire136 n_br_136 n_br_137 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ136 ground ground n_br_137 ground ground ground vdd_lp ground memorycell
Xwire137 n_bl_137 n_bl_138 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ137 ground ground n_bl_138 ground ground ground vdd_lp ground memorycell
X2wire137 n_br_137 n_br_138 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ137 ground ground n_br_138 ground ground ground vdd_lp ground memorycell
Xwire138 n_bl_138 n_bl_139 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ138 ground ground n_bl_139 ground ground ground vdd_lp ground memorycell
X2wire138 n_br_138 n_br_139 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ138 ground ground n_br_139 ground ground ground vdd_lp ground memorycell
Xwire139 n_bl_139 n_bl_140 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ139 ground ground n_bl_140 ground ground ground vdd_lp ground memorycell
X2wire139 n_br_139 n_br_140 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ139 ground ground n_br_140 ground ground ground vdd_lp ground memorycell
Xwire140 n_bl_140 n_bl_141 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ140 ground ground n_bl_141 ground ground ground vdd_lp ground memorycell
X2wire140 n_br_140 n_br_141 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ140 ground ground n_br_141 ground ground ground vdd_lp ground memorycell
Xwire141 n_bl_141 n_bl_142 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ141 ground ground n_bl_142 ground ground ground vdd_lp ground memorycell
X2wire141 n_br_141 n_br_142 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ141 ground ground n_br_142 ground ground ground vdd_lp ground memorycell
Xwire142 n_bl_142 n_bl_143 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ142 ground ground n_bl_143 ground ground ground vdd_lp ground memorycell
X2wire142 n_br_142 n_br_143 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ142 ground ground n_br_143 ground ground ground vdd_lp ground memorycell
Xwire143 n_bl_143 n_bl_144 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ143 ground ground n_bl_144 ground ground ground vdd_lp ground memorycell
X2wire143 n_br_143 n_br_144 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ143 ground ground n_br_144 ground ground ground vdd_lp ground memorycell
Xwire144 n_bl_144 n_bl_145 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ144 ground ground n_bl_145 ground ground ground vdd_lp ground memorycell
X2wire144 n_br_144 n_br_145 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ144 ground ground n_br_145 ground ground ground vdd_lp ground memorycell
Xwire145 n_bl_145 n_bl_146 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ145 ground ground n_bl_146 ground ground ground vdd_lp ground memorycell
X2wire145 n_br_145 n_br_146 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ145 ground ground n_br_146 ground ground ground vdd_lp ground memorycell
Xwire146 n_bl_146 n_bl_147 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ146 ground ground n_bl_147 ground ground ground vdd_lp ground memorycell
X2wire146 n_br_146 n_br_147 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ146 ground ground n_br_147 ground ground ground vdd_lp ground memorycell
Xwire147 n_bl_147 n_bl_148 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ147 ground ground n_bl_148 ground ground ground vdd_lp ground memorycell
X2wire147 n_br_147 n_br_148 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ147 ground ground n_br_148 ground ground ground vdd_lp ground memorycell
Xwire148 n_bl_148 n_bl_149 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ148 ground ground n_bl_149 ground ground ground vdd_lp ground memorycell
X2wire148 n_br_148 n_br_149 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ148 ground ground n_br_149 ground ground ground vdd_lp ground memorycell
Xwire149 n_bl_149 n_bl_150 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ149 ground ground n_bl_150 ground ground ground vdd_lp ground memorycell
X2wire149 n_br_149 n_br_150 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ149 ground ground n_br_150 ground ground ground vdd_lp ground memorycell
Xwire150 n_bl_150 n_bl_151 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ150 ground ground n_bl_151 ground ground ground vdd_lp ground memorycell
X2wire150 n_br_150 n_br_151 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ150 ground ground n_br_151 ground ground ground vdd_lp ground memorycell
Xwire151 n_bl_151 n_bl_152 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ151 ground ground n_bl_152 ground ground ground vdd_lp ground memorycell
X2wire151 n_br_151 n_br_152 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ151 ground ground n_br_152 ground ground ground vdd_lp ground memorycell
Xwire152 n_bl_152 n_bl_153 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ152 ground ground n_bl_153 ground ground ground vdd_lp ground memorycell
X2wire152 n_br_152 n_br_153 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ152 ground ground n_br_153 ground ground ground vdd_lp ground memorycell
Xwire153 n_bl_153 n_bl_154 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ153 ground ground n_bl_154 ground ground ground vdd_lp ground memorycell
X2wire153 n_br_153 n_br_154 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ153 ground ground n_br_154 ground ground ground vdd_lp ground memorycell
Xwire154 n_bl_154 n_bl_155 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ154 ground ground n_bl_155 ground ground ground vdd_lp ground memorycell
X2wire154 n_br_154 n_br_155 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ154 ground ground n_br_155 ground ground ground vdd_lp ground memorycell
Xwire155 n_bl_155 n_bl_156 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ155 ground ground n_bl_156 ground ground ground vdd_lp ground memorycell
X2wire155 n_br_155 n_br_156 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ155 ground ground n_br_156 ground ground ground vdd_lp ground memorycell
Xwire156 n_bl_156 n_bl_157 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ156 ground ground n_bl_157 ground ground ground vdd_lp ground memorycell
X2wire156 n_br_156 n_br_157 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ156 ground ground n_br_157 ground ground ground vdd_lp ground memorycell
Xwire157 n_bl_157 n_bl_158 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ157 ground ground n_bl_158 ground ground ground vdd_lp ground memorycell
X2wire157 n_br_157 n_br_158 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ157 ground ground n_br_158 ground ground ground vdd_lp ground memorycell
Xwire158 n_bl_158 n_bl_159 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ158 ground ground n_bl_159 ground ground ground vdd_lp ground memorycell
X2wire158 n_br_158 n_br_159 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ158 ground ground n_br_159 ground ground ground vdd_lp ground memorycell
Xwire159 n_bl_159 n_bl_160 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ159 ground ground n_bl_160 ground ground ground vdd_lp ground memorycell
X2wire159 n_br_159 n_br_160 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ159 ground ground n_br_160 ground ground ground vdd_lp ground memorycell
Xwire160 n_bl_160 n_bl_161 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ160 ground ground n_bl_161 ground ground ground vdd_lp ground memorycell
X2wire160 n_br_160 n_br_161 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ160 ground ground n_br_161 ground ground ground vdd_lp ground memorycell
Xwire161 n_bl_161 n_bl_162 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ161 ground ground n_bl_162 ground ground ground vdd_lp ground memorycell
X2wire161 n_br_161 n_br_162 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ161 ground ground n_br_162 ground ground ground vdd_lp ground memorycell
Xwire162 n_bl_162 n_bl_163 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ162 ground ground n_bl_163 ground ground ground vdd_lp ground memorycell
X2wire162 n_br_162 n_br_163 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ162 ground ground n_br_163 ground ground ground vdd_lp ground memorycell
Xwire163 n_bl_163 n_bl_164 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ163 ground ground n_bl_164 ground ground ground vdd_lp ground memorycell
X2wire163 n_br_163 n_br_164 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ163 ground ground n_br_164 ground ground ground vdd_lp ground memorycell
Xwire164 n_bl_164 n_bl_165 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ164 ground ground n_bl_165 ground ground ground vdd_lp ground memorycell
X2wire164 n_br_164 n_br_165 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ164 ground ground n_br_165 ground ground ground vdd_lp ground memorycell
Xwire165 n_bl_165 n_bl_166 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ165 ground ground n_bl_166 ground ground ground vdd_lp ground memorycell
X2wire165 n_br_165 n_br_166 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ165 ground ground n_br_166 ground ground ground vdd_lp ground memorycell
Xwire166 n_bl_166 n_bl_167 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ166 ground ground n_bl_167 ground ground ground vdd_lp ground memorycell
X2wire166 n_br_166 n_br_167 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ166 ground ground n_br_167 ground ground ground vdd_lp ground memorycell
Xwire167 n_bl_167 n_bl_168 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ167 ground ground n_bl_168 ground ground ground vdd_lp ground memorycell
X2wire167 n_br_167 n_br_168 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ167 ground ground n_br_168 ground ground ground vdd_lp ground memorycell
Xwire168 n_bl_168 n_bl_169 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ168 ground ground n_bl_169 ground ground ground vdd_lp ground memorycell
X2wire168 n_br_168 n_br_169 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ168 ground ground n_br_169 ground ground ground vdd_lp ground memorycell
Xwire169 n_bl_169 n_bl_170 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ169 ground ground n_bl_170 ground ground ground vdd_lp ground memorycell
X2wire169 n_br_169 n_br_170 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ169 ground ground n_br_170 ground ground ground vdd_lp ground memorycell
Xwire170 n_bl_170 n_bl_171 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ170 ground ground n_bl_171 ground ground ground vdd_lp ground memorycell
X2wire170 n_br_170 n_br_171 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ170 ground ground n_br_171 ground ground ground vdd_lp ground memorycell
Xwire171 n_bl_171 n_bl_172 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ171 ground ground n_bl_172 ground ground ground vdd_lp ground memorycell
X2wire171 n_br_171 n_br_172 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ171 ground ground n_br_172 ground ground ground vdd_lp ground memorycell
Xwire172 n_bl_172 n_bl_173 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ172 ground ground n_bl_173 ground ground ground vdd_lp ground memorycell
X2wire172 n_br_172 n_br_173 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ172 ground ground n_br_173 ground ground ground vdd_lp ground memorycell
Xwire173 n_bl_173 n_bl_174 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ173 ground ground n_bl_174 ground ground ground vdd_lp ground memorycell
X2wire173 n_br_173 n_br_174 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ173 ground ground n_br_174 ground ground ground vdd_lp ground memorycell
Xwire174 n_bl_174 n_bl_175 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ174 ground ground n_bl_175 ground ground ground vdd_lp ground memorycell
X2wire174 n_br_174 n_br_175 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ174 ground ground n_br_175 ground ground ground vdd_lp ground memorycell
Xwire175 n_bl_175 n_bl_176 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ175 ground ground n_bl_176 ground ground ground vdd_lp ground memorycell
X2wire175 n_br_175 n_br_176 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ175 ground ground n_br_176 ground ground ground vdd_lp ground memorycell
Xwire176 n_bl_176 n_bl_177 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ176 ground ground n_bl_177 ground ground ground vdd_lp ground memorycell
X2wire176 n_br_176 n_br_177 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ176 ground ground n_br_177 ground ground ground vdd_lp ground memorycell
Xwire177 n_bl_177 n_bl_178 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ177 ground ground n_bl_178 ground ground ground vdd_lp ground memorycell
X2wire177 n_br_177 n_br_178 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ177 ground ground n_br_178 ground ground ground vdd_lp ground memorycell
Xwire178 n_bl_178 n_bl_179 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ178 ground ground n_bl_179 ground ground ground vdd_lp ground memorycell
X2wire178 n_br_178 n_br_179 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ178 ground ground n_br_179 ground ground ground vdd_lp ground memorycell
Xwire179 n_bl_179 n_bl_180 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ179 ground ground n_bl_180 ground ground ground vdd_lp ground memorycell
X2wire179 n_br_179 n_br_180 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ179 ground ground n_br_180 ground ground ground vdd_lp ground memorycell
Xwire180 n_bl_180 n_bl_181 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ180 ground ground n_bl_181 ground ground ground vdd_lp ground memorycell
X2wire180 n_br_180 n_br_181 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ180 ground ground n_br_181 ground ground ground vdd_lp ground memorycell
Xwire181 n_bl_181 n_bl_182 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ181 ground ground n_bl_182 ground ground ground vdd_lp ground memorycell
X2wire181 n_br_181 n_br_182 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ181 ground ground n_br_182 ground ground ground vdd_lp ground memorycell
Xwire182 n_bl_182 n_bl_183 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ182 ground ground n_bl_183 ground ground ground vdd_lp ground memorycell
X2wire182 n_br_182 n_br_183 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ182 ground ground n_br_183 ground ground ground vdd_lp ground memorycell
Xwire183 n_bl_183 n_bl_184 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ183 ground ground n_bl_184 ground ground ground vdd_lp ground memorycell
X2wire183 n_br_183 n_br_184 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ183 ground ground n_br_184 ground ground ground vdd_lp ground memorycell
Xwire184 n_bl_184 n_bl_185 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ184 ground ground n_bl_185 ground ground ground vdd_lp ground memorycell
X2wire184 n_br_184 n_br_185 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ184 ground ground n_br_185 ground ground ground vdd_lp ground memorycell
Xwire185 n_bl_185 n_bl_186 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ185 ground ground n_bl_186 ground ground ground vdd_lp ground memorycell
X2wire185 n_br_185 n_br_186 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ185 ground ground n_br_186 ground ground ground vdd_lp ground memorycell
Xwire186 n_bl_186 n_bl_187 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ186 ground ground n_bl_187 ground ground ground vdd_lp ground memorycell
X2wire186 n_br_186 n_br_187 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ186 ground ground n_br_187 ground ground ground vdd_lp ground memorycell
Xwire187 n_bl_187 n_bl_188 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ187 ground ground n_bl_188 ground ground ground vdd_lp ground memorycell
X2wire187 n_br_187 n_br_188 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ187 ground ground n_br_188 ground ground ground vdd_lp ground memorycell
Xwire188 n_bl_188 n_bl_189 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ188 ground ground n_bl_189 ground ground ground vdd_lp ground memorycell
X2wire188 n_br_188 n_br_189 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ188 ground ground n_br_189 ground ground ground vdd_lp ground memorycell
Xwire189 n_bl_189 n_bl_190 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ189 ground ground n_bl_190 ground ground ground vdd_lp ground memorycell
X2wire189 n_br_189 n_br_190 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ189 ground ground n_br_190 ground ground ground vdd_lp ground memorycell
Xwire190 n_bl_190 n_bl_191 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ190 ground ground n_bl_191 ground ground ground vdd_lp ground memorycell
X2wire190 n_br_190 n_br_191 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ190 ground ground n_br_191 ground ground ground vdd_lp ground memorycell
Xwire191 n_bl_191 n_bl_192 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ191 ground ground n_bl_192 ground ground ground vdd_lp ground memorycell
X2wire191 n_br_191 n_br_192 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ191 ground ground n_br_192 ground ground ground vdd_lp ground memorycell
Xwire192 n_bl_192 n_bl_193 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ192 ground ground n_bl_193 ground ground ground vdd_lp ground memorycell
X2wire192 n_br_192 n_br_193 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ192 ground ground n_br_193 ground ground ground vdd_lp ground memorycell
Xwire193 n_bl_193 n_bl_194 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ193 ground ground n_bl_194 ground ground ground vdd_lp ground memorycell
X2wire193 n_br_193 n_br_194 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ193 ground ground n_br_194 ground ground ground vdd_lp ground memorycell
Xwire194 n_bl_194 n_bl_195 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ194 ground ground n_bl_195 ground ground ground vdd_lp ground memorycell
X2wire194 n_br_194 n_br_195 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ194 ground ground n_br_195 ground ground ground vdd_lp ground memorycell
Xwire195 n_bl_195 n_bl_196 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ195 ground ground n_bl_196 ground ground ground vdd_lp ground memorycell
X2wire195 n_br_195 n_br_196 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ195 ground ground n_br_196 ground ground ground vdd_lp ground memorycell
Xwire196 n_bl_196 n_bl_197 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ196 ground ground n_bl_197 ground ground ground vdd_lp ground memorycell
X2wire196 n_br_196 n_br_197 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ196 ground ground n_br_197 ground ground ground vdd_lp ground memorycell
Xwire197 n_bl_197 n_bl_198 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ197 ground ground n_bl_198 ground ground ground vdd_lp ground memorycell
X2wire197 n_br_197 n_br_198 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ197 ground ground n_br_198 ground ground ground vdd_lp ground memorycell
Xwire198 n_bl_198 n_bl_199 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ198 ground ground n_bl_199 ground ground ground vdd_lp ground memorycell
X2wire198 n_br_198 n_br_199 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ198 ground ground n_br_199 ground ground ground vdd_lp ground memorycell
Xwire199 n_bl_199 n_bl_200 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ199 ground ground n_bl_200 ground ground ground vdd_lp ground memorycell
X2wire199 n_br_199 n_br_200 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ199 ground ground n_br_200 ground ground ground vdd_lp ground memorycell
Xwire200 n_bl_200 n_bl_201 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ200 ground ground n_bl_201 ground ground ground vdd_lp ground memorycell
X2wire200 n_br_200 n_br_201 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ200 ground ground n_br_201 ground ground ground vdd_lp ground memorycell
Xwire201 n_bl_201 n_bl_202 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ201 ground ground n_bl_202 ground ground ground vdd_lp ground memorycell
X2wire201 n_br_201 n_br_202 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ201 ground ground n_br_202 ground ground ground vdd_lp ground memorycell
Xwire202 n_bl_202 n_bl_203 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ202 ground ground n_bl_203 ground ground ground vdd_lp ground memorycell
X2wire202 n_br_202 n_br_203 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ202 ground ground n_br_203 ground ground ground vdd_lp ground memorycell
Xwire203 n_bl_203 n_bl_204 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ203 ground ground n_bl_204 ground ground ground vdd_lp ground memorycell
X2wire203 n_br_203 n_br_204 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ203 ground ground n_br_204 ground ground ground vdd_lp ground memorycell
Xwire204 n_bl_204 n_bl_205 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ204 ground ground n_bl_205 ground ground ground vdd_lp ground memorycell
X2wire204 n_br_204 n_br_205 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ204 ground ground n_br_205 ground ground ground vdd_lp ground memorycell
Xwire205 n_bl_205 n_bl_206 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ205 ground ground n_bl_206 ground ground ground vdd_lp ground memorycell
X2wire205 n_br_205 n_br_206 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ205 ground ground n_br_206 ground ground ground vdd_lp ground memorycell
Xwire206 n_bl_206 n_bl_207 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ206 ground ground n_bl_207 ground ground ground vdd_lp ground memorycell
X2wire206 n_br_206 n_br_207 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ206 ground ground n_br_207 ground ground ground vdd_lp ground memorycell
Xwire207 n_bl_207 n_bl_208 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ207 ground ground n_bl_208 ground ground ground vdd_lp ground memorycell
X2wire207 n_br_207 n_br_208 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ207 ground ground n_br_208 ground ground ground vdd_lp ground memorycell
Xwire208 n_bl_208 n_bl_209 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ208 ground ground n_bl_209 ground ground ground vdd_lp ground memorycell
X2wire208 n_br_208 n_br_209 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ208 ground ground n_br_209 ground ground ground vdd_lp ground memorycell
Xwire209 n_bl_209 n_bl_210 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ209 ground ground n_bl_210 ground ground ground vdd_lp ground memorycell
X2wire209 n_br_209 n_br_210 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ209 ground ground n_br_210 ground ground ground vdd_lp ground memorycell
Xwire210 n_bl_210 n_bl_211 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ210 ground ground n_bl_211 ground ground ground vdd_lp ground memorycell
X2wire210 n_br_210 n_br_211 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ210 ground ground n_br_211 ground ground ground vdd_lp ground memorycell
Xwire211 n_bl_211 n_bl_212 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ211 ground ground n_bl_212 ground ground ground vdd_lp ground memorycell
X2wire211 n_br_211 n_br_212 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ211 ground ground n_br_212 ground ground ground vdd_lp ground memorycell
Xwire212 n_bl_212 n_bl_213 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ212 ground ground n_bl_213 ground ground ground vdd_lp ground memorycell
X2wire212 n_br_212 n_br_213 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ212 ground ground n_br_213 ground ground ground vdd_lp ground memorycell
Xwire213 n_bl_213 n_bl_214 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ213 ground ground n_bl_214 ground ground ground vdd_lp ground memorycell
X2wire213 n_br_213 n_br_214 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ213 ground ground n_br_214 ground ground ground vdd_lp ground memorycell
Xwire214 n_bl_214 n_bl_215 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ214 ground ground n_bl_215 ground ground ground vdd_lp ground memorycell
X2wire214 n_br_214 n_br_215 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ214 ground ground n_br_215 ground ground ground vdd_lp ground memorycell
Xwire215 n_bl_215 n_bl_216 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ215 ground ground n_bl_216 ground ground ground vdd_lp ground memorycell
X2wire215 n_br_215 n_br_216 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ215 ground ground n_br_216 ground ground ground vdd_lp ground memorycell
Xwire216 n_bl_216 n_bl_217 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ216 ground ground n_bl_217 ground ground ground vdd_lp ground memorycell
X2wire216 n_br_216 n_br_217 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ216 ground ground n_br_217 ground ground ground vdd_lp ground memorycell
Xwire217 n_bl_217 n_bl_218 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ217 ground ground n_bl_218 ground ground ground vdd_lp ground memorycell
X2wire217 n_br_217 n_br_218 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ217 ground ground n_br_218 ground ground ground vdd_lp ground memorycell
Xwire218 n_bl_218 n_bl_219 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ218 ground ground n_bl_219 ground ground ground vdd_lp ground memorycell
X2wire218 n_br_218 n_br_219 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ218 ground ground n_br_219 ground ground ground vdd_lp ground memorycell
Xwire219 n_bl_219 n_bl_220 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ219 ground ground n_bl_220 ground ground ground vdd_lp ground memorycell
X2wire219 n_br_219 n_br_220 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ219 ground ground n_br_220 ground ground ground vdd_lp ground memorycell
Xwire220 n_bl_220 n_bl_221 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ220 ground ground n_bl_221 ground ground ground vdd_lp ground memorycell
X2wire220 n_br_220 n_br_221 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ220 ground ground n_br_221 ground ground ground vdd_lp ground memorycell
Xwire221 n_bl_221 n_bl_222 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ221 ground ground n_bl_222 ground ground ground vdd_lp ground memorycell
X2wire221 n_br_221 n_br_222 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ221 ground ground n_br_222 ground ground ground vdd_lp ground memorycell
Xwire222 n_bl_222 n_bl_223 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ222 ground ground n_bl_223 ground ground ground vdd_lp ground memorycell
X2wire222 n_br_222 n_br_223 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ222 ground ground n_br_223 ground ground ground vdd_lp ground memorycell
Xwire223 n_bl_223 n_bl_224 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ223 ground ground n_bl_224 ground ground ground vdd_lp ground memorycell
X2wire223 n_br_223 n_br_224 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ223 ground ground n_br_224 ground ground ground vdd_lp ground memorycell
Xwire224 n_bl_224 n_bl_225 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ224 ground ground n_bl_225 ground ground ground vdd_lp ground memorycell
X2wire224 n_br_224 n_br_225 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ224 ground ground n_br_225 ground ground ground vdd_lp ground memorycell
Xwire225 n_bl_225 n_bl_226 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ225 ground ground n_bl_226 ground ground ground vdd_lp ground memorycell
X2wire225 n_br_225 n_br_226 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ225 ground ground n_br_226 ground ground ground vdd_lp ground memorycell
Xwire226 n_bl_226 n_bl_227 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ226 ground ground n_bl_227 ground ground ground vdd_lp ground memorycell
X2wire226 n_br_226 n_br_227 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ226 ground ground n_br_227 ground ground ground vdd_lp ground memorycell
Xwire227 n_bl_227 n_bl_228 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ227 ground ground n_bl_228 ground ground ground vdd_lp ground memorycell
X2wire227 n_br_227 n_br_228 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ227 ground ground n_br_228 ground ground ground vdd_lp ground memorycell
Xwire228 n_bl_228 n_bl_229 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ228 ground ground n_bl_229 ground ground ground vdd_lp ground memorycell
X2wire228 n_br_228 n_br_229 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ228 ground ground n_br_229 ground ground ground vdd_lp ground memorycell
Xwire229 n_bl_229 n_bl_230 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ229 ground ground n_bl_230 ground ground ground vdd_lp ground memorycell
X2wire229 n_br_229 n_br_230 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ229 ground ground n_br_230 ground ground ground vdd_lp ground memorycell
Xwire230 n_bl_230 n_bl_231 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ230 ground ground n_bl_231 ground ground ground vdd_lp ground memorycell
X2wire230 n_br_230 n_br_231 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ230 ground ground n_br_231 ground ground ground vdd_lp ground memorycell
Xwire231 n_bl_231 n_bl_232 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ231 ground ground n_bl_232 ground ground ground vdd_lp ground memorycell
X2wire231 n_br_231 n_br_232 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ231 ground ground n_br_232 ground ground ground vdd_lp ground memorycell
Xwire232 n_bl_232 n_bl_233 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ232 ground ground n_bl_233 ground ground ground vdd_lp ground memorycell
X2wire232 n_br_232 n_br_233 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ232 ground ground n_br_233 ground ground ground vdd_lp ground memorycell
Xwire233 n_bl_233 n_bl_234 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ233 ground ground n_bl_234 ground ground ground vdd_lp ground memorycell
X2wire233 n_br_233 n_br_234 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ233 ground ground n_br_234 ground ground ground vdd_lp ground memorycell
Xwire234 n_bl_234 n_bl_235 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ234 ground ground n_bl_235 ground ground ground vdd_lp ground memorycell
X2wire234 n_br_234 n_br_235 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ234 ground ground n_br_235 ground ground ground vdd_lp ground memorycell
Xwire235 n_bl_235 n_bl_236 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ235 ground ground n_bl_236 ground ground ground vdd_lp ground memorycell
X2wire235 n_br_235 n_br_236 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ235 ground ground n_br_236 ground ground ground vdd_lp ground memorycell
Xwire236 n_bl_236 n_bl_237 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ236 ground ground n_bl_237 ground ground ground vdd_lp ground memorycell
X2wire236 n_br_236 n_br_237 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ236 ground ground n_br_237 ground ground ground vdd_lp ground memorycell
Xwire237 n_bl_237 n_bl_238 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ237 ground ground n_bl_238 ground ground ground vdd_lp ground memorycell
X2wire237 n_br_237 n_br_238 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ237 ground ground n_br_238 ground ground ground vdd_lp ground memorycell
Xwire238 n_bl_238 n_bl_239 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ238 ground ground n_bl_239 ground ground ground vdd_lp ground memorycell
X2wire238 n_br_238 n_br_239 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ238 ground ground n_br_239 ground ground ground vdd_lp ground memorycell
Xwire239 n_bl_239 n_bl_240 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ239 ground ground n_bl_240 ground ground ground vdd_lp ground memorycell
X2wire239 n_br_239 n_br_240 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ239 ground ground n_br_240 ground ground ground vdd_lp ground memorycell
Xwire240 n_bl_240 n_bl_241 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ240 ground ground n_bl_241 ground ground ground vdd_lp ground memorycell
X2wire240 n_br_240 n_br_241 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ240 ground ground n_br_241 ground ground ground vdd_lp ground memorycell
Xwire241 n_bl_241 n_bl_242 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ241 ground ground n_bl_242 ground ground ground vdd_lp ground memorycell
X2wire241 n_br_241 n_br_242 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ241 ground ground n_br_242 ground ground ground vdd_lp ground memorycell
Xwire242 n_bl_242 n_bl_243 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ242 ground ground n_bl_243 ground ground ground vdd_lp ground memorycell
X2wire242 n_br_242 n_br_243 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ242 ground ground n_br_243 ground ground ground vdd_lp ground memorycell
Xwire243 n_bl_243 n_bl_244 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ243 ground ground n_bl_244 ground ground ground vdd_lp ground memorycell
X2wire243 n_br_243 n_br_244 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ243 ground ground n_br_244 ground ground ground vdd_lp ground memorycell
Xwire244 n_bl_244 n_bl_245 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ244 ground ground n_bl_245 ground ground ground vdd_lp ground memorycell
X2wire244 n_br_244 n_br_245 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ244 ground ground n_br_245 ground ground ground vdd_lp ground memorycell
Xwire245 n_bl_245 n_bl_246 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ245 ground ground n_bl_246 ground ground ground vdd_lp ground memorycell
X2wire245 n_br_245 n_br_246 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ245 ground ground n_br_246 ground ground ground vdd_lp ground memorycell
Xwire246 n_bl_246 n_bl_247 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ246 ground ground n_bl_247 ground ground ground vdd_lp ground memorycell
X2wire246 n_br_246 n_br_247 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ246 ground ground n_br_247 ground ground ground vdd_lp ground memorycell
Xwire247 n_bl_247 n_bl_248 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ247 ground ground n_bl_248 ground ground ground vdd_lp ground memorycell
X2wire247 n_br_247 n_br_248 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ247 ground ground n_br_248 ground ground ground vdd_lp ground memorycell
Xwire248 n_bl_248 n_bl_249 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ248 ground ground n_bl_249 ground ground ground vdd_lp ground memorycell
X2wire248 n_br_248 n_br_249 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ248 ground ground n_br_249 ground ground ground vdd_lp ground memorycell
Xwire249 n_bl_249 n_bl_250 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ249 ground ground n_bl_250 ground ground ground vdd_lp ground memorycell
X2wire249 n_br_249 n_br_250 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ249 ground ground n_br_250 ground ground ground vdd_lp ground memorycell
Xwire250 n_bl_250 n_bl_251 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ250 ground ground n_bl_251 ground ground ground vdd_lp ground memorycell
X2wire250 n_br_250 n_br_251 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ250 ground ground n_br_251 ground ground ground vdd_lp ground memorycell
Xwire251 n_bl_251 n_bl_252 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ251 ground ground n_bl_252 ground ground ground vdd_lp ground memorycell
X2wire251 n_br_251 n_br_252 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ251 ground ground n_br_252 ground ground ground vdd_lp ground memorycell
Xwire252 n_bl_252 n_bl_253 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ252 ground ground n_bl_253 ground ground ground vdd_lp ground memorycell
X2wire252 n_br_252 n_br_253 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ252 ground ground n_br_253 ground ground ground vdd_lp ground memorycell
Xwire253 n_bl_253 n_bl_254 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ253 ground ground n_bl_254 ground ground ground vdd_lp ground memorycell
X2wire253 n_br_253 n_br_254 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ253 ground ground n_br_254 ground ground ground vdd_lp ground memorycell
Xwire254 n_bl_254 n_bl_255 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ254 ground ground n_bl_255 ground ground ground vdd_lp ground memorycell
X2wire254 n_br_254 n_br_255 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ254 ground ground n_br_255 ground ground ground vdd_lp ground memorycell
Xwire255 n_bl_255 n_bl_256 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ255 ground ground n_bl_256 ground ground ground vdd_lp ground memorycell
X2wire255 n_br_255 n_br_256 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ255 ground ground n_br_256 ground ground ground vdd_lp ground memorycell
Xwire256 n_bl_256 n_bl_257 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ256 ground ground n_bl_257 ground ground ground vdd_lp ground memorycell
X2wire256 n_br_256 n_br_257 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ256 ground ground n_br_257 ground ground ground vdd_lp ground memorycell
Xwire257 n_bl_257 n_bl_258 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ257 ground ground n_bl_258 ground ground ground vdd_lp ground memorycell
X2wire257 n_br_257 n_br_258 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ257 ground ground n_br_258 ground ground ground vdd_lp ground memorycell
Xwire258 n_bl_258 n_bl_259 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ258 ground ground n_bl_259 ground ground ground vdd_lp ground memorycell
X2wire258 n_br_258 n_br_259 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ258 ground ground n_br_259 ground ground ground vdd_lp ground memorycell
Xwire259 n_bl_259 n_bl_260 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ259 ground ground n_bl_260 ground ground ground vdd_lp ground memorycell
X2wire259 n_br_259 n_br_260 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ259 ground ground n_br_260 ground ground ground vdd_lp ground memorycell
Xwire260 n_bl_260 n_bl_261 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ260 ground ground n_bl_261 ground ground ground vdd_lp ground memorycell
X2wire260 n_br_260 n_br_261 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ260 ground ground n_br_261 ground ground ground vdd_lp ground memorycell
Xwire261 n_bl_261 n_bl_262 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ261 ground ground n_bl_262 ground ground ground vdd_lp ground memorycell
X2wire261 n_br_261 n_br_262 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ261 ground ground n_br_262 ground ground ground vdd_lp ground memorycell
Xwire262 n_bl_262 n_bl_263 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ262 ground ground n_bl_263 ground ground ground vdd_lp ground memorycell
X2wire262 n_br_262 n_br_263 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ262 ground ground n_br_263 ground ground ground vdd_lp ground memorycell
Xwire263 n_bl_263 n_bl_264 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ263 ground ground n_bl_264 ground ground ground vdd_lp ground memorycell
X2wire263 n_br_263 n_br_264 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ263 ground ground n_br_264 ground ground ground vdd_lp ground memorycell
Xwire264 n_bl_264 n_bl_265 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ264 ground ground n_bl_265 ground ground ground vdd_lp ground memorycell
X2wire264 n_br_264 n_br_265 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ264 ground ground n_br_265 ground ground ground vdd_lp ground memorycell
Xwire265 n_bl_265 n_bl_266 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ265 ground ground n_bl_266 ground ground ground vdd_lp ground memorycell
X2wire265 n_br_265 n_br_266 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ265 ground ground n_br_266 ground ground ground vdd_lp ground memorycell
Xwire266 n_bl_266 n_bl_267 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ266 ground ground n_bl_267 ground ground ground vdd_lp ground memorycell
X2wire266 n_br_266 n_br_267 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ266 ground ground n_br_267 ground ground ground vdd_lp ground memorycell
Xwire267 n_bl_267 n_bl_268 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ267 ground ground n_bl_268 ground ground ground vdd_lp ground memorycell
X2wire267 n_br_267 n_br_268 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ267 ground ground n_br_268 ground ground ground vdd_lp ground memorycell
Xwire268 n_bl_268 n_bl_269 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ268 ground ground n_bl_269 ground ground ground vdd_lp ground memorycell
X2wire268 n_br_268 n_br_269 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ268 ground ground n_br_269 ground ground ground vdd_lp ground memorycell
Xwire269 n_bl_269 n_bl_270 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ269 ground ground n_bl_270 ground ground ground vdd_lp ground memorycell
X2wire269 n_br_269 n_br_270 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ269 ground ground n_br_270 ground ground ground vdd_lp ground memorycell
Xwire270 n_bl_270 n_bl_271 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ270 ground ground n_bl_271 ground ground ground vdd_lp ground memorycell
X2wire270 n_br_270 n_br_271 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ270 ground ground n_br_271 ground ground ground vdd_lp ground memorycell
Xwire271 n_bl_271 n_bl_272 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ271 ground ground n_bl_272 ground ground ground vdd_lp ground memorycell
X2wire271 n_br_271 n_br_272 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ271 ground ground n_br_272 ground ground ground vdd_lp ground memorycell
Xwire272 n_bl_272 n_bl_273 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ272 ground ground n_bl_273 ground ground ground vdd_lp ground memorycell
X2wire272 n_br_272 n_br_273 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ272 ground ground n_br_273 ground ground ground vdd_lp ground memorycell
Xwire273 n_bl_273 n_bl_274 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ273 ground ground n_bl_274 ground ground ground vdd_lp ground memorycell
X2wire273 n_br_273 n_br_274 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ273 ground ground n_br_274 ground ground ground vdd_lp ground memorycell
Xwire274 n_bl_274 n_bl_275 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ274 ground ground n_bl_275 ground ground ground vdd_lp ground memorycell
X2wire274 n_br_274 n_br_275 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ274 ground ground n_br_275 ground ground ground vdd_lp ground memorycell
Xwire275 n_bl_275 n_bl_276 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ275 ground ground n_bl_276 ground ground ground vdd_lp ground memorycell
X2wire275 n_br_275 n_br_276 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ275 ground ground n_br_276 ground ground ground vdd_lp ground memorycell
Xwire276 n_bl_276 n_bl_277 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ276 ground ground n_bl_277 ground ground ground vdd_lp ground memorycell
X2wire276 n_br_276 n_br_277 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ276 ground ground n_br_277 ground ground ground vdd_lp ground memorycell
Xwire277 n_bl_277 n_bl_278 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ277 ground ground n_bl_278 ground ground ground vdd_lp ground memorycell
X2wire277 n_br_277 n_br_278 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ277 ground ground n_br_278 ground ground ground vdd_lp ground memorycell
Xwire278 n_bl_278 n_bl_279 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ278 ground ground n_bl_279 ground ground ground vdd_lp ground memorycell
X2wire278 n_br_278 n_br_279 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ278 ground ground n_br_279 ground ground ground vdd_lp ground memorycell
Xwire279 n_bl_279 n_bl_280 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ279 ground ground n_bl_280 ground ground ground vdd_lp ground memorycell
X2wire279 n_br_279 n_br_280 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ279 ground ground n_br_280 ground ground ground vdd_lp ground memorycell
Xwire280 n_bl_280 n_bl_281 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ280 ground ground n_bl_281 ground ground ground vdd_lp ground memorycell
X2wire280 n_br_280 n_br_281 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ280 ground ground n_br_281 ground ground ground vdd_lp ground memorycell
Xwire281 n_bl_281 n_bl_282 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ281 ground ground n_bl_282 ground ground ground vdd_lp ground memorycell
X2wire281 n_br_281 n_br_282 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ281 ground ground n_br_282 ground ground ground vdd_lp ground memorycell
Xwire282 n_bl_282 n_bl_283 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ282 ground ground n_bl_283 ground ground ground vdd_lp ground memorycell
X2wire282 n_br_282 n_br_283 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ282 ground ground n_br_283 ground ground ground vdd_lp ground memorycell
Xwire283 n_bl_283 n_bl_284 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ283 ground ground n_bl_284 ground ground ground vdd_lp ground memorycell
X2wire283 n_br_283 n_br_284 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ283 ground ground n_br_284 ground ground ground vdd_lp ground memorycell
Xwire284 n_bl_284 n_bl_285 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ284 ground ground n_bl_285 ground ground ground vdd_lp ground memorycell
X2wire284 n_br_284 n_br_285 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ284 ground ground n_br_285 ground ground ground vdd_lp ground memorycell
Xwire285 n_bl_285 n_bl_286 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ285 ground ground n_bl_286 ground ground ground vdd_lp ground memorycell
X2wire285 n_br_285 n_br_286 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ285 ground ground n_br_286 ground ground ground vdd_lp ground memorycell
Xwire286 n_bl_286 n_bl_287 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ286 ground ground n_bl_287 ground ground ground vdd_lp ground memorycell
X2wire286 n_br_286 n_br_287 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ286 ground ground n_br_287 ground ground ground vdd_lp ground memorycell
Xwire287 n_bl_287 n_bl_288 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ287 ground ground n_bl_288 ground ground ground vdd_lp ground memorycell
X2wire287 n_br_287 n_br_288 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ287 ground ground n_br_288 ground ground ground vdd_lp ground memorycell
Xwire288 n_bl_288 n_bl_289 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ288 ground ground n_bl_289 ground ground ground vdd_lp ground memorycell
X2wire288 n_br_288 n_br_289 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ288 ground ground n_br_289 ground ground ground vdd_lp ground memorycell
Xwire289 n_bl_289 n_bl_290 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ289 ground ground n_bl_290 ground ground ground vdd_lp ground memorycell
X2wire289 n_br_289 n_br_290 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ289 ground ground n_br_290 ground ground ground vdd_lp ground memorycell
Xwire290 n_bl_290 n_bl_291 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ290 ground ground n_bl_291 ground ground ground vdd_lp ground memorycell
X2wire290 n_br_290 n_br_291 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ290 ground ground n_br_291 ground ground ground vdd_lp ground memorycell
Xwire291 n_bl_291 n_bl_292 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ291 ground ground n_bl_292 ground ground ground vdd_lp ground memorycell
X2wire291 n_br_291 n_br_292 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ291 ground ground n_br_292 ground ground ground vdd_lp ground memorycell
Xwire292 n_bl_292 n_bl_293 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ292 ground ground n_bl_293 ground ground ground vdd_lp ground memorycell
X2wire292 n_br_292 n_br_293 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ292 ground ground n_br_293 ground ground ground vdd_lp ground memorycell
Xwire293 n_bl_293 n_bl_294 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ293 ground ground n_bl_294 ground ground ground vdd_lp ground memorycell
X2wire293 n_br_293 n_br_294 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ293 ground ground n_br_294 ground ground ground vdd_lp ground memorycell
Xwire294 n_bl_294 n_bl_295 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ294 ground ground n_bl_295 ground ground ground vdd_lp ground memorycell
X2wire294 n_br_294 n_br_295 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ294 ground ground n_br_295 ground ground ground vdd_lp ground memorycell
Xwire295 n_bl_295 n_bl_296 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ295 ground ground n_bl_296 ground ground ground vdd_lp ground memorycell
X2wire295 n_br_295 n_br_296 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ295 ground ground n_br_296 ground ground ground vdd_lp ground memorycell
Xwire296 n_bl_296 n_bl_297 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ296 ground ground n_bl_297 ground ground ground vdd_lp ground memorycell
X2wire296 n_br_296 n_br_297 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ296 ground ground n_br_297 ground ground ground vdd_lp ground memorycell
Xwire297 n_bl_297 n_bl_298 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ297 ground ground n_bl_298 ground ground ground vdd_lp ground memorycell
X2wire297 n_br_297 n_br_298 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ297 ground ground n_br_298 ground ground ground vdd_lp ground memorycell
Xwire298 n_bl_298 n_bl_299 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ298 ground ground n_bl_299 ground ground ground vdd_lp ground memorycell
X2wire298 n_br_298 n_br_299 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ298 ground ground n_br_299 ground ground ground vdd_lp ground memorycell
Xwire299 n_bl_299 n_bl_300 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ299 ground ground n_bl_300 ground ground ground vdd_lp ground memorycell
X2wire299 n_br_299 n_br_300 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ299 ground ground n_br_300 ground ground ground vdd_lp ground memorycell
Xwire300 n_bl_300 n_bl_301 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ300 ground ground n_bl_301 ground ground ground vdd_lp ground memorycell
X2wire300 n_br_300 n_br_301 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ300 ground ground n_br_301 ground ground ground vdd_lp ground memorycell
Xwire301 n_bl_301 n_bl_302 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ301 ground ground n_bl_302 ground ground ground vdd_lp ground memorycell
X2wire301 n_br_301 n_br_302 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ301 ground ground n_br_302 ground ground ground vdd_lp ground memorycell
Xwire302 n_bl_302 n_bl_303 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ302 ground ground n_bl_303 ground ground ground vdd_lp ground memorycell
X2wire302 n_br_302 n_br_303 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ302 ground ground n_br_303 ground ground ground vdd_lp ground memorycell
Xwire303 n_bl_303 n_bl_304 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ303 ground ground n_bl_304 ground ground ground vdd_lp ground memorycell
X2wire303 n_br_303 n_br_304 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ303 ground ground n_br_304 ground ground ground vdd_lp ground memorycell
Xwire304 n_bl_304 n_bl_305 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ304 ground ground n_bl_305 ground ground ground vdd_lp ground memorycell
X2wire304 n_br_304 n_br_305 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ304 ground ground n_br_305 ground ground ground vdd_lp ground memorycell
Xwire305 n_bl_305 n_bl_306 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ305 ground ground n_bl_306 ground ground ground vdd_lp ground memorycell
X2wire305 n_br_305 n_br_306 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ305 ground ground n_br_306 ground ground ground vdd_lp ground memorycell
Xwire306 n_bl_306 n_bl_307 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ306 ground ground n_bl_307 ground ground ground vdd_lp ground memorycell
X2wire306 n_br_306 n_br_307 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ306 ground ground n_br_307 ground ground ground vdd_lp ground memorycell
Xwire307 n_bl_307 n_bl_308 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ307 ground ground n_bl_308 ground ground ground vdd_lp ground memorycell
X2wire307 n_br_307 n_br_308 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ307 ground ground n_br_308 ground ground ground vdd_lp ground memorycell
Xwire308 n_bl_308 n_bl_309 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ308 ground ground n_bl_309 ground ground ground vdd_lp ground memorycell
X2wire308 n_br_308 n_br_309 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ308 ground ground n_br_309 ground ground ground vdd_lp ground memorycell
Xwire309 n_bl_309 n_bl_310 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ309 ground ground n_bl_310 ground ground ground vdd_lp ground memorycell
X2wire309 n_br_309 n_br_310 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ309 ground ground n_br_310 ground ground ground vdd_lp ground memorycell
Xwire310 n_bl_310 n_bl_311 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ310 ground ground n_bl_311 ground ground ground vdd_lp ground memorycell
X2wire310 n_br_310 n_br_311 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ310 ground ground n_br_311 ground ground ground vdd_lp ground memorycell
Xwire311 n_bl_311 n_bl_312 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ311 ground ground n_bl_312 ground ground ground vdd_lp ground memorycell
X2wire311 n_br_311 n_br_312 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ311 ground ground n_br_312 ground ground ground vdd_lp ground memorycell
Xwire312 n_bl_312 n_bl_313 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ312 ground ground n_bl_313 ground ground ground vdd_lp ground memorycell
X2wire312 n_br_312 n_br_313 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ312 ground ground n_br_313 ground ground ground vdd_lp ground memorycell
Xwire313 n_bl_313 n_bl_314 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ313 ground ground n_bl_314 ground ground ground vdd_lp ground memorycell
X2wire313 n_br_313 n_br_314 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ313 ground ground n_br_314 ground ground ground vdd_lp ground memorycell
Xwire314 n_bl_314 n_bl_315 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ314 ground ground n_bl_315 ground ground ground vdd_lp ground memorycell
X2wire314 n_br_314 n_br_315 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ314 ground ground n_br_315 ground ground ground vdd_lp ground memorycell
Xwire315 n_bl_315 n_bl_316 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ315 ground ground n_bl_316 ground ground ground vdd_lp ground memorycell
X2wire315 n_br_315 n_br_316 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ315 ground ground n_br_316 ground ground ground vdd_lp ground memorycell
Xwire316 n_bl_316 n_bl_317 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ316 ground ground n_bl_317 ground ground ground vdd_lp ground memorycell
X2wire316 n_br_316 n_br_317 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ316 ground ground n_br_317 ground ground ground vdd_lp ground memorycell
Xwire317 n_bl_317 n_bl_318 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ317 ground ground n_bl_318 ground ground ground vdd_lp ground memorycell
X2wire317 n_br_317 n_br_318 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ317 ground ground n_br_318 ground ground ground vdd_lp ground memorycell
Xwire318 n_bl_318 n_bl_319 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ318 ground ground n_bl_319 ground ground ground vdd_lp ground memorycell
X2wire318 n_br_318 n_br_319 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ318 ground ground n_br_319 ground ground ground vdd_lp ground memorycell
Xwire319 n_bl_319 n_bl_320 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ319 ground ground n_bl_320 ground ground ground vdd_lp ground memorycell
X2wire319 n_br_319 n_br_320 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ319 ground ground n_br_320 ground ground ground vdd_lp ground memorycell
Xwire320 n_bl_320 n_bl_321 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ320 ground ground n_bl_321 ground ground ground vdd_lp ground memorycell
X2wire320 n_br_320 n_br_321 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ320 ground ground n_br_321 ground ground ground vdd_lp ground memorycell
Xwire321 n_bl_321 n_bl_322 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ321 ground ground n_bl_322 ground ground ground vdd_lp ground memorycell
X2wire321 n_br_321 n_br_322 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ321 ground ground n_br_322 ground ground ground vdd_lp ground memorycell
Xwire322 n_bl_322 n_bl_323 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ322 ground ground n_bl_323 ground ground ground vdd_lp ground memorycell
X2wire322 n_br_322 n_br_323 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ322 ground ground n_br_323 ground ground ground vdd_lp ground memorycell
Xwire323 n_bl_323 n_bl_324 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ323 ground ground n_bl_324 ground ground ground vdd_lp ground memorycell
X2wire323 n_br_323 n_br_324 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ323 ground ground n_br_324 ground ground ground vdd_lp ground memorycell
Xwire324 n_bl_324 n_bl_325 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ324 ground ground n_bl_325 ground ground ground vdd_lp ground memorycell
X2wire324 n_br_324 n_br_325 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ324 ground ground n_br_325 ground ground ground vdd_lp ground memorycell
Xwire325 n_bl_325 n_bl_326 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ325 ground ground n_bl_326 ground ground ground vdd_lp ground memorycell
X2wire325 n_br_325 n_br_326 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ325 ground ground n_br_326 ground ground ground vdd_lp ground memorycell
Xwire326 n_bl_326 n_bl_327 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ326 ground ground n_bl_327 ground ground ground vdd_lp ground memorycell
X2wire326 n_br_326 n_br_327 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ326 ground ground n_br_327 ground ground ground vdd_lp ground memorycell
Xwire327 n_bl_327 n_bl_328 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ327 ground ground n_bl_328 ground ground ground vdd_lp ground memorycell
X2wire327 n_br_327 n_br_328 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ327 ground ground n_br_328 ground ground ground vdd_lp ground memorycell
Xwire328 n_bl_328 n_bl_329 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ328 ground ground n_bl_329 ground ground ground vdd_lp ground memorycell
X2wire328 n_br_328 n_br_329 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ328 ground ground n_br_329 ground ground ground vdd_lp ground memorycell
Xwire329 n_bl_329 n_bl_330 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ329 ground ground n_bl_330 ground ground ground vdd_lp ground memorycell
X2wire329 n_br_329 n_br_330 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ329 ground ground n_br_330 ground ground ground vdd_lp ground memorycell
Xwire330 n_bl_330 n_bl_331 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ330 ground ground n_bl_331 ground ground ground vdd_lp ground memorycell
X2wire330 n_br_330 n_br_331 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ330 ground ground n_br_331 ground ground ground vdd_lp ground memorycell
Xwire331 n_bl_331 n_bl_332 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ331 ground ground n_bl_332 ground ground ground vdd_lp ground memorycell
X2wire331 n_br_331 n_br_332 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ331 ground ground n_br_332 ground ground ground vdd_lp ground memorycell
Xwire332 n_bl_332 n_bl_333 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ332 ground ground n_bl_333 ground ground ground vdd_lp ground memorycell
X2wire332 n_br_332 n_br_333 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ332 ground ground n_br_333 ground ground ground vdd_lp ground memorycell
Xwire333 n_bl_333 n_bl_334 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ333 ground ground n_bl_334 ground ground ground vdd_lp ground memorycell
X2wire333 n_br_333 n_br_334 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ333 ground ground n_br_334 ground ground ground vdd_lp ground memorycell
Xwire334 n_bl_334 n_bl_335 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ334 ground ground n_bl_335 ground ground ground vdd_lp ground memorycell
X2wire334 n_br_334 n_br_335 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ334 ground ground n_br_335 ground ground ground vdd_lp ground memorycell
Xwire335 n_bl_335 n_bl_336 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ335 ground ground n_bl_336 ground ground ground vdd_lp ground memorycell
X2wire335 n_br_335 n_br_336 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ335 ground ground n_br_336 ground ground ground vdd_lp ground memorycell
Xwire336 n_bl_336 n_bl_337 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ336 ground ground n_bl_337 ground ground ground vdd_lp ground memorycell
X2wire336 n_br_336 n_br_337 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ336 ground ground n_br_337 ground ground ground vdd_lp ground memorycell
Xwire337 n_bl_337 n_bl_338 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ337 ground ground n_bl_338 ground ground ground vdd_lp ground memorycell
X2wire337 n_br_337 n_br_338 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ337 ground ground n_br_338 ground ground ground vdd_lp ground memorycell
Xwire338 n_bl_338 n_bl_339 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ338 ground ground n_bl_339 ground ground ground vdd_lp ground memorycell
X2wire338 n_br_338 n_br_339 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ338 ground ground n_br_339 ground ground ground vdd_lp ground memorycell
Xwire339 n_bl_339 n_bl_340 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ339 ground ground n_bl_340 ground ground ground vdd_lp ground memorycell
X2wire339 n_br_339 n_br_340 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ339 ground ground n_br_340 ground ground ground vdd_lp ground memorycell
Xwire340 n_bl_340 n_bl_341 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ340 ground ground n_bl_341 ground ground ground vdd_lp ground memorycell
X2wire340 n_br_340 n_br_341 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ340 ground ground n_br_341 ground ground ground vdd_lp ground memorycell
Xwire341 n_bl_341 n_bl_342 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ341 ground ground n_bl_342 ground ground ground vdd_lp ground memorycell
X2wire341 n_br_341 n_br_342 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ341 ground ground n_br_342 ground ground ground vdd_lp ground memorycell
Xwire342 n_bl_342 n_bl_343 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ342 ground ground n_bl_343 ground ground ground vdd_lp ground memorycell
X2wire342 n_br_342 n_br_343 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ342 ground ground n_br_343 ground ground ground vdd_lp ground memorycell
Xwire343 n_bl_343 n_bl_344 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ343 ground ground n_bl_344 ground ground ground vdd_lp ground memorycell
X2wire343 n_br_343 n_br_344 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ343 ground ground n_br_344 ground ground ground vdd_lp ground memorycell
Xwire344 n_bl_344 n_bl_345 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ344 ground ground n_bl_345 ground ground ground vdd_lp ground memorycell
X2wire344 n_br_344 n_br_345 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ344 ground ground n_br_345 ground ground ground vdd_lp ground memorycell
Xwire345 n_bl_345 n_bl_346 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ345 ground ground n_bl_346 ground ground ground vdd_lp ground memorycell
X2wire345 n_br_345 n_br_346 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ345 ground ground n_br_346 ground ground ground vdd_lp ground memorycell
Xwire346 n_bl_346 n_bl_347 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ346 ground ground n_bl_347 ground ground ground vdd_lp ground memorycell
X2wire346 n_br_346 n_br_347 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ346 ground ground n_br_347 ground ground ground vdd_lp ground memorycell
Xwire347 n_bl_347 n_bl_348 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ347 ground ground n_bl_348 ground ground ground vdd_lp ground memorycell
X2wire347 n_br_347 n_br_348 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ347 ground ground n_br_348 ground ground ground vdd_lp ground memorycell
Xwire348 n_bl_348 n_bl_349 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ348 ground ground n_bl_349 ground ground ground vdd_lp ground memorycell
X2wire348 n_br_348 n_br_349 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ348 ground ground n_br_349 ground ground ground vdd_lp ground memorycell
Xwire349 n_bl_349 n_bl_350 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ349 ground ground n_bl_350 ground ground ground vdd_lp ground memorycell
X2wire349 n_br_349 n_br_350 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ349 ground ground n_br_350 ground ground ground vdd_lp ground memorycell
Xwire350 n_bl_350 n_bl_351 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ350 ground ground n_bl_351 ground ground ground vdd_lp ground memorycell
X2wire350 n_br_350 n_br_351 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ350 ground ground n_br_351 ground ground ground vdd_lp ground memorycell
Xwire351 n_bl_351 n_bl_352 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ351 ground ground n_bl_352 ground ground ground vdd_lp ground memorycell
X2wire351 n_br_351 n_br_352 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ351 ground ground n_br_352 ground ground ground vdd_lp ground memorycell
Xwire352 n_bl_352 n_bl_353 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ352 ground ground n_bl_353 ground ground ground vdd_lp ground memorycell
X2wire352 n_br_352 n_br_353 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ352 ground ground n_br_353 ground ground ground vdd_lp ground memorycell
Xwire353 n_bl_353 n_bl_354 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ353 ground ground n_bl_354 ground ground ground vdd_lp ground memorycell
X2wire353 n_br_353 n_br_354 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ353 ground ground n_br_354 ground ground ground vdd_lp ground memorycell
Xwire354 n_bl_354 n_bl_355 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ354 ground ground n_bl_355 ground ground ground vdd_lp ground memorycell
X2wire354 n_br_354 n_br_355 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ354 ground ground n_br_355 ground ground ground vdd_lp ground memorycell
Xwire355 n_bl_355 n_bl_356 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ355 ground ground n_bl_356 ground ground ground vdd_lp ground memorycell
X2wire355 n_br_355 n_br_356 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ355 ground ground n_br_356 ground ground ground vdd_lp ground memorycell
Xwire356 n_bl_356 n_bl_357 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ356 ground ground n_bl_357 ground ground ground vdd_lp ground memorycell
X2wire356 n_br_356 n_br_357 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ356 ground ground n_br_357 ground ground ground vdd_lp ground memorycell
Xwire357 n_bl_357 n_bl_358 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ357 ground ground n_bl_358 ground ground ground vdd_lp ground memorycell
X2wire357 n_br_357 n_br_358 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ357 ground ground n_br_358 ground ground ground vdd_lp ground memorycell
Xwire358 n_bl_358 n_bl_359 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ358 ground ground n_bl_359 ground ground ground vdd_lp ground memorycell
X2wire358 n_br_358 n_br_359 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ358 ground ground n_br_359 ground ground ground vdd_lp ground memorycell
Xwire359 n_bl_359 n_bl_360 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ359 ground ground n_bl_360 ground ground ground vdd_lp ground memorycell
X2wire359 n_br_359 n_br_360 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ359 ground ground n_br_360 ground ground ground vdd_lp ground memorycell
Xwire360 n_bl_360 n_bl_361 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ360 ground ground n_bl_361 ground ground ground vdd_lp ground memorycell
X2wire360 n_br_360 n_br_361 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ360 ground ground n_br_361 ground ground ground vdd_lp ground memorycell
Xwire361 n_bl_361 n_bl_362 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ361 ground ground n_bl_362 ground ground ground vdd_lp ground memorycell
X2wire361 n_br_361 n_br_362 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ361 ground ground n_br_362 ground ground ground vdd_lp ground memorycell
Xwire362 n_bl_362 n_bl_363 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ362 ground ground n_bl_363 ground ground ground vdd_lp ground memorycell
X2wire362 n_br_362 n_br_363 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ362 ground ground n_br_363 ground ground ground vdd_lp ground memorycell
Xwire363 n_bl_363 n_bl_364 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ363 ground ground n_bl_364 ground ground ground vdd_lp ground memorycell
X2wire363 n_br_363 n_br_364 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ363 ground ground n_br_364 ground ground ground vdd_lp ground memorycell
Xwire364 n_bl_364 n_bl_365 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ364 ground ground n_bl_365 ground ground ground vdd_lp ground memorycell
X2wire364 n_br_364 n_br_365 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ364 ground ground n_br_365 ground ground ground vdd_lp ground memorycell
Xwire365 n_bl_365 n_bl_366 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ365 ground ground n_bl_366 ground ground ground vdd_lp ground memorycell
X2wire365 n_br_365 n_br_366 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ365 ground ground n_br_366 ground ground ground vdd_lp ground memorycell
Xwire366 n_bl_366 n_bl_367 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ366 ground ground n_bl_367 ground ground ground vdd_lp ground memorycell
X2wire366 n_br_366 n_br_367 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ366 ground ground n_br_367 ground ground ground vdd_lp ground memorycell
Xwire367 n_bl_367 n_bl_368 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ367 ground ground n_bl_368 ground ground ground vdd_lp ground memorycell
X2wire367 n_br_367 n_br_368 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ367 ground ground n_br_368 ground ground ground vdd_lp ground memorycell
Xwire368 n_bl_368 n_bl_369 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ368 ground ground n_bl_369 ground ground ground vdd_lp ground memorycell
X2wire368 n_br_368 n_br_369 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ368 ground ground n_br_369 ground ground ground vdd_lp ground memorycell
Xwire369 n_bl_369 n_bl_370 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ369 ground ground n_bl_370 ground ground ground vdd_lp ground memorycell
X2wire369 n_br_369 n_br_370 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ369 ground ground n_br_370 ground ground ground vdd_lp ground memorycell
Xwire370 n_bl_370 n_bl_371 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ370 ground ground n_bl_371 ground ground ground vdd_lp ground memorycell
X2wire370 n_br_370 n_br_371 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ370 ground ground n_br_371 ground ground ground vdd_lp ground memorycell
Xwire371 n_bl_371 n_bl_372 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ371 ground ground n_bl_372 ground ground ground vdd_lp ground memorycell
X2wire371 n_br_371 n_br_372 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ371 ground ground n_br_372 ground ground ground vdd_lp ground memorycell
Xwire372 n_bl_372 n_bl_373 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ372 ground ground n_bl_373 ground ground ground vdd_lp ground memorycell
X2wire372 n_br_372 n_br_373 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ372 ground ground n_br_373 ground ground ground vdd_lp ground memorycell
Xwire373 n_bl_373 n_bl_374 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ373 ground ground n_bl_374 ground ground ground vdd_lp ground memorycell
X2wire373 n_br_373 n_br_374 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ373 ground ground n_br_374 ground ground ground vdd_lp ground memorycell
Xwire374 n_bl_374 n_bl_375 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ374 ground ground n_bl_375 ground ground ground vdd_lp ground memorycell
X2wire374 n_br_374 n_br_375 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ374 ground ground n_br_375 ground ground ground vdd_lp ground memorycell
Xwire375 n_bl_375 n_bl_376 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ375 ground ground n_bl_376 ground ground ground vdd_lp ground memorycell
X2wire375 n_br_375 n_br_376 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ375 ground ground n_br_376 ground ground ground vdd_lp ground memorycell
Xwire376 n_bl_376 n_bl_377 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ376 ground ground n_bl_377 ground ground ground vdd_lp ground memorycell
X2wire376 n_br_376 n_br_377 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ376 ground ground n_br_377 ground ground ground vdd_lp ground memorycell
Xwire377 n_bl_377 n_bl_378 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ377 ground ground n_bl_378 ground ground ground vdd_lp ground memorycell
X2wire377 n_br_377 n_br_378 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ377 ground ground n_br_378 ground ground ground vdd_lp ground memorycell
Xwire378 n_bl_378 n_bl_379 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ378 ground ground n_bl_379 ground ground ground vdd_lp ground memorycell
X2wire378 n_br_378 n_br_379 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ378 ground ground n_br_379 ground ground ground vdd_lp ground memorycell
Xwire379 n_bl_379 n_bl_380 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ379 ground ground n_bl_380 ground ground ground vdd_lp ground memorycell
X2wire379 n_br_379 n_br_380 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ379 ground ground n_br_380 ground ground ground vdd_lp ground memorycell
Xwire380 n_bl_380 n_bl_381 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ380 ground ground n_bl_381 ground ground ground vdd_lp ground memorycell
X2wire380 n_br_380 n_br_381 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ380 ground ground n_br_381 ground ground ground vdd_lp ground memorycell
Xwire381 n_bl_381 n_bl_382 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ381 ground ground n_bl_382 ground ground ground vdd_lp ground memorycell
X2wire381 n_br_381 n_br_382 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ381 ground ground n_br_382 ground ground ground vdd_lp ground memorycell
Xwire382 n_bl_382 n_bl_383 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ382 ground ground n_bl_383 ground ground ground vdd_lp ground memorycell
X2wire382 n_br_382 n_br_383 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ382 ground ground n_br_383 ground ground ground vdd_lp ground memorycell
Xwire383 n_bl_383 n_bl_384 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ383 ground ground n_bl_384 ground ground ground vdd_lp ground memorycell
X2wire383 n_br_383 n_br_384 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ383 ground ground n_br_384 ground ground ground vdd_lp ground memorycell
Xwire384 n_bl_384 n_bl_385 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ384 ground ground n_bl_385 ground ground ground vdd_lp ground memorycell
X2wire384 n_br_384 n_br_385 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ384 ground ground n_br_385 ground ground ground vdd_lp ground memorycell
Xwire385 n_bl_385 n_bl_386 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ385 ground ground n_bl_386 ground ground ground vdd_lp ground memorycell
X2wire385 n_br_385 n_br_386 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ385 ground ground n_br_386 ground ground ground vdd_lp ground memorycell
Xwire386 n_bl_386 n_bl_387 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ386 ground ground n_bl_387 ground ground ground vdd_lp ground memorycell
X2wire386 n_br_386 n_br_387 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ386 ground ground n_br_387 ground ground ground vdd_lp ground memorycell
Xwire387 n_bl_387 n_bl_388 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ387 ground ground n_bl_388 ground ground ground vdd_lp ground memorycell
X2wire387 n_br_387 n_br_388 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ387 ground ground n_br_388 ground ground ground vdd_lp ground memorycell
Xwire388 n_bl_388 n_bl_389 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ388 ground ground n_bl_389 ground ground ground vdd_lp ground memorycell
X2wire388 n_br_388 n_br_389 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ388 ground ground n_br_389 ground ground ground vdd_lp ground memorycell
Xwire389 n_bl_389 n_bl_390 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ389 ground ground n_bl_390 ground ground ground vdd_lp ground memorycell
X2wire389 n_br_389 n_br_390 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ389 ground ground n_br_390 ground ground ground vdd_lp ground memorycell
Xwire390 n_bl_390 n_bl_391 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ390 ground ground n_bl_391 ground ground ground vdd_lp ground memorycell
X2wire390 n_br_390 n_br_391 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ390 ground ground n_br_391 ground ground ground vdd_lp ground memorycell
Xwire391 n_bl_391 n_bl_392 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ391 ground ground n_bl_392 ground ground ground vdd_lp ground memorycell
X2wire391 n_br_391 n_br_392 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ391 ground ground n_br_392 ground ground ground vdd_lp ground memorycell
Xwire392 n_bl_392 n_bl_393 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ392 ground ground n_bl_393 ground ground ground vdd_lp ground memorycell
X2wire392 n_br_392 n_br_393 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ392 ground ground n_br_393 ground ground ground vdd_lp ground memorycell
Xwire393 n_bl_393 n_bl_394 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ393 ground ground n_bl_394 ground ground ground vdd_lp ground memorycell
X2wire393 n_br_393 n_br_394 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ393 ground ground n_br_394 ground ground ground vdd_lp ground memorycell
Xwire394 n_bl_394 n_bl_395 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ394 ground ground n_bl_395 ground ground ground vdd_lp ground memorycell
X2wire394 n_br_394 n_br_395 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ394 ground ground n_br_395 ground ground ground vdd_lp ground memorycell
Xwire395 n_bl_395 n_bl_396 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ395 ground ground n_bl_396 ground ground ground vdd_lp ground memorycell
X2wire395 n_br_395 n_br_396 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ395 ground ground n_br_396 ground ground ground vdd_lp ground memorycell
Xwire396 n_bl_396 n_bl_397 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ396 ground ground n_bl_397 ground ground ground vdd_lp ground memorycell
X2wire396 n_br_396 n_br_397 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ396 ground ground n_br_397 ground ground ground vdd_lp ground memorycell
Xwire397 n_bl_397 n_bl_398 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ397 ground ground n_bl_398 ground ground ground vdd_lp ground memorycell
X2wire397 n_br_397 n_br_398 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ397 ground ground n_br_398 ground ground ground vdd_lp ground memorycell
Xwire398 n_bl_398 n_bl_399 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ398 ground ground n_bl_399 ground ground ground vdd_lp ground memorycell
X2wire398 n_br_398 n_br_399 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ398 ground ground n_br_399 ground ground ground vdd_lp ground memorycell
Xwire399 n_bl_399 n_bl_400 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ399 ground ground n_bl_400 ground ground ground vdd_lp ground memorycell
X2wire399 n_br_399 n_br_400 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ399 ground ground n_br_400 ground ground ground vdd_lp ground memorycell
Xwire400 n_bl_400 n_bl_401 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ400 ground ground n_bl_401 ground ground ground vdd_lp ground memorycell
X2wire400 n_br_400 n_br_401 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ400 ground ground n_br_401 ground ground ground vdd_lp ground memorycell
Xwire401 n_bl_401 n_bl_402 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ401 ground ground n_bl_402 ground ground ground vdd_lp ground memorycell
X2wire401 n_br_401 n_br_402 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ401 ground ground n_br_402 ground ground ground vdd_lp ground memorycell
Xwire402 n_bl_402 n_bl_403 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ402 ground ground n_bl_403 ground ground ground vdd_lp ground memorycell
X2wire402 n_br_402 n_br_403 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ402 ground ground n_br_403 ground ground ground vdd_lp ground memorycell
Xwire403 n_bl_403 n_bl_404 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ403 ground ground n_bl_404 ground ground ground vdd_lp ground memorycell
X2wire403 n_br_403 n_br_404 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ403 ground ground n_br_404 ground ground ground vdd_lp ground memorycell
Xwire404 n_bl_404 n_bl_405 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ404 ground ground n_bl_405 ground ground ground vdd_lp ground memorycell
X2wire404 n_br_404 n_br_405 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ404 ground ground n_br_405 ground ground ground vdd_lp ground memorycell
Xwire405 n_bl_405 n_bl_406 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ405 ground ground n_bl_406 ground ground ground vdd_lp ground memorycell
X2wire405 n_br_405 n_br_406 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ405 ground ground n_br_406 ground ground ground vdd_lp ground memorycell
Xwire406 n_bl_406 n_bl_407 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ406 ground ground n_bl_407 ground ground ground vdd_lp ground memorycell
X2wire406 n_br_406 n_br_407 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ406 ground ground n_br_407 ground ground ground vdd_lp ground memorycell
Xwire407 n_bl_407 n_bl_408 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ407 ground ground n_bl_408 ground ground ground vdd_lp ground memorycell
X2wire407 n_br_407 n_br_408 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ407 ground ground n_br_408 ground ground ground vdd_lp ground memorycell
Xwire408 n_bl_408 n_bl_409 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ408 ground ground n_bl_409 ground ground ground vdd_lp ground memorycell
X2wire408 n_br_408 n_br_409 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ408 ground ground n_br_409 ground ground ground vdd_lp ground memorycell
Xwire409 n_bl_409 n_bl_410 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ409 ground ground n_bl_410 ground ground ground vdd_lp ground memorycell
X2wire409 n_br_409 n_br_410 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ409 ground ground n_br_410 ground ground ground vdd_lp ground memorycell
Xwire410 n_bl_410 n_bl_411 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ410 ground ground n_bl_411 ground ground ground vdd_lp ground memorycell
X2wire410 n_br_410 n_br_411 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ410 ground ground n_br_411 ground ground ground vdd_lp ground memorycell
Xwire411 n_bl_411 n_bl_412 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ411 ground ground n_bl_412 ground ground ground vdd_lp ground memorycell
X2wire411 n_br_411 n_br_412 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ411 ground ground n_br_412 ground ground ground vdd_lp ground memorycell
Xwire412 n_bl_412 n_bl_413 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ412 ground ground n_bl_413 ground ground ground vdd_lp ground memorycell
X2wire412 n_br_412 n_br_413 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ412 ground ground n_br_413 ground ground ground vdd_lp ground memorycell
Xwire413 n_bl_413 n_bl_414 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ413 ground ground n_bl_414 ground ground ground vdd_lp ground memorycell
X2wire413 n_br_413 n_br_414 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ413 ground ground n_br_414 ground ground ground vdd_lp ground memorycell
Xwire414 n_bl_414 n_bl_415 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ414 ground ground n_bl_415 ground ground ground vdd_lp ground memorycell
X2wire414 n_br_414 n_br_415 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ414 ground ground n_br_415 ground ground ground vdd_lp ground memorycell
Xwire415 n_bl_415 n_bl_416 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ415 ground ground n_bl_416 ground ground ground vdd_lp ground memorycell
X2wire415 n_br_415 n_br_416 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ415 ground ground n_br_416 ground ground ground vdd_lp ground memorycell
Xwire416 n_bl_416 n_bl_417 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ416 ground ground n_bl_417 ground ground ground vdd_lp ground memorycell
X2wire416 n_br_416 n_br_417 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ416 ground ground n_br_417 ground ground ground vdd_lp ground memorycell
Xwire417 n_bl_417 n_bl_418 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ417 ground ground n_bl_418 ground ground ground vdd_lp ground memorycell
X2wire417 n_br_417 n_br_418 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ417 ground ground n_br_418 ground ground ground vdd_lp ground memorycell
Xwire418 n_bl_418 n_bl_419 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ418 ground ground n_bl_419 ground ground ground vdd_lp ground memorycell
X2wire418 n_br_418 n_br_419 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ418 ground ground n_br_419 ground ground ground vdd_lp ground memorycell
Xwire419 n_bl_419 n_bl_420 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ419 ground ground n_bl_420 ground ground ground vdd_lp ground memorycell
X2wire419 n_br_419 n_br_420 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ419 ground ground n_br_420 ground ground ground vdd_lp ground memorycell
Xwire420 n_bl_420 n_bl_421 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ420 ground ground n_bl_421 ground ground ground vdd_lp ground memorycell
X2wire420 n_br_420 n_br_421 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ420 ground ground n_br_421 ground ground ground vdd_lp ground memorycell
Xwire421 n_bl_421 n_bl_422 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ421 ground ground n_bl_422 ground ground ground vdd_lp ground memorycell
X2wire421 n_br_421 n_br_422 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ421 ground ground n_br_422 ground ground ground vdd_lp ground memorycell
Xwire422 n_bl_422 n_bl_423 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ422 ground ground n_bl_423 ground ground ground vdd_lp ground memorycell
X2wire422 n_br_422 n_br_423 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ422 ground ground n_br_423 ground ground ground vdd_lp ground memorycell
Xwire423 n_bl_423 n_bl_424 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ423 ground ground n_bl_424 ground ground ground vdd_lp ground memorycell
X2wire423 n_br_423 n_br_424 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ423 ground ground n_br_424 ground ground ground vdd_lp ground memorycell
Xwire424 n_bl_424 n_bl_425 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ424 ground ground n_bl_425 ground ground ground vdd_lp ground memorycell
X2wire424 n_br_424 n_br_425 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ424 ground ground n_br_425 ground ground ground vdd_lp ground memorycell
Xwire425 n_bl_425 n_bl_426 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ425 ground ground n_bl_426 ground ground ground vdd_lp ground memorycell
X2wire425 n_br_425 n_br_426 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ425 ground ground n_br_426 ground ground ground vdd_lp ground memorycell
Xwire426 n_bl_426 n_bl_427 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ426 ground ground n_bl_427 ground ground ground vdd_lp ground memorycell
X2wire426 n_br_426 n_br_427 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ426 ground ground n_br_427 ground ground ground vdd_lp ground memorycell
Xwire427 n_bl_427 n_bl_428 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ427 ground ground n_bl_428 ground ground ground vdd_lp ground memorycell
X2wire427 n_br_427 n_br_428 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ427 ground ground n_br_428 ground ground ground vdd_lp ground memorycell
Xwire428 n_bl_428 n_bl_429 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ428 ground ground n_bl_429 ground ground ground vdd_lp ground memorycell
X2wire428 n_br_428 n_br_429 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ428 ground ground n_br_429 ground ground ground vdd_lp ground memorycell
Xwire429 n_bl_429 n_bl_430 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ429 ground ground n_bl_430 ground ground ground vdd_lp ground memorycell
X2wire429 n_br_429 n_br_430 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ429 ground ground n_br_430 ground ground ground vdd_lp ground memorycell
Xwire430 n_bl_430 n_bl_431 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ430 ground ground n_bl_431 ground ground ground vdd_lp ground memorycell
X2wire430 n_br_430 n_br_431 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ430 ground ground n_br_431 ground ground ground vdd_lp ground memorycell
Xwire431 n_bl_431 n_bl_432 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ431 ground ground n_bl_432 ground ground ground vdd_lp ground memorycell
X2wire431 n_br_431 n_br_432 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ431 ground ground n_br_432 ground ground ground vdd_lp ground memorycell
Xwire432 n_bl_432 n_bl_433 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ432 ground ground n_bl_433 ground ground ground vdd_lp ground memorycell
X2wire432 n_br_432 n_br_433 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ432 ground ground n_br_433 ground ground ground vdd_lp ground memorycell
Xwire433 n_bl_433 n_bl_434 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ433 ground ground n_bl_434 ground ground ground vdd_lp ground memorycell
X2wire433 n_br_433 n_br_434 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ433 ground ground n_br_434 ground ground ground vdd_lp ground memorycell
Xwire434 n_bl_434 n_bl_435 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ434 ground ground n_bl_435 ground ground ground vdd_lp ground memorycell
X2wire434 n_br_434 n_br_435 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ434 ground ground n_br_435 ground ground ground vdd_lp ground memorycell
Xwire435 n_bl_435 n_bl_436 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ435 ground ground n_bl_436 ground ground ground vdd_lp ground memorycell
X2wire435 n_br_435 n_br_436 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ435 ground ground n_br_436 ground ground ground vdd_lp ground memorycell
Xwire436 n_bl_436 n_bl_437 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ436 ground ground n_bl_437 ground ground ground vdd_lp ground memorycell
X2wire436 n_br_436 n_br_437 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ436 ground ground n_br_437 ground ground ground vdd_lp ground memorycell
Xwire437 n_bl_437 n_bl_438 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ437 ground ground n_bl_438 ground ground ground vdd_lp ground memorycell
X2wire437 n_br_437 n_br_438 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ437 ground ground n_br_438 ground ground ground vdd_lp ground memorycell
Xwire438 n_bl_438 n_bl_439 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ438 ground ground n_bl_439 ground ground ground vdd_lp ground memorycell
X2wire438 n_br_438 n_br_439 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ438 ground ground n_br_439 ground ground ground vdd_lp ground memorycell
Xwire439 n_bl_439 n_bl_440 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ439 ground ground n_bl_440 ground ground ground vdd_lp ground memorycell
X2wire439 n_br_439 n_br_440 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ439 ground ground n_br_440 ground ground ground vdd_lp ground memorycell
Xwire440 n_bl_440 n_bl_441 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ440 ground ground n_bl_441 ground ground ground vdd_lp ground memorycell
X2wire440 n_br_440 n_br_441 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ440 ground ground n_br_441 ground ground ground vdd_lp ground memorycell
Xwire441 n_bl_441 n_bl_442 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ441 ground ground n_bl_442 ground ground ground vdd_lp ground memorycell
X2wire441 n_br_441 n_br_442 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ441 ground ground n_br_442 ground ground ground vdd_lp ground memorycell
Xwire442 n_bl_442 n_bl_443 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ442 ground ground n_bl_443 ground ground ground vdd_lp ground memorycell
X2wire442 n_br_442 n_br_443 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ442 ground ground n_br_443 ground ground ground vdd_lp ground memorycell
Xwire443 n_bl_443 n_bl_444 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ443 ground ground n_bl_444 ground ground ground vdd_lp ground memorycell
X2wire443 n_br_443 n_br_444 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ443 ground ground n_br_444 ground ground ground vdd_lp ground memorycell
Xwire444 n_bl_444 n_bl_445 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ444 ground ground n_bl_445 ground ground ground vdd_lp ground memorycell
X2wire444 n_br_444 n_br_445 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ444 ground ground n_br_445 ground ground ground vdd_lp ground memorycell
Xwire445 n_bl_445 n_bl_446 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ445 ground ground n_bl_446 ground ground ground vdd_lp ground memorycell
X2wire445 n_br_445 n_br_446 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ445 ground ground n_br_446 ground ground ground vdd_lp ground memorycell
Xwire446 n_bl_446 n_bl_447 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ446 ground ground n_bl_447 ground ground ground vdd_lp ground memorycell
X2wire446 n_br_446 n_br_447 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ446 ground ground n_br_447 ground ground ground vdd_lp ground memorycell
Xwire447 n_bl_447 n_bl_448 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ447 ground ground n_bl_448 ground ground ground vdd_lp ground memorycell
X2wire447 n_br_447 n_br_448 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ447 ground ground n_br_448 ground ground ground vdd_lp ground memorycell
Xwire448 n_bl_448 n_bl_449 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ448 ground ground n_bl_449 ground ground ground vdd_lp ground memorycell
X2wire448 n_br_448 n_br_449 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ448 ground ground n_br_449 ground ground ground vdd_lp ground memorycell
Xwire449 n_bl_449 n_bl_450 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ449 ground ground n_bl_450 ground ground ground vdd_lp ground memorycell
X2wire449 n_br_449 n_br_450 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ449 ground ground n_br_450 ground ground ground vdd_lp ground memorycell
Xwire450 n_bl_450 n_bl_451 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ450 ground ground n_bl_451 ground ground ground vdd_lp ground memorycell
X2wire450 n_br_450 n_br_451 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ450 ground ground n_br_451 ground ground ground vdd_lp ground memorycell
Xwire451 n_bl_451 n_bl_452 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ451 ground ground n_bl_452 ground ground ground vdd_lp ground memorycell
X2wire451 n_br_451 n_br_452 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ451 ground ground n_br_452 ground ground ground vdd_lp ground memorycell
Xwire452 n_bl_452 n_bl_453 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ452 ground ground n_bl_453 ground ground ground vdd_lp ground memorycell
X2wire452 n_br_452 n_br_453 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ452 ground ground n_br_453 ground ground ground vdd_lp ground memorycell
Xwire453 n_bl_453 n_bl_454 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ453 ground ground n_bl_454 ground ground ground vdd_lp ground memorycell
X2wire453 n_br_453 n_br_454 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ453 ground ground n_br_454 ground ground ground vdd_lp ground memorycell
Xwire454 n_bl_454 n_bl_455 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ454 ground ground n_bl_455 ground ground ground vdd_lp ground memorycell
X2wire454 n_br_454 n_br_455 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ454 ground ground n_br_455 ground ground ground vdd_lp ground memorycell
Xwire455 n_bl_455 n_bl_456 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ455 ground ground n_bl_456 ground ground ground vdd_lp ground memorycell
X2wire455 n_br_455 n_br_456 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ455 ground ground n_br_456 ground ground ground vdd_lp ground memorycell
Xwire456 n_bl_456 n_bl_457 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ456 ground ground n_bl_457 ground ground ground vdd_lp ground memorycell
X2wire456 n_br_456 n_br_457 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ456 ground ground n_br_457 ground ground ground vdd_lp ground memorycell
Xwire457 n_bl_457 n_bl_458 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ457 ground ground n_bl_458 ground ground ground vdd_lp ground memorycell
X2wire457 n_br_457 n_br_458 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ457 ground ground n_br_458 ground ground ground vdd_lp ground memorycell
Xwire458 n_bl_458 n_bl_459 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ458 ground ground n_bl_459 ground ground ground vdd_lp ground memorycell
X2wire458 n_br_458 n_br_459 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ458 ground ground n_br_459 ground ground ground vdd_lp ground memorycell
Xwire459 n_bl_459 n_bl_460 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ459 ground ground n_bl_460 ground ground ground vdd_lp ground memorycell
X2wire459 n_br_459 n_br_460 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ459 ground ground n_br_460 ground ground ground vdd_lp ground memorycell
Xwire460 n_bl_460 n_bl_461 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ460 ground ground n_bl_461 ground ground ground vdd_lp ground memorycell
X2wire460 n_br_460 n_br_461 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ460 ground ground n_br_461 ground ground ground vdd_lp ground memorycell
Xwire461 n_bl_461 n_bl_462 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ461 ground ground n_bl_462 ground ground ground vdd_lp ground memorycell
X2wire461 n_br_461 n_br_462 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ461 ground ground n_br_462 ground ground ground vdd_lp ground memorycell
Xwire462 n_bl_462 n_bl_463 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ462 ground ground n_bl_463 ground ground ground vdd_lp ground memorycell
X2wire462 n_br_462 n_br_463 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ462 ground ground n_br_463 ground ground ground vdd_lp ground memorycell
Xwire463 n_bl_463 n_bl_464 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ463 ground ground n_bl_464 ground ground ground vdd_lp ground memorycell
X2wire463 n_br_463 n_br_464 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ463 ground ground n_br_464 ground ground ground vdd_lp ground memorycell
Xwire464 n_bl_464 n_bl_465 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ464 ground ground n_bl_465 ground ground ground vdd_lp ground memorycell
X2wire464 n_br_464 n_br_465 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ464 ground ground n_br_465 ground ground ground vdd_lp ground memorycell
Xwire465 n_bl_465 n_bl_466 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ465 ground ground n_bl_466 ground ground ground vdd_lp ground memorycell
X2wire465 n_br_465 n_br_466 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ465 ground ground n_br_466 ground ground ground vdd_lp ground memorycell
Xwire466 n_bl_466 n_bl_467 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ466 ground ground n_bl_467 ground ground ground vdd_lp ground memorycell
X2wire466 n_br_466 n_br_467 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ466 ground ground n_br_467 ground ground ground vdd_lp ground memorycell
Xwire467 n_bl_467 n_bl_468 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ467 ground ground n_bl_468 ground ground ground vdd_lp ground memorycell
X2wire467 n_br_467 n_br_468 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ467 ground ground n_br_468 ground ground ground vdd_lp ground memorycell
Xwire468 n_bl_468 n_bl_469 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ468 ground ground n_bl_469 ground ground ground vdd_lp ground memorycell
X2wire468 n_br_468 n_br_469 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ468 ground ground n_br_469 ground ground ground vdd_lp ground memorycell
Xwire469 n_bl_469 n_bl_470 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ469 ground ground n_bl_470 ground ground ground vdd_lp ground memorycell
X2wire469 n_br_469 n_br_470 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ469 ground ground n_br_470 ground ground ground vdd_lp ground memorycell
Xwire470 n_bl_470 n_bl_471 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ470 ground ground n_bl_471 ground ground ground vdd_lp ground memorycell
X2wire470 n_br_470 n_br_471 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ470 ground ground n_br_471 ground ground ground vdd_lp ground memorycell
Xwire471 n_bl_471 n_bl_472 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ471 ground ground n_bl_472 ground ground ground vdd_lp ground memorycell
X2wire471 n_br_471 n_br_472 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ471 ground ground n_br_472 ground ground ground vdd_lp ground memorycell
Xwire472 n_bl_472 n_bl_473 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ472 ground ground n_bl_473 ground ground ground vdd_lp ground memorycell
X2wire472 n_br_472 n_br_473 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ472 ground ground n_br_473 ground ground ground vdd_lp ground memorycell
Xwire473 n_bl_473 n_bl_474 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ473 ground ground n_bl_474 ground ground ground vdd_lp ground memorycell
X2wire473 n_br_473 n_br_474 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ473 ground ground n_br_474 ground ground ground vdd_lp ground memorycell
Xwire474 n_bl_474 n_bl_475 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ474 ground ground n_bl_475 ground ground ground vdd_lp ground memorycell
X2wire474 n_br_474 n_br_475 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ474 ground ground n_br_475 ground ground ground vdd_lp ground memorycell
Xwire475 n_bl_475 n_bl_476 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ475 ground ground n_bl_476 ground ground ground vdd_lp ground memorycell
X2wire475 n_br_475 n_br_476 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ475 ground ground n_br_476 ground ground ground vdd_lp ground memorycell
Xwire476 n_bl_476 n_bl_477 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ476 ground ground n_bl_477 ground ground ground vdd_lp ground memorycell
X2wire476 n_br_476 n_br_477 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ476 ground ground n_br_477 ground ground ground vdd_lp ground memorycell
Xwire477 n_bl_477 n_bl_478 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ477 ground ground n_bl_478 ground ground ground vdd_lp ground memorycell
X2wire477 n_br_477 n_br_478 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ477 ground ground n_br_478 ground ground ground vdd_lp ground memorycell
Xwire478 n_bl_478 n_bl_479 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ478 ground ground n_bl_479 ground ground ground vdd_lp ground memorycell
X2wire478 n_br_478 n_br_479 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ478 ground ground n_br_479 ground ground ground vdd_lp ground memorycell
Xwire479 n_bl_479 n_bl_480 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ479 ground ground n_bl_480 ground ground ground vdd_lp ground memorycell
X2wire479 n_br_479 n_br_480 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ479 ground ground n_br_480 ground ground ground vdd_lp ground memorycell
Xwire480 n_bl_480 n_bl_481 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ480 ground ground n_bl_481 ground ground ground vdd_lp ground memorycell
X2wire480 n_br_480 n_br_481 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ480 ground ground n_br_481 ground ground ground vdd_lp ground memorycell
Xwire481 n_bl_481 n_bl_482 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ481 ground ground n_bl_482 ground ground ground vdd_lp ground memorycell
X2wire481 n_br_481 n_br_482 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ481 ground ground n_br_482 ground ground ground vdd_lp ground memorycell
Xwire482 n_bl_482 n_bl_483 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ482 ground ground n_bl_483 ground ground ground vdd_lp ground memorycell
X2wire482 n_br_482 n_br_483 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ482 ground ground n_br_483 ground ground ground vdd_lp ground memorycell
Xwire483 n_bl_483 n_bl_484 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ483 ground ground n_bl_484 ground ground ground vdd_lp ground memorycell
X2wire483 n_br_483 n_br_484 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ483 ground ground n_br_484 ground ground ground vdd_lp ground memorycell
Xwire484 n_bl_484 n_bl_485 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ484 ground ground n_bl_485 ground ground ground vdd_lp ground memorycell
X2wire484 n_br_484 n_br_485 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ484 ground ground n_br_485 ground ground ground vdd_lp ground memorycell
Xwire485 n_bl_485 n_bl_486 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ485 ground ground n_bl_486 ground ground ground vdd_lp ground memorycell
X2wire485 n_br_485 n_br_486 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ485 ground ground n_br_486 ground ground ground vdd_lp ground memorycell
Xwire486 n_bl_486 n_bl_487 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ486 ground ground n_bl_487 ground ground ground vdd_lp ground memorycell
X2wire486 n_br_486 n_br_487 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ486 ground ground n_br_487 ground ground ground vdd_lp ground memorycell
Xwire487 n_bl_487 n_bl_488 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ487 ground ground n_bl_488 ground ground ground vdd_lp ground memorycell
X2wire487 n_br_487 n_br_488 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ487 ground ground n_br_488 ground ground ground vdd_lp ground memorycell
Xwire488 n_bl_488 n_bl_489 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ488 ground ground n_bl_489 ground ground ground vdd_lp ground memorycell
X2wire488 n_br_488 n_br_489 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ488 ground ground n_br_489 ground ground ground vdd_lp ground memorycell
Xwire489 n_bl_489 n_bl_490 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ489 ground ground n_bl_490 ground ground ground vdd_lp ground memorycell
X2wire489 n_br_489 n_br_490 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ489 ground ground n_br_490 ground ground ground vdd_lp ground memorycell
Xwire490 n_bl_490 n_bl_491 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ490 ground ground n_bl_491 ground ground ground vdd_lp ground memorycell
X2wire490 n_br_490 n_br_491 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ490 ground ground n_br_491 ground ground ground vdd_lp ground memorycell
Xwire491 n_bl_491 n_bl_492 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ491 ground ground n_bl_492 ground ground ground vdd_lp ground memorycell
X2wire491 n_br_491 n_br_492 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ491 ground ground n_br_492 ground ground ground vdd_lp ground memorycell
Xwire492 n_bl_492 n_bl_493 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ492 ground ground n_bl_493 ground ground ground vdd_lp ground memorycell
X2wire492 n_br_492 n_br_493 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ492 ground ground n_br_493 ground ground ground vdd_lp ground memorycell
Xwire493 n_bl_493 n_bl_494 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ493 ground ground n_bl_494 ground ground ground vdd_lp ground memorycell
X2wire493 n_br_493 n_br_494 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ493 ground ground n_br_494 ground ground ground vdd_lp ground memorycell
Xwire494 n_bl_494 n_bl_495 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ494 ground ground n_bl_495 ground ground ground vdd_lp ground memorycell
X2wire494 n_br_494 n_br_495 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ494 ground ground n_br_495 ground ground ground vdd_lp ground memorycell
Xwire495 n_bl_495 n_bl_496 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ495 ground ground n_bl_496 ground ground ground vdd_lp ground memorycell
X2wire495 n_br_495 n_br_496 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ495 ground ground n_br_496 ground ground ground vdd_lp ground memorycell
Xwire496 n_bl_496 n_bl_497 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ496 ground ground n_bl_497 ground ground ground vdd_lp ground memorycell
X2wire496 n_br_496 n_br_497 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ496 ground ground n_br_497 ground ground ground vdd_lp ground memorycell
Xwire497 n_bl_497 n_bl_498 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ497 ground ground n_bl_498 ground ground ground vdd_lp ground memorycell
X2wire497 n_br_497 n_br_498 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ497 ground ground n_br_498 ground ground ground vdd_lp ground memorycell
Xwire498 n_bl_498 n_bl_499 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ498 ground ground n_bl_499 ground ground ground vdd_lp ground memorycell
X2wire498 n_br_498 n_br_499 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ498 ground ground n_br_499 ground ground ground vdd_lp ground memorycell
Xwire499 n_bl_499 n_bl_500 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ499 ground ground n_bl_500 ground ground ground vdd_lp ground memorycell
X2wire499 n_br_499 n_br_500 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ499 ground ground n_br_500 ground ground ground vdd_lp ground memorycell
Xwire500 n_bl_500 n_bl_501 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ500 ground ground n_bl_501 ground ground ground vdd_lp ground memorycell
X2wire500 n_br_500 n_br_501 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ500 ground ground n_br_501 ground ground ground vdd_lp ground memorycell
Xwire501 n_bl_501 n_bl_502 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ501 ground ground n_bl_502 ground ground ground vdd_lp ground memorycell
X2wire501 n_br_501 n_br_502 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ501 ground ground n_br_502 ground ground ground vdd_lp ground memorycell
Xwire502 n_bl_502 n_bl_503 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ502 ground ground n_bl_503 ground ground ground vdd_lp ground memorycell
X2wire502 n_br_502 n_br_503 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ502 ground ground n_br_503 ground ground ground vdd_lp ground memorycell
Xwire503 n_bl_503 n_bl_504 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ503 ground ground n_bl_504 ground ground ground vdd_lp ground memorycell
X2wire503 n_br_503 n_br_504 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ503 ground ground n_br_504 ground ground ground vdd_lp ground memorycell
Xwire504 n_bl_504 n_bl_505 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ504 ground ground n_bl_505 ground ground ground vdd_lp ground memorycell
X2wire504 n_br_504 n_br_505 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ504 ground ground n_br_505 ground ground ground vdd_lp ground memorycell
Xwire505 n_bl_505 n_bl_506 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ505 ground ground n_bl_506 ground ground ground vdd_lp ground memorycell
X2wire505 n_br_505 n_br_506 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ505 ground ground n_br_506 ground ground ground vdd_lp ground memorycell
Xwire506 n_bl_506 n_bl_507 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ506 ground ground n_bl_507 ground ground ground vdd_lp ground memorycell
X2wire506 n_br_506 n_br_507 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ506 ground ground n_br_507 ground ground ground vdd_lp ground memorycell
Xwire507 n_bl_507 n_bl_508 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ507 ground ground n_bl_508 ground ground ground vdd_lp ground memorycell
X2wire507 n_br_507 n_br_508 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ507 ground ground n_br_508 ground ground ground vdd_lp ground memorycell
Xwire508 n_bl_508 n_bl_509 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ508 ground ground n_bl_509 ground ground ground vdd_lp ground memorycell
X2wire508 n_br_508 n_br_509 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ508 ground ground n_br_509 ground ground ground vdd_lp ground memorycell
Xwire509 n_bl_509 n_bl_510 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ509 ground ground n_bl_510 ground ground ground vdd_lp ground memorycell
X2wire509 n_br_509 n_br_510 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ509 ground ground n_br_510 ground ground ground vdd_lp ground memorycell
Xwire510 n_bl_510 n_bl_511 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ510 ground ground n_bl_511 ground ground ground vdd_lp ground memorycell
X2wire510 n_br_510 n_br_511 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ510 ground ground n_br_511 ground ground ground vdd_lp ground memorycell
Xwire512 n_bl_511 n_bl_512 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ512 vdd_lp ground n_bl_512 ground  vdd_lp ground mtjlow
X2wire512 n_br_511 n_br_512 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2MTJ512 vdd_lp ground n_br_512 ground ground ground vdd_lp ground memorycell
.IC V(n_1_1) = 0 
.IC V(n_2_1) = 0 
.IC V(n_bl_0) = 0 
.IC V(n_br_0) = 0 
.IC V(n_bl_1) = 0 
.IC V(n_br_1) = 0 
.IC V(n_bl_2) = 0 
.IC V(n_br_2) = 0 
.IC V(n_bl_3) = 0 
.IC V(n_br_3) = 0 
.IC V(n_bl_4) = 0 
.IC V(n_br_4) = 0 
.IC V(n_bl_5) = 0 
.IC V(n_br_5) = 0 
.IC V(n_bl_6) = 0 
.IC V(n_br_6) = 0 
.IC V(n_bl_7) = 0 
.IC V(n_br_7) = 0 
.IC V(n_bl_8) = 0 
.IC V(n_br_8) = 0 
.IC V(n_bl_9) = 0 
.IC V(n_br_9) = 0 
.IC V(n_bl_10) = 0 
.IC V(n_br_10) = 0 
.IC V(n_bl_11) = 0 
.IC V(n_br_11) = 0 
.IC V(n_bl_12) = 0 
.IC V(n_br_12) = 0 
.IC V(n_bl_13) = 0 
.IC V(n_br_13) = 0 
.IC V(n_bl_14) = 0 
.IC V(n_br_14) = 0 
.IC V(n_bl_15) = 0 
.IC V(n_br_15) = 0 
.IC V(n_bl_16) = 0 
.IC V(n_br_16) = 0 
.IC V(n_bl_17) = 0 
.IC V(n_br_17) = 0 
.IC V(n_bl_18) = 0 
.IC V(n_br_18) = 0 
.IC V(n_bl_19) = 0 
.IC V(n_br_19) = 0 
.IC V(n_bl_20) = 0 
.IC V(n_br_20) = 0 
.IC V(n_bl_21) = 0 
.IC V(n_br_21) = 0 
.IC V(n_bl_22) = 0 
.IC V(n_br_22) = 0 
.IC V(n_bl_23) = 0 
.IC V(n_br_23) = 0 
.IC V(n_bl_24) = 0 
.IC V(n_br_24) = 0 
.IC V(n_bl_25) = 0 
.IC V(n_br_25) = 0 
.IC V(n_bl_26) = 0 
.IC V(n_br_26) = 0 
.IC V(n_bl_27) = 0 
.IC V(n_br_27) = 0 
.IC V(n_bl_28) = 0 
.IC V(n_br_28) = 0 
.IC V(n_bl_29) = 0 
.IC V(n_br_29) = 0 
.IC V(n_bl_30) = 0 
.IC V(n_br_30) = 0 
.IC V(n_bl_31) = 0 
.IC V(n_br_31) = 0 
.IC V(n_bl_32) = 0 
.IC V(n_br_32) = 0 
.IC V(n_bl_33) = 0 
.IC V(n_br_33) = 0 
.IC V(n_bl_34) = 0 
.IC V(n_br_34) = 0 
.IC V(n_bl_35) = 0 
.IC V(n_br_35) = 0 
.IC V(n_bl_36) = 0 
.IC V(n_br_36) = 0 
.IC V(n_bl_37) = 0 
.IC V(n_br_37) = 0 
.IC V(n_bl_38) = 0 
.IC V(n_br_38) = 0 
.IC V(n_bl_39) = 0 
.IC V(n_br_39) = 0 
.IC V(n_bl_40) = 0 
.IC V(n_br_40) = 0 
.IC V(n_bl_41) = 0 
.IC V(n_br_41) = 0 
.IC V(n_bl_42) = 0 
.IC V(n_br_42) = 0 
.IC V(n_bl_43) = 0 
.IC V(n_br_43) = 0 
.IC V(n_bl_44) = 0 
.IC V(n_br_44) = 0 
.IC V(n_bl_45) = 0 
.IC V(n_br_45) = 0 
.IC V(n_bl_46) = 0 
.IC V(n_br_46) = 0 
.IC V(n_bl_47) = 0 
.IC V(n_br_47) = 0 
.IC V(n_bl_48) = 0 
.IC V(n_br_48) = 0 
.IC V(n_bl_49) = 0 
.IC V(n_br_49) = 0 
.IC V(n_bl_50) = 0 
.IC V(n_br_50) = 0 
.IC V(n_bl_51) = 0 
.IC V(n_br_51) = 0 
.IC V(n_bl_52) = 0 
.IC V(n_br_52) = 0 
.IC V(n_bl_53) = 0 
.IC V(n_br_53) = 0 
.IC V(n_bl_54) = 0 
.IC V(n_br_54) = 0 
.IC V(n_bl_55) = 0 
.IC V(n_br_55) = 0 
.IC V(n_bl_56) = 0 
.IC V(n_br_56) = 0 
.IC V(n_bl_57) = 0 
.IC V(n_br_57) = 0 
.IC V(n_bl_58) = 0 
.IC V(n_br_58) = 0 
.IC V(n_bl_59) = 0 
.IC V(n_br_59) = 0 
.IC V(n_bl_60) = 0 
.IC V(n_br_60) = 0 
.IC V(n_bl_61) = 0 
.IC V(n_br_61) = 0 
.IC V(n_bl_62) = 0 
.IC V(n_br_62) = 0 
.IC V(n_bl_63) = 0 
.IC V(n_br_63) = 0 
.IC V(n_bl_64) = 0 
.IC V(n_br_64) = 0 
.IC V(n_bl_65) = 0 
.IC V(n_br_65) = 0 
.IC V(n_bl_66) = 0 
.IC V(n_br_66) = 0 
.IC V(n_bl_67) = 0 
.IC V(n_br_67) = 0 
.IC V(n_bl_68) = 0 
.IC V(n_br_68) = 0 
.IC V(n_bl_69) = 0 
.IC V(n_br_69) = 0 
.IC V(n_bl_70) = 0 
.IC V(n_br_70) = 0 
.IC V(n_bl_71) = 0 
.IC V(n_br_71) = 0 
.IC V(n_bl_72) = 0 
.IC V(n_br_72) = 0 
.IC V(n_bl_73) = 0 
.IC V(n_br_73) = 0 
.IC V(n_bl_74) = 0 
.IC V(n_br_74) = 0 
.IC V(n_bl_75) = 0 
.IC V(n_br_75) = 0 
.IC V(n_bl_76) = 0 
.IC V(n_br_76) = 0 
.IC V(n_bl_77) = 0 
.IC V(n_br_77) = 0 
.IC V(n_bl_78) = 0 
.IC V(n_br_78) = 0 
.IC V(n_bl_79) = 0 
.IC V(n_br_79) = 0 
.IC V(n_bl_80) = 0 
.IC V(n_br_80) = 0 
.IC V(n_bl_81) = 0 
.IC V(n_br_81) = 0 
.IC V(n_bl_82) = 0 
.IC V(n_br_82) = 0 
.IC V(n_bl_83) = 0 
.IC V(n_br_83) = 0 
.IC V(n_bl_84) = 0 
.IC V(n_br_84) = 0 
.IC V(n_bl_85) = 0 
.IC V(n_br_85) = 0 
.IC V(n_bl_86) = 0 
.IC V(n_br_86) = 0 
.IC V(n_bl_87) = 0 
.IC V(n_br_87) = 0 
.IC V(n_bl_88) = 0 
.IC V(n_br_88) = 0 
.IC V(n_bl_89) = 0 
.IC V(n_br_89) = 0 
.IC V(n_bl_90) = 0 
.IC V(n_br_90) = 0 
.IC V(n_bl_91) = 0 
.IC V(n_br_91) = 0 
.IC V(n_bl_92) = 0 
.IC V(n_br_92) = 0 
.IC V(n_bl_93) = 0 
.IC V(n_br_93) = 0 
.IC V(n_bl_94) = 0 
.IC V(n_br_94) = 0 
.IC V(n_bl_95) = 0 
.IC V(n_br_95) = 0 
.IC V(n_bl_96) = 0 
.IC V(n_br_96) = 0 
.IC V(n_bl_97) = 0 
.IC V(n_br_97) = 0 
.IC V(n_bl_98) = 0 
.IC V(n_br_98) = 0 
.IC V(n_bl_99) = 0 
.IC V(n_br_99) = 0 
.IC V(n_bl_100) = 0 
.IC V(n_br_100) = 0 
.IC V(n_bl_101) = 0 
.IC V(n_br_101) = 0 
.IC V(n_bl_102) = 0 
.IC V(n_br_102) = 0 
.IC V(n_bl_103) = 0 
.IC V(n_br_103) = 0 
.IC V(n_bl_104) = 0 
.IC V(n_br_104) = 0 
.IC V(n_bl_105) = 0 
.IC V(n_br_105) = 0 
.IC V(n_bl_106) = 0 
.IC V(n_br_106) = 0 
.IC V(n_bl_107) = 0 
.IC V(n_br_107) = 0 
.IC V(n_bl_108) = 0 
.IC V(n_br_108) = 0 
.IC V(n_bl_109) = 0 
.IC V(n_br_109) = 0 
.IC V(n_bl_110) = 0 
.IC V(n_br_110) = 0 
.IC V(n_bl_111) = 0 
.IC V(n_br_111) = 0 
.IC V(n_bl_112) = 0 
.IC V(n_br_112) = 0 
.IC V(n_bl_113) = 0 
.IC V(n_br_113) = 0 
.IC V(n_bl_114) = 0 
.IC V(n_br_114) = 0 
.IC V(n_bl_115) = 0 
.IC V(n_br_115) = 0 
.IC V(n_bl_116) = 0 
.IC V(n_br_116) = 0 
.IC V(n_bl_117) = 0 
.IC V(n_br_117) = 0 
.IC V(n_bl_118) = 0 
.IC V(n_br_118) = 0 
.IC V(n_bl_119) = 0 
.IC V(n_br_119) = 0 
.IC V(n_bl_120) = 0 
.IC V(n_br_120) = 0 
.IC V(n_bl_121) = 0 
.IC V(n_br_121) = 0 
.IC V(n_bl_122) = 0 
.IC V(n_br_122) = 0 
.IC V(n_bl_123) = 0 
.IC V(n_br_123) = 0 
.IC V(n_bl_124) = 0 
.IC V(n_br_124) = 0 
.IC V(n_bl_125) = 0 
.IC V(n_br_125) = 0 
.IC V(n_bl_126) = 0 
.IC V(n_br_126) = 0 
.IC V(n_bl_127) = 0 
.IC V(n_br_127) = 0 
.IC V(n_bl_128) = 0 
.IC V(n_br_128) = 0 
.IC V(n_bl_129) = 0 
.IC V(n_br_129) = 0 
.IC V(n_bl_130) = 0 
.IC V(n_br_130) = 0 
.IC V(n_bl_131) = 0 
.IC V(n_br_131) = 0 
.IC V(n_bl_132) = 0 
.IC V(n_br_132) = 0 
.IC V(n_bl_133) = 0 
.IC V(n_br_133) = 0 
.IC V(n_bl_134) = 0 
.IC V(n_br_134) = 0 
.IC V(n_bl_135) = 0 
.IC V(n_br_135) = 0 
.IC V(n_bl_136) = 0 
.IC V(n_br_136) = 0 
.IC V(n_bl_137) = 0 
.IC V(n_br_137) = 0 
.IC V(n_bl_138) = 0 
.IC V(n_br_138) = 0 
.IC V(n_bl_139) = 0 
.IC V(n_br_139) = 0 
.IC V(n_bl_140) = 0 
.IC V(n_br_140) = 0 
.IC V(n_bl_141) = 0 
.IC V(n_br_141) = 0 
.IC V(n_bl_142) = 0 
.IC V(n_br_142) = 0 
.IC V(n_bl_143) = 0 
.IC V(n_br_143) = 0 
.IC V(n_bl_144) = 0 
.IC V(n_br_144) = 0 
.IC V(n_bl_145) = 0 
.IC V(n_br_145) = 0 
.IC V(n_bl_146) = 0 
.IC V(n_br_146) = 0 
.IC V(n_bl_147) = 0 
.IC V(n_br_147) = 0 
.IC V(n_bl_148) = 0 
.IC V(n_br_148) = 0 
.IC V(n_bl_149) = 0 
.IC V(n_br_149) = 0 
.IC V(n_bl_150) = 0 
.IC V(n_br_150) = 0 
.IC V(n_bl_151) = 0 
.IC V(n_br_151) = 0 
.IC V(n_bl_152) = 0 
.IC V(n_br_152) = 0 
.IC V(n_bl_153) = 0 
.IC V(n_br_153) = 0 
.IC V(n_bl_154) = 0 
.IC V(n_br_154) = 0 
.IC V(n_bl_155) = 0 
.IC V(n_br_155) = 0 
.IC V(n_bl_156) = 0 
.IC V(n_br_156) = 0 
.IC V(n_bl_157) = 0 
.IC V(n_br_157) = 0 
.IC V(n_bl_158) = 0 
.IC V(n_br_158) = 0 
.IC V(n_bl_159) = 0 
.IC V(n_br_159) = 0 
.IC V(n_bl_160) = 0 
.IC V(n_br_160) = 0 
.IC V(n_bl_161) = 0 
.IC V(n_br_161) = 0 
.IC V(n_bl_162) = 0 
.IC V(n_br_162) = 0 
.IC V(n_bl_163) = 0 
.IC V(n_br_163) = 0 
.IC V(n_bl_164) = 0 
.IC V(n_br_164) = 0 
.IC V(n_bl_165) = 0 
.IC V(n_br_165) = 0 
.IC V(n_bl_166) = 0 
.IC V(n_br_166) = 0 
.IC V(n_bl_167) = 0 
.IC V(n_br_167) = 0 
.IC V(n_bl_168) = 0 
.IC V(n_br_168) = 0 
.IC V(n_bl_169) = 0 
.IC V(n_br_169) = 0 
.IC V(n_bl_170) = 0 
.IC V(n_br_170) = 0 
.IC V(n_bl_171) = 0 
.IC V(n_br_171) = 0 
.IC V(n_bl_172) = 0 
.IC V(n_br_172) = 0 
.IC V(n_bl_173) = 0 
.IC V(n_br_173) = 0 
.IC V(n_bl_174) = 0 
.IC V(n_br_174) = 0 
.IC V(n_bl_175) = 0 
.IC V(n_br_175) = 0 
.IC V(n_bl_176) = 0 
.IC V(n_br_176) = 0 
.IC V(n_bl_177) = 0 
.IC V(n_br_177) = 0 
.IC V(n_bl_178) = 0 
.IC V(n_br_178) = 0 
.IC V(n_bl_179) = 0 
.IC V(n_br_179) = 0 
.IC V(n_bl_180) = 0 
.IC V(n_br_180) = 0 
.IC V(n_bl_181) = 0 
.IC V(n_br_181) = 0 
.IC V(n_bl_182) = 0 
.IC V(n_br_182) = 0 
.IC V(n_bl_183) = 0 
.IC V(n_br_183) = 0 
.IC V(n_bl_184) = 0 
.IC V(n_br_184) = 0 
.IC V(n_bl_185) = 0 
.IC V(n_br_185) = 0 
.IC V(n_bl_186) = 0 
.IC V(n_br_186) = 0 
.IC V(n_bl_187) = 0 
.IC V(n_br_187) = 0 
.IC V(n_bl_188) = 0 
.IC V(n_br_188) = 0 
.IC V(n_bl_189) = 0 
.IC V(n_br_189) = 0 
.IC V(n_bl_190) = 0 
.IC V(n_br_190) = 0 
.IC V(n_bl_191) = 0 
.IC V(n_br_191) = 0 
.IC V(n_bl_192) = 0 
.IC V(n_br_192) = 0 
.IC V(n_bl_193) = 0 
.IC V(n_br_193) = 0 
.IC V(n_bl_194) = 0 
.IC V(n_br_194) = 0 
.IC V(n_bl_195) = 0 
.IC V(n_br_195) = 0 
.IC V(n_bl_196) = 0 
.IC V(n_br_196) = 0 
.IC V(n_bl_197) = 0 
.IC V(n_br_197) = 0 
.IC V(n_bl_198) = 0 
.IC V(n_br_198) = 0 
.IC V(n_bl_199) = 0 
.IC V(n_br_199) = 0 
.IC V(n_bl_200) = 0 
.IC V(n_br_200) = 0 
.IC V(n_bl_201) = 0 
.IC V(n_br_201) = 0 
.IC V(n_bl_202) = 0 
.IC V(n_br_202) = 0 
.IC V(n_bl_203) = 0 
.IC V(n_br_203) = 0 
.IC V(n_bl_204) = 0 
.IC V(n_br_204) = 0 
.IC V(n_bl_205) = 0 
.IC V(n_br_205) = 0 
.IC V(n_bl_206) = 0 
.IC V(n_br_206) = 0 
.IC V(n_bl_207) = 0 
.IC V(n_br_207) = 0 
.IC V(n_bl_208) = 0 
.IC V(n_br_208) = 0 
.IC V(n_bl_209) = 0 
.IC V(n_br_209) = 0 
.IC V(n_bl_210) = 0 
.IC V(n_br_210) = 0 
.IC V(n_bl_211) = 0 
.IC V(n_br_211) = 0 
.IC V(n_bl_212) = 0 
.IC V(n_br_212) = 0 
.IC V(n_bl_213) = 0 
.IC V(n_br_213) = 0 
.IC V(n_bl_214) = 0 
.IC V(n_br_214) = 0 
.IC V(n_bl_215) = 0 
.IC V(n_br_215) = 0 
.IC V(n_bl_216) = 0 
.IC V(n_br_216) = 0 
.IC V(n_bl_217) = 0 
.IC V(n_br_217) = 0 
.IC V(n_bl_218) = 0 
.IC V(n_br_218) = 0 
.IC V(n_bl_219) = 0 
.IC V(n_br_219) = 0 
.IC V(n_bl_220) = 0 
.IC V(n_br_220) = 0 
.IC V(n_bl_221) = 0 
.IC V(n_br_221) = 0 
.IC V(n_bl_222) = 0 
.IC V(n_br_222) = 0 
.IC V(n_bl_223) = 0 
.IC V(n_br_223) = 0 
.IC V(n_bl_224) = 0 
.IC V(n_br_224) = 0 
.IC V(n_bl_225) = 0 
.IC V(n_br_225) = 0 
.IC V(n_bl_226) = 0 
.IC V(n_br_226) = 0 
.IC V(n_bl_227) = 0 
.IC V(n_br_227) = 0 
.IC V(n_bl_228) = 0 
.IC V(n_br_228) = 0 
.IC V(n_bl_229) = 0 
.IC V(n_br_229) = 0 
.IC V(n_bl_230) = 0 
.IC V(n_br_230) = 0 
.IC V(n_bl_231) = 0 
.IC V(n_br_231) = 0 
.IC V(n_bl_232) = 0 
.IC V(n_br_232) = 0 
.IC V(n_bl_233) = 0 
.IC V(n_br_233) = 0 
.IC V(n_bl_234) = 0 
.IC V(n_br_234) = 0 
.IC V(n_bl_235) = 0 
.IC V(n_br_235) = 0 
.IC V(n_bl_236) = 0 
.IC V(n_br_236) = 0 
.IC V(n_bl_237) = 0 
.IC V(n_br_237) = 0 
.IC V(n_bl_238) = 0 
.IC V(n_br_238) = 0 
.IC V(n_bl_239) = 0 
.IC V(n_br_239) = 0 
.IC V(n_bl_240) = 0 
.IC V(n_br_240) = 0 
.IC V(n_bl_241) = 0 
.IC V(n_br_241) = 0 
.IC V(n_bl_242) = 0 
.IC V(n_br_242) = 0 
.IC V(n_bl_243) = 0 
.IC V(n_br_243) = 0 
.IC V(n_bl_244) = 0 
.IC V(n_br_244) = 0 
.IC V(n_bl_245) = 0 
.IC V(n_br_245) = 0 
.IC V(n_bl_246) = 0 
.IC V(n_br_246) = 0 
.IC V(n_bl_247) = 0 
.IC V(n_br_247) = 0 
.IC V(n_bl_248) = 0 
.IC V(n_br_248) = 0 
.IC V(n_bl_249) = 0 
.IC V(n_br_249) = 0 
.IC V(n_bl_250) = 0 
.IC V(n_br_250) = 0 
.IC V(n_bl_251) = 0 
.IC V(n_br_251) = 0 
.IC V(n_bl_252) = 0 
.IC V(n_br_252) = 0 
.IC V(n_bl_253) = 0 
.IC V(n_br_253) = 0 
.IC V(n_bl_254) = 0 
.IC V(n_br_254) = 0 
.IC V(n_bl_255) = 0 
.IC V(n_br_255) = 0 
.IC V(n_bl_256) = 0 
.IC V(n_br_256) = 0 
.IC V(n_bl_257) = 0 
.IC V(n_br_257) = 0 
.IC V(n_bl_258) = 0 
.IC V(n_br_258) = 0 
.IC V(n_bl_259) = 0 
.IC V(n_br_259) = 0 
.IC V(n_bl_260) = 0 
.IC V(n_br_260) = 0 
.IC V(n_bl_261) = 0 
.IC V(n_br_261) = 0 
.IC V(n_bl_262) = 0 
.IC V(n_br_262) = 0 
.IC V(n_bl_263) = 0 
.IC V(n_br_263) = 0 
.IC V(n_bl_264) = 0 
.IC V(n_br_264) = 0 
.IC V(n_bl_265) = 0 
.IC V(n_br_265) = 0 
.IC V(n_bl_266) = 0 
.IC V(n_br_266) = 0 
.IC V(n_bl_267) = 0 
.IC V(n_br_267) = 0 
.IC V(n_bl_268) = 0 
.IC V(n_br_268) = 0 
.IC V(n_bl_269) = 0 
.IC V(n_br_269) = 0 
.IC V(n_bl_270) = 0 
.IC V(n_br_270) = 0 
.IC V(n_bl_271) = 0 
.IC V(n_br_271) = 0 
.IC V(n_bl_272) = 0 
.IC V(n_br_272) = 0 
.IC V(n_bl_273) = 0 
.IC V(n_br_273) = 0 
.IC V(n_bl_274) = 0 
.IC V(n_br_274) = 0 
.IC V(n_bl_275) = 0 
.IC V(n_br_275) = 0 
.IC V(n_bl_276) = 0 
.IC V(n_br_276) = 0 
.IC V(n_bl_277) = 0 
.IC V(n_br_277) = 0 
.IC V(n_bl_278) = 0 
.IC V(n_br_278) = 0 
.IC V(n_bl_279) = 0 
.IC V(n_br_279) = 0 
.IC V(n_bl_280) = 0 
.IC V(n_br_280) = 0 
.IC V(n_bl_281) = 0 
.IC V(n_br_281) = 0 
.IC V(n_bl_282) = 0 
.IC V(n_br_282) = 0 
.IC V(n_bl_283) = 0 
.IC V(n_br_283) = 0 
.IC V(n_bl_284) = 0 
.IC V(n_br_284) = 0 
.IC V(n_bl_285) = 0 
.IC V(n_br_285) = 0 
.IC V(n_bl_286) = 0 
.IC V(n_br_286) = 0 
.IC V(n_bl_287) = 0 
.IC V(n_br_287) = 0 
.IC V(n_bl_288) = 0 
.IC V(n_br_288) = 0 
.IC V(n_bl_289) = 0 
.IC V(n_br_289) = 0 
.IC V(n_bl_290) = 0 
.IC V(n_br_290) = 0 
.IC V(n_bl_291) = 0 
.IC V(n_br_291) = 0 
.IC V(n_bl_292) = 0 
.IC V(n_br_292) = 0 
.IC V(n_bl_293) = 0 
.IC V(n_br_293) = 0 
.IC V(n_bl_294) = 0 
.IC V(n_br_294) = 0 
.IC V(n_bl_295) = 0 
.IC V(n_br_295) = 0 
.IC V(n_bl_296) = 0 
.IC V(n_br_296) = 0 
.IC V(n_bl_297) = 0 
.IC V(n_br_297) = 0 
.IC V(n_bl_298) = 0 
.IC V(n_br_298) = 0 
.IC V(n_bl_299) = 0 
.IC V(n_br_299) = 0 
.IC V(n_bl_300) = 0 
.IC V(n_br_300) = 0 
.IC V(n_bl_301) = 0 
.IC V(n_br_301) = 0 
.IC V(n_bl_302) = 0 
.IC V(n_br_302) = 0 
.IC V(n_bl_303) = 0 
.IC V(n_br_303) = 0 
.IC V(n_bl_304) = 0 
.IC V(n_br_304) = 0 
.IC V(n_bl_305) = 0 
.IC V(n_br_305) = 0 
.IC V(n_bl_306) = 0 
.IC V(n_br_306) = 0 
.IC V(n_bl_307) = 0 
.IC V(n_br_307) = 0 
.IC V(n_bl_308) = 0 
.IC V(n_br_308) = 0 
.IC V(n_bl_309) = 0 
.IC V(n_br_309) = 0 
.IC V(n_bl_310) = 0 
.IC V(n_br_310) = 0 
.IC V(n_bl_311) = 0 
.IC V(n_br_311) = 0 
.IC V(n_bl_312) = 0 
.IC V(n_br_312) = 0 
.IC V(n_bl_313) = 0 
.IC V(n_br_313) = 0 
.IC V(n_bl_314) = 0 
.IC V(n_br_314) = 0 
.IC V(n_bl_315) = 0 
.IC V(n_br_315) = 0 
.IC V(n_bl_316) = 0 
.IC V(n_br_316) = 0 
.IC V(n_bl_317) = 0 
.IC V(n_br_317) = 0 
.IC V(n_bl_318) = 0 
.IC V(n_br_318) = 0 
.IC V(n_bl_319) = 0 
.IC V(n_br_319) = 0 
.IC V(n_bl_320) = 0 
.IC V(n_br_320) = 0 
.IC V(n_bl_321) = 0 
.IC V(n_br_321) = 0 
.IC V(n_bl_322) = 0 
.IC V(n_br_322) = 0 
.IC V(n_bl_323) = 0 
.IC V(n_br_323) = 0 
.IC V(n_bl_324) = 0 
.IC V(n_br_324) = 0 
.IC V(n_bl_325) = 0 
.IC V(n_br_325) = 0 
.IC V(n_bl_326) = 0 
.IC V(n_br_326) = 0 
.IC V(n_bl_327) = 0 
.IC V(n_br_327) = 0 
.IC V(n_bl_328) = 0 
.IC V(n_br_328) = 0 
.IC V(n_bl_329) = 0 
.IC V(n_br_329) = 0 
.IC V(n_bl_330) = 0 
.IC V(n_br_330) = 0 
.IC V(n_bl_331) = 0 
.IC V(n_br_331) = 0 
.IC V(n_bl_332) = 0 
.IC V(n_br_332) = 0 
.IC V(n_bl_333) = 0 
.IC V(n_br_333) = 0 
.IC V(n_bl_334) = 0 
.IC V(n_br_334) = 0 
.IC V(n_bl_335) = 0 
.IC V(n_br_335) = 0 
.IC V(n_bl_336) = 0 
.IC V(n_br_336) = 0 
.IC V(n_bl_337) = 0 
.IC V(n_br_337) = 0 
.IC V(n_bl_338) = 0 
.IC V(n_br_338) = 0 
.IC V(n_bl_339) = 0 
.IC V(n_br_339) = 0 
.IC V(n_bl_340) = 0 
.IC V(n_br_340) = 0 
.IC V(n_bl_341) = 0 
.IC V(n_br_341) = 0 
.IC V(n_bl_342) = 0 
.IC V(n_br_342) = 0 
.IC V(n_bl_343) = 0 
.IC V(n_br_343) = 0 
.IC V(n_bl_344) = 0 
.IC V(n_br_344) = 0 
.IC V(n_bl_345) = 0 
.IC V(n_br_345) = 0 
.IC V(n_bl_346) = 0 
.IC V(n_br_346) = 0 
.IC V(n_bl_347) = 0 
.IC V(n_br_347) = 0 
.IC V(n_bl_348) = 0 
.IC V(n_br_348) = 0 
.IC V(n_bl_349) = 0 
.IC V(n_br_349) = 0 
.IC V(n_bl_350) = 0 
.IC V(n_br_350) = 0 
.IC V(n_bl_351) = 0 
.IC V(n_br_351) = 0 
.IC V(n_bl_352) = 0 
.IC V(n_br_352) = 0 
.IC V(n_bl_353) = 0 
.IC V(n_br_353) = 0 
.IC V(n_bl_354) = 0 
.IC V(n_br_354) = 0 
.IC V(n_bl_355) = 0 
.IC V(n_br_355) = 0 
.IC V(n_bl_356) = 0 
.IC V(n_br_356) = 0 
.IC V(n_bl_357) = 0 
.IC V(n_br_357) = 0 
.IC V(n_bl_358) = 0 
.IC V(n_br_358) = 0 
.IC V(n_bl_359) = 0 
.IC V(n_br_359) = 0 
.IC V(n_bl_360) = 0 
.IC V(n_br_360) = 0 
.IC V(n_bl_361) = 0 
.IC V(n_br_361) = 0 
.IC V(n_bl_362) = 0 
.IC V(n_br_362) = 0 
.IC V(n_bl_363) = 0 
.IC V(n_br_363) = 0 
.IC V(n_bl_364) = 0 
.IC V(n_br_364) = 0 
.IC V(n_bl_365) = 0 
.IC V(n_br_365) = 0 
.IC V(n_bl_366) = 0 
.IC V(n_br_366) = 0 
.IC V(n_bl_367) = 0 
.IC V(n_br_367) = 0 
.IC V(n_bl_368) = 0 
.IC V(n_br_368) = 0 
.IC V(n_bl_369) = 0 
.IC V(n_br_369) = 0 
.IC V(n_bl_370) = 0 
.IC V(n_br_370) = 0 
.IC V(n_bl_371) = 0 
.IC V(n_br_371) = 0 
.IC V(n_bl_372) = 0 
.IC V(n_br_372) = 0 
.IC V(n_bl_373) = 0 
.IC V(n_br_373) = 0 
.IC V(n_bl_374) = 0 
.IC V(n_br_374) = 0 
.IC V(n_bl_375) = 0 
.IC V(n_br_375) = 0 
.IC V(n_bl_376) = 0 
.IC V(n_br_376) = 0 
.IC V(n_bl_377) = 0 
.IC V(n_br_377) = 0 
.IC V(n_bl_378) = 0 
.IC V(n_br_378) = 0 
.IC V(n_bl_379) = 0 
.IC V(n_br_379) = 0 
.IC V(n_bl_380) = 0 
.IC V(n_br_380) = 0 
.IC V(n_bl_381) = 0 
.IC V(n_br_381) = 0 
.IC V(n_bl_382) = 0 
.IC V(n_br_382) = 0 
.IC V(n_bl_383) = 0 
.IC V(n_br_383) = 0 
.IC V(n_bl_384) = 0 
.IC V(n_br_384) = 0 
.IC V(n_bl_385) = 0 
.IC V(n_br_385) = 0 
.IC V(n_bl_386) = 0 
.IC V(n_br_386) = 0 
.IC V(n_bl_387) = 0 
.IC V(n_br_387) = 0 
.IC V(n_bl_388) = 0 
.IC V(n_br_388) = 0 
.IC V(n_bl_389) = 0 
.IC V(n_br_389) = 0 
.IC V(n_bl_390) = 0 
.IC V(n_br_390) = 0 
.IC V(n_bl_391) = 0 
.IC V(n_br_391) = 0 
.IC V(n_bl_392) = 0 
.IC V(n_br_392) = 0 
.IC V(n_bl_393) = 0 
.IC V(n_br_393) = 0 
.IC V(n_bl_394) = 0 
.IC V(n_br_394) = 0 
.IC V(n_bl_395) = 0 
.IC V(n_br_395) = 0 
.IC V(n_bl_396) = 0 
.IC V(n_br_396) = 0 
.IC V(n_bl_397) = 0 
.IC V(n_br_397) = 0 
.IC V(n_bl_398) = 0 
.IC V(n_br_398) = 0 
.IC V(n_bl_399) = 0 
.IC V(n_br_399) = 0 
.IC V(n_bl_400) = 0 
.IC V(n_br_400) = 0 
.IC V(n_bl_401) = 0 
.IC V(n_br_401) = 0 
.IC V(n_bl_402) = 0 
.IC V(n_br_402) = 0 
.IC V(n_bl_403) = 0 
.IC V(n_br_403) = 0 
.IC V(n_bl_404) = 0 
.IC V(n_br_404) = 0 
.IC V(n_bl_405) = 0 
.IC V(n_br_405) = 0 
.IC V(n_bl_406) = 0 
.IC V(n_br_406) = 0 
.IC V(n_bl_407) = 0 
.IC V(n_br_407) = 0 
.IC V(n_bl_408) = 0 
.IC V(n_br_408) = 0 
.IC V(n_bl_409) = 0 
.IC V(n_br_409) = 0 
.IC V(n_bl_410) = 0 
.IC V(n_br_410) = 0 
.IC V(n_bl_411) = 0 
.IC V(n_br_411) = 0 
.IC V(n_bl_412) = 0 
.IC V(n_br_412) = 0 
.IC V(n_bl_413) = 0 
.IC V(n_br_413) = 0 
.IC V(n_bl_414) = 0 
.IC V(n_br_414) = 0 
.IC V(n_bl_415) = 0 
.IC V(n_br_415) = 0 
.IC V(n_bl_416) = 0 
.IC V(n_br_416) = 0 
.IC V(n_bl_417) = 0 
.IC V(n_br_417) = 0 
.IC V(n_bl_418) = 0 
.IC V(n_br_418) = 0 
.IC V(n_bl_419) = 0 
.IC V(n_br_419) = 0 
.IC V(n_bl_420) = 0 
.IC V(n_br_420) = 0 
.IC V(n_bl_421) = 0 
.IC V(n_br_421) = 0 
.IC V(n_bl_422) = 0 
.IC V(n_br_422) = 0 
.IC V(n_bl_423) = 0 
.IC V(n_br_423) = 0 
.IC V(n_bl_424) = 0 
.IC V(n_br_424) = 0 
.IC V(n_bl_425) = 0 
.IC V(n_br_425) = 0 
.IC V(n_bl_426) = 0 
.IC V(n_br_426) = 0 
.IC V(n_bl_427) = 0 
.IC V(n_br_427) = 0 
.IC V(n_bl_428) = 0 
.IC V(n_br_428) = 0 
.IC V(n_bl_429) = 0 
.IC V(n_br_429) = 0 
.IC V(n_bl_430) = 0 
.IC V(n_br_430) = 0 
.IC V(n_bl_431) = 0 
.IC V(n_br_431) = 0 
.IC V(n_bl_432) = 0 
.IC V(n_br_432) = 0 
.IC V(n_bl_433) = 0 
.IC V(n_br_433) = 0 
.IC V(n_bl_434) = 0 
.IC V(n_br_434) = 0 
.IC V(n_bl_435) = 0 
.IC V(n_br_435) = 0 
.IC V(n_bl_436) = 0 
.IC V(n_br_436) = 0 
.IC V(n_bl_437) = 0 
.IC V(n_br_437) = 0 
.IC V(n_bl_438) = 0 
.IC V(n_br_438) = 0 
.IC V(n_bl_439) = 0 
.IC V(n_br_439) = 0 
.IC V(n_bl_440) = 0 
.IC V(n_br_440) = 0 
.IC V(n_bl_441) = 0 
.IC V(n_br_441) = 0 
.IC V(n_bl_442) = 0 
.IC V(n_br_442) = 0 
.IC V(n_bl_443) = 0 
.IC V(n_br_443) = 0 
.IC V(n_bl_444) = 0 
.IC V(n_br_444) = 0 
.IC V(n_bl_445) = 0 
.IC V(n_br_445) = 0 
.IC V(n_bl_446) = 0 
.IC V(n_br_446) = 0 
.IC V(n_bl_447) = 0 
.IC V(n_br_447) = 0 
.IC V(n_bl_448) = 0 
.IC V(n_br_448) = 0 
.IC V(n_bl_449) = 0 
.IC V(n_br_449) = 0 
.IC V(n_bl_450) = 0 
.IC V(n_br_450) = 0 
.IC V(n_bl_451) = 0 
.IC V(n_br_451) = 0 
.IC V(n_bl_452) = 0 
.IC V(n_br_452) = 0 
.IC V(n_bl_453) = 0 
.IC V(n_br_453) = 0 
.IC V(n_bl_454) = 0 
.IC V(n_br_454) = 0 
.IC V(n_bl_455) = 0 
.IC V(n_br_455) = 0 
.IC V(n_bl_456) = 0 
.IC V(n_br_456) = 0 
.IC V(n_bl_457) = 0 
.IC V(n_br_457) = 0 
.IC V(n_bl_458) = 0 
.IC V(n_br_458) = 0 
.IC V(n_bl_459) = 0 
.IC V(n_br_459) = 0 
.IC V(n_bl_460) = 0 
.IC V(n_br_460) = 0 
.IC V(n_bl_461) = 0 
.IC V(n_br_461) = 0 
.IC V(n_bl_462) = 0 
.IC V(n_br_462) = 0 
.IC V(n_bl_463) = 0 
.IC V(n_br_463) = 0 
.IC V(n_bl_464) = 0 
.IC V(n_br_464) = 0 
.IC V(n_bl_465) = 0 
.IC V(n_br_465) = 0 
.IC V(n_bl_466) = 0 
.IC V(n_br_466) = 0 
.IC V(n_bl_467) = 0 
.IC V(n_br_467) = 0 
.IC V(n_bl_468) = 0 
.IC V(n_br_468) = 0 
.IC V(n_bl_469) = 0 
.IC V(n_br_469) = 0 
.IC V(n_bl_470) = 0 
.IC V(n_br_470) = 0 
.IC V(n_bl_471) = 0 
.IC V(n_br_471) = 0 
.IC V(n_bl_472) = 0 
.IC V(n_br_472) = 0 
.IC V(n_bl_473) = 0 
.IC V(n_br_473) = 0 
.IC V(n_bl_474) = 0 
.IC V(n_br_474) = 0 
.IC V(n_bl_475) = 0 
.IC V(n_br_475) = 0 
.IC V(n_bl_476) = 0 
.IC V(n_br_476) = 0 
.IC V(n_bl_477) = 0 
.IC V(n_br_477) = 0 
.IC V(n_bl_478) = 0 
.IC V(n_br_478) = 0 
.IC V(n_bl_479) = 0 
.IC V(n_br_479) = 0 
.IC V(n_bl_480) = 0 
.IC V(n_br_480) = 0 
.IC V(n_bl_481) = 0 
.IC V(n_br_481) = 0 
.IC V(n_bl_482) = 0 
.IC V(n_br_482) = 0 
.IC V(n_bl_483) = 0 
.IC V(n_br_483) = 0 
.IC V(n_bl_484) = 0 
.IC V(n_br_484) = 0 
.IC V(n_bl_485) = 0 
.IC V(n_br_485) = 0 
.IC V(n_bl_486) = 0 
.IC V(n_br_486) = 0 
.IC V(n_bl_487) = 0 
.IC V(n_br_487) = 0 
.IC V(n_bl_488) = 0 
.IC V(n_br_488) = 0 
.IC V(n_bl_489) = 0 
.IC V(n_br_489) = 0 
.IC V(n_bl_490) = 0 
.IC V(n_br_490) = 0 
.IC V(n_bl_491) = 0 
.IC V(n_br_491) = 0 
.IC V(n_bl_492) = 0 
.IC V(n_br_492) = 0 
.IC V(n_bl_493) = 0 
.IC V(n_br_493) = 0 
.IC V(n_bl_494) = 0 
.IC V(n_br_494) = 0 
.IC V(n_bl_495) = 0 
.IC V(n_br_495) = 0 
.IC V(n_bl_496) = 0 
.IC V(n_br_496) = 0 
.IC V(n_bl_497) = 0 
.IC V(n_br_497) = 0 
.IC V(n_bl_498) = 0 
.IC V(n_br_498) = 0 
.IC V(n_bl_499) = 0 
.IC V(n_br_499) = 0 
.IC V(n_bl_500) = 0 
.IC V(n_br_500) = 0 
.IC V(n_bl_501) = 0 
.IC V(n_br_501) = 0 
.IC V(n_bl_502) = 0 
.IC V(n_br_502) = 0 
.IC V(n_bl_503) = 0 
.IC V(n_br_503) = 0 
.IC V(n_bl_504) = 0 
.IC V(n_br_504) = 0 
.IC V(n_bl_505) = 0 
.IC V(n_br_505) = 0 
.IC V(n_bl_506) = 0 
.IC V(n_br_506) = 0 
.IC V(n_bl_507) = 0 
.IC V(n_br_507) = 0 
.IC V(n_bl_508) = 0 
.IC V(n_br_508) = 0 
.IC V(n_bl_509) = 0 
.IC V(n_br_509) = 0 
.IC V(n_bl_510) = 0 
.IC V(n_br_510) = 0 
.IC V(n_bl_511) = 0 
.IC V(n_br_511) = 0 
.IC V(n_bl_512) = 0 
.IC V(n_br_512) = 0 
.END