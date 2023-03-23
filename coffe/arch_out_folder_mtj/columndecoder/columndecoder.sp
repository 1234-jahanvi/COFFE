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
+    TARG V(n_1_261) VAL='0.8_lp/2' FALL=1
.MEASURE TRAN meas_inv_columndecoder_3_trise TRIG V(Xdecorder.n_in) VAL='0.8_lp/2' FALL=1
+    TARG V(n_1_261) VAL='0.8_lp/2' RISE=1

* Total delays
.MEASURE TRAN meas_total_tfall TRIG V(n_1_3) VAL='0.8_lp/2' FALL=1
+    TARG V(n_1_261) VAL='0.8_lp/2' FALL=1
.MEASURE TRAN meas_total_trise TRIG V(n_1_3) VAL='0.8_lp/2' RISE=1
+    TARG V(n_1_261) VAL='0.8_lp/2' RISE=1

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
Xwire5 n_1_5 n_1_6 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate5 ground n_2_5 ground n_1_6 vdd_lp ground RAM_tgate
Xwire6 n_1_6 n_1_7 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate6 ground n_2_6 n_1_7 ground vdd_lp ground RAM_tgate
Xwire7 n_1_7 n_1_8 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate7 ground n_2_7 ground n_1_8 vdd_lp ground RAM_tgate
Xwire8 n_1_8 n_1_9 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate8 ground n_2_8 n_1_9 ground vdd_lp ground RAM_tgate
Xwire9 n_1_9 n_1_10 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate9 ground n_2_9 ground n_1_10 vdd_lp ground RAM_tgate
Xwire10 n_1_10 n_1_11 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate10 ground n_2_10 n_1_11 ground vdd_lp ground RAM_tgate
Xwire11 n_1_11 n_1_12 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate11 ground n_2_11 ground n_1_12 vdd_lp ground RAM_tgate
Xwire12 n_1_12 n_1_13 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate12 ground n_2_12 n_1_13 ground vdd_lp ground RAM_tgate
Xwire13 n_1_13 n_1_14 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate13 ground n_2_13 ground n_1_14 vdd_lp ground RAM_tgate
Xwire14 n_1_14 n_1_15 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate14 ground n_2_14 n_1_15 ground vdd_lp ground RAM_tgate
Xwire15 n_1_15 n_1_16 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate15 ground n_2_15 ground n_1_16 vdd_lp ground RAM_tgate
Xwire16 n_1_16 n_1_17 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate16 ground n_2_16 n_1_17 ground vdd_lp ground RAM_tgate
Xwire17 n_1_17 n_1_18 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate17 ground n_2_17 ground n_1_18 vdd_lp ground RAM_tgate
Xwire18 n_1_18 n_1_19 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate18 ground n_2_18 n_1_19 ground vdd_lp ground RAM_tgate
Xwire19 n_1_19 n_1_20 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate19 ground n_2_19 ground n_1_20 vdd_lp ground RAM_tgate
Xwire20 n_1_20 n_1_21 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate20 ground n_2_20 n_1_21 ground vdd_lp ground RAM_tgate
Xwire21 n_1_21 n_1_22 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate21 ground n_2_21 ground n_1_22 vdd_lp ground RAM_tgate
Xwire22 n_1_22 n_1_23 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate22 ground n_2_22 n_1_23 ground vdd_lp ground RAM_tgate
Xwire23 n_1_23 n_1_24 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate23 ground n_2_23 ground n_1_24 vdd_lp ground RAM_tgate
Xwire24 n_1_24 n_1_25 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate24 ground n_2_24 n_1_25 ground vdd_lp ground RAM_tgate
Xwire25 n_1_25 n_1_26 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate25 ground n_2_25 ground n_1_26 vdd_lp ground RAM_tgate
Xwire26 n_1_26 n_1_27 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate26 ground n_2_26 n_1_27 ground vdd_lp ground RAM_tgate
Xwire27 n_1_27 n_1_28 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate27 ground n_2_27 ground n_1_28 vdd_lp ground RAM_tgate
Xwire28 n_1_28 n_1_29 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate28 ground n_2_28 n_1_29 ground vdd_lp ground RAM_tgate
Xwire29 n_1_29 n_1_30 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate29 ground n_2_29 ground n_1_30 vdd_lp ground RAM_tgate
Xwire30 n_1_30 n_1_31 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate30 ground n_2_30 n_1_31 ground vdd_lp ground RAM_tgate
Xwire31 n_1_31 n_1_32 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate31 ground n_2_31 ground n_1_32 vdd_lp ground RAM_tgate
Xwire32 n_1_32 n_1_33 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate32 ground n_2_32 n_1_33 ground vdd_lp ground RAM_tgate
Xwire33 n_1_33 n_1_34 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate33 ground n_2_33 ground n_1_34 vdd_lp ground RAM_tgate
Xwire34 n_1_34 n_1_35 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate34 ground n_2_34 n_1_35 ground vdd_lp ground RAM_tgate
Xwire35 n_1_35 n_1_36 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate35 ground n_2_35 ground n_1_36 vdd_lp ground RAM_tgate
Xwire36 n_1_36 n_1_37 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate36 ground n_2_36 n_1_37 ground vdd_lp ground RAM_tgate
Xwire37 n_1_37 n_1_38 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate37 ground n_2_37 ground n_1_38 vdd_lp ground RAM_tgate
Xwire38 n_1_38 n_1_39 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate38 ground n_2_38 n_1_39 ground vdd_lp ground RAM_tgate
Xwire39 n_1_39 n_1_40 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate39 ground n_2_39 ground n_1_40 vdd_lp ground RAM_tgate
Xwire40 n_1_40 n_1_41 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate40 ground n_2_40 n_1_41 ground vdd_lp ground RAM_tgate
Xwire41 n_1_41 n_1_42 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate41 ground n_2_41 ground n_1_42 vdd_lp ground RAM_tgate
Xwire42 n_1_42 n_1_43 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate42 ground n_2_42 n_1_43 ground vdd_lp ground RAM_tgate
Xwire43 n_1_43 n_1_44 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate43 ground n_2_43 ground n_1_44 vdd_lp ground RAM_tgate
Xwire44 n_1_44 n_1_45 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate44 ground n_2_44 n_1_45 ground vdd_lp ground RAM_tgate
Xwire45 n_1_45 n_1_46 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate45 ground n_2_45 ground n_1_46 vdd_lp ground RAM_tgate
Xwire46 n_1_46 n_1_47 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate46 ground n_2_46 n_1_47 ground vdd_lp ground RAM_tgate
Xwire47 n_1_47 n_1_48 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate47 ground n_2_47 ground n_1_48 vdd_lp ground RAM_tgate
Xwire48 n_1_48 n_1_49 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate48 ground n_2_48 n_1_49 ground vdd_lp ground RAM_tgate
Xwire49 n_1_49 n_1_50 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate49 ground n_2_49 ground n_1_50 vdd_lp ground RAM_tgate
Xwire50 n_1_50 n_1_51 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate50 ground n_2_50 n_1_51 ground vdd_lp ground RAM_tgate
Xwire51 n_1_51 n_1_52 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate51 ground n_2_51 ground n_1_52 vdd_lp ground RAM_tgate
Xwire52 n_1_52 n_1_53 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate52 ground n_2_52 n_1_53 ground vdd_lp ground RAM_tgate
Xwire53 n_1_53 n_1_54 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate53 ground n_2_53 ground n_1_54 vdd_lp ground RAM_tgate
Xwire54 n_1_54 n_1_55 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate54 ground n_2_54 n_1_55 ground vdd_lp ground RAM_tgate
Xwire55 n_1_55 n_1_56 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate55 ground n_2_55 ground n_1_56 vdd_lp ground RAM_tgate
Xwire56 n_1_56 n_1_57 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate56 ground n_2_56 n_1_57 ground vdd_lp ground RAM_tgate
Xwire57 n_1_57 n_1_58 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate57 ground n_2_57 ground n_1_58 vdd_lp ground RAM_tgate
Xwire58 n_1_58 n_1_59 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate58 ground n_2_58 n_1_59 ground vdd_lp ground RAM_tgate
Xwire59 n_1_59 n_1_60 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate59 ground n_2_59 ground n_1_60 vdd_lp ground RAM_tgate
Xwire60 n_1_60 n_1_61 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate60 ground n_2_60 n_1_61 ground vdd_lp ground RAM_tgate
Xwire61 n_1_61 n_1_62 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate61 ground n_2_61 ground n_1_62 vdd_lp ground RAM_tgate
Xwire62 n_1_62 n_1_63 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate62 ground n_2_62 n_1_63 ground vdd_lp ground RAM_tgate
Xwire63 n_1_63 n_1_64 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate63 ground n_2_63 ground n_1_64 vdd_lp ground RAM_tgate
Xwire64 n_1_64 n_1_65 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate64 ground n_2_64 n_1_65 ground vdd_lp ground RAM_tgate
Xwire65 n_1_65 n_1_66 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate65 ground n_2_65 ground n_1_66 vdd_lp ground RAM_tgate
Xwire66 n_1_66 n_1_67 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate66 ground n_2_66 n_1_67 ground vdd_lp ground RAM_tgate
Xwire67 n_1_67 n_1_68 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate67 ground n_2_67 ground n_1_68 vdd_lp ground RAM_tgate
Xwire68 n_1_68 n_1_69 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate68 ground n_2_68 n_1_69 ground vdd_lp ground RAM_tgate
Xwire69 n_1_69 n_1_70 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate69 ground n_2_69 ground n_1_70 vdd_lp ground RAM_tgate
Xwire70 n_1_70 n_1_71 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate70 ground n_2_70 n_1_71 ground vdd_lp ground RAM_tgate
Xwire71 n_1_71 n_1_72 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate71 ground n_2_71 ground n_1_72 vdd_lp ground RAM_tgate
Xwire72 n_1_72 n_1_73 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate72 ground n_2_72 n_1_73 ground vdd_lp ground RAM_tgate
Xwire73 n_1_73 n_1_74 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate73 ground n_2_73 ground n_1_74 vdd_lp ground RAM_tgate
Xwire74 n_1_74 n_1_75 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate74 ground n_2_74 n_1_75 ground vdd_lp ground RAM_tgate
Xwire75 n_1_75 n_1_76 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate75 ground n_2_75 ground n_1_76 vdd_lp ground RAM_tgate
Xwire76 n_1_76 n_1_77 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate76 ground n_2_76 n_1_77 ground vdd_lp ground RAM_tgate
Xwire77 n_1_77 n_1_78 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate77 ground n_2_77 ground n_1_78 vdd_lp ground RAM_tgate
Xwire78 n_1_78 n_1_79 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate78 ground n_2_78 n_1_79 ground vdd_lp ground RAM_tgate
Xwire79 n_1_79 n_1_80 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate79 ground n_2_79 ground n_1_80 vdd_lp ground RAM_tgate
Xwire80 n_1_80 n_1_81 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate80 ground n_2_80 n_1_81 ground vdd_lp ground RAM_tgate
Xwire81 n_1_81 n_1_82 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate81 ground n_2_81 ground n_1_82 vdd_lp ground RAM_tgate
Xwire82 n_1_82 n_1_83 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate82 ground n_2_82 n_1_83 ground vdd_lp ground RAM_tgate
Xwire83 n_1_83 n_1_84 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate83 ground n_2_83 ground n_1_84 vdd_lp ground RAM_tgate
Xwire84 n_1_84 n_1_85 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate84 ground n_2_84 n_1_85 ground vdd_lp ground RAM_tgate
Xwire85 n_1_85 n_1_86 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate85 ground n_2_85 ground n_1_86 vdd_lp ground RAM_tgate
Xwire86 n_1_86 n_1_87 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate86 ground n_2_86 n_1_87 ground vdd_lp ground RAM_tgate
Xwire87 n_1_87 n_1_88 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate87 ground n_2_87 ground n_1_88 vdd_lp ground RAM_tgate
Xwire88 n_1_88 n_1_89 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate88 ground n_2_88 n_1_89 ground vdd_lp ground RAM_tgate
Xwire89 n_1_89 n_1_90 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate89 ground n_2_89 ground n_1_90 vdd_lp ground RAM_tgate
Xwire90 n_1_90 n_1_91 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate90 ground n_2_90 n_1_91 ground vdd_lp ground RAM_tgate
Xwire91 n_1_91 n_1_92 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate91 ground n_2_91 ground n_1_92 vdd_lp ground RAM_tgate
Xwire92 n_1_92 n_1_93 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate92 ground n_2_92 n_1_93 ground vdd_lp ground RAM_tgate
Xwire93 n_1_93 n_1_94 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate93 ground n_2_93 ground n_1_94 vdd_lp ground RAM_tgate
Xwire94 n_1_94 n_1_95 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate94 ground n_2_94 n_1_95 ground vdd_lp ground RAM_tgate
Xwire95 n_1_95 n_1_96 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate95 ground n_2_95 ground n_1_96 vdd_lp ground RAM_tgate
Xwire96 n_1_96 n_1_97 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate96 ground n_2_96 n_1_97 ground vdd_lp ground RAM_tgate
Xwire97 n_1_97 n_1_98 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate97 ground n_2_97 ground n_1_98 vdd_lp ground RAM_tgate
Xwire98 n_1_98 n_1_99 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate98 ground n_2_98 n_1_99 ground vdd_lp ground RAM_tgate
Xwire99 n_1_99 n_1_100 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate99 ground n_2_99 ground n_1_100 vdd_lp ground RAM_tgate
Xwire100 n_1_100 n_1_101 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate100 ground n_2_100 n_1_101 ground vdd_lp ground RAM_tgate
Xwire101 n_1_101 n_1_102 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate101 ground n_2_101 ground n_1_102 vdd_lp ground RAM_tgate
Xwire102 n_1_102 n_1_103 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate102 ground n_2_102 n_1_103 ground vdd_lp ground RAM_tgate
Xwire103 n_1_103 n_1_104 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate103 ground n_2_103 ground n_1_104 vdd_lp ground RAM_tgate
Xwire104 n_1_104 n_1_105 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate104 ground n_2_104 n_1_105 ground vdd_lp ground RAM_tgate
Xwire105 n_1_105 n_1_106 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate105 ground n_2_105 ground n_1_106 vdd_lp ground RAM_tgate
Xwire106 n_1_106 n_1_107 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate106 ground n_2_106 n_1_107 ground vdd_lp ground RAM_tgate
Xwire107 n_1_107 n_1_108 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate107 ground n_2_107 ground n_1_108 vdd_lp ground RAM_tgate
Xwire108 n_1_108 n_1_109 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate108 ground n_2_108 n_1_109 ground vdd_lp ground RAM_tgate
Xwire109 n_1_109 n_1_110 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate109 ground n_2_109 ground n_1_110 vdd_lp ground RAM_tgate
Xwire110 n_1_110 n_1_111 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate110 ground n_2_110 n_1_111 ground vdd_lp ground RAM_tgate
Xwire111 n_1_111 n_1_112 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate111 ground n_2_111 ground n_1_112 vdd_lp ground RAM_tgate
Xwire112 n_1_112 n_1_113 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate112 ground n_2_112 n_1_113 ground vdd_lp ground RAM_tgate
Xwire113 n_1_113 n_1_114 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate113 ground n_2_113 ground n_1_114 vdd_lp ground RAM_tgate
Xwire114 n_1_114 n_1_115 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate114 ground n_2_114 n_1_115 ground vdd_lp ground RAM_tgate
Xwire115 n_1_115 n_1_116 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate115 ground n_2_115 ground n_1_116 vdd_lp ground RAM_tgate
Xwire116 n_1_116 n_1_117 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate116 ground n_2_116 n_1_117 ground vdd_lp ground RAM_tgate
Xwire117 n_1_117 n_1_118 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate117 ground n_2_117 ground n_1_118 vdd_lp ground RAM_tgate
Xwire118 n_1_118 n_1_119 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate118 ground n_2_118 n_1_119 ground vdd_lp ground RAM_tgate
Xwire119 n_1_119 n_1_120 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate119 ground n_2_119 ground n_1_120 vdd_lp ground RAM_tgate
Xwire120 n_1_120 n_1_121 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate120 ground n_2_120 n_1_121 ground vdd_lp ground RAM_tgate
Xwire121 n_1_121 n_1_122 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate121 ground n_2_121 ground n_1_122 vdd_lp ground RAM_tgate
Xwire122 n_1_122 n_1_123 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate122 ground n_2_122 n_1_123 ground vdd_lp ground RAM_tgate
Xwire123 n_1_123 n_1_124 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate123 ground n_2_123 ground n_1_124 vdd_lp ground RAM_tgate
Xwire124 n_1_124 n_1_125 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate124 ground n_2_124 n_1_125 ground vdd_lp ground RAM_tgate
Xwire125 n_1_125 n_1_126 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate125 ground n_2_125 ground n_1_126 vdd_lp ground RAM_tgate
Xwire126 n_1_126 n_1_127 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate126 ground n_2_126 n_1_127 ground vdd_lp ground RAM_tgate
Xwire127 n_1_127 n_1_128 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate127 ground n_2_127 ground n_1_128 vdd_lp ground RAM_tgate
Xwire128 n_1_128 n_1_129 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate128 ground n_2_128 n_1_129 ground vdd_lp ground RAM_tgate
Xwire129 n_1_129 n_1_130 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate129 ground n_2_129 ground n_1_130 vdd_lp ground RAM_tgate
Xwire130 n_1_130 n_1_131 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate130 ground n_2_130 n_1_131 ground vdd_lp ground RAM_tgate
Xwire131 n_1_131 n_1_132 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate131 ground n_2_131 ground n_1_132 vdd_lp ground RAM_tgate
Xwire132 n_1_132 n_1_133 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate132 ground n_2_132 n_1_133 ground vdd_lp ground RAM_tgate
Xwire133 n_1_133 n_1_134 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate133 ground n_2_133 ground n_1_134 vdd_lp ground RAM_tgate
Xwire134 n_1_134 n_1_135 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate134 ground n_2_134 n_1_135 ground vdd_lp ground RAM_tgate
Xwire135 n_1_135 n_1_136 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate135 ground n_2_135 ground n_1_136 vdd_lp ground RAM_tgate
Xwire136 n_1_136 n_1_137 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate136 ground n_2_136 n_1_137 ground vdd_lp ground RAM_tgate
Xwire137 n_1_137 n_1_138 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate137 ground n_2_137 ground n_1_138 vdd_lp ground RAM_tgate
Xwire138 n_1_138 n_1_139 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate138 ground n_2_138 n_1_139 ground vdd_lp ground RAM_tgate
Xwire139 n_1_139 n_1_140 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate139 ground n_2_139 ground n_1_140 vdd_lp ground RAM_tgate
Xwire140 n_1_140 n_1_141 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate140 ground n_2_140 n_1_141 ground vdd_lp ground RAM_tgate
Xwire141 n_1_141 n_1_142 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate141 ground n_2_141 ground n_1_142 vdd_lp ground RAM_tgate
Xwire142 n_1_142 n_1_143 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate142 ground n_2_142 n_1_143 ground vdd_lp ground RAM_tgate
Xwire143 n_1_143 n_1_144 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate143 ground n_2_143 ground n_1_144 vdd_lp ground RAM_tgate
Xwire144 n_1_144 n_1_145 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate144 ground n_2_144 n_1_145 ground vdd_lp ground RAM_tgate
Xwire145 n_1_145 n_1_146 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate145 ground n_2_145 ground n_1_146 vdd_lp ground RAM_tgate
Xwire146 n_1_146 n_1_147 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate146 ground n_2_146 n_1_147 ground vdd_lp ground RAM_tgate
Xwire147 n_1_147 n_1_148 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate147 ground n_2_147 ground n_1_148 vdd_lp ground RAM_tgate
Xwire148 n_1_148 n_1_149 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate148 ground n_2_148 n_1_149 ground vdd_lp ground RAM_tgate
Xwire149 n_1_149 n_1_150 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate149 ground n_2_149 ground n_1_150 vdd_lp ground RAM_tgate
Xwire150 n_1_150 n_1_151 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate150 ground n_2_150 n_1_151 ground vdd_lp ground RAM_tgate
Xwire151 n_1_151 n_1_152 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate151 ground n_2_151 ground n_1_152 vdd_lp ground RAM_tgate
Xwire152 n_1_152 n_1_153 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate152 ground n_2_152 n_1_153 ground vdd_lp ground RAM_tgate
Xwire153 n_1_153 n_1_154 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate153 ground n_2_153 ground n_1_154 vdd_lp ground RAM_tgate
Xwire154 n_1_154 n_1_155 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate154 ground n_2_154 n_1_155 ground vdd_lp ground RAM_tgate
Xwire155 n_1_155 n_1_156 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate155 ground n_2_155 ground n_1_156 vdd_lp ground RAM_tgate
Xwire156 n_1_156 n_1_157 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate156 ground n_2_156 n_1_157 ground vdd_lp ground RAM_tgate
Xwire157 n_1_157 n_1_158 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate157 ground n_2_157 ground n_1_158 vdd_lp ground RAM_tgate
Xwire158 n_1_158 n_1_159 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate158 ground n_2_158 n_1_159 ground vdd_lp ground RAM_tgate
Xwire159 n_1_159 n_1_160 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate159 ground n_2_159 ground n_1_160 vdd_lp ground RAM_tgate
Xwire160 n_1_160 n_1_161 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate160 ground n_2_160 n_1_161 ground vdd_lp ground RAM_tgate
Xwire161 n_1_161 n_1_162 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate161 ground n_2_161 ground n_1_162 vdd_lp ground RAM_tgate
Xwire162 n_1_162 n_1_163 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate162 ground n_2_162 n_1_163 ground vdd_lp ground RAM_tgate
Xwire163 n_1_163 n_1_164 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate163 ground n_2_163 ground n_1_164 vdd_lp ground RAM_tgate
Xwire164 n_1_164 n_1_165 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate164 ground n_2_164 n_1_165 ground vdd_lp ground RAM_tgate
Xwire165 n_1_165 n_1_166 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate165 ground n_2_165 ground n_1_166 vdd_lp ground RAM_tgate
Xwire166 n_1_166 n_1_167 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate166 ground n_2_166 n_1_167 ground vdd_lp ground RAM_tgate
Xwire167 n_1_167 n_1_168 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate167 ground n_2_167 ground n_1_168 vdd_lp ground RAM_tgate
Xwire168 n_1_168 n_1_169 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate168 ground n_2_168 n_1_169 ground vdd_lp ground RAM_tgate
Xwire169 n_1_169 n_1_170 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate169 ground n_2_169 ground n_1_170 vdd_lp ground RAM_tgate
Xwire170 n_1_170 n_1_171 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate170 ground n_2_170 n_1_171 ground vdd_lp ground RAM_tgate
Xwire171 n_1_171 n_1_172 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate171 ground n_2_171 ground n_1_172 vdd_lp ground RAM_tgate
Xwire172 n_1_172 n_1_173 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate172 ground n_2_172 n_1_173 ground vdd_lp ground RAM_tgate
Xwire173 n_1_173 n_1_174 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate173 ground n_2_173 ground n_1_174 vdd_lp ground RAM_tgate
Xwire174 n_1_174 n_1_175 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate174 ground n_2_174 n_1_175 ground vdd_lp ground RAM_tgate
Xwire175 n_1_175 n_1_176 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate175 ground n_2_175 ground n_1_176 vdd_lp ground RAM_tgate
Xwire176 n_1_176 n_1_177 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate176 ground n_2_176 n_1_177 ground vdd_lp ground RAM_tgate
Xwire177 n_1_177 n_1_178 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate177 ground n_2_177 ground n_1_178 vdd_lp ground RAM_tgate
Xwire178 n_1_178 n_1_179 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate178 ground n_2_178 n_1_179 ground vdd_lp ground RAM_tgate
Xwire179 n_1_179 n_1_180 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate179 ground n_2_179 ground n_1_180 vdd_lp ground RAM_tgate
Xwire180 n_1_180 n_1_181 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate180 ground n_2_180 n_1_181 ground vdd_lp ground RAM_tgate
Xwire181 n_1_181 n_1_182 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate181 ground n_2_181 ground n_1_182 vdd_lp ground RAM_tgate
Xwire182 n_1_182 n_1_183 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate182 ground n_2_182 n_1_183 ground vdd_lp ground RAM_tgate
Xwire183 n_1_183 n_1_184 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate183 ground n_2_183 ground n_1_184 vdd_lp ground RAM_tgate
Xwire184 n_1_184 n_1_185 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate184 ground n_2_184 n_1_185 ground vdd_lp ground RAM_tgate
Xwire185 n_1_185 n_1_186 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate185 ground n_2_185 ground n_1_186 vdd_lp ground RAM_tgate
Xwire186 n_1_186 n_1_187 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate186 ground n_2_186 n_1_187 ground vdd_lp ground RAM_tgate
Xwire187 n_1_187 n_1_188 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate187 ground n_2_187 ground n_1_188 vdd_lp ground RAM_tgate
Xwire188 n_1_188 n_1_189 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate188 ground n_2_188 n_1_189 ground vdd_lp ground RAM_tgate
Xwire189 n_1_189 n_1_190 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate189 ground n_2_189 ground n_1_190 vdd_lp ground RAM_tgate
Xwire190 n_1_190 n_1_191 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate190 ground n_2_190 n_1_191 ground vdd_lp ground RAM_tgate
Xwire191 n_1_191 n_1_192 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate191 ground n_2_191 ground n_1_192 vdd_lp ground RAM_tgate
Xwire192 n_1_192 n_1_193 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate192 ground n_2_192 n_1_193 ground vdd_lp ground RAM_tgate
Xwire193 n_1_193 n_1_194 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate193 ground n_2_193 ground n_1_194 vdd_lp ground RAM_tgate
Xwire194 n_1_194 n_1_195 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate194 ground n_2_194 n_1_195 ground vdd_lp ground RAM_tgate
Xwire195 n_1_195 n_1_196 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate195 ground n_2_195 ground n_1_196 vdd_lp ground RAM_tgate
Xwire196 n_1_196 n_1_197 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate196 ground n_2_196 n_1_197 ground vdd_lp ground RAM_tgate
Xwire197 n_1_197 n_1_198 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate197 ground n_2_197 ground n_1_198 vdd_lp ground RAM_tgate
Xwire198 n_1_198 n_1_199 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate198 ground n_2_198 n_1_199 ground vdd_lp ground RAM_tgate
Xwire199 n_1_199 n_1_200 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate199 ground n_2_199 ground n_1_200 vdd_lp ground RAM_tgate
Xwire200 n_1_200 n_1_201 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate200 ground n_2_200 n_1_201 ground vdd_lp ground RAM_tgate
Xwire201 n_1_201 n_1_202 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate201 ground n_2_201 ground n_1_202 vdd_lp ground RAM_tgate
Xwire202 n_1_202 n_1_203 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate202 ground n_2_202 n_1_203 ground vdd_lp ground RAM_tgate
Xwire203 n_1_203 n_1_204 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate203 ground n_2_203 ground n_1_204 vdd_lp ground RAM_tgate
Xwire204 n_1_204 n_1_205 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate204 ground n_2_204 n_1_205 ground vdd_lp ground RAM_tgate
Xwire205 n_1_205 n_1_206 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate205 ground n_2_205 ground n_1_206 vdd_lp ground RAM_tgate
Xwire206 n_1_206 n_1_207 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate206 ground n_2_206 n_1_207 ground vdd_lp ground RAM_tgate
Xwire207 n_1_207 n_1_208 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate207 ground n_2_207 ground n_1_208 vdd_lp ground RAM_tgate
Xwire208 n_1_208 n_1_209 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate208 ground n_2_208 n_1_209 ground vdd_lp ground RAM_tgate
Xwire209 n_1_209 n_1_210 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate209 ground n_2_209 ground n_1_210 vdd_lp ground RAM_tgate
Xwire210 n_1_210 n_1_211 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate210 ground n_2_210 n_1_211 ground vdd_lp ground RAM_tgate
Xwire211 n_1_211 n_1_212 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate211 ground n_2_211 ground n_1_212 vdd_lp ground RAM_tgate
Xwire212 n_1_212 n_1_213 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate212 ground n_2_212 n_1_213 ground vdd_lp ground RAM_tgate
Xwire213 n_1_213 n_1_214 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate213 ground n_2_213 ground n_1_214 vdd_lp ground RAM_tgate
Xwire214 n_1_214 n_1_215 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate214 ground n_2_214 n_1_215 ground vdd_lp ground RAM_tgate
Xwire215 n_1_215 n_1_216 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate215 ground n_2_215 ground n_1_216 vdd_lp ground RAM_tgate
Xwire216 n_1_216 n_1_217 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate216 ground n_2_216 n_1_217 ground vdd_lp ground RAM_tgate
Xwire217 n_1_217 n_1_218 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate217 ground n_2_217 ground n_1_218 vdd_lp ground RAM_tgate
Xwire218 n_1_218 n_1_219 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate218 ground n_2_218 n_1_219 ground vdd_lp ground RAM_tgate
Xwire219 n_1_219 n_1_220 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate219 ground n_2_219 ground n_1_220 vdd_lp ground RAM_tgate
Xwire220 n_1_220 n_1_221 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate220 ground n_2_220 n_1_221 ground vdd_lp ground RAM_tgate
Xwire221 n_1_221 n_1_222 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate221 ground n_2_221 ground n_1_222 vdd_lp ground RAM_tgate
Xwire222 n_1_222 n_1_223 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate222 ground n_2_222 n_1_223 ground vdd_lp ground RAM_tgate
Xwire223 n_1_223 n_1_224 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate223 ground n_2_223 ground n_1_224 vdd_lp ground RAM_tgate
Xwire224 n_1_224 n_1_225 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate224 ground n_2_224 n_1_225 ground vdd_lp ground RAM_tgate
Xwire225 n_1_225 n_1_226 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate225 ground n_2_225 ground n_1_226 vdd_lp ground RAM_tgate
Xwire226 n_1_226 n_1_227 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate226 ground n_2_226 n_1_227 ground vdd_lp ground RAM_tgate
Xwire227 n_1_227 n_1_228 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate227 ground n_2_227 ground n_1_228 vdd_lp ground RAM_tgate
Xwire228 n_1_228 n_1_229 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate228 ground n_2_228 n_1_229 ground vdd_lp ground RAM_tgate
Xwire229 n_1_229 n_1_230 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate229 ground n_2_229 ground n_1_230 vdd_lp ground RAM_tgate
Xwire230 n_1_230 n_1_231 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate230 ground n_2_230 n_1_231 ground vdd_lp ground RAM_tgate
Xwire231 n_1_231 n_1_232 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate231 ground n_2_231 ground n_1_232 vdd_lp ground RAM_tgate
Xwire232 n_1_232 n_1_233 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate232 ground n_2_232 n_1_233 ground vdd_lp ground RAM_tgate
Xwire233 n_1_233 n_1_234 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate233 ground n_2_233 ground n_1_234 vdd_lp ground RAM_tgate
Xwire234 n_1_234 n_1_235 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate234 ground n_2_234 n_1_235 ground vdd_lp ground RAM_tgate
Xwire235 n_1_235 n_1_236 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate235 ground n_2_235 ground n_1_236 vdd_lp ground RAM_tgate
Xwire236 n_1_236 n_1_237 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate236 ground n_2_236 n_1_237 ground vdd_lp ground RAM_tgate
Xwire237 n_1_237 n_1_238 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate237 ground n_2_237 ground n_1_238 vdd_lp ground RAM_tgate
Xwire238 n_1_238 n_1_239 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate238 ground n_2_238 n_1_239 ground vdd_lp ground RAM_tgate
Xwire239 n_1_239 n_1_240 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate239 ground n_2_239 ground n_1_240 vdd_lp ground RAM_tgate
Xwire240 n_1_240 n_1_241 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate240 ground n_2_240 n_1_241 ground vdd_lp ground RAM_tgate
Xwire241 n_1_241 n_1_242 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate241 ground n_2_241 ground n_1_242 vdd_lp ground RAM_tgate
Xwire242 n_1_242 n_1_243 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate242 ground n_2_242 n_1_243 ground vdd_lp ground RAM_tgate
Xwire243 n_1_243 n_1_244 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate243 ground n_2_243 ground n_1_244 vdd_lp ground RAM_tgate
Xwire244 n_1_244 n_1_245 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate244 ground n_2_244 n_1_245 ground vdd_lp ground RAM_tgate
Xwire245 n_1_245 n_1_246 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate245 ground n_2_245 ground n_1_246 vdd_lp ground RAM_tgate
Xwire246 n_1_246 n_1_247 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate246 ground n_2_246 n_1_247 ground vdd_lp ground RAM_tgate
Xwire247 n_1_247 n_1_248 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate247 ground n_2_247 ground n_1_248 vdd_lp ground RAM_tgate
Xwire248 n_1_248 n_1_249 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate248 ground n_2_248 n_1_249 ground vdd_lp ground RAM_tgate
Xwire249 n_1_249 n_1_250 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate249 ground n_2_249 ground n_1_250 vdd_lp ground RAM_tgate
Xwire250 n_1_250 n_1_251 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate250 ground n_2_250 n_1_251 ground vdd_lp ground RAM_tgate
Xwire251 n_1_251 n_1_252 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate251 ground n_2_251 ground n_1_252 vdd_lp ground RAM_tgate
Xwire252 n_1_252 n_1_253 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate252 ground n_2_252 n_1_253 ground vdd_lp ground RAM_tgate
Xwire253 n_1_253 n_1_254 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate253 ground n_2_253 ground n_1_254 vdd_lp ground RAM_tgate
Xwire254 n_1_254 n_1_255 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate254 ground n_2_254 n_1_255 ground vdd_lp ground RAM_tgate
Xwire255 n_1_255 n_1_256 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate255 ground n_2_255 ground n_1_256 vdd_lp ground RAM_tgate
Xwire256 n_1_256 n_1_257 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate256 ground n_2_256 n_1_257 ground vdd_lp ground RAM_tgate
Xwire257 n_1_257 n_1_258 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate257 ground n_2_257 ground n_1_258 vdd_lp ground RAM_tgate
Xwire258 n_1_258 n_1_259 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate258 ground n_2_258 n_1_259 ground vdd_lp ground RAM_tgate
Xwire259 n_1_259 n_1_260 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate259 ground n_2_259 ground n_1_260 vdd_lp ground RAM_tgate
Xwire260 n_1_260 n_1_261 wire Rw=wire_memorycell_horizontal_res/256 Cw=wire_memorycell_horizontal_cap/256
Xtgate260 ground n_2_260 n_1_261 ground vdd_lp ground RAM_tgate
.END