.TITLE MTJ write power measurement circuit 

********************************************************************************
** Include libraries, parameters and other
********************************************************************************

.LIB "../includes.l" INCLUDES

********************************************************************************
** Setup and input
********************************************************************************

.control 
 TRAN 1p '4 * ram_frequency'  
OPTIONS BRIEF=1

quit 
 .endc 
 * Input signal 
 Vground ground 0 0 

Vprecharge n_precharge ground PULSE (0.8_lp 0 0 50p 50p 'precharge_max' 'ram_frequency')
Vprechargeb n_precharge_b ground PULSE (0 0.8_lp 0 50p 50p 'precharge_max' 'ram_frequency')
Vdatain n_data_in ground PULSE (0.8_lp 0 0 0 0 'ram_frequency' ' 2 * ram_frequency')
* Power rail for the circuit under test.
* This allows us to measure powersna of a circuit under test without measuring the power of wave shaping and load circuitry.
V_selected vdd_selected ground 0.8_lp

V_selectedh vdd_selectedh ground 0.8_lp

V_negl vnegl ground -0.27

V_negh vnegh ground -0.27

********************************************************************************
** Measurement
********************************************************************************

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current_selected  INTEG I(V_selected) FROM= 0ns TO='4 * ram_frequency'
.MEASURE TRAN meas_avg_power_selected PARAM = '-(meas_current_selected/(4 * ram_frequency)) * 0.8_lp'

.MEASURE TRAN meas_current_selectedn  INTEG I(V_negl) FROM= 0ns TO='4 * ram_frequency'
.MEASURE TRAN meas_avg_power_selectedn PARAM = '-(meas_current_selectedn/(4 * ram_frequency)) * 0.27'

.MEASURE TRAN meas_current_selectedh  INTEG I(V_selectedh) FROM= 0ns TO='4 * ram_frequency'
.MEASURE TRAN meas_avg_power_selectedh PARAM = '-(meas_current_selectedh/(4 * ram_frequency)) * 0.8_lp'

.MEASURE TRAN meas_current_selectedhn  INTEG I(V_negh) FROM= 0ns TO='4 * ram_frequency'
.MEASURE TRAN meas_avg_power_selectedhn PARAM = '-(meas_current_selectedhn/(4 * ram_frequency)) * 0.27'

********************************************************************************
** Circuit
********************************************************************************

Xprechargesa n_1_1 n_hang_1 ground ground n_hang_out vclmpmtj vrefmtj ground ground vdd_lp ground mtj_subcircuits_sa
Xwritedriver n_data_in vdd_lp n_1_1 vnegl vdd_selected ground mtj_subcircuits_writedriver
Xcs n_1_1 n_bl_0 n_precharge_b n_precharge vdd_lp ground mtj_subcircuits_cs
xprecharge_dup n_hang_low n_bl_512 n_precharge_b n_precharge vdd_lp ground mtj_subcircuits_cs
Xwirel0 n_bl_0 n_bl_1 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer0 n_br_0 n_br_1 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj0 ground ground n_bl_1 ground n_br_1 ground vdd_selected ground memorycell
Xwirel1 n_bl_1 n_bl_2 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer1 n_br_1 n_br_2 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj1 ground ground n_bl_2 ground n_br_2 ground vdd_selected ground memorycell
Xwirel2 n_bl_2 n_bl_3 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer2 n_br_2 n_br_3 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj2 ground ground n_bl_3 ground n_br_3 ground vdd_selected ground memorycell
Xwirel3 n_bl_3 n_bl_4 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer3 n_br_3 n_br_4 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj3 ground ground n_bl_4 ground n_br_4 ground vdd_selected ground memorycell
Xwirel4 n_bl_4 n_bl_5 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer4 n_br_4 n_br_5 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj4 ground ground n_bl_5 ground n_br_5 ground vdd_selected ground memorycell
Xwirel5 n_bl_5 n_bl_6 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer5 n_br_5 n_br_6 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj5 ground ground n_bl_6 ground n_br_6 ground vdd_selected ground memorycell
Xwirel6 n_bl_6 n_bl_7 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer6 n_br_6 n_br_7 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj6 ground ground n_bl_7 ground n_br_7 ground vdd_selected ground memorycell
Xwirel7 n_bl_7 n_bl_8 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer7 n_br_7 n_br_8 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj7 ground ground n_bl_8 ground n_br_8 ground vdd_selected ground memorycell
Xwirel8 n_bl_8 n_bl_9 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer8 n_br_8 n_br_9 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj8 ground ground n_bl_9 ground n_br_9 ground vdd_selected ground memorycell
Xwirel9 n_bl_9 n_bl_10 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer9 n_br_9 n_br_10 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj9 ground ground n_bl_10 ground n_br_10 ground vdd_selected ground memorycell
Xwirel10 n_bl_10 n_bl_11 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer10 n_br_10 n_br_11 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj10 ground ground n_bl_11 ground n_br_11 ground vdd_selected ground memorycell
Xwirel11 n_bl_11 n_bl_12 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer11 n_br_11 n_br_12 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj11 ground ground n_bl_12 ground n_br_12 ground vdd_selected ground memorycell
Xwirel12 n_bl_12 n_bl_13 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer12 n_br_12 n_br_13 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj12 ground ground n_bl_13 ground n_br_13 ground vdd_selected ground memorycell
Xwirel13 n_bl_13 n_bl_14 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer13 n_br_13 n_br_14 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj13 ground ground n_bl_14 ground n_br_14 ground vdd_selected ground memorycell
Xwirel14 n_bl_14 n_bl_15 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer14 n_br_14 n_br_15 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj14 ground ground n_bl_15 ground n_br_15 ground vdd_selected ground memorycell
Xwirel15 n_bl_15 n_bl_16 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer15 n_br_15 n_br_16 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj15 ground ground n_bl_16 ground n_br_16 ground vdd_selected ground memorycell
Xwirel16 n_bl_16 n_bl_17 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer16 n_br_16 n_br_17 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj16 ground ground n_bl_17 ground n_br_17 ground vdd_selected ground memorycell
Xwirel17 n_bl_17 n_bl_18 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer17 n_br_17 n_br_18 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj17 ground ground n_bl_18 ground n_br_18 ground vdd_selected ground memorycell
Xwirel18 n_bl_18 n_bl_19 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer18 n_br_18 n_br_19 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj18 ground ground n_bl_19 ground n_br_19 ground vdd_selected ground memorycell
Xwirel19 n_bl_19 n_bl_20 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer19 n_br_19 n_br_20 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj19 ground ground n_bl_20 ground n_br_20 ground vdd_selected ground memorycell
Xwirel20 n_bl_20 n_bl_21 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer20 n_br_20 n_br_21 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj20 ground ground n_bl_21 ground n_br_21 ground vdd_selected ground memorycell
Xwirel21 n_bl_21 n_bl_22 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer21 n_br_21 n_br_22 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj21 ground ground n_bl_22 ground n_br_22 ground vdd_selected ground memorycell
Xwirel22 n_bl_22 n_bl_23 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer22 n_br_22 n_br_23 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj22 ground ground n_bl_23 ground n_br_23 ground vdd_selected ground memorycell
Xwirel23 n_bl_23 n_bl_24 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer23 n_br_23 n_br_24 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj23 ground ground n_bl_24 ground n_br_24 ground vdd_selected ground memorycell
Xwirel24 n_bl_24 n_bl_25 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer24 n_br_24 n_br_25 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj24 ground ground n_bl_25 ground n_br_25 ground vdd_selected ground memorycell
Xwirel25 n_bl_25 n_bl_26 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer25 n_br_25 n_br_26 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj25 ground ground n_bl_26 ground n_br_26 ground vdd_selected ground memorycell
Xwirel26 n_bl_26 n_bl_27 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer26 n_br_26 n_br_27 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj26 ground ground n_bl_27 ground n_br_27 ground vdd_selected ground memorycell
Xwirel27 n_bl_27 n_bl_28 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer27 n_br_27 n_br_28 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj27 ground ground n_bl_28 ground n_br_28 ground vdd_selected ground memorycell
Xwirel28 n_bl_28 n_bl_29 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer28 n_br_28 n_br_29 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj28 ground ground n_bl_29 ground n_br_29 ground vdd_selected ground memorycell
Xwirel29 n_bl_29 n_bl_30 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer29 n_br_29 n_br_30 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj29 ground ground n_bl_30 ground n_br_30 ground vdd_selected ground memorycell
Xwirel30 n_bl_30 n_bl_31 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer30 n_br_30 n_br_31 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj30 ground ground n_bl_31 ground n_br_31 ground vdd_selected ground memorycell
Xwirel31 n_bl_31 n_bl_32 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer31 n_br_31 n_br_32 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj31 ground ground n_bl_32 ground n_br_32 ground vdd_selected ground memorycell
Xwirel32 n_bl_32 n_bl_33 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer32 n_br_32 n_br_33 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj32 ground ground n_bl_33 ground n_br_33 ground vdd_selected ground memorycell
Xwirel33 n_bl_33 n_bl_34 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer33 n_br_33 n_br_34 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj33 ground ground n_bl_34 ground n_br_34 ground vdd_selected ground memorycell
Xwirel34 n_bl_34 n_bl_35 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer34 n_br_34 n_br_35 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj34 ground ground n_bl_35 ground n_br_35 ground vdd_selected ground memorycell
Xwirel35 n_bl_35 n_bl_36 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer35 n_br_35 n_br_36 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj35 ground ground n_bl_36 ground n_br_36 ground vdd_selected ground memorycell
Xwirel36 n_bl_36 n_bl_37 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer36 n_br_36 n_br_37 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj36 ground ground n_bl_37 ground n_br_37 ground vdd_selected ground memorycell
Xwirel37 n_bl_37 n_bl_38 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer37 n_br_37 n_br_38 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj37 ground ground n_bl_38 ground n_br_38 ground vdd_selected ground memorycell
Xwirel38 n_bl_38 n_bl_39 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer38 n_br_38 n_br_39 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj38 ground ground n_bl_39 ground n_br_39 ground vdd_selected ground memorycell
Xwirel39 n_bl_39 n_bl_40 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer39 n_br_39 n_br_40 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj39 ground ground n_bl_40 ground n_br_40 ground vdd_selected ground memorycell
Xwirel40 n_bl_40 n_bl_41 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer40 n_br_40 n_br_41 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj40 ground ground n_bl_41 ground n_br_41 ground vdd_selected ground memorycell
Xwirel41 n_bl_41 n_bl_42 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer41 n_br_41 n_br_42 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj41 ground ground n_bl_42 ground n_br_42 ground vdd_selected ground memorycell
Xwirel42 n_bl_42 n_bl_43 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer42 n_br_42 n_br_43 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj42 ground ground n_bl_43 ground n_br_43 ground vdd_selected ground memorycell
Xwirel43 n_bl_43 n_bl_44 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer43 n_br_43 n_br_44 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj43 ground ground n_bl_44 ground n_br_44 ground vdd_selected ground memorycell
Xwirel44 n_bl_44 n_bl_45 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer44 n_br_44 n_br_45 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj44 ground ground n_bl_45 ground n_br_45 ground vdd_selected ground memorycell
Xwirel45 n_bl_45 n_bl_46 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer45 n_br_45 n_br_46 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj45 ground ground n_bl_46 ground n_br_46 ground vdd_selected ground memorycell
Xwirel46 n_bl_46 n_bl_47 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer46 n_br_46 n_br_47 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj46 ground ground n_bl_47 ground n_br_47 ground vdd_selected ground memorycell
Xwirel47 n_bl_47 n_bl_48 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer47 n_br_47 n_br_48 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj47 ground ground n_bl_48 ground n_br_48 ground vdd_selected ground memorycell
Xwirel48 n_bl_48 n_bl_49 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer48 n_br_48 n_br_49 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj48 ground ground n_bl_49 ground n_br_49 ground vdd_selected ground memorycell
Xwirel49 n_bl_49 n_bl_50 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer49 n_br_49 n_br_50 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj49 ground ground n_bl_50 ground n_br_50 ground vdd_selected ground memorycell
Xwirel50 n_bl_50 n_bl_51 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer50 n_br_50 n_br_51 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj50 ground ground n_bl_51 ground n_br_51 ground vdd_selected ground memorycell
Xwirel51 n_bl_51 n_bl_52 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer51 n_br_51 n_br_52 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj51 ground ground n_bl_52 ground n_br_52 ground vdd_selected ground memorycell
Xwirel52 n_bl_52 n_bl_53 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer52 n_br_52 n_br_53 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj52 ground ground n_bl_53 ground n_br_53 ground vdd_selected ground memorycell
Xwirel53 n_bl_53 n_bl_54 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer53 n_br_53 n_br_54 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj53 ground ground n_bl_54 ground n_br_54 ground vdd_selected ground memorycell
Xwirel54 n_bl_54 n_bl_55 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer54 n_br_54 n_br_55 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj54 ground ground n_bl_55 ground n_br_55 ground vdd_selected ground memorycell
Xwirel55 n_bl_55 n_bl_56 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer55 n_br_55 n_br_56 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj55 ground ground n_bl_56 ground n_br_56 ground vdd_selected ground memorycell
Xwirel56 n_bl_56 n_bl_57 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer56 n_br_56 n_br_57 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj56 ground ground n_bl_57 ground n_br_57 ground vdd_selected ground memorycell
Xwirel57 n_bl_57 n_bl_58 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer57 n_br_57 n_br_58 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj57 ground ground n_bl_58 ground n_br_58 ground vdd_selected ground memorycell
Xwirel58 n_bl_58 n_bl_59 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer58 n_br_58 n_br_59 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj58 ground ground n_bl_59 ground n_br_59 ground vdd_selected ground memorycell
Xwirel59 n_bl_59 n_bl_60 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer59 n_br_59 n_br_60 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj59 ground ground n_bl_60 ground n_br_60 ground vdd_selected ground memorycell
Xwirel60 n_bl_60 n_bl_61 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer60 n_br_60 n_br_61 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj60 ground ground n_bl_61 ground n_br_61 ground vdd_selected ground memorycell
Xwirel61 n_bl_61 n_bl_62 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer61 n_br_61 n_br_62 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj61 ground ground n_bl_62 ground n_br_62 ground vdd_selected ground memorycell
Xwirel62 n_bl_62 n_bl_63 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer62 n_br_62 n_br_63 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj62 ground ground n_bl_63 ground n_br_63 ground vdd_selected ground memorycell
Xwirel63 n_bl_63 n_bl_64 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer63 n_br_63 n_br_64 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj63 ground ground n_bl_64 ground n_br_64 ground vdd_selected ground memorycell
Xwirel64 n_bl_64 n_bl_65 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer64 n_br_64 n_br_65 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj64 ground ground n_bl_65 ground n_br_65 ground vdd_selected ground memorycell
Xwirel65 n_bl_65 n_bl_66 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer65 n_br_65 n_br_66 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj65 ground ground n_bl_66 ground n_br_66 ground vdd_selected ground memorycell
Xwirel66 n_bl_66 n_bl_67 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer66 n_br_66 n_br_67 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj66 ground ground n_bl_67 ground n_br_67 ground vdd_selected ground memorycell
Xwirel67 n_bl_67 n_bl_68 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer67 n_br_67 n_br_68 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj67 ground ground n_bl_68 ground n_br_68 ground vdd_selected ground memorycell
Xwirel68 n_bl_68 n_bl_69 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer68 n_br_68 n_br_69 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj68 ground ground n_bl_69 ground n_br_69 ground vdd_selected ground memorycell
Xwirel69 n_bl_69 n_bl_70 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer69 n_br_69 n_br_70 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj69 ground ground n_bl_70 ground n_br_70 ground vdd_selected ground memorycell
Xwirel70 n_bl_70 n_bl_71 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer70 n_br_70 n_br_71 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj70 ground ground n_bl_71 ground n_br_71 ground vdd_selected ground memorycell
Xwirel71 n_bl_71 n_bl_72 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer71 n_br_71 n_br_72 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj71 ground ground n_bl_72 ground n_br_72 ground vdd_selected ground memorycell
Xwirel72 n_bl_72 n_bl_73 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer72 n_br_72 n_br_73 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj72 ground ground n_bl_73 ground n_br_73 ground vdd_selected ground memorycell
Xwirel73 n_bl_73 n_bl_74 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer73 n_br_73 n_br_74 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj73 ground ground n_bl_74 ground n_br_74 ground vdd_selected ground memorycell
Xwirel74 n_bl_74 n_bl_75 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer74 n_br_74 n_br_75 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj74 ground ground n_bl_75 ground n_br_75 ground vdd_selected ground memorycell
Xwirel75 n_bl_75 n_bl_76 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer75 n_br_75 n_br_76 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj75 ground ground n_bl_76 ground n_br_76 ground vdd_selected ground memorycell
Xwirel76 n_bl_76 n_bl_77 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer76 n_br_76 n_br_77 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj76 ground ground n_bl_77 ground n_br_77 ground vdd_selected ground memorycell
Xwirel77 n_bl_77 n_bl_78 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer77 n_br_77 n_br_78 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj77 ground ground n_bl_78 ground n_br_78 ground vdd_selected ground memorycell
Xwirel78 n_bl_78 n_bl_79 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer78 n_br_78 n_br_79 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj78 ground ground n_bl_79 ground n_br_79 ground vdd_selected ground memorycell
Xwirel79 n_bl_79 n_bl_80 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer79 n_br_79 n_br_80 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj79 ground ground n_bl_80 ground n_br_80 ground vdd_selected ground memorycell
Xwirel80 n_bl_80 n_bl_81 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer80 n_br_80 n_br_81 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj80 ground ground n_bl_81 ground n_br_81 ground vdd_selected ground memorycell
Xwirel81 n_bl_81 n_bl_82 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer81 n_br_81 n_br_82 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj81 ground ground n_bl_82 ground n_br_82 ground vdd_selected ground memorycell
Xwirel82 n_bl_82 n_bl_83 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer82 n_br_82 n_br_83 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj82 ground ground n_bl_83 ground n_br_83 ground vdd_selected ground memorycell
Xwirel83 n_bl_83 n_bl_84 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer83 n_br_83 n_br_84 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj83 ground ground n_bl_84 ground n_br_84 ground vdd_selected ground memorycell
Xwirel84 n_bl_84 n_bl_85 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer84 n_br_84 n_br_85 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj84 ground ground n_bl_85 ground n_br_85 ground vdd_selected ground memorycell
Xwirel85 n_bl_85 n_bl_86 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer85 n_br_85 n_br_86 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj85 ground ground n_bl_86 ground n_br_86 ground vdd_selected ground memorycell
Xwirel86 n_bl_86 n_bl_87 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer86 n_br_86 n_br_87 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj86 ground ground n_bl_87 ground n_br_87 ground vdd_selected ground memorycell
Xwirel87 n_bl_87 n_bl_88 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer87 n_br_87 n_br_88 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj87 ground ground n_bl_88 ground n_br_88 ground vdd_selected ground memorycell
Xwirel88 n_bl_88 n_bl_89 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer88 n_br_88 n_br_89 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj88 ground ground n_bl_89 ground n_br_89 ground vdd_selected ground memorycell
Xwirel89 n_bl_89 n_bl_90 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer89 n_br_89 n_br_90 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj89 ground ground n_bl_90 ground n_br_90 ground vdd_selected ground memorycell
Xwirel90 n_bl_90 n_bl_91 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer90 n_br_90 n_br_91 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj90 ground ground n_bl_91 ground n_br_91 ground vdd_selected ground memorycell
Xwirel91 n_bl_91 n_bl_92 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer91 n_br_91 n_br_92 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj91 ground ground n_bl_92 ground n_br_92 ground vdd_selected ground memorycell
Xwirel92 n_bl_92 n_bl_93 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer92 n_br_92 n_br_93 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj92 ground ground n_bl_93 ground n_br_93 ground vdd_selected ground memorycell
Xwirel93 n_bl_93 n_bl_94 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer93 n_br_93 n_br_94 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj93 ground ground n_bl_94 ground n_br_94 ground vdd_selected ground memorycell
Xwirel94 n_bl_94 n_bl_95 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer94 n_br_94 n_br_95 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj94 ground ground n_bl_95 ground n_br_95 ground vdd_selected ground memorycell
Xwirel95 n_bl_95 n_bl_96 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer95 n_br_95 n_br_96 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj95 ground ground n_bl_96 ground n_br_96 ground vdd_selected ground memorycell
Xwirel96 n_bl_96 n_bl_97 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer96 n_br_96 n_br_97 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj96 ground ground n_bl_97 ground n_br_97 ground vdd_selected ground memorycell
Xwirel97 n_bl_97 n_bl_98 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer97 n_br_97 n_br_98 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj97 ground ground n_bl_98 ground n_br_98 ground vdd_selected ground memorycell
Xwirel98 n_bl_98 n_bl_99 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer98 n_br_98 n_br_99 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj98 ground ground n_bl_99 ground n_br_99 ground vdd_selected ground memorycell
Xwirel99 n_bl_99 n_bl_100 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer99 n_br_99 n_br_100 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj99 ground ground n_bl_100 ground n_br_100 ground vdd_selected ground memorycell
Xwirel100 n_bl_100 n_bl_101 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer100 n_br_100 n_br_101 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj100 ground ground n_bl_101 ground n_br_101 ground vdd_selected ground memorycell
Xwirel101 n_bl_101 n_bl_102 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer101 n_br_101 n_br_102 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj101 ground ground n_bl_102 ground n_br_102 ground vdd_selected ground memorycell
Xwirel102 n_bl_102 n_bl_103 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer102 n_br_102 n_br_103 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj102 ground ground n_bl_103 ground n_br_103 ground vdd_selected ground memorycell
Xwirel103 n_bl_103 n_bl_104 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer103 n_br_103 n_br_104 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj103 ground ground n_bl_104 ground n_br_104 ground vdd_selected ground memorycell
Xwirel104 n_bl_104 n_bl_105 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer104 n_br_104 n_br_105 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj104 ground ground n_bl_105 ground n_br_105 ground vdd_selected ground memorycell
Xwirel105 n_bl_105 n_bl_106 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer105 n_br_105 n_br_106 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj105 ground ground n_bl_106 ground n_br_106 ground vdd_selected ground memorycell
Xwirel106 n_bl_106 n_bl_107 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer106 n_br_106 n_br_107 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj106 ground ground n_bl_107 ground n_br_107 ground vdd_selected ground memorycell
Xwirel107 n_bl_107 n_bl_108 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer107 n_br_107 n_br_108 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj107 ground ground n_bl_108 ground n_br_108 ground vdd_selected ground memorycell
Xwirel108 n_bl_108 n_bl_109 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer108 n_br_108 n_br_109 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj108 ground ground n_bl_109 ground n_br_109 ground vdd_selected ground memorycell
Xwirel109 n_bl_109 n_bl_110 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer109 n_br_109 n_br_110 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj109 ground ground n_bl_110 ground n_br_110 ground vdd_selected ground memorycell
Xwirel110 n_bl_110 n_bl_111 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer110 n_br_110 n_br_111 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj110 ground ground n_bl_111 ground n_br_111 ground vdd_selected ground memorycell
Xwirel111 n_bl_111 n_bl_112 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer111 n_br_111 n_br_112 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj111 ground ground n_bl_112 ground n_br_112 ground vdd_selected ground memorycell
Xwirel112 n_bl_112 n_bl_113 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer112 n_br_112 n_br_113 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj112 ground ground n_bl_113 ground n_br_113 ground vdd_selected ground memorycell
Xwirel113 n_bl_113 n_bl_114 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer113 n_br_113 n_br_114 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj113 ground ground n_bl_114 ground n_br_114 ground vdd_selected ground memorycell
Xwirel114 n_bl_114 n_bl_115 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer114 n_br_114 n_br_115 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj114 ground ground n_bl_115 ground n_br_115 ground vdd_selected ground memorycell
Xwirel115 n_bl_115 n_bl_116 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer115 n_br_115 n_br_116 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj115 ground ground n_bl_116 ground n_br_116 ground vdd_selected ground memorycell
Xwirel116 n_bl_116 n_bl_117 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer116 n_br_116 n_br_117 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj116 ground ground n_bl_117 ground n_br_117 ground vdd_selected ground memorycell
Xwirel117 n_bl_117 n_bl_118 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer117 n_br_117 n_br_118 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj117 ground ground n_bl_118 ground n_br_118 ground vdd_selected ground memorycell
Xwirel118 n_bl_118 n_bl_119 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer118 n_br_118 n_br_119 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj118 ground ground n_bl_119 ground n_br_119 ground vdd_selected ground memorycell
Xwirel119 n_bl_119 n_bl_120 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer119 n_br_119 n_br_120 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj119 ground ground n_bl_120 ground n_br_120 ground vdd_selected ground memorycell
Xwirel120 n_bl_120 n_bl_121 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer120 n_br_120 n_br_121 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj120 ground ground n_bl_121 ground n_br_121 ground vdd_selected ground memorycell
Xwirel121 n_bl_121 n_bl_122 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer121 n_br_121 n_br_122 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj121 ground ground n_bl_122 ground n_br_122 ground vdd_selected ground memorycell
Xwirel122 n_bl_122 n_bl_123 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer122 n_br_122 n_br_123 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj122 ground ground n_bl_123 ground n_br_123 ground vdd_selected ground memorycell
Xwirel123 n_bl_123 n_bl_124 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer123 n_br_123 n_br_124 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj123 ground ground n_bl_124 ground n_br_124 ground vdd_selected ground memorycell
Xwirel124 n_bl_124 n_bl_125 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer124 n_br_124 n_br_125 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj124 ground ground n_bl_125 ground n_br_125 ground vdd_selected ground memorycell
Xwirel125 n_bl_125 n_bl_126 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer125 n_br_125 n_br_126 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj125 ground ground n_bl_126 ground n_br_126 ground vdd_selected ground memorycell
Xwirel126 n_bl_126 n_bl_127 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer126 n_br_126 n_br_127 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj126 ground ground n_bl_127 ground n_br_127 ground vdd_selected ground memorycell
Xwirel127 n_bl_127 n_bl_128 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer127 n_br_127 n_br_128 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj127 ground ground n_bl_128 ground n_br_128 ground vdd_selected ground memorycell
Xwirel128 n_bl_128 n_bl_129 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer128 n_br_128 n_br_129 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj128 ground ground n_bl_129 ground n_br_129 ground vdd_selected ground memorycell
Xwirel129 n_bl_129 n_bl_130 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer129 n_br_129 n_br_130 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj129 ground ground n_bl_130 ground n_br_130 ground vdd_selected ground memorycell
Xwirel130 n_bl_130 n_bl_131 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer130 n_br_130 n_br_131 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj130 ground ground n_bl_131 ground n_br_131 ground vdd_selected ground memorycell
Xwirel131 n_bl_131 n_bl_132 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer131 n_br_131 n_br_132 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj131 ground ground n_bl_132 ground n_br_132 ground vdd_selected ground memorycell
Xwirel132 n_bl_132 n_bl_133 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer132 n_br_132 n_br_133 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj132 ground ground n_bl_133 ground n_br_133 ground vdd_selected ground memorycell
Xwirel133 n_bl_133 n_bl_134 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer133 n_br_133 n_br_134 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj133 ground ground n_bl_134 ground n_br_134 ground vdd_selected ground memorycell
Xwirel134 n_bl_134 n_bl_135 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer134 n_br_134 n_br_135 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj134 ground ground n_bl_135 ground n_br_135 ground vdd_selected ground memorycell
Xwirel135 n_bl_135 n_bl_136 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer135 n_br_135 n_br_136 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj135 ground ground n_bl_136 ground n_br_136 ground vdd_selected ground memorycell
Xwirel136 n_bl_136 n_bl_137 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer136 n_br_136 n_br_137 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj136 ground ground n_bl_137 ground n_br_137 ground vdd_selected ground memorycell
Xwirel137 n_bl_137 n_bl_138 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer137 n_br_137 n_br_138 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj137 ground ground n_bl_138 ground n_br_138 ground vdd_selected ground memorycell
Xwirel138 n_bl_138 n_bl_139 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer138 n_br_138 n_br_139 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj138 ground ground n_bl_139 ground n_br_139 ground vdd_selected ground memorycell
Xwirel139 n_bl_139 n_bl_140 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer139 n_br_139 n_br_140 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj139 ground ground n_bl_140 ground n_br_140 ground vdd_selected ground memorycell
Xwirel140 n_bl_140 n_bl_141 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer140 n_br_140 n_br_141 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj140 ground ground n_bl_141 ground n_br_141 ground vdd_selected ground memorycell
Xwirel141 n_bl_141 n_bl_142 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer141 n_br_141 n_br_142 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj141 ground ground n_bl_142 ground n_br_142 ground vdd_selected ground memorycell
Xwirel142 n_bl_142 n_bl_143 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer142 n_br_142 n_br_143 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj142 ground ground n_bl_143 ground n_br_143 ground vdd_selected ground memorycell
Xwirel143 n_bl_143 n_bl_144 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer143 n_br_143 n_br_144 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj143 ground ground n_bl_144 ground n_br_144 ground vdd_selected ground memorycell
Xwirel144 n_bl_144 n_bl_145 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer144 n_br_144 n_br_145 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj144 ground ground n_bl_145 ground n_br_145 ground vdd_selected ground memorycell
Xwirel145 n_bl_145 n_bl_146 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer145 n_br_145 n_br_146 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj145 ground ground n_bl_146 ground n_br_146 ground vdd_selected ground memorycell
Xwirel146 n_bl_146 n_bl_147 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer146 n_br_146 n_br_147 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj146 ground ground n_bl_147 ground n_br_147 ground vdd_selected ground memorycell
Xwirel147 n_bl_147 n_bl_148 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer147 n_br_147 n_br_148 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj147 ground ground n_bl_148 ground n_br_148 ground vdd_selected ground memorycell
Xwirel148 n_bl_148 n_bl_149 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer148 n_br_148 n_br_149 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj148 ground ground n_bl_149 ground n_br_149 ground vdd_selected ground memorycell
Xwirel149 n_bl_149 n_bl_150 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer149 n_br_149 n_br_150 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj149 ground ground n_bl_150 ground n_br_150 ground vdd_selected ground memorycell
Xwirel150 n_bl_150 n_bl_151 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer150 n_br_150 n_br_151 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj150 ground ground n_bl_151 ground n_br_151 ground vdd_selected ground memorycell
Xwirel151 n_bl_151 n_bl_152 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer151 n_br_151 n_br_152 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj151 ground ground n_bl_152 ground n_br_152 ground vdd_selected ground memorycell
Xwirel152 n_bl_152 n_bl_153 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer152 n_br_152 n_br_153 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj152 ground ground n_bl_153 ground n_br_153 ground vdd_selected ground memorycell
Xwirel153 n_bl_153 n_bl_154 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer153 n_br_153 n_br_154 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj153 ground ground n_bl_154 ground n_br_154 ground vdd_selected ground memorycell
Xwirel154 n_bl_154 n_bl_155 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer154 n_br_154 n_br_155 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj154 ground ground n_bl_155 ground n_br_155 ground vdd_selected ground memorycell
Xwirel155 n_bl_155 n_bl_156 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer155 n_br_155 n_br_156 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj155 ground ground n_bl_156 ground n_br_156 ground vdd_selected ground memorycell
Xwirel156 n_bl_156 n_bl_157 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer156 n_br_156 n_br_157 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj156 ground ground n_bl_157 ground n_br_157 ground vdd_selected ground memorycell
Xwirel157 n_bl_157 n_bl_158 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer157 n_br_157 n_br_158 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj157 ground ground n_bl_158 ground n_br_158 ground vdd_selected ground memorycell
Xwirel158 n_bl_158 n_bl_159 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer158 n_br_158 n_br_159 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj158 ground ground n_bl_159 ground n_br_159 ground vdd_selected ground memorycell
Xwirel159 n_bl_159 n_bl_160 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer159 n_br_159 n_br_160 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj159 ground ground n_bl_160 ground n_br_160 ground vdd_selected ground memorycell
Xwirel160 n_bl_160 n_bl_161 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer160 n_br_160 n_br_161 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj160 ground ground n_bl_161 ground n_br_161 ground vdd_selected ground memorycell
Xwirel161 n_bl_161 n_bl_162 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer161 n_br_161 n_br_162 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj161 ground ground n_bl_162 ground n_br_162 ground vdd_selected ground memorycell
Xwirel162 n_bl_162 n_bl_163 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer162 n_br_162 n_br_163 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj162 ground ground n_bl_163 ground n_br_163 ground vdd_selected ground memorycell
Xwirel163 n_bl_163 n_bl_164 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer163 n_br_163 n_br_164 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj163 ground ground n_bl_164 ground n_br_164 ground vdd_selected ground memorycell
Xwirel164 n_bl_164 n_bl_165 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer164 n_br_164 n_br_165 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj164 ground ground n_bl_165 ground n_br_165 ground vdd_selected ground memorycell
Xwirel165 n_bl_165 n_bl_166 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer165 n_br_165 n_br_166 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj165 ground ground n_bl_166 ground n_br_166 ground vdd_selected ground memorycell
Xwirel166 n_bl_166 n_bl_167 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer166 n_br_166 n_br_167 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj166 ground ground n_bl_167 ground n_br_167 ground vdd_selected ground memorycell
Xwirel167 n_bl_167 n_bl_168 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer167 n_br_167 n_br_168 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj167 ground ground n_bl_168 ground n_br_168 ground vdd_selected ground memorycell
Xwirel168 n_bl_168 n_bl_169 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer168 n_br_168 n_br_169 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj168 ground ground n_bl_169 ground n_br_169 ground vdd_selected ground memorycell
Xwirel169 n_bl_169 n_bl_170 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer169 n_br_169 n_br_170 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj169 ground ground n_bl_170 ground n_br_170 ground vdd_selected ground memorycell
Xwirel170 n_bl_170 n_bl_171 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer170 n_br_170 n_br_171 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj170 ground ground n_bl_171 ground n_br_171 ground vdd_selected ground memorycell
Xwirel171 n_bl_171 n_bl_172 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer171 n_br_171 n_br_172 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj171 ground ground n_bl_172 ground n_br_172 ground vdd_selected ground memorycell
Xwirel172 n_bl_172 n_bl_173 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer172 n_br_172 n_br_173 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj172 ground ground n_bl_173 ground n_br_173 ground vdd_selected ground memorycell
Xwirel173 n_bl_173 n_bl_174 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer173 n_br_173 n_br_174 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj173 ground ground n_bl_174 ground n_br_174 ground vdd_selected ground memorycell
Xwirel174 n_bl_174 n_bl_175 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer174 n_br_174 n_br_175 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj174 ground ground n_bl_175 ground n_br_175 ground vdd_selected ground memorycell
Xwirel175 n_bl_175 n_bl_176 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer175 n_br_175 n_br_176 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj175 ground ground n_bl_176 ground n_br_176 ground vdd_selected ground memorycell
Xwirel176 n_bl_176 n_bl_177 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer176 n_br_176 n_br_177 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj176 ground ground n_bl_177 ground n_br_177 ground vdd_selected ground memorycell
Xwirel177 n_bl_177 n_bl_178 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer177 n_br_177 n_br_178 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj177 ground ground n_bl_178 ground n_br_178 ground vdd_selected ground memorycell
Xwirel178 n_bl_178 n_bl_179 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer178 n_br_178 n_br_179 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj178 ground ground n_bl_179 ground n_br_179 ground vdd_selected ground memorycell
Xwirel179 n_bl_179 n_bl_180 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer179 n_br_179 n_br_180 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj179 ground ground n_bl_180 ground n_br_180 ground vdd_selected ground memorycell
Xwirel180 n_bl_180 n_bl_181 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer180 n_br_180 n_br_181 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj180 ground ground n_bl_181 ground n_br_181 ground vdd_selected ground memorycell
Xwirel181 n_bl_181 n_bl_182 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer181 n_br_181 n_br_182 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj181 ground ground n_bl_182 ground n_br_182 ground vdd_selected ground memorycell
Xwirel182 n_bl_182 n_bl_183 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer182 n_br_182 n_br_183 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj182 ground ground n_bl_183 ground n_br_183 ground vdd_selected ground memorycell
Xwirel183 n_bl_183 n_bl_184 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer183 n_br_183 n_br_184 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj183 ground ground n_bl_184 ground n_br_184 ground vdd_selected ground memorycell
Xwirel184 n_bl_184 n_bl_185 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer184 n_br_184 n_br_185 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj184 ground ground n_bl_185 ground n_br_185 ground vdd_selected ground memorycell
Xwirel185 n_bl_185 n_bl_186 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer185 n_br_185 n_br_186 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj185 ground ground n_bl_186 ground n_br_186 ground vdd_selected ground memorycell
Xwirel186 n_bl_186 n_bl_187 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer186 n_br_186 n_br_187 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj186 ground ground n_bl_187 ground n_br_187 ground vdd_selected ground memorycell
Xwirel187 n_bl_187 n_bl_188 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer187 n_br_187 n_br_188 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj187 ground ground n_bl_188 ground n_br_188 ground vdd_selected ground memorycell
Xwirel188 n_bl_188 n_bl_189 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer188 n_br_188 n_br_189 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj188 ground ground n_bl_189 ground n_br_189 ground vdd_selected ground memorycell
Xwirel189 n_bl_189 n_bl_190 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer189 n_br_189 n_br_190 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj189 ground ground n_bl_190 ground n_br_190 ground vdd_selected ground memorycell
Xwirel190 n_bl_190 n_bl_191 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer190 n_br_190 n_br_191 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj190 ground ground n_bl_191 ground n_br_191 ground vdd_selected ground memorycell
Xwirel191 n_bl_191 n_bl_192 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer191 n_br_191 n_br_192 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj191 ground ground n_bl_192 ground n_br_192 ground vdd_selected ground memorycell
Xwirel192 n_bl_192 n_bl_193 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer192 n_br_192 n_br_193 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj192 ground ground n_bl_193 ground n_br_193 ground vdd_selected ground memorycell
Xwirel193 n_bl_193 n_bl_194 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer193 n_br_193 n_br_194 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj193 ground ground n_bl_194 ground n_br_194 ground vdd_selected ground memorycell
Xwirel194 n_bl_194 n_bl_195 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer194 n_br_194 n_br_195 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj194 ground ground n_bl_195 ground n_br_195 ground vdd_selected ground memorycell
Xwirel195 n_bl_195 n_bl_196 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer195 n_br_195 n_br_196 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj195 ground ground n_bl_196 ground n_br_196 ground vdd_selected ground memorycell
Xwirel196 n_bl_196 n_bl_197 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer196 n_br_196 n_br_197 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj196 ground ground n_bl_197 ground n_br_197 ground vdd_selected ground memorycell
Xwirel197 n_bl_197 n_bl_198 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer197 n_br_197 n_br_198 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj197 ground ground n_bl_198 ground n_br_198 ground vdd_selected ground memorycell
Xwirel198 n_bl_198 n_bl_199 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer198 n_br_198 n_br_199 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj198 ground ground n_bl_199 ground n_br_199 ground vdd_selected ground memorycell
Xwirel199 n_bl_199 n_bl_200 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer199 n_br_199 n_br_200 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj199 ground ground n_bl_200 ground n_br_200 ground vdd_selected ground memorycell
Xwirel200 n_bl_200 n_bl_201 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer200 n_br_200 n_br_201 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj200 ground ground n_bl_201 ground n_br_201 ground vdd_selected ground memorycell
Xwirel201 n_bl_201 n_bl_202 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer201 n_br_201 n_br_202 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj201 ground ground n_bl_202 ground n_br_202 ground vdd_selected ground memorycell
Xwirel202 n_bl_202 n_bl_203 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer202 n_br_202 n_br_203 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj202 ground ground n_bl_203 ground n_br_203 ground vdd_selected ground memorycell
Xwirel203 n_bl_203 n_bl_204 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer203 n_br_203 n_br_204 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj203 ground ground n_bl_204 ground n_br_204 ground vdd_selected ground memorycell
Xwirel204 n_bl_204 n_bl_205 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer204 n_br_204 n_br_205 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj204 ground ground n_bl_205 ground n_br_205 ground vdd_selected ground memorycell
Xwirel205 n_bl_205 n_bl_206 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer205 n_br_205 n_br_206 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj205 ground ground n_bl_206 ground n_br_206 ground vdd_selected ground memorycell
Xwirel206 n_bl_206 n_bl_207 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer206 n_br_206 n_br_207 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj206 ground ground n_bl_207 ground n_br_207 ground vdd_selected ground memorycell
Xwirel207 n_bl_207 n_bl_208 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer207 n_br_207 n_br_208 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj207 ground ground n_bl_208 ground n_br_208 ground vdd_selected ground memorycell
Xwirel208 n_bl_208 n_bl_209 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer208 n_br_208 n_br_209 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj208 ground ground n_bl_209 ground n_br_209 ground vdd_selected ground memorycell
Xwirel209 n_bl_209 n_bl_210 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer209 n_br_209 n_br_210 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj209 ground ground n_bl_210 ground n_br_210 ground vdd_selected ground memorycell
Xwirel210 n_bl_210 n_bl_211 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer210 n_br_210 n_br_211 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj210 ground ground n_bl_211 ground n_br_211 ground vdd_selected ground memorycell
Xwirel211 n_bl_211 n_bl_212 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer211 n_br_211 n_br_212 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj211 ground ground n_bl_212 ground n_br_212 ground vdd_selected ground memorycell
Xwirel212 n_bl_212 n_bl_213 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer212 n_br_212 n_br_213 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj212 ground ground n_bl_213 ground n_br_213 ground vdd_selected ground memorycell
Xwirel213 n_bl_213 n_bl_214 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer213 n_br_213 n_br_214 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj213 ground ground n_bl_214 ground n_br_214 ground vdd_selected ground memorycell
Xwirel214 n_bl_214 n_bl_215 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer214 n_br_214 n_br_215 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj214 ground ground n_bl_215 ground n_br_215 ground vdd_selected ground memorycell
Xwirel215 n_bl_215 n_bl_216 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer215 n_br_215 n_br_216 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj215 ground ground n_bl_216 ground n_br_216 ground vdd_selected ground memorycell
Xwirel216 n_bl_216 n_bl_217 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer216 n_br_216 n_br_217 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj216 ground ground n_bl_217 ground n_br_217 ground vdd_selected ground memorycell
Xwirel217 n_bl_217 n_bl_218 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer217 n_br_217 n_br_218 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj217 ground ground n_bl_218 ground n_br_218 ground vdd_selected ground memorycell
Xwirel218 n_bl_218 n_bl_219 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer218 n_br_218 n_br_219 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj218 ground ground n_bl_219 ground n_br_219 ground vdd_selected ground memorycell
Xwirel219 n_bl_219 n_bl_220 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer219 n_br_219 n_br_220 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj219 ground ground n_bl_220 ground n_br_220 ground vdd_selected ground memorycell
Xwirel220 n_bl_220 n_bl_221 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer220 n_br_220 n_br_221 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj220 ground ground n_bl_221 ground n_br_221 ground vdd_selected ground memorycell
Xwirel221 n_bl_221 n_bl_222 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer221 n_br_221 n_br_222 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj221 ground ground n_bl_222 ground n_br_222 ground vdd_selected ground memorycell
Xwirel222 n_bl_222 n_bl_223 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer222 n_br_222 n_br_223 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj222 ground ground n_bl_223 ground n_br_223 ground vdd_selected ground memorycell
Xwirel223 n_bl_223 n_bl_224 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer223 n_br_223 n_br_224 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj223 ground ground n_bl_224 ground n_br_224 ground vdd_selected ground memorycell
Xwirel224 n_bl_224 n_bl_225 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer224 n_br_224 n_br_225 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj224 ground ground n_bl_225 ground n_br_225 ground vdd_selected ground memorycell
Xwirel225 n_bl_225 n_bl_226 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer225 n_br_225 n_br_226 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj225 ground ground n_bl_226 ground n_br_226 ground vdd_selected ground memorycell
Xwirel226 n_bl_226 n_bl_227 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer226 n_br_226 n_br_227 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj226 ground ground n_bl_227 ground n_br_227 ground vdd_selected ground memorycell
Xwirel227 n_bl_227 n_bl_228 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer227 n_br_227 n_br_228 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj227 ground ground n_bl_228 ground n_br_228 ground vdd_selected ground memorycell
Xwirel228 n_bl_228 n_bl_229 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer228 n_br_228 n_br_229 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj228 ground ground n_bl_229 ground n_br_229 ground vdd_selected ground memorycell
Xwirel229 n_bl_229 n_bl_230 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer229 n_br_229 n_br_230 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj229 ground ground n_bl_230 ground n_br_230 ground vdd_selected ground memorycell
Xwirel230 n_bl_230 n_bl_231 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer230 n_br_230 n_br_231 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj230 ground ground n_bl_231 ground n_br_231 ground vdd_selected ground memorycell
Xwirel231 n_bl_231 n_bl_232 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer231 n_br_231 n_br_232 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj231 ground ground n_bl_232 ground n_br_232 ground vdd_selected ground memorycell
Xwirel232 n_bl_232 n_bl_233 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer232 n_br_232 n_br_233 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj232 ground ground n_bl_233 ground n_br_233 ground vdd_selected ground memorycell
Xwirel233 n_bl_233 n_bl_234 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer233 n_br_233 n_br_234 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj233 ground ground n_bl_234 ground n_br_234 ground vdd_selected ground memorycell
Xwirel234 n_bl_234 n_bl_235 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer234 n_br_234 n_br_235 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj234 ground ground n_bl_235 ground n_br_235 ground vdd_selected ground memorycell
Xwirel235 n_bl_235 n_bl_236 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer235 n_br_235 n_br_236 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj235 ground ground n_bl_236 ground n_br_236 ground vdd_selected ground memorycell
Xwirel236 n_bl_236 n_bl_237 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer236 n_br_236 n_br_237 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj236 ground ground n_bl_237 ground n_br_237 ground vdd_selected ground memorycell
Xwirel237 n_bl_237 n_bl_238 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer237 n_br_237 n_br_238 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj237 ground ground n_bl_238 ground n_br_238 ground vdd_selected ground memorycell
Xwirel238 n_bl_238 n_bl_239 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer238 n_br_238 n_br_239 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj238 ground ground n_bl_239 ground n_br_239 ground vdd_selected ground memorycell
Xwirel239 n_bl_239 n_bl_240 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer239 n_br_239 n_br_240 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj239 ground ground n_bl_240 ground n_br_240 ground vdd_selected ground memorycell
Xwirel240 n_bl_240 n_bl_241 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer240 n_br_240 n_br_241 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj240 ground ground n_bl_241 ground n_br_241 ground vdd_selected ground memorycell
Xwirel241 n_bl_241 n_bl_242 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer241 n_br_241 n_br_242 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj241 ground ground n_bl_242 ground n_br_242 ground vdd_selected ground memorycell
Xwirel242 n_bl_242 n_bl_243 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer242 n_br_242 n_br_243 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj242 ground ground n_bl_243 ground n_br_243 ground vdd_selected ground memorycell
Xwirel243 n_bl_243 n_bl_244 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer243 n_br_243 n_br_244 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj243 ground ground n_bl_244 ground n_br_244 ground vdd_selected ground memorycell
Xwirel244 n_bl_244 n_bl_245 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer244 n_br_244 n_br_245 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj244 ground ground n_bl_245 ground n_br_245 ground vdd_selected ground memorycell
Xwirel245 n_bl_245 n_bl_246 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer245 n_br_245 n_br_246 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj245 ground ground n_bl_246 ground n_br_246 ground vdd_selected ground memorycell
Xwirel246 n_bl_246 n_bl_247 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer246 n_br_246 n_br_247 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj246 ground ground n_bl_247 ground n_br_247 ground vdd_selected ground memorycell
Xwirel247 n_bl_247 n_bl_248 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer247 n_br_247 n_br_248 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj247 ground ground n_bl_248 ground n_br_248 ground vdd_selected ground memorycell
Xwirel248 n_bl_248 n_bl_249 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer248 n_br_248 n_br_249 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj248 ground ground n_bl_249 ground n_br_249 ground vdd_selected ground memorycell
Xwirel249 n_bl_249 n_bl_250 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer249 n_br_249 n_br_250 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj249 ground ground n_bl_250 ground n_br_250 ground vdd_selected ground memorycell
Xwirel250 n_bl_250 n_bl_251 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer250 n_br_250 n_br_251 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj250 ground ground n_bl_251 ground n_br_251 ground vdd_selected ground memorycell
Xwirel251 n_bl_251 n_bl_252 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer251 n_br_251 n_br_252 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj251 ground ground n_bl_252 ground n_br_252 ground vdd_selected ground memorycell
Xwirel252 n_bl_252 n_bl_253 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer252 n_br_252 n_br_253 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj252 ground ground n_bl_253 ground n_br_253 ground vdd_selected ground memorycell
Xwirel253 n_bl_253 n_bl_254 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer253 n_br_253 n_br_254 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj253 ground ground n_bl_254 ground n_br_254 ground vdd_selected ground memorycell
Xwirel254 n_bl_254 n_bl_255 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer254 n_br_254 n_br_255 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj254 ground ground n_bl_255 ground n_br_255 ground vdd_selected ground memorycell
Xwirel255 n_bl_255 n_bl_256 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer255 n_br_255 n_br_256 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj255 ground ground n_bl_256 ground n_br_256 ground vdd_selected ground memorycell
Xwirel256 n_bl_256 n_bl_257 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer256 n_br_256 n_br_257 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj256 ground ground n_bl_257 ground n_br_257 ground vdd_selected ground memorycell
Xwirel257 n_bl_257 n_bl_258 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer257 n_br_257 n_br_258 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj257 ground ground n_bl_258 ground n_br_258 ground vdd_selected ground memorycell
Xwirel258 n_bl_258 n_bl_259 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer258 n_br_258 n_br_259 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj258 ground ground n_bl_259 ground n_br_259 ground vdd_selected ground memorycell
Xwirel259 n_bl_259 n_bl_260 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer259 n_br_259 n_br_260 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj259 ground ground n_bl_260 ground n_br_260 ground vdd_selected ground memorycell
Xwirel260 n_bl_260 n_bl_261 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer260 n_br_260 n_br_261 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj260 ground ground n_bl_261 ground n_br_261 ground vdd_selected ground memorycell
Xwirel261 n_bl_261 n_bl_262 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer261 n_br_261 n_br_262 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj261 ground ground n_bl_262 ground n_br_262 ground vdd_selected ground memorycell
Xwirel262 n_bl_262 n_bl_263 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer262 n_br_262 n_br_263 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj262 ground ground n_bl_263 ground n_br_263 ground vdd_selected ground memorycell
Xwirel263 n_bl_263 n_bl_264 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer263 n_br_263 n_br_264 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj263 ground ground n_bl_264 ground n_br_264 ground vdd_selected ground memorycell
Xwirel264 n_bl_264 n_bl_265 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer264 n_br_264 n_br_265 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj264 ground ground n_bl_265 ground n_br_265 ground vdd_selected ground memorycell
Xwirel265 n_bl_265 n_bl_266 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer265 n_br_265 n_br_266 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj265 ground ground n_bl_266 ground n_br_266 ground vdd_selected ground memorycell
Xwirel266 n_bl_266 n_bl_267 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer266 n_br_266 n_br_267 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj266 ground ground n_bl_267 ground n_br_267 ground vdd_selected ground memorycell
Xwirel267 n_bl_267 n_bl_268 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer267 n_br_267 n_br_268 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj267 ground ground n_bl_268 ground n_br_268 ground vdd_selected ground memorycell
Xwirel268 n_bl_268 n_bl_269 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer268 n_br_268 n_br_269 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj268 ground ground n_bl_269 ground n_br_269 ground vdd_selected ground memorycell
Xwirel269 n_bl_269 n_bl_270 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer269 n_br_269 n_br_270 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj269 ground ground n_bl_270 ground n_br_270 ground vdd_selected ground memorycell
Xwirel270 n_bl_270 n_bl_271 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer270 n_br_270 n_br_271 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj270 ground ground n_bl_271 ground n_br_271 ground vdd_selected ground memorycell
Xwirel271 n_bl_271 n_bl_272 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer271 n_br_271 n_br_272 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj271 ground ground n_bl_272 ground n_br_272 ground vdd_selected ground memorycell
Xwirel272 n_bl_272 n_bl_273 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer272 n_br_272 n_br_273 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj272 ground ground n_bl_273 ground n_br_273 ground vdd_selected ground memorycell
Xwirel273 n_bl_273 n_bl_274 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer273 n_br_273 n_br_274 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj273 ground ground n_bl_274 ground n_br_274 ground vdd_selected ground memorycell
Xwirel274 n_bl_274 n_bl_275 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer274 n_br_274 n_br_275 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj274 ground ground n_bl_275 ground n_br_275 ground vdd_selected ground memorycell
Xwirel275 n_bl_275 n_bl_276 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer275 n_br_275 n_br_276 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj275 ground ground n_bl_276 ground n_br_276 ground vdd_selected ground memorycell
Xwirel276 n_bl_276 n_bl_277 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer276 n_br_276 n_br_277 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj276 ground ground n_bl_277 ground n_br_277 ground vdd_selected ground memorycell
Xwirel277 n_bl_277 n_bl_278 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer277 n_br_277 n_br_278 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj277 ground ground n_bl_278 ground n_br_278 ground vdd_selected ground memorycell
Xwirel278 n_bl_278 n_bl_279 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer278 n_br_278 n_br_279 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj278 ground ground n_bl_279 ground n_br_279 ground vdd_selected ground memorycell
Xwirel279 n_bl_279 n_bl_280 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer279 n_br_279 n_br_280 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj279 ground ground n_bl_280 ground n_br_280 ground vdd_selected ground memorycell
Xwirel280 n_bl_280 n_bl_281 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer280 n_br_280 n_br_281 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj280 ground ground n_bl_281 ground n_br_281 ground vdd_selected ground memorycell
Xwirel281 n_bl_281 n_bl_282 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer281 n_br_281 n_br_282 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj281 ground ground n_bl_282 ground n_br_282 ground vdd_selected ground memorycell
Xwirel282 n_bl_282 n_bl_283 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer282 n_br_282 n_br_283 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj282 ground ground n_bl_283 ground n_br_283 ground vdd_selected ground memorycell
Xwirel283 n_bl_283 n_bl_284 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer283 n_br_283 n_br_284 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj283 ground ground n_bl_284 ground n_br_284 ground vdd_selected ground memorycell
Xwirel284 n_bl_284 n_bl_285 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer284 n_br_284 n_br_285 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj284 ground ground n_bl_285 ground n_br_285 ground vdd_selected ground memorycell
Xwirel285 n_bl_285 n_bl_286 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer285 n_br_285 n_br_286 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj285 ground ground n_bl_286 ground n_br_286 ground vdd_selected ground memorycell
Xwirel286 n_bl_286 n_bl_287 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer286 n_br_286 n_br_287 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj286 ground ground n_bl_287 ground n_br_287 ground vdd_selected ground memorycell
Xwirel287 n_bl_287 n_bl_288 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer287 n_br_287 n_br_288 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj287 ground ground n_bl_288 ground n_br_288 ground vdd_selected ground memorycell
Xwirel288 n_bl_288 n_bl_289 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer288 n_br_288 n_br_289 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj288 ground ground n_bl_289 ground n_br_289 ground vdd_selected ground memorycell
Xwirel289 n_bl_289 n_bl_290 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer289 n_br_289 n_br_290 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj289 ground ground n_bl_290 ground n_br_290 ground vdd_selected ground memorycell
Xwirel290 n_bl_290 n_bl_291 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer290 n_br_290 n_br_291 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj290 ground ground n_bl_291 ground n_br_291 ground vdd_selected ground memorycell
Xwirel291 n_bl_291 n_bl_292 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer291 n_br_291 n_br_292 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj291 ground ground n_bl_292 ground n_br_292 ground vdd_selected ground memorycell
Xwirel292 n_bl_292 n_bl_293 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer292 n_br_292 n_br_293 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj292 ground ground n_bl_293 ground n_br_293 ground vdd_selected ground memorycell
Xwirel293 n_bl_293 n_bl_294 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer293 n_br_293 n_br_294 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj293 ground ground n_bl_294 ground n_br_294 ground vdd_selected ground memorycell
Xwirel294 n_bl_294 n_bl_295 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer294 n_br_294 n_br_295 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj294 ground ground n_bl_295 ground n_br_295 ground vdd_selected ground memorycell
Xwirel295 n_bl_295 n_bl_296 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer295 n_br_295 n_br_296 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj295 ground ground n_bl_296 ground n_br_296 ground vdd_selected ground memorycell
Xwirel296 n_bl_296 n_bl_297 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer296 n_br_296 n_br_297 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj296 ground ground n_bl_297 ground n_br_297 ground vdd_selected ground memorycell
Xwirel297 n_bl_297 n_bl_298 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer297 n_br_297 n_br_298 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj297 ground ground n_bl_298 ground n_br_298 ground vdd_selected ground memorycell
Xwirel298 n_bl_298 n_bl_299 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer298 n_br_298 n_br_299 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj298 ground ground n_bl_299 ground n_br_299 ground vdd_selected ground memorycell
Xwirel299 n_bl_299 n_bl_300 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer299 n_br_299 n_br_300 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj299 ground ground n_bl_300 ground n_br_300 ground vdd_selected ground memorycell
Xwirel300 n_bl_300 n_bl_301 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer300 n_br_300 n_br_301 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj300 ground ground n_bl_301 ground n_br_301 ground vdd_selected ground memorycell
Xwirel301 n_bl_301 n_bl_302 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer301 n_br_301 n_br_302 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj301 ground ground n_bl_302 ground n_br_302 ground vdd_selected ground memorycell
Xwirel302 n_bl_302 n_bl_303 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer302 n_br_302 n_br_303 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj302 ground ground n_bl_303 ground n_br_303 ground vdd_selected ground memorycell
Xwirel303 n_bl_303 n_bl_304 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer303 n_br_303 n_br_304 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj303 ground ground n_bl_304 ground n_br_304 ground vdd_selected ground memorycell
Xwirel304 n_bl_304 n_bl_305 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer304 n_br_304 n_br_305 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj304 ground ground n_bl_305 ground n_br_305 ground vdd_selected ground memorycell
Xwirel305 n_bl_305 n_bl_306 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer305 n_br_305 n_br_306 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj305 ground ground n_bl_306 ground n_br_306 ground vdd_selected ground memorycell
Xwirel306 n_bl_306 n_bl_307 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer306 n_br_306 n_br_307 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj306 ground ground n_bl_307 ground n_br_307 ground vdd_selected ground memorycell
Xwirel307 n_bl_307 n_bl_308 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer307 n_br_307 n_br_308 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj307 ground ground n_bl_308 ground n_br_308 ground vdd_selected ground memorycell
Xwirel308 n_bl_308 n_bl_309 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer308 n_br_308 n_br_309 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj308 ground ground n_bl_309 ground n_br_309 ground vdd_selected ground memorycell
Xwirel309 n_bl_309 n_bl_310 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer309 n_br_309 n_br_310 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj309 ground ground n_bl_310 ground n_br_310 ground vdd_selected ground memorycell
Xwirel310 n_bl_310 n_bl_311 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer310 n_br_310 n_br_311 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj310 ground ground n_bl_311 ground n_br_311 ground vdd_selected ground memorycell
Xwirel311 n_bl_311 n_bl_312 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer311 n_br_311 n_br_312 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj311 ground ground n_bl_312 ground n_br_312 ground vdd_selected ground memorycell
Xwirel312 n_bl_312 n_bl_313 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer312 n_br_312 n_br_313 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj312 ground ground n_bl_313 ground n_br_313 ground vdd_selected ground memorycell
Xwirel313 n_bl_313 n_bl_314 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer313 n_br_313 n_br_314 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj313 ground ground n_bl_314 ground n_br_314 ground vdd_selected ground memorycell
Xwirel314 n_bl_314 n_bl_315 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer314 n_br_314 n_br_315 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj314 ground ground n_bl_315 ground n_br_315 ground vdd_selected ground memorycell
Xwirel315 n_bl_315 n_bl_316 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer315 n_br_315 n_br_316 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj315 ground ground n_bl_316 ground n_br_316 ground vdd_selected ground memorycell
Xwirel316 n_bl_316 n_bl_317 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer316 n_br_316 n_br_317 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj316 ground ground n_bl_317 ground n_br_317 ground vdd_selected ground memorycell
Xwirel317 n_bl_317 n_bl_318 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer317 n_br_317 n_br_318 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj317 ground ground n_bl_318 ground n_br_318 ground vdd_selected ground memorycell
Xwirel318 n_bl_318 n_bl_319 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer318 n_br_318 n_br_319 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj318 ground ground n_bl_319 ground n_br_319 ground vdd_selected ground memorycell
Xwirel319 n_bl_319 n_bl_320 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer319 n_br_319 n_br_320 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj319 ground ground n_bl_320 ground n_br_320 ground vdd_selected ground memorycell
Xwirel320 n_bl_320 n_bl_321 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer320 n_br_320 n_br_321 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj320 ground ground n_bl_321 ground n_br_321 ground vdd_selected ground memorycell
Xwirel321 n_bl_321 n_bl_322 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer321 n_br_321 n_br_322 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj321 ground ground n_bl_322 ground n_br_322 ground vdd_selected ground memorycell
Xwirel322 n_bl_322 n_bl_323 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer322 n_br_322 n_br_323 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj322 ground ground n_bl_323 ground n_br_323 ground vdd_selected ground memorycell
Xwirel323 n_bl_323 n_bl_324 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer323 n_br_323 n_br_324 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj323 ground ground n_bl_324 ground n_br_324 ground vdd_selected ground memorycell
Xwirel324 n_bl_324 n_bl_325 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer324 n_br_324 n_br_325 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj324 ground ground n_bl_325 ground n_br_325 ground vdd_selected ground memorycell
Xwirel325 n_bl_325 n_bl_326 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer325 n_br_325 n_br_326 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj325 ground ground n_bl_326 ground n_br_326 ground vdd_selected ground memorycell
Xwirel326 n_bl_326 n_bl_327 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer326 n_br_326 n_br_327 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj326 ground ground n_bl_327 ground n_br_327 ground vdd_selected ground memorycell
Xwirel327 n_bl_327 n_bl_328 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer327 n_br_327 n_br_328 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj327 ground ground n_bl_328 ground n_br_328 ground vdd_selected ground memorycell
Xwirel328 n_bl_328 n_bl_329 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer328 n_br_328 n_br_329 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj328 ground ground n_bl_329 ground n_br_329 ground vdd_selected ground memorycell
Xwirel329 n_bl_329 n_bl_330 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer329 n_br_329 n_br_330 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj329 ground ground n_bl_330 ground n_br_330 ground vdd_selected ground memorycell
Xwirel330 n_bl_330 n_bl_331 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer330 n_br_330 n_br_331 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj330 ground ground n_bl_331 ground n_br_331 ground vdd_selected ground memorycell
Xwirel331 n_bl_331 n_bl_332 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer331 n_br_331 n_br_332 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj331 ground ground n_bl_332 ground n_br_332 ground vdd_selected ground memorycell
Xwirel332 n_bl_332 n_bl_333 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer332 n_br_332 n_br_333 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj332 ground ground n_bl_333 ground n_br_333 ground vdd_selected ground memorycell
Xwirel333 n_bl_333 n_bl_334 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer333 n_br_333 n_br_334 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj333 ground ground n_bl_334 ground n_br_334 ground vdd_selected ground memorycell
Xwirel334 n_bl_334 n_bl_335 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer334 n_br_334 n_br_335 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj334 ground ground n_bl_335 ground n_br_335 ground vdd_selected ground memorycell
Xwirel335 n_bl_335 n_bl_336 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer335 n_br_335 n_br_336 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj335 ground ground n_bl_336 ground n_br_336 ground vdd_selected ground memorycell
Xwirel336 n_bl_336 n_bl_337 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer336 n_br_336 n_br_337 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj336 ground ground n_bl_337 ground n_br_337 ground vdd_selected ground memorycell
Xwirel337 n_bl_337 n_bl_338 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer337 n_br_337 n_br_338 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj337 ground ground n_bl_338 ground n_br_338 ground vdd_selected ground memorycell
Xwirel338 n_bl_338 n_bl_339 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer338 n_br_338 n_br_339 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj338 ground ground n_bl_339 ground n_br_339 ground vdd_selected ground memorycell
Xwirel339 n_bl_339 n_bl_340 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer339 n_br_339 n_br_340 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj339 ground ground n_bl_340 ground n_br_340 ground vdd_selected ground memorycell
Xwirel340 n_bl_340 n_bl_341 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer340 n_br_340 n_br_341 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj340 ground ground n_bl_341 ground n_br_341 ground vdd_selected ground memorycell
Xwirel341 n_bl_341 n_bl_342 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer341 n_br_341 n_br_342 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj341 ground ground n_bl_342 ground n_br_342 ground vdd_selected ground memorycell
Xwirel342 n_bl_342 n_bl_343 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer342 n_br_342 n_br_343 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj342 ground ground n_bl_343 ground n_br_343 ground vdd_selected ground memorycell
Xwirel343 n_bl_343 n_bl_344 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer343 n_br_343 n_br_344 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj343 ground ground n_bl_344 ground n_br_344 ground vdd_selected ground memorycell
Xwirel344 n_bl_344 n_bl_345 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer344 n_br_344 n_br_345 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj344 ground ground n_bl_345 ground n_br_345 ground vdd_selected ground memorycell
Xwirel345 n_bl_345 n_bl_346 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer345 n_br_345 n_br_346 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj345 ground ground n_bl_346 ground n_br_346 ground vdd_selected ground memorycell
Xwirel346 n_bl_346 n_bl_347 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer346 n_br_346 n_br_347 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj346 ground ground n_bl_347 ground n_br_347 ground vdd_selected ground memorycell
Xwirel347 n_bl_347 n_bl_348 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer347 n_br_347 n_br_348 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj347 ground ground n_bl_348 ground n_br_348 ground vdd_selected ground memorycell
Xwirel348 n_bl_348 n_bl_349 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer348 n_br_348 n_br_349 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj348 ground ground n_bl_349 ground n_br_349 ground vdd_selected ground memorycell
Xwirel349 n_bl_349 n_bl_350 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer349 n_br_349 n_br_350 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj349 ground ground n_bl_350 ground n_br_350 ground vdd_selected ground memorycell
Xwirel350 n_bl_350 n_bl_351 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer350 n_br_350 n_br_351 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj350 ground ground n_bl_351 ground n_br_351 ground vdd_selected ground memorycell
Xwirel351 n_bl_351 n_bl_352 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer351 n_br_351 n_br_352 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj351 ground ground n_bl_352 ground n_br_352 ground vdd_selected ground memorycell
Xwirel352 n_bl_352 n_bl_353 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer352 n_br_352 n_br_353 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj352 ground ground n_bl_353 ground n_br_353 ground vdd_selected ground memorycell
Xwirel353 n_bl_353 n_bl_354 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer353 n_br_353 n_br_354 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj353 ground ground n_bl_354 ground n_br_354 ground vdd_selected ground memorycell
Xwirel354 n_bl_354 n_bl_355 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer354 n_br_354 n_br_355 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj354 ground ground n_bl_355 ground n_br_355 ground vdd_selected ground memorycell
Xwirel355 n_bl_355 n_bl_356 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer355 n_br_355 n_br_356 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj355 ground ground n_bl_356 ground n_br_356 ground vdd_selected ground memorycell
Xwirel356 n_bl_356 n_bl_357 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer356 n_br_356 n_br_357 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj356 ground ground n_bl_357 ground n_br_357 ground vdd_selected ground memorycell
Xwirel357 n_bl_357 n_bl_358 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer357 n_br_357 n_br_358 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj357 ground ground n_bl_358 ground n_br_358 ground vdd_selected ground memorycell
Xwirel358 n_bl_358 n_bl_359 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer358 n_br_358 n_br_359 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj358 ground ground n_bl_359 ground n_br_359 ground vdd_selected ground memorycell
Xwirel359 n_bl_359 n_bl_360 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer359 n_br_359 n_br_360 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj359 ground ground n_bl_360 ground n_br_360 ground vdd_selected ground memorycell
Xwirel360 n_bl_360 n_bl_361 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer360 n_br_360 n_br_361 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj360 ground ground n_bl_361 ground n_br_361 ground vdd_selected ground memorycell
Xwirel361 n_bl_361 n_bl_362 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer361 n_br_361 n_br_362 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj361 ground ground n_bl_362 ground n_br_362 ground vdd_selected ground memorycell
Xwirel362 n_bl_362 n_bl_363 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer362 n_br_362 n_br_363 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj362 ground ground n_bl_363 ground n_br_363 ground vdd_selected ground memorycell
Xwirel363 n_bl_363 n_bl_364 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer363 n_br_363 n_br_364 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj363 ground ground n_bl_364 ground n_br_364 ground vdd_selected ground memorycell
Xwirel364 n_bl_364 n_bl_365 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer364 n_br_364 n_br_365 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj364 ground ground n_bl_365 ground n_br_365 ground vdd_selected ground memorycell
Xwirel365 n_bl_365 n_bl_366 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer365 n_br_365 n_br_366 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj365 ground ground n_bl_366 ground n_br_366 ground vdd_selected ground memorycell
Xwirel366 n_bl_366 n_bl_367 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer366 n_br_366 n_br_367 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj366 ground ground n_bl_367 ground n_br_367 ground vdd_selected ground memorycell
Xwirel367 n_bl_367 n_bl_368 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer367 n_br_367 n_br_368 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj367 ground ground n_bl_368 ground n_br_368 ground vdd_selected ground memorycell
Xwirel368 n_bl_368 n_bl_369 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer368 n_br_368 n_br_369 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj368 ground ground n_bl_369 ground n_br_369 ground vdd_selected ground memorycell
Xwirel369 n_bl_369 n_bl_370 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer369 n_br_369 n_br_370 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj369 ground ground n_bl_370 ground n_br_370 ground vdd_selected ground memorycell
Xwirel370 n_bl_370 n_bl_371 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer370 n_br_370 n_br_371 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj370 ground ground n_bl_371 ground n_br_371 ground vdd_selected ground memorycell
Xwirel371 n_bl_371 n_bl_372 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer371 n_br_371 n_br_372 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj371 ground ground n_bl_372 ground n_br_372 ground vdd_selected ground memorycell
Xwirel372 n_bl_372 n_bl_373 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer372 n_br_372 n_br_373 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj372 ground ground n_bl_373 ground n_br_373 ground vdd_selected ground memorycell
Xwirel373 n_bl_373 n_bl_374 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer373 n_br_373 n_br_374 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj373 ground ground n_bl_374 ground n_br_374 ground vdd_selected ground memorycell
Xwirel374 n_bl_374 n_bl_375 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer374 n_br_374 n_br_375 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj374 ground ground n_bl_375 ground n_br_375 ground vdd_selected ground memorycell
Xwirel375 n_bl_375 n_bl_376 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer375 n_br_375 n_br_376 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj375 ground ground n_bl_376 ground n_br_376 ground vdd_selected ground memorycell
Xwirel376 n_bl_376 n_bl_377 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer376 n_br_376 n_br_377 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj376 ground ground n_bl_377 ground n_br_377 ground vdd_selected ground memorycell
Xwirel377 n_bl_377 n_bl_378 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer377 n_br_377 n_br_378 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj377 ground ground n_bl_378 ground n_br_378 ground vdd_selected ground memorycell
Xwirel378 n_bl_378 n_bl_379 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer378 n_br_378 n_br_379 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj378 ground ground n_bl_379 ground n_br_379 ground vdd_selected ground memorycell
Xwirel379 n_bl_379 n_bl_380 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer379 n_br_379 n_br_380 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj379 ground ground n_bl_380 ground n_br_380 ground vdd_selected ground memorycell
Xwirel380 n_bl_380 n_bl_381 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer380 n_br_380 n_br_381 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj380 ground ground n_bl_381 ground n_br_381 ground vdd_selected ground memorycell
Xwirel381 n_bl_381 n_bl_382 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer381 n_br_381 n_br_382 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj381 ground ground n_bl_382 ground n_br_382 ground vdd_selected ground memorycell
Xwirel382 n_bl_382 n_bl_383 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer382 n_br_382 n_br_383 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj382 ground ground n_bl_383 ground n_br_383 ground vdd_selected ground memorycell
Xwirel383 n_bl_383 n_bl_384 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer383 n_br_383 n_br_384 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj383 ground ground n_bl_384 ground n_br_384 ground vdd_selected ground memorycell
Xwirel384 n_bl_384 n_bl_385 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer384 n_br_384 n_br_385 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj384 ground ground n_bl_385 ground n_br_385 ground vdd_selected ground memorycell
Xwirel385 n_bl_385 n_bl_386 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer385 n_br_385 n_br_386 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj385 ground ground n_bl_386 ground n_br_386 ground vdd_selected ground memorycell
Xwirel386 n_bl_386 n_bl_387 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer386 n_br_386 n_br_387 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj386 ground ground n_bl_387 ground n_br_387 ground vdd_selected ground memorycell
Xwirel387 n_bl_387 n_bl_388 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer387 n_br_387 n_br_388 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj387 ground ground n_bl_388 ground n_br_388 ground vdd_selected ground memorycell
Xwirel388 n_bl_388 n_bl_389 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer388 n_br_388 n_br_389 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj388 ground ground n_bl_389 ground n_br_389 ground vdd_selected ground memorycell
Xwirel389 n_bl_389 n_bl_390 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer389 n_br_389 n_br_390 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj389 ground ground n_bl_390 ground n_br_390 ground vdd_selected ground memorycell
Xwirel390 n_bl_390 n_bl_391 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer390 n_br_390 n_br_391 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj390 ground ground n_bl_391 ground n_br_391 ground vdd_selected ground memorycell
Xwirel391 n_bl_391 n_bl_392 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer391 n_br_391 n_br_392 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj391 ground ground n_bl_392 ground n_br_392 ground vdd_selected ground memorycell
Xwirel392 n_bl_392 n_bl_393 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer392 n_br_392 n_br_393 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj392 ground ground n_bl_393 ground n_br_393 ground vdd_selected ground memorycell
Xwirel393 n_bl_393 n_bl_394 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer393 n_br_393 n_br_394 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj393 ground ground n_bl_394 ground n_br_394 ground vdd_selected ground memorycell
Xwirel394 n_bl_394 n_bl_395 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer394 n_br_394 n_br_395 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj394 ground ground n_bl_395 ground n_br_395 ground vdd_selected ground memorycell
Xwirel395 n_bl_395 n_bl_396 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer395 n_br_395 n_br_396 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj395 ground ground n_bl_396 ground n_br_396 ground vdd_selected ground memorycell
Xwirel396 n_bl_396 n_bl_397 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer396 n_br_396 n_br_397 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj396 ground ground n_bl_397 ground n_br_397 ground vdd_selected ground memorycell
Xwirel397 n_bl_397 n_bl_398 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer397 n_br_397 n_br_398 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj397 ground ground n_bl_398 ground n_br_398 ground vdd_selected ground memorycell
Xwirel398 n_bl_398 n_bl_399 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer398 n_br_398 n_br_399 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj398 ground ground n_bl_399 ground n_br_399 ground vdd_selected ground memorycell
Xwirel399 n_bl_399 n_bl_400 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer399 n_br_399 n_br_400 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj399 ground ground n_bl_400 ground n_br_400 ground vdd_selected ground memorycell
Xwirel400 n_bl_400 n_bl_401 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer400 n_br_400 n_br_401 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj400 ground ground n_bl_401 ground n_br_401 ground vdd_selected ground memorycell
Xwirel401 n_bl_401 n_bl_402 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer401 n_br_401 n_br_402 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj401 ground ground n_bl_402 ground n_br_402 ground vdd_selected ground memorycell
Xwirel402 n_bl_402 n_bl_403 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer402 n_br_402 n_br_403 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj402 ground ground n_bl_403 ground n_br_403 ground vdd_selected ground memorycell
Xwirel403 n_bl_403 n_bl_404 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer403 n_br_403 n_br_404 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj403 ground ground n_bl_404 ground n_br_404 ground vdd_selected ground memorycell
Xwirel404 n_bl_404 n_bl_405 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer404 n_br_404 n_br_405 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj404 ground ground n_bl_405 ground n_br_405 ground vdd_selected ground memorycell
Xwirel405 n_bl_405 n_bl_406 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer405 n_br_405 n_br_406 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj405 ground ground n_bl_406 ground n_br_406 ground vdd_selected ground memorycell
Xwirel406 n_bl_406 n_bl_407 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer406 n_br_406 n_br_407 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj406 ground ground n_bl_407 ground n_br_407 ground vdd_selected ground memorycell
Xwirel407 n_bl_407 n_bl_408 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer407 n_br_407 n_br_408 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj407 ground ground n_bl_408 ground n_br_408 ground vdd_selected ground memorycell
Xwirel408 n_bl_408 n_bl_409 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer408 n_br_408 n_br_409 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj408 ground ground n_bl_409 ground n_br_409 ground vdd_selected ground memorycell
Xwirel409 n_bl_409 n_bl_410 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer409 n_br_409 n_br_410 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj409 ground ground n_bl_410 ground n_br_410 ground vdd_selected ground memorycell
Xwirel410 n_bl_410 n_bl_411 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer410 n_br_410 n_br_411 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj410 ground ground n_bl_411 ground n_br_411 ground vdd_selected ground memorycell
Xwirel411 n_bl_411 n_bl_412 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer411 n_br_411 n_br_412 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj411 ground ground n_bl_412 ground n_br_412 ground vdd_selected ground memorycell
Xwirel412 n_bl_412 n_bl_413 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer412 n_br_412 n_br_413 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj412 ground ground n_bl_413 ground n_br_413 ground vdd_selected ground memorycell
Xwirel413 n_bl_413 n_bl_414 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer413 n_br_413 n_br_414 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj413 ground ground n_bl_414 ground n_br_414 ground vdd_selected ground memorycell
Xwirel414 n_bl_414 n_bl_415 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer414 n_br_414 n_br_415 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj414 ground ground n_bl_415 ground n_br_415 ground vdd_selected ground memorycell
Xwirel415 n_bl_415 n_bl_416 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer415 n_br_415 n_br_416 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj415 ground ground n_bl_416 ground n_br_416 ground vdd_selected ground memorycell
Xwirel416 n_bl_416 n_bl_417 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer416 n_br_416 n_br_417 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj416 ground ground n_bl_417 ground n_br_417 ground vdd_selected ground memorycell
Xwirel417 n_bl_417 n_bl_418 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer417 n_br_417 n_br_418 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj417 ground ground n_bl_418 ground n_br_418 ground vdd_selected ground memorycell
Xwirel418 n_bl_418 n_bl_419 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer418 n_br_418 n_br_419 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj418 ground ground n_bl_419 ground n_br_419 ground vdd_selected ground memorycell
Xwirel419 n_bl_419 n_bl_420 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer419 n_br_419 n_br_420 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj419 ground ground n_bl_420 ground n_br_420 ground vdd_selected ground memorycell
Xwirel420 n_bl_420 n_bl_421 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer420 n_br_420 n_br_421 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj420 ground ground n_bl_421 ground n_br_421 ground vdd_selected ground memorycell
Xwirel421 n_bl_421 n_bl_422 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer421 n_br_421 n_br_422 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj421 ground ground n_bl_422 ground n_br_422 ground vdd_selected ground memorycell
Xwirel422 n_bl_422 n_bl_423 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer422 n_br_422 n_br_423 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj422 ground ground n_bl_423 ground n_br_423 ground vdd_selected ground memorycell
Xwirel423 n_bl_423 n_bl_424 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer423 n_br_423 n_br_424 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj423 ground ground n_bl_424 ground n_br_424 ground vdd_selected ground memorycell
Xwirel424 n_bl_424 n_bl_425 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer424 n_br_424 n_br_425 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj424 ground ground n_bl_425 ground n_br_425 ground vdd_selected ground memorycell
Xwirel425 n_bl_425 n_bl_426 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer425 n_br_425 n_br_426 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj425 ground ground n_bl_426 ground n_br_426 ground vdd_selected ground memorycell
Xwirel426 n_bl_426 n_bl_427 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer426 n_br_426 n_br_427 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj426 ground ground n_bl_427 ground n_br_427 ground vdd_selected ground memorycell
Xwirel427 n_bl_427 n_bl_428 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer427 n_br_427 n_br_428 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj427 ground ground n_bl_428 ground n_br_428 ground vdd_selected ground memorycell
Xwirel428 n_bl_428 n_bl_429 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer428 n_br_428 n_br_429 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj428 ground ground n_bl_429 ground n_br_429 ground vdd_selected ground memorycell
Xwirel429 n_bl_429 n_bl_430 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer429 n_br_429 n_br_430 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj429 ground ground n_bl_430 ground n_br_430 ground vdd_selected ground memorycell
Xwirel430 n_bl_430 n_bl_431 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer430 n_br_430 n_br_431 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj430 ground ground n_bl_431 ground n_br_431 ground vdd_selected ground memorycell
Xwirel431 n_bl_431 n_bl_432 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer431 n_br_431 n_br_432 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj431 ground ground n_bl_432 ground n_br_432 ground vdd_selected ground memorycell
Xwirel432 n_bl_432 n_bl_433 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer432 n_br_432 n_br_433 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj432 ground ground n_bl_433 ground n_br_433 ground vdd_selected ground memorycell
Xwirel433 n_bl_433 n_bl_434 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer433 n_br_433 n_br_434 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj433 ground ground n_bl_434 ground n_br_434 ground vdd_selected ground memorycell
Xwirel434 n_bl_434 n_bl_435 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer434 n_br_434 n_br_435 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj434 ground ground n_bl_435 ground n_br_435 ground vdd_selected ground memorycell
Xwirel435 n_bl_435 n_bl_436 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer435 n_br_435 n_br_436 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj435 ground ground n_bl_436 ground n_br_436 ground vdd_selected ground memorycell
Xwirel436 n_bl_436 n_bl_437 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer436 n_br_436 n_br_437 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj436 ground ground n_bl_437 ground n_br_437 ground vdd_selected ground memorycell
Xwirel437 n_bl_437 n_bl_438 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer437 n_br_437 n_br_438 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj437 ground ground n_bl_438 ground n_br_438 ground vdd_selected ground memorycell
Xwirel438 n_bl_438 n_bl_439 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer438 n_br_438 n_br_439 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj438 ground ground n_bl_439 ground n_br_439 ground vdd_selected ground memorycell
Xwirel439 n_bl_439 n_bl_440 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer439 n_br_439 n_br_440 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj439 ground ground n_bl_440 ground n_br_440 ground vdd_selected ground memorycell
Xwirel440 n_bl_440 n_bl_441 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer440 n_br_440 n_br_441 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj440 ground ground n_bl_441 ground n_br_441 ground vdd_selected ground memorycell
Xwirel441 n_bl_441 n_bl_442 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer441 n_br_441 n_br_442 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj441 ground ground n_bl_442 ground n_br_442 ground vdd_selected ground memorycell
Xwirel442 n_bl_442 n_bl_443 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer442 n_br_442 n_br_443 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj442 ground ground n_bl_443 ground n_br_443 ground vdd_selected ground memorycell
Xwirel443 n_bl_443 n_bl_444 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer443 n_br_443 n_br_444 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj443 ground ground n_bl_444 ground n_br_444 ground vdd_selected ground memorycell
Xwirel444 n_bl_444 n_bl_445 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer444 n_br_444 n_br_445 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj444 ground ground n_bl_445 ground n_br_445 ground vdd_selected ground memorycell
Xwirel445 n_bl_445 n_bl_446 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer445 n_br_445 n_br_446 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj445 ground ground n_bl_446 ground n_br_446 ground vdd_selected ground memorycell
Xwirel446 n_bl_446 n_bl_447 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer446 n_br_446 n_br_447 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj446 ground ground n_bl_447 ground n_br_447 ground vdd_selected ground memorycell
Xwirel447 n_bl_447 n_bl_448 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer447 n_br_447 n_br_448 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj447 ground ground n_bl_448 ground n_br_448 ground vdd_selected ground memorycell
Xwirel448 n_bl_448 n_bl_449 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer448 n_br_448 n_br_449 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj448 ground ground n_bl_449 ground n_br_449 ground vdd_selected ground memorycell
Xwirel449 n_bl_449 n_bl_450 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer449 n_br_449 n_br_450 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj449 ground ground n_bl_450 ground n_br_450 ground vdd_selected ground memorycell
Xwirel450 n_bl_450 n_bl_451 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer450 n_br_450 n_br_451 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj450 ground ground n_bl_451 ground n_br_451 ground vdd_selected ground memorycell
Xwirel451 n_bl_451 n_bl_452 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer451 n_br_451 n_br_452 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj451 ground ground n_bl_452 ground n_br_452 ground vdd_selected ground memorycell
Xwirel452 n_bl_452 n_bl_453 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer452 n_br_452 n_br_453 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj452 ground ground n_bl_453 ground n_br_453 ground vdd_selected ground memorycell
Xwirel453 n_bl_453 n_bl_454 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer453 n_br_453 n_br_454 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj453 ground ground n_bl_454 ground n_br_454 ground vdd_selected ground memorycell
Xwirel454 n_bl_454 n_bl_455 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer454 n_br_454 n_br_455 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj454 ground ground n_bl_455 ground n_br_455 ground vdd_selected ground memorycell
Xwirel455 n_bl_455 n_bl_456 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer455 n_br_455 n_br_456 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj455 ground ground n_bl_456 ground n_br_456 ground vdd_selected ground memorycell
Xwirel456 n_bl_456 n_bl_457 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer456 n_br_456 n_br_457 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj456 ground ground n_bl_457 ground n_br_457 ground vdd_selected ground memorycell
Xwirel457 n_bl_457 n_bl_458 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer457 n_br_457 n_br_458 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj457 ground ground n_bl_458 ground n_br_458 ground vdd_selected ground memorycell
Xwirel458 n_bl_458 n_bl_459 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer458 n_br_458 n_br_459 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj458 ground ground n_bl_459 ground n_br_459 ground vdd_selected ground memorycell
Xwirel459 n_bl_459 n_bl_460 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer459 n_br_459 n_br_460 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj459 ground ground n_bl_460 ground n_br_460 ground vdd_selected ground memorycell
Xwirel460 n_bl_460 n_bl_461 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer460 n_br_460 n_br_461 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj460 ground ground n_bl_461 ground n_br_461 ground vdd_selected ground memorycell
Xwirel461 n_bl_461 n_bl_462 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer461 n_br_461 n_br_462 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj461 ground ground n_bl_462 ground n_br_462 ground vdd_selected ground memorycell
Xwirel462 n_bl_462 n_bl_463 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer462 n_br_462 n_br_463 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj462 ground ground n_bl_463 ground n_br_463 ground vdd_selected ground memorycell
Xwirel463 n_bl_463 n_bl_464 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer463 n_br_463 n_br_464 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj463 ground ground n_bl_464 ground n_br_464 ground vdd_selected ground memorycell
Xwirel464 n_bl_464 n_bl_465 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer464 n_br_464 n_br_465 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj464 ground ground n_bl_465 ground n_br_465 ground vdd_selected ground memorycell
Xwirel465 n_bl_465 n_bl_466 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer465 n_br_465 n_br_466 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj465 ground ground n_bl_466 ground n_br_466 ground vdd_selected ground memorycell
Xwirel466 n_bl_466 n_bl_467 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer466 n_br_466 n_br_467 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj466 ground ground n_bl_467 ground n_br_467 ground vdd_selected ground memorycell
Xwirel467 n_bl_467 n_bl_468 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer467 n_br_467 n_br_468 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj467 ground ground n_bl_468 ground n_br_468 ground vdd_selected ground memorycell
Xwirel468 n_bl_468 n_bl_469 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer468 n_br_468 n_br_469 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj468 ground ground n_bl_469 ground n_br_469 ground vdd_selected ground memorycell
Xwirel469 n_bl_469 n_bl_470 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer469 n_br_469 n_br_470 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj469 ground ground n_bl_470 ground n_br_470 ground vdd_selected ground memorycell
Xwirel470 n_bl_470 n_bl_471 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer470 n_br_470 n_br_471 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj470 ground ground n_bl_471 ground n_br_471 ground vdd_selected ground memorycell
Xwirel471 n_bl_471 n_bl_472 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer471 n_br_471 n_br_472 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj471 ground ground n_bl_472 ground n_br_472 ground vdd_selected ground memorycell
Xwirel472 n_bl_472 n_bl_473 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer472 n_br_472 n_br_473 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj472 ground ground n_bl_473 ground n_br_473 ground vdd_selected ground memorycell
Xwirel473 n_bl_473 n_bl_474 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer473 n_br_473 n_br_474 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj473 ground ground n_bl_474 ground n_br_474 ground vdd_selected ground memorycell
Xwirel474 n_bl_474 n_bl_475 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer474 n_br_474 n_br_475 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj474 ground ground n_bl_475 ground n_br_475 ground vdd_selected ground memorycell
Xwirel475 n_bl_475 n_bl_476 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer475 n_br_475 n_br_476 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj475 ground ground n_bl_476 ground n_br_476 ground vdd_selected ground memorycell
Xwirel476 n_bl_476 n_bl_477 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer476 n_br_476 n_br_477 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj476 ground ground n_bl_477 ground n_br_477 ground vdd_selected ground memorycell
Xwirel477 n_bl_477 n_bl_478 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer477 n_br_477 n_br_478 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj477 ground ground n_bl_478 ground n_br_478 ground vdd_selected ground memorycell
Xwirel478 n_bl_478 n_bl_479 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer478 n_br_478 n_br_479 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj478 ground ground n_bl_479 ground n_br_479 ground vdd_selected ground memorycell
Xwirel479 n_bl_479 n_bl_480 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer479 n_br_479 n_br_480 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj479 ground ground n_bl_480 ground n_br_480 ground vdd_selected ground memorycell
Xwirel480 n_bl_480 n_bl_481 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer480 n_br_480 n_br_481 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj480 ground ground n_bl_481 ground n_br_481 ground vdd_selected ground memorycell
Xwirel481 n_bl_481 n_bl_482 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer481 n_br_481 n_br_482 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj481 ground ground n_bl_482 ground n_br_482 ground vdd_selected ground memorycell
Xwirel482 n_bl_482 n_bl_483 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer482 n_br_482 n_br_483 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj482 ground ground n_bl_483 ground n_br_483 ground vdd_selected ground memorycell
Xwirel483 n_bl_483 n_bl_484 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer483 n_br_483 n_br_484 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj483 ground ground n_bl_484 ground n_br_484 ground vdd_selected ground memorycell
Xwirel484 n_bl_484 n_bl_485 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer484 n_br_484 n_br_485 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj484 ground ground n_bl_485 ground n_br_485 ground vdd_selected ground memorycell
Xwirel485 n_bl_485 n_bl_486 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer485 n_br_485 n_br_486 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj485 ground ground n_bl_486 ground n_br_486 ground vdd_selected ground memorycell
Xwirel486 n_bl_486 n_bl_487 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer486 n_br_486 n_br_487 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj486 ground ground n_bl_487 ground n_br_487 ground vdd_selected ground memorycell
Xwirel487 n_bl_487 n_bl_488 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer487 n_br_487 n_br_488 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj487 ground ground n_bl_488 ground n_br_488 ground vdd_selected ground memorycell
Xwirel488 n_bl_488 n_bl_489 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer488 n_br_488 n_br_489 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj488 ground ground n_bl_489 ground n_br_489 ground vdd_selected ground memorycell
Xwirel489 n_bl_489 n_bl_490 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer489 n_br_489 n_br_490 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj489 ground ground n_bl_490 ground n_br_490 ground vdd_selected ground memorycell
Xwirel490 n_bl_490 n_bl_491 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer490 n_br_490 n_br_491 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj490 ground ground n_bl_491 ground n_br_491 ground vdd_selected ground memorycell
Xwirel491 n_bl_491 n_bl_492 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer491 n_br_491 n_br_492 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj491 ground ground n_bl_492 ground n_br_492 ground vdd_selected ground memorycell
Xwirel492 n_bl_492 n_bl_493 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer492 n_br_492 n_br_493 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj492 ground ground n_bl_493 ground n_br_493 ground vdd_selected ground memorycell
Xwirel493 n_bl_493 n_bl_494 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer493 n_br_493 n_br_494 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj493 ground ground n_bl_494 ground n_br_494 ground vdd_selected ground memorycell
Xwirel494 n_bl_494 n_bl_495 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer494 n_br_494 n_br_495 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj494 ground ground n_bl_495 ground n_br_495 ground vdd_selected ground memorycell
Xwirel495 n_bl_495 n_bl_496 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer495 n_br_495 n_br_496 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj495 ground ground n_bl_496 ground n_br_496 ground vdd_selected ground memorycell
Xwirel496 n_bl_496 n_bl_497 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer496 n_br_496 n_br_497 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj496 ground ground n_bl_497 ground n_br_497 ground vdd_selected ground memorycell
Xwirel497 n_bl_497 n_bl_498 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer497 n_br_497 n_br_498 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj497 ground ground n_bl_498 ground n_br_498 ground vdd_selected ground memorycell
Xwirel498 n_bl_498 n_bl_499 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer498 n_br_498 n_br_499 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj498 ground ground n_bl_499 ground n_br_499 ground vdd_selected ground memorycell
Xwirel499 n_bl_499 n_bl_500 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer499 n_br_499 n_br_500 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj499 ground ground n_bl_500 ground n_br_500 ground vdd_selected ground memorycell
Xwirel500 n_bl_500 n_bl_501 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer500 n_br_500 n_br_501 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj500 ground ground n_bl_501 ground n_br_501 ground vdd_selected ground memorycell
Xwirel501 n_bl_501 n_bl_502 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer501 n_br_501 n_br_502 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj501 ground ground n_bl_502 ground n_br_502 ground vdd_selected ground memorycell
Xwirel502 n_bl_502 n_bl_503 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer502 n_br_502 n_br_503 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj502 ground ground n_bl_503 ground n_br_503 ground vdd_selected ground memorycell
Xwirel503 n_bl_503 n_bl_504 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer503 n_br_503 n_br_504 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj503 ground ground n_bl_504 ground n_br_504 ground vdd_selected ground memorycell
Xwirel504 n_bl_504 n_bl_505 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer504 n_br_504 n_br_505 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj504 ground ground n_bl_505 ground n_br_505 ground vdd_selected ground memorycell
Xwirel505 n_bl_505 n_bl_506 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer505 n_br_505 n_br_506 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj505 ground ground n_bl_506 ground n_br_506 ground vdd_selected ground memorycell
Xwirel506 n_bl_506 n_bl_507 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer506 n_br_506 n_br_507 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj506 ground ground n_bl_507 ground n_br_507 ground vdd_selected ground memorycell
Xwirel507 n_bl_507 n_bl_508 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer507 n_br_507 n_br_508 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj507 ground ground n_bl_508 ground n_br_508 ground vdd_selected ground memorycell
Xwirel508 n_bl_508 n_bl_509 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer508 n_br_508 n_br_509 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj508 ground ground n_bl_509 ground n_br_509 ground vdd_selected ground memorycell
Xwirel509 n_bl_509 n_bl_510 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer509 n_br_509 n_br_510 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj509 ground ground n_bl_510 ground n_br_510 ground vdd_selected ground memorycell
Xwirel510 n_bl_510 n_bl_511 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer510 n_br_510 n_br_511 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj510 ground ground n_bl_511 ground n_br_511 ground vdd_selected ground memorycell
Xwirel511 n_bl_511 n_bl_512 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer511 n_br_511 n_br_512 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj511 n_precharge ground n_bl_512 ground n_br_512 ground vdd_selected ground memorycell
.IC V(n_bl_0) = 0.8 
.IC V(n_br_0) = 0 
X2prechargesa n2_1_1 n2_hang_1 ground ground n2_hang_out vclmpmtj vrefmtj ground ground vdd_lp ground mtj_subcircuits_sa
X2writedriver n2_data_in vdd_lp n2_1_1 vnegh vdd_selectedh ground mtj_subcircuits_writedriver
X2cs n2_1_1 n2_bl_0 n2_precharge_b n2_precharge vdd_lp ground mtj_subcircuits_cs
x2precharge_dup n2_hang_low n2_bl_512 n2_precharge_b n2_precharge vdd_lp ground mtj_subcircuits_cs
X2wirel0 n2_bl_0 n2_bl_1 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer0 n2_br_0 n2_br_1 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj0 ground ground n2_bl_1 ground n2_br_1 ground vdd_selectedh ground memorycellh
X2wirel1 n2_bl_1 n2_bl_2 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer1 n2_br_1 n2_br_2 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj1 ground ground n2_bl_2 ground n2_br_2 ground vdd_selectedh ground memorycellh
X2wirel2 n2_bl_2 n2_bl_3 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer2 n2_br_2 n2_br_3 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj2 ground ground n2_bl_3 ground n2_br_3 ground vdd_selectedh ground memorycellh
X2wirel3 n2_bl_3 n2_bl_4 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer3 n2_br_3 n2_br_4 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj3 ground ground n2_bl_4 ground n2_br_4 ground vdd_selectedh ground memorycellh
X2wirel4 n2_bl_4 n2_bl_5 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer4 n2_br_4 n2_br_5 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj4 ground ground n2_bl_5 ground n2_br_5 ground vdd_selectedh ground memorycellh
X2wirel5 n2_bl_5 n2_bl_6 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer5 n2_br_5 n2_br_6 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj5 ground ground n2_bl_6 ground n2_br_6 ground vdd_selectedh ground memorycellh
X2wirel6 n2_bl_6 n2_bl_7 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer6 n2_br_6 n2_br_7 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj6 ground ground n2_bl_7 ground n2_br_7 ground vdd_selectedh ground memorycellh
X2wirel7 n2_bl_7 n2_bl_8 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer7 n2_br_7 n2_br_8 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj7 ground ground n2_bl_8 ground n2_br_8 ground vdd_selectedh ground memorycellh
X2wirel8 n2_bl_8 n2_bl_9 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer8 n2_br_8 n2_br_9 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj8 ground ground n2_bl_9 ground n2_br_9 ground vdd_selectedh ground memorycellh
X2wirel9 n2_bl_9 n2_bl_10 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer9 n2_br_9 n2_br_10 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj9 ground ground n2_bl_10 ground n2_br_10 ground vdd_selectedh ground memorycellh
X2wirel10 n2_bl_10 n2_bl_11 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer10 n2_br_10 n2_br_11 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj10 ground ground n2_bl_11 ground n2_br_11 ground vdd_selectedh ground memorycellh
X2wirel11 n2_bl_11 n2_bl_12 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer11 n2_br_11 n2_br_12 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj11 ground ground n2_bl_12 ground n2_br_12 ground vdd_selectedh ground memorycellh
X2wirel12 n2_bl_12 n2_bl_13 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer12 n2_br_12 n2_br_13 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj12 ground ground n2_bl_13 ground n2_br_13 ground vdd_selectedh ground memorycellh
X2wirel13 n2_bl_13 n2_bl_14 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer13 n2_br_13 n2_br_14 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj13 ground ground n2_bl_14 ground n2_br_14 ground vdd_selectedh ground memorycellh
X2wirel14 n2_bl_14 n2_bl_15 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer14 n2_br_14 n2_br_15 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj14 ground ground n2_bl_15 ground n2_br_15 ground vdd_selectedh ground memorycellh
X2wirel15 n2_bl_15 n2_bl_16 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer15 n2_br_15 n2_br_16 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj15 ground ground n2_bl_16 ground n2_br_16 ground vdd_selectedh ground memorycellh
X2wirel16 n2_bl_16 n2_bl_17 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer16 n2_br_16 n2_br_17 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj16 ground ground n2_bl_17 ground n2_br_17 ground vdd_selectedh ground memorycellh
X2wirel17 n2_bl_17 n2_bl_18 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer17 n2_br_17 n2_br_18 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj17 ground ground n2_bl_18 ground n2_br_18 ground vdd_selectedh ground memorycellh
X2wirel18 n2_bl_18 n2_bl_19 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer18 n2_br_18 n2_br_19 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj18 ground ground n2_bl_19 ground n2_br_19 ground vdd_selectedh ground memorycellh
X2wirel19 n2_bl_19 n2_bl_20 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer19 n2_br_19 n2_br_20 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj19 ground ground n2_bl_20 ground n2_br_20 ground vdd_selectedh ground memorycellh
X2wirel20 n2_bl_20 n2_bl_21 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer20 n2_br_20 n2_br_21 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj20 ground ground n2_bl_21 ground n2_br_21 ground vdd_selectedh ground memorycellh
X2wirel21 n2_bl_21 n2_bl_22 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer21 n2_br_21 n2_br_22 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj21 ground ground n2_bl_22 ground n2_br_22 ground vdd_selectedh ground memorycellh
X2wirel22 n2_bl_22 n2_bl_23 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer22 n2_br_22 n2_br_23 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj22 ground ground n2_bl_23 ground n2_br_23 ground vdd_selectedh ground memorycellh
X2wirel23 n2_bl_23 n2_bl_24 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer23 n2_br_23 n2_br_24 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj23 ground ground n2_bl_24 ground n2_br_24 ground vdd_selectedh ground memorycellh
X2wirel24 n2_bl_24 n2_bl_25 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer24 n2_br_24 n2_br_25 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj24 ground ground n2_bl_25 ground n2_br_25 ground vdd_selectedh ground memorycellh
X2wirel25 n2_bl_25 n2_bl_26 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer25 n2_br_25 n2_br_26 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj25 ground ground n2_bl_26 ground n2_br_26 ground vdd_selectedh ground memorycellh
X2wirel26 n2_bl_26 n2_bl_27 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer26 n2_br_26 n2_br_27 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj26 ground ground n2_bl_27 ground n2_br_27 ground vdd_selectedh ground memorycellh
X2wirel27 n2_bl_27 n2_bl_28 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer27 n2_br_27 n2_br_28 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj27 ground ground n2_bl_28 ground n2_br_28 ground vdd_selectedh ground memorycellh
X2wirel28 n2_bl_28 n2_bl_29 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer28 n2_br_28 n2_br_29 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj28 ground ground n2_bl_29 ground n2_br_29 ground vdd_selectedh ground memorycellh
X2wirel29 n2_bl_29 n2_bl_30 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer29 n2_br_29 n2_br_30 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj29 ground ground n2_bl_30 ground n2_br_30 ground vdd_selectedh ground memorycellh
X2wirel30 n2_bl_30 n2_bl_31 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer30 n2_br_30 n2_br_31 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj30 ground ground n2_bl_31 ground n2_br_31 ground vdd_selectedh ground memorycellh
X2wirel31 n2_bl_31 n2_bl_32 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer31 n2_br_31 n2_br_32 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj31 ground ground n2_bl_32 ground n2_br_32 ground vdd_selectedh ground memorycellh
X2wirel32 n2_bl_32 n2_bl_33 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer32 n2_br_32 n2_br_33 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj32 ground ground n2_bl_33 ground n2_br_33 ground vdd_selectedh ground memorycellh
X2wirel33 n2_bl_33 n2_bl_34 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer33 n2_br_33 n2_br_34 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj33 ground ground n2_bl_34 ground n2_br_34 ground vdd_selectedh ground memorycellh
X2wirel34 n2_bl_34 n2_bl_35 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer34 n2_br_34 n2_br_35 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj34 ground ground n2_bl_35 ground n2_br_35 ground vdd_selectedh ground memorycellh
X2wirel35 n2_bl_35 n2_bl_36 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer35 n2_br_35 n2_br_36 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj35 ground ground n2_bl_36 ground n2_br_36 ground vdd_selectedh ground memorycellh
X2wirel36 n2_bl_36 n2_bl_37 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer36 n2_br_36 n2_br_37 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj36 ground ground n2_bl_37 ground n2_br_37 ground vdd_selectedh ground memorycellh
X2wirel37 n2_bl_37 n2_bl_38 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer37 n2_br_37 n2_br_38 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj37 ground ground n2_bl_38 ground n2_br_38 ground vdd_selectedh ground memorycellh
X2wirel38 n2_bl_38 n2_bl_39 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer38 n2_br_38 n2_br_39 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj38 ground ground n2_bl_39 ground n2_br_39 ground vdd_selectedh ground memorycellh
X2wirel39 n2_bl_39 n2_bl_40 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer39 n2_br_39 n2_br_40 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj39 ground ground n2_bl_40 ground n2_br_40 ground vdd_selectedh ground memorycellh
X2wirel40 n2_bl_40 n2_bl_41 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer40 n2_br_40 n2_br_41 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj40 ground ground n2_bl_41 ground n2_br_41 ground vdd_selectedh ground memorycellh
X2wirel41 n2_bl_41 n2_bl_42 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer41 n2_br_41 n2_br_42 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj41 ground ground n2_bl_42 ground n2_br_42 ground vdd_selectedh ground memorycellh
X2wirel42 n2_bl_42 n2_bl_43 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer42 n2_br_42 n2_br_43 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj42 ground ground n2_bl_43 ground n2_br_43 ground vdd_selectedh ground memorycellh
X2wirel43 n2_bl_43 n2_bl_44 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer43 n2_br_43 n2_br_44 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj43 ground ground n2_bl_44 ground n2_br_44 ground vdd_selectedh ground memorycellh
X2wirel44 n2_bl_44 n2_bl_45 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer44 n2_br_44 n2_br_45 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj44 ground ground n2_bl_45 ground n2_br_45 ground vdd_selectedh ground memorycellh
X2wirel45 n2_bl_45 n2_bl_46 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer45 n2_br_45 n2_br_46 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj45 ground ground n2_bl_46 ground n2_br_46 ground vdd_selectedh ground memorycellh
X2wirel46 n2_bl_46 n2_bl_47 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer46 n2_br_46 n2_br_47 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj46 ground ground n2_bl_47 ground n2_br_47 ground vdd_selectedh ground memorycellh
X2wirel47 n2_bl_47 n2_bl_48 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer47 n2_br_47 n2_br_48 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj47 ground ground n2_bl_48 ground n2_br_48 ground vdd_selectedh ground memorycellh
X2wirel48 n2_bl_48 n2_bl_49 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer48 n2_br_48 n2_br_49 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj48 ground ground n2_bl_49 ground n2_br_49 ground vdd_selectedh ground memorycellh
X2wirel49 n2_bl_49 n2_bl_50 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer49 n2_br_49 n2_br_50 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj49 ground ground n2_bl_50 ground n2_br_50 ground vdd_selectedh ground memorycellh
X2wirel50 n2_bl_50 n2_bl_51 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer50 n2_br_50 n2_br_51 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj50 ground ground n2_bl_51 ground n2_br_51 ground vdd_selectedh ground memorycellh
X2wirel51 n2_bl_51 n2_bl_52 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer51 n2_br_51 n2_br_52 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj51 ground ground n2_bl_52 ground n2_br_52 ground vdd_selectedh ground memorycellh
X2wirel52 n2_bl_52 n2_bl_53 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer52 n2_br_52 n2_br_53 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj52 ground ground n2_bl_53 ground n2_br_53 ground vdd_selectedh ground memorycellh
X2wirel53 n2_bl_53 n2_bl_54 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer53 n2_br_53 n2_br_54 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj53 ground ground n2_bl_54 ground n2_br_54 ground vdd_selectedh ground memorycellh
X2wirel54 n2_bl_54 n2_bl_55 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer54 n2_br_54 n2_br_55 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj54 ground ground n2_bl_55 ground n2_br_55 ground vdd_selectedh ground memorycellh
X2wirel55 n2_bl_55 n2_bl_56 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer55 n2_br_55 n2_br_56 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj55 ground ground n2_bl_56 ground n2_br_56 ground vdd_selectedh ground memorycellh
X2wirel56 n2_bl_56 n2_bl_57 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer56 n2_br_56 n2_br_57 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj56 ground ground n2_bl_57 ground n2_br_57 ground vdd_selectedh ground memorycellh
X2wirel57 n2_bl_57 n2_bl_58 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer57 n2_br_57 n2_br_58 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj57 ground ground n2_bl_58 ground n2_br_58 ground vdd_selectedh ground memorycellh
X2wirel58 n2_bl_58 n2_bl_59 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer58 n2_br_58 n2_br_59 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj58 ground ground n2_bl_59 ground n2_br_59 ground vdd_selectedh ground memorycellh
X2wirel59 n2_bl_59 n2_bl_60 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer59 n2_br_59 n2_br_60 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj59 ground ground n2_bl_60 ground n2_br_60 ground vdd_selectedh ground memorycellh
X2wirel60 n2_bl_60 n2_bl_61 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer60 n2_br_60 n2_br_61 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj60 ground ground n2_bl_61 ground n2_br_61 ground vdd_selectedh ground memorycellh
X2wirel61 n2_bl_61 n2_bl_62 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer61 n2_br_61 n2_br_62 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj61 ground ground n2_bl_62 ground n2_br_62 ground vdd_selectedh ground memorycellh
X2wirel62 n2_bl_62 n2_bl_63 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer62 n2_br_62 n2_br_63 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj62 ground ground n2_bl_63 ground n2_br_63 ground vdd_selectedh ground memorycellh
X2wirel63 n2_bl_63 n2_bl_64 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer63 n2_br_63 n2_br_64 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj63 ground ground n2_bl_64 ground n2_br_64 ground vdd_selectedh ground memorycellh
X2wirel64 n2_bl_64 n2_bl_65 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer64 n2_br_64 n2_br_65 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj64 ground ground n2_bl_65 ground n2_br_65 ground vdd_selectedh ground memorycellh
X2wirel65 n2_bl_65 n2_bl_66 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer65 n2_br_65 n2_br_66 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj65 ground ground n2_bl_66 ground n2_br_66 ground vdd_selectedh ground memorycellh
X2wirel66 n2_bl_66 n2_bl_67 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer66 n2_br_66 n2_br_67 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj66 ground ground n2_bl_67 ground n2_br_67 ground vdd_selectedh ground memorycellh
X2wirel67 n2_bl_67 n2_bl_68 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer67 n2_br_67 n2_br_68 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj67 ground ground n2_bl_68 ground n2_br_68 ground vdd_selectedh ground memorycellh
X2wirel68 n2_bl_68 n2_bl_69 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer68 n2_br_68 n2_br_69 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj68 ground ground n2_bl_69 ground n2_br_69 ground vdd_selectedh ground memorycellh
X2wirel69 n2_bl_69 n2_bl_70 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer69 n2_br_69 n2_br_70 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj69 ground ground n2_bl_70 ground n2_br_70 ground vdd_selectedh ground memorycellh
X2wirel70 n2_bl_70 n2_bl_71 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer70 n2_br_70 n2_br_71 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj70 ground ground n2_bl_71 ground n2_br_71 ground vdd_selectedh ground memorycellh
X2wirel71 n2_bl_71 n2_bl_72 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer71 n2_br_71 n2_br_72 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj71 ground ground n2_bl_72 ground n2_br_72 ground vdd_selectedh ground memorycellh
X2wirel72 n2_bl_72 n2_bl_73 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer72 n2_br_72 n2_br_73 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj72 ground ground n2_bl_73 ground n2_br_73 ground vdd_selectedh ground memorycellh
X2wirel73 n2_bl_73 n2_bl_74 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer73 n2_br_73 n2_br_74 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj73 ground ground n2_bl_74 ground n2_br_74 ground vdd_selectedh ground memorycellh
X2wirel74 n2_bl_74 n2_bl_75 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer74 n2_br_74 n2_br_75 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj74 ground ground n2_bl_75 ground n2_br_75 ground vdd_selectedh ground memorycellh
X2wirel75 n2_bl_75 n2_bl_76 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer75 n2_br_75 n2_br_76 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj75 ground ground n2_bl_76 ground n2_br_76 ground vdd_selectedh ground memorycellh
X2wirel76 n2_bl_76 n2_bl_77 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer76 n2_br_76 n2_br_77 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj76 ground ground n2_bl_77 ground n2_br_77 ground vdd_selectedh ground memorycellh
X2wirel77 n2_bl_77 n2_bl_78 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer77 n2_br_77 n2_br_78 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj77 ground ground n2_bl_78 ground n2_br_78 ground vdd_selectedh ground memorycellh
X2wirel78 n2_bl_78 n2_bl_79 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer78 n2_br_78 n2_br_79 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj78 ground ground n2_bl_79 ground n2_br_79 ground vdd_selectedh ground memorycellh
X2wirel79 n2_bl_79 n2_bl_80 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer79 n2_br_79 n2_br_80 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj79 ground ground n2_bl_80 ground n2_br_80 ground vdd_selectedh ground memorycellh
X2wirel80 n2_bl_80 n2_bl_81 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer80 n2_br_80 n2_br_81 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj80 ground ground n2_bl_81 ground n2_br_81 ground vdd_selectedh ground memorycellh
X2wirel81 n2_bl_81 n2_bl_82 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer81 n2_br_81 n2_br_82 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj81 ground ground n2_bl_82 ground n2_br_82 ground vdd_selectedh ground memorycellh
X2wirel82 n2_bl_82 n2_bl_83 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer82 n2_br_82 n2_br_83 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj82 ground ground n2_bl_83 ground n2_br_83 ground vdd_selectedh ground memorycellh
X2wirel83 n2_bl_83 n2_bl_84 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer83 n2_br_83 n2_br_84 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj83 ground ground n2_bl_84 ground n2_br_84 ground vdd_selectedh ground memorycellh
X2wirel84 n2_bl_84 n2_bl_85 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer84 n2_br_84 n2_br_85 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj84 ground ground n2_bl_85 ground n2_br_85 ground vdd_selectedh ground memorycellh
X2wirel85 n2_bl_85 n2_bl_86 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer85 n2_br_85 n2_br_86 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj85 ground ground n2_bl_86 ground n2_br_86 ground vdd_selectedh ground memorycellh
X2wirel86 n2_bl_86 n2_bl_87 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer86 n2_br_86 n2_br_87 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj86 ground ground n2_bl_87 ground n2_br_87 ground vdd_selectedh ground memorycellh
X2wirel87 n2_bl_87 n2_bl_88 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer87 n2_br_87 n2_br_88 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj87 ground ground n2_bl_88 ground n2_br_88 ground vdd_selectedh ground memorycellh
X2wirel88 n2_bl_88 n2_bl_89 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer88 n2_br_88 n2_br_89 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj88 ground ground n2_bl_89 ground n2_br_89 ground vdd_selectedh ground memorycellh
X2wirel89 n2_bl_89 n2_bl_90 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer89 n2_br_89 n2_br_90 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj89 ground ground n2_bl_90 ground n2_br_90 ground vdd_selectedh ground memorycellh
X2wirel90 n2_bl_90 n2_bl_91 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer90 n2_br_90 n2_br_91 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj90 ground ground n2_bl_91 ground n2_br_91 ground vdd_selectedh ground memorycellh
X2wirel91 n2_bl_91 n2_bl_92 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer91 n2_br_91 n2_br_92 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj91 ground ground n2_bl_92 ground n2_br_92 ground vdd_selectedh ground memorycellh
X2wirel92 n2_bl_92 n2_bl_93 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer92 n2_br_92 n2_br_93 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj92 ground ground n2_bl_93 ground n2_br_93 ground vdd_selectedh ground memorycellh
X2wirel93 n2_bl_93 n2_bl_94 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer93 n2_br_93 n2_br_94 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj93 ground ground n2_bl_94 ground n2_br_94 ground vdd_selectedh ground memorycellh
X2wirel94 n2_bl_94 n2_bl_95 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer94 n2_br_94 n2_br_95 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj94 ground ground n2_bl_95 ground n2_br_95 ground vdd_selectedh ground memorycellh
X2wirel95 n2_bl_95 n2_bl_96 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer95 n2_br_95 n2_br_96 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj95 ground ground n2_bl_96 ground n2_br_96 ground vdd_selectedh ground memorycellh
X2wirel96 n2_bl_96 n2_bl_97 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer96 n2_br_96 n2_br_97 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj96 ground ground n2_bl_97 ground n2_br_97 ground vdd_selectedh ground memorycellh
X2wirel97 n2_bl_97 n2_bl_98 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer97 n2_br_97 n2_br_98 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj97 ground ground n2_bl_98 ground n2_br_98 ground vdd_selectedh ground memorycellh
X2wirel98 n2_bl_98 n2_bl_99 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer98 n2_br_98 n2_br_99 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj98 ground ground n2_bl_99 ground n2_br_99 ground vdd_selectedh ground memorycellh
X2wirel99 n2_bl_99 n2_bl_100 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer99 n2_br_99 n2_br_100 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj99 ground ground n2_bl_100 ground n2_br_100 ground vdd_selectedh ground memorycellh
X2wirel100 n2_bl_100 n2_bl_101 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer100 n2_br_100 n2_br_101 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj100 ground ground n2_bl_101 ground n2_br_101 ground vdd_selectedh ground memorycellh
X2wirel101 n2_bl_101 n2_bl_102 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer101 n2_br_101 n2_br_102 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj101 ground ground n2_bl_102 ground n2_br_102 ground vdd_selectedh ground memorycellh
X2wirel102 n2_bl_102 n2_bl_103 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer102 n2_br_102 n2_br_103 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj102 ground ground n2_bl_103 ground n2_br_103 ground vdd_selectedh ground memorycellh
X2wirel103 n2_bl_103 n2_bl_104 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer103 n2_br_103 n2_br_104 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj103 ground ground n2_bl_104 ground n2_br_104 ground vdd_selectedh ground memorycellh
X2wirel104 n2_bl_104 n2_bl_105 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer104 n2_br_104 n2_br_105 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj104 ground ground n2_bl_105 ground n2_br_105 ground vdd_selectedh ground memorycellh
X2wirel105 n2_bl_105 n2_bl_106 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer105 n2_br_105 n2_br_106 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj105 ground ground n2_bl_106 ground n2_br_106 ground vdd_selectedh ground memorycellh
X2wirel106 n2_bl_106 n2_bl_107 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer106 n2_br_106 n2_br_107 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj106 ground ground n2_bl_107 ground n2_br_107 ground vdd_selectedh ground memorycellh
X2wirel107 n2_bl_107 n2_bl_108 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer107 n2_br_107 n2_br_108 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj107 ground ground n2_bl_108 ground n2_br_108 ground vdd_selectedh ground memorycellh
X2wirel108 n2_bl_108 n2_bl_109 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer108 n2_br_108 n2_br_109 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj108 ground ground n2_bl_109 ground n2_br_109 ground vdd_selectedh ground memorycellh
X2wirel109 n2_bl_109 n2_bl_110 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer109 n2_br_109 n2_br_110 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj109 ground ground n2_bl_110 ground n2_br_110 ground vdd_selectedh ground memorycellh
X2wirel110 n2_bl_110 n2_bl_111 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer110 n2_br_110 n2_br_111 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj110 ground ground n2_bl_111 ground n2_br_111 ground vdd_selectedh ground memorycellh
X2wirel111 n2_bl_111 n2_bl_112 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer111 n2_br_111 n2_br_112 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj111 ground ground n2_bl_112 ground n2_br_112 ground vdd_selectedh ground memorycellh
X2wirel112 n2_bl_112 n2_bl_113 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer112 n2_br_112 n2_br_113 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj112 ground ground n2_bl_113 ground n2_br_113 ground vdd_selectedh ground memorycellh
X2wirel113 n2_bl_113 n2_bl_114 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer113 n2_br_113 n2_br_114 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj113 ground ground n2_bl_114 ground n2_br_114 ground vdd_selectedh ground memorycellh
X2wirel114 n2_bl_114 n2_bl_115 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer114 n2_br_114 n2_br_115 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj114 ground ground n2_bl_115 ground n2_br_115 ground vdd_selectedh ground memorycellh
X2wirel115 n2_bl_115 n2_bl_116 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer115 n2_br_115 n2_br_116 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj115 ground ground n2_bl_116 ground n2_br_116 ground vdd_selectedh ground memorycellh
X2wirel116 n2_bl_116 n2_bl_117 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer116 n2_br_116 n2_br_117 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj116 ground ground n2_bl_117 ground n2_br_117 ground vdd_selectedh ground memorycellh
X2wirel117 n2_bl_117 n2_bl_118 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer117 n2_br_117 n2_br_118 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj117 ground ground n2_bl_118 ground n2_br_118 ground vdd_selectedh ground memorycellh
X2wirel118 n2_bl_118 n2_bl_119 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer118 n2_br_118 n2_br_119 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj118 ground ground n2_bl_119 ground n2_br_119 ground vdd_selectedh ground memorycellh
X2wirel119 n2_bl_119 n2_bl_120 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer119 n2_br_119 n2_br_120 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj119 ground ground n2_bl_120 ground n2_br_120 ground vdd_selectedh ground memorycellh
X2wirel120 n2_bl_120 n2_bl_121 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer120 n2_br_120 n2_br_121 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj120 ground ground n2_bl_121 ground n2_br_121 ground vdd_selectedh ground memorycellh
X2wirel121 n2_bl_121 n2_bl_122 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer121 n2_br_121 n2_br_122 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj121 ground ground n2_bl_122 ground n2_br_122 ground vdd_selectedh ground memorycellh
X2wirel122 n2_bl_122 n2_bl_123 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer122 n2_br_122 n2_br_123 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj122 ground ground n2_bl_123 ground n2_br_123 ground vdd_selectedh ground memorycellh
X2wirel123 n2_bl_123 n2_bl_124 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer123 n2_br_123 n2_br_124 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj123 ground ground n2_bl_124 ground n2_br_124 ground vdd_selectedh ground memorycellh
X2wirel124 n2_bl_124 n2_bl_125 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer124 n2_br_124 n2_br_125 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj124 ground ground n2_bl_125 ground n2_br_125 ground vdd_selectedh ground memorycellh
X2wirel125 n2_bl_125 n2_bl_126 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer125 n2_br_125 n2_br_126 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj125 ground ground n2_bl_126 ground n2_br_126 ground vdd_selectedh ground memorycellh
X2wirel126 n2_bl_126 n2_bl_127 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer126 n2_br_126 n2_br_127 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj126 ground ground n2_bl_127 ground n2_br_127 ground vdd_selectedh ground memorycellh
X2wirel127 n2_bl_127 n2_bl_128 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer127 n2_br_127 n2_br_128 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj127 ground ground n2_bl_128 ground n2_br_128 ground vdd_selectedh ground memorycellh
X2wirel128 n2_bl_128 n2_bl_129 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer128 n2_br_128 n2_br_129 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj128 ground ground n2_bl_129 ground n2_br_129 ground vdd_selectedh ground memorycellh
X2wirel129 n2_bl_129 n2_bl_130 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer129 n2_br_129 n2_br_130 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj129 ground ground n2_bl_130 ground n2_br_130 ground vdd_selectedh ground memorycellh
X2wirel130 n2_bl_130 n2_bl_131 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer130 n2_br_130 n2_br_131 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj130 ground ground n2_bl_131 ground n2_br_131 ground vdd_selectedh ground memorycellh
X2wirel131 n2_bl_131 n2_bl_132 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer131 n2_br_131 n2_br_132 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj131 ground ground n2_bl_132 ground n2_br_132 ground vdd_selectedh ground memorycellh
X2wirel132 n2_bl_132 n2_bl_133 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer132 n2_br_132 n2_br_133 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj132 ground ground n2_bl_133 ground n2_br_133 ground vdd_selectedh ground memorycellh
X2wirel133 n2_bl_133 n2_bl_134 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer133 n2_br_133 n2_br_134 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj133 ground ground n2_bl_134 ground n2_br_134 ground vdd_selectedh ground memorycellh
X2wirel134 n2_bl_134 n2_bl_135 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer134 n2_br_134 n2_br_135 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj134 ground ground n2_bl_135 ground n2_br_135 ground vdd_selectedh ground memorycellh
X2wirel135 n2_bl_135 n2_bl_136 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer135 n2_br_135 n2_br_136 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj135 ground ground n2_bl_136 ground n2_br_136 ground vdd_selectedh ground memorycellh
X2wirel136 n2_bl_136 n2_bl_137 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer136 n2_br_136 n2_br_137 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj136 ground ground n2_bl_137 ground n2_br_137 ground vdd_selectedh ground memorycellh
X2wirel137 n2_bl_137 n2_bl_138 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer137 n2_br_137 n2_br_138 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj137 ground ground n2_bl_138 ground n2_br_138 ground vdd_selectedh ground memorycellh
X2wirel138 n2_bl_138 n2_bl_139 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer138 n2_br_138 n2_br_139 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj138 ground ground n2_bl_139 ground n2_br_139 ground vdd_selectedh ground memorycellh
X2wirel139 n2_bl_139 n2_bl_140 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer139 n2_br_139 n2_br_140 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj139 ground ground n2_bl_140 ground n2_br_140 ground vdd_selectedh ground memorycellh
X2wirel140 n2_bl_140 n2_bl_141 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer140 n2_br_140 n2_br_141 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj140 ground ground n2_bl_141 ground n2_br_141 ground vdd_selectedh ground memorycellh
X2wirel141 n2_bl_141 n2_bl_142 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer141 n2_br_141 n2_br_142 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj141 ground ground n2_bl_142 ground n2_br_142 ground vdd_selectedh ground memorycellh
X2wirel142 n2_bl_142 n2_bl_143 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer142 n2_br_142 n2_br_143 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj142 ground ground n2_bl_143 ground n2_br_143 ground vdd_selectedh ground memorycellh
X2wirel143 n2_bl_143 n2_bl_144 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer143 n2_br_143 n2_br_144 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj143 ground ground n2_bl_144 ground n2_br_144 ground vdd_selectedh ground memorycellh
X2wirel144 n2_bl_144 n2_bl_145 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer144 n2_br_144 n2_br_145 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj144 ground ground n2_bl_145 ground n2_br_145 ground vdd_selectedh ground memorycellh
X2wirel145 n2_bl_145 n2_bl_146 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer145 n2_br_145 n2_br_146 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj145 ground ground n2_bl_146 ground n2_br_146 ground vdd_selectedh ground memorycellh
X2wirel146 n2_bl_146 n2_bl_147 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer146 n2_br_146 n2_br_147 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj146 ground ground n2_bl_147 ground n2_br_147 ground vdd_selectedh ground memorycellh
X2wirel147 n2_bl_147 n2_bl_148 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer147 n2_br_147 n2_br_148 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj147 ground ground n2_bl_148 ground n2_br_148 ground vdd_selectedh ground memorycellh
X2wirel148 n2_bl_148 n2_bl_149 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer148 n2_br_148 n2_br_149 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj148 ground ground n2_bl_149 ground n2_br_149 ground vdd_selectedh ground memorycellh
X2wirel149 n2_bl_149 n2_bl_150 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer149 n2_br_149 n2_br_150 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj149 ground ground n2_bl_150 ground n2_br_150 ground vdd_selectedh ground memorycellh
X2wirel150 n2_bl_150 n2_bl_151 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer150 n2_br_150 n2_br_151 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj150 ground ground n2_bl_151 ground n2_br_151 ground vdd_selectedh ground memorycellh
X2wirel151 n2_bl_151 n2_bl_152 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer151 n2_br_151 n2_br_152 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj151 ground ground n2_bl_152 ground n2_br_152 ground vdd_selectedh ground memorycellh
X2wirel152 n2_bl_152 n2_bl_153 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer152 n2_br_152 n2_br_153 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj152 ground ground n2_bl_153 ground n2_br_153 ground vdd_selectedh ground memorycellh
X2wirel153 n2_bl_153 n2_bl_154 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer153 n2_br_153 n2_br_154 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj153 ground ground n2_bl_154 ground n2_br_154 ground vdd_selectedh ground memorycellh
X2wirel154 n2_bl_154 n2_bl_155 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer154 n2_br_154 n2_br_155 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj154 ground ground n2_bl_155 ground n2_br_155 ground vdd_selectedh ground memorycellh
X2wirel155 n2_bl_155 n2_bl_156 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer155 n2_br_155 n2_br_156 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj155 ground ground n2_bl_156 ground n2_br_156 ground vdd_selectedh ground memorycellh
X2wirel156 n2_bl_156 n2_bl_157 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer156 n2_br_156 n2_br_157 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj156 ground ground n2_bl_157 ground n2_br_157 ground vdd_selectedh ground memorycellh
X2wirel157 n2_bl_157 n2_bl_158 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer157 n2_br_157 n2_br_158 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj157 ground ground n2_bl_158 ground n2_br_158 ground vdd_selectedh ground memorycellh
X2wirel158 n2_bl_158 n2_bl_159 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer158 n2_br_158 n2_br_159 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj158 ground ground n2_bl_159 ground n2_br_159 ground vdd_selectedh ground memorycellh
X2wirel159 n2_bl_159 n2_bl_160 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer159 n2_br_159 n2_br_160 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj159 ground ground n2_bl_160 ground n2_br_160 ground vdd_selectedh ground memorycellh
X2wirel160 n2_bl_160 n2_bl_161 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer160 n2_br_160 n2_br_161 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj160 ground ground n2_bl_161 ground n2_br_161 ground vdd_selectedh ground memorycellh
X2wirel161 n2_bl_161 n2_bl_162 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer161 n2_br_161 n2_br_162 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj161 ground ground n2_bl_162 ground n2_br_162 ground vdd_selectedh ground memorycellh
X2wirel162 n2_bl_162 n2_bl_163 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer162 n2_br_162 n2_br_163 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj162 ground ground n2_bl_163 ground n2_br_163 ground vdd_selectedh ground memorycellh
X2wirel163 n2_bl_163 n2_bl_164 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer163 n2_br_163 n2_br_164 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj163 ground ground n2_bl_164 ground n2_br_164 ground vdd_selectedh ground memorycellh
X2wirel164 n2_bl_164 n2_bl_165 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer164 n2_br_164 n2_br_165 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj164 ground ground n2_bl_165 ground n2_br_165 ground vdd_selectedh ground memorycellh
X2wirel165 n2_bl_165 n2_bl_166 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer165 n2_br_165 n2_br_166 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj165 ground ground n2_bl_166 ground n2_br_166 ground vdd_selectedh ground memorycellh
X2wirel166 n2_bl_166 n2_bl_167 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer166 n2_br_166 n2_br_167 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj166 ground ground n2_bl_167 ground n2_br_167 ground vdd_selectedh ground memorycellh
X2wirel167 n2_bl_167 n2_bl_168 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer167 n2_br_167 n2_br_168 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj167 ground ground n2_bl_168 ground n2_br_168 ground vdd_selectedh ground memorycellh
X2wirel168 n2_bl_168 n2_bl_169 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer168 n2_br_168 n2_br_169 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj168 ground ground n2_bl_169 ground n2_br_169 ground vdd_selectedh ground memorycellh
X2wirel169 n2_bl_169 n2_bl_170 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer169 n2_br_169 n2_br_170 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj169 ground ground n2_bl_170 ground n2_br_170 ground vdd_selectedh ground memorycellh
X2wirel170 n2_bl_170 n2_bl_171 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer170 n2_br_170 n2_br_171 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj170 ground ground n2_bl_171 ground n2_br_171 ground vdd_selectedh ground memorycellh
X2wirel171 n2_bl_171 n2_bl_172 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer171 n2_br_171 n2_br_172 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj171 ground ground n2_bl_172 ground n2_br_172 ground vdd_selectedh ground memorycellh
X2wirel172 n2_bl_172 n2_bl_173 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer172 n2_br_172 n2_br_173 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj172 ground ground n2_bl_173 ground n2_br_173 ground vdd_selectedh ground memorycellh
X2wirel173 n2_bl_173 n2_bl_174 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer173 n2_br_173 n2_br_174 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj173 ground ground n2_bl_174 ground n2_br_174 ground vdd_selectedh ground memorycellh
X2wirel174 n2_bl_174 n2_bl_175 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer174 n2_br_174 n2_br_175 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj174 ground ground n2_bl_175 ground n2_br_175 ground vdd_selectedh ground memorycellh
X2wirel175 n2_bl_175 n2_bl_176 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer175 n2_br_175 n2_br_176 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj175 ground ground n2_bl_176 ground n2_br_176 ground vdd_selectedh ground memorycellh
X2wirel176 n2_bl_176 n2_bl_177 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer176 n2_br_176 n2_br_177 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj176 ground ground n2_bl_177 ground n2_br_177 ground vdd_selectedh ground memorycellh
X2wirel177 n2_bl_177 n2_bl_178 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer177 n2_br_177 n2_br_178 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj177 ground ground n2_bl_178 ground n2_br_178 ground vdd_selectedh ground memorycellh
X2wirel178 n2_bl_178 n2_bl_179 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer178 n2_br_178 n2_br_179 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj178 ground ground n2_bl_179 ground n2_br_179 ground vdd_selectedh ground memorycellh
X2wirel179 n2_bl_179 n2_bl_180 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer179 n2_br_179 n2_br_180 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj179 ground ground n2_bl_180 ground n2_br_180 ground vdd_selectedh ground memorycellh
X2wirel180 n2_bl_180 n2_bl_181 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer180 n2_br_180 n2_br_181 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj180 ground ground n2_bl_181 ground n2_br_181 ground vdd_selectedh ground memorycellh
X2wirel181 n2_bl_181 n2_bl_182 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer181 n2_br_181 n2_br_182 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj181 ground ground n2_bl_182 ground n2_br_182 ground vdd_selectedh ground memorycellh
X2wirel182 n2_bl_182 n2_bl_183 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer182 n2_br_182 n2_br_183 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj182 ground ground n2_bl_183 ground n2_br_183 ground vdd_selectedh ground memorycellh
X2wirel183 n2_bl_183 n2_bl_184 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer183 n2_br_183 n2_br_184 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj183 ground ground n2_bl_184 ground n2_br_184 ground vdd_selectedh ground memorycellh
X2wirel184 n2_bl_184 n2_bl_185 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer184 n2_br_184 n2_br_185 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj184 ground ground n2_bl_185 ground n2_br_185 ground vdd_selectedh ground memorycellh
X2wirel185 n2_bl_185 n2_bl_186 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer185 n2_br_185 n2_br_186 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj185 ground ground n2_bl_186 ground n2_br_186 ground vdd_selectedh ground memorycellh
X2wirel186 n2_bl_186 n2_bl_187 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer186 n2_br_186 n2_br_187 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj186 ground ground n2_bl_187 ground n2_br_187 ground vdd_selectedh ground memorycellh
X2wirel187 n2_bl_187 n2_bl_188 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer187 n2_br_187 n2_br_188 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj187 ground ground n2_bl_188 ground n2_br_188 ground vdd_selectedh ground memorycellh
X2wirel188 n2_bl_188 n2_bl_189 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer188 n2_br_188 n2_br_189 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj188 ground ground n2_bl_189 ground n2_br_189 ground vdd_selectedh ground memorycellh
X2wirel189 n2_bl_189 n2_bl_190 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer189 n2_br_189 n2_br_190 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj189 ground ground n2_bl_190 ground n2_br_190 ground vdd_selectedh ground memorycellh
X2wirel190 n2_bl_190 n2_bl_191 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer190 n2_br_190 n2_br_191 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj190 ground ground n2_bl_191 ground n2_br_191 ground vdd_selectedh ground memorycellh
X2wirel191 n2_bl_191 n2_bl_192 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer191 n2_br_191 n2_br_192 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj191 ground ground n2_bl_192 ground n2_br_192 ground vdd_selectedh ground memorycellh
X2wirel192 n2_bl_192 n2_bl_193 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer192 n2_br_192 n2_br_193 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj192 ground ground n2_bl_193 ground n2_br_193 ground vdd_selectedh ground memorycellh
X2wirel193 n2_bl_193 n2_bl_194 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer193 n2_br_193 n2_br_194 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj193 ground ground n2_bl_194 ground n2_br_194 ground vdd_selectedh ground memorycellh
X2wirel194 n2_bl_194 n2_bl_195 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer194 n2_br_194 n2_br_195 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj194 ground ground n2_bl_195 ground n2_br_195 ground vdd_selectedh ground memorycellh
X2wirel195 n2_bl_195 n2_bl_196 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer195 n2_br_195 n2_br_196 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj195 ground ground n2_bl_196 ground n2_br_196 ground vdd_selectedh ground memorycellh
X2wirel196 n2_bl_196 n2_bl_197 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer196 n2_br_196 n2_br_197 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj196 ground ground n2_bl_197 ground n2_br_197 ground vdd_selectedh ground memorycellh
X2wirel197 n2_bl_197 n2_bl_198 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer197 n2_br_197 n2_br_198 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj197 ground ground n2_bl_198 ground n2_br_198 ground vdd_selectedh ground memorycellh
X2wirel198 n2_bl_198 n2_bl_199 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer198 n2_br_198 n2_br_199 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj198 ground ground n2_bl_199 ground n2_br_199 ground vdd_selectedh ground memorycellh
X2wirel199 n2_bl_199 n2_bl_200 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer199 n2_br_199 n2_br_200 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj199 ground ground n2_bl_200 ground n2_br_200 ground vdd_selectedh ground memorycellh
X2wirel200 n2_bl_200 n2_bl_201 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer200 n2_br_200 n2_br_201 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj200 ground ground n2_bl_201 ground n2_br_201 ground vdd_selectedh ground memorycellh
X2wirel201 n2_bl_201 n2_bl_202 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer201 n2_br_201 n2_br_202 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj201 ground ground n2_bl_202 ground n2_br_202 ground vdd_selectedh ground memorycellh
X2wirel202 n2_bl_202 n2_bl_203 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer202 n2_br_202 n2_br_203 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj202 ground ground n2_bl_203 ground n2_br_203 ground vdd_selectedh ground memorycellh
X2wirel203 n2_bl_203 n2_bl_204 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer203 n2_br_203 n2_br_204 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj203 ground ground n2_bl_204 ground n2_br_204 ground vdd_selectedh ground memorycellh
X2wirel204 n2_bl_204 n2_bl_205 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer204 n2_br_204 n2_br_205 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj204 ground ground n2_bl_205 ground n2_br_205 ground vdd_selectedh ground memorycellh
X2wirel205 n2_bl_205 n2_bl_206 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer205 n2_br_205 n2_br_206 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj205 ground ground n2_bl_206 ground n2_br_206 ground vdd_selectedh ground memorycellh
X2wirel206 n2_bl_206 n2_bl_207 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer206 n2_br_206 n2_br_207 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj206 ground ground n2_bl_207 ground n2_br_207 ground vdd_selectedh ground memorycellh
X2wirel207 n2_bl_207 n2_bl_208 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer207 n2_br_207 n2_br_208 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj207 ground ground n2_bl_208 ground n2_br_208 ground vdd_selectedh ground memorycellh
X2wirel208 n2_bl_208 n2_bl_209 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer208 n2_br_208 n2_br_209 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj208 ground ground n2_bl_209 ground n2_br_209 ground vdd_selectedh ground memorycellh
X2wirel209 n2_bl_209 n2_bl_210 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer209 n2_br_209 n2_br_210 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj209 ground ground n2_bl_210 ground n2_br_210 ground vdd_selectedh ground memorycellh
X2wirel210 n2_bl_210 n2_bl_211 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer210 n2_br_210 n2_br_211 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj210 ground ground n2_bl_211 ground n2_br_211 ground vdd_selectedh ground memorycellh
X2wirel211 n2_bl_211 n2_bl_212 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer211 n2_br_211 n2_br_212 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj211 ground ground n2_bl_212 ground n2_br_212 ground vdd_selectedh ground memorycellh
X2wirel212 n2_bl_212 n2_bl_213 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer212 n2_br_212 n2_br_213 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj212 ground ground n2_bl_213 ground n2_br_213 ground vdd_selectedh ground memorycellh
X2wirel213 n2_bl_213 n2_bl_214 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer213 n2_br_213 n2_br_214 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj213 ground ground n2_bl_214 ground n2_br_214 ground vdd_selectedh ground memorycellh
X2wirel214 n2_bl_214 n2_bl_215 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer214 n2_br_214 n2_br_215 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj214 ground ground n2_bl_215 ground n2_br_215 ground vdd_selectedh ground memorycellh
X2wirel215 n2_bl_215 n2_bl_216 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer215 n2_br_215 n2_br_216 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj215 ground ground n2_bl_216 ground n2_br_216 ground vdd_selectedh ground memorycellh
X2wirel216 n2_bl_216 n2_bl_217 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer216 n2_br_216 n2_br_217 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj216 ground ground n2_bl_217 ground n2_br_217 ground vdd_selectedh ground memorycellh
X2wirel217 n2_bl_217 n2_bl_218 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer217 n2_br_217 n2_br_218 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj217 ground ground n2_bl_218 ground n2_br_218 ground vdd_selectedh ground memorycellh
X2wirel218 n2_bl_218 n2_bl_219 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer218 n2_br_218 n2_br_219 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj218 ground ground n2_bl_219 ground n2_br_219 ground vdd_selectedh ground memorycellh
X2wirel219 n2_bl_219 n2_bl_220 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer219 n2_br_219 n2_br_220 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj219 ground ground n2_bl_220 ground n2_br_220 ground vdd_selectedh ground memorycellh
X2wirel220 n2_bl_220 n2_bl_221 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer220 n2_br_220 n2_br_221 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj220 ground ground n2_bl_221 ground n2_br_221 ground vdd_selectedh ground memorycellh
X2wirel221 n2_bl_221 n2_bl_222 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer221 n2_br_221 n2_br_222 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj221 ground ground n2_bl_222 ground n2_br_222 ground vdd_selectedh ground memorycellh
X2wirel222 n2_bl_222 n2_bl_223 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer222 n2_br_222 n2_br_223 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj222 ground ground n2_bl_223 ground n2_br_223 ground vdd_selectedh ground memorycellh
X2wirel223 n2_bl_223 n2_bl_224 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer223 n2_br_223 n2_br_224 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj223 ground ground n2_bl_224 ground n2_br_224 ground vdd_selectedh ground memorycellh
X2wirel224 n2_bl_224 n2_bl_225 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer224 n2_br_224 n2_br_225 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj224 ground ground n2_bl_225 ground n2_br_225 ground vdd_selectedh ground memorycellh
X2wirel225 n2_bl_225 n2_bl_226 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer225 n2_br_225 n2_br_226 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj225 ground ground n2_bl_226 ground n2_br_226 ground vdd_selectedh ground memorycellh
X2wirel226 n2_bl_226 n2_bl_227 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer226 n2_br_226 n2_br_227 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj226 ground ground n2_bl_227 ground n2_br_227 ground vdd_selectedh ground memorycellh
X2wirel227 n2_bl_227 n2_bl_228 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer227 n2_br_227 n2_br_228 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj227 ground ground n2_bl_228 ground n2_br_228 ground vdd_selectedh ground memorycellh
X2wirel228 n2_bl_228 n2_bl_229 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer228 n2_br_228 n2_br_229 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj228 ground ground n2_bl_229 ground n2_br_229 ground vdd_selectedh ground memorycellh
X2wirel229 n2_bl_229 n2_bl_230 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer229 n2_br_229 n2_br_230 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj229 ground ground n2_bl_230 ground n2_br_230 ground vdd_selectedh ground memorycellh
X2wirel230 n2_bl_230 n2_bl_231 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer230 n2_br_230 n2_br_231 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj230 ground ground n2_bl_231 ground n2_br_231 ground vdd_selectedh ground memorycellh
X2wirel231 n2_bl_231 n2_bl_232 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer231 n2_br_231 n2_br_232 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj231 ground ground n2_bl_232 ground n2_br_232 ground vdd_selectedh ground memorycellh
X2wirel232 n2_bl_232 n2_bl_233 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer232 n2_br_232 n2_br_233 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj232 ground ground n2_bl_233 ground n2_br_233 ground vdd_selectedh ground memorycellh
X2wirel233 n2_bl_233 n2_bl_234 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer233 n2_br_233 n2_br_234 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj233 ground ground n2_bl_234 ground n2_br_234 ground vdd_selectedh ground memorycellh
X2wirel234 n2_bl_234 n2_bl_235 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer234 n2_br_234 n2_br_235 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj234 ground ground n2_bl_235 ground n2_br_235 ground vdd_selectedh ground memorycellh
X2wirel235 n2_bl_235 n2_bl_236 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer235 n2_br_235 n2_br_236 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj235 ground ground n2_bl_236 ground n2_br_236 ground vdd_selectedh ground memorycellh
X2wirel236 n2_bl_236 n2_bl_237 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer236 n2_br_236 n2_br_237 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj236 ground ground n2_bl_237 ground n2_br_237 ground vdd_selectedh ground memorycellh
X2wirel237 n2_bl_237 n2_bl_238 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer237 n2_br_237 n2_br_238 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj237 ground ground n2_bl_238 ground n2_br_238 ground vdd_selectedh ground memorycellh
X2wirel238 n2_bl_238 n2_bl_239 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer238 n2_br_238 n2_br_239 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj238 ground ground n2_bl_239 ground n2_br_239 ground vdd_selectedh ground memorycellh
X2wirel239 n2_bl_239 n2_bl_240 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer239 n2_br_239 n2_br_240 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj239 ground ground n2_bl_240 ground n2_br_240 ground vdd_selectedh ground memorycellh
X2wirel240 n2_bl_240 n2_bl_241 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer240 n2_br_240 n2_br_241 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj240 ground ground n2_bl_241 ground n2_br_241 ground vdd_selectedh ground memorycellh
X2wirel241 n2_bl_241 n2_bl_242 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer241 n2_br_241 n2_br_242 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj241 ground ground n2_bl_242 ground n2_br_242 ground vdd_selectedh ground memorycellh
X2wirel242 n2_bl_242 n2_bl_243 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer242 n2_br_242 n2_br_243 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj242 ground ground n2_bl_243 ground n2_br_243 ground vdd_selectedh ground memorycellh
X2wirel243 n2_bl_243 n2_bl_244 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer243 n2_br_243 n2_br_244 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj243 ground ground n2_bl_244 ground n2_br_244 ground vdd_selectedh ground memorycellh
X2wirel244 n2_bl_244 n2_bl_245 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer244 n2_br_244 n2_br_245 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj244 ground ground n2_bl_245 ground n2_br_245 ground vdd_selectedh ground memorycellh
X2wirel245 n2_bl_245 n2_bl_246 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer245 n2_br_245 n2_br_246 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj245 ground ground n2_bl_246 ground n2_br_246 ground vdd_selectedh ground memorycellh
X2wirel246 n2_bl_246 n2_bl_247 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer246 n2_br_246 n2_br_247 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj246 ground ground n2_bl_247 ground n2_br_247 ground vdd_selectedh ground memorycellh
X2wirel247 n2_bl_247 n2_bl_248 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer247 n2_br_247 n2_br_248 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj247 ground ground n2_bl_248 ground n2_br_248 ground vdd_selectedh ground memorycellh
X2wirel248 n2_bl_248 n2_bl_249 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer248 n2_br_248 n2_br_249 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj248 ground ground n2_bl_249 ground n2_br_249 ground vdd_selectedh ground memorycellh
X2wirel249 n2_bl_249 n2_bl_250 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer249 n2_br_249 n2_br_250 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj249 ground ground n2_bl_250 ground n2_br_250 ground vdd_selectedh ground memorycellh
X2wirel250 n2_bl_250 n2_bl_251 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer250 n2_br_250 n2_br_251 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj250 ground ground n2_bl_251 ground n2_br_251 ground vdd_selectedh ground memorycellh
X2wirel251 n2_bl_251 n2_bl_252 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer251 n2_br_251 n2_br_252 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj251 ground ground n2_bl_252 ground n2_br_252 ground vdd_selectedh ground memorycellh
X2wirel252 n2_bl_252 n2_bl_253 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer252 n2_br_252 n2_br_253 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj252 ground ground n2_bl_253 ground n2_br_253 ground vdd_selectedh ground memorycellh
X2wirel253 n2_bl_253 n2_bl_254 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer253 n2_br_253 n2_br_254 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj253 ground ground n2_bl_254 ground n2_br_254 ground vdd_selectedh ground memorycellh
X2wirel254 n2_bl_254 n2_bl_255 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer254 n2_br_254 n2_br_255 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj254 ground ground n2_bl_255 ground n2_br_255 ground vdd_selectedh ground memorycellh
X2wirel255 n2_bl_255 n2_bl_256 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer255 n2_br_255 n2_br_256 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj255 ground ground n2_bl_256 ground n2_br_256 ground vdd_selectedh ground memorycellh
X2wirel256 n2_bl_256 n2_bl_257 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer256 n2_br_256 n2_br_257 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj256 ground ground n2_bl_257 ground n2_br_257 ground vdd_selectedh ground memorycellh
X2wirel257 n2_bl_257 n2_bl_258 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer257 n2_br_257 n2_br_258 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj257 ground ground n2_bl_258 ground n2_br_258 ground vdd_selectedh ground memorycellh
X2wirel258 n2_bl_258 n2_bl_259 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer258 n2_br_258 n2_br_259 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj258 ground ground n2_bl_259 ground n2_br_259 ground vdd_selectedh ground memorycellh
X2wirel259 n2_bl_259 n2_bl_260 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer259 n2_br_259 n2_br_260 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj259 ground ground n2_bl_260 ground n2_br_260 ground vdd_selectedh ground memorycellh
X2wirel260 n2_bl_260 n2_bl_261 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer260 n2_br_260 n2_br_261 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj260 ground ground n2_bl_261 ground n2_br_261 ground vdd_selectedh ground memorycellh
X2wirel261 n2_bl_261 n2_bl_262 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer261 n2_br_261 n2_br_262 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj261 ground ground n2_bl_262 ground n2_br_262 ground vdd_selectedh ground memorycellh
X2wirel262 n2_bl_262 n2_bl_263 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer262 n2_br_262 n2_br_263 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj262 ground ground n2_bl_263 ground n2_br_263 ground vdd_selectedh ground memorycellh
X2wirel263 n2_bl_263 n2_bl_264 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer263 n2_br_263 n2_br_264 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj263 ground ground n2_bl_264 ground n2_br_264 ground vdd_selectedh ground memorycellh
X2wirel264 n2_bl_264 n2_bl_265 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer264 n2_br_264 n2_br_265 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj264 ground ground n2_bl_265 ground n2_br_265 ground vdd_selectedh ground memorycellh
X2wirel265 n2_bl_265 n2_bl_266 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer265 n2_br_265 n2_br_266 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj265 ground ground n2_bl_266 ground n2_br_266 ground vdd_selectedh ground memorycellh
X2wirel266 n2_bl_266 n2_bl_267 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer266 n2_br_266 n2_br_267 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj266 ground ground n2_bl_267 ground n2_br_267 ground vdd_selectedh ground memorycellh
X2wirel267 n2_bl_267 n2_bl_268 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer267 n2_br_267 n2_br_268 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj267 ground ground n2_bl_268 ground n2_br_268 ground vdd_selectedh ground memorycellh
X2wirel268 n2_bl_268 n2_bl_269 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer268 n2_br_268 n2_br_269 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj268 ground ground n2_bl_269 ground n2_br_269 ground vdd_selectedh ground memorycellh
X2wirel269 n2_bl_269 n2_bl_270 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer269 n2_br_269 n2_br_270 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj269 ground ground n2_bl_270 ground n2_br_270 ground vdd_selectedh ground memorycellh
X2wirel270 n2_bl_270 n2_bl_271 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer270 n2_br_270 n2_br_271 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj270 ground ground n2_bl_271 ground n2_br_271 ground vdd_selectedh ground memorycellh
X2wirel271 n2_bl_271 n2_bl_272 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer271 n2_br_271 n2_br_272 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj271 ground ground n2_bl_272 ground n2_br_272 ground vdd_selectedh ground memorycellh
X2wirel272 n2_bl_272 n2_bl_273 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer272 n2_br_272 n2_br_273 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj272 ground ground n2_bl_273 ground n2_br_273 ground vdd_selectedh ground memorycellh
X2wirel273 n2_bl_273 n2_bl_274 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer273 n2_br_273 n2_br_274 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj273 ground ground n2_bl_274 ground n2_br_274 ground vdd_selectedh ground memorycellh
X2wirel274 n2_bl_274 n2_bl_275 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer274 n2_br_274 n2_br_275 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj274 ground ground n2_bl_275 ground n2_br_275 ground vdd_selectedh ground memorycellh
X2wirel275 n2_bl_275 n2_bl_276 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer275 n2_br_275 n2_br_276 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj275 ground ground n2_bl_276 ground n2_br_276 ground vdd_selectedh ground memorycellh
X2wirel276 n2_bl_276 n2_bl_277 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer276 n2_br_276 n2_br_277 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj276 ground ground n2_bl_277 ground n2_br_277 ground vdd_selectedh ground memorycellh
X2wirel277 n2_bl_277 n2_bl_278 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer277 n2_br_277 n2_br_278 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj277 ground ground n2_bl_278 ground n2_br_278 ground vdd_selectedh ground memorycellh
X2wirel278 n2_bl_278 n2_bl_279 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer278 n2_br_278 n2_br_279 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj278 ground ground n2_bl_279 ground n2_br_279 ground vdd_selectedh ground memorycellh
X2wirel279 n2_bl_279 n2_bl_280 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer279 n2_br_279 n2_br_280 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj279 ground ground n2_bl_280 ground n2_br_280 ground vdd_selectedh ground memorycellh
X2wirel280 n2_bl_280 n2_bl_281 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer280 n2_br_280 n2_br_281 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj280 ground ground n2_bl_281 ground n2_br_281 ground vdd_selectedh ground memorycellh
X2wirel281 n2_bl_281 n2_bl_282 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer281 n2_br_281 n2_br_282 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj281 ground ground n2_bl_282 ground n2_br_282 ground vdd_selectedh ground memorycellh
X2wirel282 n2_bl_282 n2_bl_283 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer282 n2_br_282 n2_br_283 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj282 ground ground n2_bl_283 ground n2_br_283 ground vdd_selectedh ground memorycellh
X2wirel283 n2_bl_283 n2_bl_284 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer283 n2_br_283 n2_br_284 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj283 ground ground n2_bl_284 ground n2_br_284 ground vdd_selectedh ground memorycellh
X2wirel284 n2_bl_284 n2_bl_285 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer284 n2_br_284 n2_br_285 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj284 ground ground n2_bl_285 ground n2_br_285 ground vdd_selectedh ground memorycellh
X2wirel285 n2_bl_285 n2_bl_286 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer285 n2_br_285 n2_br_286 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj285 ground ground n2_bl_286 ground n2_br_286 ground vdd_selectedh ground memorycellh
X2wirel286 n2_bl_286 n2_bl_287 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer286 n2_br_286 n2_br_287 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj286 ground ground n2_bl_287 ground n2_br_287 ground vdd_selectedh ground memorycellh
X2wirel287 n2_bl_287 n2_bl_288 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer287 n2_br_287 n2_br_288 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj287 ground ground n2_bl_288 ground n2_br_288 ground vdd_selectedh ground memorycellh
X2wirel288 n2_bl_288 n2_bl_289 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer288 n2_br_288 n2_br_289 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj288 ground ground n2_bl_289 ground n2_br_289 ground vdd_selectedh ground memorycellh
X2wirel289 n2_bl_289 n2_bl_290 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer289 n2_br_289 n2_br_290 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj289 ground ground n2_bl_290 ground n2_br_290 ground vdd_selectedh ground memorycellh
X2wirel290 n2_bl_290 n2_bl_291 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer290 n2_br_290 n2_br_291 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj290 ground ground n2_bl_291 ground n2_br_291 ground vdd_selectedh ground memorycellh
X2wirel291 n2_bl_291 n2_bl_292 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer291 n2_br_291 n2_br_292 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj291 ground ground n2_bl_292 ground n2_br_292 ground vdd_selectedh ground memorycellh
X2wirel292 n2_bl_292 n2_bl_293 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer292 n2_br_292 n2_br_293 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj292 ground ground n2_bl_293 ground n2_br_293 ground vdd_selectedh ground memorycellh
X2wirel293 n2_bl_293 n2_bl_294 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer293 n2_br_293 n2_br_294 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj293 ground ground n2_bl_294 ground n2_br_294 ground vdd_selectedh ground memorycellh
X2wirel294 n2_bl_294 n2_bl_295 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer294 n2_br_294 n2_br_295 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj294 ground ground n2_bl_295 ground n2_br_295 ground vdd_selectedh ground memorycellh
X2wirel295 n2_bl_295 n2_bl_296 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer295 n2_br_295 n2_br_296 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj295 ground ground n2_bl_296 ground n2_br_296 ground vdd_selectedh ground memorycellh
X2wirel296 n2_bl_296 n2_bl_297 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer296 n2_br_296 n2_br_297 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj296 ground ground n2_bl_297 ground n2_br_297 ground vdd_selectedh ground memorycellh
X2wirel297 n2_bl_297 n2_bl_298 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer297 n2_br_297 n2_br_298 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj297 ground ground n2_bl_298 ground n2_br_298 ground vdd_selectedh ground memorycellh
X2wirel298 n2_bl_298 n2_bl_299 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer298 n2_br_298 n2_br_299 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj298 ground ground n2_bl_299 ground n2_br_299 ground vdd_selectedh ground memorycellh
X2wirel299 n2_bl_299 n2_bl_300 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer299 n2_br_299 n2_br_300 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj299 ground ground n2_bl_300 ground n2_br_300 ground vdd_selectedh ground memorycellh
X2wirel300 n2_bl_300 n2_bl_301 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer300 n2_br_300 n2_br_301 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj300 ground ground n2_bl_301 ground n2_br_301 ground vdd_selectedh ground memorycellh
X2wirel301 n2_bl_301 n2_bl_302 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer301 n2_br_301 n2_br_302 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj301 ground ground n2_bl_302 ground n2_br_302 ground vdd_selectedh ground memorycellh
X2wirel302 n2_bl_302 n2_bl_303 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer302 n2_br_302 n2_br_303 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj302 ground ground n2_bl_303 ground n2_br_303 ground vdd_selectedh ground memorycellh
X2wirel303 n2_bl_303 n2_bl_304 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer303 n2_br_303 n2_br_304 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj303 ground ground n2_bl_304 ground n2_br_304 ground vdd_selectedh ground memorycellh
X2wirel304 n2_bl_304 n2_bl_305 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer304 n2_br_304 n2_br_305 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj304 ground ground n2_bl_305 ground n2_br_305 ground vdd_selectedh ground memorycellh
X2wirel305 n2_bl_305 n2_bl_306 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer305 n2_br_305 n2_br_306 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj305 ground ground n2_bl_306 ground n2_br_306 ground vdd_selectedh ground memorycellh
X2wirel306 n2_bl_306 n2_bl_307 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer306 n2_br_306 n2_br_307 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj306 ground ground n2_bl_307 ground n2_br_307 ground vdd_selectedh ground memorycellh
X2wirel307 n2_bl_307 n2_bl_308 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer307 n2_br_307 n2_br_308 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj307 ground ground n2_bl_308 ground n2_br_308 ground vdd_selectedh ground memorycellh
X2wirel308 n2_bl_308 n2_bl_309 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer308 n2_br_308 n2_br_309 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj308 ground ground n2_bl_309 ground n2_br_309 ground vdd_selectedh ground memorycellh
X2wirel309 n2_bl_309 n2_bl_310 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer309 n2_br_309 n2_br_310 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj309 ground ground n2_bl_310 ground n2_br_310 ground vdd_selectedh ground memorycellh
X2wirel310 n2_bl_310 n2_bl_311 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer310 n2_br_310 n2_br_311 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj310 ground ground n2_bl_311 ground n2_br_311 ground vdd_selectedh ground memorycellh
X2wirel311 n2_bl_311 n2_bl_312 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer311 n2_br_311 n2_br_312 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj311 ground ground n2_bl_312 ground n2_br_312 ground vdd_selectedh ground memorycellh
X2wirel312 n2_bl_312 n2_bl_313 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer312 n2_br_312 n2_br_313 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj312 ground ground n2_bl_313 ground n2_br_313 ground vdd_selectedh ground memorycellh
X2wirel313 n2_bl_313 n2_bl_314 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer313 n2_br_313 n2_br_314 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj313 ground ground n2_bl_314 ground n2_br_314 ground vdd_selectedh ground memorycellh
X2wirel314 n2_bl_314 n2_bl_315 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer314 n2_br_314 n2_br_315 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj314 ground ground n2_bl_315 ground n2_br_315 ground vdd_selectedh ground memorycellh
X2wirel315 n2_bl_315 n2_bl_316 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer315 n2_br_315 n2_br_316 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj315 ground ground n2_bl_316 ground n2_br_316 ground vdd_selectedh ground memorycellh
X2wirel316 n2_bl_316 n2_bl_317 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer316 n2_br_316 n2_br_317 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj316 ground ground n2_bl_317 ground n2_br_317 ground vdd_selectedh ground memorycellh
X2wirel317 n2_bl_317 n2_bl_318 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer317 n2_br_317 n2_br_318 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj317 ground ground n2_bl_318 ground n2_br_318 ground vdd_selectedh ground memorycellh
X2wirel318 n2_bl_318 n2_bl_319 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer318 n2_br_318 n2_br_319 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj318 ground ground n2_bl_319 ground n2_br_319 ground vdd_selectedh ground memorycellh
X2wirel319 n2_bl_319 n2_bl_320 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer319 n2_br_319 n2_br_320 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj319 ground ground n2_bl_320 ground n2_br_320 ground vdd_selectedh ground memorycellh
X2wirel320 n2_bl_320 n2_bl_321 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer320 n2_br_320 n2_br_321 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj320 ground ground n2_bl_321 ground n2_br_321 ground vdd_selectedh ground memorycellh
X2wirel321 n2_bl_321 n2_bl_322 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer321 n2_br_321 n2_br_322 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj321 ground ground n2_bl_322 ground n2_br_322 ground vdd_selectedh ground memorycellh
X2wirel322 n2_bl_322 n2_bl_323 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer322 n2_br_322 n2_br_323 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj322 ground ground n2_bl_323 ground n2_br_323 ground vdd_selectedh ground memorycellh
X2wirel323 n2_bl_323 n2_bl_324 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer323 n2_br_323 n2_br_324 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj323 ground ground n2_bl_324 ground n2_br_324 ground vdd_selectedh ground memorycellh
X2wirel324 n2_bl_324 n2_bl_325 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer324 n2_br_324 n2_br_325 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj324 ground ground n2_bl_325 ground n2_br_325 ground vdd_selectedh ground memorycellh
X2wirel325 n2_bl_325 n2_bl_326 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer325 n2_br_325 n2_br_326 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj325 ground ground n2_bl_326 ground n2_br_326 ground vdd_selectedh ground memorycellh
X2wirel326 n2_bl_326 n2_bl_327 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer326 n2_br_326 n2_br_327 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj326 ground ground n2_bl_327 ground n2_br_327 ground vdd_selectedh ground memorycellh
X2wirel327 n2_bl_327 n2_bl_328 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer327 n2_br_327 n2_br_328 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj327 ground ground n2_bl_328 ground n2_br_328 ground vdd_selectedh ground memorycellh
X2wirel328 n2_bl_328 n2_bl_329 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer328 n2_br_328 n2_br_329 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj328 ground ground n2_bl_329 ground n2_br_329 ground vdd_selectedh ground memorycellh
X2wirel329 n2_bl_329 n2_bl_330 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer329 n2_br_329 n2_br_330 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj329 ground ground n2_bl_330 ground n2_br_330 ground vdd_selectedh ground memorycellh
X2wirel330 n2_bl_330 n2_bl_331 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer330 n2_br_330 n2_br_331 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj330 ground ground n2_bl_331 ground n2_br_331 ground vdd_selectedh ground memorycellh
X2wirel331 n2_bl_331 n2_bl_332 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer331 n2_br_331 n2_br_332 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj331 ground ground n2_bl_332 ground n2_br_332 ground vdd_selectedh ground memorycellh
X2wirel332 n2_bl_332 n2_bl_333 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer332 n2_br_332 n2_br_333 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj332 ground ground n2_bl_333 ground n2_br_333 ground vdd_selectedh ground memorycellh
X2wirel333 n2_bl_333 n2_bl_334 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer333 n2_br_333 n2_br_334 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj333 ground ground n2_bl_334 ground n2_br_334 ground vdd_selectedh ground memorycellh
X2wirel334 n2_bl_334 n2_bl_335 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer334 n2_br_334 n2_br_335 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj334 ground ground n2_bl_335 ground n2_br_335 ground vdd_selectedh ground memorycellh
X2wirel335 n2_bl_335 n2_bl_336 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer335 n2_br_335 n2_br_336 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj335 ground ground n2_bl_336 ground n2_br_336 ground vdd_selectedh ground memorycellh
X2wirel336 n2_bl_336 n2_bl_337 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer336 n2_br_336 n2_br_337 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj336 ground ground n2_bl_337 ground n2_br_337 ground vdd_selectedh ground memorycellh
X2wirel337 n2_bl_337 n2_bl_338 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer337 n2_br_337 n2_br_338 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj337 ground ground n2_bl_338 ground n2_br_338 ground vdd_selectedh ground memorycellh
X2wirel338 n2_bl_338 n2_bl_339 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer338 n2_br_338 n2_br_339 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj338 ground ground n2_bl_339 ground n2_br_339 ground vdd_selectedh ground memorycellh
X2wirel339 n2_bl_339 n2_bl_340 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer339 n2_br_339 n2_br_340 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj339 ground ground n2_bl_340 ground n2_br_340 ground vdd_selectedh ground memorycellh
X2wirel340 n2_bl_340 n2_bl_341 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer340 n2_br_340 n2_br_341 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj340 ground ground n2_bl_341 ground n2_br_341 ground vdd_selectedh ground memorycellh
X2wirel341 n2_bl_341 n2_bl_342 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer341 n2_br_341 n2_br_342 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj341 ground ground n2_bl_342 ground n2_br_342 ground vdd_selectedh ground memorycellh
X2wirel342 n2_bl_342 n2_bl_343 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer342 n2_br_342 n2_br_343 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj342 ground ground n2_bl_343 ground n2_br_343 ground vdd_selectedh ground memorycellh
X2wirel343 n2_bl_343 n2_bl_344 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer343 n2_br_343 n2_br_344 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj343 ground ground n2_bl_344 ground n2_br_344 ground vdd_selectedh ground memorycellh
X2wirel344 n2_bl_344 n2_bl_345 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer344 n2_br_344 n2_br_345 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj344 ground ground n2_bl_345 ground n2_br_345 ground vdd_selectedh ground memorycellh
X2wirel345 n2_bl_345 n2_bl_346 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer345 n2_br_345 n2_br_346 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj345 ground ground n2_bl_346 ground n2_br_346 ground vdd_selectedh ground memorycellh
X2wirel346 n2_bl_346 n2_bl_347 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer346 n2_br_346 n2_br_347 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj346 ground ground n2_bl_347 ground n2_br_347 ground vdd_selectedh ground memorycellh
X2wirel347 n2_bl_347 n2_bl_348 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer347 n2_br_347 n2_br_348 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj347 ground ground n2_bl_348 ground n2_br_348 ground vdd_selectedh ground memorycellh
X2wirel348 n2_bl_348 n2_bl_349 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer348 n2_br_348 n2_br_349 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj348 ground ground n2_bl_349 ground n2_br_349 ground vdd_selectedh ground memorycellh
X2wirel349 n2_bl_349 n2_bl_350 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer349 n2_br_349 n2_br_350 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj349 ground ground n2_bl_350 ground n2_br_350 ground vdd_selectedh ground memorycellh
X2wirel350 n2_bl_350 n2_bl_351 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer350 n2_br_350 n2_br_351 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj350 ground ground n2_bl_351 ground n2_br_351 ground vdd_selectedh ground memorycellh
X2wirel351 n2_bl_351 n2_bl_352 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer351 n2_br_351 n2_br_352 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj351 ground ground n2_bl_352 ground n2_br_352 ground vdd_selectedh ground memorycellh
X2wirel352 n2_bl_352 n2_bl_353 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer352 n2_br_352 n2_br_353 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj352 ground ground n2_bl_353 ground n2_br_353 ground vdd_selectedh ground memorycellh
X2wirel353 n2_bl_353 n2_bl_354 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer353 n2_br_353 n2_br_354 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj353 ground ground n2_bl_354 ground n2_br_354 ground vdd_selectedh ground memorycellh
X2wirel354 n2_bl_354 n2_bl_355 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer354 n2_br_354 n2_br_355 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj354 ground ground n2_bl_355 ground n2_br_355 ground vdd_selectedh ground memorycellh
X2wirel355 n2_bl_355 n2_bl_356 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer355 n2_br_355 n2_br_356 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj355 ground ground n2_bl_356 ground n2_br_356 ground vdd_selectedh ground memorycellh
X2wirel356 n2_bl_356 n2_bl_357 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer356 n2_br_356 n2_br_357 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj356 ground ground n2_bl_357 ground n2_br_357 ground vdd_selectedh ground memorycellh
X2wirel357 n2_bl_357 n2_bl_358 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer357 n2_br_357 n2_br_358 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj357 ground ground n2_bl_358 ground n2_br_358 ground vdd_selectedh ground memorycellh
X2wirel358 n2_bl_358 n2_bl_359 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer358 n2_br_358 n2_br_359 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj358 ground ground n2_bl_359 ground n2_br_359 ground vdd_selectedh ground memorycellh
X2wirel359 n2_bl_359 n2_bl_360 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer359 n2_br_359 n2_br_360 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj359 ground ground n2_bl_360 ground n2_br_360 ground vdd_selectedh ground memorycellh
X2wirel360 n2_bl_360 n2_bl_361 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer360 n2_br_360 n2_br_361 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj360 ground ground n2_bl_361 ground n2_br_361 ground vdd_selectedh ground memorycellh
X2wirel361 n2_bl_361 n2_bl_362 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer361 n2_br_361 n2_br_362 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj361 ground ground n2_bl_362 ground n2_br_362 ground vdd_selectedh ground memorycellh
X2wirel362 n2_bl_362 n2_bl_363 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer362 n2_br_362 n2_br_363 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj362 ground ground n2_bl_363 ground n2_br_363 ground vdd_selectedh ground memorycellh
X2wirel363 n2_bl_363 n2_bl_364 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer363 n2_br_363 n2_br_364 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj363 ground ground n2_bl_364 ground n2_br_364 ground vdd_selectedh ground memorycellh
X2wirel364 n2_bl_364 n2_bl_365 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer364 n2_br_364 n2_br_365 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj364 ground ground n2_bl_365 ground n2_br_365 ground vdd_selectedh ground memorycellh
X2wirel365 n2_bl_365 n2_bl_366 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer365 n2_br_365 n2_br_366 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj365 ground ground n2_bl_366 ground n2_br_366 ground vdd_selectedh ground memorycellh
X2wirel366 n2_bl_366 n2_bl_367 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer366 n2_br_366 n2_br_367 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj366 ground ground n2_bl_367 ground n2_br_367 ground vdd_selectedh ground memorycellh
X2wirel367 n2_bl_367 n2_bl_368 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer367 n2_br_367 n2_br_368 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj367 ground ground n2_bl_368 ground n2_br_368 ground vdd_selectedh ground memorycellh
X2wirel368 n2_bl_368 n2_bl_369 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer368 n2_br_368 n2_br_369 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj368 ground ground n2_bl_369 ground n2_br_369 ground vdd_selectedh ground memorycellh
X2wirel369 n2_bl_369 n2_bl_370 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer369 n2_br_369 n2_br_370 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj369 ground ground n2_bl_370 ground n2_br_370 ground vdd_selectedh ground memorycellh
X2wirel370 n2_bl_370 n2_bl_371 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer370 n2_br_370 n2_br_371 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj370 ground ground n2_bl_371 ground n2_br_371 ground vdd_selectedh ground memorycellh
X2wirel371 n2_bl_371 n2_bl_372 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer371 n2_br_371 n2_br_372 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj371 ground ground n2_bl_372 ground n2_br_372 ground vdd_selectedh ground memorycellh
X2wirel372 n2_bl_372 n2_bl_373 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer372 n2_br_372 n2_br_373 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj372 ground ground n2_bl_373 ground n2_br_373 ground vdd_selectedh ground memorycellh
X2wirel373 n2_bl_373 n2_bl_374 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer373 n2_br_373 n2_br_374 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj373 ground ground n2_bl_374 ground n2_br_374 ground vdd_selectedh ground memorycellh
X2wirel374 n2_bl_374 n2_bl_375 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer374 n2_br_374 n2_br_375 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj374 ground ground n2_bl_375 ground n2_br_375 ground vdd_selectedh ground memorycellh
X2wirel375 n2_bl_375 n2_bl_376 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer375 n2_br_375 n2_br_376 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj375 ground ground n2_bl_376 ground n2_br_376 ground vdd_selectedh ground memorycellh
X2wirel376 n2_bl_376 n2_bl_377 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer376 n2_br_376 n2_br_377 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj376 ground ground n2_bl_377 ground n2_br_377 ground vdd_selectedh ground memorycellh
X2wirel377 n2_bl_377 n2_bl_378 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer377 n2_br_377 n2_br_378 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj377 ground ground n2_bl_378 ground n2_br_378 ground vdd_selectedh ground memorycellh
X2wirel378 n2_bl_378 n2_bl_379 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer378 n2_br_378 n2_br_379 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj378 ground ground n2_bl_379 ground n2_br_379 ground vdd_selectedh ground memorycellh
X2wirel379 n2_bl_379 n2_bl_380 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer379 n2_br_379 n2_br_380 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj379 ground ground n2_bl_380 ground n2_br_380 ground vdd_selectedh ground memorycellh
X2wirel380 n2_bl_380 n2_bl_381 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer380 n2_br_380 n2_br_381 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj380 ground ground n2_bl_381 ground n2_br_381 ground vdd_selectedh ground memorycellh
X2wirel381 n2_bl_381 n2_bl_382 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer381 n2_br_381 n2_br_382 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj381 ground ground n2_bl_382 ground n2_br_382 ground vdd_selectedh ground memorycellh
X2wirel382 n2_bl_382 n2_bl_383 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer382 n2_br_382 n2_br_383 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj382 ground ground n2_bl_383 ground n2_br_383 ground vdd_selectedh ground memorycellh
X2wirel383 n2_bl_383 n2_bl_384 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer383 n2_br_383 n2_br_384 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj383 ground ground n2_bl_384 ground n2_br_384 ground vdd_selectedh ground memorycellh
X2wirel384 n2_bl_384 n2_bl_385 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer384 n2_br_384 n2_br_385 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj384 ground ground n2_bl_385 ground n2_br_385 ground vdd_selectedh ground memorycellh
X2wirel385 n2_bl_385 n2_bl_386 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer385 n2_br_385 n2_br_386 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj385 ground ground n2_bl_386 ground n2_br_386 ground vdd_selectedh ground memorycellh
X2wirel386 n2_bl_386 n2_bl_387 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer386 n2_br_386 n2_br_387 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj386 ground ground n2_bl_387 ground n2_br_387 ground vdd_selectedh ground memorycellh
X2wirel387 n2_bl_387 n2_bl_388 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer387 n2_br_387 n2_br_388 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj387 ground ground n2_bl_388 ground n2_br_388 ground vdd_selectedh ground memorycellh
X2wirel388 n2_bl_388 n2_bl_389 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer388 n2_br_388 n2_br_389 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj388 ground ground n2_bl_389 ground n2_br_389 ground vdd_selectedh ground memorycellh
X2wirel389 n2_bl_389 n2_bl_390 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer389 n2_br_389 n2_br_390 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj389 ground ground n2_bl_390 ground n2_br_390 ground vdd_selectedh ground memorycellh
X2wirel390 n2_bl_390 n2_bl_391 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer390 n2_br_390 n2_br_391 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj390 ground ground n2_bl_391 ground n2_br_391 ground vdd_selectedh ground memorycellh
X2wirel391 n2_bl_391 n2_bl_392 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer391 n2_br_391 n2_br_392 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj391 ground ground n2_bl_392 ground n2_br_392 ground vdd_selectedh ground memorycellh
X2wirel392 n2_bl_392 n2_bl_393 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer392 n2_br_392 n2_br_393 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj392 ground ground n2_bl_393 ground n2_br_393 ground vdd_selectedh ground memorycellh
X2wirel393 n2_bl_393 n2_bl_394 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer393 n2_br_393 n2_br_394 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj393 ground ground n2_bl_394 ground n2_br_394 ground vdd_selectedh ground memorycellh
X2wirel394 n2_bl_394 n2_bl_395 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer394 n2_br_394 n2_br_395 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj394 ground ground n2_bl_395 ground n2_br_395 ground vdd_selectedh ground memorycellh
X2wirel395 n2_bl_395 n2_bl_396 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer395 n2_br_395 n2_br_396 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj395 ground ground n2_bl_396 ground n2_br_396 ground vdd_selectedh ground memorycellh
X2wirel396 n2_bl_396 n2_bl_397 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer396 n2_br_396 n2_br_397 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj396 ground ground n2_bl_397 ground n2_br_397 ground vdd_selectedh ground memorycellh
X2wirel397 n2_bl_397 n2_bl_398 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer397 n2_br_397 n2_br_398 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj397 ground ground n2_bl_398 ground n2_br_398 ground vdd_selectedh ground memorycellh
X2wirel398 n2_bl_398 n2_bl_399 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer398 n2_br_398 n2_br_399 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj398 ground ground n2_bl_399 ground n2_br_399 ground vdd_selectedh ground memorycellh
X2wirel399 n2_bl_399 n2_bl_400 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer399 n2_br_399 n2_br_400 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj399 ground ground n2_bl_400 ground n2_br_400 ground vdd_selectedh ground memorycellh
X2wirel400 n2_bl_400 n2_bl_401 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer400 n2_br_400 n2_br_401 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj400 ground ground n2_bl_401 ground n2_br_401 ground vdd_selectedh ground memorycellh
X2wirel401 n2_bl_401 n2_bl_402 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer401 n2_br_401 n2_br_402 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj401 ground ground n2_bl_402 ground n2_br_402 ground vdd_selectedh ground memorycellh
X2wirel402 n2_bl_402 n2_bl_403 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer402 n2_br_402 n2_br_403 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj402 ground ground n2_bl_403 ground n2_br_403 ground vdd_selectedh ground memorycellh
X2wirel403 n2_bl_403 n2_bl_404 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer403 n2_br_403 n2_br_404 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj403 ground ground n2_bl_404 ground n2_br_404 ground vdd_selectedh ground memorycellh
X2wirel404 n2_bl_404 n2_bl_405 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer404 n2_br_404 n2_br_405 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj404 ground ground n2_bl_405 ground n2_br_405 ground vdd_selectedh ground memorycellh
X2wirel405 n2_bl_405 n2_bl_406 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer405 n2_br_405 n2_br_406 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj405 ground ground n2_bl_406 ground n2_br_406 ground vdd_selectedh ground memorycellh
X2wirel406 n2_bl_406 n2_bl_407 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer406 n2_br_406 n2_br_407 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj406 ground ground n2_bl_407 ground n2_br_407 ground vdd_selectedh ground memorycellh
X2wirel407 n2_bl_407 n2_bl_408 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer407 n2_br_407 n2_br_408 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj407 ground ground n2_bl_408 ground n2_br_408 ground vdd_selectedh ground memorycellh
X2wirel408 n2_bl_408 n2_bl_409 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer408 n2_br_408 n2_br_409 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj408 ground ground n2_bl_409 ground n2_br_409 ground vdd_selectedh ground memorycellh
X2wirel409 n2_bl_409 n2_bl_410 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer409 n2_br_409 n2_br_410 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj409 ground ground n2_bl_410 ground n2_br_410 ground vdd_selectedh ground memorycellh
X2wirel410 n2_bl_410 n2_bl_411 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer410 n2_br_410 n2_br_411 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj410 ground ground n2_bl_411 ground n2_br_411 ground vdd_selectedh ground memorycellh
X2wirel411 n2_bl_411 n2_bl_412 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer411 n2_br_411 n2_br_412 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj411 ground ground n2_bl_412 ground n2_br_412 ground vdd_selectedh ground memorycellh
X2wirel412 n2_bl_412 n2_bl_413 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer412 n2_br_412 n2_br_413 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj412 ground ground n2_bl_413 ground n2_br_413 ground vdd_selectedh ground memorycellh
X2wirel413 n2_bl_413 n2_bl_414 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer413 n2_br_413 n2_br_414 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj413 ground ground n2_bl_414 ground n2_br_414 ground vdd_selectedh ground memorycellh
X2wirel414 n2_bl_414 n2_bl_415 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer414 n2_br_414 n2_br_415 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj414 ground ground n2_bl_415 ground n2_br_415 ground vdd_selectedh ground memorycellh
X2wirel415 n2_bl_415 n2_bl_416 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer415 n2_br_415 n2_br_416 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj415 ground ground n2_bl_416 ground n2_br_416 ground vdd_selectedh ground memorycellh
X2wirel416 n2_bl_416 n2_bl_417 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer416 n2_br_416 n2_br_417 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj416 ground ground n2_bl_417 ground n2_br_417 ground vdd_selectedh ground memorycellh
X2wirel417 n2_bl_417 n2_bl_418 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer417 n2_br_417 n2_br_418 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj417 ground ground n2_bl_418 ground n2_br_418 ground vdd_selectedh ground memorycellh
X2wirel418 n2_bl_418 n2_bl_419 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer418 n2_br_418 n2_br_419 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj418 ground ground n2_bl_419 ground n2_br_419 ground vdd_selectedh ground memorycellh
X2wirel419 n2_bl_419 n2_bl_420 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer419 n2_br_419 n2_br_420 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj419 ground ground n2_bl_420 ground n2_br_420 ground vdd_selectedh ground memorycellh
X2wirel420 n2_bl_420 n2_bl_421 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer420 n2_br_420 n2_br_421 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj420 ground ground n2_bl_421 ground n2_br_421 ground vdd_selectedh ground memorycellh
X2wirel421 n2_bl_421 n2_bl_422 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer421 n2_br_421 n2_br_422 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj421 ground ground n2_bl_422 ground n2_br_422 ground vdd_selectedh ground memorycellh
X2wirel422 n2_bl_422 n2_bl_423 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer422 n2_br_422 n2_br_423 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj422 ground ground n2_bl_423 ground n2_br_423 ground vdd_selectedh ground memorycellh
X2wirel423 n2_bl_423 n2_bl_424 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer423 n2_br_423 n2_br_424 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj423 ground ground n2_bl_424 ground n2_br_424 ground vdd_selectedh ground memorycellh
X2wirel424 n2_bl_424 n2_bl_425 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer424 n2_br_424 n2_br_425 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj424 ground ground n2_bl_425 ground n2_br_425 ground vdd_selectedh ground memorycellh
X2wirel425 n2_bl_425 n2_bl_426 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer425 n2_br_425 n2_br_426 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj425 ground ground n2_bl_426 ground n2_br_426 ground vdd_selectedh ground memorycellh
X2wirel426 n2_bl_426 n2_bl_427 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer426 n2_br_426 n2_br_427 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj426 ground ground n2_bl_427 ground n2_br_427 ground vdd_selectedh ground memorycellh
X2wirel427 n2_bl_427 n2_bl_428 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer427 n2_br_427 n2_br_428 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj427 ground ground n2_bl_428 ground n2_br_428 ground vdd_selectedh ground memorycellh
X2wirel428 n2_bl_428 n2_bl_429 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer428 n2_br_428 n2_br_429 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj428 ground ground n2_bl_429 ground n2_br_429 ground vdd_selectedh ground memorycellh
X2wirel429 n2_bl_429 n2_bl_430 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer429 n2_br_429 n2_br_430 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj429 ground ground n2_bl_430 ground n2_br_430 ground vdd_selectedh ground memorycellh
X2wirel430 n2_bl_430 n2_bl_431 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer430 n2_br_430 n2_br_431 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj430 ground ground n2_bl_431 ground n2_br_431 ground vdd_selectedh ground memorycellh
X2wirel431 n2_bl_431 n2_bl_432 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer431 n2_br_431 n2_br_432 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj431 ground ground n2_bl_432 ground n2_br_432 ground vdd_selectedh ground memorycellh
X2wirel432 n2_bl_432 n2_bl_433 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer432 n2_br_432 n2_br_433 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj432 ground ground n2_bl_433 ground n2_br_433 ground vdd_selectedh ground memorycellh
X2wirel433 n2_bl_433 n2_bl_434 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer433 n2_br_433 n2_br_434 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj433 ground ground n2_bl_434 ground n2_br_434 ground vdd_selectedh ground memorycellh
X2wirel434 n2_bl_434 n2_bl_435 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer434 n2_br_434 n2_br_435 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj434 ground ground n2_bl_435 ground n2_br_435 ground vdd_selectedh ground memorycellh
X2wirel435 n2_bl_435 n2_bl_436 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer435 n2_br_435 n2_br_436 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj435 ground ground n2_bl_436 ground n2_br_436 ground vdd_selectedh ground memorycellh
X2wirel436 n2_bl_436 n2_bl_437 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer436 n2_br_436 n2_br_437 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj436 ground ground n2_bl_437 ground n2_br_437 ground vdd_selectedh ground memorycellh
X2wirel437 n2_bl_437 n2_bl_438 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer437 n2_br_437 n2_br_438 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj437 ground ground n2_bl_438 ground n2_br_438 ground vdd_selectedh ground memorycellh
X2wirel438 n2_bl_438 n2_bl_439 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer438 n2_br_438 n2_br_439 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj438 ground ground n2_bl_439 ground n2_br_439 ground vdd_selectedh ground memorycellh
X2wirel439 n2_bl_439 n2_bl_440 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer439 n2_br_439 n2_br_440 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj439 ground ground n2_bl_440 ground n2_br_440 ground vdd_selectedh ground memorycellh
X2wirel440 n2_bl_440 n2_bl_441 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer440 n2_br_440 n2_br_441 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj440 ground ground n2_bl_441 ground n2_br_441 ground vdd_selectedh ground memorycellh
X2wirel441 n2_bl_441 n2_bl_442 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer441 n2_br_441 n2_br_442 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj441 ground ground n2_bl_442 ground n2_br_442 ground vdd_selectedh ground memorycellh
X2wirel442 n2_bl_442 n2_bl_443 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer442 n2_br_442 n2_br_443 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj442 ground ground n2_bl_443 ground n2_br_443 ground vdd_selectedh ground memorycellh
X2wirel443 n2_bl_443 n2_bl_444 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer443 n2_br_443 n2_br_444 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj443 ground ground n2_bl_444 ground n2_br_444 ground vdd_selectedh ground memorycellh
X2wirel444 n2_bl_444 n2_bl_445 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer444 n2_br_444 n2_br_445 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj444 ground ground n2_bl_445 ground n2_br_445 ground vdd_selectedh ground memorycellh
X2wirel445 n2_bl_445 n2_bl_446 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer445 n2_br_445 n2_br_446 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj445 ground ground n2_bl_446 ground n2_br_446 ground vdd_selectedh ground memorycellh
X2wirel446 n2_bl_446 n2_bl_447 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer446 n2_br_446 n2_br_447 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj446 ground ground n2_bl_447 ground n2_br_447 ground vdd_selectedh ground memorycellh
X2wirel447 n2_bl_447 n2_bl_448 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer447 n2_br_447 n2_br_448 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj447 ground ground n2_bl_448 ground n2_br_448 ground vdd_selectedh ground memorycellh
X2wirel448 n2_bl_448 n2_bl_449 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer448 n2_br_448 n2_br_449 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj448 ground ground n2_bl_449 ground n2_br_449 ground vdd_selectedh ground memorycellh
X2wirel449 n2_bl_449 n2_bl_450 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer449 n2_br_449 n2_br_450 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj449 ground ground n2_bl_450 ground n2_br_450 ground vdd_selectedh ground memorycellh
X2wirel450 n2_bl_450 n2_bl_451 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer450 n2_br_450 n2_br_451 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj450 ground ground n2_bl_451 ground n2_br_451 ground vdd_selectedh ground memorycellh
X2wirel451 n2_bl_451 n2_bl_452 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer451 n2_br_451 n2_br_452 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj451 ground ground n2_bl_452 ground n2_br_452 ground vdd_selectedh ground memorycellh
X2wirel452 n2_bl_452 n2_bl_453 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer452 n2_br_452 n2_br_453 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj452 ground ground n2_bl_453 ground n2_br_453 ground vdd_selectedh ground memorycellh
X2wirel453 n2_bl_453 n2_bl_454 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer453 n2_br_453 n2_br_454 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj453 ground ground n2_bl_454 ground n2_br_454 ground vdd_selectedh ground memorycellh
X2wirel454 n2_bl_454 n2_bl_455 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer454 n2_br_454 n2_br_455 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj454 ground ground n2_bl_455 ground n2_br_455 ground vdd_selectedh ground memorycellh
X2wirel455 n2_bl_455 n2_bl_456 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer455 n2_br_455 n2_br_456 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj455 ground ground n2_bl_456 ground n2_br_456 ground vdd_selectedh ground memorycellh
X2wirel456 n2_bl_456 n2_bl_457 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer456 n2_br_456 n2_br_457 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj456 ground ground n2_bl_457 ground n2_br_457 ground vdd_selectedh ground memorycellh
X2wirel457 n2_bl_457 n2_bl_458 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer457 n2_br_457 n2_br_458 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj457 ground ground n2_bl_458 ground n2_br_458 ground vdd_selectedh ground memorycellh
X2wirel458 n2_bl_458 n2_bl_459 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer458 n2_br_458 n2_br_459 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj458 ground ground n2_bl_459 ground n2_br_459 ground vdd_selectedh ground memorycellh
X2wirel459 n2_bl_459 n2_bl_460 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer459 n2_br_459 n2_br_460 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj459 ground ground n2_bl_460 ground n2_br_460 ground vdd_selectedh ground memorycellh
X2wirel460 n2_bl_460 n2_bl_461 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer460 n2_br_460 n2_br_461 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj460 ground ground n2_bl_461 ground n2_br_461 ground vdd_selectedh ground memorycellh
X2wirel461 n2_bl_461 n2_bl_462 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer461 n2_br_461 n2_br_462 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj461 ground ground n2_bl_462 ground n2_br_462 ground vdd_selectedh ground memorycellh
X2wirel462 n2_bl_462 n2_bl_463 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer462 n2_br_462 n2_br_463 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj462 ground ground n2_bl_463 ground n2_br_463 ground vdd_selectedh ground memorycellh
X2wirel463 n2_bl_463 n2_bl_464 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer463 n2_br_463 n2_br_464 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj463 ground ground n2_bl_464 ground n2_br_464 ground vdd_selectedh ground memorycellh
X2wirel464 n2_bl_464 n2_bl_465 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer464 n2_br_464 n2_br_465 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj464 ground ground n2_bl_465 ground n2_br_465 ground vdd_selectedh ground memorycellh
X2wirel465 n2_bl_465 n2_bl_466 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer465 n2_br_465 n2_br_466 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj465 ground ground n2_bl_466 ground n2_br_466 ground vdd_selectedh ground memorycellh
X2wirel466 n2_bl_466 n2_bl_467 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer466 n2_br_466 n2_br_467 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj466 ground ground n2_bl_467 ground n2_br_467 ground vdd_selectedh ground memorycellh
X2wirel467 n2_bl_467 n2_bl_468 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer467 n2_br_467 n2_br_468 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj467 ground ground n2_bl_468 ground n2_br_468 ground vdd_selectedh ground memorycellh
X2wirel468 n2_bl_468 n2_bl_469 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer468 n2_br_468 n2_br_469 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj468 ground ground n2_bl_469 ground n2_br_469 ground vdd_selectedh ground memorycellh
X2wirel469 n2_bl_469 n2_bl_470 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer469 n2_br_469 n2_br_470 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj469 ground ground n2_bl_470 ground n2_br_470 ground vdd_selectedh ground memorycellh
X2wirel470 n2_bl_470 n2_bl_471 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer470 n2_br_470 n2_br_471 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj470 ground ground n2_bl_471 ground n2_br_471 ground vdd_selectedh ground memorycellh
X2wirel471 n2_bl_471 n2_bl_472 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer471 n2_br_471 n2_br_472 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj471 ground ground n2_bl_472 ground n2_br_472 ground vdd_selectedh ground memorycellh
X2wirel472 n2_bl_472 n2_bl_473 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer472 n2_br_472 n2_br_473 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj472 ground ground n2_bl_473 ground n2_br_473 ground vdd_selectedh ground memorycellh
X2wirel473 n2_bl_473 n2_bl_474 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer473 n2_br_473 n2_br_474 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj473 ground ground n2_bl_474 ground n2_br_474 ground vdd_selectedh ground memorycellh
X2wirel474 n2_bl_474 n2_bl_475 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer474 n2_br_474 n2_br_475 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj474 ground ground n2_bl_475 ground n2_br_475 ground vdd_selectedh ground memorycellh
X2wirel475 n2_bl_475 n2_bl_476 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer475 n2_br_475 n2_br_476 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj475 ground ground n2_bl_476 ground n2_br_476 ground vdd_selectedh ground memorycellh
X2wirel476 n2_bl_476 n2_bl_477 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer476 n2_br_476 n2_br_477 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj476 ground ground n2_bl_477 ground n2_br_477 ground vdd_selectedh ground memorycellh
X2wirel477 n2_bl_477 n2_bl_478 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer477 n2_br_477 n2_br_478 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj477 ground ground n2_bl_478 ground n2_br_478 ground vdd_selectedh ground memorycellh
X2wirel478 n2_bl_478 n2_bl_479 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer478 n2_br_478 n2_br_479 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj478 ground ground n2_bl_479 ground n2_br_479 ground vdd_selectedh ground memorycellh
X2wirel479 n2_bl_479 n2_bl_480 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer479 n2_br_479 n2_br_480 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj479 ground ground n2_bl_480 ground n2_br_480 ground vdd_selectedh ground memorycellh
X2wirel480 n2_bl_480 n2_bl_481 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer480 n2_br_480 n2_br_481 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj480 ground ground n2_bl_481 ground n2_br_481 ground vdd_selectedh ground memorycellh
X2wirel481 n2_bl_481 n2_bl_482 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer481 n2_br_481 n2_br_482 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj481 ground ground n2_bl_482 ground n2_br_482 ground vdd_selectedh ground memorycellh
X2wirel482 n2_bl_482 n2_bl_483 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer482 n2_br_482 n2_br_483 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj482 ground ground n2_bl_483 ground n2_br_483 ground vdd_selectedh ground memorycellh
X2wirel483 n2_bl_483 n2_bl_484 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer483 n2_br_483 n2_br_484 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj483 ground ground n2_bl_484 ground n2_br_484 ground vdd_selectedh ground memorycellh
X2wirel484 n2_bl_484 n2_bl_485 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer484 n2_br_484 n2_br_485 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj484 ground ground n2_bl_485 ground n2_br_485 ground vdd_selectedh ground memorycellh
X2wirel485 n2_bl_485 n2_bl_486 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer485 n2_br_485 n2_br_486 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj485 ground ground n2_bl_486 ground n2_br_486 ground vdd_selectedh ground memorycellh
X2wirel486 n2_bl_486 n2_bl_487 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer486 n2_br_486 n2_br_487 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj486 ground ground n2_bl_487 ground n2_br_487 ground vdd_selectedh ground memorycellh
X2wirel487 n2_bl_487 n2_bl_488 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer487 n2_br_487 n2_br_488 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj487 ground ground n2_bl_488 ground n2_br_488 ground vdd_selectedh ground memorycellh
X2wirel488 n2_bl_488 n2_bl_489 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer488 n2_br_488 n2_br_489 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj488 ground ground n2_bl_489 ground n2_br_489 ground vdd_selectedh ground memorycellh
X2wirel489 n2_bl_489 n2_bl_490 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer489 n2_br_489 n2_br_490 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj489 ground ground n2_bl_490 ground n2_br_490 ground vdd_selectedh ground memorycellh
X2wirel490 n2_bl_490 n2_bl_491 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer490 n2_br_490 n2_br_491 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj490 ground ground n2_bl_491 ground n2_br_491 ground vdd_selectedh ground memorycellh
X2wirel491 n2_bl_491 n2_bl_492 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer491 n2_br_491 n2_br_492 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj491 ground ground n2_bl_492 ground n2_br_492 ground vdd_selectedh ground memorycellh
X2wirel492 n2_bl_492 n2_bl_493 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer492 n2_br_492 n2_br_493 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj492 ground ground n2_bl_493 ground n2_br_493 ground vdd_selectedh ground memorycellh
X2wirel493 n2_bl_493 n2_bl_494 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer493 n2_br_493 n2_br_494 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj493 ground ground n2_bl_494 ground n2_br_494 ground vdd_selectedh ground memorycellh
X2wirel494 n2_bl_494 n2_bl_495 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer494 n2_br_494 n2_br_495 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj494 ground ground n2_bl_495 ground n2_br_495 ground vdd_selectedh ground memorycellh
X2wirel495 n2_bl_495 n2_bl_496 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer495 n2_br_495 n2_br_496 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj495 ground ground n2_bl_496 ground n2_br_496 ground vdd_selectedh ground memorycellh
X2wirel496 n2_bl_496 n2_bl_497 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer496 n2_br_496 n2_br_497 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj496 ground ground n2_bl_497 ground n2_br_497 ground vdd_selectedh ground memorycellh
X2wirel497 n2_bl_497 n2_bl_498 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer497 n2_br_497 n2_br_498 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj497 ground ground n2_bl_498 ground n2_br_498 ground vdd_selectedh ground memorycellh
X2wirel498 n2_bl_498 n2_bl_499 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer498 n2_br_498 n2_br_499 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj498 ground ground n2_bl_499 ground n2_br_499 ground vdd_selectedh ground memorycellh
X2wirel499 n2_bl_499 n2_bl_500 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer499 n2_br_499 n2_br_500 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj499 ground ground n2_bl_500 ground n2_br_500 ground vdd_selectedh ground memorycellh
X2wirel500 n2_bl_500 n2_bl_501 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer500 n2_br_500 n2_br_501 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj500 ground ground n2_bl_501 ground n2_br_501 ground vdd_selectedh ground memorycellh
X2wirel501 n2_bl_501 n2_bl_502 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer501 n2_br_501 n2_br_502 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj501 ground ground n2_bl_502 ground n2_br_502 ground vdd_selectedh ground memorycellh
X2wirel502 n2_bl_502 n2_bl_503 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer502 n2_br_502 n2_br_503 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj502 ground ground n2_bl_503 ground n2_br_503 ground vdd_selectedh ground memorycellh
X2wirel503 n2_bl_503 n2_bl_504 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer503 n2_br_503 n2_br_504 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj503 ground ground n2_bl_504 ground n2_br_504 ground vdd_selectedh ground memorycellh
X2wirel504 n2_bl_504 n2_bl_505 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer504 n2_br_504 n2_br_505 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj504 ground ground n2_bl_505 ground n2_br_505 ground vdd_selectedh ground memorycellh
X2wirel505 n2_bl_505 n2_bl_506 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer505 n2_br_505 n2_br_506 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj505 ground ground n2_bl_506 ground n2_br_506 ground vdd_selectedh ground memorycellh
X2wirel506 n2_bl_506 n2_bl_507 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer506 n2_br_506 n2_br_507 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj506 ground ground n2_bl_507 ground n2_br_507 ground vdd_selectedh ground memorycellh
X2wirel507 n2_bl_507 n2_bl_508 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer507 n2_br_507 n2_br_508 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj507 ground ground n2_bl_508 ground n2_br_508 ground vdd_selectedh ground memorycellh
X2wirel508 n2_bl_508 n2_bl_509 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer508 n2_br_508 n2_br_509 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj508 ground ground n2_bl_509 ground n2_br_509 ground vdd_selectedh ground memorycellh
X2wirel509 n2_bl_509 n2_bl_510 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer509 n2_br_509 n2_br_510 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj509 ground ground n2_bl_510 ground n2_br_510 ground vdd_selectedh ground memorycellh
X2wirel510 n2_bl_510 n2_bl_511 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer510 n2_br_510 n2_br_511 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj510 ground ground n2_bl_511 ground n2_br_511 ground vdd_selectedh ground memorycellh
X2wirel511 n2_bl_511 n2_bl_512 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer511 n2_br_511 n2_br_512 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj511 n_precharge ground n2_bl_512 ground n2_br_512 ground vdd_selectedh ground memorycellh
.IC V(n2_bl_0) = 0.8 
.IC V(n2_br_0) = 0 
.END