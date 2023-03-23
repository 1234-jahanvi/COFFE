.TITLE bitline discharging process in MTJ-based RAM block

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

VIN n_in ground PULSE (0 0.8_lp 0 0 0 4n 8n)
VINb n_in_b ground PULSE (0.8_lp 0 0 0 0 4n 8n)
* Power rail for the circuit under test.
* This allows us to measure power of a circuit under test without measuring the power of wave shaping and load circuitry.
V_discharge vdd_discharge ground 0.8_lp

********************************************************************************
** Measurement
********************************************************************************

* Total delays
.MEASURE TRAN meas_total_tfall TRIG V(n_in) VAL='0.8_lp/2' RISE=1
+    TARG V(n_bl_256) VAL='0.01 * 0.8_lp' FALL=1
.MEASURE TRAN meas_total_trise TRIG V(n_in) VAL='0.8_lp/2' RISE=1
+    TARG V(n_bl_256) VAL='0.01 * 0.8_lp' FALL=1

.MEASURE TRAN meas_logic_low_voltage FIND V(ground) AT=3n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current  INTEG I(V_discharge) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-(meas_current/2n)*0.8_lp'

********************************************************************************
** Circuit
********************************************************************************

Xprechargesa n_1_1 ground vdd_lp ground n_hang_out vclmpmtj vrefmtj ground ground vdd_lp ground mtj_subcircuits_sa
Xwritedriver ground ground n_1_1 ground vdd_lp ground mtj_subcircuits_writedriver
Xcs n_1_1 n_bl_0 n_in n_in_b vdd_discharge ground mtj_subcircuits_cs
Xwire0 n_bl_0 n_bl_1 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ0 ground ground n_bl_1 ground ground ground vdd_lp ground memorycell
Xwire1 n_bl_1 n_bl_2 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ1 ground ground n_bl_2 ground ground ground vdd_lp ground memorycell
Xwire2 n_bl_2 n_bl_3 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ2 ground ground n_bl_3 ground ground ground vdd_lp ground memorycell
Xwire3 n_bl_3 n_bl_4 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ3 ground ground n_bl_4 ground ground ground vdd_lp ground memorycell
Xwire4 n_bl_4 n_bl_5 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ4 ground ground n_bl_5 ground ground ground vdd_lp ground memorycell
Xwire5 n_bl_5 n_bl_6 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ5 ground ground n_bl_6 ground ground ground vdd_lp ground memorycell
Xwire6 n_bl_6 n_bl_7 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ6 ground ground n_bl_7 ground ground ground vdd_lp ground memorycell
Xwire7 n_bl_7 n_bl_8 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ7 ground ground n_bl_8 ground ground ground vdd_lp ground memorycell
Xwire8 n_bl_8 n_bl_9 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ8 ground ground n_bl_9 ground ground ground vdd_lp ground memorycell
Xwire9 n_bl_9 n_bl_10 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ9 ground ground n_bl_10 ground ground ground vdd_lp ground memorycell
Xwire10 n_bl_10 n_bl_11 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ10 ground ground n_bl_11 ground ground ground vdd_lp ground memorycell
Xwire11 n_bl_11 n_bl_12 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ11 ground ground n_bl_12 ground ground ground vdd_lp ground memorycell
Xwire12 n_bl_12 n_bl_13 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ12 ground ground n_bl_13 ground ground ground vdd_lp ground memorycell
Xwire13 n_bl_13 n_bl_14 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ13 ground ground n_bl_14 ground ground ground vdd_lp ground memorycell
Xwire14 n_bl_14 n_bl_15 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ14 ground ground n_bl_15 ground ground ground vdd_lp ground memorycell
Xwire15 n_bl_15 n_bl_16 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ15 ground ground n_bl_16 ground ground ground vdd_lp ground memorycell
Xwire16 n_bl_16 n_bl_17 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ16 ground ground n_bl_17 ground ground ground vdd_lp ground memorycell
Xwire17 n_bl_17 n_bl_18 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ17 ground ground n_bl_18 ground ground ground vdd_lp ground memorycell
Xwire18 n_bl_18 n_bl_19 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ18 ground ground n_bl_19 ground ground ground vdd_lp ground memorycell
Xwire19 n_bl_19 n_bl_20 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ19 ground ground n_bl_20 ground ground ground vdd_lp ground memorycell
Xwire20 n_bl_20 n_bl_21 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ20 ground ground n_bl_21 ground ground ground vdd_lp ground memorycell
Xwire21 n_bl_21 n_bl_22 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ21 ground ground n_bl_22 ground ground ground vdd_lp ground memorycell
Xwire22 n_bl_22 n_bl_23 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ22 ground ground n_bl_23 ground ground ground vdd_lp ground memorycell
Xwire23 n_bl_23 n_bl_24 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ23 ground ground n_bl_24 ground ground ground vdd_lp ground memorycell
Xwire24 n_bl_24 n_bl_25 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ24 ground ground n_bl_25 ground ground ground vdd_lp ground memorycell
Xwire25 n_bl_25 n_bl_26 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ25 ground ground n_bl_26 ground ground ground vdd_lp ground memorycell
Xwire26 n_bl_26 n_bl_27 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ26 ground ground n_bl_27 ground ground ground vdd_lp ground memorycell
Xwire27 n_bl_27 n_bl_28 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ27 ground ground n_bl_28 ground ground ground vdd_lp ground memorycell
Xwire28 n_bl_28 n_bl_29 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ28 ground ground n_bl_29 ground ground ground vdd_lp ground memorycell
Xwire29 n_bl_29 n_bl_30 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ29 ground ground n_bl_30 ground ground ground vdd_lp ground memorycell
Xwire30 n_bl_30 n_bl_31 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ30 ground ground n_bl_31 ground ground ground vdd_lp ground memorycell
Xwire31 n_bl_31 n_bl_32 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ31 ground ground n_bl_32 ground ground ground vdd_lp ground memorycell
Xwire32 n_bl_32 n_bl_33 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ32 ground ground n_bl_33 ground ground ground vdd_lp ground memorycell
Xwire33 n_bl_33 n_bl_34 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ33 ground ground n_bl_34 ground ground ground vdd_lp ground memorycell
Xwire34 n_bl_34 n_bl_35 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ34 ground ground n_bl_35 ground ground ground vdd_lp ground memorycell
Xwire35 n_bl_35 n_bl_36 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ35 ground ground n_bl_36 ground ground ground vdd_lp ground memorycell
Xwire36 n_bl_36 n_bl_37 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ36 ground ground n_bl_37 ground ground ground vdd_lp ground memorycell
Xwire37 n_bl_37 n_bl_38 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ37 ground ground n_bl_38 ground ground ground vdd_lp ground memorycell
Xwire38 n_bl_38 n_bl_39 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ38 ground ground n_bl_39 ground ground ground vdd_lp ground memorycell
Xwire39 n_bl_39 n_bl_40 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ39 ground ground n_bl_40 ground ground ground vdd_lp ground memorycell
Xwire40 n_bl_40 n_bl_41 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ40 ground ground n_bl_41 ground ground ground vdd_lp ground memorycell
Xwire41 n_bl_41 n_bl_42 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ41 ground ground n_bl_42 ground ground ground vdd_lp ground memorycell
Xwire42 n_bl_42 n_bl_43 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ42 ground ground n_bl_43 ground ground ground vdd_lp ground memorycell
Xwire43 n_bl_43 n_bl_44 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ43 ground ground n_bl_44 ground ground ground vdd_lp ground memorycell
Xwire44 n_bl_44 n_bl_45 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ44 ground ground n_bl_45 ground ground ground vdd_lp ground memorycell
Xwire45 n_bl_45 n_bl_46 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ45 ground ground n_bl_46 ground ground ground vdd_lp ground memorycell
Xwire46 n_bl_46 n_bl_47 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ46 ground ground n_bl_47 ground ground ground vdd_lp ground memorycell
Xwire47 n_bl_47 n_bl_48 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ47 ground ground n_bl_48 ground ground ground vdd_lp ground memorycell
Xwire48 n_bl_48 n_bl_49 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ48 ground ground n_bl_49 ground ground ground vdd_lp ground memorycell
Xwire49 n_bl_49 n_bl_50 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ49 ground ground n_bl_50 ground ground ground vdd_lp ground memorycell
Xwire50 n_bl_50 n_bl_51 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ50 ground ground n_bl_51 ground ground ground vdd_lp ground memorycell
Xwire51 n_bl_51 n_bl_52 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ51 ground ground n_bl_52 ground ground ground vdd_lp ground memorycell
Xwire52 n_bl_52 n_bl_53 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ52 ground ground n_bl_53 ground ground ground vdd_lp ground memorycell
Xwire53 n_bl_53 n_bl_54 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ53 ground ground n_bl_54 ground ground ground vdd_lp ground memorycell
Xwire54 n_bl_54 n_bl_55 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ54 ground ground n_bl_55 ground ground ground vdd_lp ground memorycell
Xwire55 n_bl_55 n_bl_56 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ55 ground ground n_bl_56 ground ground ground vdd_lp ground memorycell
Xwire56 n_bl_56 n_bl_57 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ56 ground ground n_bl_57 ground ground ground vdd_lp ground memorycell
Xwire57 n_bl_57 n_bl_58 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ57 ground ground n_bl_58 ground ground ground vdd_lp ground memorycell
Xwire58 n_bl_58 n_bl_59 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ58 ground ground n_bl_59 ground ground ground vdd_lp ground memorycell
Xwire59 n_bl_59 n_bl_60 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ59 ground ground n_bl_60 ground ground ground vdd_lp ground memorycell
Xwire60 n_bl_60 n_bl_61 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ60 ground ground n_bl_61 ground ground ground vdd_lp ground memorycell
Xwire61 n_bl_61 n_bl_62 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ61 ground ground n_bl_62 ground ground ground vdd_lp ground memorycell
Xwire62 n_bl_62 n_bl_63 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ62 ground ground n_bl_63 ground ground ground vdd_lp ground memorycell
Xwire63 n_bl_63 n_bl_64 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ63 ground ground n_bl_64 ground ground ground vdd_lp ground memorycell
Xwire64 n_bl_64 n_bl_65 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ64 ground ground n_bl_65 ground ground ground vdd_lp ground memorycell
Xwire65 n_bl_65 n_bl_66 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ65 ground ground n_bl_66 ground ground ground vdd_lp ground memorycell
Xwire66 n_bl_66 n_bl_67 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ66 ground ground n_bl_67 ground ground ground vdd_lp ground memorycell
Xwire67 n_bl_67 n_bl_68 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ67 ground ground n_bl_68 ground ground ground vdd_lp ground memorycell
Xwire68 n_bl_68 n_bl_69 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ68 ground ground n_bl_69 ground ground ground vdd_lp ground memorycell
Xwire69 n_bl_69 n_bl_70 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ69 ground ground n_bl_70 ground ground ground vdd_lp ground memorycell
Xwire70 n_bl_70 n_bl_71 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ70 ground ground n_bl_71 ground ground ground vdd_lp ground memorycell
Xwire71 n_bl_71 n_bl_72 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ71 ground ground n_bl_72 ground ground ground vdd_lp ground memorycell
Xwire72 n_bl_72 n_bl_73 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ72 ground ground n_bl_73 ground ground ground vdd_lp ground memorycell
Xwire73 n_bl_73 n_bl_74 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ73 ground ground n_bl_74 ground ground ground vdd_lp ground memorycell
Xwire74 n_bl_74 n_bl_75 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ74 ground ground n_bl_75 ground ground ground vdd_lp ground memorycell
Xwire75 n_bl_75 n_bl_76 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ75 ground ground n_bl_76 ground ground ground vdd_lp ground memorycell
Xwire76 n_bl_76 n_bl_77 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ76 ground ground n_bl_77 ground ground ground vdd_lp ground memorycell
Xwire77 n_bl_77 n_bl_78 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ77 ground ground n_bl_78 ground ground ground vdd_lp ground memorycell
Xwire78 n_bl_78 n_bl_79 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ78 ground ground n_bl_79 ground ground ground vdd_lp ground memorycell
Xwire79 n_bl_79 n_bl_80 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ79 ground ground n_bl_80 ground ground ground vdd_lp ground memorycell
Xwire80 n_bl_80 n_bl_81 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ80 ground ground n_bl_81 ground ground ground vdd_lp ground memorycell
Xwire81 n_bl_81 n_bl_82 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ81 ground ground n_bl_82 ground ground ground vdd_lp ground memorycell
Xwire82 n_bl_82 n_bl_83 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ82 ground ground n_bl_83 ground ground ground vdd_lp ground memorycell
Xwire83 n_bl_83 n_bl_84 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ83 ground ground n_bl_84 ground ground ground vdd_lp ground memorycell
Xwire84 n_bl_84 n_bl_85 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ84 ground ground n_bl_85 ground ground ground vdd_lp ground memorycell
Xwire85 n_bl_85 n_bl_86 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ85 ground ground n_bl_86 ground ground ground vdd_lp ground memorycell
Xwire86 n_bl_86 n_bl_87 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ86 ground ground n_bl_87 ground ground ground vdd_lp ground memorycell
Xwire87 n_bl_87 n_bl_88 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ87 ground ground n_bl_88 ground ground ground vdd_lp ground memorycell
Xwire88 n_bl_88 n_bl_89 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ88 ground ground n_bl_89 ground ground ground vdd_lp ground memorycell
Xwire89 n_bl_89 n_bl_90 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ89 ground ground n_bl_90 ground ground ground vdd_lp ground memorycell
Xwire90 n_bl_90 n_bl_91 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ90 ground ground n_bl_91 ground ground ground vdd_lp ground memorycell
Xwire91 n_bl_91 n_bl_92 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ91 ground ground n_bl_92 ground ground ground vdd_lp ground memorycell
Xwire92 n_bl_92 n_bl_93 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ92 ground ground n_bl_93 ground ground ground vdd_lp ground memorycell
Xwire93 n_bl_93 n_bl_94 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ93 ground ground n_bl_94 ground ground ground vdd_lp ground memorycell
Xwire94 n_bl_94 n_bl_95 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ94 ground ground n_bl_95 ground ground ground vdd_lp ground memorycell
Xwire95 n_bl_95 n_bl_96 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ95 ground ground n_bl_96 ground ground ground vdd_lp ground memorycell
Xwire96 n_bl_96 n_bl_97 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ96 ground ground n_bl_97 ground ground ground vdd_lp ground memorycell
Xwire97 n_bl_97 n_bl_98 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ97 ground ground n_bl_98 ground ground ground vdd_lp ground memorycell
Xwire98 n_bl_98 n_bl_99 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ98 ground ground n_bl_99 ground ground ground vdd_lp ground memorycell
Xwire99 n_bl_99 n_bl_100 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ99 ground ground n_bl_100 ground ground ground vdd_lp ground memorycell
Xwire100 n_bl_100 n_bl_101 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ100 ground ground n_bl_101 ground ground ground vdd_lp ground memorycell
Xwire101 n_bl_101 n_bl_102 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ101 ground ground n_bl_102 ground ground ground vdd_lp ground memorycell
Xwire102 n_bl_102 n_bl_103 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ102 ground ground n_bl_103 ground ground ground vdd_lp ground memorycell
Xwire103 n_bl_103 n_bl_104 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ103 ground ground n_bl_104 ground ground ground vdd_lp ground memorycell
Xwire104 n_bl_104 n_bl_105 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ104 ground ground n_bl_105 ground ground ground vdd_lp ground memorycell
Xwire105 n_bl_105 n_bl_106 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ105 ground ground n_bl_106 ground ground ground vdd_lp ground memorycell
Xwire106 n_bl_106 n_bl_107 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ106 ground ground n_bl_107 ground ground ground vdd_lp ground memorycell
Xwire107 n_bl_107 n_bl_108 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ107 ground ground n_bl_108 ground ground ground vdd_lp ground memorycell
Xwire108 n_bl_108 n_bl_109 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ108 ground ground n_bl_109 ground ground ground vdd_lp ground memorycell
Xwire109 n_bl_109 n_bl_110 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ109 ground ground n_bl_110 ground ground ground vdd_lp ground memorycell
Xwire110 n_bl_110 n_bl_111 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ110 ground ground n_bl_111 ground ground ground vdd_lp ground memorycell
Xwire111 n_bl_111 n_bl_112 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ111 ground ground n_bl_112 ground ground ground vdd_lp ground memorycell
Xwire112 n_bl_112 n_bl_113 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ112 ground ground n_bl_113 ground ground ground vdd_lp ground memorycell
Xwire113 n_bl_113 n_bl_114 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ113 ground ground n_bl_114 ground ground ground vdd_lp ground memorycell
Xwire114 n_bl_114 n_bl_115 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ114 ground ground n_bl_115 ground ground ground vdd_lp ground memorycell
Xwire115 n_bl_115 n_bl_116 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ115 ground ground n_bl_116 ground ground ground vdd_lp ground memorycell
Xwire116 n_bl_116 n_bl_117 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ116 ground ground n_bl_117 ground ground ground vdd_lp ground memorycell
Xwire117 n_bl_117 n_bl_118 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ117 ground ground n_bl_118 ground ground ground vdd_lp ground memorycell
Xwire118 n_bl_118 n_bl_119 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ118 ground ground n_bl_119 ground ground ground vdd_lp ground memorycell
Xwire119 n_bl_119 n_bl_120 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ119 ground ground n_bl_120 ground ground ground vdd_lp ground memorycell
Xwire120 n_bl_120 n_bl_121 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ120 ground ground n_bl_121 ground ground ground vdd_lp ground memorycell
Xwire121 n_bl_121 n_bl_122 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ121 ground ground n_bl_122 ground ground ground vdd_lp ground memorycell
Xwire122 n_bl_122 n_bl_123 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ122 ground ground n_bl_123 ground ground ground vdd_lp ground memorycell
Xwire123 n_bl_123 n_bl_124 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ123 ground ground n_bl_124 ground ground ground vdd_lp ground memorycell
Xwire124 n_bl_124 n_bl_125 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ124 ground ground n_bl_125 ground ground ground vdd_lp ground memorycell
Xwire125 n_bl_125 n_bl_126 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ125 ground ground n_bl_126 ground ground ground vdd_lp ground memorycell
Xwire126 n_bl_126 n_bl_127 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ126 ground ground n_bl_127 ground ground ground vdd_lp ground memorycell
Xwire127 n_bl_127 n_bl_128 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ127 ground ground n_bl_128 ground ground ground vdd_lp ground memorycell
Xwire128 n_bl_128 n_bl_129 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ128 ground ground n_bl_129 ground ground ground vdd_lp ground memorycell
Xwire129 n_bl_129 n_bl_130 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ129 ground ground n_bl_130 ground ground ground vdd_lp ground memorycell
Xwire130 n_bl_130 n_bl_131 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ130 ground ground n_bl_131 ground ground ground vdd_lp ground memorycell
Xwire131 n_bl_131 n_bl_132 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ131 ground ground n_bl_132 ground ground ground vdd_lp ground memorycell
Xwire132 n_bl_132 n_bl_133 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ132 ground ground n_bl_133 ground ground ground vdd_lp ground memorycell
Xwire133 n_bl_133 n_bl_134 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ133 ground ground n_bl_134 ground ground ground vdd_lp ground memorycell
Xwire134 n_bl_134 n_bl_135 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ134 ground ground n_bl_135 ground ground ground vdd_lp ground memorycell
Xwire135 n_bl_135 n_bl_136 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ135 ground ground n_bl_136 ground ground ground vdd_lp ground memorycell
Xwire136 n_bl_136 n_bl_137 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ136 ground ground n_bl_137 ground ground ground vdd_lp ground memorycell
Xwire137 n_bl_137 n_bl_138 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ137 ground ground n_bl_138 ground ground ground vdd_lp ground memorycell
Xwire138 n_bl_138 n_bl_139 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ138 ground ground n_bl_139 ground ground ground vdd_lp ground memorycell
Xwire139 n_bl_139 n_bl_140 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ139 ground ground n_bl_140 ground ground ground vdd_lp ground memorycell
Xwire140 n_bl_140 n_bl_141 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ140 ground ground n_bl_141 ground ground ground vdd_lp ground memorycell
Xwire141 n_bl_141 n_bl_142 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ141 ground ground n_bl_142 ground ground ground vdd_lp ground memorycell
Xwire142 n_bl_142 n_bl_143 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ142 ground ground n_bl_143 ground ground ground vdd_lp ground memorycell
Xwire143 n_bl_143 n_bl_144 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ143 ground ground n_bl_144 ground ground ground vdd_lp ground memorycell
Xwire144 n_bl_144 n_bl_145 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ144 ground ground n_bl_145 ground ground ground vdd_lp ground memorycell
Xwire145 n_bl_145 n_bl_146 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ145 ground ground n_bl_146 ground ground ground vdd_lp ground memorycell
Xwire146 n_bl_146 n_bl_147 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ146 ground ground n_bl_147 ground ground ground vdd_lp ground memorycell
Xwire147 n_bl_147 n_bl_148 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ147 ground ground n_bl_148 ground ground ground vdd_lp ground memorycell
Xwire148 n_bl_148 n_bl_149 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ148 ground ground n_bl_149 ground ground ground vdd_lp ground memorycell
Xwire149 n_bl_149 n_bl_150 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ149 ground ground n_bl_150 ground ground ground vdd_lp ground memorycell
Xwire150 n_bl_150 n_bl_151 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ150 ground ground n_bl_151 ground ground ground vdd_lp ground memorycell
Xwire151 n_bl_151 n_bl_152 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ151 ground ground n_bl_152 ground ground ground vdd_lp ground memorycell
Xwire152 n_bl_152 n_bl_153 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ152 ground ground n_bl_153 ground ground ground vdd_lp ground memorycell
Xwire153 n_bl_153 n_bl_154 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ153 ground ground n_bl_154 ground ground ground vdd_lp ground memorycell
Xwire154 n_bl_154 n_bl_155 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ154 ground ground n_bl_155 ground ground ground vdd_lp ground memorycell
Xwire155 n_bl_155 n_bl_156 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ155 ground ground n_bl_156 ground ground ground vdd_lp ground memorycell
Xwire156 n_bl_156 n_bl_157 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ156 ground ground n_bl_157 ground ground ground vdd_lp ground memorycell
Xwire157 n_bl_157 n_bl_158 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ157 ground ground n_bl_158 ground ground ground vdd_lp ground memorycell
Xwire158 n_bl_158 n_bl_159 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ158 ground ground n_bl_159 ground ground ground vdd_lp ground memorycell
Xwire159 n_bl_159 n_bl_160 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ159 ground ground n_bl_160 ground ground ground vdd_lp ground memorycell
Xwire160 n_bl_160 n_bl_161 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ160 ground ground n_bl_161 ground ground ground vdd_lp ground memorycell
Xwire161 n_bl_161 n_bl_162 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ161 ground ground n_bl_162 ground ground ground vdd_lp ground memorycell
Xwire162 n_bl_162 n_bl_163 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ162 ground ground n_bl_163 ground ground ground vdd_lp ground memorycell
Xwire163 n_bl_163 n_bl_164 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ163 ground ground n_bl_164 ground ground ground vdd_lp ground memorycell
Xwire164 n_bl_164 n_bl_165 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ164 ground ground n_bl_165 ground ground ground vdd_lp ground memorycell
Xwire165 n_bl_165 n_bl_166 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ165 ground ground n_bl_166 ground ground ground vdd_lp ground memorycell
Xwire166 n_bl_166 n_bl_167 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ166 ground ground n_bl_167 ground ground ground vdd_lp ground memorycell
Xwire167 n_bl_167 n_bl_168 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ167 ground ground n_bl_168 ground ground ground vdd_lp ground memorycell
Xwire168 n_bl_168 n_bl_169 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ168 ground ground n_bl_169 ground ground ground vdd_lp ground memorycell
Xwire169 n_bl_169 n_bl_170 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ169 ground ground n_bl_170 ground ground ground vdd_lp ground memorycell
Xwire170 n_bl_170 n_bl_171 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ170 ground ground n_bl_171 ground ground ground vdd_lp ground memorycell
Xwire171 n_bl_171 n_bl_172 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ171 ground ground n_bl_172 ground ground ground vdd_lp ground memorycell
Xwire172 n_bl_172 n_bl_173 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ172 ground ground n_bl_173 ground ground ground vdd_lp ground memorycell
Xwire173 n_bl_173 n_bl_174 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ173 ground ground n_bl_174 ground ground ground vdd_lp ground memorycell
Xwire174 n_bl_174 n_bl_175 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ174 ground ground n_bl_175 ground ground ground vdd_lp ground memorycell
Xwire175 n_bl_175 n_bl_176 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ175 ground ground n_bl_176 ground ground ground vdd_lp ground memorycell
Xwire176 n_bl_176 n_bl_177 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ176 ground ground n_bl_177 ground ground ground vdd_lp ground memorycell
Xwire177 n_bl_177 n_bl_178 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ177 ground ground n_bl_178 ground ground ground vdd_lp ground memorycell
Xwire178 n_bl_178 n_bl_179 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ178 ground ground n_bl_179 ground ground ground vdd_lp ground memorycell
Xwire179 n_bl_179 n_bl_180 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ179 ground ground n_bl_180 ground ground ground vdd_lp ground memorycell
Xwire180 n_bl_180 n_bl_181 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ180 ground ground n_bl_181 ground ground ground vdd_lp ground memorycell
Xwire181 n_bl_181 n_bl_182 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ181 ground ground n_bl_182 ground ground ground vdd_lp ground memorycell
Xwire182 n_bl_182 n_bl_183 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ182 ground ground n_bl_183 ground ground ground vdd_lp ground memorycell
Xwire183 n_bl_183 n_bl_184 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ183 ground ground n_bl_184 ground ground ground vdd_lp ground memorycell
Xwire184 n_bl_184 n_bl_185 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ184 ground ground n_bl_185 ground ground ground vdd_lp ground memorycell
Xwire185 n_bl_185 n_bl_186 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ185 ground ground n_bl_186 ground ground ground vdd_lp ground memorycell
Xwire186 n_bl_186 n_bl_187 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ186 ground ground n_bl_187 ground ground ground vdd_lp ground memorycell
Xwire187 n_bl_187 n_bl_188 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ187 ground ground n_bl_188 ground ground ground vdd_lp ground memorycell
Xwire188 n_bl_188 n_bl_189 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ188 ground ground n_bl_189 ground ground ground vdd_lp ground memorycell
Xwire189 n_bl_189 n_bl_190 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ189 ground ground n_bl_190 ground ground ground vdd_lp ground memorycell
Xwire190 n_bl_190 n_bl_191 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ190 ground ground n_bl_191 ground ground ground vdd_lp ground memorycell
Xwire191 n_bl_191 n_bl_192 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ191 ground ground n_bl_192 ground ground ground vdd_lp ground memorycell
Xwire192 n_bl_192 n_bl_193 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ192 ground ground n_bl_193 ground ground ground vdd_lp ground memorycell
Xwire193 n_bl_193 n_bl_194 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ193 ground ground n_bl_194 ground ground ground vdd_lp ground memorycell
Xwire194 n_bl_194 n_bl_195 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ194 ground ground n_bl_195 ground ground ground vdd_lp ground memorycell
Xwire195 n_bl_195 n_bl_196 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ195 ground ground n_bl_196 ground ground ground vdd_lp ground memorycell
Xwire196 n_bl_196 n_bl_197 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ196 ground ground n_bl_197 ground ground ground vdd_lp ground memorycell
Xwire197 n_bl_197 n_bl_198 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ197 ground ground n_bl_198 ground ground ground vdd_lp ground memorycell
Xwire198 n_bl_198 n_bl_199 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ198 ground ground n_bl_199 ground ground ground vdd_lp ground memorycell
Xwire199 n_bl_199 n_bl_200 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ199 ground ground n_bl_200 ground ground ground vdd_lp ground memorycell
Xwire200 n_bl_200 n_bl_201 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ200 ground ground n_bl_201 ground ground ground vdd_lp ground memorycell
Xwire201 n_bl_201 n_bl_202 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ201 ground ground n_bl_202 ground ground ground vdd_lp ground memorycell
Xwire202 n_bl_202 n_bl_203 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ202 ground ground n_bl_203 ground ground ground vdd_lp ground memorycell
Xwire203 n_bl_203 n_bl_204 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ203 ground ground n_bl_204 ground ground ground vdd_lp ground memorycell
Xwire204 n_bl_204 n_bl_205 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ204 ground ground n_bl_205 ground ground ground vdd_lp ground memorycell
Xwire205 n_bl_205 n_bl_206 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ205 ground ground n_bl_206 ground ground ground vdd_lp ground memorycell
Xwire206 n_bl_206 n_bl_207 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ206 ground ground n_bl_207 ground ground ground vdd_lp ground memorycell
Xwire207 n_bl_207 n_bl_208 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ207 ground ground n_bl_208 ground ground ground vdd_lp ground memorycell
Xwire208 n_bl_208 n_bl_209 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ208 ground ground n_bl_209 ground ground ground vdd_lp ground memorycell
Xwire209 n_bl_209 n_bl_210 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ209 ground ground n_bl_210 ground ground ground vdd_lp ground memorycell
Xwire210 n_bl_210 n_bl_211 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ210 ground ground n_bl_211 ground ground ground vdd_lp ground memorycell
Xwire211 n_bl_211 n_bl_212 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ211 ground ground n_bl_212 ground ground ground vdd_lp ground memorycell
Xwire212 n_bl_212 n_bl_213 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ212 ground ground n_bl_213 ground ground ground vdd_lp ground memorycell
Xwire213 n_bl_213 n_bl_214 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ213 ground ground n_bl_214 ground ground ground vdd_lp ground memorycell
Xwire214 n_bl_214 n_bl_215 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ214 ground ground n_bl_215 ground ground ground vdd_lp ground memorycell
Xwire215 n_bl_215 n_bl_216 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ215 ground ground n_bl_216 ground ground ground vdd_lp ground memorycell
Xwire216 n_bl_216 n_bl_217 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ216 ground ground n_bl_217 ground ground ground vdd_lp ground memorycell
Xwire217 n_bl_217 n_bl_218 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ217 ground ground n_bl_218 ground ground ground vdd_lp ground memorycell
Xwire218 n_bl_218 n_bl_219 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ218 ground ground n_bl_219 ground ground ground vdd_lp ground memorycell
Xwire219 n_bl_219 n_bl_220 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ219 ground ground n_bl_220 ground ground ground vdd_lp ground memorycell
Xwire220 n_bl_220 n_bl_221 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ220 ground ground n_bl_221 ground ground ground vdd_lp ground memorycell
Xwire221 n_bl_221 n_bl_222 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ221 ground ground n_bl_222 ground ground ground vdd_lp ground memorycell
Xwire222 n_bl_222 n_bl_223 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ222 ground ground n_bl_223 ground ground ground vdd_lp ground memorycell
Xwire223 n_bl_223 n_bl_224 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ223 ground ground n_bl_224 ground ground ground vdd_lp ground memorycell
Xwire224 n_bl_224 n_bl_225 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ224 ground ground n_bl_225 ground ground ground vdd_lp ground memorycell
Xwire225 n_bl_225 n_bl_226 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ225 ground ground n_bl_226 ground ground ground vdd_lp ground memorycell
Xwire226 n_bl_226 n_bl_227 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ226 ground ground n_bl_227 ground ground ground vdd_lp ground memorycell
Xwire227 n_bl_227 n_bl_228 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ227 ground ground n_bl_228 ground ground ground vdd_lp ground memorycell
Xwire228 n_bl_228 n_bl_229 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ228 ground ground n_bl_229 ground ground ground vdd_lp ground memorycell
Xwire229 n_bl_229 n_bl_230 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ229 ground ground n_bl_230 ground ground ground vdd_lp ground memorycell
Xwire230 n_bl_230 n_bl_231 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ230 ground ground n_bl_231 ground ground ground vdd_lp ground memorycell
Xwire231 n_bl_231 n_bl_232 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ231 ground ground n_bl_232 ground ground ground vdd_lp ground memorycell
Xwire232 n_bl_232 n_bl_233 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ232 ground ground n_bl_233 ground ground ground vdd_lp ground memorycell
Xwire233 n_bl_233 n_bl_234 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ233 ground ground n_bl_234 ground ground ground vdd_lp ground memorycell
Xwire234 n_bl_234 n_bl_235 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ234 ground ground n_bl_235 ground ground ground vdd_lp ground memorycell
Xwire235 n_bl_235 n_bl_236 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ235 ground ground n_bl_236 ground ground ground vdd_lp ground memorycell
Xwire236 n_bl_236 n_bl_237 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ236 ground ground n_bl_237 ground ground ground vdd_lp ground memorycell
Xwire237 n_bl_237 n_bl_238 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ237 ground ground n_bl_238 ground ground ground vdd_lp ground memorycell
Xwire238 n_bl_238 n_bl_239 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ238 ground ground n_bl_239 ground ground ground vdd_lp ground memorycell
Xwire239 n_bl_239 n_bl_240 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ239 ground ground n_bl_240 ground ground ground vdd_lp ground memorycell
Xwire240 n_bl_240 n_bl_241 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ240 ground ground n_bl_241 ground ground ground vdd_lp ground memorycell
Xwire241 n_bl_241 n_bl_242 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ241 ground ground n_bl_242 ground ground ground vdd_lp ground memorycell
Xwire242 n_bl_242 n_bl_243 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ242 ground ground n_bl_243 ground ground ground vdd_lp ground memorycell
Xwire243 n_bl_243 n_bl_244 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ243 ground ground n_bl_244 ground ground ground vdd_lp ground memorycell
Xwire244 n_bl_244 n_bl_245 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ244 ground ground n_bl_245 ground ground ground vdd_lp ground memorycell
Xwire245 n_bl_245 n_bl_246 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ245 ground ground n_bl_246 ground ground ground vdd_lp ground memorycell
Xwire246 n_bl_246 n_bl_247 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ246 ground ground n_bl_247 ground ground ground vdd_lp ground memorycell
Xwire247 n_bl_247 n_bl_248 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ247 ground ground n_bl_248 ground ground ground vdd_lp ground memorycell
Xwire248 n_bl_248 n_bl_249 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ248 ground ground n_bl_249 ground ground ground vdd_lp ground memorycell
Xwire249 n_bl_249 n_bl_250 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ249 ground ground n_bl_250 ground ground ground vdd_lp ground memorycell
Xwire250 n_bl_250 n_bl_251 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ250 ground ground n_bl_251 ground ground ground vdd_lp ground memorycell
Xwire251 n_bl_251 n_bl_252 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ251 ground ground n_bl_252 ground ground ground vdd_lp ground memorycell
Xwire252 n_bl_252 n_bl_253 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ252 ground ground n_bl_253 ground ground ground vdd_lp ground memorycell
Xwire253 n_bl_253 n_bl_254 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ253 ground ground n_bl_254 ground ground ground vdd_lp ground memorycell
Xwire254 n_bl_254 n_bl_255 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ254 ground ground n_bl_255 ground ground ground vdd_lp ground memorycell
Xwire255 n_bl_255 n_bl_256 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
XMTJ255 ground ground n_bl_256 ground ground ground vdd_lp ground memorycell
.IC V(n_1_1) = 0.8 
.IC V(n_bl_0) = 0.8 
.IC V(n_bl_1) = 0.8 
.IC V(n_bl_2) = 0.8 
.IC V(n_bl_3) = 0.8 
.IC V(n_bl_4) = 0.8 
.IC V(n_bl_5) = 0.8 
.IC V(n_bl_6) = 0.8 
.IC V(n_bl_7) = 0.8 
.IC V(n_bl_8) = 0.8 
.IC V(n_bl_9) = 0.8 
.IC V(n_bl_10) = 0.8 
.IC V(n_bl_11) = 0.8 
.IC V(n_bl_12) = 0.8 
.IC V(n_bl_13) = 0.8 
.IC V(n_bl_14) = 0.8 
.IC V(n_bl_15) = 0.8 
.IC V(n_bl_16) = 0.8 
.IC V(n_bl_17) = 0.8 
.IC V(n_bl_18) = 0.8 
.IC V(n_bl_19) = 0.8 
.IC V(n_bl_20) = 0.8 
.IC V(n_bl_21) = 0.8 
.IC V(n_bl_22) = 0.8 
.IC V(n_bl_23) = 0.8 
.IC V(n_bl_24) = 0.8 
.IC V(n_bl_25) = 0.8 
.IC V(n_bl_26) = 0.8 
.IC V(n_bl_27) = 0.8 
.IC V(n_bl_28) = 0.8 
.IC V(n_bl_29) = 0.8 
.IC V(n_bl_30) = 0.8 
.IC V(n_bl_31) = 0.8 
.IC V(n_bl_32) = 0.8 
.IC V(n_bl_33) = 0.8 
.IC V(n_bl_34) = 0.8 
.IC V(n_bl_35) = 0.8 
.IC V(n_bl_36) = 0.8 
.IC V(n_bl_37) = 0.8 
.IC V(n_bl_38) = 0.8 
.IC V(n_bl_39) = 0.8 
.IC V(n_bl_40) = 0.8 
.IC V(n_bl_41) = 0.8 
.IC V(n_bl_42) = 0.8 
.IC V(n_bl_43) = 0.8 
.IC V(n_bl_44) = 0.8 
.IC V(n_bl_45) = 0.8 
.IC V(n_bl_46) = 0.8 
.IC V(n_bl_47) = 0.8 
.IC V(n_bl_48) = 0.8 
.IC V(n_bl_49) = 0.8 
.IC V(n_bl_50) = 0.8 
.IC V(n_bl_51) = 0.8 
.IC V(n_bl_52) = 0.8 
.IC V(n_bl_53) = 0.8 
.IC V(n_bl_54) = 0.8 
.IC V(n_bl_55) = 0.8 
.IC V(n_bl_56) = 0.8 
.IC V(n_bl_57) = 0.8 
.IC V(n_bl_58) = 0.8 
.IC V(n_bl_59) = 0.8 
.IC V(n_bl_60) = 0.8 
.IC V(n_bl_61) = 0.8 
.IC V(n_bl_62) = 0.8 
.IC V(n_bl_63) = 0.8 
.IC V(n_bl_64) = 0.8 
.IC V(n_bl_65) = 0.8 
.IC V(n_bl_66) = 0.8 
.IC V(n_bl_67) = 0.8 
.IC V(n_bl_68) = 0.8 
.IC V(n_bl_69) = 0.8 
.IC V(n_bl_70) = 0.8 
.IC V(n_bl_71) = 0.8 
.IC V(n_bl_72) = 0.8 
.IC V(n_bl_73) = 0.8 
.IC V(n_bl_74) = 0.8 
.IC V(n_bl_75) = 0.8 
.IC V(n_bl_76) = 0.8 
.IC V(n_bl_77) = 0.8 
.IC V(n_bl_78) = 0.8 
.IC V(n_bl_79) = 0.8 
.IC V(n_bl_80) = 0.8 
.IC V(n_bl_81) = 0.8 
.IC V(n_bl_82) = 0.8 
.IC V(n_bl_83) = 0.8 
.IC V(n_bl_84) = 0.8 
.IC V(n_bl_85) = 0.8 
.IC V(n_bl_86) = 0.8 
.IC V(n_bl_87) = 0.8 
.IC V(n_bl_88) = 0.8 
.IC V(n_bl_89) = 0.8 
.IC V(n_bl_90) = 0.8 
.IC V(n_bl_91) = 0.8 
.IC V(n_bl_92) = 0.8 
.IC V(n_bl_93) = 0.8 
.IC V(n_bl_94) = 0.8 
.IC V(n_bl_95) = 0.8 
.IC V(n_bl_96) = 0.8 
.IC V(n_bl_97) = 0.8 
.IC V(n_bl_98) = 0.8 
.IC V(n_bl_99) = 0.8 
.IC V(n_bl_100) = 0.8 
.IC V(n_bl_101) = 0.8 
.IC V(n_bl_102) = 0.8 
.IC V(n_bl_103) = 0.8 
.IC V(n_bl_104) = 0.8 
.IC V(n_bl_105) = 0.8 
.IC V(n_bl_106) = 0.8 
.IC V(n_bl_107) = 0.8 
.IC V(n_bl_108) = 0.8 
.IC V(n_bl_109) = 0.8 
.IC V(n_bl_110) = 0.8 
.IC V(n_bl_111) = 0.8 
.IC V(n_bl_112) = 0.8 
.IC V(n_bl_113) = 0.8 
.IC V(n_bl_114) = 0.8 
.IC V(n_bl_115) = 0.8 
.IC V(n_bl_116) = 0.8 
.IC V(n_bl_117) = 0.8 
.IC V(n_bl_118) = 0.8 
.IC V(n_bl_119) = 0.8 
.IC V(n_bl_120) = 0.8 
.IC V(n_bl_121) = 0.8 
.IC V(n_bl_122) = 0.8 
.IC V(n_bl_123) = 0.8 
.IC V(n_bl_124) = 0.8 
.IC V(n_bl_125) = 0.8 
.IC V(n_bl_126) = 0.8 
.IC V(n_bl_127) = 0.8 
.IC V(n_bl_128) = 0.8 
.IC V(n_bl_129) = 0.8 
.IC V(n_bl_130) = 0.8 
.IC V(n_bl_131) = 0.8 
.IC V(n_bl_132) = 0.8 
.IC V(n_bl_133) = 0.8 
.IC V(n_bl_134) = 0.8 
.IC V(n_bl_135) = 0.8 
.IC V(n_bl_136) = 0.8 
.IC V(n_bl_137) = 0.8 
.IC V(n_bl_138) = 0.8 
.IC V(n_bl_139) = 0.8 
.IC V(n_bl_140) = 0.8 
.IC V(n_bl_141) = 0.8 
.IC V(n_bl_142) = 0.8 
.IC V(n_bl_143) = 0.8 
.IC V(n_bl_144) = 0.8 
.IC V(n_bl_145) = 0.8 
.IC V(n_bl_146) = 0.8 
.IC V(n_bl_147) = 0.8 
.IC V(n_bl_148) = 0.8 
.IC V(n_bl_149) = 0.8 
.IC V(n_bl_150) = 0.8 
.IC V(n_bl_151) = 0.8 
.IC V(n_bl_152) = 0.8 
.IC V(n_bl_153) = 0.8 
.IC V(n_bl_154) = 0.8 
.IC V(n_bl_155) = 0.8 
.IC V(n_bl_156) = 0.8 
.IC V(n_bl_157) = 0.8 
.IC V(n_bl_158) = 0.8 
.IC V(n_bl_159) = 0.8 
.IC V(n_bl_160) = 0.8 
.IC V(n_bl_161) = 0.8 
.IC V(n_bl_162) = 0.8 
.IC V(n_bl_163) = 0.8 
.IC V(n_bl_164) = 0.8 
.IC V(n_bl_165) = 0.8 
.IC V(n_bl_166) = 0.8 
.IC V(n_bl_167) = 0.8 
.IC V(n_bl_168) = 0.8 
.IC V(n_bl_169) = 0.8 
.IC V(n_bl_170) = 0.8 
.IC V(n_bl_171) = 0.8 
.IC V(n_bl_172) = 0.8 
.IC V(n_bl_173) = 0.8 
.IC V(n_bl_174) = 0.8 
.IC V(n_bl_175) = 0.8 
.IC V(n_bl_176) = 0.8 
.IC V(n_bl_177) = 0.8 
.IC V(n_bl_178) = 0.8 
.IC V(n_bl_179) = 0.8 
.IC V(n_bl_180) = 0.8 
.IC V(n_bl_181) = 0.8 
.IC V(n_bl_182) = 0.8 
.IC V(n_bl_183) = 0.8 
.IC V(n_bl_184) = 0.8 
.IC V(n_bl_185) = 0.8 
.IC V(n_bl_186) = 0.8 
.IC V(n_bl_187) = 0.8 
.IC V(n_bl_188) = 0.8 
.IC V(n_bl_189) = 0.8 
.IC V(n_bl_190) = 0.8 
.IC V(n_bl_191) = 0.8 
.IC V(n_bl_192) = 0.8 
.IC V(n_bl_193) = 0.8 
.IC V(n_bl_194) = 0.8 
.IC V(n_bl_195) = 0.8 
.IC V(n_bl_196) = 0.8 
.IC V(n_bl_197) = 0.8 
.IC V(n_bl_198) = 0.8 
.IC V(n_bl_199) = 0.8 
.IC V(n_bl_200) = 0.8 
.IC V(n_bl_201) = 0.8 
.IC V(n_bl_202) = 0.8 
.IC V(n_bl_203) = 0.8 
.IC V(n_bl_204) = 0.8 
.IC V(n_bl_205) = 0.8 
.IC V(n_bl_206) = 0.8 
.IC V(n_bl_207) = 0.8 
.IC V(n_bl_208) = 0.8 
.IC V(n_bl_209) = 0.8 
.IC V(n_bl_210) = 0.8 
.IC V(n_bl_211) = 0.8 
.IC V(n_bl_212) = 0.8 
.IC V(n_bl_213) = 0.8 
.IC V(n_bl_214) = 0.8 
.IC V(n_bl_215) = 0.8 
.IC V(n_bl_216) = 0.8 
.IC V(n_bl_217) = 0.8 
.IC V(n_bl_218) = 0.8 
.IC V(n_bl_219) = 0.8 
.IC V(n_bl_220) = 0.8 
.IC V(n_bl_221) = 0.8 
.IC V(n_bl_222) = 0.8 
.IC V(n_bl_223) = 0.8 
.IC V(n_bl_224) = 0.8 
.IC V(n_bl_225) = 0.8 
.IC V(n_bl_226) = 0.8 
.IC V(n_bl_227) = 0.8 
.IC V(n_bl_228) = 0.8 
.IC V(n_bl_229) = 0.8 
.IC V(n_bl_230) = 0.8 
.IC V(n_bl_231) = 0.8 
.IC V(n_bl_232) = 0.8 
.IC V(n_bl_233) = 0.8 
.IC V(n_bl_234) = 0.8 
.IC V(n_bl_235) = 0.8 
.IC V(n_bl_236) = 0.8 
.IC V(n_bl_237) = 0.8 
.IC V(n_bl_238) = 0.8 
.IC V(n_bl_239) = 0.8 
.IC V(n_bl_240) = 0.8 
.IC V(n_bl_241) = 0.8 
.IC V(n_bl_242) = 0.8 
.IC V(n_bl_243) = 0.8 
.IC V(n_bl_244) = 0.8 
.IC V(n_bl_245) = 0.8 
.IC V(n_bl_246) = 0.8 
.IC V(n_bl_247) = 0.8 
.IC V(n_bl_248) = 0.8 
.IC V(n_bl_249) = 0.8 
.IC V(n_bl_250) = 0.8 
.IC V(n_bl_251) = 0.8 
.IC V(n_bl_252) = 0.8 
.IC V(n_bl_253) = 0.8 
.IC V(n_bl_254) = 0.8 
.IC V(n_bl_255) = 0.8 
.IC V(n_bl_256) = 0.8 
.END