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
+    TARG V(n_1_129) VAL='0.8_lp * 0.1' FALL=1
.MEASURE TRAN meas_inv_wordline_driver_4_trise TRIG V(n_1_1) VAL='0.8_lp/2' RISE=1
+    TARG V(n_1_129) VAL='0.8_lp * 0.9' RISE=1

* Total delays
.MEASURE TRAN meaz1_total_tfall TRIG V(n_1_1) VAL='0.8_lp/2' FALL=1
+    TARG V(n_1_129) VAL='0.8_lp * 0.1' FALL=1
.MEASURE TRAN meaz1_total_trise TRIG V(n_1_1) VAL='0.8_lp/2' RISE=1
+    TARG V(n_1_129) VAL='0.8_lp * 0.9' RISE=1

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
Xwirel2 n_1_2 n_1_3 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell3 n_1_3 ground ground ground ground ground vdd_lp ground memorycell
Xwirel3 n_1_3 n_1_4 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell4 n_1_4 ground ground ground ground ground vdd_lp ground memorycell
Xwirel4 n_1_4 n_1_5 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell5 n_1_5 ground ground ground ground ground vdd_lp ground memorycell
Xwirel5 n_1_5 n_1_6 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell6 n_1_6 ground ground ground ground ground vdd_lp ground memorycell
Xwirel6 n_1_6 n_1_7 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell7 n_1_7 ground ground ground ground ground vdd_lp ground memorycell
Xwirel7 n_1_7 n_1_8 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell8 n_1_8 ground ground ground ground ground vdd_lp ground memorycell
Xwirel8 n_1_8 n_1_9 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell9 n_1_9 ground ground ground ground ground vdd_lp ground memorycell
Xwirel9 n_1_9 n_1_10 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell10 n_1_10 ground ground ground ground ground vdd_lp ground memorycell
Xwirel10 n_1_10 n_1_11 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell11 n_1_11 ground ground ground ground ground vdd_lp ground memorycell
Xwirel11 n_1_11 n_1_12 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell12 n_1_12 ground ground ground ground ground vdd_lp ground memorycell
Xwirel12 n_1_12 n_1_13 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell13 n_1_13 ground ground ground ground ground vdd_lp ground memorycell
Xwirel13 n_1_13 n_1_14 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell14 n_1_14 ground ground ground ground ground vdd_lp ground memorycell
Xwirel14 n_1_14 n_1_15 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell15 n_1_15 ground ground ground ground ground vdd_lp ground memorycell
Xwirel15 n_1_15 n_1_16 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell16 n_1_16 ground ground ground ground ground vdd_lp ground memorycell
Xwirel16 n_1_16 n_1_17 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell17 n_1_17 ground ground ground ground ground vdd_lp ground memorycell
Xwirel17 n_1_17 n_1_18 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell18 n_1_18 ground ground ground ground ground vdd_lp ground memorycell
Xwirel18 n_1_18 n_1_19 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell19 n_1_19 ground ground ground ground ground vdd_lp ground memorycell
Xwirel19 n_1_19 n_1_20 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell20 n_1_20 ground ground ground ground ground vdd_lp ground memorycell
Xwirel20 n_1_20 n_1_21 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell21 n_1_21 ground ground ground ground ground vdd_lp ground memorycell
Xwirel21 n_1_21 n_1_22 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell22 n_1_22 ground ground ground ground ground vdd_lp ground memorycell
Xwirel22 n_1_22 n_1_23 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell23 n_1_23 ground ground ground ground ground vdd_lp ground memorycell
Xwirel23 n_1_23 n_1_24 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell24 n_1_24 ground ground ground ground ground vdd_lp ground memorycell
Xwirel24 n_1_24 n_1_25 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell25 n_1_25 ground ground ground ground ground vdd_lp ground memorycell
Xwirel25 n_1_25 n_1_26 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell26 n_1_26 ground ground ground ground ground vdd_lp ground memorycell
Xwirel26 n_1_26 n_1_27 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell27 n_1_27 ground ground ground ground ground vdd_lp ground memorycell
Xwirel27 n_1_27 n_1_28 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell28 n_1_28 ground ground ground ground ground vdd_lp ground memorycell
Xwirel28 n_1_28 n_1_29 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell29 n_1_29 ground ground ground ground ground vdd_lp ground memorycell
Xwirel29 n_1_29 n_1_30 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell30 n_1_30 ground ground ground ground ground vdd_lp ground memorycell
Xwirel30 n_1_30 n_1_31 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell31 n_1_31 ground ground ground ground ground vdd_lp ground memorycell
Xwirel31 n_1_31 n_1_32 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell32 n_1_32 ground ground ground ground ground vdd_lp ground memorycell
Xwirel32 n_1_32 n_1_33 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell33 n_1_33 ground ground ground ground ground vdd_lp ground memorycell
Xwirel33 n_1_33 n_1_34 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell34 n_1_34 ground ground ground ground ground vdd_lp ground memorycell
Xwirel34 n_1_34 n_1_35 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell35 n_1_35 ground ground ground ground ground vdd_lp ground memorycell
Xwirel35 n_1_35 n_1_36 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell36 n_1_36 ground ground ground ground ground vdd_lp ground memorycell
Xwirel36 n_1_36 n_1_37 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell37 n_1_37 ground ground ground ground ground vdd_lp ground memorycell
Xwirel37 n_1_37 n_1_38 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell38 n_1_38 ground ground ground ground ground vdd_lp ground memorycell
Xwirel38 n_1_38 n_1_39 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell39 n_1_39 ground ground ground ground ground vdd_lp ground memorycell
Xwirel39 n_1_39 n_1_40 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell40 n_1_40 ground ground ground ground ground vdd_lp ground memorycell
Xwirel40 n_1_40 n_1_41 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell41 n_1_41 ground ground ground ground ground vdd_lp ground memorycell
Xwirel41 n_1_41 n_1_42 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell42 n_1_42 ground ground ground ground ground vdd_lp ground memorycell
Xwirel42 n_1_42 n_1_43 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell43 n_1_43 ground ground ground ground ground vdd_lp ground memorycell
Xwirel43 n_1_43 n_1_44 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell44 n_1_44 ground ground ground ground ground vdd_lp ground memorycell
Xwirel44 n_1_44 n_1_45 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell45 n_1_45 ground ground ground ground ground vdd_lp ground memorycell
Xwirel45 n_1_45 n_1_46 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell46 n_1_46 ground ground ground ground ground vdd_lp ground memorycell
Xwirel46 n_1_46 n_1_47 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell47 n_1_47 ground ground ground ground ground vdd_lp ground memorycell
Xwirel47 n_1_47 n_1_48 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell48 n_1_48 ground ground ground ground ground vdd_lp ground memorycell
Xwirel48 n_1_48 n_1_49 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell49 n_1_49 ground ground ground ground ground vdd_lp ground memorycell
Xwirel49 n_1_49 n_1_50 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell50 n_1_50 ground ground ground ground ground vdd_lp ground memorycell
Xwirel50 n_1_50 n_1_51 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell51 n_1_51 ground ground ground ground ground vdd_lp ground memorycell
Xwirel51 n_1_51 n_1_52 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell52 n_1_52 ground ground ground ground ground vdd_lp ground memorycell
Xwirel52 n_1_52 n_1_53 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell53 n_1_53 ground ground ground ground ground vdd_lp ground memorycell
Xwirel53 n_1_53 n_1_54 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell54 n_1_54 ground ground ground ground ground vdd_lp ground memorycell
Xwirel54 n_1_54 n_1_55 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell55 n_1_55 ground ground ground ground ground vdd_lp ground memorycell
Xwirel55 n_1_55 n_1_56 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell56 n_1_56 ground ground ground ground ground vdd_lp ground memorycell
Xwirel56 n_1_56 n_1_57 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell57 n_1_57 ground ground ground ground ground vdd_lp ground memorycell
Xwirel57 n_1_57 n_1_58 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell58 n_1_58 ground ground ground ground ground vdd_lp ground memorycell
Xwirel58 n_1_58 n_1_59 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell59 n_1_59 ground ground ground ground ground vdd_lp ground memorycell
Xwirel59 n_1_59 n_1_60 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell60 n_1_60 ground ground ground ground ground vdd_lp ground memorycell
Xwirel60 n_1_60 n_1_61 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell61 n_1_61 ground ground ground ground ground vdd_lp ground memorycell
Xwirel61 n_1_61 n_1_62 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell62 n_1_62 ground ground ground ground ground vdd_lp ground memorycell
Xwirel62 n_1_62 n_1_63 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell63 n_1_63 ground ground ground ground ground vdd_lp ground memorycell
Xwirel63 n_1_63 n_1_64 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell64 n_1_64 ground ground ground ground ground vdd_lp ground memorycell
Xwirel64 n_1_64 n_1_65 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell65 n_1_65 ground ground ground ground ground vdd_lp ground memorycell
Xwirel65 n_1_65 n_1_66 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell66 n_1_66 ground ground ground ground ground vdd_lp ground memorycell
Xwirel66 n_1_66 n_1_67 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell67 n_1_67 ground ground ground ground ground vdd_lp ground memorycell
Xwirel67 n_1_67 n_1_68 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell68 n_1_68 ground ground ground ground ground vdd_lp ground memorycell
Xwirel68 n_1_68 n_1_69 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell69 n_1_69 ground ground ground ground ground vdd_lp ground memorycell
Xwirel69 n_1_69 n_1_70 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell70 n_1_70 ground ground ground ground ground vdd_lp ground memorycell
Xwirel70 n_1_70 n_1_71 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell71 n_1_71 ground ground ground ground ground vdd_lp ground memorycell
Xwirel71 n_1_71 n_1_72 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell72 n_1_72 ground ground ground ground ground vdd_lp ground memorycell
Xwirel72 n_1_72 n_1_73 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell73 n_1_73 ground ground ground ground ground vdd_lp ground memorycell
Xwirel73 n_1_73 n_1_74 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell74 n_1_74 ground ground ground ground ground vdd_lp ground memorycell
Xwirel74 n_1_74 n_1_75 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell75 n_1_75 ground ground ground ground ground vdd_lp ground memorycell
Xwirel75 n_1_75 n_1_76 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell76 n_1_76 ground ground ground ground ground vdd_lp ground memorycell
Xwirel76 n_1_76 n_1_77 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell77 n_1_77 ground ground ground ground ground vdd_lp ground memorycell
Xwirel77 n_1_77 n_1_78 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell78 n_1_78 ground ground ground ground ground vdd_lp ground memorycell
Xwirel78 n_1_78 n_1_79 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell79 n_1_79 ground ground ground ground ground vdd_lp ground memorycell
Xwirel79 n_1_79 n_1_80 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell80 n_1_80 ground ground ground ground ground vdd_lp ground memorycell
Xwirel80 n_1_80 n_1_81 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell81 n_1_81 ground ground ground ground ground vdd_lp ground memorycell
Xwirel81 n_1_81 n_1_82 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell82 n_1_82 ground ground ground ground ground vdd_lp ground memorycell
Xwirel82 n_1_82 n_1_83 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell83 n_1_83 ground ground ground ground ground vdd_lp ground memorycell
Xwirel83 n_1_83 n_1_84 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell84 n_1_84 ground ground ground ground ground vdd_lp ground memorycell
Xwirel84 n_1_84 n_1_85 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell85 n_1_85 ground ground ground ground ground vdd_lp ground memorycell
Xwirel85 n_1_85 n_1_86 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell86 n_1_86 ground ground ground ground ground vdd_lp ground memorycell
Xwirel86 n_1_86 n_1_87 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell87 n_1_87 ground ground ground ground ground vdd_lp ground memorycell
Xwirel87 n_1_87 n_1_88 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell88 n_1_88 ground ground ground ground ground vdd_lp ground memorycell
Xwirel88 n_1_88 n_1_89 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell89 n_1_89 ground ground ground ground ground vdd_lp ground memorycell
Xwirel89 n_1_89 n_1_90 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell90 n_1_90 ground ground ground ground ground vdd_lp ground memorycell
Xwirel90 n_1_90 n_1_91 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell91 n_1_91 ground ground ground ground ground vdd_lp ground memorycell
Xwirel91 n_1_91 n_1_92 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell92 n_1_92 ground ground ground ground ground vdd_lp ground memorycell
Xwirel92 n_1_92 n_1_93 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell93 n_1_93 ground ground ground ground ground vdd_lp ground memorycell
Xwirel93 n_1_93 n_1_94 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell94 n_1_94 ground ground ground ground ground vdd_lp ground memorycell
Xwirel94 n_1_94 n_1_95 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell95 n_1_95 ground ground ground ground ground vdd_lp ground memorycell
Xwirel95 n_1_95 n_1_96 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell96 n_1_96 ground ground ground ground ground vdd_lp ground memorycell
Xwirel96 n_1_96 n_1_97 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell97 n_1_97 ground ground ground ground ground vdd_lp ground memorycell
Xwirel97 n_1_97 n_1_98 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell98 n_1_98 ground ground ground ground ground vdd_lp ground memorycell
Xwirel98 n_1_98 n_1_99 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell99 n_1_99 ground ground ground ground ground vdd_lp ground memorycell
Xwirel99 n_1_99 n_1_100 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell100 n_1_100 ground ground ground ground ground vdd_lp ground memorycell
Xwirel100 n_1_100 n_1_101 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell101 n_1_101 ground ground ground ground ground vdd_lp ground memorycell
Xwirel101 n_1_101 n_1_102 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell102 n_1_102 ground ground ground ground ground vdd_lp ground memorycell
Xwirel102 n_1_102 n_1_103 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell103 n_1_103 ground ground ground ground ground vdd_lp ground memorycell
Xwirel103 n_1_103 n_1_104 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell104 n_1_104 ground ground ground ground ground vdd_lp ground memorycell
Xwirel104 n_1_104 n_1_105 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell105 n_1_105 ground ground ground ground ground vdd_lp ground memorycell
Xwirel105 n_1_105 n_1_106 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell106 n_1_106 ground ground ground ground ground vdd_lp ground memorycell
Xwirel106 n_1_106 n_1_107 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell107 n_1_107 ground ground ground ground ground vdd_lp ground memorycell
Xwirel107 n_1_107 n_1_108 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell108 n_1_108 ground ground ground ground ground vdd_lp ground memorycell
Xwirel108 n_1_108 n_1_109 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell109 n_1_109 ground ground ground ground ground vdd_lp ground memorycell
Xwirel109 n_1_109 n_1_110 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell110 n_1_110 ground ground ground ground ground vdd_lp ground memorycell
Xwirel110 n_1_110 n_1_111 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell111 n_1_111 ground ground ground ground ground vdd_lp ground memorycell
Xwirel111 n_1_111 n_1_112 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell112 n_1_112 ground ground ground ground ground vdd_lp ground memorycell
Xwirel112 n_1_112 n_1_113 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell113 n_1_113 ground ground ground ground ground vdd_lp ground memorycell
Xwirel113 n_1_113 n_1_114 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell114 n_1_114 ground ground ground ground ground vdd_lp ground memorycell
Xwirel114 n_1_114 n_1_115 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell115 n_1_115 ground ground ground ground ground vdd_lp ground memorycell
Xwirel115 n_1_115 n_1_116 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell116 n_1_116 ground ground ground ground ground vdd_lp ground memorycell
Xwirel116 n_1_116 n_1_117 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell117 n_1_117 ground ground ground ground ground vdd_lp ground memorycell
Xwirel117 n_1_117 n_1_118 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell118 n_1_118 ground ground ground ground ground vdd_lp ground memorycell
Xwirel118 n_1_118 n_1_119 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell119 n_1_119 ground ground ground ground ground vdd_lp ground memorycell
Xwirel119 n_1_119 n_1_120 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell120 n_1_120 ground ground ground ground ground vdd_lp ground memorycell
Xwirel120 n_1_120 n_1_121 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell121 n_1_121 ground ground ground ground ground vdd_lp ground memorycell
Xwirel121 n_1_121 n_1_122 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell122 n_1_122 ground ground ground ground ground vdd_lp ground memorycell
Xwirel122 n_1_122 n_1_123 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell123 n_1_123 ground ground ground ground ground vdd_lp ground memorycell
Xwirel123 n_1_123 n_1_124 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell124 n_1_124 ground ground ground ground ground vdd_lp ground memorycell
Xwirel124 n_1_124 n_1_125 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell125 n_1_125 ground ground ground ground ground vdd_lp ground memorycell
Xwirel125 n_1_125 n_1_126 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell126 n_1_126 ground ground ground ground ground vdd_lp ground memorycell
Xwirel126 n_1_126 n_1_127 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell127 n_1_127 ground ground ground ground ground vdd_lp ground memorycell
Xwirel127 n_1_127 n_1_128 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell128 n_1_128 ground ground ground ground ground vdd_lp ground memorycell
Xwirel128 n_1_128 n_1_129 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
Xmemcell129 n_1_129 ground ground ground ground ground vdd_lp ground memorycell
Xwirel129 n_1_129 n_1_130 wire Rw=wire_wordline_driver_res/256 Cw=wire_wordline_driver_cap/256
.END