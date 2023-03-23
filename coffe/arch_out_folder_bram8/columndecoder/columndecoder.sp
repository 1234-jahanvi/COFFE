.TITLE RAM column decoder

********************************************************************************
** Include libraries, parameters and other
********************************************************************************

.LIB "../includes.l" INCLUDES

********************************************************************************
** Setup and input
********************************************************************************

.control 
 TRAN 1p 5n  
OPTIONS BRIEF=1

quit 
 .endc 
 * Input signal 
 Vground ground 0 0 

VIN n_in ground PULSE (0 0.8_lp 0 0 0 2n 4n)
* Power rail for the circuit under test.
* This allows us to measure power of a circuit under test without measuring the power of wave shaping and load circuitry.
V_col vdd_col ground 0.8_lp

********************************************************************************
** Measurement
********************************************************************************

* inv_columndecoder_1 delay
.MEASURE TRAN meas_inv_columndecoder_1_tfall TRIG V(Xdecorder.n_in) VAL='0.8_lp/2' RISE=1
+    TARG V(Xdecorder.n_1_1) VAL='0.8_lp/2' FALL=1
.MEASURE TRAN meas_inv_columndecoder_1_trise TRIG V(Xdecorder.n_in) VAL='0.8_lp/2' FALL=1
+    TARG V(Xdecorder.n_1_1) VAL='0.8_lp/2' RISE=1

* inv_columndecoder_2 delay
.MEASURE TRAN meas_inv_columndecoder_2_tfall TRIG V(Xdecorder.n_in) VAL='0.8_lp/2' FALL=1
+    TARG V(Xdecorder.n_1_2) VAL='0.8_lp/2' FALL=1
.MEASURE TRAN meas_inv_columndecoder_2_trise TRIG V(Xdecorder.n_in) VAL='0.8_lp/2' RISE=1
+    TARG V(Xdecorder.n_1_2) VAL='0.8_lp/2' RISE=1

* inv_columndecoder_3 delay
.MEASURE TRAN meas_inv_columndecoder_3_tfall TRIG V(Xdecorder.n_in) VAL='0.8_lp/2' RISE=1
+    TARG V(n_1_69) VAL='0.8_lp/2' FALL=1
.MEASURE TRAN meas_inv_columndecoder_3_trise TRIG V(Xdecorder.n_in) VAL='0.8_lp/2' FALL=1
+    TARG V(n_1_69) VAL='0.8_lp/2' RISE=1

* Total delays
.MEASURE TRAN meas_total_tfall TRIG V(n_1_3) VAL='0.8_lp/2' FALL=1
+    TARG V(n_1_69) VAL='0.8_lp/2' FALL=1
.MEASURE TRAN meas_total_trise TRIG V(n_1_3) VAL='0.8_lp/2' RISE=1
+    TARG V(n_1_69) VAL='0.8_lp/2' RISE=1

.MEASURE TRAN meas_logic_low_voltage FIND V(n_in) AT=3n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current  INTEG I(V_col) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-(meas_current/4n)*0.8_lp'

********************************************************************************
** Circuit
********************************************************************************

Xrouting_wire_load_1 n_in n_1_1 n_1_2 vsram vsram_n vdd ground vdd vdd routing_wire_load
Xlocal_routing_wire_load_1 n_1_2 n_1_3 vsram vsram_n vdd ground vdd RAM_local_routing_wire_load
Xinv_ff_output_driver n_1_3 n_1_4 vdd_lp ground inv_lp Wn=inv_ff_output_driver_nmos Wp=inv_ff_output_driver_pmos
Xdecorder n_1_4 n_1_5 vdd_col ground columndecoder
Xwire5 n_1_5 n_1_6 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate5 ground n_2_5 ground n_1_6 vdd_lp ground RAM_tgate
Xwire6 n_1_6 n_1_7 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate6 ground n_2_6 n_1_7 ground vdd_lp ground RAM_tgate
Xwire7 n_1_7 n_1_8 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate7 ground n_2_7 ground n_1_8 vdd_lp ground RAM_tgate
Xwire8 n_1_8 n_1_9 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate8 ground n_2_8 n_1_9 ground vdd_lp ground RAM_tgate
Xwire9 n_1_9 n_1_10 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate9 ground n_2_9 ground n_1_10 vdd_lp ground RAM_tgate
Xwire10 n_1_10 n_1_11 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate10 ground n_2_10 n_1_11 ground vdd_lp ground RAM_tgate
Xwire11 n_1_11 n_1_12 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate11 ground n_2_11 ground n_1_12 vdd_lp ground RAM_tgate
Xwire12 n_1_12 n_1_13 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate12 ground n_2_12 n_1_13 ground vdd_lp ground RAM_tgate
Xwire13 n_1_13 n_1_14 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate13 ground n_2_13 ground n_1_14 vdd_lp ground RAM_tgate
Xwire14 n_1_14 n_1_15 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate14 ground n_2_14 n_1_15 ground vdd_lp ground RAM_tgate
Xwire15 n_1_15 n_1_16 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate15 ground n_2_15 ground n_1_16 vdd_lp ground RAM_tgate
Xwire16 n_1_16 n_1_17 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate16 ground n_2_16 n_1_17 ground vdd_lp ground RAM_tgate
Xwire17 n_1_17 n_1_18 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate17 ground n_2_17 ground n_1_18 vdd_lp ground RAM_tgate
Xwire18 n_1_18 n_1_19 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate18 ground n_2_18 n_1_19 ground vdd_lp ground RAM_tgate
Xwire19 n_1_19 n_1_20 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate19 ground n_2_19 ground n_1_20 vdd_lp ground RAM_tgate
Xwire20 n_1_20 n_1_21 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate20 ground n_2_20 n_1_21 ground vdd_lp ground RAM_tgate
Xwire21 n_1_21 n_1_22 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate21 ground n_2_21 ground n_1_22 vdd_lp ground RAM_tgate
Xwire22 n_1_22 n_1_23 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate22 ground n_2_22 n_1_23 ground vdd_lp ground RAM_tgate
Xwire23 n_1_23 n_1_24 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate23 ground n_2_23 ground n_1_24 vdd_lp ground RAM_tgate
Xwire24 n_1_24 n_1_25 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate24 ground n_2_24 n_1_25 ground vdd_lp ground RAM_tgate
Xwire25 n_1_25 n_1_26 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate25 ground n_2_25 ground n_1_26 vdd_lp ground RAM_tgate
Xwire26 n_1_26 n_1_27 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate26 ground n_2_26 n_1_27 ground vdd_lp ground RAM_tgate
Xwire27 n_1_27 n_1_28 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate27 ground n_2_27 ground n_1_28 vdd_lp ground RAM_tgate
Xwire28 n_1_28 n_1_29 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate28 ground n_2_28 n_1_29 ground vdd_lp ground RAM_tgate
Xwire29 n_1_29 n_1_30 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate29 ground n_2_29 ground n_1_30 vdd_lp ground RAM_tgate
Xwire30 n_1_30 n_1_31 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate30 ground n_2_30 n_1_31 ground vdd_lp ground RAM_tgate
Xwire31 n_1_31 n_1_32 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate31 ground n_2_31 ground n_1_32 vdd_lp ground RAM_tgate
Xwire32 n_1_32 n_1_33 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate32 ground n_2_32 n_1_33 ground vdd_lp ground RAM_tgate
Xwire33 n_1_33 n_1_34 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate33 ground n_2_33 ground n_1_34 vdd_lp ground RAM_tgate
Xwire34 n_1_34 n_1_35 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate34 ground n_2_34 n_1_35 ground vdd_lp ground RAM_tgate
Xwire35 n_1_35 n_1_36 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate35 ground n_2_35 ground n_1_36 vdd_lp ground RAM_tgate
Xwire36 n_1_36 n_1_37 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate36 ground n_2_36 n_1_37 ground vdd_lp ground RAM_tgate
Xwire37 n_1_37 n_1_38 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate37 ground n_2_37 ground n_1_38 vdd_lp ground RAM_tgate
Xwire38 n_1_38 n_1_39 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate38 ground n_2_38 n_1_39 ground vdd_lp ground RAM_tgate
Xwire39 n_1_39 n_1_40 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate39 ground n_2_39 ground n_1_40 vdd_lp ground RAM_tgate
Xwire40 n_1_40 n_1_41 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate40 ground n_2_40 n_1_41 ground vdd_lp ground RAM_tgate
Xwire41 n_1_41 n_1_42 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate41 ground n_2_41 ground n_1_42 vdd_lp ground RAM_tgate
Xwire42 n_1_42 n_1_43 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate42 ground n_2_42 n_1_43 ground vdd_lp ground RAM_tgate
Xwire43 n_1_43 n_1_44 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate43 ground n_2_43 ground n_1_44 vdd_lp ground RAM_tgate
Xwire44 n_1_44 n_1_45 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate44 ground n_2_44 n_1_45 ground vdd_lp ground RAM_tgate
Xwire45 n_1_45 n_1_46 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate45 ground n_2_45 ground n_1_46 vdd_lp ground RAM_tgate
Xwire46 n_1_46 n_1_47 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate46 ground n_2_46 n_1_47 ground vdd_lp ground RAM_tgate
Xwire47 n_1_47 n_1_48 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate47 ground n_2_47 ground n_1_48 vdd_lp ground RAM_tgate
Xwire48 n_1_48 n_1_49 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate48 ground n_2_48 n_1_49 ground vdd_lp ground RAM_tgate
Xwire49 n_1_49 n_1_50 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate49 ground n_2_49 ground n_1_50 vdd_lp ground RAM_tgate
Xwire50 n_1_50 n_1_51 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate50 ground n_2_50 n_1_51 ground vdd_lp ground RAM_tgate
Xwire51 n_1_51 n_1_52 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate51 ground n_2_51 ground n_1_52 vdd_lp ground RAM_tgate
Xwire52 n_1_52 n_1_53 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate52 ground n_2_52 n_1_53 ground vdd_lp ground RAM_tgate
Xwire53 n_1_53 n_1_54 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate53 ground n_2_53 ground n_1_54 vdd_lp ground RAM_tgate
Xwire54 n_1_54 n_1_55 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate54 ground n_2_54 n_1_55 ground vdd_lp ground RAM_tgate
Xwire55 n_1_55 n_1_56 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate55 ground n_2_55 ground n_1_56 vdd_lp ground RAM_tgate
Xwire56 n_1_56 n_1_57 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate56 ground n_2_56 n_1_57 ground vdd_lp ground RAM_tgate
Xwire57 n_1_57 n_1_58 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate57 ground n_2_57 ground n_1_58 vdd_lp ground RAM_tgate
Xwire58 n_1_58 n_1_59 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate58 ground n_2_58 n_1_59 ground vdd_lp ground RAM_tgate
Xwire59 n_1_59 n_1_60 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate59 ground n_2_59 ground n_1_60 vdd_lp ground RAM_tgate
Xwire60 n_1_60 n_1_61 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate60 ground n_2_60 n_1_61 ground vdd_lp ground RAM_tgate
Xwire61 n_1_61 n_1_62 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate61 ground n_2_61 ground n_1_62 vdd_lp ground RAM_tgate
Xwire62 n_1_62 n_1_63 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate62 ground n_2_62 n_1_63 ground vdd_lp ground RAM_tgate
Xwire63 n_1_63 n_1_64 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate63 ground n_2_63 ground n_1_64 vdd_lp ground RAM_tgate
Xwire64 n_1_64 n_1_65 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate64 ground n_2_64 n_1_65 ground vdd_lp ground RAM_tgate
Xwire65 n_1_65 n_1_66 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate65 ground n_2_65 ground n_1_66 vdd_lp ground RAM_tgate
Xwire66 n_1_66 n_1_67 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate66 ground n_2_66 n_1_67 ground vdd_lp ground RAM_tgate
Xwire67 n_1_67 n_1_68 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate67 ground n_2_67 ground n_1_68 vdd_lp ground RAM_tgate
Xwire68 n_1_68 n_1_69 wire Rw=wire_memorycell_horizontal_res/64 Cw=wire_memorycell_horizontal_cap/64
Xtgate68 ground n_2_68 n_1_69 ground vdd_lp ground RAM_tgate
.END