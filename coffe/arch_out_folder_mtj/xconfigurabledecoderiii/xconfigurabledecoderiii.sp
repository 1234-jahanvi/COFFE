.TITLE last stage of configurable decoder

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

* inv_nand2xconfigurabledecoderiii delay
.MEASURE TRAN meaz1_inv_nand2_xconfigurabledecoderiii_1_tfall TRIG V(n_1_8) VAL='0.8_lp/2' RISE=1
+    TARG V(Xloadnand8.n_1_1) VAL='0.8_lp/2' FALL=1
.MEASURE TRAN meaz1_inv_nand2_xconfigurabledecoderiii_1_trise TRIG V(n_1_8) VAL='0.8_lp/2' FALL=1
+    TARG V(Xloadnand8.n_1_1) VAL='0.8_lp/2' RISE=1

* invxconfigurabledecoderiii_2 delay
.MEASURE TRAN meaz1_inv_xconfigurabledecoderiii_2_tfall TRIG V(n_1_8) VAL='0.8_lp/2' FALL=1
+    TARG V(Xloadnand8.n_out) VAL='0.8_lp/2' FALL=1
.MEASURE TRAN meaz1_inv_xconfigurabledecoderiii_2_trise TRIG V(n_1_8) VAL='0.8_lp/2' RISE=1
+    TARG V(Xloadnand8.n_out) VAL='0.8_lp/2' RISE=1

* Total delays
.MEASURE TRAN meaz1_total_tfall TRIG V(n_1_8) VAL='0.8_lp/2' FALL=1
+    TARG V(n_1_74) VAL='0.8_lp/2' FALL=1
.MEASURE TRAN meaz1_total_trise TRIG V(n_1_8) VAL='0.8_lp/2' RISE=1
+    TARG V(n_1_74) VAL='0.8_lp/2' RISE=1

.MEASURE TRAN meas_logic_low_voltage FIND V(n_in) AT=3n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meaz1_current  INTEG I(V_third1) FROM=0ns TO=4ns
.MEASURE TRAN meaz1_avg_power PARAM = '-(meaz1_current/4n)*0.8_lp'

********************************************************************************
** Circuit
********************************************************************************

Xnandu n_in n_1_0 vdd_lp ground xconfigurabledecoder3ii
Xwire0 n_1_0 n_1_1 wire Rw=wire_xconfigurabledecoderi_res/8 Cw=wire_xconfigurabledecoderi_cap/8
Xloadnand1 n_1_1 n_hang_2 vdd_lp ground xconfigurabledecoderiii
Xwire1 n_1_1 n_1_2 wire Rw=wire_xconfigurabledecoderi_res/8 Cw=wire_xconfigurabledecoderi_cap/8
Xloadnand2 n_1_2 n_hang_3 vdd_lp ground xconfigurabledecoderiii
Xwire2 n_1_2 n_1_3 wire Rw=wire_xconfigurabledecoderi_res/8 Cw=wire_xconfigurabledecoderi_cap/8
Xloadnand3 n_1_3 n_hang_4 vdd_lp ground xconfigurabledecoderiii
Xwire3 n_1_3 n_1_4 wire Rw=wire_xconfigurabledecoderi_res/8 Cw=wire_xconfigurabledecoderi_cap/8
Xloadnand4 n_1_4 n_hang_5 vdd_lp ground xconfigurabledecoderiii
Xwire4 n_1_4 n_1_5 wire Rw=wire_xconfigurabledecoderi_res/8 Cw=wire_xconfigurabledecoderi_cap/8
Xloadnand5 n_1_5 n_hang_6 vdd_lp ground xconfigurabledecoderiii
Xwire5 n_1_5 n_1_6 wire Rw=wire_xconfigurabledecoderi_res/8 Cw=wire_xconfigurabledecoderi_cap/8
Xloadnand6 n_1_6 n_hang_7 vdd_lp ground xconfigurabledecoderiii
Xwire6 n_1_6 n_1_7 wire Rw=wire_xconfigurabledecoderi_res/8 Cw=wire_xconfigurabledecoderi_cap/8
Xloadnand7 n_1_7 n_hang_8 vdd_lp ground xconfigurabledecoderiii
Xwire7 n_1_7 n_1_8 wire Rw=wire_xconfigurabledecoderi_res/8 Cw=wire_xconfigurabledecoderi_cap/8
Xloadnand8 n_1_8 n_1_9 vdd_third1 ground xconfigurabledecoderiii
Xwireadded n_1_9 n_1_10 wire Rw=wire_xconfigurabledecoderiii_res Cw=wire_xconfigurabledecoderiii_cap 
Xwirel10 n_1_10 n_1_11 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel11 n_1_11 n_1_12 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel12 n_1_12 n_1_13 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel13 n_1_13 n_1_14 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel14 n_1_14 n_1_15 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel15 n_1_15 n_1_16 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel16 n_1_16 n_1_17 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel17 n_1_17 n_1_18 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel18 n_1_18 n_1_19 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel19 n_1_19 n_1_20 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel20 n_1_20 n_1_21 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel21 n_1_21 n_1_22 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel22 n_1_22 n_1_23 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel23 n_1_23 n_1_24 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel24 n_1_24 n_1_25 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel25 n_1_25 n_1_26 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel26 n_1_26 n_1_27 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel27 n_1_27 n_1_28 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel28 n_1_28 n_1_29 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel29 n_1_29 n_1_30 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel30 n_1_30 n_1_31 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel31 n_1_31 n_1_32 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel32 n_1_32 n_1_33 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel33 n_1_33 n_1_34 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel34 n_1_34 n_1_35 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel35 n_1_35 n_1_36 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel36 n_1_36 n_1_37 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel37 n_1_37 n_1_38 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel38 n_1_38 n_1_39 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel39 n_1_39 n_1_40 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel40 n_1_40 n_1_41 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel41 n_1_41 n_1_42 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel42 n_1_42 n_1_43 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel43 n_1_43 n_1_44 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel44 n_1_44 n_1_45 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel45 n_1_45 n_1_46 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel46 n_1_46 n_1_47 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel47 n_1_47 n_1_48 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel48 n_1_48 n_1_49 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel49 n_1_49 n_1_50 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel50 n_1_50 n_1_51 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel51 n_1_51 n_1_52 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel52 n_1_52 n_1_53 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel53 n_1_53 n_1_54 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel54 n_1_54 n_1_55 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel55 n_1_55 n_1_56 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel56 n_1_56 n_1_57 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel57 n_1_57 n_1_58 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel58 n_1_58 n_1_59 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel59 n_1_59 n_1_60 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel60 n_1_60 n_1_61 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel61 n_1_61 n_1_62 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel62 n_1_62 n_1_63 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel63 n_1_63 n_1_64 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel64 n_1_64 n_1_65 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel65 n_1_65 n_1_66 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel66 n_1_66 n_1_67 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel67 n_1_67 n_1_68 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel68 n_1_68 n_1_69 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel69 n_1_69 n_1_70 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel70 n_1_70 n_1_71 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel71 n_1_71 n_1_72 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel72 n_1_72 n_1_73 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xwirel73 n_1_73 n_1_74 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate72 ground ground n_1_74 vdd_lp vdd_lp ground RAM_tgate
.END