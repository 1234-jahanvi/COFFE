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
Vse1 n_se1 ground PULSE (0.8_lp 0 0 50p 50p 'sa_se1' 'ram_frequency')
Vse2 n_se2 ground PULSE (0.8_lp 0 0 50p 50p 'sa_se2' 'ram_frequency')
* Power rail for the circuit under test.
* This allows us to measure powersna of a circuit under test without measuring the power of wave shaping and load circuitry.
V_readl vdd_readl ground 0.8_lp

V_readh vdd_readh ground 0.8_lp

********************************************************************************
** Measurement
********************************************************************************

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current_readl  INTEG I(V_readl) FROM= 0ns TO='4 * ram_frequency'
.MEASURE TRAN meas_avg_power_readl PARAM = '-(meas_current_readl/(4 * ram_frequency)) * 0.8_lp'

.MEASURE TRAN meas_current_readh  INTEG I(V_readh) FROM= 0ns TO='4 * ram_frequency'
.MEASURE TRAN meas_avg_power_readh PARAM = '-(meas_current_readh/(4 * ram_frequency)) * 0.8_lp'

********************************************************************************
** Circuit
********************************************************************************

Xprechargesa n_1_1 n_2_1 n_se1 n_se2 n_hang_out vclmpmtj vrefmtj ground vdd_lp vdd_readl ground mtj_subcircuits_sa
Xwritedriver ground ground n_1_1 ground vdd_readl ground mtj_subcircuits_writedriver
Xwritedriver_ref ground ground n_2_1 ground vdd_readl ground mtj_subcircuits_writedriver
Xcs n_1_1 n_bl_0 n_precharge_b n_precharge vdd_readl ground mtj_subcircuits_cs
Xcs_ref n_2_1 n_bl2_0 n_precharge_b n_precharge vdd_readl ground mtj_subcircuits_cs
xprecharge_dup n_hang_low n_bl_512 n_precharge_b n_precharge vdd_readl ground mtj_subcircuits_cs
xprecharge_dup_ref n_hang2_low n_bl2_512 n_precharge_b n_precharge vdd_readl ground mtj_subcircuits_cs
Xwirel0 n_bl_0 n_bl_1 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer0 n_br_0 n_br_1 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj0 ground ground n_bl_1 ground n_br_1 ground vdd_readl ground memorycell
Xwirel1 n_bl_1 n_bl_2 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer1 n_br_1 n_br_2 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj1 ground ground n_bl_2 ground n_br_2 ground vdd_readl ground memorycell
Xwirel2 n_bl_2 n_bl_3 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer2 n_br_2 n_br_3 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj2 ground ground n_bl_3 ground n_br_3 ground vdd_readl ground memorycell
Xwirel3 n_bl_3 n_bl_4 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer3 n_br_3 n_br_4 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj3 ground ground n_bl_4 ground n_br_4 ground vdd_readl ground memorycell
Xwirel4 n_bl_4 n_bl_5 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer4 n_br_4 n_br_5 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj4 ground ground n_bl_5 ground n_br_5 ground vdd_readl ground memorycell
Xwirel5 n_bl_5 n_bl_6 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer5 n_br_5 n_br_6 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj5 ground ground n_bl_6 ground n_br_6 ground vdd_readl ground memorycell
Xwirel6 n_bl_6 n_bl_7 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer6 n_br_6 n_br_7 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj6 ground ground n_bl_7 ground n_br_7 ground vdd_readl ground memorycell
Xwirel7 n_bl_7 n_bl_8 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer7 n_br_7 n_br_8 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj7 ground ground n_bl_8 ground n_br_8 ground vdd_readl ground memorycell
Xwirel8 n_bl_8 n_bl_9 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer8 n_br_8 n_br_9 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj8 ground ground n_bl_9 ground n_br_9 ground vdd_readl ground memorycell
Xwirel9 n_bl_9 n_bl_10 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer9 n_br_9 n_br_10 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj9 ground ground n_bl_10 ground n_br_10 ground vdd_readl ground memorycell
Xwirel10 n_bl_10 n_bl_11 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer10 n_br_10 n_br_11 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj10 ground ground n_bl_11 ground n_br_11 ground vdd_readl ground memorycell
Xwirel11 n_bl_11 n_bl_12 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer11 n_br_11 n_br_12 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj11 ground ground n_bl_12 ground n_br_12 ground vdd_readl ground memorycell
Xwirel12 n_bl_12 n_bl_13 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer12 n_br_12 n_br_13 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj12 ground ground n_bl_13 ground n_br_13 ground vdd_readl ground memorycell
Xwirel13 n_bl_13 n_bl_14 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer13 n_br_13 n_br_14 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj13 ground ground n_bl_14 ground n_br_14 ground vdd_readl ground memorycell
Xwirel14 n_bl_14 n_bl_15 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer14 n_br_14 n_br_15 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj14 ground ground n_bl_15 ground n_br_15 ground vdd_readl ground memorycell
Xwirel15 n_bl_15 n_bl_16 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer15 n_br_15 n_br_16 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj15 ground ground n_bl_16 ground n_br_16 ground vdd_readl ground memorycell
Xwirel16 n_bl_16 n_bl_17 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer16 n_br_16 n_br_17 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj16 ground ground n_bl_17 ground n_br_17 ground vdd_readl ground memorycell
Xwirel17 n_bl_17 n_bl_18 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer17 n_br_17 n_br_18 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj17 ground ground n_bl_18 ground n_br_18 ground vdd_readl ground memorycell
Xwirel18 n_bl_18 n_bl_19 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer18 n_br_18 n_br_19 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj18 ground ground n_bl_19 ground n_br_19 ground vdd_readl ground memorycell
Xwirel19 n_bl_19 n_bl_20 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer19 n_br_19 n_br_20 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj19 ground ground n_bl_20 ground n_br_20 ground vdd_readl ground memorycell
Xwirel20 n_bl_20 n_bl_21 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer20 n_br_20 n_br_21 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj20 ground ground n_bl_21 ground n_br_21 ground vdd_readl ground memorycell
Xwirel21 n_bl_21 n_bl_22 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer21 n_br_21 n_br_22 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj21 ground ground n_bl_22 ground n_br_22 ground vdd_readl ground memorycell
Xwirel22 n_bl_22 n_bl_23 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer22 n_br_22 n_br_23 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj22 ground ground n_bl_23 ground n_br_23 ground vdd_readl ground memorycell
Xwirel23 n_bl_23 n_bl_24 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer23 n_br_23 n_br_24 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj23 ground ground n_bl_24 ground n_br_24 ground vdd_readl ground memorycell
Xwirel24 n_bl_24 n_bl_25 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer24 n_br_24 n_br_25 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj24 ground ground n_bl_25 ground n_br_25 ground vdd_readl ground memorycell
Xwirel25 n_bl_25 n_bl_26 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer25 n_br_25 n_br_26 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj25 ground ground n_bl_26 ground n_br_26 ground vdd_readl ground memorycell
Xwirel26 n_bl_26 n_bl_27 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer26 n_br_26 n_br_27 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj26 ground ground n_bl_27 ground n_br_27 ground vdd_readl ground memorycell
Xwirel27 n_bl_27 n_bl_28 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer27 n_br_27 n_br_28 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj27 ground ground n_bl_28 ground n_br_28 ground vdd_readl ground memorycell
Xwirel28 n_bl_28 n_bl_29 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer28 n_br_28 n_br_29 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj28 ground ground n_bl_29 ground n_br_29 ground vdd_readl ground memorycell
Xwirel29 n_bl_29 n_bl_30 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer29 n_br_29 n_br_30 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj29 ground ground n_bl_30 ground n_br_30 ground vdd_readl ground memorycell
Xwirel30 n_bl_30 n_bl_31 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer30 n_br_30 n_br_31 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj30 ground ground n_bl_31 ground n_br_31 ground vdd_readl ground memorycell
Xwirel31 n_bl_31 n_bl_32 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer31 n_br_31 n_br_32 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj31 ground ground n_bl_32 ground n_br_32 ground vdd_readl ground memorycell
Xwirel32 n_bl_32 n_bl_33 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer32 n_br_32 n_br_33 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj32 ground ground n_bl_33 ground n_br_33 ground vdd_readl ground memorycell
Xwirel33 n_bl_33 n_bl_34 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer33 n_br_33 n_br_34 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj33 ground ground n_bl_34 ground n_br_34 ground vdd_readl ground memorycell
Xwirel34 n_bl_34 n_bl_35 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer34 n_br_34 n_br_35 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj34 ground ground n_bl_35 ground n_br_35 ground vdd_readl ground memorycell
Xwirel35 n_bl_35 n_bl_36 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer35 n_br_35 n_br_36 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj35 ground ground n_bl_36 ground n_br_36 ground vdd_readl ground memorycell
Xwirel36 n_bl_36 n_bl_37 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer36 n_br_36 n_br_37 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj36 ground ground n_bl_37 ground n_br_37 ground vdd_readl ground memorycell
Xwirel37 n_bl_37 n_bl_38 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer37 n_br_37 n_br_38 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj37 ground ground n_bl_38 ground n_br_38 ground vdd_readl ground memorycell
Xwirel38 n_bl_38 n_bl_39 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer38 n_br_38 n_br_39 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj38 ground ground n_bl_39 ground n_br_39 ground vdd_readl ground memorycell
Xwirel39 n_bl_39 n_bl_40 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer39 n_br_39 n_br_40 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj39 ground ground n_bl_40 ground n_br_40 ground vdd_readl ground memorycell
Xwirel40 n_bl_40 n_bl_41 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer40 n_br_40 n_br_41 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj40 ground ground n_bl_41 ground n_br_41 ground vdd_readl ground memorycell
Xwirel41 n_bl_41 n_bl_42 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer41 n_br_41 n_br_42 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj41 ground ground n_bl_42 ground n_br_42 ground vdd_readl ground memorycell
Xwirel42 n_bl_42 n_bl_43 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer42 n_br_42 n_br_43 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj42 ground ground n_bl_43 ground n_br_43 ground vdd_readl ground memorycell
Xwirel43 n_bl_43 n_bl_44 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer43 n_br_43 n_br_44 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj43 ground ground n_bl_44 ground n_br_44 ground vdd_readl ground memorycell
Xwirel44 n_bl_44 n_bl_45 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer44 n_br_44 n_br_45 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj44 ground ground n_bl_45 ground n_br_45 ground vdd_readl ground memorycell
Xwirel45 n_bl_45 n_bl_46 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer45 n_br_45 n_br_46 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj45 ground ground n_bl_46 ground n_br_46 ground vdd_readl ground memorycell
Xwirel46 n_bl_46 n_bl_47 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer46 n_br_46 n_br_47 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj46 ground ground n_bl_47 ground n_br_47 ground vdd_readl ground memorycell
Xwirel47 n_bl_47 n_bl_48 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer47 n_br_47 n_br_48 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj47 ground ground n_bl_48 ground n_br_48 ground vdd_readl ground memorycell
Xwirel48 n_bl_48 n_bl_49 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer48 n_br_48 n_br_49 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj48 ground ground n_bl_49 ground n_br_49 ground vdd_readl ground memorycell
Xwirel49 n_bl_49 n_bl_50 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer49 n_br_49 n_br_50 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj49 ground ground n_bl_50 ground n_br_50 ground vdd_readl ground memorycell
Xwirel50 n_bl_50 n_bl_51 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer50 n_br_50 n_br_51 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj50 ground ground n_bl_51 ground n_br_51 ground vdd_readl ground memorycell
Xwirel51 n_bl_51 n_bl_52 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer51 n_br_51 n_br_52 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj51 ground ground n_bl_52 ground n_br_52 ground vdd_readl ground memorycell
Xwirel52 n_bl_52 n_bl_53 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer52 n_br_52 n_br_53 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj52 ground ground n_bl_53 ground n_br_53 ground vdd_readl ground memorycell
Xwirel53 n_bl_53 n_bl_54 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer53 n_br_53 n_br_54 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj53 ground ground n_bl_54 ground n_br_54 ground vdd_readl ground memorycell
Xwirel54 n_bl_54 n_bl_55 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer54 n_br_54 n_br_55 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj54 ground ground n_bl_55 ground n_br_55 ground vdd_readl ground memorycell
Xwirel55 n_bl_55 n_bl_56 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer55 n_br_55 n_br_56 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj55 ground ground n_bl_56 ground n_br_56 ground vdd_readl ground memorycell
Xwirel56 n_bl_56 n_bl_57 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer56 n_br_56 n_br_57 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj56 ground ground n_bl_57 ground n_br_57 ground vdd_readl ground memorycell
Xwirel57 n_bl_57 n_bl_58 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer57 n_br_57 n_br_58 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj57 ground ground n_bl_58 ground n_br_58 ground vdd_readl ground memorycell
Xwirel58 n_bl_58 n_bl_59 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer58 n_br_58 n_br_59 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj58 ground ground n_bl_59 ground n_br_59 ground vdd_readl ground memorycell
Xwirel59 n_bl_59 n_bl_60 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer59 n_br_59 n_br_60 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj59 ground ground n_bl_60 ground n_br_60 ground vdd_readl ground memorycell
Xwirel60 n_bl_60 n_bl_61 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer60 n_br_60 n_br_61 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj60 ground ground n_bl_61 ground n_br_61 ground vdd_readl ground memorycell
Xwirel61 n_bl_61 n_bl_62 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer61 n_br_61 n_br_62 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj61 ground ground n_bl_62 ground n_br_62 ground vdd_readl ground memorycell
Xwirel62 n_bl_62 n_bl_63 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer62 n_br_62 n_br_63 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj62 ground ground n_bl_63 ground n_br_63 ground vdd_readl ground memorycell
Xwirel63 n_bl_63 n_bl_64 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer63 n_br_63 n_br_64 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj63 ground ground n_bl_64 ground n_br_64 ground vdd_readl ground memorycell
Xwirel64 n_bl_64 n_bl_65 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer64 n_br_64 n_br_65 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj64 ground ground n_bl_65 ground n_br_65 ground vdd_readl ground memorycell
Xwirel65 n_bl_65 n_bl_66 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer65 n_br_65 n_br_66 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj65 ground ground n_bl_66 ground n_br_66 ground vdd_readl ground memorycell
Xwirel66 n_bl_66 n_bl_67 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer66 n_br_66 n_br_67 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj66 ground ground n_bl_67 ground n_br_67 ground vdd_readl ground memorycell
Xwirel67 n_bl_67 n_bl_68 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer67 n_br_67 n_br_68 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj67 ground ground n_bl_68 ground n_br_68 ground vdd_readl ground memorycell
Xwirel68 n_bl_68 n_bl_69 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer68 n_br_68 n_br_69 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj68 ground ground n_bl_69 ground n_br_69 ground vdd_readl ground memorycell
Xwirel69 n_bl_69 n_bl_70 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer69 n_br_69 n_br_70 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj69 ground ground n_bl_70 ground n_br_70 ground vdd_readl ground memorycell
Xwirel70 n_bl_70 n_bl_71 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer70 n_br_70 n_br_71 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj70 ground ground n_bl_71 ground n_br_71 ground vdd_readl ground memorycell
Xwirel71 n_bl_71 n_bl_72 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer71 n_br_71 n_br_72 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj71 ground ground n_bl_72 ground n_br_72 ground vdd_readl ground memorycell
Xwirel72 n_bl_72 n_bl_73 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer72 n_br_72 n_br_73 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj72 ground ground n_bl_73 ground n_br_73 ground vdd_readl ground memorycell
Xwirel73 n_bl_73 n_bl_74 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer73 n_br_73 n_br_74 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj73 ground ground n_bl_74 ground n_br_74 ground vdd_readl ground memorycell
Xwirel74 n_bl_74 n_bl_75 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer74 n_br_74 n_br_75 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj74 ground ground n_bl_75 ground n_br_75 ground vdd_readl ground memorycell
Xwirel75 n_bl_75 n_bl_76 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer75 n_br_75 n_br_76 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj75 ground ground n_bl_76 ground n_br_76 ground vdd_readl ground memorycell
Xwirel76 n_bl_76 n_bl_77 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer76 n_br_76 n_br_77 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj76 ground ground n_bl_77 ground n_br_77 ground vdd_readl ground memorycell
Xwirel77 n_bl_77 n_bl_78 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer77 n_br_77 n_br_78 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj77 ground ground n_bl_78 ground n_br_78 ground vdd_readl ground memorycell
Xwirel78 n_bl_78 n_bl_79 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer78 n_br_78 n_br_79 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj78 ground ground n_bl_79 ground n_br_79 ground vdd_readl ground memorycell
Xwirel79 n_bl_79 n_bl_80 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer79 n_br_79 n_br_80 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj79 ground ground n_bl_80 ground n_br_80 ground vdd_readl ground memorycell
Xwirel80 n_bl_80 n_bl_81 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer80 n_br_80 n_br_81 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj80 ground ground n_bl_81 ground n_br_81 ground vdd_readl ground memorycell
Xwirel81 n_bl_81 n_bl_82 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer81 n_br_81 n_br_82 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj81 ground ground n_bl_82 ground n_br_82 ground vdd_readl ground memorycell
Xwirel82 n_bl_82 n_bl_83 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer82 n_br_82 n_br_83 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj82 ground ground n_bl_83 ground n_br_83 ground vdd_readl ground memorycell
Xwirel83 n_bl_83 n_bl_84 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer83 n_br_83 n_br_84 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj83 ground ground n_bl_84 ground n_br_84 ground vdd_readl ground memorycell
Xwirel84 n_bl_84 n_bl_85 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer84 n_br_84 n_br_85 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj84 ground ground n_bl_85 ground n_br_85 ground vdd_readl ground memorycell
Xwirel85 n_bl_85 n_bl_86 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer85 n_br_85 n_br_86 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj85 ground ground n_bl_86 ground n_br_86 ground vdd_readl ground memorycell
Xwirel86 n_bl_86 n_bl_87 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer86 n_br_86 n_br_87 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj86 ground ground n_bl_87 ground n_br_87 ground vdd_readl ground memorycell
Xwirel87 n_bl_87 n_bl_88 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer87 n_br_87 n_br_88 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj87 ground ground n_bl_88 ground n_br_88 ground vdd_readl ground memorycell
Xwirel88 n_bl_88 n_bl_89 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer88 n_br_88 n_br_89 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj88 ground ground n_bl_89 ground n_br_89 ground vdd_readl ground memorycell
Xwirel89 n_bl_89 n_bl_90 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer89 n_br_89 n_br_90 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj89 ground ground n_bl_90 ground n_br_90 ground vdd_readl ground memorycell
Xwirel90 n_bl_90 n_bl_91 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer90 n_br_90 n_br_91 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj90 ground ground n_bl_91 ground n_br_91 ground vdd_readl ground memorycell
Xwirel91 n_bl_91 n_bl_92 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer91 n_br_91 n_br_92 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj91 ground ground n_bl_92 ground n_br_92 ground vdd_readl ground memorycell
Xwirel92 n_bl_92 n_bl_93 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer92 n_br_92 n_br_93 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj92 ground ground n_bl_93 ground n_br_93 ground vdd_readl ground memorycell
Xwirel93 n_bl_93 n_bl_94 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer93 n_br_93 n_br_94 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj93 ground ground n_bl_94 ground n_br_94 ground vdd_readl ground memorycell
Xwirel94 n_bl_94 n_bl_95 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer94 n_br_94 n_br_95 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj94 ground ground n_bl_95 ground n_br_95 ground vdd_readl ground memorycell
Xwirel95 n_bl_95 n_bl_96 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer95 n_br_95 n_br_96 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj95 ground ground n_bl_96 ground n_br_96 ground vdd_readl ground memorycell
Xwirel96 n_bl_96 n_bl_97 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer96 n_br_96 n_br_97 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj96 ground ground n_bl_97 ground n_br_97 ground vdd_readl ground memorycell
Xwirel97 n_bl_97 n_bl_98 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer97 n_br_97 n_br_98 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj97 ground ground n_bl_98 ground n_br_98 ground vdd_readl ground memorycell
Xwirel98 n_bl_98 n_bl_99 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer98 n_br_98 n_br_99 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj98 ground ground n_bl_99 ground n_br_99 ground vdd_readl ground memorycell
Xwirel99 n_bl_99 n_bl_100 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer99 n_br_99 n_br_100 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj99 ground ground n_bl_100 ground n_br_100 ground vdd_readl ground memorycell
Xwirel100 n_bl_100 n_bl_101 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer100 n_br_100 n_br_101 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj100 ground ground n_bl_101 ground n_br_101 ground vdd_readl ground memorycell
Xwirel101 n_bl_101 n_bl_102 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer101 n_br_101 n_br_102 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj101 ground ground n_bl_102 ground n_br_102 ground vdd_readl ground memorycell
Xwirel102 n_bl_102 n_bl_103 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer102 n_br_102 n_br_103 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj102 ground ground n_bl_103 ground n_br_103 ground vdd_readl ground memorycell
Xwirel103 n_bl_103 n_bl_104 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer103 n_br_103 n_br_104 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj103 ground ground n_bl_104 ground n_br_104 ground vdd_readl ground memorycell
Xwirel104 n_bl_104 n_bl_105 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer104 n_br_104 n_br_105 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj104 ground ground n_bl_105 ground n_br_105 ground vdd_readl ground memorycell
Xwirel105 n_bl_105 n_bl_106 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer105 n_br_105 n_br_106 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj105 ground ground n_bl_106 ground n_br_106 ground vdd_readl ground memorycell
Xwirel106 n_bl_106 n_bl_107 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer106 n_br_106 n_br_107 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj106 ground ground n_bl_107 ground n_br_107 ground vdd_readl ground memorycell
Xwirel107 n_bl_107 n_bl_108 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer107 n_br_107 n_br_108 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj107 ground ground n_bl_108 ground n_br_108 ground vdd_readl ground memorycell
Xwirel108 n_bl_108 n_bl_109 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer108 n_br_108 n_br_109 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj108 ground ground n_bl_109 ground n_br_109 ground vdd_readl ground memorycell
Xwirel109 n_bl_109 n_bl_110 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer109 n_br_109 n_br_110 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj109 ground ground n_bl_110 ground n_br_110 ground vdd_readl ground memorycell
Xwirel110 n_bl_110 n_bl_111 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer110 n_br_110 n_br_111 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj110 ground ground n_bl_111 ground n_br_111 ground vdd_readl ground memorycell
Xwirel111 n_bl_111 n_bl_112 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer111 n_br_111 n_br_112 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj111 ground ground n_bl_112 ground n_br_112 ground vdd_readl ground memorycell
Xwirel112 n_bl_112 n_bl_113 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer112 n_br_112 n_br_113 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj112 ground ground n_bl_113 ground n_br_113 ground vdd_readl ground memorycell
Xwirel113 n_bl_113 n_bl_114 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer113 n_br_113 n_br_114 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj113 ground ground n_bl_114 ground n_br_114 ground vdd_readl ground memorycell
Xwirel114 n_bl_114 n_bl_115 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer114 n_br_114 n_br_115 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj114 ground ground n_bl_115 ground n_br_115 ground vdd_readl ground memorycell
Xwirel115 n_bl_115 n_bl_116 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer115 n_br_115 n_br_116 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj115 ground ground n_bl_116 ground n_br_116 ground vdd_readl ground memorycell
Xwirel116 n_bl_116 n_bl_117 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer116 n_br_116 n_br_117 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj116 ground ground n_bl_117 ground n_br_117 ground vdd_readl ground memorycell
Xwirel117 n_bl_117 n_bl_118 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer117 n_br_117 n_br_118 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj117 ground ground n_bl_118 ground n_br_118 ground vdd_readl ground memorycell
Xwirel118 n_bl_118 n_bl_119 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer118 n_br_118 n_br_119 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj118 ground ground n_bl_119 ground n_br_119 ground vdd_readl ground memorycell
Xwirel119 n_bl_119 n_bl_120 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer119 n_br_119 n_br_120 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj119 ground ground n_bl_120 ground n_br_120 ground vdd_readl ground memorycell
Xwirel120 n_bl_120 n_bl_121 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer120 n_br_120 n_br_121 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj120 ground ground n_bl_121 ground n_br_121 ground vdd_readl ground memorycell
Xwirel121 n_bl_121 n_bl_122 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer121 n_br_121 n_br_122 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj121 ground ground n_bl_122 ground n_br_122 ground vdd_readl ground memorycell
Xwirel122 n_bl_122 n_bl_123 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer122 n_br_122 n_br_123 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj122 ground ground n_bl_123 ground n_br_123 ground vdd_readl ground memorycell
Xwirel123 n_bl_123 n_bl_124 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer123 n_br_123 n_br_124 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj123 ground ground n_bl_124 ground n_br_124 ground vdd_readl ground memorycell
Xwirel124 n_bl_124 n_bl_125 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer124 n_br_124 n_br_125 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj124 ground ground n_bl_125 ground n_br_125 ground vdd_readl ground memorycell
Xwirel125 n_bl_125 n_bl_126 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer125 n_br_125 n_br_126 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj125 ground ground n_bl_126 ground n_br_126 ground vdd_readl ground memorycell
Xwirel126 n_bl_126 n_bl_127 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer126 n_br_126 n_br_127 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj126 ground ground n_bl_127 ground n_br_127 ground vdd_readl ground memorycell
Xwirel127 n_bl_127 n_bl_128 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer127 n_br_127 n_br_128 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj127 ground ground n_bl_128 ground n_br_128 ground vdd_readl ground memorycell
Xwirel128 n_bl_128 n_bl_129 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer128 n_br_128 n_br_129 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj128 ground ground n_bl_129 ground n_br_129 ground vdd_readl ground memorycell
Xwirel129 n_bl_129 n_bl_130 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer129 n_br_129 n_br_130 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj129 ground ground n_bl_130 ground n_br_130 ground vdd_readl ground memorycell
Xwirel130 n_bl_130 n_bl_131 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer130 n_br_130 n_br_131 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj130 ground ground n_bl_131 ground n_br_131 ground vdd_readl ground memorycell
Xwirel131 n_bl_131 n_bl_132 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer131 n_br_131 n_br_132 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj131 ground ground n_bl_132 ground n_br_132 ground vdd_readl ground memorycell
Xwirel132 n_bl_132 n_bl_133 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer132 n_br_132 n_br_133 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj132 ground ground n_bl_133 ground n_br_133 ground vdd_readl ground memorycell
Xwirel133 n_bl_133 n_bl_134 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer133 n_br_133 n_br_134 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj133 ground ground n_bl_134 ground n_br_134 ground vdd_readl ground memorycell
Xwirel134 n_bl_134 n_bl_135 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer134 n_br_134 n_br_135 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj134 ground ground n_bl_135 ground n_br_135 ground vdd_readl ground memorycell
Xwirel135 n_bl_135 n_bl_136 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer135 n_br_135 n_br_136 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj135 ground ground n_bl_136 ground n_br_136 ground vdd_readl ground memorycell
Xwirel136 n_bl_136 n_bl_137 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer136 n_br_136 n_br_137 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj136 ground ground n_bl_137 ground n_br_137 ground vdd_readl ground memorycell
Xwirel137 n_bl_137 n_bl_138 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer137 n_br_137 n_br_138 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj137 ground ground n_bl_138 ground n_br_138 ground vdd_readl ground memorycell
Xwirel138 n_bl_138 n_bl_139 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer138 n_br_138 n_br_139 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj138 ground ground n_bl_139 ground n_br_139 ground vdd_readl ground memorycell
Xwirel139 n_bl_139 n_bl_140 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer139 n_br_139 n_br_140 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj139 ground ground n_bl_140 ground n_br_140 ground vdd_readl ground memorycell
Xwirel140 n_bl_140 n_bl_141 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer140 n_br_140 n_br_141 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj140 ground ground n_bl_141 ground n_br_141 ground vdd_readl ground memorycell
Xwirel141 n_bl_141 n_bl_142 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer141 n_br_141 n_br_142 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj141 ground ground n_bl_142 ground n_br_142 ground vdd_readl ground memorycell
Xwirel142 n_bl_142 n_bl_143 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer142 n_br_142 n_br_143 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj142 ground ground n_bl_143 ground n_br_143 ground vdd_readl ground memorycell
Xwirel143 n_bl_143 n_bl_144 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer143 n_br_143 n_br_144 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj143 ground ground n_bl_144 ground n_br_144 ground vdd_readl ground memorycell
Xwirel144 n_bl_144 n_bl_145 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer144 n_br_144 n_br_145 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj144 ground ground n_bl_145 ground n_br_145 ground vdd_readl ground memorycell
Xwirel145 n_bl_145 n_bl_146 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer145 n_br_145 n_br_146 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj145 ground ground n_bl_146 ground n_br_146 ground vdd_readl ground memorycell
Xwirel146 n_bl_146 n_bl_147 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer146 n_br_146 n_br_147 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj146 ground ground n_bl_147 ground n_br_147 ground vdd_readl ground memorycell
Xwirel147 n_bl_147 n_bl_148 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer147 n_br_147 n_br_148 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj147 ground ground n_bl_148 ground n_br_148 ground vdd_readl ground memorycell
Xwirel148 n_bl_148 n_bl_149 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer148 n_br_148 n_br_149 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj148 ground ground n_bl_149 ground n_br_149 ground vdd_readl ground memorycell
Xwirel149 n_bl_149 n_bl_150 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer149 n_br_149 n_br_150 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj149 ground ground n_bl_150 ground n_br_150 ground vdd_readl ground memorycell
Xwirel150 n_bl_150 n_bl_151 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer150 n_br_150 n_br_151 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj150 ground ground n_bl_151 ground n_br_151 ground vdd_readl ground memorycell
Xwirel151 n_bl_151 n_bl_152 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer151 n_br_151 n_br_152 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj151 ground ground n_bl_152 ground n_br_152 ground vdd_readl ground memorycell
Xwirel152 n_bl_152 n_bl_153 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer152 n_br_152 n_br_153 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj152 ground ground n_bl_153 ground n_br_153 ground vdd_readl ground memorycell
Xwirel153 n_bl_153 n_bl_154 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer153 n_br_153 n_br_154 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj153 ground ground n_bl_154 ground n_br_154 ground vdd_readl ground memorycell
Xwirel154 n_bl_154 n_bl_155 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer154 n_br_154 n_br_155 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj154 ground ground n_bl_155 ground n_br_155 ground vdd_readl ground memorycell
Xwirel155 n_bl_155 n_bl_156 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer155 n_br_155 n_br_156 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj155 ground ground n_bl_156 ground n_br_156 ground vdd_readl ground memorycell
Xwirel156 n_bl_156 n_bl_157 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer156 n_br_156 n_br_157 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj156 ground ground n_bl_157 ground n_br_157 ground vdd_readl ground memorycell
Xwirel157 n_bl_157 n_bl_158 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer157 n_br_157 n_br_158 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj157 ground ground n_bl_158 ground n_br_158 ground vdd_readl ground memorycell
Xwirel158 n_bl_158 n_bl_159 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer158 n_br_158 n_br_159 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj158 ground ground n_bl_159 ground n_br_159 ground vdd_readl ground memorycell
Xwirel159 n_bl_159 n_bl_160 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer159 n_br_159 n_br_160 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj159 ground ground n_bl_160 ground n_br_160 ground vdd_readl ground memorycell
Xwirel160 n_bl_160 n_bl_161 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer160 n_br_160 n_br_161 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj160 ground ground n_bl_161 ground n_br_161 ground vdd_readl ground memorycell
Xwirel161 n_bl_161 n_bl_162 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer161 n_br_161 n_br_162 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj161 ground ground n_bl_162 ground n_br_162 ground vdd_readl ground memorycell
Xwirel162 n_bl_162 n_bl_163 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer162 n_br_162 n_br_163 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj162 ground ground n_bl_163 ground n_br_163 ground vdd_readl ground memorycell
Xwirel163 n_bl_163 n_bl_164 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer163 n_br_163 n_br_164 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj163 ground ground n_bl_164 ground n_br_164 ground vdd_readl ground memorycell
Xwirel164 n_bl_164 n_bl_165 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer164 n_br_164 n_br_165 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj164 ground ground n_bl_165 ground n_br_165 ground vdd_readl ground memorycell
Xwirel165 n_bl_165 n_bl_166 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer165 n_br_165 n_br_166 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj165 ground ground n_bl_166 ground n_br_166 ground vdd_readl ground memorycell
Xwirel166 n_bl_166 n_bl_167 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer166 n_br_166 n_br_167 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj166 ground ground n_bl_167 ground n_br_167 ground vdd_readl ground memorycell
Xwirel167 n_bl_167 n_bl_168 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer167 n_br_167 n_br_168 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj167 ground ground n_bl_168 ground n_br_168 ground vdd_readl ground memorycell
Xwirel168 n_bl_168 n_bl_169 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer168 n_br_168 n_br_169 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj168 ground ground n_bl_169 ground n_br_169 ground vdd_readl ground memorycell
Xwirel169 n_bl_169 n_bl_170 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer169 n_br_169 n_br_170 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj169 ground ground n_bl_170 ground n_br_170 ground vdd_readl ground memorycell
Xwirel170 n_bl_170 n_bl_171 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer170 n_br_170 n_br_171 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj170 ground ground n_bl_171 ground n_br_171 ground vdd_readl ground memorycell
Xwirel171 n_bl_171 n_bl_172 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer171 n_br_171 n_br_172 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj171 ground ground n_bl_172 ground n_br_172 ground vdd_readl ground memorycell
Xwirel172 n_bl_172 n_bl_173 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer172 n_br_172 n_br_173 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj172 ground ground n_bl_173 ground n_br_173 ground vdd_readl ground memorycell
Xwirel173 n_bl_173 n_bl_174 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer173 n_br_173 n_br_174 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj173 ground ground n_bl_174 ground n_br_174 ground vdd_readl ground memorycell
Xwirel174 n_bl_174 n_bl_175 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer174 n_br_174 n_br_175 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj174 ground ground n_bl_175 ground n_br_175 ground vdd_readl ground memorycell
Xwirel175 n_bl_175 n_bl_176 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer175 n_br_175 n_br_176 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj175 ground ground n_bl_176 ground n_br_176 ground vdd_readl ground memorycell
Xwirel176 n_bl_176 n_bl_177 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer176 n_br_176 n_br_177 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj176 ground ground n_bl_177 ground n_br_177 ground vdd_readl ground memorycell
Xwirel177 n_bl_177 n_bl_178 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer177 n_br_177 n_br_178 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj177 ground ground n_bl_178 ground n_br_178 ground vdd_readl ground memorycell
Xwirel178 n_bl_178 n_bl_179 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer178 n_br_178 n_br_179 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj178 ground ground n_bl_179 ground n_br_179 ground vdd_readl ground memorycell
Xwirel179 n_bl_179 n_bl_180 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer179 n_br_179 n_br_180 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj179 ground ground n_bl_180 ground n_br_180 ground vdd_readl ground memorycell
Xwirel180 n_bl_180 n_bl_181 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer180 n_br_180 n_br_181 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj180 ground ground n_bl_181 ground n_br_181 ground vdd_readl ground memorycell
Xwirel181 n_bl_181 n_bl_182 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer181 n_br_181 n_br_182 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj181 ground ground n_bl_182 ground n_br_182 ground vdd_readl ground memorycell
Xwirel182 n_bl_182 n_bl_183 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer182 n_br_182 n_br_183 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj182 ground ground n_bl_183 ground n_br_183 ground vdd_readl ground memorycell
Xwirel183 n_bl_183 n_bl_184 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer183 n_br_183 n_br_184 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj183 ground ground n_bl_184 ground n_br_184 ground vdd_readl ground memorycell
Xwirel184 n_bl_184 n_bl_185 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer184 n_br_184 n_br_185 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj184 ground ground n_bl_185 ground n_br_185 ground vdd_readl ground memorycell
Xwirel185 n_bl_185 n_bl_186 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer185 n_br_185 n_br_186 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj185 ground ground n_bl_186 ground n_br_186 ground vdd_readl ground memorycell
Xwirel186 n_bl_186 n_bl_187 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer186 n_br_186 n_br_187 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj186 ground ground n_bl_187 ground n_br_187 ground vdd_readl ground memorycell
Xwirel187 n_bl_187 n_bl_188 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer187 n_br_187 n_br_188 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj187 ground ground n_bl_188 ground n_br_188 ground vdd_readl ground memorycell
Xwirel188 n_bl_188 n_bl_189 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer188 n_br_188 n_br_189 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj188 ground ground n_bl_189 ground n_br_189 ground vdd_readl ground memorycell
Xwirel189 n_bl_189 n_bl_190 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer189 n_br_189 n_br_190 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj189 ground ground n_bl_190 ground n_br_190 ground vdd_readl ground memorycell
Xwirel190 n_bl_190 n_bl_191 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer190 n_br_190 n_br_191 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj190 ground ground n_bl_191 ground n_br_191 ground vdd_readl ground memorycell
Xwirel191 n_bl_191 n_bl_192 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer191 n_br_191 n_br_192 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj191 ground ground n_bl_192 ground n_br_192 ground vdd_readl ground memorycell
Xwirel192 n_bl_192 n_bl_193 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer192 n_br_192 n_br_193 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj192 ground ground n_bl_193 ground n_br_193 ground vdd_readl ground memorycell
Xwirel193 n_bl_193 n_bl_194 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer193 n_br_193 n_br_194 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj193 ground ground n_bl_194 ground n_br_194 ground vdd_readl ground memorycell
Xwirel194 n_bl_194 n_bl_195 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer194 n_br_194 n_br_195 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj194 ground ground n_bl_195 ground n_br_195 ground vdd_readl ground memorycell
Xwirel195 n_bl_195 n_bl_196 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer195 n_br_195 n_br_196 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj195 ground ground n_bl_196 ground n_br_196 ground vdd_readl ground memorycell
Xwirel196 n_bl_196 n_bl_197 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer196 n_br_196 n_br_197 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj196 ground ground n_bl_197 ground n_br_197 ground vdd_readl ground memorycell
Xwirel197 n_bl_197 n_bl_198 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer197 n_br_197 n_br_198 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj197 ground ground n_bl_198 ground n_br_198 ground vdd_readl ground memorycell
Xwirel198 n_bl_198 n_bl_199 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer198 n_br_198 n_br_199 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj198 ground ground n_bl_199 ground n_br_199 ground vdd_readl ground memorycell
Xwirel199 n_bl_199 n_bl_200 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer199 n_br_199 n_br_200 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj199 ground ground n_bl_200 ground n_br_200 ground vdd_readl ground memorycell
Xwirel200 n_bl_200 n_bl_201 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer200 n_br_200 n_br_201 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj200 ground ground n_bl_201 ground n_br_201 ground vdd_readl ground memorycell
Xwirel201 n_bl_201 n_bl_202 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer201 n_br_201 n_br_202 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj201 ground ground n_bl_202 ground n_br_202 ground vdd_readl ground memorycell
Xwirel202 n_bl_202 n_bl_203 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer202 n_br_202 n_br_203 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj202 ground ground n_bl_203 ground n_br_203 ground vdd_readl ground memorycell
Xwirel203 n_bl_203 n_bl_204 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer203 n_br_203 n_br_204 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj203 ground ground n_bl_204 ground n_br_204 ground vdd_readl ground memorycell
Xwirel204 n_bl_204 n_bl_205 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer204 n_br_204 n_br_205 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj204 ground ground n_bl_205 ground n_br_205 ground vdd_readl ground memorycell
Xwirel205 n_bl_205 n_bl_206 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer205 n_br_205 n_br_206 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj205 ground ground n_bl_206 ground n_br_206 ground vdd_readl ground memorycell
Xwirel206 n_bl_206 n_bl_207 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer206 n_br_206 n_br_207 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj206 ground ground n_bl_207 ground n_br_207 ground vdd_readl ground memorycell
Xwirel207 n_bl_207 n_bl_208 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer207 n_br_207 n_br_208 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj207 ground ground n_bl_208 ground n_br_208 ground vdd_readl ground memorycell
Xwirel208 n_bl_208 n_bl_209 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer208 n_br_208 n_br_209 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj208 ground ground n_bl_209 ground n_br_209 ground vdd_readl ground memorycell
Xwirel209 n_bl_209 n_bl_210 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer209 n_br_209 n_br_210 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj209 ground ground n_bl_210 ground n_br_210 ground vdd_readl ground memorycell
Xwirel210 n_bl_210 n_bl_211 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer210 n_br_210 n_br_211 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj210 ground ground n_bl_211 ground n_br_211 ground vdd_readl ground memorycell
Xwirel211 n_bl_211 n_bl_212 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer211 n_br_211 n_br_212 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj211 ground ground n_bl_212 ground n_br_212 ground vdd_readl ground memorycell
Xwirel212 n_bl_212 n_bl_213 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer212 n_br_212 n_br_213 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj212 ground ground n_bl_213 ground n_br_213 ground vdd_readl ground memorycell
Xwirel213 n_bl_213 n_bl_214 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer213 n_br_213 n_br_214 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj213 ground ground n_bl_214 ground n_br_214 ground vdd_readl ground memorycell
Xwirel214 n_bl_214 n_bl_215 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer214 n_br_214 n_br_215 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj214 ground ground n_bl_215 ground n_br_215 ground vdd_readl ground memorycell
Xwirel215 n_bl_215 n_bl_216 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer215 n_br_215 n_br_216 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj215 ground ground n_bl_216 ground n_br_216 ground vdd_readl ground memorycell
Xwirel216 n_bl_216 n_bl_217 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer216 n_br_216 n_br_217 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj216 ground ground n_bl_217 ground n_br_217 ground vdd_readl ground memorycell
Xwirel217 n_bl_217 n_bl_218 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer217 n_br_217 n_br_218 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj217 ground ground n_bl_218 ground n_br_218 ground vdd_readl ground memorycell
Xwirel218 n_bl_218 n_bl_219 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer218 n_br_218 n_br_219 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj218 ground ground n_bl_219 ground n_br_219 ground vdd_readl ground memorycell
Xwirel219 n_bl_219 n_bl_220 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer219 n_br_219 n_br_220 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj219 ground ground n_bl_220 ground n_br_220 ground vdd_readl ground memorycell
Xwirel220 n_bl_220 n_bl_221 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer220 n_br_220 n_br_221 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj220 ground ground n_bl_221 ground n_br_221 ground vdd_readl ground memorycell
Xwirel221 n_bl_221 n_bl_222 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer221 n_br_221 n_br_222 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj221 ground ground n_bl_222 ground n_br_222 ground vdd_readl ground memorycell
Xwirel222 n_bl_222 n_bl_223 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer222 n_br_222 n_br_223 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj222 ground ground n_bl_223 ground n_br_223 ground vdd_readl ground memorycell
Xwirel223 n_bl_223 n_bl_224 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer223 n_br_223 n_br_224 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj223 ground ground n_bl_224 ground n_br_224 ground vdd_readl ground memorycell
Xwirel224 n_bl_224 n_bl_225 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer224 n_br_224 n_br_225 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj224 ground ground n_bl_225 ground n_br_225 ground vdd_readl ground memorycell
Xwirel225 n_bl_225 n_bl_226 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer225 n_br_225 n_br_226 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj225 ground ground n_bl_226 ground n_br_226 ground vdd_readl ground memorycell
Xwirel226 n_bl_226 n_bl_227 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer226 n_br_226 n_br_227 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj226 ground ground n_bl_227 ground n_br_227 ground vdd_readl ground memorycell
Xwirel227 n_bl_227 n_bl_228 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer227 n_br_227 n_br_228 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj227 ground ground n_bl_228 ground n_br_228 ground vdd_readl ground memorycell
Xwirel228 n_bl_228 n_bl_229 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer228 n_br_228 n_br_229 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj228 ground ground n_bl_229 ground n_br_229 ground vdd_readl ground memorycell
Xwirel229 n_bl_229 n_bl_230 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer229 n_br_229 n_br_230 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj229 ground ground n_bl_230 ground n_br_230 ground vdd_readl ground memorycell
Xwirel230 n_bl_230 n_bl_231 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer230 n_br_230 n_br_231 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj230 ground ground n_bl_231 ground n_br_231 ground vdd_readl ground memorycell
Xwirel231 n_bl_231 n_bl_232 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer231 n_br_231 n_br_232 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj231 ground ground n_bl_232 ground n_br_232 ground vdd_readl ground memorycell
Xwirel232 n_bl_232 n_bl_233 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer232 n_br_232 n_br_233 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj232 ground ground n_bl_233 ground n_br_233 ground vdd_readl ground memorycell
Xwirel233 n_bl_233 n_bl_234 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer233 n_br_233 n_br_234 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj233 ground ground n_bl_234 ground n_br_234 ground vdd_readl ground memorycell
Xwirel234 n_bl_234 n_bl_235 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer234 n_br_234 n_br_235 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj234 ground ground n_bl_235 ground n_br_235 ground vdd_readl ground memorycell
Xwirel235 n_bl_235 n_bl_236 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer235 n_br_235 n_br_236 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj235 ground ground n_bl_236 ground n_br_236 ground vdd_readl ground memorycell
Xwirel236 n_bl_236 n_bl_237 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer236 n_br_236 n_br_237 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj236 ground ground n_bl_237 ground n_br_237 ground vdd_readl ground memorycell
Xwirel237 n_bl_237 n_bl_238 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer237 n_br_237 n_br_238 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj237 ground ground n_bl_238 ground n_br_238 ground vdd_readl ground memorycell
Xwirel238 n_bl_238 n_bl_239 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer238 n_br_238 n_br_239 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj238 ground ground n_bl_239 ground n_br_239 ground vdd_readl ground memorycell
Xwirel239 n_bl_239 n_bl_240 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer239 n_br_239 n_br_240 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj239 ground ground n_bl_240 ground n_br_240 ground vdd_readl ground memorycell
Xwirel240 n_bl_240 n_bl_241 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer240 n_br_240 n_br_241 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj240 ground ground n_bl_241 ground n_br_241 ground vdd_readl ground memorycell
Xwirel241 n_bl_241 n_bl_242 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer241 n_br_241 n_br_242 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj241 ground ground n_bl_242 ground n_br_242 ground vdd_readl ground memorycell
Xwirel242 n_bl_242 n_bl_243 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer242 n_br_242 n_br_243 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj242 ground ground n_bl_243 ground n_br_243 ground vdd_readl ground memorycell
Xwirel243 n_bl_243 n_bl_244 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer243 n_br_243 n_br_244 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj243 ground ground n_bl_244 ground n_br_244 ground vdd_readl ground memorycell
Xwirel244 n_bl_244 n_bl_245 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer244 n_br_244 n_br_245 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj244 ground ground n_bl_245 ground n_br_245 ground vdd_readl ground memorycell
Xwirel245 n_bl_245 n_bl_246 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer245 n_br_245 n_br_246 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj245 ground ground n_bl_246 ground n_br_246 ground vdd_readl ground memorycell
Xwirel246 n_bl_246 n_bl_247 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer246 n_br_246 n_br_247 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj246 ground ground n_bl_247 ground n_br_247 ground vdd_readl ground memorycell
Xwirel247 n_bl_247 n_bl_248 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer247 n_br_247 n_br_248 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj247 ground ground n_bl_248 ground n_br_248 ground vdd_readl ground memorycell
Xwirel248 n_bl_248 n_bl_249 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer248 n_br_248 n_br_249 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj248 ground ground n_bl_249 ground n_br_249 ground vdd_readl ground memorycell
Xwirel249 n_bl_249 n_bl_250 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer249 n_br_249 n_br_250 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj249 ground ground n_bl_250 ground n_br_250 ground vdd_readl ground memorycell
Xwirel250 n_bl_250 n_bl_251 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer250 n_br_250 n_br_251 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj250 ground ground n_bl_251 ground n_br_251 ground vdd_readl ground memorycell
Xwirel251 n_bl_251 n_bl_252 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer251 n_br_251 n_br_252 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj251 ground ground n_bl_252 ground n_br_252 ground vdd_readl ground memorycell
Xwirel252 n_bl_252 n_bl_253 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer252 n_br_252 n_br_253 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj252 ground ground n_bl_253 ground n_br_253 ground vdd_readl ground memorycell
Xwirel253 n_bl_253 n_bl_254 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer253 n_br_253 n_br_254 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj253 ground ground n_bl_254 ground n_br_254 ground vdd_readl ground memorycell
Xwirel254 n_bl_254 n_bl_255 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer254 n_br_254 n_br_255 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj254 ground ground n_bl_255 ground n_br_255 ground vdd_readl ground memorycell
Xwirel255 n_bl_255 n_bl_256 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer255 n_br_255 n_br_256 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj255 ground ground n_bl_256 ground n_br_256 ground vdd_readl ground memorycell
Xwirel256 n_bl_256 n_bl_257 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer256 n_br_256 n_br_257 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj256 ground ground n_bl_257 ground n_br_257 ground vdd_readl ground memorycell
Xwirel257 n_bl_257 n_bl_258 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer257 n_br_257 n_br_258 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj257 ground ground n_bl_258 ground n_br_258 ground vdd_readl ground memorycell
Xwirel258 n_bl_258 n_bl_259 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer258 n_br_258 n_br_259 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj258 ground ground n_bl_259 ground n_br_259 ground vdd_readl ground memorycell
Xwirel259 n_bl_259 n_bl_260 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer259 n_br_259 n_br_260 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj259 ground ground n_bl_260 ground n_br_260 ground vdd_readl ground memorycell
Xwirel260 n_bl_260 n_bl_261 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer260 n_br_260 n_br_261 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj260 ground ground n_bl_261 ground n_br_261 ground vdd_readl ground memorycell
Xwirel261 n_bl_261 n_bl_262 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer261 n_br_261 n_br_262 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj261 ground ground n_bl_262 ground n_br_262 ground vdd_readl ground memorycell
Xwirel262 n_bl_262 n_bl_263 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer262 n_br_262 n_br_263 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj262 ground ground n_bl_263 ground n_br_263 ground vdd_readl ground memorycell
Xwirel263 n_bl_263 n_bl_264 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer263 n_br_263 n_br_264 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj263 ground ground n_bl_264 ground n_br_264 ground vdd_readl ground memorycell
Xwirel264 n_bl_264 n_bl_265 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer264 n_br_264 n_br_265 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj264 ground ground n_bl_265 ground n_br_265 ground vdd_readl ground memorycell
Xwirel265 n_bl_265 n_bl_266 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer265 n_br_265 n_br_266 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj265 ground ground n_bl_266 ground n_br_266 ground vdd_readl ground memorycell
Xwirel266 n_bl_266 n_bl_267 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer266 n_br_266 n_br_267 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj266 ground ground n_bl_267 ground n_br_267 ground vdd_readl ground memorycell
Xwirel267 n_bl_267 n_bl_268 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer267 n_br_267 n_br_268 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj267 ground ground n_bl_268 ground n_br_268 ground vdd_readl ground memorycell
Xwirel268 n_bl_268 n_bl_269 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer268 n_br_268 n_br_269 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj268 ground ground n_bl_269 ground n_br_269 ground vdd_readl ground memorycell
Xwirel269 n_bl_269 n_bl_270 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer269 n_br_269 n_br_270 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj269 ground ground n_bl_270 ground n_br_270 ground vdd_readl ground memorycell
Xwirel270 n_bl_270 n_bl_271 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer270 n_br_270 n_br_271 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj270 ground ground n_bl_271 ground n_br_271 ground vdd_readl ground memorycell
Xwirel271 n_bl_271 n_bl_272 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer271 n_br_271 n_br_272 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj271 ground ground n_bl_272 ground n_br_272 ground vdd_readl ground memorycell
Xwirel272 n_bl_272 n_bl_273 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer272 n_br_272 n_br_273 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj272 ground ground n_bl_273 ground n_br_273 ground vdd_readl ground memorycell
Xwirel273 n_bl_273 n_bl_274 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer273 n_br_273 n_br_274 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj273 ground ground n_bl_274 ground n_br_274 ground vdd_readl ground memorycell
Xwirel274 n_bl_274 n_bl_275 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer274 n_br_274 n_br_275 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj274 ground ground n_bl_275 ground n_br_275 ground vdd_readl ground memorycell
Xwirel275 n_bl_275 n_bl_276 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer275 n_br_275 n_br_276 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj275 ground ground n_bl_276 ground n_br_276 ground vdd_readl ground memorycell
Xwirel276 n_bl_276 n_bl_277 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer276 n_br_276 n_br_277 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj276 ground ground n_bl_277 ground n_br_277 ground vdd_readl ground memorycell
Xwirel277 n_bl_277 n_bl_278 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer277 n_br_277 n_br_278 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj277 ground ground n_bl_278 ground n_br_278 ground vdd_readl ground memorycell
Xwirel278 n_bl_278 n_bl_279 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer278 n_br_278 n_br_279 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj278 ground ground n_bl_279 ground n_br_279 ground vdd_readl ground memorycell
Xwirel279 n_bl_279 n_bl_280 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer279 n_br_279 n_br_280 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj279 ground ground n_bl_280 ground n_br_280 ground vdd_readl ground memorycell
Xwirel280 n_bl_280 n_bl_281 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer280 n_br_280 n_br_281 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj280 ground ground n_bl_281 ground n_br_281 ground vdd_readl ground memorycell
Xwirel281 n_bl_281 n_bl_282 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer281 n_br_281 n_br_282 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj281 ground ground n_bl_282 ground n_br_282 ground vdd_readl ground memorycell
Xwirel282 n_bl_282 n_bl_283 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer282 n_br_282 n_br_283 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj282 ground ground n_bl_283 ground n_br_283 ground vdd_readl ground memorycell
Xwirel283 n_bl_283 n_bl_284 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer283 n_br_283 n_br_284 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj283 ground ground n_bl_284 ground n_br_284 ground vdd_readl ground memorycell
Xwirel284 n_bl_284 n_bl_285 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer284 n_br_284 n_br_285 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj284 ground ground n_bl_285 ground n_br_285 ground vdd_readl ground memorycell
Xwirel285 n_bl_285 n_bl_286 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer285 n_br_285 n_br_286 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj285 ground ground n_bl_286 ground n_br_286 ground vdd_readl ground memorycell
Xwirel286 n_bl_286 n_bl_287 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer286 n_br_286 n_br_287 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj286 ground ground n_bl_287 ground n_br_287 ground vdd_readl ground memorycell
Xwirel287 n_bl_287 n_bl_288 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer287 n_br_287 n_br_288 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj287 ground ground n_bl_288 ground n_br_288 ground vdd_readl ground memorycell
Xwirel288 n_bl_288 n_bl_289 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer288 n_br_288 n_br_289 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj288 ground ground n_bl_289 ground n_br_289 ground vdd_readl ground memorycell
Xwirel289 n_bl_289 n_bl_290 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer289 n_br_289 n_br_290 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj289 ground ground n_bl_290 ground n_br_290 ground vdd_readl ground memorycell
Xwirel290 n_bl_290 n_bl_291 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer290 n_br_290 n_br_291 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj290 ground ground n_bl_291 ground n_br_291 ground vdd_readl ground memorycell
Xwirel291 n_bl_291 n_bl_292 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer291 n_br_291 n_br_292 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj291 ground ground n_bl_292 ground n_br_292 ground vdd_readl ground memorycell
Xwirel292 n_bl_292 n_bl_293 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer292 n_br_292 n_br_293 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj292 ground ground n_bl_293 ground n_br_293 ground vdd_readl ground memorycell
Xwirel293 n_bl_293 n_bl_294 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer293 n_br_293 n_br_294 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj293 ground ground n_bl_294 ground n_br_294 ground vdd_readl ground memorycell
Xwirel294 n_bl_294 n_bl_295 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer294 n_br_294 n_br_295 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj294 ground ground n_bl_295 ground n_br_295 ground vdd_readl ground memorycell
Xwirel295 n_bl_295 n_bl_296 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer295 n_br_295 n_br_296 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj295 ground ground n_bl_296 ground n_br_296 ground vdd_readl ground memorycell
Xwirel296 n_bl_296 n_bl_297 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer296 n_br_296 n_br_297 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj296 ground ground n_bl_297 ground n_br_297 ground vdd_readl ground memorycell
Xwirel297 n_bl_297 n_bl_298 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer297 n_br_297 n_br_298 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj297 ground ground n_bl_298 ground n_br_298 ground vdd_readl ground memorycell
Xwirel298 n_bl_298 n_bl_299 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer298 n_br_298 n_br_299 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj298 ground ground n_bl_299 ground n_br_299 ground vdd_readl ground memorycell
Xwirel299 n_bl_299 n_bl_300 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer299 n_br_299 n_br_300 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj299 ground ground n_bl_300 ground n_br_300 ground vdd_readl ground memorycell
Xwirel300 n_bl_300 n_bl_301 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer300 n_br_300 n_br_301 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj300 ground ground n_bl_301 ground n_br_301 ground vdd_readl ground memorycell
Xwirel301 n_bl_301 n_bl_302 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer301 n_br_301 n_br_302 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj301 ground ground n_bl_302 ground n_br_302 ground vdd_readl ground memorycell
Xwirel302 n_bl_302 n_bl_303 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer302 n_br_302 n_br_303 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj302 ground ground n_bl_303 ground n_br_303 ground vdd_readl ground memorycell
Xwirel303 n_bl_303 n_bl_304 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer303 n_br_303 n_br_304 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj303 ground ground n_bl_304 ground n_br_304 ground vdd_readl ground memorycell
Xwirel304 n_bl_304 n_bl_305 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer304 n_br_304 n_br_305 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj304 ground ground n_bl_305 ground n_br_305 ground vdd_readl ground memorycell
Xwirel305 n_bl_305 n_bl_306 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer305 n_br_305 n_br_306 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj305 ground ground n_bl_306 ground n_br_306 ground vdd_readl ground memorycell
Xwirel306 n_bl_306 n_bl_307 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer306 n_br_306 n_br_307 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj306 ground ground n_bl_307 ground n_br_307 ground vdd_readl ground memorycell
Xwirel307 n_bl_307 n_bl_308 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer307 n_br_307 n_br_308 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj307 ground ground n_bl_308 ground n_br_308 ground vdd_readl ground memorycell
Xwirel308 n_bl_308 n_bl_309 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer308 n_br_308 n_br_309 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj308 ground ground n_bl_309 ground n_br_309 ground vdd_readl ground memorycell
Xwirel309 n_bl_309 n_bl_310 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer309 n_br_309 n_br_310 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj309 ground ground n_bl_310 ground n_br_310 ground vdd_readl ground memorycell
Xwirel310 n_bl_310 n_bl_311 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer310 n_br_310 n_br_311 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj310 ground ground n_bl_311 ground n_br_311 ground vdd_readl ground memorycell
Xwirel311 n_bl_311 n_bl_312 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer311 n_br_311 n_br_312 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj311 ground ground n_bl_312 ground n_br_312 ground vdd_readl ground memorycell
Xwirel312 n_bl_312 n_bl_313 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer312 n_br_312 n_br_313 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj312 ground ground n_bl_313 ground n_br_313 ground vdd_readl ground memorycell
Xwirel313 n_bl_313 n_bl_314 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer313 n_br_313 n_br_314 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj313 ground ground n_bl_314 ground n_br_314 ground vdd_readl ground memorycell
Xwirel314 n_bl_314 n_bl_315 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer314 n_br_314 n_br_315 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj314 ground ground n_bl_315 ground n_br_315 ground vdd_readl ground memorycell
Xwirel315 n_bl_315 n_bl_316 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer315 n_br_315 n_br_316 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj315 ground ground n_bl_316 ground n_br_316 ground vdd_readl ground memorycell
Xwirel316 n_bl_316 n_bl_317 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer316 n_br_316 n_br_317 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj316 ground ground n_bl_317 ground n_br_317 ground vdd_readl ground memorycell
Xwirel317 n_bl_317 n_bl_318 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer317 n_br_317 n_br_318 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj317 ground ground n_bl_318 ground n_br_318 ground vdd_readl ground memorycell
Xwirel318 n_bl_318 n_bl_319 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer318 n_br_318 n_br_319 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj318 ground ground n_bl_319 ground n_br_319 ground vdd_readl ground memorycell
Xwirel319 n_bl_319 n_bl_320 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer319 n_br_319 n_br_320 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj319 ground ground n_bl_320 ground n_br_320 ground vdd_readl ground memorycell
Xwirel320 n_bl_320 n_bl_321 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer320 n_br_320 n_br_321 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj320 ground ground n_bl_321 ground n_br_321 ground vdd_readl ground memorycell
Xwirel321 n_bl_321 n_bl_322 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer321 n_br_321 n_br_322 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj321 ground ground n_bl_322 ground n_br_322 ground vdd_readl ground memorycell
Xwirel322 n_bl_322 n_bl_323 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer322 n_br_322 n_br_323 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj322 ground ground n_bl_323 ground n_br_323 ground vdd_readl ground memorycell
Xwirel323 n_bl_323 n_bl_324 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer323 n_br_323 n_br_324 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj323 ground ground n_bl_324 ground n_br_324 ground vdd_readl ground memorycell
Xwirel324 n_bl_324 n_bl_325 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer324 n_br_324 n_br_325 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj324 ground ground n_bl_325 ground n_br_325 ground vdd_readl ground memorycell
Xwirel325 n_bl_325 n_bl_326 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer325 n_br_325 n_br_326 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj325 ground ground n_bl_326 ground n_br_326 ground vdd_readl ground memorycell
Xwirel326 n_bl_326 n_bl_327 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer326 n_br_326 n_br_327 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj326 ground ground n_bl_327 ground n_br_327 ground vdd_readl ground memorycell
Xwirel327 n_bl_327 n_bl_328 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer327 n_br_327 n_br_328 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj327 ground ground n_bl_328 ground n_br_328 ground vdd_readl ground memorycell
Xwirel328 n_bl_328 n_bl_329 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer328 n_br_328 n_br_329 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj328 ground ground n_bl_329 ground n_br_329 ground vdd_readl ground memorycell
Xwirel329 n_bl_329 n_bl_330 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer329 n_br_329 n_br_330 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj329 ground ground n_bl_330 ground n_br_330 ground vdd_readl ground memorycell
Xwirel330 n_bl_330 n_bl_331 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer330 n_br_330 n_br_331 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj330 ground ground n_bl_331 ground n_br_331 ground vdd_readl ground memorycell
Xwirel331 n_bl_331 n_bl_332 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer331 n_br_331 n_br_332 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj331 ground ground n_bl_332 ground n_br_332 ground vdd_readl ground memorycell
Xwirel332 n_bl_332 n_bl_333 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer332 n_br_332 n_br_333 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj332 ground ground n_bl_333 ground n_br_333 ground vdd_readl ground memorycell
Xwirel333 n_bl_333 n_bl_334 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer333 n_br_333 n_br_334 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj333 ground ground n_bl_334 ground n_br_334 ground vdd_readl ground memorycell
Xwirel334 n_bl_334 n_bl_335 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer334 n_br_334 n_br_335 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj334 ground ground n_bl_335 ground n_br_335 ground vdd_readl ground memorycell
Xwirel335 n_bl_335 n_bl_336 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer335 n_br_335 n_br_336 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj335 ground ground n_bl_336 ground n_br_336 ground vdd_readl ground memorycell
Xwirel336 n_bl_336 n_bl_337 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer336 n_br_336 n_br_337 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj336 ground ground n_bl_337 ground n_br_337 ground vdd_readl ground memorycell
Xwirel337 n_bl_337 n_bl_338 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer337 n_br_337 n_br_338 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj337 ground ground n_bl_338 ground n_br_338 ground vdd_readl ground memorycell
Xwirel338 n_bl_338 n_bl_339 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer338 n_br_338 n_br_339 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj338 ground ground n_bl_339 ground n_br_339 ground vdd_readl ground memorycell
Xwirel339 n_bl_339 n_bl_340 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer339 n_br_339 n_br_340 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj339 ground ground n_bl_340 ground n_br_340 ground vdd_readl ground memorycell
Xwirel340 n_bl_340 n_bl_341 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer340 n_br_340 n_br_341 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj340 ground ground n_bl_341 ground n_br_341 ground vdd_readl ground memorycell
Xwirel341 n_bl_341 n_bl_342 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer341 n_br_341 n_br_342 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj341 ground ground n_bl_342 ground n_br_342 ground vdd_readl ground memorycell
Xwirel342 n_bl_342 n_bl_343 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer342 n_br_342 n_br_343 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj342 ground ground n_bl_343 ground n_br_343 ground vdd_readl ground memorycell
Xwirel343 n_bl_343 n_bl_344 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer343 n_br_343 n_br_344 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj343 ground ground n_bl_344 ground n_br_344 ground vdd_readl ground memorycell
Xwirel344 n_bl_344 n_bl_345 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer344 n_br_344 n_br_345 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj344 ground ground n_bl_345 ground n_br_345 ground vdd_readl ground memorycell
Xwirel345 n_bl_345 n_bl_346 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer345 n_br_345 n_br_346 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj345 ground ground n_bl_346 ground n_br_346 ground vdd_readl ground memorycell
Xwirel346 n_bl_346 n_bl_347 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer346 n_br_346 n_br_347 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj346 ground ground n_bl_347 ground n_br_347 ground vdd_readl ground memorycell
Xwirel347 n_bl_347 n_bl_348 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer347 n_br_347 n_br_348 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj347 ground ground n_bl_348 ground n_br_348 ground vdd_readl ground memorycell
Xwirel348 n_bl_348 n_bl_349 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer348 n_br_348 n_br_349 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj348 ground ground n_bl_349 ground n_br_349 ground vdd_readl ground memorycell
Xwirel349 n_bl_349 n_bl_350 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer349 n_br_349 n_br_350 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj349 ground ground n_bl_350 ground n_br_350 ground vdd_readl ground memorycell
Xwirel350 n_bl_350 n_bl_351 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer350 n_br_350 n_br_351 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj350 ground ground n_bl_351 ground n_br_351 ground vdd_readl ground memorycell
Xwirel351 n_bl_351 n_bl_352 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer351 n_br_351 n_br_352 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj351 ground ground n_bl_352 ground n_br_352 ground vdd_readl ground memorycell
Xwirel352 n_bl_352 n_bl_353 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer352 n_br_352 n_br_353 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj352 ground ground n_bl_353 ground n_br_353 ground vdd_readl ground memorycell
Xwirel353 n_bl_353 n_bl_354 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer353 n_br_353 n_br_354 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj353 ground ground n_bl_354 ground n_br_354 ground vdd_readl ground memorycell
Xwirel354 n_bl_354 n_bl_355 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer354 n_br_354 n_br_355 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj354 ground ground n_bl_355 ground n_br_355 ground vdd_readl ground memorycell
Xwirel355 n_bl_355 n_bl_356 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer355 n_br_355 n_br_356 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj355 ground ground n_bl_356 ground n_br_356 ground vdd_readl ground memorycell
Xwirel356 n_bl_356 n_bl_357 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer356 n_br_356 n_br_357 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj356 ground ground n_bl_357 ground n_br_357 ground vdd_readl ground memorycell
Xwirel357 n_bl_357 n_bl_358 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer357 n_br_357 n_br_358 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj357 ground ground n_bl_358 ground n_br_358 ground vdd_readl ground memorycell
Xwirel358 n_bl_358 n_bl_359 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer358 n_br_358 n_br_359 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj358 ground ground n_bl_359 ground n_br_359 ground vdd_readl ground memorycell
Xwirel359 n_bl_359 n_bl_360 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer359 n_br_359 n_br_360 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj359 ground ground n_bl_360 ground n_br_360 ground vdd_readl ground memorycell
Xwirel360 n_bl_360 n_bl_361 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer360 n_br_360 n_br_361 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj360 ground ground n_bl_361 ground n_br_361 ground vdd_readl ground memorycell
Xwirel361 n_bl_361 n_bl_362 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer361 n_br_361 n_br_362 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj361 ground ground n_bl_362 ground n_br_362 ground vdd_readl ground memorycell
Xwirel362 n_bl_362 n_bl_363 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer362 n_br_362 n_br_363 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj362 ground ground n_bl_363 ground n_br_363 ground vdd_readl ground memorycell
Xwirel363 n_bl_363 n_bl_364 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer363 n_br_363 n_br_364 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj363 ground ground n_bl_364 ground n_br_364 ground vdd_readl ground memorycell
Xwirel364 n_bl_364 n_bl_365 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer364 n_br_364 n_br_365 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj364 ground ground n_bl_365 ground n_br_365 ground vdd_readl ground memorycell
Xwirel365 n_bl_365 n_bl_366 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer365 n_br_365 n_br_366 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj365 ground ground n_bl_366 ground n_br_366 ground vdd_readl ground memorycell
Xwirel366 n_bl_366 n_bl_367 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer366 n_br_366 n_br_367 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj366 ground ground n_bl_367 ground n_br_367 ground vdd_readl ground memorycell
Xwirel367 n_bl_367 n_bl_368 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer367 n_br_367 n_br_368 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj367 ground ground n_bl_368 ground n_br_368 ground vdd_readl ground memorycell
Xwirel368 n_bl_368 n_bl_369 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer368 n_br_368 n_br_369 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj368 ground ground n_bl_369 ground n_br_369 ground vdd_readl ground memorycell
Xwirel369 n_bl_369 n_bl_370 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer369 n_br_369 n_br_370 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj369 ground ground n_bl_370 ground n_br_370 ground vdd_readl ground memorycell
Xwirel370 n_bl_370 n_bl_371 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer370 n_br_370 n_br_371 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj370 ground ground n_bl_371 ground n_br_371 ground vdd_readl ground memorycell
Xwirel371 n_bl_371 n_bl_372 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer371 n_br_371 n_br_372 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj371 ground ground n_bl_372 ground n_br_372 ground vdd_readl ground memorycell
Xwirel372 n_bl_372 n_bl_373 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer372 n_br_372 n_br_373 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj372 ground ground n_bl_373 ground n_br_373 ground vdd_readl ground memorycell
Xwirel373 n_bl_373 n_bl_374 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer373 n_br_373 n_br_374 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj373 ground ground n_bl_374 ground n_br_374 ground vdd_readl ground memorycell
Xwirel374 n_bl_374 n_bl_375 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer374 n_br_374 n_br_375 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj374 ground ground n_bl_375 ground n_br_375 ground vdd_readl ground memorycell
Xwirel375 n_bl_375 n_bl_376 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer375 n_br_375 n_br_376 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj375 ground ground n_bl_376 ground n_br_376 ground vdd_readl ground memorycell
Xwirel376 n_bl_376 n_bl_377 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer376 n_br_376 n_br_377 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj376 ground ground n_bl_377 ground n_br_377 ground vdd_readl ground memorycell
Xwirel377 n_bl_377 n_bl_378 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer377 n_br_377 n_br_378 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj377 ground ground n_bl_378 ground n_br_378 ground vdd_readl ground memorycell
Xwirel378 n_bl_378 n_bl_379 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer378 n_br_378 n_br_379 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj378 ground ground n_bl_379 ground n_br_379 ground vdd_readl ground memorycell
Xwirel379 n_bl_379 n_bl_380 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer379 n_br_379 n_br_380 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj379 ground ground n_bl_380 ground n_br_380 ground vdd_readl ground memorycell
Xwirel380 n_bl_380 n_bl_381 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer380 n_br_380 n_br_381 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj380 ground ground n_bl_381 ground n_br_381 ground vdd_readl ground memorycell
Xwirel381 n_bl_381 n_bl_382 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer381 n_br_381 n_br_382 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj381 ground ground n_bl_382 ground n_br_382 ground vdd_readl ground memorycell
Xwirel382 n_bl_382 n_bl_383 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer382 n_br_382 n_br_383 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj382 ground ground n_bl_383 ground n_br_383 ground vdd_readl ground memorycell
Xwirel383 n_bl_383 n_bl_384 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer383 n_br_383 n_br_384 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj383 ground ground n_bl_384 ground n_br_384 ground vdd_readl ground memorycell
Xwirel384 n_bl_384 n_bl_385 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer384 n_br_384 n_br_385 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj384 ground ground n_bl_385 ground n_br_385 ground vdd_readl ground memorycell
Xwirel385 n_bl_385 n_bl_386 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer385 n_br_385 n_br_386 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj385 ground ground n_bl_386 ground n_br_386 ground vdd_readl ground memorycell
Xwirel386 n_bl_386 n_bl_387 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer386 n_br_386 n_br_387 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj386 ground ground n_bl_387 ground n_br_387 ground vdd_readl ground memorycell
Xwirel387 n_bl_387 n_bl_388 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer387 n_br_387 n_br_388 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj387 ground ground n_bl_388 ground n_br_388 ground vdd_readl ground memorycell
Xwirel388 n_bl_388 n_bl_389 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer388 n_br_388 n_br_389 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj388 ground ground n_bl_389 ground n_br_389 ground vdd_readl ground memorycell
Xwirel389 n_bl_389 n_bl_390 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer389 n_br_389 n_br_390 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj389 ground ground n_bl_390 ground n_br_390 ground vdd_readl ground memorycell
Xwirel390 n_bl_390 n_bl_391 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer390 n_br_390 n_br_391 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj390 ground ground n_bl_391 ground n_br_391 ground vdd_readl ground memorycell
Xwirel391 n_bl_391 n_bl_392 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer391 n_br_391 n_br_392 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj391 ground ground n_bl_392 ground n_br_392 ground vdd_readl ground memorycell
Xwirel392 n_bl_392 n_bl_393 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer392 n_br_392 n_br_393 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj392 ground ground n_bl_393 ground n_br_393 ground vdd_readl ground memorycell
Xwirel393 n_bl_393 n_bl_394 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer393 n_br_393 n_br_394 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj393 ground ground n_bl_394 ground n_br_394 ground vdd_readl ground memorycell
Xwirel394 n_bl_394 n_bl_395 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer394 n_br_394 n_br_395 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj394 ground ground n_bl_395 ground n_br_395 ground vdd_readl ground memorycell
Xwirel395 n_bl_395 n_bl_396 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer395 n_br_395 n_br_396 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj395 ground ground n_bl_396 ground n_br_396 ground vdd_readl ground memorycell
Xwirel396 n_bl_396 n_bl_397 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer396 n_br_396 n_br_397 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj396 ground ground n_bl_397 ground n_br_397 ground vdd_readl ground memorycell
Xwirel397 n_bl_397 n_bl_398 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer397 n_br_397 n_br_398 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj397 ground ground n_bl_398 ground n_br_398 ground vdd_readl ground memorycell
Xwirel398 n_bl_398 n_bl_399 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer398 n_br_398 n_br_399 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj398 ground ground n_bl_399 ground n_br_399 ground vdd_readl ground memorycell
Xwirel399 n_bl_399 n_bl_400 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer399 n_br_399 n_br_400 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj399 ground ground n_bl_400 ground n_br_400 ground vdd_readl ground memorycell
Xwirel400 n_bl_400 n_bl_401 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer400 n_br_400 n_br_401 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj400 ground ground n_bl_401 ground n_br_401 ground vdd_readl ground memorycell
Xwirel401 n_bl_401 n_bl_402 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer401 n_br_401 n_br_402 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj401 ground ground n_bl_402 ground n_br_402 ground vdd_readl ground memorycell
Xwirel402 n_bl_402 n_bl_403 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer402 n_br_402 n_br_403 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj402 ground ground n_bl_403 ground n_br_403 ground vdd_readl ground memorycell
Xwirel403 n_bl_403 n_bl_404 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer403 n_br_403 n_br_404 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj403 ground ground n_bl_404 ground n_br_404 ground vdd_readl ground memorycell
Xwirel404 n_bl_404 n_bl_405 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer404 n_br_404 n_br_405 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj404 ground ground n_bl_405 ground n_br_405 ground vdd_readl ground memorycell
Xwirel405 n_bl_405 n_bl_406 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer405 n_br_405 n_br_406 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj405 ground ground n_bl_406 ground n_br_406 ground vdd_readl ground memorycell
Xwirel406 n_bl_406 n_bl_407 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer406 n_br_406 n_br_407 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj406 ground ground n_bl_407 ground n_br_407 ground vdd_readl ground memorycell
Xwirel407 n_bl_407 n_bl_408 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer407 n_br_407 n_br_408 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj407 ground ground n_bl_408 ground n_br_408 ground vdd_readl ground memorycell
Xwirel408 n_bl_408 n_bl_409 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer408 n_br_408 n_br_409 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj408 ground ground n_bl_409 ground n_br_409 ground vdd_readl ground memorycell
Xwirel409 n_bl_409 n_bl_410 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer409 n_br_409 n_br_410 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj409 ground ground n_bl_410 ground n_br_410 ground vdd_readl ground memorycell
Xwirel410 n_bl_410 n_bl_411 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer410 n_br_410 n_br_411 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj410 ground ground n_bl_411 ground n_br_411 ground vdd_readl ground memorycell
Xwirel411 n_bl_411 n_bl_412 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer411 n_br_411 n_br_412 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj411 ground ground n_bl_412 ground n_br_412 ground vdd_readl ground memorycell
Xwirel412 n_bl_412 n_bl_413 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer412 n_br_412 n_br_413 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj412 ground ground n_bl_413 ground n_br_413 ground vdd_readl ground memorycell
Xwirel413 n_bl_413 n_bl_414 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer413 n_br_413 n_br_414 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj413 ground ground n_bl_414 ground n_br_414 ground vdd_readl ground memorycell
Xwirel414 n_bl_414 n_bl_415 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer414 n_br_414 n_br_415 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj414 ground ground n_bl_415 ground n_br_415 ground vdd_readl ground memorycell
Xwirel415 n_bl_415 n_bl_416 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer415 n_br_415 n_br_416 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj415 ground ground n_bl_416 ground n_br_416 ground vdd_readl ground memorycell
Xwirel416 n_bl_416 n_bl_417 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer416 n_br_416 n_br_417 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj416 ground ground n_bl_417 ground n_br_417 ground vdd_readl ground memorycell
Xwirel417 n_bl_417 n_bl_418 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer417 n_br_417 n_br_418 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj417 ground ground n_bl_418 ground n_br_418 ground vdd_readl ground memorycell
Xwirel418 n_bl_418 n_bl_419 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer418 n_br_418 n_br_419 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj418 ground ground n_bl_419 ground n_br_419 ground vdd_readl ground memorycell
Xwirel419 n_bl_419 n_bl_420 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer419 n_br_419 n_br_420 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj419 ground ground n_bl_420 ground n_br_420 ground vdd_readl ground memorycell
Xwirel420 n_bl_420 n_bl_421 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer420 n_br_420 n_br_421 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj420 ground ground n_bl_421 ground n_br_421 ground vdd_readl ground memorycell
Xwirel421 n_bl_421 n_bl_422 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer421 n_br_421 n_br_422 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj421 ground ground n_bl_422 ground n_br_422 ground vdd_readl ground memorycell
Xwirel422 n_bl_422 n_bl_423 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer422 n_br_422 n_br_423 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj422 ground ground n_bl_423 ground n_br_423 ground vdd_readl ground memorycell
Xwirel423 n_bl_423 n_bl_424 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer423 n_br_423 n_br_424 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj423 ground ground n_bl_424 ground n_br_424 ground vdd_readl ground memorycell
Xwirel424 n_bl_424 n_bl_425 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer424 n_br_424 n_br_425 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj424 ground ground n_bl_425 ground n_br_425 ground vdd_readl ground memorycell
Xwirel425 n_bl_425 n_bl_426 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer425 n_br_425 n_br_426 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj425 ground ground n_bl_426 ground n_br_426 ground vdd_readl ground memorycell
Xwirel426 n_bl_426 n_bl_427 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer426 n_br_426 n_br_427 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj426 ground ground n_bl_427 ground n_br_427 ground vdd_readl ground memorycell
Xwirel427 n_bl_427 n_bl_428 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer427 n_br_427 n_br_428 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj427 ground ground n_bl_428 ground n_br_428 ground vdd_readl ground memorycell
Xwirel428 n_bl_428 n_bl_429 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer428 n_br_428 n_br_429 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj428 ground ground n_bl_429 ground n_br_429 ground vdd_readl ground memorycell
Xwirel429 n_bl_429 n_bl_430 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer429 n_br_429 n_br_430 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj429 ground ground n_bl_430 ground n_br_430 ground vdd_readl ground memorycell
Xwirel430 n_bl_430 n_bl_431 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer430 n_br_430 n_br_431 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj430 ground ground n_bl_431 ground n_br_431 ground vdd_readl ground memorycell
Xwirel431 n_bl_431 n_bl_432 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer431 n_br_431 n_br_432 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj431 ground ground n_bl_432 ground n_br_432 ground vdd_readl ground memorycell
Xwirel432 n_bl_432 n_bl_433 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer432 n_br_432 n_br_433 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj432 ground ground n_bl_433 ground n_br_433 ground vdd_readl ground memorycell
Xwirel433 n_bl_433 n_bl_434 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer433 n_br_433 n_br_434 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj433 ground ground n_bl_434 ground n_br_434 ground vdd_readl ground memorycell
Xwirel434 n_bl_434 n_bl_435 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer434 n_br_434 n_br_435 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj434 ground ground n_bl_435 ground n_br_435 ground vdd_readl ground memorycell
Xwirel435 n_bl_435 n_bl_436 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer435 n_br_435 n_br_436 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj435 ground ground n_bl_436 ground n_br_436 ground vdd_readl ground memorycell
Xwirel436 n_bl_436 n_bl_437 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer436 n_br_436 n_br_437 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj436 ground ground n_bl_437 ground n_br_437 ground vdd_readl ground memorycell
Xwirel437 n_bl_437 n_bl_438 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer437 n_br_437 n_br_438 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj437 ground ground n_bl_438 ground n_br_438 ground vdd_readl ground memorycell
Xwirel438 n_bl_438 n_bl_439 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer438 n_br_438 n_br_439 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj438 ground ground n_bl_439 ground n_br_439 ground vdd_readl ground memorycell
Xwirel439 n_bl_439 n_bl_440 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer439 n_br_439 n_br_440 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj439 ground ground n_bl_440 ground n_br_440 ground vdd_readl ground memorycell
Xwirel440 n_bl_440 n_bl_441 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer440 n_br_440 n_br_441 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj440 ground ground n_bl_441 ground n_br_441 ground vdd_readl ground memorycell
Xwirel441 n_bl_441 n_bl_442 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer441 n_br_441 n_br_442 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj441 ground ground n_bl_442 ground n_br_442 ground vdd_readl ground memorycell
Xwirel442 n_bl_442 n_bl_443 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer442 n_br_442 n_br_443 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj442 ground ground n_bl_443 ground n_br_443 ground vdd_readl ground memorycell
Xwirel443 n_bl_443 n_bl_444 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer443 n_br_443 n_br_444 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj443 ground ground n_bl_444 ground n_br_444 ground vdd_readl ground memorycell
Xwirel444 n_bl_444 n_bl_445 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer444 n_br_444 n_br_445 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj444 ground ground n_bl_445 ground n_br_445 ground vdd_readl ground memorycell
Xwirel445 n_bl_445 n_bl_446 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer445 n_br_445 n_br_446 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj445 ground ground n_bl_446 ground n_br_446 ground vdd_readl ground memorycell
Xwirel446 n_bl_446 n_bl_447 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer446 n_br_446 n_br_447 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj446 ground ground n_bl_447 ground n_br_447 ground vdd_readl ground memorycell
Xwirel447 n_bl_447 n_bl_448 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer447 n_br_447 n_br_448 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj447 ground ground n_bl_448 ground n_br_448 ground vdd_readl ground memorycell
Xwirel448 n_bl_448 n_bl_449 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer448 n_br_448 n_br_449 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj448 ground ground n_bl_449 ground n_br_449 ground vdd_readl ground memorycell
Xwirel449 n_bl_449 n_bl_450 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer449 n_br_449 n_br_450 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj449 ground ground n_bl_450 ground n_br_450 ground vdd_readl ground memorycell
Xwirel450 n_bl_450 n_bl_451 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer450 n_br_450 n_br_451 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj450 ground ground n_bl_451 ground n_br_451 ground vdd_readl ground memorycell
Xwirel451 n_bl_451 n_bl_452 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer451 n_br_451 n_br_452 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj451 ground ground n_bl_452 ground n_br_452 ground vdd_readl ground memorycell
Xwirel452 n_bl_452 n_bl_453 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer452 n_br_452 n_br_453 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj452 ground ground n_bl_453 ground n_br_453 ground vdd_readl ground memorycell
Xwirel453 n_bl_453 n_bl_454 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer453 n_br_453 n_br_454 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj453 ground ground n_bl_454 ground n_br_454 ground vdd_readl ground memorycell
Xwirel454 n_bl_454 n_bl_455 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer454 n_br_454 n_br_455 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj454 ground ground n_bl_455 ground n_br_455 ground vdd_readl ground memorycell
Xwirel455 n_bl_455 n_bl_456 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer455 n_br_455 n_br_456 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj455 ground ground n_bl_456 ground n_br_456 ground vdd_readl ground memorycell
Xwirel456 n_bl_456 n_bl_457 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer456 n_br_456 n_br_457 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj456 ground ground n_bl_457 ground n_br_457 ground vdd_readl ground memorycell
Xwirel457 n_bl_457 n_bl_458 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer457 n_br_457 n_br_458 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj457 ground ground n_bl_458 ground n_br_458 ground vdd_readl ground memorycell
Xwirel458 n_bl_458 n_bl_459 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer458 n_br_458 n_br_459 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj458 ground ground n_bl_459 ground n_br_459 ground vdd_readl ground memorycell
Xwirel459 n_bl_459 n_bl_460 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer459 n_br_459 n_br_460 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj459 ground ground n_bl_460 ground n_br_460 ground vdd_readl ground memorycell
Xwirel460 n_bl_460 n_bl_461 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer460 n_br_460 n_br_461 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj460 ground ground n_bl_461 ground n_br_461 ground vdd_readl ground memorycell
Xwirel461 n_bl_461 n_bl_462 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer461 n_br_461 n_br_462 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj461 ground ground n_bl_462 ground n_br_462 ground vdd_readl ground memorycell
Xwirel462 n_bl_462 n_bl_463 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer462 n_br_462 n_br_463 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj462 ground ground n_bl_463 ground n_br_463 ground vdd_readl ground memorycell
Xwirel463 n_bl_463 n_bl_464 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer463 n_br_463 n_br_464 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj463 ground ground n_bl_464 ground n_br_464 ground vdd_readl ground memorycell
Xwirel464 n_bl_464 n_bl_465 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer464 n_br_464 n_br_465 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj464 ground ground n_bl_465 ground n_br_465 ground vdd_readl ground memorycell
Xwirel465 n_bl_465 n_bl_466 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer465 n_br_465 n_br_466 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj465 ground ground n_bl_466 ground n_br_466 ground vdd_readl ground memorycell
Xwirel466 n_bl_466 n_bl_467 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer466 n_br_466 n_br_467 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj466 ground ground n_bl_467 ground n_br_467 ground vdd_readl ground memorycell
Xwirel467 n_bl_467 n_bl_468 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer467 n_br_467 n_br_468 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj467 ground ground n_bl_468 ground n_br_468 ground vdd_readl ground memorycell
Xwirel468 n_bl_468 n_bl_469 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer468 n_br_468 n_br_469 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj468 ground ground n_bl_469 ground n_br_469 ground vdd_readl ground memorycell
Xwirel469 n_bl_469 n_bl_470 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer469 n_br_469 n_br_470 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj469 ground ground n_bl_470 ground n_br_470 ground vdd_readl ground memorycell
Xwirel470 n_bl_470 n_bl_471 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer470 n_br_470 n_br_471 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj470 ground ground n_bl_471 ground n_br_471 ground vdd_readl ground memorycell
Xwirel471 n_bl_471 n_bl_472 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer471 n_br_471 n_br_472 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj471 ground ground n_bl_472 ground n_br_472 ground vdd_readl ground memorycell
Xwirel472 n_bl_472 n_bl_473 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer472 n_br_472 n_br_473 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj472 ground ground n_bl_473 ground n_br_473 ground vdd_readl ground memorycell
Xwirel473 n_bl_473 n_bl_474 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer473 n_br_473 n_br_474 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj473 ground ground n_bl_474 ground n_br_474 ground vdd_readl ground memorycell
Xwirel474 n_bl_474 n_bl_475 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer474 n_br_474 n_br_475 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj474 ground ground n_bl_475 ground n_br_475 ground vdd_readl ground memorycell
Xwirel475 n_bl_475 n_bl_476 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer475 n_br_475 n_br_476 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj475 ground ground n_bl_476 ground n_br_476 ground vdd_readl ground memorycell
Xwirel476 n_bl_476 n_bl_477 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer476 n_br_476 n_br_477 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj476 ground ground n_bl_477 ground n_br_477 ground vdd_readl ground memorycell
Xwirel477 n_bl_477 n_bl_478 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer477 n_br_477 n_br_478 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj477 ground ground n_bl_478 ground n_br_478 ground vdd_readl ground memorycell
Xwirel478 n_bl_478 n_bl_479 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer478 n_br_478 n_br_479 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj478 ground ground n_bl_479 ground n_br_479 ground vdd_readl ground memorycell
Xwirel479 n_bl_479 n_bl_480 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer479 n_br_479 n_br_480 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj479 ground ground n_bl_480 ground n_br_480 ground vdd_readl ground memorycell
Xwirel480 n_bl_480 n_bl_481 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer480 n_br_480 n_br_481 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj480 ground ground n_bl_481 ground n_br_481 ground vdd_readl ground memorycell
Xwirel481 n_bl_481 n_bl_482 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer481 n_br_481 n_br_482 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj481 ground ground n_bl_482 ground n_br_482 ground vdd_readl ground memorycell
Xwirel482 n_bl_482 n_bl_483 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer482 n_br_482 n_br_483 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj482 ground ground n_bl_483 ground n_br_483 ground vdd_readl ground memorycell
Xwirel483 n_bl_483 n_bl_484 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer483 n_br_483 n_br_484 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj483 ground ground n_bl_484 ground n_br_484 ground vdd_readl ground memorycell
Xwirel484 n_bl_484 n_bl_485 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer484 n_br_484 n_br_485 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj484 ground ground n_bl_485 ground n_br_485 ground vdd_readl ground memorycell
Xwirel485 n_bl_485 n_bl_486 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer485 n_br_485 n_br_486 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj485 ground ground n_bl_486 ground n_br_486 ground vdd_readl ground memorycell
Xwirel486 n_bl_486 n_bl_487 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer486 n_br_486 n_br_487 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj486 ground ground n_bl_487 ground n_br_487 ground vdd_readl ground memorycell
Xwirel487 n_bl_487 n_bl_488 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer487 n_br_487 n_br_488 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj487 ground ground n_bl_488 ground n_br_488 ground vdd_readl ground memorycell
Xwirel488 n_bl_488 n_bl_489 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer488 n_br_488 n_br_489 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj488 ground ground n_bl_489 ground n_br_489 ground vdd_readl ground memorycell
Xwirel489 n_bl_489 n_bl_490 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer489 n_br_489 n_br_490 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj489 ground ground n_bl_490 ground n_br_490 ground vdd_readl ground memorycell
Xwirel490 n_bl_490 n_bl_491 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer490 n_br_490 n_br_491 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj490 ground ground n_bl_491 ground n_br_491 ground vdd_readl ground memorycell
Xwirel491 n_bl_491 n_bl_492 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer491 n_br_491 n_br_492 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj491 ground ground n_bl_492 ground n_br_492 ground vdd_readl ground memorycell
Xwirel492 n_bl_492 n_bl_493 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer492 n_br_492 n_br_493 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj492 ground ground n_bl_493 ground n_br_493 ground vdd_readl ground memorycell
Xwirel493 n_bl_493 n_bl_494 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer493 n_br_493 n_br_494 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj493 ground ground n_bl_494 ground n_br_494 ground vdd_readl ground memorycell
Xwirel494 n_bl_494 n_bl_495 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer494 n_br_494 n_br_495 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj494 ground ground n_bl_495 ground n_br_495 ground vdd_readl ground memorycell
Xwirel495 n_bl_495 n_bl_496 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer495 n_br_495 n_br_496 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj495 ground ground n_bl_496 ground n_br_496 ground vdd_readl ground memorycell
Xwirel496 n_bl_496 n_bl_497 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer496 n_br_496 n_br_497 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj496 ground ground n_bl_497 ground n_br_497 ground vdd_readl ground memorycell
Xwirel497 n_bl_497 n_bl_498 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer497 n_br_497 n_br_498 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj497 ground ground n_bl_498 ground n_br_498 ground vdd_readl ground memorycell
Xwirel498 n_bl_498 n_bl_499 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer498 n_br_498 n_br_499 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj498 ground ground n_bl_499 ground n_br_499 ground vdd_readl ground memorycell
Xwirel499 n_bl_499 n_bl_500 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer499 n_br_499 n_br_500 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj499 ground ground n_bl_500 ground n_br_500 ground vdd_readl ground memorycell
Xwirel500 n_bl_500 n_bl_501 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer500 n_br_500 n_br_501 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj500 ground ground n_bl_501 ground n_br_501 ground vdd_readl ground memorycell
Xwirel501 n_bl_501 n_bl_502 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer501 n_br_501 n_br_502 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj501 ground ground n_bl_502 ground n_br_502 ground vdd_readl ground memorycell
Xwirel502 n_bl_502 n_bl_503 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer502 n_br_502 n_br_503 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj502 ground ground n_bl_503 ground n_br_503 ground vdd_readl ground memorycell
Xwirel503 n_bl_503 n_bl_504 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer503 n_br_503 n_br_504 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj503 ground ground n_bl_504 ground n_br_504 ground vdd_readl ground memorycell
Xwirel504 n_bl_504 n_bl_505 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer504 n_br_504 n_br_505 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj504 ground ground n_bl_505 ground n_br_505 ground vdd_readl ground memorycell
Xwirel505 n_bl_505 n_bl_506 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer505 n_br_505 n_br_506 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj505 ground ground n_bl_506 ground n_br_506 ground vdd_readl ground memorycell
Xwirel506 n_bl_506 n_bl_507 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer506 n_br_506 n_br_507 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj506 ground ground n_bl_507 ground n_br_507 ground vdd_readl ground memorycell
Xwirel507 n_bl_507 n_bl_508 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer507 n_br_507 n_br_508 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj507 ground ground n_bl_508 ground n_br_508 ground vdd_readl ground memorycell
Xwirel508 n_bl_508 n_bl_509 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer508 n_br_508 n_br_509 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj508 ground ground n_bl_509 ground n_br_509 ground vdd_readl ground memorycell
Xwirel509 n_bl_509 n_bl_510 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer509 n_br_509 n_br_510 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj509 ground ground n_bl_510 ground n_br_510 ground vdd_readl ground memorycell
Xwirel510 n_bl_510 n_bl_511 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer510 n_br_510 n_br_511 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj510 ground ground n_bl_511 ground n_br_511 ground vdd_readl ground memorycell
Xwirel511 n_bl_511 n_bl_512 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer511 n_br_511 n_br_512 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj511 n_precharge ground n_bl_512 ground n_br_512 ground vdd_readl ground memorycell
Xwirel1_ref n_bl2_1 n_bl2_2 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer1_ref n_br2_1 n_br2_2 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj1_ref ground ground n_bl2_2 ground n_br2_2 ground vdd_readl ground memorycell
Xwirel2_ref n_bl2_2 n_bl2_3 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer2_ref n_br2_2 n_br2_3 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj2_ref ground ground n_bl2_3 ground n_br2_3 ground vdd_readl ground memorycell
Xwirel3_ref n_bl2_3 n_bl2_4 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer3_ref n_br2_3 n_br2_4 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj3_ref ground ground n_bl2_4 ground n_br2_4 ground vdd_readl ground memorycell
Xwirel4_ref n_bl2_4 n_bl2_5 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer4_ref n_br2_4 n_br2_5 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj4_ref ground ground n_bl2_5 ground n_br2_5 ground vdd_readl ground memorycell
Xwirel5_ref n_bl2_5 n_bl2_6 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer5_ref n_br2_5 n_br2_6 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj5_ref ground ground n_bl2_6 ground n_br2_6 ground vdd_readl ground memorycell
Xwirel6_ref n_bl2_6 n_bl2_7 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer6_ref n_br2_6 n_br2_7 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj6_ref ground ground n_bl2_7 ground n_br2_7 ground vdd_readl ground memorycell
Xwirel7_ref n_bl2_7 n_bl2_8 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer7_ref n_br2_7 n_br2_8 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj7_ref ground ground n_bl2_8 ground n_br2_8 ground vdd_readl ground memorycell
Xwirel8_ref n_bl2_8 n_bl2_9 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer8_ref n_br2_8 n_br2_9 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj8_ref ground ground n_bl2_9 ground n_br2_9 ground vdd_readl ground memorycell
Xwirel9_ref n_bl2_9 n_bl2_10 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer9_ref n_br2_9 n_br2_10 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj9_ref ground ground n_bl2_10 ground n_br2_10 ground vdd_readl ground memorycell
Xwirel10_ref n_bl2_10 n_bl2_11 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer10_ref n_br2_10 n_br2_11 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj10_ref ground ground n_bl2_11 ground n_br2_11 ground vdd_readl ground memorycell
Xwirel11_ref n_bl2_11 n_bl2_12 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer11_ref n_br2_11 n_br2_12 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj11_ref ground ground n_bl2_12 ground n_br2_12 ground vdd_readl ground memorycell
Xwirel12_ref n_bl2_12 n_bl2_13 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer12_ref n_br2_12 n_br2_13 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj12_ref ground ground n_bl2_13 ground n_br2_13 ground vdd_readl ground memorycell
Xwirel13_ref n_bl2_13 n_bl2_14 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer13_ref n_br2_13 n_br2_14 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj13_ref ground ground n_bl2_14 ground n_br2_14 ground vdd_readl ground memorycell
Xwirel14_ref n_bl2_14 n_bl2_15 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer14_ref n_br2_14 n_br2_15 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj14_ref ground ground n_bl2_15 ground n_br2_15 ground vdd_readl ground memorycell
Xwirel15_ref n_bl2_15 n_bl2_16 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer15_ref n_br2_15 n_br2_16 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj15_ref ground ground n_bl2_16 ground n_br2_16 ground vdd_readl ground memorycell
Xwirel16_ref n_bl2_16 n_bl2_17 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer16_ref n_br2_16 n_br2_17 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj16_ref ground ground n_bl2_17 ground n_br2_17 ground vdd_readl ground memorycell
Xwirel17_ref n_bl2_17 n_bl2_18 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer17_ref n_br2_17 n_br2_18 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj17_ref ground ground n_bl2_18 ground n_br2_18 ground vdd_readl ground memorycell
Xwirel18_ref n_bl2_18 n_bl2_19 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer18_ref n_br2_18 n_br2_19 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj18_ref ground ground n_bl2_19 ground n_br2_19 ground vdd_readl ground memorycell
Xwirel19_ref n_bl2_19 n_bl2_20 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer19_ref n_br2_19 n_br2_20 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj19_ref ground ground n_bl2_20 ground n_br2_20 ground vdd_readl ground memorycell
Xwirel20_ref n_bl2_20 n_bl2_21 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer20_ref n_br2_20 n_br2_21 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj20_ref ground ground n_bl2_21 ground n_br2_21 ground vdd_readl ground memorycell
Xwirel21_ref n_bl2_21 n_bl2_22 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer21_ref n_br2_21 n_br2_22 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj21_ref ground ground n_bl2_22 ground n_br2_22 ground vdd_readl ground memorycell
Xwirel22_ref n_bl2_22 n_bl2_23 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer22_ref n_br2_22 n_br2_23 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj22_ref ground ground n_bl2_23 ground n_br2_23 ground vdd_readl ground memorycell
Xwirel23_ref n_bl2_23 n_bl2_24 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer23_ref n_br2_23 n_br2_24 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj23_ref ground ground n_bl2_24 ground n_br2_24 ground vdd_readl ground memorycell
Xwirel24_ref n_bl2_24 n_bl2_25 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer24_ref n_br2_24 n_br2_25 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj24_ref ground ground n_bl2_25 ground n_br2_25 ground vdd_readl ground memorycell
Xwirel25_ref n_bl2_25 n_bl2_26 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer25_ref n_br2_25 n_br2_26 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj25_ref ground ground n_bl2_26 ground n_br2_26 ground vdd_readl ground memorycell
Xwirel26_ref n_bl2_26 n_bl2_27 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer26_ref n_br2_26 n_br2_27 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj26_ref ground ground n_bl2_27 ground n_br2_27 ground vdd_readl ground memorycell
Xwirel27_ref n_bl2_27 n_bl2_28 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer27_ref n_br2_27 n_br2_28 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj27_ref ground ground n_bl2_28 ground n_br2_28 ground vdd_readl ground memorycell
Xwirel28_ref n_bl2_28 n_bl2_29 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer28_ref n_br2_28 n_br2_29 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj28_ref ground ground n_bl2_29 ground n_br2_29 ground vdd_readl ground memorycell
Xwirel29_ref n_bl2_29 n_bl2_30 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer29_ref n_br2_29 n_br2_30 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj29_ref ground ground n_bl2_30 ground n_br2_30 ground vdd_readl ground memorycell
Xwirel30_ref n_bl2_30 n_bl2_31 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer30_ref n_br2_30 n_br2_31 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj30_ref ground ground n_bl2_31 ground n_br2_31 ground vdd_readl ground memorycell
Xwirel31_ref n_bl2_31 n_bl2_32 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer31_ref n_br2_31 n_br2_32 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj31_ref ground ground n_bl2_32 ground n_br2_32 ground vdd_readl ground memorycell
Xwirel32_ref n_bl2_32 n_bl2_33 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer32_ref n_br2_32 n_br2_33 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj32_ref ground ground n_bl2_33 ground n_br2_33 ground vdd_readl ground memorycell
Xwirel33_ref n_bl2_33 n_bl2_34 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer33_ref n_br2_33 n_br2_34 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj33_ref ground ground n_bl2_34 ground n_br2_34 ground vdd_readl ground memorycell
Xwirel34_ref n_bl2_34 n_bl2_35 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer34_ref n_br2_34 n_br2_35 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj34_ref ground ground n_bl2_35 ground n_br2_35 ground vdd_readl ground memorycell
Xwirel35_ref n_bl2_35 n_bl2_36 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer35_ref n_br2_35 n_br2_36 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj35_ref ground ground n_bl2_36 ground n_br2_36 ground vdd_readl ground memorycell
Xwirel36_ref n_bl2_36 n_bl2_37 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer36_ref n_br2_36 n_br2_37 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj36_ref ground ground n_bl2_37 ground n_br2_37 ground vdd_readl ground memorycell
Xwirel37_ref n_bl2_37 n_bl2_38 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer37_ref n_br2_37 n_br2_38 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj37_ref ground ground n_bl2_38 ground n_br2_38 ground vdd_readl ground memorycell
Xwirel38_ref n_bl2_38 n_bl2_39 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer38_ref n_br2_38 n_br2_39 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj38_ref ground ground n_bl2_39 ground n_br2_39 ground vdd_readl ground memorycell
Xwirel39_ref n_bl2_39 n_bl2_40 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer39_ref n_br2_39 n_br2_40 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj39_ref ground ground n_bl2_40 ground n_br2_40 ground vdd_readl ground memorycell
Xwirel40_ref n_bl2_40 n_bl2_41 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer40_ref n_br2_40 n_br2_41 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj40_ref ground ground n_bl2_41 ground n_br2_41 ground vdd_readl ground memorycell
Xwirel41_ref n_bl2_41 n_bl2_42 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer41_ref n_br2_41 n_br2_42 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj41_ref ground ground n_bl2_42 ground n_br2_42 ground vdd_readl ground memorycell
Xwirel42_ref n_bl2_42 n_bl2_43 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer42_ref n_br2_42 n_br2_43 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj42_ref ground ground n_bl2_43 ground n_br2_43 ground vdd_readl ground memorycell
Xwirel43_ref n_bl2_43 n_bl2_44 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer43_ref n_br2_43 n_br2_44 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj43_ref ground ground n_bl2_44 ground n_br2_44 ground vdd_readl ground memorycell
Xwirel44_ref n_bl2_44 n_bl2_45 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer44_ref n_br2_44 n_br2_45 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj44_ref ground ground n_bl2_45 ground n_br2_45 ground vdd_readl ground memorycell
Xwirel45_ref n_bl2_45 n_bl2_46 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer45_ref n_br2_45 n_br2_46 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj45_ref ground ground n_bl2_46 ground n_br2_46 ground vdd_readl ground memorycell
Xwirel46_ref n_bl2_46 n_bl2_47 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer46_ref n_br2_46 n_br2_47 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj46_ref ground ground n_bl2_47 ground n_br2_47 ground vdd_readl ground memorycell
Xwirel47_ref n_bl2_47 n_bl2_48 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer47_ref n_br2_47 n_br2_48 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj47_ref ground ground n_bl2_48 ground n_br2_48 ground vdd_readl ground memorycell
Xwirel48_ref n_bl2_48 n_bl2_49 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer48_ref n_br2_48 n_br2_49 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj48_ref ground ground n_bl2_49 ground n_br2_49 ground vdd_readl ground memorycell
Xwirel49_ref n_bl2_49 n_bl2_50 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer49_ref n_br2_49 n_br2_50 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj49_ref ground ground n_bl2_50 ground n_br2_50 ground vdd_readl ground memorycell
Xwirel50_ref n_bl2_50 n_bl2_51 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer50_ref n_br2_50 n_br2_51 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj50_ref ground ground n_bl2_51 ground n_br2_51 ground vdd_readl ground memorycell
Xwirel51_ref n_bl2_51 n_bl2_52 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer51_ref n_br2_51 n_br2_52 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj51_ref ground ground n_bl2_52 ground n_br2_52 ground vdd_readl ground memorycell
Xwirel52_ref n_bl2_52 n_bl2_53 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer52_ref n_br2_52 n_br2_53 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj52_ref ground ground n_bl2_53 ground n_br2_53 ground vdd_readl ground memorycell
Xwirel53_ref n_bl2_53 n_bl2_54 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer53_ref n_br2_53 n_br2_54 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj53_ref ground ground n_bl2_54 ground n_br2_54 ground vdd_readl ground memorycell
Xwirel54_ref n_bl2_54 n_bl2_55 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer54_ref n_br2_54 n_br2_55 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj54_ref ground ground n_bl2_55 ground n_br2_55 ground vdd_readl ground memorycell
Xwirel55_ref n_bl2_55 n_bl2_56 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer55_ref n_br2_55 n_br2_56 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj55_ref ground ground n_bl2_56 ground n_br2_56 ground vdd_readl ground memorycell
Xwirel56_ref n_bl2_56 n_bl2_57 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer56_ref n_br2_56 n_br2_57 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj56_ref ground ground n_bl2_57 ground n_br2_57 ground vdd_readl ground memorycell
Xwirel57_ref n_bl2_57 n_bl2_58 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer57_ref n_br2_57 n_br2_58 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj57_ref ground ground n_bl2_58 ground n_br2_58 ground vdd_readl ground memorycell
Xwirel58_ref n_bl2_58 n_bl2_59 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer58_ref n_br2_58 n_br2_59 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj58_ref ground ground n_bl2_59 ground n_br2_59 ground vdd_readl ground memorycell
Xwirel59_ref n_bl2_59 n_bl2_60 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer59_ref n_br2_59 n_br2_60 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj59_ref ground ground n_bl2_60 ground n_br2_60 ground vdd_readl ground memorycell
Xwirel60_ref n_bl2_60 n_bl2_61 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer60_ref n_br2_60 n_br2_61 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj60_ref ground ground n_bl2_61 ground n_br2_61 ground vdd_readl ground memorycell
Xwirel61_ref n_bl2_61 n_bl2_62 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer61_ref n_br2_61 n_br2_62 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj61_ref ground ground n_bl2_62 ground n_br2_62 ground vdd_readl ground memorycell
Xwirel62_ref n_bl2_62 n_bl2_63 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer62_ref n_br2_62 n_br2_63 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj62_ref ground ground n_bl2_63 ground n_br2_63 ground vdd_readl ground memorycell
Xwirel63_ref n_bl2_63 n_bl2_64 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer63_ref n_br2_63 n_br2_64 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj63_ref ground ground n_bl2_64 ground n_br2_64 ground vdd_readl ground memorycell
Xwirel64_ref n_bl2_64 n_bl2_65 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer64_ref n_br2_64 n_br2_65 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj64_ref ground ground n_bl2_65 ground n_br2_65 ground vdd_readl ground memorycell
Xwirel65_ref n_bl2_65 n_bl2_66 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer65_ref n_br2_65 n_br2_66 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj65_ref ground ground n_bl2_66 ground n_br2_66 ground vdd_readl ground memorycell
Xwirel66_ref n_bl2_66 n_bl2_67 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer66_ref n_br2_66 n_br2_67 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj66_ref ground ground n_bl2_67 ground n_br2_67 ground vdd_readl ground memorycell
Xwirel67_ref n_bl2_67 n_bl2_68 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer67_ref n_br2_67 n_br2_68 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj67_ref ground ground n_bl2_68 ground n_br2_68 ground vdd_readl ground memorycell
Xwirel68_ref n_bl2_68 n_bl2_69 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer68_ref n_br2_68 n_br2_69 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj68_ref ground ground n_bl2_69 ground n_br2_69 ground vdd_readl ground memorycell
Xwirel69_ref n_bl2_69 n_bl2_70 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer69_ref n_br2_69 n_br2_70 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj69_ref ground ground n_bl2_70 ground n_br2_70 ground vdd_readl ground memorycell
Xwirel70_ref n_bl2_70 n_bl2_71 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer70_ref n_br2_70 n_br2_71 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj70_ref ground ground n_bl2_71 ground n_br2_71 ground vdd_readl ground memorycell
Xwirel71_ref n_bl2_71 n_bl2_72 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer71_ref n_br2_71 n_br2_72 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj71_ref ground ground n_bl2_72 ground n_br2_72 ground vdd_readl ground memorycell
Xwirel72_ref n_bl2_72 n_bl2_73 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer72_ref n_br2_72 n_br2_73 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj72_ref ground ground n_bl2_73 ground n_br2_73 ground vdd_readl ground memorycell
Xwirel73_ref n_bl2_73 n_bl2_74 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer73_ref n_br2_73 n_br2_74 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj73_ref ground ground n_bl2_74 ground n_br2_74 ground vdd_readl ground memorycell
Xwirel74_ref n_bl2_74 n_bl2_75 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer74_ref n_br2_74 n_br2_75 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj74_ref ground ground n_bl2_75 ground n_br2_75 ground vdd_readl ground memorycell
Xwirel75_ref n_bl2_75 n_bl2_76 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer75_ref n_br2_75 n_br2_76 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj75_ref ground ground n_bl2_76 ground n_br2_76 ground vdd_readl ground memorycell
Xwirel76_ref n_bl2_76 n_bl2_77 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer76_ref n_br2_76 n_br2_77 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj76_ref ground ground n_bl2_77 ground n_br2_77 ground vdd_readl ground memorycell
Xwirel77_ref n_bl2_77 n_bl2_78 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer77_ref n_br2_77 n_br2_78 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj77_ref ground ground n_bl2_78 ground n_br2_78 ground vdd_readl ground memorycell
Xwirel78_ref n_bl2_78 n_bl2_79 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer78_ref n_br2_78 n_br2_79 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj78_ref ground ground n_bl2_79 ground n_br2_79 ground vdd_readl ground memorycell
Xwirel79_ref n_bl2_79 n_bl2_80 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer79_ref n_br2_79 n_br2_80 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj79_ref ground ground n_bl2_80 ground n_br2_80 ground vdd_readl ground memorycell
Xwirel80_ref n_bl2_80 n_bl2_81 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer80_ref n_br2_80 n_br2_81 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj80_ref ground ground n_bl2_81 ground n_br2_81 ground vdd_readl ground memorycell
Xwirel81_ref n_bl2_81 n_bl2_82 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer81_ref n_br2_81 n_br2_82 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj81_ref ground ground n_bl2_82 ground n_br2_82 ground vdd_readl ground memorycell
Xwirel82_ref n_bl2_82 n_bl2_83 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer82_ref n_br2_82 n_br2_83 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj82_ref ground ground n_bl2_83 ground n_br2_83 ground vdd_readl ground memorycell
Xwirel83_ref n_bl2_83 n_bl2_84 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer83_ref n_br2_83 n_br2_84 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj83_ref ground ground n_bl2_84 ground n_br2_84 ground vdd_readl ground memorycell
Xwirel84_ref n_bl2_84 n_bl2_85 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer84_ref n_br2_84 n_br2_85 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj84_ref ground ground n_bl2_85 ground n_br2_85 ground vdd_readl ground memorycell
Xwirel85_ref n_bl2_85 n_bl2_86 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer85_ref n_br2_85 n_br2_86 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj85_ref ground ground n_bl2_86 ground n_br2_86 ground vdd_readl ground memorycell
Xwirel86_ref n_bl2_86 n_bl2_87 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer86_ref n_br2_86 n_br2_87 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj86_ref ground ground n_bl2_87 ground n_br2_87 ground vdd_readl ground memorycell
Xwirel87_ref n_bl2_87 n_bl2_88 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer87_ref n_br2_87 n_br2_88 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj87_ref ground ground n_bl2_88 ground n_br2_88 ground vdd_readl ground memorycell
Xwirel88_ref n_bl2_88 n_bl2_89 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer88_ref n_br2_88 n_br2_89 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj88_ref ground ground n_bl2_89 ground n_br2_89 ground vdd_readl ground memorycell
Xwirel89_ref n_bl2_89 n_bl2_90 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer89_ref n_br2_89 n_br2_90 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj89_ref ground ground n_bl2_90 ground n_br2_90 ground vdd_readl ground memorycell
Xwirel90_ref n_bl2_90 n_bl2_91 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer90_ref n_br2_90 n_br2_91 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj90_ref ground ground n_bl2_91 ground n_br2_91 ground vdd_readl ground memorycell
Xwirel91_ref n_bl2_91 n_bl2_92 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer91_ref n_br2_91 n_br2_92 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj91_ref ground ground n_bl2_92 ground n_br2_92 ground vdd_readl ground memorycell
Xwirel92_ref n_bl2_92 n_bl2_93 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer92_ref n_br2_92 n_br2_93 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj92_ref ground ground n_bl2_93 ground n_br2_93 ground vdd_readl ground memorycell
Xwirel93_ref n_bl2_93 n_bl2_94 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer93_ref n_br2_93 n_br2_94 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj93_ref ground ground n_bl2_94 ground n_br2_94 ground vdd_readl ground memorycell
Xwirel94_ref n_bl2_94 n_bl2_95 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer94_ref n_br2_94 n_br2_95 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj94_ref ground ground n_bl2_95 ground n_br2_95 ground vdd_readl ground memorycell
Xwirel95_ref n_bl2_95 n_bl2_96 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer95_ref n_br2_95 n_br2_96 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj95_ref ground ground n_bl2_96 ground n_br2_96 ground vdd_readl ground memorycell
Xwirel96_ref n_bl2_96 n_bl2_97 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer96_ref n_br2_96 n_br2_97 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj96_ref ground ground n_bl2_97 ground n_br2_97 ground vdd_readl ground memorycell
Xwirel97_ref n_bl2_97 n_bl2_98 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer97_ref n_br2_97 n_br2_98 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj97_ref ground ground n_bl2_98 ground n_br2_98 ground vdd_readl ground memorycell
Xwirel98_ref n_bl2_98 n_bl2_99 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer98_ref n_br2_98 n_br2_99 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj98_ref ground ground n_bl2_99 ground n_br2_99 ground vdd_readl ground memorycell
Xwirel99_ref n_bl2_99 n_bl2_100 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer99_ref n_br2_99 n_br2_100 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj99_ref ground ground n_bl2_100 ground n_br2_100 ground vdd_readl ground memorycell
Xwirel100_ref n_bl2_100 n_bl2_101 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer100_ref n_br2_100 n_br2_101 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj100_ref ground ground n_bl2_101 ground n_br2_101 ground vdd_readl ground memorycell
Xwirel101_ref n_bl2_101 n_bl2_102 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer101_ref n_br2_101 n_br2_102 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj101_ref ground ground n_bl2_102 ground n_br2_102 ground vdd_readl ground memorycell
Xwirel102_ref n_bl2_102 n_bl2_103 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer102_ref n_br2_102 n_br2_103 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj102_ref ground ground n_bl2_103 ground n_br2_103 ground vdd_readl ground memorycell
Xwirel103_ref n_bl2_103 n_bl2_104 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer103_ref n_br2_103 n_br2_104 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj103_ref ground ground n_bl2_104 ground n_br2_104 ground vdd_readl ground memorycell
Xwirel104_ref n_bl2_104 n_bl2_105 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer104_ref n_br2_104 n_br2_105 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj104_ref ground ground n_bl2_105 ground n_br2_105 ground vdd_readl ground memorycell
Xwirel105_ref n_bl2_105 n_bl2_106 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer105_ref n_br2_105 n_br2_106 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj105_ref ground ground n_bl2_106 ground n_br2_106 ground vdd_readl ground memorycell
Xwirel106_ref n_bl2_106 n_bl2_107 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer106_ref n_br2_106 n_br2_107 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj106_ref ground ground n_bl2_107 ground n_br2_107 ground vdd_readl ground memorycell
Xwirel107_ref n_bl2_107 n_bl2_108 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer107_ref n_br2_107 n_br2_108 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj107_ref ground ground n_bl2_108 ground n_br2_108 ground vdd_readl ground memorycell
Xwirel108_ref n_bl2_108 n_bl2_109 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer108_ref n_br2_108 n_br2_109 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj108_ref ground ground n_bl2_109 ground n_br2_109 ground vdd_readl ground memorycell
Xwirel109_ref n_bl2_109 n_bl2_110 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer109_ref n_br2_109 n_br2_110 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj109_ref ground ground n_bl2_110 ground n_br2_110 ground vdd_readl ground memorycell
Xwirel110_ref n_bl2_110 n_bl2_111 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer110_ref n_br2_110 n_br2_111 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj110_ref ground ground n_bl2_111 ground n_br2_111 ground vdd_readl ground memorycell
Xwirel111_ref n_bl2_111 n_bl2_112 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer111_ref n_br2_111 n_br2_112 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj111_ref ground ground n_bl2_112 ground n_br2_112 ground vdd_readl ground memorycell
Xwirel112_ref n_bl2_112 n_bl2_113 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer112_ref n_br2_112 n_br2_113 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj112_ref ground ground n_bl2_113 ground n_br2_113 ground vdd_readl ground memorycell
Xwirel113_ref n_bl2_113 n_bl2_114 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer113_ref n_br2_113 n_br2_114 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj113_ref ground ground n_bl2_114 ground n_br2_114 ground vdd_readl ground memorycell
Xwirel114_ref n_bl2_114 n_bl2_115 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer114_ref n_br2_114 n_br2_115 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj114_ref ground ground n_bl2_115 ground n_br2_115 ground vdd_readl ground memorycell
Xwirel115_ref n_bl2_115 n_bl2_116 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer115_ref n_br2_115 n_br2_116 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj115_ref ground ground n_bl2_116 ground n_br2_116 ground vdd_readl ground memorycell
Xwirel116_ref n_bl2_116 n_bl2_117 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer116_ref n_br2_116 n_br2_117 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj116_ref ground ground n_bl2_117 ground n_br2_117 ground vdd_readl ground memorycell
Xwirel117_ref n_bl2_117 n_bl2_118 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer117_ref n_br2_117 n_br2_118 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj117_ref ground ground n_bl2_118 ground n_br2_118 ground vdd_readl ground memorycell
Xwirel118_ref n_bl2_118 n_bl2_119 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer118_ref n_br2_118 n_br2_119 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj118_ref ground ground n_bl2_119 ground n_br2_119 ground vdd_readl ground memorycell
Xwirel119_ref n_bl2_119 n_bl2_120 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer119_ref n_br2_119 n_br2_120 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj119_ref ground ground n_bl2_120 ground n_br2_120 ground vdd_readl ground memorycell
Xwirel120_ref n_bl2_120 n_bl2_121 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer120_ref n_br2_120 n_br2_121 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj120_ref ground ground n_bl2_121 ground n_br2_121 ground vdd_readl ground memorycell
Xwirel121_ref n_bl2_121 n_bl2_122 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer121_ref n_br2_121 n_br2_122 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj121_ref ground ground n_bl2_122 ground n_br2_122 ground vdd_readl ground memorycell
Xwirel122_ref n_bl2_122 n_bl2_123 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer122_ref n_br2_122 n_br2_123 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj122_ref ground ground n_bl2_123 ground n_br2_123 ground vdd_readl ground memorycell
Xwirel123_ref n_bl2_123 n_bl2_124 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer123_ref n_br2_123 n_br2_124 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj123_ref ground ground n_bl2_124 ground n_br2_124 ground vdd_readl ground memorycell
Xwirel124_ref n_bl2_124 n_bl2_125 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer124_ref n_br2_124 n_br2_125 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj124_ref ground ground n_bl2_125 ground n_br2_125 ground vdd_readl ground memorycell
Xwirel125_ref n_bl2_125 n_bl2_126 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer125_ref n_br2_125 n_br2_126 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj125_ref ground ground n_bl2_126 ground n_br2_126 ground vdd_readl ground memorycell
Xwirel126_ref n_bl2_126 n_bl2_127 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer126_ref n_br2_126 n_br2_127 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj126_ref ground ground n_bl2_127 ground n_br2_127 ground vdd_readl ground memorycell
Xwirel127_ref n_bl2_127 n_bl2_128 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer127_ref n_br2_127 n_br2_128 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj127_ref ground ground n_bl2_128 ground n_br2_128 ground vdd_readl ground memorycell
Xwirel128_ref n_bl2_128 n_bl2_129 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer128_ref n_br2_128 n_br2_129 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj128_ref ground ground n_bl2_129 ground n_br2_129 ground vdd_readl ground memorycell
Xwirel129_ref n_bl2_129 n_bl2_130 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer129_ref n_br2_129 n_br2_130 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj129_ref ground ground n_bl2_130 ground n_br2_130 ground vdd_readl ground memorycell
Xwirel130_ref n_bl2_130 n_bl2_131 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer130_ref n_br2_130 n_br2_131 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj130_ref ground ground n_bl2_131 ground n_br2_131 ground vdd_readl ground memorycell
Xwirel131_ref n_bl2_131 n_bl2_132 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer131_ref n_br2_131 n_br2_132 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj131_ref ground ground n_bl2_132 ground n_br2_132 ground vdd_readl ground memorycell
Xwirel132_ref n_bl2_132 n_bl2_133 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer132_ref n_br2_132 n_br2_133 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj132_ref ground ground n_bl2_133 ground n_br2_133 ground vdd_readl ground memorycell
Xwirel133_ref n_bl2_133 n_bl2_134 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer133_ref n_br2_133 n_br2_134 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj133_ref ground ground n_bl2_134 ground n_br2_134 ground vdd_readl ground memorycell
Xwirel134_ref n_bl2_134 n_bl2_135 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer134_ref n_br2_134 n_br2_135 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj134_ref ground ground n_bl2_135 ground n_br2_135 ground vdd_readl ground memorycell
Xwirel135_ref n_bl2_135 n_bl2_136 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer135_ref n_br2_135 n_br2_136 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj135_ref ground ground n_bl2_136 ground n_br2_136 ground vdd_readl ground memorycell
Xwirel136_ref n_bl2_136 n_bl2_137 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer136_ref n_br2_136 n_br2_137 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj136_ref ground ground n_bl2_137 ground n_br2_137 ground vdd_readl ground memorycell
Xwirel137_ref n_bl2_137 n_bl2_138 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer137_ref n_br2_137 n_br2_138 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj137_ref ground ground n_bl2_138 ground n_br2_138 ground vdd_readl ground memorycell
Xwirel138_ref n_bl2_138 n_bl2_139 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer138_ref n_br2_138 n_br2_139 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj138_ref ground ground n_bl2_139 ground n_br2_139 ground vdd_readl ground memorycell
Xwirel139_ref n_bl2_139 n_bl2_140 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer139_ref n_br2_139 n_br2_140 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj139_ref ground ground n_bl2_140 ground n_br2_140 ground vdd_readl ground memorycell
Xwirel140_ref n_bl2_140 n_bl2_141 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer140_ref n_br2_140 n_br2_141 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj140_ref ground ground n_bl2_141 ground n_br2_141 ground vdd_readl ground memorycell
Xwirel141_ref n_bl2_141 n_bl2_142 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer141_ref n_br2_141 n_br2_142 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj141_ref ground ground n_bl2_142 ground n_br2_142 ground vdd_readl ground memorycell
Xwirel142_ref n_bl2_142 n_bl2_143 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer142_ref n_br2_142 n_br2_143 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj142_ref ground ground n_bl2_143 ground n_br2_143 ground vdd_readl ground memorycell
Xwirel143_ref n_bl2_143 n_bl2_144 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer143_ref n_br2_143 n_br2_144 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj143_ref ground ground n_bl2_144 ground n_br2_144 ground vdd_readl ground memorycell
Xwirel144_ref n_bl2_144 n_bl2_145 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer144_ref n_br2_144 n_br2_145 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj144_ref ground ground n_bl2_145 ground n_br2_145 ground vdd_readl ground memorycell
Xwirel145_ref n_bl2_145 n_bl2_146 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer145_ref n_br2_145 n_br2_146 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj145_ref ground ground n_bl2_146 ground n_br2_146 ground vdd_readl ground memorycell
Xwirel146_ref n_bl2_146 n_bl2_147 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer146_ref n_br2_146 n_br2_147 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj146_ref ground ground n_bl2_147 ground n_br2_147 ground vdd_readl ground memorycell
Xwirel147_ref n_bl2_147 n_bl2_148 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer147_ref n_br2_147 n_br2_148 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj147_ref ground ground n_bl2_148 ground n_br2_148 ground vdd_readl ground memorycell
Xwirel148_ref n_bl2_148 n_bl2_149 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer148_ref n_br2_148 n_br2_149 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj148_ref ground ground n_bl2_149 ground n_br2_149 ground vdd_readl ground memorycell
Xwirel149_ref n_bl2_149 n_bl2_150 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer149_ref n_br2_149 n_br2_150 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj149_ref ground ground n_bl2_150 ground n_br2_150 ground vdd_readl ground memorycell
Xwirel150_ref n_bl2_150 n_bl2_151 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer150_ref n_br2_150 n_br2_151 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj150_ref ground ground n_bl2_151 ground n_br2_151 ground vdd_readl ground memorycell
Xwirel151_ref n_bl2_151 n_bl2_152 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer151_ref n_br2_151 n_br2_152 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj151_ref ground ground n_bl2_152 ground n_br2_152 ground vdd_readl ground memorycell
Xwirel152_ref n_bl2_152 n_bl2_153 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer152_ref n_br2_152 n_br2_153 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj152_ref ground ground n_bl2_153 ground n_br2_153 ground vdd_readl ground memorycell
Xwirel153_ref n_bl2_153 n_bl2_154 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer153_ref n_br2_153 n_br2_154 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj153_ref ground ground n_bl2_154 ground n_br2_154 ground vdd_readl ground memorycell
Xwirel154_ref n_bl2_154 n_bl2_155 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer154_ref n_br2_154 n_br2_155 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj154_ref ground ground n_bl2_155 ground n_br2_155 ground vdd_readl ground memorycell
Xwirel155_ref n_bl2_155 n_bl2_156 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer155_ref n_br2_155 n_br2_156 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj155_ref ground ground n_bl2_156 ground n_br2_156 ground vdd_readl ground memorycell
Xwirel156_ref n_bl2_156 n_bl2_157 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer156_ref n_br2_156 n_br2_157 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj156_ref ground ground n_bl2_157 ground n_br2_157 ground vdd_readl ground memorycell
Xwirel157_ref n_bl2_157 n_bl2_158 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer157_ref n_br2_157 n_br2_158 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj157_ref ground ground n_bl2_158 ground n_br2_158 ground vdd_readl ground memorycell
Xwirel158_ref n_bl2_158 n_bl2_159 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer158_ref n_br2_158 n_br2_159 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj158_ref ground ground n_bl2_159 ground n_br2_159 ground vdd_readl ground memorycell
Xwirel159_ref n_bl2_159 n_bl2_160 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer159_ref n_br2_159 n_br2_160 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj159_ref ground ground n_bl2_160 ground n_br2_160 ground vdd_readl ground memorycell
Xwirel160_ref n_bl2_160 n_bl2_161 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer160_ref n_br2_160 n_br2_161 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj160_ref ground ground n_bl2_161 ground n_br2_161 ground vdd_readl ground memorycell
Xwirel161_ref n_bl2_161 n_bl2_162 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer161_ref n_br2_161 n_br2_162 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj161_ref ground ground n_bl2_162 ground n_br2_162 ground vdd_readl ground memorycell
Xwirel162_ref n_bl2_162 n_bl2_163 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer162_ref n_br2_162 n_br2_163 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj162_ref ground ground n_bl2_163 ground n_br2_163 ground vdd_readl ground memorycell
Xwirel163_ref n_bl2_163 n_bl2_164 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer163_ref n_br2_163 n_br2_164 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj163_ref ground ground n_bl2_164 ground n_br2_164 ground vdd_readl ground memorycell
Xwirel164_ref n_bl2_164 n_bl2_165 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer164_ref n_br2_164 n_br2_165 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj164_ref ground ground n_bl2_165 ground n_br2_165 ground vdd_readl ground memorycell
Xwirel165_ref n_bl2_165 n_bl2_166 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer165_ref n_br2_165 n_br2_166 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj165_ref ground ground n_bl2_166 ground n_br2_166 ground vdd_readl ground memorycell
Xwirel166_ref n_bl2_166 n_bl2_167 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer166_ref n_br2_166 n_br2_167 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj166_ref ground ground n_bl2_167 ground n_br2_167 ground vdd_readl ground memorycell
Xwirel167_ref n_bl2_167 n_bl2_168 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer167_ref n_br2_167 n_br2_168 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj167_ref ground ground n_bl2_168 ground n_br2_168 ground vdd_readl ground memorycell
Xwirel168_ref n_bl2_168 n_bl2_169 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer168_ref n_br2_168 n_br2_169 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj168_ref ground ground n_bl2_169 ground n_br2_169 ground vdd_readl ground memorycell
Xwirel169_ref n_bl2_169 n_bl2_170 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer169_ref n_br2_169 n_br2_170 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj169_ref ground ground n_bl2_170 ground n_br2_170 ground vdd_readl ground memorycell
Xwirel170_ref n_bl2_170 n_bl2_171 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer170_ref n_br2_170 n_br2_171 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj170_ref ground ground n_bl2_171 ground n_br2_171 ground vdd_readl ground memorycell
Xwirel171_ref n_bl2_171 n_bl2_172 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer171_ref n_br2_171 n_br2_172 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj171_ref ground ground n_bl2_172 ground n_br2_172 ground vdd_readl ground memorycell
Xwirel172_ref n_bl2_172 n_bl2_173 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer172_ref n_br2_172 n_br2_173 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj172_ref ground ground n_bl2_173 ground n_br2_173 ground vdd_readl ground memorycell
Xwirel173_ref n_bl2_173 n_bl2_174 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer173_ref n_br2_173 n_br2_174 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj173_ref ground ground n_bl2_174 ground n_br2_174 ground vdd_readl ground memorycell
Xwirel174_ref n_bl2_174 n_bl2_175 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer174_ref n_br2_174 n_br2_175 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj174_ref ground ground n_bl2_175 ground n_br2_175 ground vdd_readl ground memorycell
Xwirel175_ref n_bl2_175 n_bl2_176 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer175_ref n_br2_175 n_br2_176 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj175_ref ground ground n_bl2_176 ground n_br2_176 ground vdd_readl ground memorycell
Xwirel176_ref n_bl2_176 n_bl2_177 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer176_ref n_br2_176 n_br2_177 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj176_ref ground ground n_bl2_177 ground n_br2_177 ground vdd_readl ground memorycell
Xwirel177_ref n_bl2_177 n_bl2_178 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer177_ref n_br2_177 n_br2_178 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj177_ref ground ground n_bl2_178 ground n_br2_178 ground vdd_readl ground memorycell
Xwirel178_ref n_bl2_178 n_bl2_179 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer178_ref n_br2_178 n_br2_179 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj178_ref ground ground n_bl2_179 ground n_br2_179 ground vdd_readl ground memorycell
Xwirel179_ref n_bl2_179 n_bl2_180 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer179_ref n_br2_179 n_br2_180 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj179_ref ground ground n_bl2_180 ground n_br2_180 ground vdd_readl ground memorycell
Xwirel180_ref n_bl2_180 n_bl2_181 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer180_ref n_br2_180 n_br2_181 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj180_ref ground ground n_bl2_181 ground n_br2_181 ground vdd_readl ground memorycell
Xwirel181_ref n_bl2_181 n_bl2_182 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer181_ref n_br2_181 n_br2_182 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj181_ref ground ground n_bl2_182 ground n_br2_182 ground vdd_readl ground memorycell
Xwirel182_ref n_bl2_182 n_bl2_183 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer182_ref n_br2_182 n_br2_183 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj182_ref ground ground n_bl2_183 ground n_br2_183 ground vdd_readl ground memorycell
Xwirel183_ref n_bl2_183 n_bl2_184 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer183_ref n_br2_183 n_br2_184 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj183_ref ground ground n_bl2_184 ground n_br2_184 ground vdd_readl ground memorycell
Xwirel184_ref n_bl2_184 n_bl2_185 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer184_ref n_br2_184 n_br2_185 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj184_ref ground ground n_bl2_185 ground n_br2_185 ground vdd_readl ground memorycell
Xwirel185_ref n_bl2_185 n_bl2_186 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer185_ref n_br2_185 n_br2_186 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj185_ref ground ground n_bl2_186 ground n_br2_186 ground vdd_readl ground memorycell
Xwirel186_ref n_bl2_186 n_bl2_187 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer186_ref n_br2_186 n_br2_187 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj186_ref ground ground n_bl2_187 ground n_br2_187 ground vdd_readl ground memorycell
Xwirel187_ref n_bl2_187 n_bl2_188 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer187_ref n_br2_187 n_br2_188 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj187_ref ground ground n_bl2_188 ground n_br2_188 ground vdd_readl ground memorycell
Xwirel188_ref n_bl2_188 n_bl2_189 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer188_ref n_br2_188 n_br2_189 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj188_ref ground ground n_bl2_189 ground n_br2_189 ground vdd_readl ground memorycell
Xwirel189_ref n_bl2_189 n_bl2_190 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer189_ref n_br2_189 n_br2_190 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj189_ref ground ground n_bl2_190 ground n_br2_190 ground vdd_readl ground memorycell
Xwirel190_ref n_bl2_190 n_bl2_191 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer190_ref n_br2_190 n_br2_191 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj190_ref ground ground n_bl2_191 ground n_br2_191 ground vdd_readl ground memorycell
Xwirel191_ref n_bl2_191 n_bl2_192 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer191_ref n_br2_191 n_br2_192 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj191_ref ground ground n_bl2_192 ground n_br2_192 ground vdd_readl ground memorycell
Xwirel192_ref n_bl2_192 n_bl2_193 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer192_ref n_br2_192 n_br2_193 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj192_ref ground ground n_bl2_193 ground n_br2_193 ground vdd_readl ground memorycell
Xwirel193_ref n_bl2_193 n_bl2_194 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer193_ref n_br2_193 n_br2_194 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj193_ref ground ground n_bl2_194 ground n_br2_194 ground vdd_readl ground memorycell
Xwirel194_ref n_bl2_194 n_bl2_195 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer194_ref n_br2_194 n_br2_195 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj194_ref ground ground n_bl2_195 ground n_br2_195 ground vdd_readl ground memorycell
Xwirel195_ref n_bl2_195 n_bl2_196 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer195_ref n_br2_195 n_br2_196 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj195_ref ground ground n_bl2_196 ground n_br2_196 ground vdd_readl ground memorycell
Xwirel196_ref n_bl2_196 n_bl2_197 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer196_ref n_br2_196 n_br2_197 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj196_ref ground ground n_bl2_197 ground n_br2_197 ground vdd_readl ground memorycell
Xwirel197_ref n_bl2_197 n_bl2_198 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer197_ref n_br2_197 n_br2_198 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj197_ref ground ground n_bl2_198 ground n_br2_198 ground vdd_readl ground memorycell
Xwirel198_ref n_bl2_198 n_bl2_199 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer198_ref n_br2_198 n_br2_199 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj198_ref ground ground n_bl2_199 ground n_br2_199 ground vdd_readl ground memorycell
Xwirel199_ref n_bl2_199 n_bl2_200 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer199_ref n_br2_199 n_br2_200 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj199_ref ground ground n_bl2_200 ground n_br2_200 ground vdd_readl ground memorycell
Xwirel200_ref n_bl2_200 n_bl2_201 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer200_ref n_br2_200 n_br2_201 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj200_ref ground ground n_bl2_201 ground n_br2_201 ground vdd_readl ground memorycell
Xwirel201_ref n_bl2_201 n_bl2_202 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer201_ref n_br2_201 n_br2_202 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj201_ref ground ground n_bl2_202 ground n_br2_202 ground vdd_readl ground memorycell
Xwirel202_ref n_bl2_202 n_bl2_203 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer202_ref n_br2_202 n_br2_203 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj202_ref ground ground n_bl2_203 ground n_br2_203 ground vdd_readl ground memorycell
Xwirel203_ref n_bl2_203 n_bl2_204 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer203_ref n_br2_203 n_br2_204 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj203_ref ground ground n_bl2_204 ground n_br2_204 ground vdd_readl ground memorycell
Xwirel204_ref n_bl2_204 n_bl2_205 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer204_ref n_br2_204 n_br2_205 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj204_ref ground ground n_bl2_205 ground n_br2_205 ground vdd_readl ground memorycell
Xwirel205_ref n_bl2_205 n_bl2_206 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer205_ref n_br2_205 n_br2_206 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj205_ref ground ground n_bl2_206 ground n_br2_206 ground vdd_readl ground memorycell
Xwirel206_ref n_bl2_206 n_bl2_207 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer206_ref n_br2_206 n_br2_207 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj206_ref ground ground n_bl2_207 ground n_br2_207 ground vdd_readl ground memorycell
Xwirel207_ref n_bl2_207 n_bl2_208 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer207_ref n_br2_207 n_br2_208 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj207_ref ground ground n_bl2_208 ground n_br2_208 ground vdd_readl ground memorycell
Xwirel208_ref n_bl2_208 n_bl2_209 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer208_ref n_br2_208 n_br2_209 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj208_ref ground ground n_bl2_209 ground n_br2_209 ground vdd_readl ground memorycell
Xwirel209_ref n_bl2_209 n_bl2_210 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer209_ref n_br2_209 n_br2_210 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj209_ref ground ground n_bl2_210 ground n_br2_210 ground vdd_readl ground memorycell
Xwirel210_ref n_bl2_210 n_bl2_211 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer210_ref n_br2_210 n_br2_211 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj210_ref ground ground n_bl2_211 ground n_br2_211 ground vdd_readl ground memorycell
Xwirel211_ref n_bl2_211 n_bl2_212 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer211_ref n_br2_211 n_br2_212 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj211_ref ground ground n_bl2_212 ground n_br2_212 ground vdd_readl ground memorycell
Xwirel212_ref n_bl2_212 n_bl2_213 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer212_ref n_br2_212 n_br2_213 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj212_ref ground ground n_bl2_213 ground n_br2_213 ground vdd_readl ground memorycell
Xwirel213_ref n_bl2_213 n_bl2_214 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer213_ref n_br2_213 n_br2_214 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj213_ref ground ground n_bl2_214 ground n_br2_214 ground vdd_readl ground memorycell
Xwirel214_ref n_bl2_214 n_bl2_215 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer214_ref n_br2_214 n_br2_215 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj214_ref ground ground n_bl2_215 ground n_br2_215 ground vdd_readl ground memorycell
Xwirel215_ref n_bl2_215 n_bl2_216 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer215_ref n_br2_215 n_br2_216 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj215_ref ground ground n_bl2_216 ground n_br2_216 ground vdd_readl ground memorycell
Xwirel216_ref n_bl2_216 n_bl2_217 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer216_ref n_br2_216 n_br2_217 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj216_ref ground ground n_bl2_217 ground n_br2_217 ground vdd_readl ground memorycell
Xwirel217_ref n_bl2_217 n_bl2_218 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer217_ref n_br2_217 n_br2_218 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj217_ref ground ground n_bl2_218 ground n_br2_218 ground vdd_readl ground memorycell
Xwirel218_ref n_bl2_218 n_bl2_219 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer218_ref n_br2_218 n_br2_219 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj218_ref ground ground n_bl2_219 ground n_br2_219 ground vdd_readl ground memorycell
Xwirel219_ref n_bl2_219 n_bl2_220 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer219_ref n_br2_219 n_br2_220 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj219_ref ground ground n_bl2_220 ground n_br2_220 ground vdd_readl ground memorycell
Xwirel220_ref n_bl2_220 n_bl2_221 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer220_ref n_br2_220 n_br2_221 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj220_ref ground ground n_bl2_221 ground n_br2_221 ground vdd_readl ground memorycell
Xwirel221_ref n_bl2_221 n_bl2_222 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer221_ref n_br2_221 n_br2_222 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj221_ref ground ground n_bl2_222 ground n_br2_222 ground vdd_readl ground memorycell
Xwirel222_ref n_bl2_222 n_bl2_223 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer222_ref n_br2_222 n_br2_223 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj222_ref ground ground n_bl2_223 ground n_br2_223 ground vdd_readl ground memorycell
Xwirel223_ref n_bl2_223 n_bl2_224 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer223_ref n_br2_223 n_br2_224 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj223_ref ground ground n_bl2_224 ground n_br2_224 ground vdd_readl ground memorycell
Xwirel224_ref n_bl2_224 n_bl2_225 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer224_ref n_br2_224 n_br2_225 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj224_ref ground ground n_bl2_225 ground n_br2_225 ground vdd_readl ground memorycell
Xwirel225_ref n_bl2_225 n_bl2_226 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer225_ref n_br2_225 n_br2_226 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj225_ref ground ground n_bl2_226 ground n_br2_226 ground vdd_readl ground memorycell
Xwirel226_ref n_bl2_226 n_bl2_227 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer226_ref n_br2_226 n_br2_227 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj226_ref ground ground n_bl2_227 ground n_br2_227 ground vdd_readl ground memorycell
Xwirel227_ref n_bl2_227 n_bl2_228 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer227_ref n_br2_227 n_br2_228 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj227_ref ground ground n_bl2_228 ground n_br2_228 ground vdd_readl ground memorycell
Xwirel228_ref n_bl2_228 n_bl2_229 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer228_ref n_br2_228 n_br2_229 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj228_ref ground ground n_bl2_229 ground n_br2_229 ground vdd_readl ground memorycell
Xwirel229_ref n_bl2_229 n_bl2_230 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer229_ref n_br2_229 n_br2_230 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj229_ref ground ground n_bl2_230 ground n_br2_230 ground vdd_readl ground memorycell
Xwirel230_ref n_bl2_230 n_bl2_231 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer230_ref n_br2_230 n_br2_231 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj230_ref ground ground n_bl2_231 ground n_br2_231 ground vdd_readl ground memorycell
Xwirel231_ref n_bl2_231 n_bl2_232 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer231_ref n_br2_231 n_br2_232 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj231_ref ground ground n_bl2_232 ground n_br2_232 ground vdd_readl ground memorycell
Xwirel232_ref n_bl2_232 n_bl2_233 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer232_ref n_br2_232 n_br2_233 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj232_ref ground ground n_bl2_233 ground n_br2_233 ground vdd_readl ground memorycell
Xwirel233_ref n_bl2_233 n_bl2_234 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer233_ref n_br2_233 n_br2_234 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj233_ref ground ground n_bl2_234 ground n_br2_234 ground vdd_readl ground memorycell
Xwirel234_ref n_bl2_234 n_bl2_235 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer234_ref n_br2_234 n_br2_235 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj234_ref ground ground n_bl2_235 ground n_br2_235 ground vdd_readl ground memorycell
Xwirel235_ref n_bl2_235 n_bl2_236 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer235_ref n_br2_235 n_br2_236 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj235_ref ground ground n_bl2_236 ground n_br2_236 ground vdd_readl ground memorycell
Xwirel236_ref n_bl2_236 n_bl2_237 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer236_ref n_br2_236 n_br2_237 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj236_ref ground ground n_bl2_237 ground n_br2_237 ground vdd_readl ground memorycell
Xwirel237_ref n_bl2_237 n_bl2_238 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer237_ref n_br2_237 n_br2_238 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj237_ref ground ground n_bl2_238 ground n_br2_238 ground vdd_readl ground memorycell
Xwirel238_ref n_bl2_238 n_bl2_239 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer238_ref n_br2_238 n_br2_239 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj238_ref ground ground n_bl2_239 ground n_br2_239 ground vdd_readl ground memorycell
Xwirel239_ref n_bl2_239 n_bl2_240 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer239_ref n_br2_239 n_br2_240 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj239_ref ground ground n_bl2_240 ground n_br2_240 ground vdd_readl ground memorycell
Xwirel240_ref n_bl2_240 n_bl2_241 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer240_ref n_br2_240 n_br2_241 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj240_ref ground ground n_bl2_241 ground n_br2_241 ground vdd_readl ground memorycell
Xwirel241_ref n_bl2_241 n_bl2_242 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer241_ref n_br2_241 n_br2_242 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj241_ref ground ground n_bl2_242 ground n_br2_242 ground vdd_readl ground memorycell
Xwirel242_ref n_bl2_242 n_bl2_243 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer242_ref n_br2_242 n_br2_243 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj242_ref ground ground n_bl2_243 ground n_br2_243 ground vdd_readl ground memorycell
Xwirel243_ref n_bl2_243 n_bl2_244 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer243_ref n_br2_243 n_br2_244 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj243_ref ground ground n_bl2_244 ground n_br2_244 ground vdd_readl ground memorycell
Xwirel244_ref n_bl2_244 n_bl2_245 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer244_ref n_br2_244 n_br2_245 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj244_ref ground ground n_bl2_245 ground n_br2_245 ground vdd_readl ground memorycell
Xwirel245_ref n_bl2_245 n_bl2_246 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer245_ref n_br2_245 n_br2_246 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj245_ref ground ground n_bl2_246 ground n_br2_246 ground vdd_readl ground memorycell
Xwirel246_ref n_bl2_246 n_bl2_247 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer246_ref n_br2_246 n_br2_247 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj246_ref ground ground n_bl2_247 ground n_br2_247 ground vdd_readl ground memorycell
Xwirel247_ref n_bl2_247 n_bl2_248 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer247_ref n_br2_247 n_br2_248 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj247_ref ground ground n_bl2_248 ground n_br2_248 ground vdd_readl ground memorycell
Xwirel248_ref n_bl2_248 n_bl2_249 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer248_ref n_br2_248 n_br2_249 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj248_ref ground ground n_bl2_249 ground n_br2_249 ground vdd_readl ground memorycell
Xwirel249_ref n_bl2_249 n_bl2_250 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer249_ref n_br2_249 n_br2_250 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj249_ref ground ground n_bl2_250 ground n_br2_250 ground vdd_readl ground memorycell
Xwirel250_ref n_bl2_250 n_bl2_251 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer250_ref n_br2_250 n_br2_251 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj250_ref ground ground n_bl2_251 ground n_br2_251 ground vdd_readl ground memorycell
Xwirel251_ref n_bl2_251 n_bl2_252 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer251_ref n_br2_251 n_br2_252 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj251_ref ground ground n_bl2_252 ground n_br2_252 ground vdd_readl ground memorycell
Xwirel252_ref n_bl2_252 n_bl2_253 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer252_ref n_br2_252 n_br2_253 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj252_ref ground ground n_bl2_253 ground n_br2_253 ground vdd_readl ground memorycell
Xwirel253_ref n_bl2_253 n_bl2_254 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer253_ref n_br2_253 n_br2_254 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj253_ref ground ground n_bl2_254 ground n_br2_254 ground vdd_readl ground memorycell
Xwirel254_ref n_bl2_254 n_bl2_255 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer254_ref n_br2_254 n_br2_255 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj254_ref ground ground n_bl2_255 ground n_br2_255 ground vdd_readl ground memorycell
Xwirel255_ref n_bl2_255 n_bl2_256 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer255_ref n_br2_255 n_br2_256 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj255_ref ground ground n_bl2_256 ground n_br2_256 ground vdd_readl ground memorycell
Xwirel256_ref n_bl2_256 n_bl2_257 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer256_ref n_br2_256 n_br2_257 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj256_ref ground ground n_bl2_257 ground n_br2_257 ground vdd_readl ground memorycell
Xwirel257_ref n_bl2_257 n_bl2_258 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer257_ref n_br2_257 n_br2_258 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj257_ref ground ground n_bl2_258 ground n_br2_258 ground vdd_readl ground memorycell
Xwirel258_ref n_bl2_258 n_bl2_259 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer258_ref n_br2_258 n_br2_259 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj258_ref ground ground n_bl2_259 ground n_br2_259 ground vdd_readl ground memorycell
Xwirel259_ref n_bl2_259 n_bl2_260 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer259_ref n_br2_259 n_br2_260 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj259_ref ground ground n_bl2_260 ground n_br2_260 ground vdd_readl ground memorycell
Xwirel260_ref n_bl2_260 n_bl2_261 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer260_ref n_br2_260 n_br2_261 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj260_ref ground ground n_bl2_261 ground n_br2_261 ground vdd_readl ground memorycell
Xwirel261_ref n_bl2_261 n_bl2_262 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer261_ref n_br2_261 n_br2_262 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj261_ref ground ground n_bl2_262 ground n_br2_262 ground vdd_readl ground memorycell
Xwirel262_ref n_bl2_262 n_bl2_263 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer262_ref n_br2_262 n_br2_263 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj262_ref ground ground n_bl2_263 ground n_br2_263 ground vdd_readl ground memorycell
Xwirel263_ref n_bl2_263 n_bl2_264 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer263_ref n_br2_263 n_br2_264 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj263_ref ground ground n_bl2_264 ground n_br2_264 ground vdd_readl ground memorycell
Xwirel264_ref n_bl2_264 n_bl2_265 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer264_ref n_br2_264 n_br2_265 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj264_ref ground ground n_bl2_265 ground n_br2_265 ground vdd_readl ground memorycell
Xwirel265_ref n_bl2_265 n_bl2_266 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer265_ref n_br2_265 n_br2_266 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj265_ref ground ground n_bl2_266 ground n_br2_266 ground vdd_readl ground memorycell
Xwirel266_ref n_bl2_266 n_bl2_267 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer266_ref n_br2_266 n_br2_267 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj266_ref ground ground n_bl2_267 ground n_br2_267 ground vdd_readl ground memorycell
Xwirel267_ref n_bl2_267 n_bl2_268 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer267_ref n_br2_267 n_br2_268 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj267_ref ground ground n_bl2_268 ground n_br2_268 ground vdd_readl ground memorycell
Xwirel268_ref n_bl2_268 n_bl2_269 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer268_ref n_br2_268 n_br2_269 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj268_ref ground ground n_bl2_269 ground n_br2_269 ground vdd_readl ground memorycell
Xwirel269_ref n_bl2_269 n_bl2_270 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer269_ref n_br2_269 n_br2_270 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj269_ref ground ground n_bl2_270 ground n_br2_270 ground vdd_readl ground memorycell
Xwirel270_ref n_bl2_270 n_bl2_271 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer270_ref n_br2_270 n_br2_271 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj270_ref ground ground n_bl2_271 ground n_br2_271 ground vdd_readl ground memorycell
Xwirel271_ref n_bl2_271 n_bl2_272 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer271_ref n_br2_271 n_br2_272 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj271_ref ground ground n_bl2_272 ground n_br2_272 ground vdd_readl ground memorycell
Xwirel272_ref n_bl2_272 n_bl2_273 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer272_ref n_br2_272 n_br2_273 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj272_ref ground ground n_bl2_273 ground n_br2_273 ground vdd_readl ground memorycell
Xwirel273_ref n_bl2_273 n_bl2_274 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer273_ref n_br2_273 n_br2_274 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj273_ref ground ground n_bl2_274 ground n_br2_274 ground vdd_readl ground memorycell
Xwirel274_ref n_bl2_274 n_bl2_275 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer274_ref n_br2_274 n_br2_275 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj274_ref ground ground n_bl2_275 ground n_br2_275 ground vdd_readl ground memorycell
Xwirel275_ref n_bl2_275 n_bl2_276 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer275_ref n_br2_275 n_br2_276 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj275_ref ground ground n_bl2_276 ground n_br2_276 ground vdd_readl ground memorycell
Xwirel276_ref n_bl2_276 n_bl2_277 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer276_ref n_br2_276 n_br2_277 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj276_ref ground ground n_bl2_277 ground n_br2_277 ground vdd_readl ground memorycell
Xwirel277_ref n_bl2_277 n_bl2_278 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer277_ref n_br2_277 n_br2_278 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj277_ref ground ground n_bl2_278 ground n_br2_278 ground vdd_readl ground memorycell
Xwirel278_ref n_bl2_278 n_bl2_279 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer278_ref n_br2_278 n_br2_279 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj278_ref ground ground n_bl2_279 ground n_br2_279 ground vdd_readl ground memorycell
Xwirel279_ref n_bl2_279 n_bl2_280 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer279_ref n_br2_279 n_br2_280 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj279_ref ground ground n_bl2_280 ground n_br2_280 ground vdd_readl ground memorycell
Xwirel280_ref n_bl2_280 n_bl2_281 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer280_ref n_br2_280 n_br2_281 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj280_ref ground ground n_bl2_281 ground n_br2_281 ground vdd_readl ground memorycell
Xwirel281_ref n_bl2_281 n_bl2_282 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer281_ref n_br2_281 n_br2_282 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj281_ref ground ground n_bl2_282 ground n_br2_282 ground vdd_readl ground memorycell
Xwirel282_ref n_bl2_282 n_bl2_283 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer282_ref n_br2_282 n_br2_283 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj282_ref ground ground n_bl2_283 ground n_br2_283 ground vdd_readl ground memorycell
Xwirel283_ref n_bl2_283 n_bl2_284 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer283_ref n_br2_283 n_br2_284 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj283_ref ground ground n_bl2_284 ground n_br2_284 ground vdd_readl ground memorycell
Xwirel284_ref n_bl2_284 n_bl2_285 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer284_ref n_br2_284 n_br2_285 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj284_ref ground ground n_bl2_285 ground n_br2_285 ground vdd_readl ground memorycell
Xwirel285_ref n_bl2_285 n_bl2_286 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer285_ref n_br2_285 n_br2_286 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj285_ref ground ground n_bl2_286 ground n_br2_286 ground vdd_readl ground memorycell
Xwirel286_ref n_bl2_286 n_bl2_287 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer286_ref n_br2_286 n_br2_287 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj286_ref ground ground n_bl2_287 ground n_br2_287 ground vdd_readl ground memorycell
Xwirel287_ref n_bl2_287 n_bl2_288 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer287_ref n_br2_287 n_br2_288 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj287_ref ground ground n_bl2_288 ground n_br2_288 ground vdd_readl ground memorycell
Xwirel288_ref n_bl2_288 n_bl2_289 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer288_ref n_br2_288 n_br2_289 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj288_ref ground ground n_bl2_289 ground n_br2_289 ground vdd_readl ground memorycell
Xwirel289_ref n_bl2_289 n_bl2_290 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer289_ref n_br2_289 n_br2_290 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj289_ref ground ground n_bl2_290 ground n_br2_290 ground vdd_readl ground memorycell
Xwirel290_ref n_bl2_290 n_bl2_291 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer290_ref n_br2_290 n_br2_291 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj290_ref ground ground n_bl2_291 ground n_br2_291 ground vdd_readl ground memorycell
Xwirel291_ref n_bl2_291 n_bl2_292 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer291_ref n_br2_291 n_br2_292 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj291_ref ground ground n_bl2_292 ground n_br2_292 ground vdd_readl ground memorycell
Xwirel292_ref n_bl2_292 n_bl2_293 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer292_ref n_br2_292 n_br2_293 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj292_ref ground ground n_bl2_293 ground n_br2_293 ground vdd_readl ground memorycell
Xwirel293_ref n_bl2_293 n_bl2_294 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer293_ref n_br2_293 n_br2_294 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj293_ref ground ground n_bl2_294 ground n_br2_294 ground vdd_readl ground memorycell
Xwirel294_ref n_bl2_294 n_bl2_295 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer294_ref n_br2_294 n_br2_295 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj294_ref ground ground n_bl2_295 ground n_br2_295 ground vdd_readl ground memorycell
Xwirel295_ref n_bl2_295 n_bl2_296 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer295_ref n_br2_295 n_br2_296 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj295_ref ground ground n_bl2_296 ground n_br2_296 ground vdd_readl ground memorycell
Xwirel296_ref n_bl2_296 n_bl2_297 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer296_ref n_br2_296 n_br2_297 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj296_ref ground ground n_bl2_297 ground n_br2_297 ground vdd_readl ground memorycell
Xwirel297_ref n_bl2_297 n_bl2_298 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer297_ref n_br2_297 n_br2_298 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj297_ref ground ground n_bl2_298 ground n_br2_298 ground vdd_readl ground memorycell
Xwirel298_ref n_bl2_298 n_bl2_299 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer298_ref n_br2_298 n_br2_299 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj298_ref ground ground n_bl2_299 ground n_br2_299 ground vdd_readl ground memorycell
Xwirel299_ref n_bl2_299 n_bl2_300 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer299_ref n_br2_299 n_br2_300 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj299_ref ground ground n_bl2_300 ground n_br2_300 ground vdd_readl ground memorycell
Xwirel300_ref n_bl2_300 n_bl2_301 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer300_ref n_br2_300 n_br2_301 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj300_ref ground ground n_bl2_301 ground n_br2_301 ground vdd_readl ground memorycell
Xwirel301_ref n_bl2_301 n_bl2_302 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer301_ref n_br2_301 n_br2_302 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj301_ref ground ground n_bl2_302 ground n_br2_302 ground vdd_readl ground memorycell
Xwirel302_ref n_bl2_302 n_bl2_303 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer302_ref n_br2_302 n_br2_303 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj302_ref ground ground n_bl2_303 ground n_br2_303 ground vdd_readl ground memorycell
Xwirel303_ref n_bl2_303 n_bl2_304 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer303_ref n_br2_303 n_br2_304 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj303_ref ground ground n_bl2_304 ground n_br2_304 ground vdd_readl ground memorycell
Xwirel304_ref n_bl2_304 n_bl2_305 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer304_ref n_br2_304 n_br2_305 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj304_ref ground ground n_bl2_305 ground n_br2_305 ground vdd_readl ground memorycell
Xwirel305_ref n_bl2_305 n_bl2_306 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer305_ref n_br2_305 n_br2_306 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj305_ref ground ground n_bl2_306 ground n_br2_306 ground vdd_readl ground memorycell
Xwirel306_ref n_bl2_306 n_bl2_307 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer306_ref n_br2_306 n_br2_307 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj306_ref ground ground n_bl2_307 ground n_br2_307 ground vdd_readl ground memorycell
Xwirel307_ref n_bl2_307 n_bl2_308 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer307_ref n_br2_307 n_br2_308 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj307_ref ground ground n_bl2_308 ground n_br2_308 ground vdd_readl ground memorycell
Xwirel308_ref n_bl2_308 n_bl2_309 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer308_ref n_br2_308 n_br2_309 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj308_ref ground ground n_bl2_309 ground n_br2_309 ground vdd_readl ground memorycell
Xwirel309_ref n_bl2_309 n_bl2_310 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer309_ref n_br2_309 n_br2_310 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj309_ref ground ground n_bl2_310 ground n_br2_310 ground vdd_readl ground memorycell
Xwirel310_ref n_bl2_310 n_bl2_311 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer310_ref n_br2_310 n_br2_311 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj310_ref ground ground n_bl2_311 ground n_br2_311 ground vdd_readl ground memorycell
Xwirel311_ref n_bl2_311 n_bl2_312 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer311_ref n_br2_311 n_br2_312 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj311_ref ground ground n_bl2_312 ground n_br2_312 ground vdd_readl ground memorycell
Xwirel312_ref n_bl2_312 n_bl2_313 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer312_ref n_br2_312 n_br2_313 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj312_ref ground ground n_bl2_313 ground n_br2_313 ground vdd_readl ground memorycell
Xwirel313_ref n_bl2_313 n_bl2_314 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer313_ref n_br2_313 n_br2_314 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj313_ref ground ground n_bl2_314 ground n_br2_314 ground vdd_readl ground memorycell
Xwirel314_ref n_bl2_314 n_bl2_315 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer314_ref n_br2_314 n_br2_315 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj314_ref ground ground n_bl2_315 ground n_br2_315 ground vdd_readl ground memorycell
Xwirel315_ref n_bl2_315 n_bl2_316 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer315_ref n_br2_315 n_br2_316 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj315_ref ground ground n_bl2_316 ground n_br2_316 ground vdd_readl ground memorycell
Xwirel316_ref n_bl2_316 n_bl2_317 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer316_ref n_br2_316 n_br2_317 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj316_ref ground ground n_bl2_317 ground n_br2_317 ground vdd_readl ground memorycell
Xwirel317_ref n_bl2_317 n_bl2_318 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer317_ref n_br2_317 n_br2_318 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj317_ref ground ground n_bl2_318 ground n_br2_318 ground vdd_readl ground memorycell
Xwirel318_ref n_bl2_318 n_bl2_319 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer318_ref n_br2_318 n_br2_319 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj318_ref ground ground n_bl2_319 ground n_br2_319 ground vdd_readl ground memorycell
Xwirel319_ref n_bl2_319 n_bl2_320 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer319_ref n_br2_319 n_br2_320 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj319_ref ground ground n_bl2_320 ground n_br2_320 ground vdd_readl ground memorycell
Xwirel320_ref n_bl2_320 n_bl2_321 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer320_ref n_br2_320 n_br2_321 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj320_ref ground ground n_bl2_321 ground n_br2_321 ground vdd_readl ground memorycell
Xwirel321_ref n_bl2_321 n_bl2_322 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer321_ref n_br2_321 n_br2_322 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj321_ref ground ground n_bl2_322 ground n_br2_322 ground vdd_readl ground memorycell
Xwirel322_ref n_bl2_322 n_bl2_323 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer322_ref n_br2_322 n_br2_323 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj322_ref ground ground n_bl2_323 ground n_br2_323 ground vdd_readl ground memorycell
Xwirel323_ref n_bl2_323 n_bl2_324 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer323_ref n_br2_323 n_br2_324 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj323_ref ground ground n_bl2_324 ground n_br2_324 ground vdd_readl ground memorycell
Xwirel324_ref n_bl2_324 n_bl2_325 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer324_ref n_br2_324 n_br2_325 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj324_ref ground ground n_bl2_325 ground n_br2_325 ground vdd_readl ground memorycell
Xwirel325_ref n_bl2_325 n_bl2_326 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer325_ref n_br2_325 n_br2_326 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj325_ref ground ground n_bl2_326 ground n_br2_326 ground vdd_readl ground memorycell
Xwirel326_ref n_bl2_326 n_bl2_327 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer326_ref n_br2_326 n_br2_327 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj326_ref ground ground n_bl2_327 ground n_br2_327 ground vdd_readl ground memorycell
Xwirel327_ref n_bl2_327 n_bl2_328 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer327_ref n_br2_327 n_br2_328 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj327_ref ground ground n_bl2_328 ground n_br2_328 ground vdd_readl ground memorycell
Xwirel328_ref n_bl2_328 n_bl2_329 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer328_ref n_br2_328 n_br2_329 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj328_ref ground ground n_bl2_329 ground n_br2_329 ground vdd_readl ground memorycell
Xwirel329_ref n_bl2_329 n_bl2_330 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer329_ref n_br2_329 n_br2_330 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj329_ref ground ground n_bl2_330 ground n_br2_330 ground vdd_readl ground memorycell
Xwirel330_ref n_bl2_330 n_bl2_331 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer330_ref n_br2_330 n_br2_331 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj330_ref ground ground n_bl2_331 ground n_br2_331 ground vdd_readl ground memorycell
Xwirel331_ref n_bl2_331 n_bl2_332 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer331_ref n_br2_331 n_br2_332 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj331_ref ground ground n_bl2_332 ground n_br2_332 ground vdd_readl ground memorycell
Xwirel332_ref n_bl2_332 n_bl2_333 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer332_ref n_br2_332 n_br2_333 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj332_ref ground ground n_bl2_333 ground n_br2_333 ground vdd_readl ground memorycell
Xwirel333_ref n_bl2_333 n_bl2_334 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer333_ref n_br2_333 n_br2_334 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj333_ref ground ground n_bl2_334 ground n_br2_334 ground vdd_readl ground memorycell
Xwirel334_ref n_bl2_334 n_bl2_335 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer334_ref n_br2_334 n_br2_335 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj334_ref ground ground n_bl2_335 ground n_br2_335 ground vdd_readl ground memorycell
Xwirel335_ref n_bl2_335 n_bl2_336 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer335_ref n_br2_335 n_br2_336 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj335_ref ground ground n_bl2_336 ground n_br2_336 ground vdd_readl ground memorycell
Xwirel336_ref n_bl2_336 n_bl2_337 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer336_ref n_br2_336 n_br2_337 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj336_ref ground ground n_bl2_337 ground n_br2_337 ground vdd_readl ground memorycell
Xwirel337_ref n_bl2_337 n_bl2_338 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer337_ref n_br2_337 n_br2_338 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj337_ref ground ground n_bl2_338 ground n_br2_338 ground vdd_readl ground memorycell
Xwirel338_ref n_bl2_338 n_bl2_339 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer338_ref n_br2_338 n_br2_339 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj338_ref ground ground n_bl2_339 ground n_br2_339 ground vdd_readl ground memorycell
Xwirel339_ref n_bl2_339 n_bl2_340 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer339_ref n_br2_339 n_br2_340 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj339_ref ground ground n_bl2_340 ground n_br2_340 ground vdd_readl ground memorycell
Xwirel340_ref n_bl2_340 n_bl2_341 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer340_ref n_br2_340 n_br2_341 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj340_ref ground ground n_bl2_341 ground n_br2_341 ground vdd_readl ground memorycell
Xwirel341_ref n_bl2_341 n_bl2_342 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer341_ref n_br2_341 n_br2_342 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj341_ref ground ground n_bl2_342 ground n_br2_342 ground vdd_readl ground memorycell
Xwirel342_ref n_bl2_342 n_bl2_343 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer342_ref n_br2_342 n_br2_343 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj342_ref ground ground n_bl2_343 ground n_br2_343 ground vdd_readl ground memorycell
Xwirel343_ref n_bl2_343 n_bl2_344 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer343_ref n_br2_343 n_br2_344 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj343_ref ground ground n_bl2_344 ground n_br2_344 ground vdd_readl ground memorycell
Xwirel344_ref n_bl2_344 n_bl2_345 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer344_ref n_br2_344 n_br2_345 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj344_ref ground ground n_bl2_345 ground n_br2_345 ground vdd_readl ground memorycell
Xwirel345_ref n_bl2_345 n_bl2_346 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer345_ref n_br2_345 n_br2_346 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj345_ref ground ground n_bl2_346 ground n_br2_346 ground vdd_readl ground memorycell
Xwirel346_ref n_bl2_346 n_bl2_347 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer346_ref n_br2_346 n_br2_347 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj346_ref ground ground n_bl2_347 ground n_br2_347 ground vdd_readl ground memorycell
Xwirel347_ref n_bl2_347 n_bl2_348 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer347_ref n_br2_347 n_br2_348 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj347_ref ground ground n_bl2_348 ground n_br2_348 ground vdd_readl ground memorycell
Xwirel348_ref n_bl2_348 n_bl2_349 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer348_ref n_br2_348 n_br2_349 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj348_ref ground ground n_bl2_349 ground n_br2_349 ground vdd_readl ground memorycell
Xwirel349_ref n_bl2_349 n_bl2_350 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer349_ref n_br2_349 n_br2_350 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj349_ref ground ground n_bl2_350 ground n_br2_350 ground vdd_readl ground memorycell
Xwirel350_ref n_bl2_350 n_bl2_351 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer350_ref n_br2_350 n_br2_351 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj350_ref ground ground n_bl2_351 ground n_br2_351 ground vdd_readl ground memorycell
Xwirel351_ref n_bl2_351 n_bl2_352 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer351_ref n_br2_351 n_br2_352 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj351_ref ground ground n_bl2_352 ground n_br2_352 ground vdd_readl ground memorycell
Xwirel352_ref n_bl2_352 n_bl2_353 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer352_ref n_br2_352 n_br2_353 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj352_ref ground ground n_bl2_353 ground n_br2_353 ground vdd_readl ground memorycell
Xwirel353_ref n_bl2_353 n_bl2_354 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer353_ref n_br2_353 n_br2_354 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj353_ref ground ground n_bl2_354 ground n_br2_354 ground vdd_readl ground memorycell
Xwirel354_ref n_bl2_354 n_bl2_355 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer354_ref n_br2_354 n_br2_355 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj354_ref ground ground n_bl2_355 ground n_br2_355 ground vdd_readl ground memorycell
Xwirel355_ref n_bl2_355 n_bl2_356 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer355_ref n_br2_355 n_br2_356 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj355_ref ground ground n_bl2_356 ground n_br2_356 ground vdd_readl ground memorycell
Xwirel356_ref n_bl2_356 n_bl2_357 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer356_ref n_br2_356 n_br2_357 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj356_ref ground ground n_bl2_357 ground n_br2_357 ground vdd_readl ground memorycell
Xwirel357_ref n_bl2_357 n_bl2_358 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer357_ref n_br2_357 n_br2_358 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj357_ref ground ground n_bl2_358 ground n_br2_358 ground vdd_readl ground memorycell
Xwirel358_ref n_bl2_358 n_bl2_359 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer358_ref n_br2_358 n_br2_359 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj358_ref ground ground n_bl2_359 ground n_br2_359 ground vdd_readl ground memorycell
Xwirel359_ref n_bl2_359 n_bl2_360 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer359_ref n_br2_359 n_br2_360 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj359_ref ground ground n_bl2_360 ground n_br2_360 ground vdd_readl ground memorycell
Xwirel360_ref n_bl2_360 n_bl2_361 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer360_ref n_br2_360 n_br2_361 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj360_ref ground ground n_bl2_361 ground n_br2_361 ground vdd_readl ground memorycell
Xwirel361_ref n_bl2_361 n_bl2_362 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer361_ref n_br2_361 n_br2_362 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj361_ref ground ground n_bl2_362 ground n_br2_362 ground vdd_readl ground memorycell
Xwirel362_ref n_bl2_362 n_bl2_363 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer362_ref n_br2_362 n_br2_363 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj362_ref ground ground n_bl2_363 ground n_br2_363 ground vdd_readl ground memorycell
Xwirel363_ref n_bl2_363 n_bl2_364 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer363_ref n_br2_363 n_br2_364 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj363_ref ground ground n_bl2_364 ground n_br2_364 ground vdd_readl ground memorycell
Xwirel364_ref n_bl2_364 n_bl2_365 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer364_ref n_br2_364 n_br2_365 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj364_ref ground ground n_bl2_365 ground n_br2_365 ground vdd_readl ground memorycell
Xwirel365_ref n_bl2_365 n_bl2_366 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer365_ref n_br2_365 n_br2_366 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj365_ref ground ground n_bl2_366 ground n_br2_366 ground vdd_readl ground memorycell
Xwirel366_ref n_bl2_366 n_bl2_367 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer366_ref n_br2_366 n_br2_367 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj366_ref ground ground n_bl2_367 ground n_br2_367 ground vdd_readl ground memorycell
Xwirel367_ref n_bl2_367 n_bl2_368 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer367_ref n_br2_367 n_br2_368 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj367_ref ground ground n_bl2_368 ground n_br2_368 ground vdd_readl ground memorycell
Xwirel368_ref n_bl2_368 n_bl2_369 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer368_ref n_br2_368 n_br2_369 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj368_ref ground ground n_bl2_369 ground n_br2_369 ground vdd_readl ground memorycell
Xwirel369_ref n_bl2_369 n_bl2_370 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer369_ref n_br2_369 n_br2_370 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj369_ref ground ground n_bl2_370 ground n_br2_370 ground vdd_readl ground memorycell
Xwirel370_ref n_bl2_370 n_bl2_371 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer370_ref n_br2_370 n_br2_371 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj370_ref ground ground n_bl2_371 ground n_br2_371 ground vdd_readl ground memorycell
Xwirel371_ref n_bl2_371 n_bl2_372 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer371_ref n_br2_371 n_br2_372 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj371_ref ground ground n_bl2_372 ground n_br2_372 ground vdd_readl ground memorycell
Xwirel372_ref n_bl2_372 n_bl2_373 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer372_ref n_br2_372 n_br2_373 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj372_ref ground ground n_bl2_373 ground n_br2_373 ground vdd_readl ground memorycell
Xwirel373_ref n_bl2_373 n_bl2_374 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer373_ref n_br2_373 n_br2_374 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj373_ref ground ground n_bl2_374 ground n_br2_374 ground vdd_readl ground memorycell
Xwirel374_ref n_bl2_374 n_bl2_375 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer374_ref n_br2_374 n_br2_375 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj374_ref ground ground n_bl2_375 ground n_br2_375 ground vdd_readl ground memorycell
Xwirel375_ref n_bl2_375 n_bl2_376 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer375_ref n_br2_375 n_br2_376 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj375_ref ground ground n_bl2_376 ground n_br2_376 ground vdd_readl ground memorycell
Xwirel376_ref n_bl2_376 n_bl2_377 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer376_ref n_br2_376 n_br2_377 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj376_ref ground ground n_bl2_377 ground n_br2_377 ground vdd_readl ground memorycell
Xwirel377_ref n_bl2_377 n_bl2_378 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer377_ref n_br2_377 n_br2_378 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj377_ref ground ground n_bl2_378 ground n_br2_378 ground vdd_readl ground memorycell
Xwirel378_ref n_bl2_378 n_bl2_379 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer378_ref n_br2_378 n_br2_379 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj378_ref ground ground n_bl2_379 ground n_br2_379 ground vdd_readl ground memorycell
Xwirel379_ref n_bl2_379 n_bl2_380 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer379_ref n_br2_379 n_br2_380 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj379_ref ground ground n_bl2_380 ground n_br2_380 ground vdd_readl ground memorycell
Xwirel380_ref n_bl2_380 n_bl2_381 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer380_ref n_br2_380 n_br2_381 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj380_ref ground ground n_bl2_381 ground n_br2_381 ground vdd_readl ground memorycell
Xwirel381_ref n_bl2_381 n_bl2_382 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer381_ref n_br2_381 n_br2_382 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj381_ref ground ground n_bl2_382 ground n_br2_382 ground vdd_readl ground memorycell
Xwirel382_ref n_bl2_382 n_bl2_383 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer382_ref n_br2_382 n_br2_383 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj382_ref ground ground n_bl2_383 ground n_br2_383 ground vdd_readl ground memorycell
Xwirel383_ref n_bl2_383 n_bl2_384 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer383_ref n_br2_383 n_br2_384 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj383_ref ground ground n_bl2_384 ground n_br2_384 ground vdd_readl ground memorycell
Xwirel384_ref n_bl2_384 n_bl2_385 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer384_ref n_br2_384 n_br2_385 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj384_ref ground ground n_bl2_385 ground n_br2_385 ground vdd_readl ground memorycell
Xwirel385_ref n_bl2_385 n_bl2_386 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer385_ref n_br2_385 n_br2_386 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj385_ref ground ground n_bl2_386 ground n_br2_386 ground vdd_readl ground memorycell
Xwirel386_ref n_bl2_386 n_bl2_387 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer386_ref n_br2_386 n_br2_387 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj386_ref ground ground n_bl2_387 ground n_br2_387 ground vdd_readl ground memorycell
Xwirel387_ref n_bl2_387 n_bl2_388 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer387_ref n_br2_387 n_br2_388 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj387_ref ground ground n_bl2_388 ground n_br2_388 ground vdd_readl ground memorycell
Xwirel388_ref n_bl2_388 n_bl2_389 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer388_ref n_br2_388 n_br2_389 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj388_ref ground ground n_bl2_389 ground n_br2_389 ground vdd_readl ground memorycell
Xwirel389_ref n_bl2_389 n_bl2_390 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer389_ref n_br2_389 n_br2_390 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj389_ref ground ground n_bl2_390 ground n_br2_390 ground vdd_readl ground memorycell
Xwirel390_ref n_bl2_390 n_bl2_391 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer390_ref n_br2_390 n_br2_391 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj390_ref ground ground n_bl2_391 ground n_br2_391 ground vdd_readl ground memorycell
Xwirel391_ref n_bl2_391 n_bl2_392 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer391_ref n_br2_391 n_br2_392 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj391_ref ground ground n_bl2_392 ground n_br2_392 ground vdd_readl ground memorycell
Xwirel392_ref n_bl2_392 n_bl2_393 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer392_ref n_br2_392 n_br2_393 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj392_ref ground ground n_bl2_393 ground n_br2_393 ground vdd_readl ground memorycell
Xwirel393_ref n_bl2_393 n_bl2_394 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer393_ref n_br2_393 n_br2_394 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj393_ref ground ground n_bl2_394 ground n_br2_394 ground vdd_readl ground memorycell
Xwirel394_ref n_bl2_394 n_bl2_395 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer394_ref n_br2_394 n_br2_395 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj394_ref ground ground n_bl2_395 ground n_br2_395 ground vdd_readl ground memorycell
Xwirel395_ref n_bl2_395 n_bl2_396 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer395_ref n_br2_395 n_br2_396 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj395_ref ground ground n_bl2_396 ground n_br2_396 ground vdd_readl ground memorycell
Xwirel396_ref n_bl2_396 n_bl2_397 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer396_ref n_br2_396 n_br2_397 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj396_ref ground ground n_bl2_397 ground n_br2_397 ground vdd_readl ground memorycell
Xwirel397_ref n_bl2_397 n_bl2_398 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer397_ref n_br2_397 n_br2_398 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj397_ref ground ground n_bl2_398 ground n_br2_398 ground vdd_readl ground memorycell
Xwirel398_ref n_bl2_398 n_bl2_399 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer398_ref n_br2_398 n_br2_399 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj398_ref ground ground n_bl2_399 ground n_br2_399 ground vdd_readl ground memorycell
Xwirel399_ref n_bl2_399 n_bl2_400 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer399_ref n_br2_399 n_br2_400 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj399_ref ground ground n_bl2_400 ground n_br2_400 ground vdd_readl ground memorycell
Xwirel400_ref n_bl2_400 n_bl2_401 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer400_ref n_br2_400 n_br2_401 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj400_ref ground ground n_bl2_401 ground n_br2_401 ground vdd_readl ground memorycell
Xwirel401_ref n_bl2_401 n_bl2_402 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer401_ref n_br2_401 n_br2_402 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj401_ref ground ground n_bl2_402 ground n_br2_402 ground vdd_readl ground memorycell
Xwirel402_ref n_bl2_402 n_bl2_403 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer402_ref n_br2_402 n_br2_403 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj402_ref ground ground n_bl2_403 ground n_br2_403 ground vdd_readl ground memorycell
Xwirel403_ref n_bl2_403 n_bl2_404 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer403_ref n_br2_403 n_br2_404 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj403_ref ground ground n_bl2_404 ground n_br2_404 ground vdd_readl ground memorycell
Xwirel404_ref n_bl2_404 n_bl2_405 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer404_ref n_br2_404 n_br2_405 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj404_ref ground ground n_bl2_405 ground n_br2_405 ground vdd_readl ground memorycell
Xwirel405_ref n_bl2_405 n_bl2_406 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer405_ref n_br2_405 n_br2_406 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj405_ref ground ground n_bl2_406 ground n_br2_406 ground vdd_readl ground memorycell
Xwirel406_ref n_bl2_406 n_bl2_407 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer406_ref n_br2_406 n_br2_407 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj406_ref ground ground n_bl2_407 ground n_br2_407 ground vdd_readl ground memorycell
Xwirel407_ref n_bl2_407 n_bl2_408 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer407_ref n_br2_407 n_br2_408 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj407_ref ground ground n_bl2_408 ground n_br2_408 ground vdd_readl ground memorycell
Xwirel408_ref n_bl2_408 n_bl2_409 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer408_ref n_br2_408 n_br2_409 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj408_ref ground ground n_bl2_409 ground n_br2_409 ground vdd_readl ground memorycell
Xwirel409_ref n_bl2_409 n_bl2_410 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer409_ref n_br2_409 n_br2_410 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj409_ref ground ground n_bl2_410 ground n_br2_410 ground vdd_readl ground memorycell
Xwirel410_ref n_bl2_410 n_bl2_411 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer410_ref n_br2_410 n_br2_411 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj410_ref ground ground n_bl2_411 ground n_br2_411 ground vdd_readl ground memorycell
Xwirel411_ref n_bl2_411 n_bl2_412 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer411_ref n_br2_411 n_br2_412 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj411_ref ground ground n_bl2_412 ground n_br2_412 ground vdd_readl ground memorycell
Xwirel412_ref n_bl2_412 n_bl2_413 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer412_ref n_br2_412 n_br2_413 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj412_ref ground ground n_bl2_413 ground n_br2_413 ground vdd_readl ground memorycell
Xwirel413_ref n_bl2_413 n_bl2_414 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer413_ref n_br2_413 n_br2_414 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj413_ref ground ground n_bl2_414 ground n_br2_414 ground vdd_readl ground memorycell
Xwirel414_ref n_bl2_414 n_bl2_415 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer414_ref n_br2_414 n_br2_415 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj414_ref ground ground n_bl2_415 ground n_br2_415 ground vdd_readl ground memorycell
Xwirel415_ref n_bl2_415 n_bl2_416 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer415_ref n_br2_415 n_br2_416 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj415_ref ground ground n_bl2_416 ground n_br2_416 ground vdd_readl ground memorycell
Xwirel416_ref n_bl2_416 n_bl2_417 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer416_ref n_br2_416 n_br2_417 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj416_ref ground ground n_bl2_417 ground n_br2_417 ground vdd_readl ground memorycell
Xwirel417_ref n_bl2_417 n_bl2_418 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer417_ref n_br2_417 n_br2_418 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj417_ref ground ground n_bl2_418 ground n_br2_418 ground vdd_readl ground memorycell
Xwirel418_ref n_bl2_418 n_bl2_419 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer418_ref n_br2_418 n_br2_419 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj418_ref ground ground n_bl2_419 ground n_br2_419 ground vdd_readl ground memorycell
Xwirel419_ref n_bl2_419 n_bl2_420 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer419_ref n_br2_419 n_br2_420 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj419_ref ground ground n_bl2_420 ground n_br2_420 ground vdd_readl ground memorycell
Xwirel420_ref n_bl2_420 n_bl2_421 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer420_ref n_br2_420 n_br2_421 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj420_ref ground ground n_bl2_421 ground n_br2_421 ground vdd_readl ground memorycell
Xwirel421_ref n_bl2_421 n_bl2_422 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer421_ref n_br2_421 n_br2_422 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj421_ref ground ground n_bl2_422 ground n_br2_422 ground vdd_readl ground memorycell
Xwirel422_ref n_bl2_422 n_bl2_423 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer422_ref n_br2_422 n_br2_423 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj422_ref ground ground n_bl2_423 ground n_br2_423 ground vdd_readl ground memorycell
Xwirel423_ref n_bl2_423 n_bl2_424 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer423_ref n_br2_423 n_br2_424 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj423_ref ground ground n_bl2_424 ground n_br2_424 ground vdd_readl ground memorycell
Xwirel424_ref n_bl2_424 n_bl2_425 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer424_ref n_br2_424 n_br2_425 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj424_ref ground ground n_bl2_425 ground n_br2_425 ground vdd_readl ground memorycell
Xwirel425_ref n_bl2_425 n_bl2_426 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer425_ref n_br2_425 n_br2_426 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj425_ref ground ground n_bl2_426 ground n_br2_426 ground vdd_readl ground memorycell
Xwirel426_ref n_bl2_426 n_bl2_427 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer426_ref n_br2_426 n_br2_427 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj426_ref ground ground n_bl2_427 ground n_br2_427 ground vdd_readl ground memorycell
Xwirel427_ref n_bl2_427 n_bl2_428 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer427_ref n_br2_427 n_br2_428 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj427_ref ground ground n_bl2_428 ground n_br2_428 ground vdd_readl ground memorycell
Xwirel428_ref n_bl2_428 n_bl2_429 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer428_ref n_br2_428 n_br2_429 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj428_ref ground ground n_bl2_429 ground n_br2_429 ground vdd_readl ground memorycell
Xwirel429_ref n_bl2_429 n_bl2_430 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer429_ref n_br2_429 n_br2_430 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj429_ref ground ground n_bl2_430 ground n_br2_430 ground vdd_readl ground memorycell
Xwirel430_ref n_bl2_430 n_bl2_431 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer430_ref n_br2_430 n_br2_431 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj430_ref ground ground n_bl2_431 ground n_br2_431 ground vdd_readl ground memorycell
Xwirel431_ref n_bl2_431 n_bl2_432 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer431_ref n_br2_431 n_br2_432 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj431_ref ground ground n_bl2_432 ground n_br2_432 ground vdd_readl ground memorycell
Xwirel432_ref n_bl2_432 n_bl2_433 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer432_ref n_br2_432 n_br2_433 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj432_ref ground ground n_bl2_433 ground n_br2_433 ground vdd_readl ground memorycell
Xwirel433_ref n_bl2_433 n_bl2_434 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer433_ref n_br2_433 n_br2_434 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj433_ref ground ground n_bl2_434 ground n_br2_434 ground vdd_readl ground memorycell
Xwirel434_ref n_bl2_434 n_bl2_435 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer434_ref n_br2_434 n_br2_435 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj434_ref ground ground n_bl2_435 ground n_br2_435 ground vdd_readl ground memorycell
Xwirel435_ref n_bl2_435 n_bl2_436 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer435_ref n_br2_435 n_br2_436 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj435_ref ground ground n_bl2_436 ground n_br2_436 ground vdd_readl ground memorycell
Xwirel436_ref n_bl2_436 n_bl2_437 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer436_ref n_br2_436 n_br2_437 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj436_ref ground ground n_bl2_437 ground n_br2_437 ground vdd_readl ground memorycell
Xwirel437_ref n_bl2_437 n_bl2_438 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer437_ref n_br2_437 n_br2_438 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj437_ref ground ground n_bl2_438 ground n_br2_438 ground vdd_readl ground memorycell
Xwirel438_ref n_bl2_438 n_bl2_439 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer438_ref n_br2_438 n_br2_439 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj438_ref ground ground n_bl2_439 ground n_br2_439 ground vdd_readl ground memorycell
Xwirel439_ref n_bl2_439 n_bl2_440 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer439_ref n_br2_439 n_br2_440 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj439_ref ground ground n_bl2_440 ground n_br2_440 ground vdd_readl ground memorycell
Xwirel440_ref n_bl2_440 n_bl2_441 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer440_ref n_br2_440 n_br2_441 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj440_ref ground ground n_bl2_441 ground n_br2_441 ground vdd_readl ground memorycell
Xwirel441_ref n_bl2_441 n_bl2_442 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer441_ref n_br2_441 n_br2_442 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj441_ref ground ground n_bl2_442 ground n_br2_442 ground vdd_readl ground memorycell
Xwirel442_ref n_bl2_442 n_bl2_443 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer442_ref n_br2_442 n_br2_443 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj442_ref ground ground n_bl2_443 ground n_br2_443 ground vdd_readl ground memorycell
Xwirel443_ref n_bl2_443 n_bl2_444 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer443_ref n_br2_443 n_br2_444 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj443_ref ground ground n_bl2_444 ground n_br2_444 ground vdd_readl ground memorycell
Xwirel444_ref n_bl2_444 n_bl2_445 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer444_ref n_br2_444 n_br2_445 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj444_ref ground ground n_bl2_445 ground n_br2_445 ground vdd_readl ground memorycell
Xwirel445_ref n_bl2_445 n_bl2_446 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer445_ref n_br2_445 n_br2_446 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj445_ref ground ground n_bl2_446 ground n_br2_446 ground vdd_readl ground memorycell
Xwirel446_ref n_bl2_446 n_bl2_447 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer446_ref n_br2_446 n_br2_447 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj446_ref ground ground n_bl2_447 ground n_br2_447 ground vdd_readl ground memorycell
Xwirel447_ref n_bl2_447 n_bl2_448 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer447_ref n_br2_447 n_br2_448 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj447_ref ground ground n_bl2_448 ground n_br2_448 ground vdd_readl ground memorycell
Xwirel448_ref n_bl2_448 n_bl2_449 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer448_ref n_br2_448 n_br2_449 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj448_ref ground ground n_bl2_449 ground n_br2_449 ground vdd_readl ground memorycell
Xwirel449_ref n_bl2_449 n_bl2_450 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer449_ref n_br2_449 n_br2_450 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj449_ref ground ground n_bl2_450 ground n_br2_450 ground vdd_readl ground memorycell
Xwirel450_ref n_bl2_450 n_bl2_451 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer450_ref n_br2_450 n_br2_451 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj450_ref ground ground n_bl2_451 ground n_br2_451 ground vdd_readl ground memorycell
Xwirel451_ref n_bl2_451 n_bl2_452 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer451_ref n_br2_451 n_br2_452 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj451_ref ground ground n_bl2_452 ground n_br2_452 ground vdd_readl ground memorycell
Xwirel452_ref n_bl2_452 n_bl2_453 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer452_ref n_br2_452 n_br2_453 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj452_ref ground ground n_bl2_453 ground n_br2_453 ground vdd_readl ground memorycell
Xwirel453_ref n_bl2_453 n_bl2_454 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer453_ref n_br2_453 n_br2_454 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj453_ref ground ground n_bl2_454 ground n_br2_454 ground vdd_readl ground memorycell
Xwirel454_ref n_bl2_454 n_bl2_455 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer454_ref n_br2_454 n_br2_455 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj454_ref ground ground n_bl2_455 ground n_br2_455 ground vdd_readl ground memorycell
Xwirel455_ref n_bl2_455 n_bl2_456 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer455_ref n_br2_455 n_br2_456 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj455_ref ground ground n_bl2_456 ground n_br2_456 ground vdd_readl ground memorycell
Xwirel456_ref n_bl2_456 n_bl2_457 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer456_ref n_br2_456 n_br2_457 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj456_ref ground ground n_bl2_457 ground n_br2_457 ground vdd_readl ground memorycell
Xwirel457_ref n_bl2_457 n_bl2_458 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer457_ref n_br2_457 n_br2_458 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj457_ref ground ground n_bl2_458 ground n_br2_458 ground vdd_readl ground memorycell
Xwirel458_ref n_bl2_458 n_bl2_459 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer458_ref n_br2_458 n_br2_459 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj458_ref ground ground n_bl2_459 ground n_br2_459 ground vdd_readl ground memorycell
Xwirel459_ref n_bl2_459 n_bl2_460 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer459_ref n_br2_459 n_br2_460 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj459_ref ground ground n_bl2_460 ground n_br2_460 ground vdd_readl ground memorycell
Xwirel460_ref n_bl2_460 n_bl2_461 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer460_ref n_br2_460 n_br2_461 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj460_ref ground ground n_bl2_461 ground n_br2_461 ground vdd_readl ground memorycell
Xwirel461_ref n_bl2_461 n_bl2_462 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer461_ref n_br2_461 n_br2_462 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj461_ref ground ground n_bl2_462 ground n_br2_462 ground vdd_readl ground memorycell
Xwirel462_ref n_bl2_462 n_bl2_463 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer462_ref n_br2_462 n_br2_463 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj462_ref ground ground n_bl2_463 ground n_br2_463 ground vdd_readl ground memorycell
Xwirel463_ref n_bl2_463 n_bl2_464 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer463_ref n_br2_463 n_br2_464 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj463_ref ground ground n_bl2_464 ground n_br2_464 ground vdd_readl ground memorycell
Xwirel464_ref n_bl2_464 n_bl2_465 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer464_ref n_br2_464 n_br2_465 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj464_ref ground ground n_bl2_465 ground n_br2_465 ground vdd_readl ground memorycell
Xwirel465_ref n_bl2_465 n_bl2_466 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer465_ref n_br2_465 n_br2_466 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj465_ref ground ground n_bl2_466 ground n_br2_466 ground vdd_readl ground memorycell
Xwirel466_ref n_bl2_466 n_bl2_467 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer466_ref n_br2_466 n_br2_467 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj466_ref ground ground n_bl2_467 ground n_br2_467 ground vdd_readl ground memorycell
Xwirel467_ref n_bl2_467 n_bl2_468 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer467_ref n_br2_467 n_br2_468 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj467_ref ground ground n_bl2_468 ground n_br2_468 ground vdd_readl ground memorycell
Xwirel468_ref n_bl2_468 n_bl2_469 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer468_ref n_br2_468 n_br2_469 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj468_ref ground ground n_bl2_469 ground n_br2_469 ground vdd_readl ground memorycell
Xwirel469_ref n_bl2_469 n_bl2_470 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer469_ref n_br2_469 n_br2_470 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj469_ref ground ground n_bl2_470 ground n_br2_470 ground vdd_readl ground memorycell
Xwirel470_ref n_bl2_470 n_bl2_471 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer470_ref n_br2_470 n_br2_471 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj470_ref ground ground n_bl2_471 ground n_br2_471 ground vdd_readl ground memorycell
Xwirel471_ref n_bl2_471 n_bl2_472 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer471_ref n_br2_471 n_br2_472 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj471_ref ground ground n_bl2_472 ground n_br2_472 ground vdd_readl ground memorycell
Xwirel472_ref n_bl2_472 n_bl2_473 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer472_ref n_br2_472 n_br2_473 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj472_ref ground ground n_bl2_473 ground n_br2_473 ground vdd_readl ground memorycell
Xwirel473_ref n_bl2_473 n_bl2_474 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer473_ref n_br2_473 n_br2_474 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj473_ref ground ground n_bl2_474 ground n_br2_474 ground vdd_readl ground memorycell
Xwirel474_ref n_bl2_474 n_bl2_475 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer474_ref n_br2_474 n_br2_475 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj474_ref ground ground n_bl2_475 ground n_br2_475 ground vdd_readl ground memorycell
Xwirel475_ref n_bl2_475 n_bl2_476 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer475_ref n_br2_475 n_br2_476 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj475_ref ground ground n_bl2_476 ground n_br2_476 ground vdd_readl ground memorycell
Xwirel476_ref n_bl2_476 n_bl2_477 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer476_ref n_br2_476 n_br2_477 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj476_ref ground ground n_bl2_477 ground n_br2_477 ground vdd_readl ground memorycell
Xwirel477_ref n_bl2_477 n_bl2_478 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer477_ref n_br2_477 n_br2_478 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj477_ref ground ground n_bl2_478 ground n_br2_478 ground vdd_readl ground memorycell
Xwirel478_ref n_bl2_478 n_bl2_479 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer478_ref n_br2_478 n_br2_479 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj478_ref ground ground n_bl2_479 ground n_br2_479 ground vdd_readl ground memorycell
Xwirel479_ref n_bl2_479 n_bl2_480 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer479_ref n_br2_479 n_br2_480 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj479_ref ground ground n_bl2_480 ground n_br2_480 ground vdd_readl ground memorycell
Xwirel480_ref n_bl2_480 n_bl2_481 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer480_ref n_br2_480 n_br2_481 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj480_ref ground ground n_bl2_481 ground n_br2_481 ground vdd_readl ground memorycell
Xwirel481_ref n_bl2_481 n_bl2_482 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer481_ref n_br2_481 n_br2_482 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj481_ref ground ground n_bl2_482 ground n_br2_482 ground vdd_readl ground memorycell
Xwirel482_ref n_bl2_482 n_bl2_483 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer482_ref n_br2_482 n_br2_483 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj482_ref ground ground n_bl2_483 ground n_br2_483 ground vdd_readl ground memorycell
Xwirel483_ref n_bl2_483 n_bl2_484 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer483_ref n_br2_483 n_br2_484 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj483_ref ground ground n_bl2_484 ground n_br2_484 ground vdd_readl ground memorycell
Xwirel484_ref n_bl2_484 n_bl2_485 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer484_ref n_br2_484 n_br2_485 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj484_ref ground ground n_bl2_485 ground n_br2_485 ground vdd_readl ground memorycell
Xwirel485_ref n_bl2_485 n_bl2_486 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer485_ref n_br2_485 n_br2_486 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj485_ref ground ground n_bl2_486 ground n_br2_486 ground vdd_readl ground memorycell
Xwirel486_ref n_bl2_486 n_bl2_487 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer486_ref n_br2_486 n_br2_487 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj486_ref ground ground n_bl2_487 ground n_br2_487 ground vdd_readl ground memorycell
Xwirel487_ref n_bl2_487 n_bl2_488 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer487_ref n_br2_487 n_br2_488 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj487_ref ground ground n_bl2_488 ground n_br2_488 ground vdd_readl ground memorycell
Xwirel488_ref n_bl2_488 n_bl2_489 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer488_ref n_br2_488 n_br2_489 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj488_ref ground ground n_bl2_489 ground n_br2_489 ground vdd_readl ground memorycell
Xwirel489_ref n_bl2_489 n_bl2_490 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer489_ref n_br2_489 n_br2_490 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj489_ref ground ground n_bl2_490 ground n_br2_490 ground vdd_readl ground memorycell
Xwirel490_ref n_bl2_490 n_bl2_491 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer490_ref n_br2_490 n_br2_491 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj490_ref ground ground n_bl2_491 ground n_br2_491 ground vdd_readl ground memorycell
Xwirel491_ref n_bl2_491 n_bl2_492 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer491_ref n_br2_491 n_br2_492 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj491_ref ground ground n_bl2_492 ground n_br2_492 ground vdd_readl ground memorycell
Xwirel492_ref n_bl2_492 n_bl2_493 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer492_ref n_br2_492 n_br2_493 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj492_ref ground ground n_bl2_493 ground n_br2_493 ground vdd_readl ground memorycell
Xwirel493_ref n_bl2_493 n_bl2_494 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer493_ref n_br2_493 n_br2_494 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj493_ref ground ground n_bl2_494 ground n_br2_494 ground vdd_readl ground memorycell
Xwirel494_ref n_bl2_494 n_bl2_495 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer494_ref n_br2_494 n_br2_495 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj494_ref ground ground n_bl2_495 ground n_br2_495 ground vdd_readl ground memorycell
Xwirel495_ref n_bl2_495 n_bl2_496 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer495_ref n_br2_495 n_br2_496 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj495_ref ground ground n_bl2_496 ground n_br2_496 ground vdd_readl ground memorycell
Xwirel496_ref n_bl2_496 n_bl2_497 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer496_ref n_br2_496 n_br2_497 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj496_ref ground ground n_bl2_497 ground n_br2_497 ground vdd_readl ground memorycell
Xwirel497_ref n_bl2_497 n_bl2_498 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer497_ref n_br2_497 n_br2_498 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj497_ref ground ground n_bl2_498 ground n_br2_498 ground vdd_readl ground memorycell
Xwirel498_ref n_bl2_498 n_bl2_499 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer498_ref n_br2_498 n_br2_499 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj498_ref ground ground n_bl2_499 ground n_br2_499 ground vdd_readl ground memorycell
Xwirel499_ref n_bl2_499 n_bl2_500 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer499_ref n_br2_499 n_br2_500 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj499_ref ground ground n_bl2_500 ground n_br2_500 ground vdd_readl ground memorycell
Xwirel500_ref n_bl2_500 n_bl2_501 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer500_ref n_br2_500 n_br2_501 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj500_ref ground ground n_bl2_501 ground n_br2_501 ground vdd_readl ground memorycell
Xwirel501_ref n_bl2_501 n_bl2_502 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer501_ref n_br2_501 n_br2_502 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj501_ref ground ground n_bl2_502 ground n_br2_502 ground vdd_readl ground memorycell
Xwirel502_ref n_bl2_502 n_bl2_503 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer502_ref n_br2_502 n_br2_503 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj502_ref ground ground n_bl2_503 ground n_br2_503 ground vdd_readl ground memorycell
Xwirel503_ref n_bl2_503 n_bl2_504 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer503_ref n_br2_503 n_br2_504 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj503_ref ground ground n_bl2_504 ground n_br2_504 ground vdd_readl ground memorycell
Xwirel504_ref n_bl2_504 n_bl2_505 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer504_ref n_br2_504 n_br2_505 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj504_ref ground ground n_bl2_505 ground n_br2_505 ground vdd_readl ground memorycell
Xwirel505_ref n_bl2_505 n_bl2_506 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer505_ref n_br2_505 n_br2_506 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj505_ref ground ground n_bl2_506 ground n_br2_506 ground vdd_readl ground memorycell
Xwirel506_ref n_bl2_506 n_bl2_507 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer506_ref n_br2_506 n_br2_507 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj506_ref ground ground n_bl2_507 ground n_br2_507 ground vdd_readl ground memorycell
Xwirel507_ref n_bl2_507 n_bl2_508 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer507_ref n_br2_507 n_br2_508 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj507_ref ground ground n_bl2_508 ground n_br2_508 ground vdd_readl ground memorycell
Xwirel508_ref n_bl2_508 n_bl2_509 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer508_ref n_br2_508 n_br2_509 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj508_ref ground ground n_bl2_509 ground n_br2_509 ground vdd_readl ground memorycell
Xwirel509_ref n_bl2_509 n_bl2_510 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer509_ref n_br2_509 n_br2_510 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj509_ref ground ground n_bl2_510 ground n_br2_510 ground vdd_readl ground memorycell
Xwirel510_ref n_bl2_510 n_bl2_511 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer510_ref n_br2_510 n_br2_511 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj510_ref ground ground n_bl2_511 ground n_br2_511 ground vdd_readl ground memorycell
Xwirel511_ref n_bl2_511 n_bl2_512 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer511_ref n_br2_511 n_br2_512 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj511_ref ground ground n_bl2_512 ground n_br2_512 ground vdd_readl ground memorycell
Xwirel0_ref n_bl2_0 n_bl2_1 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xwirer0_ref n_br2_0 n_br2_1 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
Xmtj0_ref n_precharge ground n_bl2_1 ground n_br2_1 ground vdd_readl ground memorycell
.IC V(n_bl_0) = 0 
.IC V(n_br_0) = 0 
.IC V(Xprechargesa.n_1_5) = 0 
.IC V(Xprechargesa.n_1_6) = 0 
.IC V(Xprechargesa.n_1_1) = 0.95 
.IC V(Xprechargesa.n_1_2) = 0.95 
X2prechargesa n2_1_1 n2_2_1 n_se1 n_se2 n2_hang_out vclmpmtj vrefmtj ground vdd_lp vdd_readh ground mtj_subcircuits_sa
X2writedriver ground ground n2_1_1 ground vdd_lp ground mtj_subcircuits_writedriver
X2writedriver_ref ground ground n2_2_1 ground vdd_lp ground mtj_subcircuits_writedriver
X2cs n2_1_1 n2_bl_0 n_precharge_b n_precharge vdd_lp ground mtj_subcircuits_cs
X2cs_ref n2_2_1 n2_bl2_0 n_precharge_b n_precharge vdd_lp ground mtj_subcircuits_cs
x2precharge_dup n2_hang_low n2_bl_512 n_precharge_b n_precharge vdd_lp ground mtj_subcircuits_cs
x2precharge_dup_ref n2_hang2_low n2_bl2_512 n_precharge_b n_precharge vdd_lp ground mtj_subcircuits_cs
X2wirel0 n2_bl_0 n2_bl_1 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer0 n2_br_0 n2_br_1 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj0 ground ground n2_bl_1 ground n2_br_1 ground vdd_readh ground memorycellh
X2wirel1 n2_bl_1 n2_bl_2 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer1 n2_br_1 n2_br_2 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj1 ground ground n2_bl_2 ground n2_br_2 ground vdd_readh ground memorycellh
X2wirel2 n2_bl_2 n2_bl_3 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer2 n2_br_2 n2_br_3 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj2 ground ground n2_bl_3 ground n2_br_3 ground vdd_readh ground memorycellh
X2wirel3 n2_bl_3 n2_bl_4 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer3 n2_br_3 n2_br_4 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj3 ground ground n2_bl_4 ground n2_br_4 ground vdd_readh ground memorycellh
X2wirel4 n2_bl_4 n2_bl_5 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer4 n2_br_4 n2_br_5 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj4 ground ground n2_bl_5 ground n2_br_5 ground vdd_readh ground memorycellh
X2wirel5 n2_bl_5 n2_bl_6 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer5 n2_br_5 n2_br_6 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj5 ground ground n2_bl_6 ground n2_br_6 ground vdd_readh ground memorycellh
X2wirel6 n2_bl_6 n2_bl_7 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer6 n2_br_6 n2_br_7 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj6 ground ground n2_bl_7 ground n2_br_7 ground vdd_readh ground memorycellh
X2wirel7 n2_bl_7 n2_bl_8 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer7 n2_br_7 n2_br_8 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj7 ground ground n2_bl_8 ground n2_br_8 ground vdd_readh ground memorycellh
X2wirel8 n2_bl_8 n2_bl_9 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer8 n2_br_8 n2_br_9 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj8 ground ground n2_bl_9 ground n2_br_9 ground vdd_readh ground memorycellh
X2wirel9 n2_bl_9 n2_bl_10 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer9 n2_br_9 n2_br_10 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj9 ground ground n2_bl_10 ground n2_br_10 ground vdd_readh ground memorycellh
X2wirel10 n2_bl_10 n2_bl_11 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer10 n2_br_10 n2_br_11 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj10 ground ground n2_bl_11 ground n2_br_11 ground vdd_readh ground memorycellh
X2wirel11 n2_bl_11 n2_bl_12 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer11 n2_br_11 n2_br_12 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj11 ground ground n2_bl_12 ground n2_br_12 ground vdd_readh ground memorycellh
X2wirel12 n2_bl_12 n2_bl_13 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer12 n2_br_12 n2_br_13 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj12 ground ground n2_bl_13 ground n2_br_13 ground vdd_readh ground memorycellh
X2wirel13 n2_bl_13 n2_bl_14 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer13 n2_br_13 n2_br_14 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj13 ground ground n2_bl_14 ground n2_br_14 ground vdd_readh ground memorycellh
X2wirel14 n2_bl_14 n2_bl_15 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer14 n2_br_14 n2_br_15 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj14 ground ground n2_bl_15 ground n2_br_15 ground vdd_readh ground memorycellh
X2wirel15 n2_bl_15 n2_bl_16 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer15 n2_br_15 n2_br_16 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj15 ground ground n2_bl_16 ground n2_br_16 ground vdd_readh ground memorycellh
X2wirel16 n2_bl_16 n2_bl_17 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer16 n2_br_16 n2_br_17 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj16 ground ground n2_bl_17 ground n2_br_17 ground vdd_readh ground memorycellh
X2wirel17 n2_bl_17 n2_bl_18 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer17 n2_br_17 n2_br_18 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj17 ground ground n2_bl_18 ground n2_br_18 ground vdd_readh ground memorycellh
X2wirel18 n2_bl_18 n2_bl_19 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer18 n2_br_18 n2_br_19 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj18 ground ground n2_bl_19 ground n2_br_19 ground vdd_readh ground memorycellh
X2wirel19 n2_bl_19 n2_bl_20 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer19 n2_br_19 n2_br_20 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj19 ground ground n2_bl_20 ground n2_br_20 ground vdd_readh ground memorycellh
X2wirel20 n2_bl_20 n2_bl_21 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer20 n2_br_20 n2_br_21 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj20 ground ground n2_bl_21 ground n2_br_21 ground vdd_readh ground memorycellh
X2wirel21 n2_bl_21 n2_bl_22 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer21 n2_br_21 n2_br_22 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj21 ground ground n2_bl_22 ground n2_br_22 ground vdd_readh ground memorycellh
X2wirel22 n2_bl_22 n2_bl_23 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer22 n2_br_22 n2_br_23 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj22 ground ground n2_bl_23 ground n2_br_23 ground vdd_readh ground memorycellh
X2wirel23 n2_bl_23 n2_bl_24 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer23 n2_br_23 n2_br_24 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj23 ground ground n2_bl_24 ground n2_br_24 ground vdd_readh ground memorycellh
X2wirel24 n2_bl_24 n2_bl_25 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer24 n2_br_24 n2_br_25 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj24 ground ground n2_bl_25 ground n2_br_25 ground vdd_readh ground memorycellh
X2wirel25 n2_bl_25 n2_bl_26 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer25 n2_br_25 n2_br_26 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj25 ground ground n2_bl_26 ground n2_br_26 ground vdd_readh ground memorycellh
X2wirel26 n2_bl_26 n2_bl_27 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer26 n2_br_26 n2_br_27 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj26 ground ground n2_bl_27 ground n2_br_27 ground vdd_readh ground memorycellh
X2wirel27 n2_bl_27 n2_bl_28 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer27 n2_br_27 n2_br_28 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj27 ground ground n2_bl_28 ground n2_br_28 ground vdd_readh ground memorycellh
X2wirel28 n2_bl_28 n2_bl_29 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer28 n2_br_28 n2_br_29 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj28 ground ground n2_bl_29 ground n2_br_29 ground vdd_readh ground memorycellh
X2wirel29 n2_bl_29 n2_bl_30 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer29 n2_br_29 n2_br_30 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj29 ground ground n2_bl_30 ground n2_br_30 ground vdd_readh ground memorycellh
X2wirel30 n2_bl_30 n2_bl_31 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer30 n2_br_30 n2_br_31 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj30 ground ground n2_bl_31 ground n2_br_31 ground vdd_readh ground memorycellh
X2wirel31 n2_bl_31 n2_bl_32 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer31 n2_br_31 n2_br_32 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj31 ground ground n2_bl_32 ground n2_br_32 ground vdd_readh ground memorycellh
X2wirel32 n2_bl_32 n2_bl_33 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer32 n2_br_32 n2_br_33 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj32 ground ground n2_bl_33 ground n2_br_33 ground vdd_readh ground memorycellh
X2wirel33 n2_bl_33 n2_bl_34 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer33 n2_br_33 n2_br_34 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj33 ground ground n2_bl_34 ground n2_br_34 ground vdd_readh ground memorycellh
X2wirel34 n2_bl_34 n2_bl_35 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer34 n2_br_34 n2_br_35 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj34 ground ground n2_bl_35 ground n2_br_35 ground vdd_readh ground memorycellh
X2wirel35 n2_bl_35 n2_bl_36 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer35 n2_br_35 n2_br_36 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj35 ground ground n2_bl_36 ground n2_br_36 ground vdd_readh ground memorycellh
X2wirel36 n2_bl_36 n2_bl_37 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer36 n2_br_36 n2_br_37 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj36 ground ground n2_bl_37 ground n2_br_37 ground vdd_readh ground memorycellh
X2wirel37 n2_bl_37 n2_bl_38 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer37 n2_br_37 n2_br_38 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj37 ground ground n2_bl_38 ground n2_br_38 ground vdd_readh ground memorycellh
X2wirel38 n2_bl_38 n2_bl_39 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer38 n2_br_38 n2_br_39 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj38 ground ground n2_bl_39 ground n2_br_39 ground vdd_readh ground memorycellh
X2wirel39 n2_bl_39 n2_bl_40 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer39 n2_br_39 n2_br_40 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj39 ground ground n2_bl_40 ground n2_br_40 ground vdd_readh ground memorycellh
X2wirel40 n2_bl_40 n2_bl_41 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer40 n2_br_40 n2_br_41 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj40 ground ground n2_bl_41 ground n2_br_41 ground vdd_readh ground memorycellh
X2wirel41 n2_bl_41 n2_bl_42 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer41 n2_br_41 n2_br_42 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj41 ground ground n2_bl_42 ground n2_br_42 ground vdd_readh ground memorycellh
X2wirel42 n2_bl_42 n2_bl_43 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer42 n2_br_42 n2_br_43 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj42 ground ground n2_bl_43 ground n2_br_43 ground vdd_readh ground memorycellh
X2wirel43 n2_bl_43 n2_bl_44 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer43 n2_br_43 n2_br_44 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj43 ground ground n2_bl_44 ground n2_br_44 ground vdd_readh ground memorycellh
X2wirel44 n2_bl_44 n2_bl_45 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer44 n2_br_44 n2_br_45 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj44 ground ground n2_bl_45 ground n2_br_45 ground vdd_readh ground memorycellh
X2wirel45 n2_bl_45 n2_bl_46 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer45 n2_br_45 n2_br_46 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj45 ground ground n2_bl_46 ground n2_br_46 ground vdd_readh ground memorycellh
X2wirel46 n2_bl_46 n2_bl_47 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer46 n2_br_46 n2_br_47 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj46 ground ground n2_bl_47 ground n2_br_47 ground vdd_readh ground memorycellh
X2wirel47 n2_bl_47 n2_bl_48 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer47 n2_br_47 n2_br_48 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj47 ground ground n2_bl_48 ground n2_br_48 ground vdd_readh ground memorycellh
X2wirel48 n2_bl_48 n2_bl_49 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer48 n2_br_48 n2_br_49 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj48 ground ground n2_bl_49 ground n2_br_49 ground vdd_readh ground memorycellh
X2wirel49 n2_bl_49 n2_bl_50 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer49 n2_br_49 n2_br_50 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj49 ground ground n2_bl_50 ground n2_br_50 ground vdd_readh ground memorycellh
X2wirel50 n2_bl_50 n2_bl_51 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer50 n2_br_50 n2_br_51 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj50 ground ground n2_bl_51 ground n2_br_51 ground vdd_readh ground memorycellh
X2wirel51 n2_bl_51 n2_bl_52 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer51 n2_br_51 n2_br_52 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj51 ground ground n2_bl_52 ground n2_br_52 ground vdd_readh ground memorycellh
X2wirel52 n2_bl_52 n2_bl_53 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer52 n2_br_52 n2_br_53 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj52 ground ground n2_bl_53 ground n2_br_53 ground vdd_readh ground memorycellh
X2wirel53 n2_bl_53 n2_bl_54 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer53 n2_br_53 n2_br_54 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj53 ground ground n2_bl_54 ground n2_br_54 ground vdd_readh ground memorycellh
X2wirel54 n2_bl_54 n2_bl_55 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer54 n2_br_54 n2_br_55 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj54 ground ground n2_bl_55 ground n2_br_55 ground vdd_readh ground memorycellh
X2wirel55 n2_bl_55 n2_bl_56 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer55 n2_br_55 n2_br_56 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj55 ground ground n2_bl_56 ground n2_br_56 ground vdd_readh ground memorycellh
X2wirel56 n2_bl_56 n2_bl_57 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer56 n2_br_56 n2_br_57 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj56 ground ground n2_bl_57 ground n2_br_57 ground vdd_readh ground memorycellh
X2wirel57 n2_bl_57 n2_bl_58 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer57 n2_br_57 n2_br_58 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj57 ground ground n2_bl_58 ground n2_br_58 ground vdd_readh ground memorycellh
X2wirel58 n2_bl_58 n2_bl_59 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer58 n2_br_58 n2_br_59 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj58 ground ground n2_bl_59 ground n2_br_59 ground vdd_readh ground memorycellh
X2wirel59 n2_bl_59 n2_bl_60 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer59 n2_br_59 n2_br_60 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj59 ground ground n2_bl_60 ground n2_br_60 ground vdd_readh ground memorycellh
X2wirel60 n2_bl_60 n2_bl_61 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer60 n2_br_60 n2_br_61 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj60 ground ground n2_bl_61 ground n2_br_61 ground vdd_readh ground memorycellh
X2wirel61 n2_bl_61 n2_bl_62 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer61 n2_br_61 n2_br_62 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj61 ground ground n2_bl_62 ground n2_br_62 ground vdd_readh ground memorycellh
X2wirel62 n2_bl_62 n2_bl_63 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer62 n2_br_62 n2_br_63 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj62 ground ground n2_bl_63 ground n2_br_63 ground vdd_readh ground memorycellh
X2wirel63 n2_bl_63 n2_bl_64 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer63 n2_br_63 n2_br_64 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj63 ground ground n2_bl_64 ground n2_br_64 ground vdd_readh ground memorycellh
X2wirel64 n2_bl_64 n2_bl_65 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer64 n2_br_64 n2_br_65 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj64 ground ground n2_bl_65 ground n2_br_65 ground vdd_readh ground memorycellh
X2wirel65 n2_bl_65 n2_bl_66 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer65 n2_br_65 n2_br_66 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj65 ground ground n2_bl_66 ground n2_br_66 ground vdd_readh ground memorycellh
X2wirel66 n2_bl_66 n2_bl_67 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer66 n2_br_66 n2_br_67 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj66 ground ground n2_bl_67 ground n2_br_67 ground vdd_readh ground memorycellh
X2wirel67 n2_bl_67 n2_bl_68 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer67 n2_br_67 n2_br_68 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj67 ground ground n2_bl_68 ground n2_br_68 ground vdd_readh ground memorycellh
X2wirel68 n2_bl_68 n2_bl_69 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer68 n2_br_68 n2_br_69 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj68 ground ground n2_bl_69 ground n2_br_69 ground vdd_readh ground memorycellh
X2wirel69 n2_bl_69 n2_bl_70 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer69 n2_br_69 n2_br_70 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj69 ground ground n2_bl_70 ground n2_br_70 ground vdd_readh ground memorycellh
X2wirel70 n2_bl_70 n2_bl_71 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer70 n2_br_70 n2_br_71 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj70 ground ground n2_bl_71 ground n2_br_71 ground vdd_readh ground memorycellh
X2wirel71 n2_bl_71 n2_bl_72 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer71 n2_br_71 n2_br_72 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj71 ground ground n2_bl_72 ground n2_br_72 ground vdd_readh ground memorycellh
X2wirel72 n2_bl_72 n2_bl_73 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer72 n2_br_72 n2_br_73 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj72 ground ground n2_bl_73 ground n2_br_73 ground vdd_readh ground memorycellh
X2wirel73 n2_bl_73 n2_bl_74 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer73 n2_br_73 n2_br_74 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj73 ground ground n2_bl_74 ground n2_br_74 ground vdd_readh ground memorycellh
X2wirel74 n2_bl_74 n2_bl_75 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer74 n2_br_74 n2_br_75 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj74 ground ground n2_bl_75 ground n2_br_75 ground vdd_readh ground memorycellh
X2wirel75 n2_bl_75 n2_bl_76 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer75 n2_br_75 n2_br_76 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj75 ground ground n2_bl_76 ground n2_br_76 ground vdd_readh ground memorycellh
X2wirel76 n2_bl_76 n2_bl_77 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer76 n2_br_76 n2_br_77 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj76 ground ground n2_bl_77 ground n2_br_77 ground vdd_readh ground memorycellh
X2wirel77 n2_bl_77 n2_bl_78 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer77 n2_br_77 n2_br_78 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj77 ground ground n2_bl_78 ground n2_br_78 ground vdd_readh ground memorycellh
X2wirel78 n2_bl_78 n2_bl_79 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer78 n2_br_78 n2_br_79 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj78 ground ground n2_bl_79 ground n2_br_79 ground vdd_readh ground memorycellh
X2wirel79 n2_bl_79 n2_bl_80 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer79 n2_br_79 n2_br_80 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj79 ground ground n2_bl_80 ground n2_br_80 ground vdd_readh ground memorycellh
X2wirel80 n2_bl_80 n2_bl_81 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer80 n2_br_80 n2_br_81 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj80 ground ground n2_bl_81 ground n2_br_81 ground vdd_readh ground memorycellh
X2wirel81 n2_bl_81 n2_bl_82 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer81 n2_br_81 n2_br_82 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj81 ground ground n2_bl_82 ground n2_br_82 ground vdd_readh ground memorycellh
X2wirel82 n2_bl_82 n2_bl_83 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer82 n2_br_82 n2_br_83 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj82 ground ground n2_bl_83 ground n2_br_83 ground vdd_readh ground memorycellh
X2wirel83 n2_bl_83 n2_bl_84 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer83 n2_br_83 n2_br_84 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj83 ground ground n2_bl_84 ground n2_br_84 ground vdd_readh ground memorycellh
X2wirel84 n2_bl_84 n2_bl_85 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer84 n2_br_84 n2_br_85 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj84 ground ground n2_bl_85 ground n2_br_85 ground vdd_readh ground memorycellh
X2wirel85 n2_bl_85 n2_bl_86 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer85 n2_br_85 n2_br_86 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj85 ground ground n2_bl_86 ground n2_br_86 ground vdd_readh ground memorycellh
X2wirel86 n2_bl_86 n2_bl_87 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer86 n2_br_86 n2_br_87 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj86 ground ground n2_bl_87 ground n2_br_87 ground vdd_readh ground memorycellh
X2wirel87 n2_bl_87 n2_bl_88 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer87 n2_br_87 n2_br_88 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj87 ground ground n2_bl_88 ground n2_br_88 ground vdd_readh ground memorycellh
X2wirel88 n2_bl_88 n2_bl_89 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer88 n2_br_88 n2_br_89 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj88 ground ground n2_bl_89 ground n2_br_89 ground vdd_readh ground memorycellh
X2wirel89 n2_bl_89 n2_bl_90 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer89 n2_br_89 n2_br_90 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj89 ground ground n2_bl_90 ground n2_br_90 ground vdd_readh ground memorycellh
X2wirel90 n2_bl_90 n2_bl_91 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer90 n2_br_90 n2_br_91 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj90 ground ground n2_bl_91 ground n2_br_91 ground vdd_readh ground memorycellh
X2wirel91 n2_bl_91 n2_bl_92 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer91 n2_br_91 n2_br_92 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj91 ground ground n2_bl_92 ground n2_br_92 ground vdd_readh ground memorycellh
X2wirel92 n2_bl_92 n2_bl_93 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer92 n2_br_92 n2_br_93 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj92 ground ground n2_bl_93 ground n2_br_93 ground vdd_readh ground memorycellh
X2wirel93 n2_bl_93 n2_bl_94 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer93 n2_br_93 n2_br_94 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj93 ground ground n2_bl_94 ground n2_br_94 ground vdd_readh ground memorycellh
X2wirel94 n2_bl_94 n2_bl_95 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer94 n2_br_94 n2_br_95 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj94 ground ground n2_bl_95 ground n2_br_95 ground vdd_readh ground memorycellh
X2wirel95 n2_bl_95 n2_bl_96 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer95 n2_br_95 n2_br_96 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj95 ground ground n2_bl_96 ground n2_br_96 ground vdd_readh ground memorycellh
X2wirel96 n2_bl_96 n2_bl_97 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer96 n2_br_96 n2_br_97 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj96 ground ground n2_bl_97 ground n2_br_97 ground vdd_readh ground memorycellh
X2wirel97 n2_bl_97 n2_bl_98 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer97 n2_br_97 n2_br_98 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj97 ground ground n2_bl_98 ground n2_br_98 ground vdd_readh ground memorycellh
X2wirel98 n2_bl_98 n2_bl_99 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer98 n2_br_98 n2_br_99 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj98 ground ground n2_bl_99 ground n2_br_99 ground vdd_readh ground memorycellh
X2wirel99 n2_bl_99 n2_bl_100 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer99 n2_br_99 n2_br_100 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj99 ground ground n2_bl_100 ground n2_br_100 ground vdd_readh ground memorycellh
X2wirel100 n2_bl_100 n2_bl_101 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer100 n2_br_100 n2_br_101 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj100 ground ground n2_bl_101 ground n2_br_101 ground vdd_readh ground memorycellh
X2wirel101 n2_bl_101 n2_bl_102 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer101 n2_br_101 n2_br_102 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj101 ground ground n2_bl_102 ground n2_br_102 ground vdd_readh ground memorycellh
X2wirel102 n2_bl_102 n2_bl_103 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer102 n2_br_102 n2_br_103 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj102 ground ground n2_bl_103 ground n2_br_103 ground vdd_readh ground memorycellh
X2wirel103 n2_bl_103 n2_bl_104 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer103 n2_br_103 n2_br_104 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj103 ground ground n2_bl_104 ground n2_br_104 ground vdd_readh ground memorycellh
X2wirel104 n2_bl_104 n2_bl_105 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer104 n2_br_104 n2_br_105 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj104 ground ground n2_bl_105 ground n2_br_105 ground vdd_readh ground memorycellh
X2wirel105 n2_bl_105 n2_bl_106 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer105 n2_br_105 n2_br_106 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj105 ground ground n2_bl_106 ground n2_br_106 ground vdd_readh ground memorycellh
X2wirel106 n2_bl_106 n2_bl_107 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer106 n2_br_106 n2_br_107 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj106 ground ground n2_bl_107 ground n2_br_107 ground vdd_readh ground memorycellh
X2wirel107 n2_bl_107 n2_bl_108 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer107 n2_br_107 n2_br_108 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj107 ground ground n2_bl_108 ground n2_br_108 ground vdd_readh ground memorycellh
X2wirel108 n2_bl_108 n2_bl_109 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer108 n2_br_108 n2_br_109 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj108 ground ground n2_bl_109 ground n2_br_109 ground vdd_readh ground memorycellh
X2wirel109 n2_bl_109 n2_bl_110 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer109 n2_br_109 n2_br_110 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj109 ground ground n2_bl_110 ground n2_br_110 ground vdd_readh ground memorycellh
X2wirel110 n2_bl_110 n2_bl_111 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer110 n2_br_110 n2_br_111 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj110 ground ground n2_bl_111 ground n2_br_111 ground vdd_readh ground memorycellh
X2wirel111 n2_bl_111 n2_bl_112 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer111 n2_br_111 n2_br_112 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj111 ground ground n2_bl_112 ground n2_br_112 ground vdd_readh ground memorycellh
X2wirel112 n2_bl_112 n2_bl_113 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer112 n2_br_112 n2_br_113 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj112 ground ground n2_bl_113 ground n2_br_113 ground vdd_readh ground memorycellh
X2wirel113 n2_bl_113 n2_bl_114 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer113 n2_br_113 n2_br_114 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj113 ground ground n2_bl_114 ground n2_br_114 ground vdd_readh ground memorycellh
X2wirel114 n2_bl_114 n2_bl_115 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer114 n2_br_114 n2_br_115 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj114 ground ground n2_bl_115 ground n2_br_115 ground vdd_readh ground memorycellh
X2wirel115 n2_bl_115 n2_bl_116 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer115 n2_br_115 n2_br_116 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj115 ground ground n2_bl_116 ground n2_br_116 ground vdd_readh ground memorycellh
X2wirel116 n2_bl_116 n2_bl_117 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer116 n2_br_116 n2_br_117 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj116 ground ground n2_bl_117 ground n2_br_117 ground vdd_readh ground memorycellh
X2wirel117 n2_bl_117 n2_bl_118 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer117 n2_br_117 n2_br_118 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj117 ground ground n2_bl_118 ground n2_br_118 ground vdd_readh ground memorycellh
X2wirel118 n2_bl_118 n2_bl_119 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer118 n2_br_118 n2_br_119 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj118 ground ground n2_bl_119 ground n2_br_119 ground vdd_readh ground memorycellh
X2wirel119 n2_bl_119 n2_bl_120 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer119 n2_br_119 n2_br_120 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj119 ground ground n2_bl_120 ground n2_br_120 ground vdd_readh ground memorycellh
X2wirel120 n2_bl_120 n2_bl_121 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer120 n2_br_120 n2_br_121 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj120 ground ground n2_bl_121 ground n2_br_121 ground vdd_readh ground memorycellh
X2wirel121 n2_bl_121 n2_bl_122 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer121 n2_br_121 n2_br_122 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj121 ground ground n2_bl_122 ground n2_br_122 ground vdd_readh ground memorycellh
X2wirel122 n2_bl_122 n2_bl_123 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer122 n2_br_122 n2_br_123 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj122 ground ground n2_bl_123 ground n2_br_123 ground vdd_readh ground memorycellh
X2wirel123 n2_bl_123 n2_bl_124 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer123 n2_br_123 n2_br_124 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj123 ground ground n2_bl_124 ground n2_br_124 ground vdd_readh ground memorycellh
X2wirel124 n2_bl_124 n2_bl_125 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer124 n2_br_124 n2_br_125 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj124 ground ground n2_bl_125 ground n2_br_125 ground vdd_readh ground memorycellh
X2wirel125 n2_bl_125 n2_bl_126 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer125 n2_br_125 n2_br_126 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj125 ground ground n2_bl_126 ground n2_br_126 ground vdd_readh ground memorycellh
X2wirel126 n2_bl_126 n2_bl_127 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer126 n2_br_126 n2_br_127 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj126 ground ground n2_bl_127 ground n2_br_127 ground vdd_readh ground memorycellh
X2wirel127 n2_bl_127 n2_bl_128 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer127 n2_br_127 n2_br_128 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj127 ground ground n2_bl_128 ground n2_br_128 ground vdd_readh ground memorycellh
X2wirel128 n2_bl_128 n2_bl_129 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer128 n2_br_128 n2_br_129 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj128 ground ground n2_bl_129 ground n2_br_129 ground vdd_readh ground memorycellh
X2wirel129 n2_bl_129 n2_bl_130 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer129 n2_br_129 n2_br_130 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj129 ground ground n2_bl_130 ground n2_br_130 ground vdd_readh ground memorycellh
X2wirel130 n2_bl_130 n2_bl_131 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer130 n2_br_130 n2_br_131 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj130 ground ground n2_bl_131 ground n2_br_131 ground vdd_readh ground memorycellh
X2wirel131 n2_bl_131 n2_bl_132 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer131 n2_br_131 n2_br_132 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj131 ground ground n2_bl_132 ground n2_br_132 ground vdd_readh ground memorycellh
X2wirel132 n2_bl_132 n2_bl_133 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer132 n2_br_132 n2_br_133 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj132 ground ground n2_bl_133 ground n2_br_133 ground vdd_readh ground memorycellh
X2wirel133 n2_bl_133 n2_bl_134 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer133 n2_br_133 n2_br_134 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj133 ground ground n2_bl_134 ground n2_br_134 ground vdd_readh ground memorycellh
X2wirel134 n2_bl_134 n2_bl_135 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer134 n2_br_134 n2_br_135 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj134 ground ground n2_bl_135 ground n2_br_135 ground vdd_readh ground memorycellh
X2wirel135 n2_bl_135 n2_bl_136 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer135 n2_br_135 n2_br_136 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj135 ground ground n2_bl_136 ground n2_br_136 ground vdd_readh ground memorycellh
X2wirel136 n2_bl_136 n2_bl_137 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer136 n2_br_136 n2_br_137 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj136 ground ground n2_bl_137 ground n2_br_137 ground vdd_readh ground memorycellh
X2wirel137 n2_bl_137 n2_bl_138 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer137 n2_br_137 n2_br_138 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj137 ground ground n2_bl_138 ground n2_br_138 ground vdd_readh ground memorycellh
X2wirel138 n2_bl_138 n2_bl_139 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer138 n2_br_138 n2_br_139 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj138 ground ground n2_bl_139 ground n2_br_139 ground vdd_readh ground memorycellh
X2wirel139 n2_bl_139 n2_bl_140 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer139 n2_br_139 n2_br_140 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj139 ground ground n2_bl_140 ground n2_br_140 ground vdd_readh ground memorycellh
X2wirel140 n2_bl_140 n2_bl_141 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer140 n2_br_140 n2_br_141 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj140 ground ground n2_bl_141 ground n2_br_141 ground vdd_readh ground memorycellh
X2wirel141 n2_bl_141 n2_bl_142 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer141 n2_br_141 n2_br_142 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj141 ground ground n2_bl_142 ground n2_br_142 ground vdd_readh ground memorycellh
X2wirel142 n2_bl_142 n2_bl_143 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer142 n2_br_142 n2_br_143 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj142 ground ground n2_bl_143 ground n2_br_143 ground vdd_readh ground memorycellh
X2wirel143 n2_bl_143 n2_bl_144 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer143 n2_br_143 n2_br_144 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj143 ground ground n2_bl_144 ground n2_br_144 ground vdd_readh ground memorycellh
X2wirel144 n2_bl_144 n2_bl_145 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer144 n2_br_144 n2_br_145 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj144 ground ground n2_bl_145 ground n2_br_145 ground vdd_readh ground memorycellh
X2wirel145 n2_bl_145 n2_bl_146 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer145 n2_br_145 n2_br_146 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj145 ground ground n2_bl_146 ground n2_br_146 ground vdd_readh ground memorycellh
X2wirel146 n2_bl_146 n2_bl_147 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer146 n2_br_146 n2_br_147 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj146 ground ground n2_bl_147 ground n2_br_147 ground vdd_readh ground memorycellh
X2wirel147 n2_bl_147 n2_bl_148 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer147 n2_br_147 n2_br_148 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj147 ground ground n2_bl_148 ground n2_br_148 ground vdd_readh ground memorycellh
X2wirel148 n2_bl_148 n2_bl_149 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer148 n2_br_148 n2_br_149 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj148 ground ground n2_bl_149 ground n2_br_149 ground vdd_readh ground memorycellh
X2wirel149 n2_bl_149 n2_bl_150 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer149 n2_br_149 n2_br_150 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj149 ground ground n2_bl_150 ground n2_br_150 ground vdd_readh ground memorycellh
X2wirel150 n2_bl_150 n2_bl_151 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer150 n2_br_150 n2_br_151 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj150 ground ground n2_bl_151 ground n2_br_151 ground vdd_readh ground memorycellh
X2wirel151 n2_bl_151 n2_bl_152 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer151 n2_br_151 n2_br_152 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj151 ground ground n2_bl_152 ground n2_br_152 ground vdd_readh ground memorycellh
X2wirel152 n2_bl_152 n2_bl_153 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer152 n2_br_152 n2_br_153 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj152 ground ground n2_bl_153 ground n2_br_153 ground vdd_readh ground memorycellh
X2wirel153 n2_bl_153 n2_bl_154 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer153 n2_br_153 n2_br_154 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj153 ground ground n2_bl_154 ground n2_br_154 ground vdd_readh ground memorycellh
X2wirel154 n2_bl_154 n2_bl_155 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer154 n2_br_154 n2_br_155 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj154 ground ground n2_bl_155 ground n2_br_155 ground vdd_readh ground memorycellh
X2wirel155 n2_bl_155 n2_bl_156 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer155 n2_br_155 n2_br_156 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj155 ground ground n2_bl_156 ground n2_br_156 ground vdd_readh ground memorycellh
X2wirel156 n2_bl_156 n2_bl_157 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer156 n2_br_156 n2_br_157 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj156 ground ground n2_bl_157 ground n2_br_157 ground vdd_readh ground memorycellh
X2wirel157 n2_bl_157 n2_bl_158 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer157 n2_br_157 n2_br_158 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj157 ground ground n2_bl_158 ground n2_br_158 ground vdd_readh ground memorycellh
X2wirel158 n2_bl_158 n2_bl_159 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer158 n2_br_158 n2_br_159 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj158 ground ground n2_bl_159 ground n2_br_159 ground vdd_readh ground memorycellh
X2wirel159 n2_bl_159 n2_bl_160 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer159 n2_br_159 n2_br_160 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj159 ground ground n2_bl_160 ground n2_br_160 ground vdd_readh ground memorycellh
X2wirel160 n2_bl_160 n2_bl_161 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer160 n2_br_160 n2_br_161 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj160 ground ground n2_bl_161 ground n2_br_161 ground vdd_readh ground memorycellh
X2wirel161 n2_bl_161 n2_bl_162 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer161 n2_br_161 n2_br_162 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj161 ground ground n2_bl_162 ground n2_br_162 ground vdd_readh ground memorycellh
X2wirel162 n2_bl_162 n2_bl_163 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer162 n2_br_162 n2_br_163 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj162 ground ground n2_bl_163 ground n2_br_163 ground vdd_readh ground memorycellh
X2wirel163 n2_bl_163 n2_bl_164 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer163 n2_br_163 n2_br_164 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj163 ground ground n2_bl_164 ground n2_br_164 ground vdd_readh ground memorycellh
X2wirel164 n2_bl_164 n2_bl_165 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer164 n2_br_164 n2_br_165 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj164 ground ground n2_bl_165 ground n2_br_165 ground vdd_readh ground memorycellh
X2wirel165 n2_bl_165 n2_bl_166 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer165 n2_br_165 n2_br_166 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj165 ground ground n2_bl_166 ground n2_br_166 ground vdd_readh ground memorycellh
X2wirel166 n2_bl_166 n2_bl_167 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer166 n2_br_166 n2_br_167 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj166 ground ground n2_bl_167 ground n2_br_167 ground vdd_readh ground memorycellh
X2wirel167 n2_bl_167 n2_bl_168 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer167 n2_br_167 n2_br_168 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj167 ground ground n2_bl_168 ground n2_br_168 ground vdd_readh ground memorycellh
X2wirel168 n2_bl_168 n2_bl_169 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer168 n2_br_168 n2_br_169 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj168 ground ground n2_bl_169 ground n2_br_169 ground vdd_readh ground memorycellh
X2wirel169 n2_bl_169 n2_bl_170 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer169 n2_br_169 n2_br_170 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj169 ground ground n2_bl_170 ground n2_br_170 ground vdd_readh ground memorycellh
X2wirel170 n2_bl_170 n2_bl_171 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer170 n2_br_170 n2_br_171 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj170 ground ground n2_bl_171 ground n2_br_171 ground vdd_readh ground memorycellh
X2wirel171 n2_bl_171 n2_bl_172 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer171 n2_br_171 n2_br_172 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj171 ground ground n2_bl_172 ground n2_br_172 ground vdd_readh ground memorycellh
X2wirel172 n2_bl_172 n2_bl_173 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer172 n2_br_172 n2_br_173 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj172 ground ground n2_bl_173 ground n2_br_173 ground vdd_readh ground memorycellh
X2wirel173 n2_bl_173 n2_bl_174 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer173 n2_br_173 n2_br_174 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj173 ground ground n2_bl_174 ground n2_br_174 ground vdd_readh ground memorycellh
X2wirel174 n2_bl_174 n2_bl_175 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer174 n2_br_174 n2_br_175 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj174 ground ground n2_bl_175 ground n2_br_175 ground vdd_readh ground memorycellh
X2wirel175 n2_bl_175 n2_bl_176 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer175 n2_br_175 n2_br_176 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj175 ground ground n2_bl_176 ground n2_br_176 ground vdd_readh ground memorycellh
X2wirel176 n2_bl_176 n2_bl_177 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer176 n2_br_176 n2_br_177 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj176 ground ground n2_bl_177 ground n2_br_177 ground vdd_readh ground memorycellh
X2wirel177 n2_bl_177 n2_bl_178 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer177 n2_br_177 n2_br_178 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj177 ground ground n2_bl_178 ground n2_br_178 ground vdd_readh ground memorycellh
X2wirel178 n2_bl_178 n2_bl_179 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer178 n2_br_178 n2_br_179 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj178 ground ground n2_bl_179 ground n2_br_179 ground vdd_readh ground memorycellh
X2wirel179 n2_bl_179 n2_bl_180 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer179 n2_br_179 n2_br_180 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj179 ground ground n2_bl_180 ground n2_br_180 ground vdd_readh ground memorycellh
X2wirel180 n2_bl_180 n2_bl_181 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer180 n2_br_180 n2_br_181 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj180 ground ground n2_bl_181 ground n2_br_181 ground vdd_readh ground memorycellh
X2wirel181 n2_bl_181 n2_bl_182 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer181 n2_br_181 n2_br_182 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj181 ground ground n2_bl_182 ground n2_br_182 ground vdd_readh ground memorycellh
X2wirel182 n2_bl_182 n2_bl_183 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer182 n2_br_182 n2_br_183 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj182 ground ground n2_bl_183 ground n2_br_183 ground vdd_readh ground memorycellh
X2wirel183 n2_bl_183 n2_bl_184 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer183 n2_br_183 n2_br_184 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj183 ground ground n2_bl_184 ground n2_br_184 ground vdd_readh ground memorycellh
X2wirel184 n2_bl_184 n2_bl_185 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer184 n2_br_184 n2_br_185 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj184 ground ground n2_bl_185 ground n2_br_185 ground vdd_readh ground memorycellh
X2wirel185 n2_bl_185 n2_bl_186 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer185 n2_br_185 n2_br_186 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj185 ground ground n2_bl_186 ground n2_br_186 ground vdd_readh ground memorycellh
X2wirel186 n2_bl_186 n2_bl_187 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer186 n2_br_186 n2_br_187 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj186 ground ground n2_bl_187 ground n2_br_187 ground vdd_readh ground memorycellh
X2wirel187 n2_bl_187 n2_bl_188 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer187 n2_br_187 n2_br_188 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj187 ground ground n2_bl_188 ground n2_br_188 ground vdd_readh ground memorycellh
X2wirel188 n2_bl_188 n2_bl_189 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer188 n2_br_188 n2_br_189 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj188 ground ground n2_bl_189 ground n2_br_189 ground vdd_readh ground memorycellh
X2wirel189 n2_bl_189 n2_bl_190 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer189 n2_br_189 n2_br_190 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj189 ground ground n2_bl_190 ground n2_br_190 ground vdd_readh ground memorycellh
X2wirel190 n2_bl_190 n2_bl_191 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer190 n2_br_190 n2_br_191 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj190 ground ground n2_bl_191 ground n2_br_191 ground vdd_readh ground memorycellh
X2wirel191 n2_bl_191 n2_bl_192 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer191 n2_br_191 n2_br_192 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj191 ground ground n2_bl_192 ground n2_br_192 ground vdd_readh ground memorycellh
X2wirel192 n2_bl_192 n2_bl_193 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer192 n2_br_192 n2_br_193 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj192 ground ground n2_bl_193 ground n2_br_193 ground vdd_readh ground memorycellh
X2wirel193 n2_bl_193 n2_bl_194 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer193 n2_br_193 n2_br_194 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj193 ground ground n2_bl_194 ground n2_br_194 ground vdd_readh ground memorycellh
X2wirel194 n2_bl_194 n2_bl_195 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer194 n2_br_194 n2_br_195 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj194 ground ground n2_bl_195 ground n2_br_195 ground vdd_readh ground memorycellh
X2wirel195 n2_bl_195 n2_bl_196 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer195 n2_br_195 n2_br_196 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj195 ground ground n2_bl_196 ground n2_br_196 ground vdd_readh ground memorycellh
X2wirel196 n2_bl_196 n2_bl_197 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer196 n2_br_196 n2_br_197 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj196 ground ground n2_bl_197 ground n2_br_197 ground vdd_readh ground memorycellh
X2wirel197 n2_bl_197 n2_bl_198 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer197 n2_br_197 n2_br_198 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj197 ground ground n2_bl_198 ground n2_br_198 ground vdd_readh ground memorycellh
X2wirel198 n2_bl_198 n2_bl_199 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer198 n2_br_198 n2_br_199 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj198 ground ground n2_bl_199 ground n2_br_199 ground vdd_readh ground memorycellh
X2wirel199 n2_bl_199 n2_bl_200 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer199 n2_br_199 n2_br_200 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj199 ground ground n2_bl_200 ground n2_br_200 ground vdd_readh ground memorycellh
X2wirel200 n2_bl_200 n2_bl_201 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer200 n2_br_200 n2_br_201 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj200 ground ground n2_bl_201 ground n2_br_201 ground vdd_readh ground memorycellh
X2wirel201 n2_bl_201 n2_bl_202 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer201 n2_br_201 n2_br_202 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj201 ground ground n2_bl_202 ground n2_br_202 ground vdd_readh ground memorycellh
X2wirel202 n2_bl_202 n2_bl_203 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer202 n2_br_202 n2_br_203 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj202 ground ground n2_bl_203 ground n2_br_203 ground vdd_readh ground memorycellh
X2wirel203 n2_bl_203 n2_bl_204 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer203 n2_br_203 n2_br_204 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj203 ground ground n2_bl_204 ground n2_br_204 ground vdd_readh ground memorycellh
X2wirel204 n2_bl_204 n2_bl_205 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer204 n2_br_204 n2_br_205 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj204 ground ground n2_bl_205 ground n2_br_205 ground vdd_readh ground memorycellh
X2wirel205 n2_bl_205 n2_bl_206 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer205 n2_br_205 n2_br_206 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj205 ground ground n2_bl_206 ground n2_br_206 ground vdd_readh ground memorycellh
X2wirel206 n2_bl_206 n2_bl_207 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer206 n2_br_206 n2_br_207 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj206 ground ground n2_bl_207 ground n2_br_207 ground vdd_readh ground memorycellh
X2wirel207 n2_bl_207 n2_bl_208 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer207 n2_br_207 n2_br_208 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj207 ground ground n2_bl_208 ground n2_br_208 ground vdd_readh ground memorycellh
X2wirel208 n2_bl_208 n2_bl_209 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer208 n2_br_208 n2_br_209 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj208 ground ground n2_bl_209 ground n2_br_209 ground vdd_readh ground memorycellh
X2wirel209 n2_bl_209 n2_bl_210 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer209 n2_br_209 n2_br_210 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj209 ground ground n2_bl_210 ground n2_br_210 ground vdd_readh ground memorycellh
X2wirel210 n2_bl_210 n2_bl_211 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer210 n2_br_210 n2_br_211 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj210 ground ground n2_bl_211 ground n2_br_211 ground vdd_readh ground memorycellh
X2wirel211 n2_bl_211 n2_bl_212 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer211 n2_br_211 n2_br_212 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj211 ground ground n2_bl_212 ground n2_br_212 ground vdd_readh ground memorycellh
X2wirel212 n2_bl_212 n2_bl_213 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer212 n2_br_212 n2_br_213 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj212 ground ground n2_bl_213 ground n2_br_213 ground vdd_readh ground memorycellh
X2wirel213 n2_bl_213 n2_bl_214 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer213 n2_br_213 n2_br_214 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj213 ground ground n2_bl_214 ground n2_br_214 ground vdd_readh ground memorycellh
X2wirel214 n2_bl_214 n2_bl_215 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer214 n2_br_214 n2_br_215 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj214 ground ground n2_bl_215 ground n2_br_215 ground vdd_readh ground memorycellh
X2wirel215 n2_bl_215 n2_bl_216 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer215 n2_br_215 n2_br_216 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj215 ground ground n2_bl_216 ground n2_br_216 ground vdd_readh ground memorycellh
X2wirel216 n2_bl_216 n2_bl_217 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer216 n2_br_216 n2_br_217 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj216 ground ground n2_bl_217 ground n2_br_217 ground vdd_readh ground memorycellh
X2wirel217 n2_bl_217 n2_bl_218 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer217 n2_br_217 n2_br_218 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj217 ground ground n2_bl_218 ground n2_br_218 ground vdd_readh ground memorycellh
X2wirel218 n2_bl_218 n2_bl_219 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer218 n2_br_218 n2_br_219 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj218 ground ground n2_bl_219 ground n2_br_219 ground vdd_readh ground memorycellh
X2wirel219 n2_bl_219 n2_bl_220 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer219 n2_br_219 n2_br_220 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj219 ground ground n2_bl_220 ground n2_br_220 ground vdd_readh ground memorycellh
X2wirel220 n2_bl_220 n2_bl_221 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer220 n2_br_220 n2_br_221 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj220 ground ground n2_bl_221 ground n2_br_221 ground vdd_readh ground memorycellh
X2wirel221 n2_bl_221 n2_bl_222 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer221 n2_br_221 n2_br_222 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj221 ground ground n2_bl_222 ground n2_br_222 ground vdd_readh ground memorycellh
X2wirel222 n2_bl_222 n2_bl_223 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer222 n2_br_222 n2_br_223 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj222 ground ground n2_bl_223 ground n2_br_223 ground vdd_readh ground memorycellh
X2wirel223 n2_bl_223 n2_bl_224 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer223 n2_br_223 n2_br_224 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj223 ground ground n2_bl_224 ground n2_br_224 ground vdd_readh ground memorycellh
X2wirel224 n2_bl_224 n2_bl_225 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer224 n2_br_224 n2_br_225 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj224 ground ground n2_bl_225 ground n2_br_225 ground vdd_readh ground memorycellh
X2wirel225 n2_bl_225 n2_bl_226 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer225 n2_br_225 n2_br_226 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj225 ground ground n2_bl_226 ground n2_br_226 ground vdd_readh ground memorycellh
X2wirel226 n2_bl_226 n2_bl_227 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer226 n2_br_226 n2_br_227 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj226 ground ground n2_bl_227 ground n2_br_227 ground vdd_readh ground memorycellh
X2wirel227 n2_bl_227 n2_bl_228 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer227 n2_br_227 n2_br_228 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj227 ground ground n2_bl_228 ground n2_br_228 ground vdd_readh ground memorycellh
X2wirel228 n2_bl_228 n2_bl_229 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer228 n2_br_228 n2_br_229 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj228 ground ground n2_bl_229 ground n2_br_229 ground vdd_readh ground memorycellh
X2wirel229 n2_bl_229 n2_bl_230 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer229 n2_br_229 n2_br_230 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj229 ground ground n2_bl_230 ground n2_br_230 ground vdd_readh ground memorycellh
X2wirel230 n2_bl_230 n2_bl_231 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer230 n2_br_230 n2_br_231 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj230 ground ground n2_bl_231 ground n2_br_231 ground vdd_readh ground memorycellh
X2wirel231 n2_bl_231 n2_bl_232 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer231 n2_br_231 n2_br_232 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj231 ground ground n2_bl_232 ground n2_br_232 ground vdd_readh ground memorycellh
X2wirel232 n2_bl_232 n2_bl_233 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer232 n2_br_232 n2_br_233 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj232 ground ground n2_bl_233 ground n2_br_233 ground vdd_readh ground memorycellh
X2wirel233 n2_bl_233 n2_bl_234 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer233 n2_br_233 n2_br_234 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj233 ground ground n2_bl_234 ground n2_br_234 ground vdd_readh ground memorycellh
X2wirel234 n2_bl_234 n2_bl_235 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer234 n2_br_234 n2_br_235 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj234 ground ground n2_bl_235 ground n2_br_235 ground vdd_readh ground memorycellh
X2wirel235 n2_bl_235 n2_bl_236 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer235 n2_br_235 n2_br_236 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj235 ground ground n2_bl_236 ground n2_br_236 ground vdd_readh ground memorycellh
X2wirel236 n2_bl_236 n2_bl_237 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer236 n2_br_236 n2_br_237 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj236 ground ground n2_bl_237 ground n2_br_237 ground vdd_readh ground memorycellh
X2wirel237 n2_bl_237 n2_bl_238 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer237 n2_br_237 n2_br_238 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj237 ground ground n2_bl_238 ground n2_br_238 ground vdd_readh ground memorycellh
X2wirel238 n2_bl_238 n2_bl_239 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer238 n2_br_238 n2_br_239 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj238 ground ground n2_bl_239 ground n2_br_239 ground vdd_readh ground memorycellh
X2wirel239 n2_bl_239 n2_bl_240 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer239 n2_br_239 n2_br_240 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj239 ground ground n2_bl_240 ground n2_br_240 ground vdd_readh ground memorycellh
X2wirel240 n2_bl_240 n2_bl_241 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer240 n2_br_240 n2_br_241 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj240 ground ground n2_bl_241 ground n2_br_241 ground vdd_readh ground memorycellh
X2wirel241 n2_bl_241 n2_bl_242 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer241 n2_br_241 n2_br_242 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj241 ground ground n2_bl_242 ground n2_br_242 ground vdd_readh ground memorycellh
X2wirel242 n2_bl_242 n2_bl_243 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer242 n2_br_242 n2_br_243 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj242 ground ground n2_bl_243 ground n2_br_243 ground vdd_readh ground memorycellh
X2wirel243 n2_bl_243 n2_bl_244 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer243 n2_br_243 n2_br_244 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj243 ground ground n2_bl_244 ground n2_br_244 ground vdd_readh ground memorycellh
X2wirel244 n2_bl_244 n2_bl_245 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer244 n2_br_244 n2_br_245 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj244 ground ground n2_bl_245 ground n2_br_245 ground vdd_readh ground memorycellh
X2wirel245 n2_bl_245 n2_bl_246 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer245 n2_br_245 n2_br_246 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj245 ground ground n2_bl_246 ground n2_br_246 ground vdd_readh ground memorycellh
X2wirel246 n2_bl_246 n2_bl_247 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer246 n2_br_246 n2_br_247 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj246 ground ground n2_bl_247 ground n2_br_247 ground vdd_readh ground memorycellh
X2wirel247 n2_bl_247 n2_bl_248 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer247 n2_br_247 n2_br_248 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj247 ground ground n2_bl_248 ground n2_br_248 ground vdd_readh ground memorycellh
X2wirel248 n2_bl_248 n2_bl_249 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer248 n2_br_248 n2_br_249 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj248 ground ground n2_bl_249 ground n2_br_249 ground vdd_readh ground memorycellh
X2wirel249 n2_bl_249 n2_bl_250 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer249 n2_br_249 n2_br_250 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj249 ground ground n2_bl_250 ground n2_br_250 ground vdd_readh ground memorycellh
X2wirel250 n2_bl_250 n2_bl_251 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer250 n2_br_250 n2_br_251 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj250 ground ground n2_bl_251 ground n2_br_251 ground vdd_readh ground memorycellh
X2wirel251 n2_bl_251 n2_bl_252 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer251 n2_br_251 n2_br_252 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj251 ground ground n2_bl_252 ground n2_br_252 ground vdd_readh ground memorycellh
X2wirel252 n2_bl_252 n2_bl_253 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer252 n2_br_252 n2_br_253 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj252 ground ground n2_bl_253 ground n2_br_253 ground vdd_readh ground memorycellh
X2wirel253 n2_bl_253 n2_bl_254 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer253 n2_br_253 n2_br_254 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj253 ground ground n2_bl_254 ground n2_br_254 ground vdd_readh ground memorycellh
X2wirel254 n2_bl_254 n2_bl_255 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer254 n2_br_254 n2_br_255 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj254 ground ground n2_bl_255 ground n2_br_255 ground vdd_readh ground memorycellh
X2wirel255 n2_bl_255 n2_bl_256 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer255 n2_br_255 n2_br_256 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj255 ground ground n2_bl_256 ground n2_br_256 ground vdd_readh ground memorycellh
X2wirel256 n2_bl_256 n2_bl_257 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer256 n2_br_256 n2_br_257 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj256 ground ground n2_bl_257 ground n2_br_257 ground vdd_readh ground memorycellh
X2wirel257 n2_bl_257 n2_bl_258 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer257 n2_br_257 n2_br_258 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj257 ground ground n2_bl_258 ground n2_br_258 ground vdd_readh ground memorycellh
X2wirel258 n2_bl_258 n2_bl_259 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer258 n2_br_258 n2_br_259 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj258 ground ground n2_bl_259 ground n2_br_259 ground vdd_readh ground memorycellh
X2wirel259 n2_bl_259 n2_bl_260 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer259 n2_br_259 n2_br_260 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj259 ground ground n2_bl_260 ground n2_br_260 ground vdd_readh ground memorycellh
X2wirel260 n2_bl_260 n2_bl_261 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer260 n2_br_260 n2_br_261 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj260 ground ground n2_bl_261 ground n2_br_261 ground vdd_readh ground memorycellh
X2wirel261 n2_bl_261 n2_bl_262 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer261 n2_br_261 n2_br_262 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj261 ground ground n2_bl_262 ground n2_br_262 ground vdd_readh ground memorycellh
X2wirel262 n2_bl_262 n2_bl_263 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer262 n2_br_262 n2_br_263 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj262 ground ground n2_bl_263 ground n2_br_263 ground vdd_readh ground memorycellh
X2wirel263 n2_bl_263 n2_bl_264 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer263 n2_br_263 n2_br_264 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj263 ground ground n2_bl_264 ground n2_br_264 ground vdd_readh ground memorycellh
X2wirel264 n2_bl_264 n2_bl_265 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer264 n2_br_264 n2_br_265 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj264 ground ground n2_bl_265 ground n2_br_265 ground vdd_readh ground memorycellh
X2wirel265 n2_bl_265 n2_bl_266 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer265 n2_br_265 n2_br_266 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj265 ground ground n2_bl_266 ground n2_br_266 ground vdd_readh ground memorycellh
X2wirel266 n2_bl_266 n2_bl_267 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer266 n2_br_266 n2_br_267 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj266 ground ground n2_bl_267 ground n2_br_267 ground vdd_readh ground memorycellh
X2wirel267 n2_bl_267 n2_bl_268 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer267 n2_br_267 n2_br_268 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj267 ground ground n2_bl_268 ground n2_br_268 ground vdd_readh ground memorycellh
X2wirel268 n2_bl_268 n2_bl_269 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer268 n2_br_268 n2_br_269 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj268 ground ground n2_bl_269 ground n2_br_269 ground vdd_readh ground memorycellh
X2wirel269 n2_bl_269 n2_bl_270 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer269 n2_br_269 n2_br_270 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj269 ground ground n2_bl_270 ground n2_br_270 ground vdd_readh ground memorycellh
X2wirel270 n2_bl_270 n2_bl_271 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer270 n2_br_270 n2_br_271 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj270 ground ground n2_bl_271 ground n2_br_271 ground vdd_readh ground memorycellh
X2wirel271 n2_bl_271 n2_bl_272 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer271 n2_br_271 n2_br_272 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj271 ground ground n2_bl_272 ground n2_br_272 ground vdd_readh ground memorycellh
X2wirel272 n2_bl_272 n2_bl_273 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer272 n2_br_272 n2_br_273 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj272 ground ground n2_bl_273 ground n2_br_273 ground vdd_readh ground memorycellh
X2wirel273 n2_bl_273 n2_bl_274 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer273 n2_br_273 n2_br_274 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj273 ground ground n2_bl_274 ground n2_br_274 ground vdd_readh ground memorycellh
X2wirel274 n2_bl_274 n2_bl_275 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer274 n2_br_274 n2_br_275 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj274 ground ground n2_bl_275 ground n2_br_275 ground vdd_readh ground memorycellh
X2wirel275 n2_bl_275 n2_bl_276 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer275 n2_br_275 n2_br_276 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj275 ground ground n2_bl_276 ground n2_br_276 ground vdd_readh ground memorycellh
X2wirel276 n2_bl_276 n2_bl_277 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer276 n2_br_276 n2_br_277 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj276 ground ground n2_bl_277 ground n2_br_277 ground vdd_readh ground memorycellh
X2wirel277 n2_bl_277 n2_bl_278 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer277 n2_br_277 n2_br_278 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj277 ground ground n2_bl_278 ground n2_br_278 ground vdd_readh ground memorycellh
X2wirel278 n2_bl_278 n2_bl_279 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer278 n2_br_278 n2_br_279 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj278 ground ground n2_bl_279 ground n2_br_279 ground vdd_readh ground memorycellh
X2wirel279 n2_bl_279 n2_bl_280 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer279 n2_br_279 n2_br_280 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj279 ground ground n2_bl_280 ground n2_br_280 ground vdd_readh ground memorycellh
X2wirel280 n2_bl_280 n2_bl_281 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer280 n2_br_280 n2_br_281 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj280 ground ground n2_bl_281 ground n2_br_281 ground vdd_readh ground memorycellh
X2wirel281 n2_bl_281 n2_bl_282 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer281 n2_br_281 n2_br_282 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj281 ground ground n2_bl_282 ground n2_br_282 ground vdd_readh ground memorycellh
X2wirel282 n2_bl_282 n2_bl_283 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer282 n2_br_282 n2_br_283 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj282 ground ground n2_bl_283 ground n2_br_283 ground vdd_readh ground memorycellh
X2wirel283 n2_bl_283 n2_bl_284 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer283 n2_br_283 n2_br_284 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj283 ground ground n2_bl_284 ground n2_br_284 ground vdd_readh ground memorycellh
X2wirel284 n2_bl_284 n2_bl_285 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer284 n2_br_284 n2_br_285 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj284 ground ground n2_bl_285 ground n2_br_285 ground vdd_readh ground memorycellh
X2wirel285 n2_bl_285 n2_bl_286 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer285 n2_br_285 n2_br_286 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj285 ground ground n2_bl_286 ground n2_br_286 ground vdd_readh ground memorycellh
X2wirel286 n2_bl_286 n2_bl_287 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer286 n2_br_286 n2_br_287 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj286 ground ground n2_bl_287 ground n2_br_287 ground vdd_readh ground memorycellh
X2wirel287 n2_bl_287 n2_bl_288 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer287 n2_br_287 n2_br_288 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj287 ground ground n2_bl_288 ground n2_br_288 ground vdd_readh ground memorycellh
X2wirel288 n2_bl_288 n2_bl_289 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer288 n2_br_288 n2_br_289 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj288 ground ground n2_bl_289 ground n2_br_289 ground vdd_readh ground memorycellh
X2wirel289 n2_bl_289 n2_bl_290 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer289 n2_br_289 n2_br_290 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj289 ground ground n2_bl_290 ground n2_br_290 ground vdd_readh ground memorycellh
X2wirel290 n2_bl_290 n2_bl_291 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer290 n2_br_290 n2_br_291 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj290 ground ground n2_bl_291 ground n2_br_291 ground vdd_readh ground memorycellh
X2wirel291 n2_bl_291 n2_bl_292 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer291 n2_br_291 n2_br_292 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj291 ground ground n2_bl_292 ground n2_br_292 ground vdd_readh ground memorycellh
X2wirel292 n2_bl_292 n2_bl_293 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer292 n2_br_292 n2_br_293 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj292 ground ground n2_bl_293 ground n2_br_293 ground vdd_readh ground memorycellh
X2wirel293 n2_bl_293 n2_bl_294 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer293 n2_br_293 n2_br_294 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj293 ground ground n2_bl_294 ground n2_br_294 ground vdd_readh ground memorycellh
X2wirel294 n2_bl_294 n2_bl_295 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer294 n2_br_294 n2_br_295 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj294 ground ground n2_bl_295 ground n2_br_295 ground vdd_readh ground memorycellh
X2wirel295 n2_bl_295 n2_bl_296 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer295 n2_br_295 n2_br_296 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj295 ground ground n2_bl_296 ground n2_br_296 ground vdd_readh ground memorycellh
X2wirel296 n2_bl_296 n2_bl_297 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer296 n2_br_296 n2_br_297 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj296 ground ground n2_bl_297 ground n2_br_297 ground vdd_readh ground memorycellh
X2wirel297 n2_bl_297 n2_bl_298 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer297 n2_br_297 n2_br_298 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj297 ground ground n2_bl_298 ground n2_br_298 ground vdd_readh ground memorycellh
X2wirel298 n2_bl_298 n2_bl_299 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer298 n2_br_298 n2_br_299 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj298 ground ground n2_bl_299 ground n2_br_299 ground vdd_readh ground memorycellh
X2wirel299 n2_bl_299 n2_bl_300 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer299 n2_br_299 n2_br_300 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj299 ground ground n2_bl_300 ground n2_br_300 ground vdd_readh ground memorycellh
X2wirel300 n2_bl_300 n2_bl_301 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer300 n2_br_300 n2_br_301 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj300 ground ground n2_bl_301 ground n2_br_301 ground vdd_readh ground memorycellh
X2wirel301 n2_bl_301 n2_bl_302 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer301 n2_br_301 n2_br_302 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj301 ground ground n2_bl_302 ground n2_br_302 ground vdd_readh ground memorycellh
X2wirel302 n2_bl_302 n2_bl_303 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer302 n2_br_302 n2_br_303 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj302 ground ground n2_bl_303 ground n2_br_303 ground vdd_readh ground memorycellh
X2wirel303 n2_bl_303 n2_bl_304 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer303 n2_br_303 n2_br_304 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj303 ground ground n2_bl_304 ground n2_br_304 ground vdd_readh ground memorycellh
X2wirel304 n2_bl_304 n2_bl_305 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer304 n2_br_304 n2_br_305 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj304 ground ground n2_bl_305 ground n2_br_305 ground vdd_readh ground memorycellh
X2wirel305 n2_bl_305 n2_bl_306 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer305 n2_br_305 n2_br_306 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj305 ground ground n2_bl_306 ground n2_br_306 ground vdd_readh ground memorycellh
X2wirel306 n2_bl_306 n2_bl_307 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer306 n2_br_306 n2_br_307 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj306 ground ground n2_bl_307 ground n2_br_307 ground vdd_readh ground memorycellh
X2wirel307 n2_bl_307 n2_bl_308 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer307 n2_br_307 n2_br_308 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj307 ground ground n2_bl_308 ground n2_br_308 ground vdd_readh ground memorycellh
X2wirel308 n2_bl_308 n2_bl_309 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer308 n2_br_308 n2_br_309 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj308 ground ground n2_bl_309 ground n2_br_309 ground vdd_readh ground memorycellh
X2wirel309 n2_bl_309 n2_bl_310 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer309 n2_br_309 n2_br_310 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj309 ground ground n2_bl_310 ground n2_br_310 ground vdd_readh ground memorycellh
X2wirel310 n2_bl_310 n2_bl_311 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer310 n2_br_310 n2_br_311 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj310 ground ground n2_bl_311 ground n2_br_311 ground vdd_readh ground memorycellh
X2wirel311 n2_bl_311 n2_bl_312 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer311 n2_br_311 n2_br_312 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj311 ground ground n2_bl_312 ground n2_br_312 ground vdd_readh ground memorycellh
X2wirel312 n2_bl_312 n2_bl_313 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer312 n2_br_312 n2_br_313 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj312 ground ground n2_bl_313 ground n2_br_313 ground vdd_readh ground memorycellh
X2wirel313 n2_bl_313 n2_bl_314 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer313 n2_br_313 n2_br_314 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj313 ground ground n2_bl_314 ground n2_br_314 ground vdd_readh ground memorycellh
X2wirel314 n2_bl_314 n2_bl_315 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer314 n2_br_314 n2_br_315 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj314 ground ground n2_bl_315 ground n2_br_315 ground vdd_readh ground memorycellh
X2wirel315 n2_bl_315 n2_bl_316 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer315 n2_br_315 n2_br_316 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj315 ground ground n2_bl_316 ground n2_br_316 ground vdd_readh ground memorycellh
X2wirel316 n2_bl_316 n2_bl_317 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer316 n2_br_316 n2_br_317 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj316 ground ground n2_bl_317 ground n2_br_317 ground vdd_readh ground memorycellh
X2wirel317 n2_bl_317 n2_bl_318 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer317 n2_br_317 n2_br_318 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj317 ground ground n2_bl_318 ground n2_br_318 ground vdd_readh ground memorycellh
X2wirel318 n2_bl_318 n2_bl_319 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer318 n2_br_318 n2_br_319 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj318 ground ground n2_bl_319 ground n2_br_319 ground vdd_readh ground memorycellh
X2wirel319 n2_bl_319 n2_bl_320 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer319 n2_br_319 n2_br_320 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj319 ground ground n2_bl_320 ground n2_br_320 ground vdd_readh ground memorycellh
X2wirel320 n2_bl_320 n2_bl_321 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer320 n2_br_320 n2_br_321 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj320 ground ground n2_bl_321 ground n2_br_321 ground vdd_readh ground memorycellh
X2wirel321 n2_bl_321 n2_bl_322 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer321 n2_br_321 n2_br_322 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj321 ground ground n2_bl_322 ground n2_br_322 ground vdd_readh ground memorycellh
X2wirel322 n2_bl_322 n2_bl_323 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer322 n2_br_322 n2_br_323 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj322 ground ground n2_bl_323 ground n2_br_323 ground vdd_readh ground memorycellh
X2wirel323 n2_bl_323 n2_bl_324 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer323 n2_br_323 n2_br_324 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj323 ground ground n2_bl_324 ground n2_br_324 ground vdd_readh ground memorycellh
X2wirel324 n2_bl_324 n2_bl_325 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer324 n2_br_324 n2_br_325 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj324 ground ground n2_bl_325 ground n2_br_325 ground vdd_readh ground memorycellh
X2wirel325 n2_bl_325 n2_bl_326 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer325 n2_br_325 n2_br_326 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj325 ground ground n2_bl_326 ground n2_br_326 ground vdd_readh ground memorycellh
X2wirel326 n2_bl_326 n2_bl_327 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer326 n2_br_326 n2_br_327 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj326 ground ground n2_bl_327 ground n2_br_327 ground vdd_readh ground memorycellh
X2wirel327 n2_bl_327 n2_bl_328 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer327 n2_br_327 n2_br_328 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj327 ground ground n2_bl_328 ground n2_br_328 ground vdd_readh ground memorycellh
X2wirel328 n2_bl_328 n2_bl_329 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer328 n2_br_328 n2_br_329 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj328 ground ground n2_bl_329 ground n2_br_329 ground vdd_readh ground memorycellh
X2wirel329 n2_bl_329 n2_bl_330 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer329 n2_br_329 n2_br_330 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj329 ground ground n2_bl_330 ground n2_br_330 ground vdd_readh ground memorycellh
X2wirel330 n2_bl_330 n2_bl_331 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer330 n2_br_330 n2_br_331 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj330 ground ground n2_bl_331 ground n2_br_331 ground vdd_readh ground memorycellh
X2wirel331 n2_bl_331 n2_bl_332 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer331 n2_br_331 n2_br_332 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj331 ground ground n2_bl_332 ground n2_br_332 ground vdd_readh ground memorycellh
X2wirel332 n2_bl_332 n2_bl_333 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer332 n2_br_332 n2_br_333 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj332 ground ground n2_bl_333 ground n2_br_333 ground vdd_readh ground memorycellh
X2wirel333 n2_bl_333 n2_bl_334 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer333 n2_br_333 n2_br_334 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj333 ground ground n2_bl_334 ground n2_br_334 ground vdd_readh ground memorycellh
X2wirel334 n2_bl_334 n2_bl_335 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer334 n2_br_334 n2_br_335 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj334 ground ground n2_bl_335 ground n2_br_335 ground vdd_readh ground memorycellh
X2wirel335 n2_bl_335 n2_bl_336 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer335 n2_br_335 n2_br_336 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj335 ground ground n2_bl_336 ground n2_br_336 ground vdd_readh ground memorycellh
X2wirel336 n2_bl_336 n2_bl_337 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer336 n2_br_336 n2_br_337 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj336 ground ground n2_bl_337 ground n2_br_337 ground vdd_readh ground memorycellh
X2wirel337 n2_bl_337 n2_bl_338 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer337 n2_br_337 n2_br_338 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj337 ground ground n2_bl_338 ground n2_br_338 ground vdd_readh ground memorycellh
X2wirel338 n2_bl_338 n2_bl_339 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer338 n2_br_338 n2_br_339 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj338 ground ground n2_bl_339 ground n2_br_339 ground vdd_readh ground memorycellh
X2wirel339 n2_bl_339 n2_bl_340 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer339 n2_br_339 n2_br_340 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj339 ground ground n2_bl_340 ground n2_br_340 ground vdd_readh ground memorycellh
X2wirel340 n2_bl_340 n2_bl_341 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer340 n2_br_340 n2_br_341 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj340 ground ground n2_bl_341 ground n2_br_341 ground vdd_readh ground memorycellh
X2wirel341 n2_bl_341 n2_bl_342 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer341 n2_br_341 n2_br_342 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj341 ground ground n2_bl_342 ground n2_br_342 ground vdd_readh ground memorycellh
X2wirel342 n2_bl_342 n2_bl_343 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer342 n2_br_342 n2_br_343 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj342 ground ground n2_bl_343 ground n2_br_343 ground vdd_readh ground memorycellh
X2wirel343 n2_bl_343 n2_bl_344 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer343 n2_br_343 n2_br_344 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj343 ground ground n2_bl_344 ground n2_br_344 ground vdd_readh ground memorycellh
X2wirel344 n2_bl_344 n2_bl_345 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer344 n2_br_344 n2_br_345 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj344 ground ground n2_bl_345 ground n2_br_345 ground vdd_readh ground memorycellh
X2wirel345 n2_bl_345 n2_bl_346 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer345 n2_br_345 n2_br_346 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj345 ground ground n2_bl_346 ground n2_br_346 ground vdd_readh ground memorycellh
X2wirel346 n2_bl_346 n2_bl_347 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer346 n2_br_346 n2_br_347 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj346 ground ground n2_bl_347 ground n2_br_347 ground vdd_readh ground memorycellh
X2wirel347 n2_bl_347 n2_bl_348 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer347 n2_br_347 n2_br_348 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj347 ground ground n2_bl_348 ground n2_br_348 ground vdd_readh ground memorycellh
X2wirel348 n2_bl_348 n2_bl_349 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer348 n2_br_348 n2_br_349 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj348 ground ground n2_bl_349 ground n2_br_349 ground vdd_readh ground memorycellh
X2wirel349 n2_bl_349 n2_bl_350 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer349 n2_br_349 n2_br_350 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj349 ground ground n2_bl_350 ground n2_br_350 ground vdd_readh ground memorycellh
X2wirel350 n2_bl_350 n2_bl_351 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer350 n2_br_350 n2_br_351 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj350 ground ground n2_bl_351 ground n2_br_351 ground vdd_readh ground memorycellh
X2wirel351 n2_bl_351 n2_bl_352 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer351 n2_br_351 n2_br_352 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj351 ground ground n2_bl_352 ground n2_br_352 ground vdd_readh ground memorycellh
X2wirel352 n2_bl_352 n2_bl_353 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer352 n2_br_352 n2_br_353 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj352 ground ground n2_bl_353 ground n2_br_353 ground vdd_readh ground memorycellh
X2wirel353 n2_bl_353 n2_bl_354 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer353 n2_br_353 n2_br_354 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj353 ground ground n2_bl_354 ground n2_br_354 ground vdd_readh ground memorycellh
X2wirel354 n2_bl_354 n2_bl_355 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer354 n2_br_354 n2_br_355 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj354 ground ground n2_bl_355 ground n2_br_355 ground vdd_readh ground memorycellh
X2wirel355 n2_bl_355 n2_bl_356 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer355 n2_br_355 n2_br_356 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj355 ground ground n2_bl_356 ground n2_br_356 ground vdd_readh ground memorycellh
X2wirel356 n2_bl_356 n2_bl_357 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer356 n2_br_356 n2_br_357 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj356 ground ground n2_bl_357 ground n2_br_357 ground vdd_readh ground memorycellh
X2wirel357 n2_bl_357 n2_bl_358 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer357 n2_br_357 n2_br_358 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj357 ground ground n2_bl_358 ground n2_br_358 ground vdd_readh ground memorycellh
X2wirel358 n2_bl_358 n2_bl_359 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer358 n2_br_358 n2_br_359 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj358 ground ground n2_bl_359 ground n2_br_359 ground vdd_readh ground memorycellh
X2wirel359 n2_bl_359 n2_bl_360 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer359 n2_br_359 n2_br_360 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj359 ground ground n2_bl_360 ground n2_br_360 ground vdd_readh ground memorycellh
X2wirel360 n2_bl_360 n2_bl_361 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer360 n2_br_360 n2_br_361 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj360 ground ground n2_bl_361 ground n2_br_361 ground vdd_readh ground memorycellh
X2wirel361 n2_bl_361 n2_bl_362 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer361 n2_br_361 n2_br_362 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj361 ground ground n2_bl_362 ground n2_br_362 ground vdd_readh ground memorycellh
X2wirel362 n2_bl_362 n2_bl_363 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer362 n2_br_362 n2_br_363 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj362 ground ground n2_bl_363 ground n2_br_363 ground vdd_readh ground memorycellh
X2wirel363 n2_bl_363 n2_bl_364 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer363 n2_br_363 n2_br_364 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj363 ground ground n2_bl_364 ground n2_br_364 ground vdd_readh ground memorycellh
X2wirel364 n2_bl_364 n2_bl_365 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer364 n2_br_364 n2_br_365 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj364 ground ground n2_bl_365 ground n2_br_365 ground vdd_readh ground memorycellh
X2wirel365 n2_bl_365 n2_bl_366 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer365 n2_br_365 n2_br_366 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj365 ground ground n2_bl_366 ground n2_br_366 ground vdd_readh ground memorycellh
X2wirel366 n2_bl_366 n2_bl_367 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer366 n2_br_366 n2_br_367 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj366 ground ground n2_bl_367 ground n2_br_367 ground vdd_readh ground memorycellh
X2wirel367 n2_bl_367 n2_bl_368 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer367 n2_br_367 n2_br_368 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj367 ground ground n2_bl_368 ground n2_br_368 ground vdd_readh ground memorycellh
X2wirel368 n2_bl_368 n2_bl_369 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer368 n2_br_368 n2_br_369 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj368 ground ground n2_bl_369 ground n2_br_369 ground vdd_readh ground memorycellh
X2wirel369 n2_bl_369 n2_bl_370 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer369 n2_br_369 n2_br_370 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj369 ground ground n2_bl_370 ground n2_br_370 ground vdd_readh ground memorycellh
X2wirel370 n2_bl_370 n2_bl_371 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer370 n2_br_370 n2_br_371 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj370 ground ground n2_bl_371 ground n2_br_371 ground vdd_readh ground memorycellh
X2wirel371 n2_bl_371 n2_bl_372 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer371 n2_br_371 n2_br_372 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj371 ground ground n2_bl_372 ground n2_br_372 ground vdd_readh ground memorycellh
X2wirel372 n2_bl_372 n2_bl_373 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer372 n2_br_372 n2_br_373 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj372 ground ground n2_bl_373 ground n2_br_373 ground vdd_readh ground memorycellh
X2wirel373 n2_bl_373 n2_bl_374 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer373 n2_br_373 n2_br_374 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj373 ground ground n2_bl_374 ground n2_br_374 ground vdd_readh ground memorycellh
X2wirel374 n2_bl_374 n2_bl_375 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer374 n2_br_374 n2_br_375 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj374 ground ground n2_bl_375 ground n2_br_375 ground vdd_readh ground memorycellh
X2wirel375 n2_bl_375 n2_bl_376 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer375 n2_br_375 n2_br_376 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj375 ground ground n2_bl_376 ground n2_br_376 ground vdd_readh ground memorycellh
X2wirel376 n2_bl_376 n2_bl_377 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer376 n2_br_376 n2_br_377 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj376 ground ground n2_bl_377 ground n2_br_377 ground vdd_readh ground memorycellh
X2wirel377 n2_bl_377 n2_bl_378 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer377 n2_br_377 n2_br_378 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj377 ground ground n2_bl_378 ground n2_br_378 ground vdd_readh ground memorycellh
X2wirel378 n2_bl_378 n2_bl_379 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer378 n2_br_378 n2_br_379 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj378 ground ground n2_bl_379 ground n2_br_379 ground vdd_readh ground memorycellh
X2wirel379 n2_bl_379 n2_bl_380 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer379 n2_br_379 n2_br_380 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj379 ground ground n2_bl_380 ground n2_br_380 ground vdd_readh ground memorycellh
X2wirel380 n2_bl_380 n2_bl_381 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer380 n2_br_380 n2_br_381 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj380 ground ground n2_bl_381 ground n2_br_381 ground vdd_readh ground memorycellh
X2wirel381 n2_bl_381 n2_bl_382 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer381 n2_br_381 n2_br_382 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj381 ground ground n2_bl_382 ground n2_br_382 ground vdd_readh ground memorycellh
X2wirel382 n2_bl_382 n2_bl_383 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer382 n2_br_382 n2_br_383 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj382 ground ground n2_bl_383 ground n2_br_383 ground vdd_readh ground memorycellh
X2wirel383 n2_bl_383 n2_bl_384 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer383 n2_br_383 n2_br_384 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj383 ground ground n2_bl_384 ground n2_br_384 ground vdd_readh ground memorycellh
X2wirel384 n2_bl_384 n2_bl_385 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer384 n2_br_384 n2_br_385 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj384 ground ground n2_bl_385 ground n2_br_385 ground vdd_readh ground memorycellh
X2wirel385 n2_bl_385 n2_bl_386 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer385 n2_br_385 n2_br_386 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj385 ground ground n2_bl_386 ground n2_br_386 ground vdd_readh ground memorycellh
X2wirel386 n2_bl_386 n2_bl_387 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer386 n2_br_386 n2_br_387 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj386 ground ground n2_bl_387 ground n2_br_387 ground vdd_readh ground memorycellh
X2wirel387 n2_bl_387 n2_bl_388 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer387 n2_br_387 n2_br_388 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj387 ground ground n2_bl_388 ground n2_br_388 ground vdd_readh ground memorycellh
X2wirel388 n2_bl_388 n2_bl_389 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer388 n2_br_388 n2_br_389 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj388 ground ground n2_bl_389 ground n2_br_389 ground vdd_readh ground memorycellh
X2wirel389 n2_bl_389 n2_bl_390 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer389 n2_br_389 n2_br_390 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj389 ground ground n2_bl_390 ground n2_br_390 ground vdd_readh ground memorycellh
X2wirel390 n2_bl_390 n2_bl_391 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer390 n2_br_390 n2_br_391 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj390 ground ground n2_bl_391 ground n2_br_391 ground vdd_readh ground memorycellh
X2wirel391 n2_bl_391 n2_bl_392 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer391 n2_br_391 n2_br_392 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj391 ground ground n2_bl_392 ground n2_br_392 ground vdd_readh ground memorycellh
X2wirel392 n2_bl_392 n2_bl_393 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer392 n2_br_392 n2_br_393 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj392 ground ground n2_bl_393 ground n2_br_393 ground vdd_readh ground memorycellh
X2wirel393 n2_bl_393 n2_bl_394 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer393 n2_br_393 n2_br_394 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj393 ground ground n2_bl_394 ground n2_br_394 ground vdd_readh ground memorycellh
X2wirel394 n2_bl_394 n2_bl_395 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer394 n2_br_394 n2_br_395 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj394 ground ground n2_bl_395 ground n2_br_395 ground vdd_readh ground memorycellh
X2wirel395 n2_bl_395 n2_bl_396 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer395 n2_br_395 n2_br_396 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj395 ground ground n2_bl_396 ground n2_br_396 ground vdd_readh ground memorycellh
X2wirel396 n2_bl_396 n2_bl_397 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer396 n2_br_396 n2_br_397 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj396 ground ground n2_bl_397 ground n2_br_397 ground vdd_readh ground memorycellh
X2wirel397 n2_bl_397 n2_bl_398 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer397 n2_br_397 n2_br_398 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj397 ground ground n2_bl_398 ground n2_br_398 ground vdd_readh ground memorycellh
X2wirel398 n2_bl_398 n2_bl_399 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer398 n2_br_398 n2_br_399 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj398 ground ground n2_bl_399 ground n2_br_399 ground vdd_readh ground memorycellh
X2wirel399 n2_bl_399 n2_bl_400 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer399 n2_br_399 n2_br_400 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj399 ground ground n2_bl_400 ground n2_br_400 ground vdd_readh ground memorycellh
X2wirel400 n2_bl_400 n2_bl_401 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer400 n2_br_400 n2_br_401 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj400 ground ground n2_bl_401 ground n2_br_401 ground vdd_readh ground memorycellh
X2wirel401 n2_bl_401 n2_bl_402 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer401 n2_br_401 n2_br_402 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj401 ground ground n2_bl_402 ground n2_br_402 ground vdd_readh ground memorycellh
X2wirel402 n2_bl_402 n2_bl_403 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer402 n2_br_402 n2_br_403 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj402 ground ground n2_bl_403 ground n2_br_403 ground vdd_readh ground memorycellh
X2wirel403 n2_bl_403 n2_bl_404 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer403 n2_br_403 n2_br_404 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj403 ground ground n2_bl_404 ground n2_br_404 ground vdd_readh ground memorycellh
X2wirel404 n2_bl_404 n2_bl_405 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer404 n2_br_404 n2_br_405 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj404 ground ground n2_bl_405 ground n2_br_405 ground vdd_readh ground memorycellh
X2wirel405 n2_bl_405 n2_bl_406 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer405 n2_br_405 n2_br_406 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj405 ground ground n2_bl_406 ground n2_br_406 ground vdd_readh ground memorycellh
X2wirel406 n2_bl_406 n2_bl_407 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer406 n2_br_406 n2_br_407 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj406 ground ground n2_bl_407 ground n2_br_407 ground vdd_readh ground memorycellh
X2wirel407 n2_bl_407 n2_bl_408 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer407 n2_br_407 n2_br_408 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj407 ground ground n2_bl_408 ground n2_br_408 ground vdd_readh ground memorycellh
X2wirel408 n2_bl_408 n2_bl_409 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer408 n2_br_408 n2_br_409 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj408 ground ground n2_bl_409 ground n2_br_409 ground vdd_readh ground memorycellh
X2wirel409 n2_bl_409 n2_bl_410 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer409 n2_br_409 n2_br_410 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj409 ground ground n2_bl_410 ground n2_br_410 ground vdd_readh ground memorycellh
X2wirel410 n2_bl_410 n2_bl_411 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer410 n2_br_410 n2_br_411 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj410 ground ground n2_bl_411 ground n2_br_411 ground vdd_readh ground memorycellh
X2wirel411 n2_bl_411 n2_bl_412 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer411 n2_br_411 n2_br_412 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj411 ground ground n2_bl_412 ground n2_br_412 ground vdd_readh ground memorycellh
X2wirel412 n2_bl_412 n2_bl_413 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer412 n2_br_412 n2_br_413 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj412 ground ground n2_bl_413 ground n2_br_413 ground vdd_readh ground memorycellh
X2wirel413 n2_bl_413 n2_bl_414 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer413 n2_br_413 n2_br_414 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj413 ground ground n2_bl_414 ground n2_br_414 ground vdd_readh ground memorycellh
X2wirel414 n2_bl_414 n2_bl_415 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer414 n2_br_414 n2_br_415 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj414 ground ground n2_bl_415 ground n2_br_415 ground vdd_readh ground memorycellh
X2wirel415 n2_bl_415 n2_bl_416 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer415 n2_br_415 n2_br_416 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj415 ground ground n2_bl_416 ground n2_br_416 ground vdd_readh ground memorycellh
X2wirel416 n2_bl_416 n2_bl_417 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer416 n2_br_416 n2_br_417 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj416 ground ground n2_bl_417 ground n2_br_417 ground vdd_readh ground memorycellh
X2wirel417 n2_bl_417 n2_bl_418 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer417 n2_br_417 n2_br_418 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj417 ground ground n2_bl_418 ground n2_br_418 ground vdd_readh ground memorycellh
X2wirel418 n2_bl_418 n2_bl_419 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer418 n2_br_418 n2_br_419 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj418 ground ground n2_bl_419 ground n2_br_419 ground vdd_readh ground memorycellh
X2wirel419 n2_bl_419 n2_bl_420 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer419 n2_br_419 n2_br_420 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj419 ground ground n2_bl_420 ground n2_br_420 ground vdd_readh ground memorycellh
X2wirel420 n2_bl_420 n2_bl_421 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer420 n2_br_420 n2_br_421 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj420 ground ground n2_bl_421 ground n2_br_421 ground vdd_readh ground memorycellh
X2wirel421 n2_bl_421 n2_bl_422 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer421 n2_br_421 n2_br_422 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj421 ground ground n2_bl_422 ground n2_br_422 ground vdd_readh ground memorycellh
X2wirel422 n2_bl_422 n2_bl_423 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer422 n2_br_422 n2_br_423 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj422 ground ground n2_bl_423 ground n2_br_423 ground vdd_readh ground memorycellh
X2wirel423 n2_bl_423 n2_bl_424 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer423 n2_br_423 n2_br_424 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj423 ground ground n2_bl_424 ground n2_br_424 ground vdd_readh ground memorycellh
X2wirel424 n2_bl_424 n2_bl_425 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer424 n2_br_424 n2_br_425 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj424 ground ground n2_bl_425 ground n2_br_425 ground vdd_readh ground memorycellh
X2wirel425 n2_bl_425 n2_bl_426 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer425 n2_br_425 n2_br_426 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj425 ground ground n2_bl_426 ground n2_br_426 ground vdd_readh ground memorycellh
X2wirel426 n2_bl_426 n2_bl_427 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer426 n2_br_426 n2_br_427 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj426 ground ground n2_bl_427 ground n2_br_427 ground vdd_readh ground memorycellh
X2wirel427 n2_bl_427 n2_bl_428 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer427 n2_br_427 n2_br_428 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj427 ground ground n2_bl_428 ground n2_br_428 ground vdd_readh ground memorycellh
X2wirel428 n2_bl_428 n2_bl_429 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer428 n2_br_428 n2_br_429 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj428 ground ground n2_bl_429 ground n2_br_429 ground vdd_readh ground memorycellh
X2wirel429 n2_bl_429 n2_bl_430 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer429 n2_br_429 n2_br_430 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj429 ground ground n2_bl_430 ground n2_br_430 ground vdd_readh ground memorycellh
X2wirel430 n2_bl_430 n2_bl_431 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer430 n2_br_430 n2_br_431 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj430 ground ground n2_bl_431 ground n2_br_431 ground vdd_readh ground memorycellh
X2wirel431 n2_bl_431 n2_bl_432 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer431 n2_br_431 n2_br_432 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj431 ground ground n2_bl_432 ground n2_br_432 ground vdd_readh ground memorycellh
X2wirel432 n2_bl_432 n2_bl_433 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer432 n2_br_432 n2_br_433 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj432 ground ground n2_bl_433 ground n2_br_433 ground vdd_readh ground memorycellh
X2wirel433 n2_bl_433 n2_bl_434 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer433 n2_br_433 n2_br_434 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj433 ground ground n2_bl_434 ground n2_br_434 ground vdd_readh ground memorycellh
X2wirel434 n2_bl_434 n2_bl_435 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer434 n2_br_434 n2_br_435 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj434 ground ground n2_bl_435 ground n2_br_435 ground vdd_readh ground memorycellh
X2wirel435 n2_bl_435 n2_bl_436 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer435 n2_br_435 n2_br_436 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj435 ground ground n2_bl_436 ground n2_br_436 ground vdd_readh ground memorycellh
X2wirel436 n2_bl_436 n2_bl_437 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer436 n2_br_436 n2_br_437 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj436 ground ground n2_bl_437 ground n2_br_437 ground vdd_readh ground memorycellh
X2wirel437 n2_bl_437 n2_bl_438 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer437 n2_br_437 n2_br_438 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj437 ground ground n2_bl_438 ground n2_br_438 ground vdd_readh ground memorycellh
X2wirel438 n2_bl_438 n2_bl_439 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer438 n2_br_438 n2_br_439 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj438 ground ground n2_bl_439 ground n2_br_439 ground vdd_readh ground memorycellh
X2wirel439 n2_bl_439 n2_bl_440 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer439 n2_br_439 n2_br_440 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj439 ground ground n2_bl_440 ground n2_br_440 ground vdd_readh ground memorycellh
X2wirel440 n2_bl_440 n2_bl_441 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer440 n2_br_440 n2_br_441 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj440 ground ground n2_bl_441 ground n2_br_441 ground vdd_readh ground memorycellh
X2wirel441 n2_bl_441 n2_bl_442 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer441 n2_br_441 n2_br_442 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj441 ground ground n2_bl_442 ground n2_br_442 ground vdd_readh ground memorycellh
X2wirel442 n2_bl_442 n2_bl_443 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer442 n2_br_442 n2_br_443 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj442 ground ground n2_bl_443 ground n2_br_443 ground vdd_readh ground memorycellh
X2wirel443 n2_bl_443 n2_bl_444 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer443 n2_br_443 n2_br_444 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj443 ground ground n2_bl_444 ground n2_br_444 ground vdd_readh ground memorycellh
X2wirel444 n2_bl_444 n2_bl_445 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer444 n2_br_444 n2_br_445 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj444 ground ground n2_bl_445 ground n2_br_445 ground vdd_readh ground memorycellh
X2wirel445 n2_bl_445 n2_bl_446 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer445 n2_br_445 n2_br_446 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj445 ground ground n2_bl_446 ground n2_br_446 ground vdd_readh ground memorycellh
X2wirel446 n2_bl_446 n2_bl_447 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer446 n2_br_446 n2_br_447 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj446 ground ground n2_bl_447 ground n2_br_447 ground vdd_readh ground memorycellh
X2wirel447 n2_bl_447 n2_bl_448 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer447 n2_br_447 n2_br_448 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj447 ground ground n2_bl_448 ground n2_br_448 ground vdd_readh ground memorycellh
X2wirel448 n2_bl_448 n2_bl_449 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer448 n2_br_448 n2_br_449 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj448 ground ground n2_bl_449 ground n2_br_449 ground vdd_readh ground memorycellh
X2wirel449 n2_bl_449 n2_bl_450 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer449 n2_br_449 n2_br_450 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj449 ground ground n2_bl_450 ground n2_br_450 ground vdd_readh ground memorycellh
X2wirel450 n2_bl_450 n2_bl_451 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer450 n2_br_450 n2_br_451 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj450 ground ground n2_bl_451 ground n2_br_451 ground vdd_readh ground memorycellh
X2wirel451 n2_bl_451 n2_bl_452 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer451 n2_br_451 n2_br_452 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj451 ground ground n2_bl_452 ground n2_br_452 ground vdd_readh ground memorycellh
X2wirel452 n2_bl_452 n2_bl_453 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer452 n2_br_452 n2_br_453 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj452 ground ground n2_bl_453 ground n2_br_453 ground vdd_readh ground memorycellh
X2wirel453 n2_bl_453 n2_bl_454 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer453 n2_br_453 n2_br_454 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj453 ground ground n2_bl_454 ground n2_br_454 ground vdd_readh ground memorycellh
X2wirel454 n2_bl_454 n2_bl_455 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer454 n2_br_454 n2_br_455 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj454 ground ground n2_bl_455 ground n2_br_455 ground vdd_readh ground memorycellh
X2wirel455 n2_bl_455 n2_bl_456 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer455 n2_br_455 n2_br_456 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj455 ground ground n2_bl_456 ground n2_br_456 ground vdd_readh ground memorycellh
X2wirel456 n2_bl_456 n2_bl_457 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer456 n2_br_456 n2_br_457 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj456 ground ground n2_bl_457 ground n2_br_457 ground vdd_readh ground memorycellh
X2wirel457 n2_bl_457 n2_bl_458 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer457 n2_br_457 n2_br_458 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj457 ground ground n2_bl_458 ground n2_br_458 ground vdd_readh ground memorycellh
X2wirel458 n2_bl_458 n2_bl_459 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer458 n2_br_458 n2_br_459 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj458 ground ground n2_bl_459 ground n2_br_459 ground vdd_readh ground memorycellh
X2wirel459 n2_bl_459 n2_bl_460 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer459 n2_br_459 n2_br_460 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj459 ground ground n2_bl_460 ground n2_br_460 ground vdd_readh ground memorycellh
X2wirel460 n2_bl_460 n2_bl_461 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer460 n2_br_460 n2_br_461 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj460 ground ground n2_bl_461 ground n2_br_461 ground vdd_readh ground memorycellh
X2wirel461 n2_bl_461 n2_bl_462 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer461 n2_br_461 n2_br_462 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj461 ground ground n2_bl_462 ground n2_br_462 ground vdd_readh ground memorycellh
X2wirel462 n2_bl_462 n2_bl_463 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer462 n2_br_462 n2_br_463 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj462 ground ground n2_bl_463 ground n2_br_463 ground vdd_readh ground memorycellh
X2wirel463 n2_bl_463 n2_bl_464 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer463 n2_br_463 n2_br_464 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj463 ground ground n2_bl_464 ground n2_br_464 ground vdd_readh ground memorycellh
X2wirel464 n2_bl_464 n2_bl_465 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer464 n2_br_464 n2_br_465 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj464 ground ground n2_bl_465 ground n2_br_465 ground vdd_readh ground memorycellh
X2wirel465 n2_bl_465 n2_bl_466 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer465 n2_br_465 n2_br_466 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj465 ground ground n2_bl_466 ground n2_br_466 ground vdd_readh ground memorycellh
X2wirel466 n2_bl_466 n2_bl_467 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer466 n2_br_466 n2_br_467 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj466 ground ground n2_bl_467 ground n2_br_467 ground vdd_readh ground memorycellh
X2wirel467 n2_bl_467 n2_bl_468 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer467 n2_br_467 n2_br_468 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj467 ground ground n2_bl_468 ground n2_br_468 ground vdd_readh ground memorycellh
X2wirel468 n2_bl_468 n2_bl_469 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer468 n2_br_468 n2_br_469 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj468 ground ground n2_bl_469 ground n2_br_469 ground vdd_readh ground memorycellh
X2wirel469 n2_bl_469 n2_bl_470 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer469 n2_br_469 n2_br_470 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj469 ground ground n2_bl_470 ground n2_br_470 ground vdd_readh ground memorycellh
X2wirel470 n2_bl_470 n2_bl_471 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer470 n2_br_470 n2_br_471 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj470 ground ground n2_bl_471 ground n2_br_471 ground vdd_readh ground memorycellh
X2wirel471 n2_bl_471 n2_bl_472 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer471 n2_br_471 n2_br_472 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj471 ground ground n2_bl_472 ground n2_br_472 ground vdd_readh ground memorycellh
X2wirel472 n2_bl_472 n2_bl_473 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer472 n2_br_472 n2_br_473 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj472 ground ground n2_bl_473 ground n2_br_473 ground vdd_readh ground memorycellh
X2wirel473 n2_bl_473 n2_bl_474 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer473 n2_br_473 n2_br_474 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj473 ground ground n2_bl_474 ground n2_br_474 ground vdd_readh ground memorycellh
X2wirel474 n2_bl_474 n2_bl_475 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer474 n2_br_474 n2_br_475 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj474 ground ground n2_bl_475 ground n2_br_475 ground vdd_readh ground memorycellh
X2wirel475 n2_bl_475 n2_bl_476 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer475 n2_br_475 n2_br_476 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj475 ground ground n2_bl_476 ground n2_br_476 ground vdd_readh ground memorycellh
X2wirel476 n2_bl_476 n2_bl_477 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer476 n2_br_476 n2_br_477 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj476 ground ground n2_bl_477 ground n2_br_477 ground vdd_readh ground memorycellh
X2wirel477 n2_bl_477 n2_bl_478 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer477 n2_br_477 n2_br_478 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj477 ground ground n2_bl_478 ground n2_br_478 ground vdd_readh ground memorycellh
X2wirel478 n2_bl_478 n2_bl_479 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer478 n2_br_478 n2_br_479 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj478 ground ground n2_bl_479 ground n2_br_479 ground vdd_readh ground memorycellh
X2wirel479 n2_bl_479 n2_bl_480 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer479 n2_br_479 n2_br_480 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj479 ground ground n2_bl_480 ground n2_br_480 ground vdd_readh ground memorycellh
X2wirel480 n2_bl_480 n2_bl_481 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer480 n2_br_480 n2_br_481 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj480 ground ground n2_bl_481 ground n2_br_481 ground vdd_readh ground memorycellh
X2wirel481 n2_bl_481 n2_bl_482 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer481 n2_br_481 n2_br_482 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj481 ground ground n2_bl_482 ground n2_br_482 ground vdd_readh ground memorycellh
X2wirel482 n2_bl_482 n2_bl_483 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer482 n2_br_482 n2_br_483 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj482 ground ground n2_bl_483 ground n2_br_483 ground vdd_readh ground memorycellh
X2wirel483 n2_bl_483 n2_bl_484 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer483 n2_br_483 n2_br_484 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj483 ground ground n2_bl_484 ground n2_br_484 ground vdd_readh ground memorycellh
X2wirel484 n2_bl_484 n2_bl_485 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer484 n2_br_484 n2_br_485 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj484 ground ground n2_bl_485 ground n2_br_485 ground vdd_readh ground memorycellh
X2wirel485 n2_bl_485 n2_bl_486 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer485 n2_br_485 n2_br_486 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj485 ground ground n2_bl_486 ground n2_br_486 ground vdd_readh ground memorycellh
X2wirel486 n2_bl_486 n2_bl_487 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer486 n2_br_486 n2_br_487 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj486 ground ground n2_bl_487 ground n2_br_487 ground vdd_readh ground memorycellh
X2wirel487 n2_bl_487 n2_bl_488 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer487 n2_br_487 n2_br_488 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj487 ground ground n2_bl_488 ground n2_br_488 ground vdd_readh ground memorycellh
X2wirel488 n2_bl_488 n2_bl_489 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer488 n2_br_488 n2_br_489 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj488 ground ground n2_bl_489 ground n2_br_489 ground vdd_readh ground memorycellh
X2wirel489 n2_bl_489 n2_bl_490 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer489 n2_br_489 n2_br_490 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj489 ground ground n2_bl_490 ground n2_br_490 ground vdd_readh ground memorycellh
X2wirel490 n2_bl_490 n2_bl_491 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer490 n2_br_490 n2_br_491 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj490 ground ground n2_bl_491 ground n2_br_491 ground vdd_readh ground memorycellh
X2wirel491 n2_bl_491 n2_bl_492 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer491 n2_br_491 n2_br_492 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj491 ground ground n2_bl_492 ground n2_br_492 ground vdd_readh ground memorycellh
X2wirel492 n2_bl_492 n2_bl_493 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer492 n2_br_492 n2_br_493 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj492 ground ground n2_bl_493 ground n2_br_493 ground vdd_readh ground memorycellh
X2wirel493 n2_bl_493 n2_bl_494 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer493 n2_br_493 n2_br_494 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj493 ground ground n2_bl_494 ground n2_br_494 ground vdd_readh ground memorycellh
X2wirel494 n2_bl_494 n2_bl_495 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer494 n2_br_494 n2_br_495 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj494 ground ground n2_bl_495 ground n2_br_495 ground vdd_readh ground memorycellh
X2wirel495 n2_bl_495 n2_bl_496 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer495 n2_br_495 n2_br_496 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj495 ground ground n2_bl_496 ground n2_br_496 ground vdd_readh ground memorycellh
X2wirel496 n2_bl_496 n2_bl_497 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer496 n2_br_496 n2_br_497 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj496 ground ground n2_bl_497 ground n2_br_497 ground vdd_readh ground memorycellh
X2wirel497 n2_bl_497 n2_bl_498 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer497 n2_br_497 n2_br_498 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj497 ground ground n2_bl_498 ground n2_br_498 ground vdd_readh ground memorycellh
X2wirel498 n2_bl_498 n2_bl_499 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer498 n2_br_498 n2_br_499 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj498 ground ground n2_bl_499 ground n2_br_499 ground vdd_readh ground memorycellh
X2wirel499 n2_bl_499 n2_bl_500 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer499 n2_br_499 n2_br_500 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj499 ground ground n2_bl_500 ground n2_br_500 ground vdd_readh ground memorycellh
X2wirel500 n2_bl_500 n2_bl_501 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer500 n2_br_500 n2_br_501 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj500 ground ground n2_bl_501 ground n2_br_501 ground vdd_readh ground memorycellh
X2wirel501 n2_bl_501 n2_bl_502 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer501 n2_br_501 n2_br_502 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj501 ground ground n2_bl_502 ground n2_br_502 ground vdd_readh ground memorycellh
X2wirel502 n2_bl_502 n2_bl_503 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer502 n2_br_502 n2_br_503 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj502 ground ground n2_bl_503 ground n2_br_503 ground vdd_readh ground memorycellh
X2wirel503 n2_bl_503 n2_bl_504 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer503 n2_br_503 n2_br_504 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj503 ground ground n2_bl_504 ground n2_br_504 ground vdd_readh ground memorycellh
X2wirel504 n2_bl_504 n2_bl_505 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer504 n2_br_504 n2_br_505 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj504 ground ground n2_bl_505 ground n2_br_505 ground vdd_readh ground memorycellh
X2wirel505 n2_bl_505 n2_bl_506 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer505 n2_br_505 n2_br_506 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj505 ground ground n2_bl_506 ground n2_br_506 ground vdd_readh ground memorycellh
X2wirel506 n2_bl_506 n2_bl_507 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer506 n2_br_506 n2_br_507 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj506 ground ground n2_bl_507 ground n2_br_507 ground vdd_readh ground memorycellh
X2wirel507 n2_bl_507 n2_bl_508 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer507 n2_br_507 n2_br_508 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj507 ground ground n2_bl_508 ground n2_br_508 ground vdd_readh ground memorycellh
X2wirel508 n2_bl_508 n2_bl_509 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer508 n2_br_508 n2_br_509 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj508 ground ground n2_bl_509 ground n2_br_509 ground vdd_readh ground memorycellh
X2wirel509 n2_bl_509 n2_bl_510 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer509 n2_br_509 n2_br_510 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj509 ground ground n2_bl_510 ground n2_br_510 ground vdd_readh ground memorycellh
X2wirel510 n2_bl_510 n2_bl_511 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer510 n2_br_510 n2_br_511 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj510 ground ground n2_bl_511 ground n2_br_511 ground vdd_readh ground memorycellh
X2wirel511 n2_bl_511 n2_bl_512 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer511 n2_br_511 n2_br_512 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj511 n_precharge ground n2_bl_512 ground n2_br_512 ground vdd_readh ground memorycellh
X2wirel1_ref n2_bl2_1 n2_bl2_2 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer1_ref n2_br2_1 n2_br2_2 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj1_ref ground ground n2_bl2_2 ground n2_br2_2 ground vdd_readh ground memorycellh
X2wirel2_ref n2_bl2_2 n2_bl2_3 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer2_ref n2_br2_2 n2_br2_3 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj2_ref ground ground n2_bl2_3 ground n2_br2_3 ground vdd_readh ground memorycellh
X2wirel3_ref n2_bl2_3 n2_bl2_4 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer3_ref n2_br2_3 n2_br2_4 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj3_ref ground ground n2_bl2_4 ground n2_br2_4 ground vdd_readh ground memorycellh
X2wirel4_ref n2_bl2_4 n2_bl2_5 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer4_ref n2_br2_4 n2_br2_5 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj4_ref ground ground n2_bl2_5 ground n2_br2_5 ground vdd_readh ground memorycellh
X2wirel5_ref n2_bl2_5 n2_bl2_6 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer5_ref n2_br2_5 n2_br2_6 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj5_ref ground ground n2_bl2_6 ground n2_br2_6 ground vdd_readh ground memorycellh
X2wirel6_ref n2_bl2_6 n2_bl2_7 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer6_ref n2_br2_6 n2_br2_7 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj6_ref ground ground n2_bl2_7 ground n2_br2_7 ground vdd_readh ground memorycellh
X2wirel7_ref n2_bl2_7 n2_bl2_8 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer7_ref n2_br2_7 n2_br2_8 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj7_ref ground ground n2_bl2_8 ground n2_br2_8 ground vdd_readh ground memorycellh
X2wirel8_ref n2_bl2_8 n2_bl2_9 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer8_ref n2_br2_8 n2_br2_9 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj8_ref ground ground n2_bl2_9 ground n2_br2_9 ground vdd_readh ground memorycellh
X2wirel9_ref n2_bl2_9 n2_bl2_10 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer9_ref n2_br2_9 n2_br2_10 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj9_ref ground ground n2_bl2_10 ground n2_br2_10 ground vdd_readh ground memorycellh
X2wirel10_ref n2_bl2_10 n2_bl2_11 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer10_ref n2_br2_10 n2_br2_11 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj10_ref ground ground n2_bl2_11 ground n2_br2_11 ground vdd_readh ground memorycellh
X2wirel11_ref n2_bl2_11 n2_bl2_12 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer11_ref n2_br2_11 n2_br2_12 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj11_ref ground ground n2_bl2_12 ground n2_br2_12 ground vdd_readh ground memorycellh
X2wirel12_ref n2_bl2_12 n2_bl2_13 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer12_ref n2_br2_12 n2_br2_13 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj12_ref ground ground n2_bl2_13 ground n2_br2_13 ground vdd_readh ground memorycellh
X2wirel13_ref n2_bl2_13 n2_bl2_14 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer13_ref n2_br2_13 n2_br2_14 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj13_ref ground ground n2_bl2_14 ground n2_br2_14 ground vdd_readh ground memorycellh
X2wirel14_ref n2_bl2_14 n2_bl2_15 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer14_ref n2_br2_14 n2_br2_15 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj14_ref ground ground n2_bl2_15 ground n2_br2_15 ground vdd_readh ground memorycellh
X2wirel15_ref n2_bl2_15 n2_bl2_16 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer15_ref n2_br2_15 n2_br2_16 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj15_ref ground ground n2_bl2_16 ground n2_br2_16 ground vdd_readh ground memorycellh
X2wirel16_ref n2_bl2_16 n2_bl2_17 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer16_ref n2_br2_16 n2_br2_17 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj16_ref ground ground n2_bl2_17 ground n2_br2_17 ground vdd_readh ground memorycellh
X2wirel17_ref n2_bl2_17 n2_bl2_18 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer17_ref n2_br2_17 n2_br2_18 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj17_ref ground ground n2_bl2_18 ground n2_br2_18 ground vdd_readh ground memorycellh
X2wirel18_ref n2_bl2_18 n2_bl2_19 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer18_ref n2_br2_18 n2_br2_19 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj18_ref ground ground n2_bl2_19 ground n2_br2_19 ground vdd_readh ground memorycellh
X2wirel19_ref n2_bl2_19 n2_bl2_20 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer19_ref n2_br2_19 n2_br2_20 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj19_ref ground ground n2_bl2_20 ground n2_br2_20 ground vdd_readh ground memorycellh
X2wirel20_ref n2_bl2_20 n2_bl2_21 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer20_ref n2_br2_20 n2_br2_21 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj20_ref ground ground n2_bl2_21 ground n2_br2_21 ground vdd_readh ground memorycellh
X2wirel21_ref n2_bl2_21 n2_bl2_22 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer21_ref n2_br2_21 n2_br2_22 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj21_ref ground ground n2_bl2_22 ground n2_br2_22 ground vdd_readh ground memorycellh
X2wirel22_ref n2_bl2_22 n2_bl2_23 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer22_ref n2_br2_22 n2_br2_23 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj22_ref ground ground n2_bl2_23 ground n2_br2_23 ground vdd_readh ground memorycellh
X2wirel23_ref n2_bl2_23 n2_bl2_24 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer23_ref n2_br2_23 n2_br2_24 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj23_ref ground ground n2_bl2_24 ground n2_br2_24 ground vdd_readh ground memorycellh
X2wirel24_ref n2_bl2_24 n2_bl2_25 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer24_ref n2_br2_24 n2_br2_25 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj24_ref ground ground n2_bl2_25 ground n2_br2_25 ground vdd_readh ground memorycellh
X2wirel25_ref n2_bl2_25 n2_bl2_26 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer25_ref n2_br2_25 n2_br2_26 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj25_ref ground ground n2_bl2_26 ground n2_br2_26 ground vdd_readh ground memorycellh
X2wirel26_ref n2_bl2_26 n2_bl2_27 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer26_ref n2_br2_26 n2_br2_27 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj26_ref ground ground n2_bl2_27 ground n2_br2_27 ground vdd_readh ground memorycellh
X2wirel27_ref n2_bl2_27 n2_bl2_28 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer27_ref n2_br2_27 n2_br2_28 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj27_ref ground ground n2_bl2_28 ground n2_br2_28 ground vdd_readh ground memorycellh
X2wirel28_ref n2_bl2_28 n2_bl2_29 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer28_ref n2_br2_28 n2_br2_29 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj28_ref ground ground n2_bl2_29 ground n2_br2_29 ground vdd_readh ground memorycellh
X2wirel29_ref n2_bl2_29 n2_bl2_30 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer29_ref n2_br2_29 n2_br2_30 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj29_ref ground ground n2_bl2_30 ground n2_br2_30 ground vdd_readh ground memorycellh
X2wirel30_ref n2_bl2_30 n2_bl2_31 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer30_ref n2_br2_30 n2_br2_31 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj30_ref ground ground n2_bl2_31 ground n2_br2_31 ground vdd_readh ground memorycellh
X2wirel31_ref n2_bl2_31 n2_bl2_32 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer31_ref n2_br2_31 n2_br2_32 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj31_ref ground ground n2_bl2_32 ground n2_br2_32 ground vdd_readh ground memorycellh
X2wirel32_ref n2_bl2_32 n2_bl2_33 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer32_ref n2_br2_32 n2_br2_33 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj32_ref ground ground n2_bl2_33 ground n2_br2_33 ground vdd_readh ground memorycellh
X2wirel33_ref n2_bl2_33 n2_bl2_34 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer33_ref n2_br2_33 n2_br2_34 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj33_ref ground ground n2_bl2_34 ground n2_br2_34 ground vdd_readh ground memorycellh
X2wirel34_ref n2_bl2_34 n2_bl2_35 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer34_ref n2_br2_34 n2_br2_35 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj34_ref ground ground n2_bl2_35 ground n2_br2_35 ground vdd_readh ground memorycellh
X2wirel35_ref n2_bl2_35 n2_bl2_36 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer35_ref n2_br2_35 n2_br2_36 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj35_ref ground ground n2_bl2_36 ground n2_br2_36 ground vdd_readh ground memorycellh
X2wirel36_ref n2_bl2_36 n2_bl2_37 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer36_ref n2_br2_36 n2_br2_37 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj36_ref ground ground n2_bl2_37 ground n2_br2_37 ground vdd_readh ground memorycellh
X2wirel37_ref n2_bl2_37 n2_bl2_38 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer37_ref n2_br2_37 n2_br2_38 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj37_ref ground ground n2_bl2_38 ground n2_br2_38 ground vdd_readh ground memorycellh
X2wirel38_ref n2_bl2_38 n2_bl2_39 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer38_ref n2_br2_38 n2_br2_39 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj38_ref ground ground n2_bl2_39 ground n2_br2_39 ground vdd_readh ground memorycellh
X2wirel39_ref n2_bl2_39 n2_bl2_40 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer39_ref n2_br2_39 n2_br2_40 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj39_ref ground ground n2_bl2_40 ground n2_br2_40 ground vdd_readh ground memorycellh
X2wirel40_ref n2_bl2_40 n2_bl2_41 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer40_ref n2_br2_40 n2_br2_41 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj40_ref ground ground n2_bl2_41 ground n2_br2_41 ground vdd_readh ground memorycellh
X2wirel41_ref n2_bl2_41 n2_bl2_42 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer41_ref n2_br2_41 n2_br2_42 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj41_ref ground ground n2_bl2_42 ground n2_br2_42 ground vdd_readh ground memorycellh
X2wirel42_ref n2_bl2_42 n2_bl2_43 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer42_ref n2_br2_42 n2_br2_43 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj42_ref ground ground n2_bl2_43 ground n2_br2_43 ground vdd_readh ground memorycellh
X2wirel43_ref n2_bl2_43 n2_bl2_44 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer43_ref n2_br2_43 n2_br2_44 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj43_ref ground ground n2_bl2_44 ground n2_br2_44 ground vdd_readh ground memorycellh
X2wirel44_ref n2_bl2_44 n2_bl2_45 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer44_ref n2_br2_44 n2_br2_45 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj44_ref ground ground n2_bl2_45 ground n2_br2_45 ground vdd_readh ground memorycellh
X2wirel45_ref n2_bl2_45 n2_bl2_46 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer45_ref n2_br2_45 n2_br2_46 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj45_ref ground ground n2_bl2_46 ground n2_br2_46 ground vdd_readh ground memorycellh
X2wirel46_ref n2_bl2_46 n2_bl2_47 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer46_ref n2_br2_46 n2_br2_47 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj46_ref ground ground n2_bl2_47 ground n2_br2_47 ground vdd_readh ground memorycellh
X2wirel47_ref n2_bl2_47 n2_bl2_48 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer47_ref n2_br2_47 n2_br2_48 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj47_ref ground ground n2_bl2_48 ground n2_br2_48 ground vdd_readh ground memorycellh
X2wirel48_ref n2_bl2_48 n2_bl2_49 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer48_ref n2_br2_48 n2_br2_49 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj48_ref ground ground n2_bl2_49 ground n2_br2_49 ground vdd_readh ground memorycellh
X2wirel49_ref n2_bl2_49 n2_bl2_50 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer49_ref n2_br2_49 n2_br2_50 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj49_ref ground ground n2_bl2_50 ground n2_br2_50 ground vdd_readh ground memorycellh
X2wirel50_ref n2_bl2_50 n2_bl2_51 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer50_ref n2_br2_50 n2_br2_51 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj50_ref ground ground n2_bl2_51 ground n2_br2_51 ground vdd_readh ground memorycellh
X2wirel51_ref n2_bl2_51 n2_bl2_52 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer51_ref n2_br2_51 n2_br2_52 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj51_ref ground ground n2_bl2_52 ground n2_br2_52 ground vdd_readh ground memorycellh
X2wirel52_ref n2_bl2_52 n2_bl2_53 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer52_ref n2_br2_52 n2_br2_53 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj52_ref ground ground n2_bl2_53 ground n2_br2_53 ground vdd_readh ground memorycellh
X2wirel53_ref n2_bl2_53 n2_bl2_54 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer53_ref n2_br2_53 n2_br2_54 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj53_ref ground ground n2_bl2_54 ground n2_br2_54 ground vdd_readh ground memorycellh
X2wirel54_ref n2_bl2_54 n2_bl2_55 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer54_ref n2_br2_54 n2_br2_55 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj54_ref ground ground n2_bl2_55 ground n2_br2_55 ground vdd_readh ground memorycellh
X2wirel55_ref n2_bl2_55 n2_bl2_56 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer55_ref n2_br2_55 n2_br2_56 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj55_ref ground ground n2_bl2_56 ground n2_br2_56 ground vdd_readh ground memorycellh
X2wirel56_ref n2_bl2_56 n2_bl2_57 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer56_ref n2_br2_56 n2_br2_57 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj56_ref ground ground n2_bl2_57 ground n2_br2_57 ground vdd_readh ground memorycellh
X2wirel57_ref n2_bl2_57 n2_bl2_58 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer57_ref n2_br2_57 n2_br2_58 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj57_ref ground ground n2_bl2_58 ground n2_br2_58 ground vdd_readh ground memorycellh
X2wirel58_ref n2_bl2_58 n2_bl2_59 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer58_ref n2_br2_58 n2_br2_59 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj58_ref ground ground n2_bl2_59 ground n2_br2_59 ground vdd_readh ground memorycellh
X2wirel59_ref n2_bl2_59 n2_bl2_60 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer59_ref n2_br2_59 n2_br2_60 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj59_ref ground ground n2_bl2_60 ground n2_br2_60 ground vdd_readh ground memorycellh
X2wirel60_ref n2_bl2_60 n2_bl2_61 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer60_ref n2_br2_60 n2_br2_61 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj60_ref ground ground n2_bl2_61 ground n2_br2_61 ground vdd_readh ground memorycellh
X2wirel61_ref n2_bl2_61 n2_bl2_62 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer61_ref n2_br2_61 n2_br2_62 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj61_ref ground ground n2_bl2_62 ground n2_br2_62 ground vdd_readh ground memorycellh
X2wirel62_ref n2_bl2_62 n2_bl2_63 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer62_ref n2_br2_62 n2_br2_63 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj62_ref ground ground n2_bl2_63 ground n2_br2_63 ground vdd_readh ground memorycellh
X2wirel63_ref n2_bl2_63 n2_bl2_64 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer63_ref n2_br2_63 n2_br2_64 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj63_ref ground ground n2_bl2_64 ground n2_br2_64 ground vdd_readh ground memorycellh
X2wirel64_ref n2_bl2_64 n2_bl2_65 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer64_ref n2_br2_64 n2_br2_65 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj64_ref ground ground n2_bl2_65 ground n2_br2_65 ground vdd_readh ground memorycellh
X2wirel65_ref n2_bl2_65 n2_bl2_66 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer65_ref n2_br2_65 n2_br2_66 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj65_ref ground ground n2_bl2_66 ground n2_br2_66 ground vdd_readh ground memorycellh
X2wirel66_ref n2_bl2_66 n2_bl2_67 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer66_ref n2_br2_66 n2_br2_67 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj66_ref ground ground n2_bl2_67 ground n2_br2_67 ground vdd_readh ground memorycellh
X2wirel67_ref n2_bl2_67 n2_bl2_68 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer67_ref n2_br2_67 n2_br2_68 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj67_ref ground ground n2_bl2_68 ground n2_br2_68 ground vdd_readh ground memorycellh
X2wirel68_ref n2_bl2_68 n2_bl2_69 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer68_ref n2_br2_68 n2_br2_69 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj68_ref ground ground n2_bl2_69 ground n2_br2_69 ground vdd_readh ground memorycellh
X2wirel69_ref n2_bl2_69 n2_bl2_70 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer69_ref n2_br2_69 n2_br2_70 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj69_ref ground ground n2_bl2_70 ground n2_br2_70 ground vdd_readh ground memorycellh
X2wirel70_ref n2_bl2_70 n2_bl2_71 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer70_ref n2_br2_70 n2_br2_71 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj70_ref ground ground n2_bl2_71 ground n2_br2_71 ground vdd_readh ground memorycellh
X2wirel71_ref n2_bl2_71 n2_bl2_72 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer71_ref n2_br2_71 n2_br2_72 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj71_ref ground ground n2_bl2_72 ground n2_br2_72 ground vdd_readh ground memorycellh
X2wirel72_ref n2_bl2_72 n2_bl2_73 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer72_ref n2_br2_72 n2_br2_73 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj72_ref ground ground n2_bl2_73 ground n2_br2_73 ground vdd_readh ground memorycellh
X2wirel73_ref n2_bl2_73 n2_bl2_74 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer73_ref n2_br2_73 n2_br2_74 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj73_ref ground ground n2_bl2_74 ground n2_br2_74 ground vdd_readh ground memorycellh
X2wirel74_ref n2_bl2_74 n2_bl2_75 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer74_ref n2_br2_74 n2_br2_75 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj74_ref ground ground n2_bl2_75 ground n2_br2_75 ground vdd_readh ground memorycellh
X2wirel75_ref n2_bl2_75 n2_bl2_76 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer75_ref n2_br2_75 n2_br2_76 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj75_ref ground ground n2_bl2_76 ground n2_br2_76 ground vdd_readh ground memorycellh
X2wirel76_ref n2_bl2_76 n2_bl2_77 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer76_ref n2_br2_76 n2_br2_77 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj76_ref ground ground n2_bl2_77 ground n2_br2_77 ground vdd_readh ground memorycellh
X2wirel77_ref n2_bl2_77 n2_bl2_78 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer77_ref n2_br2_77 n2_br2_78 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj77_ref ground ground n2_bl2_78 ground n2_br2_78 ground vdd_readh ground memorycellh
X2wirel78_ref n2_bl2_78 n2_bl2_79 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer78_ref n2_br2_78 n2_br2_79 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj78_ref ground ground n2_bl2_79 ground n2_br2_79 ground vdd_readh ground memorycellh
X2wirel79_ref n2_bl2_79 n2_bl2_80 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer79_ref n2_br2_79 n2_br2_80 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj79_ref ground ground n2_bl2_80 ground n2_br2_80 ground vdd_readh ground memorycellh
X2wirel80_ref n2_bl2_80 n2_bl2_81 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer80_ref n2_br2_80 n2_br2_81 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj80_ref ground ground n2_bl2_81 ground n2_br2_81 ground vdd_readh ground memorycellh
X2wirel81_ref n2_bl2_81 n2_bl2_82 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer81_ref n2_br2_81 n2_br2_82 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj81_ref ground ground n2_bl2_82 ground n2_br2_82 ground vdd_readh ground memorycellh
X2wirel82_ref n2_bl2_82 n2_bl2_83 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer82_ref n2_br2_82 n2_br2_83 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj82_ref ground ground n2_bl2_83 ground n2_br2_83 ground vdd_readh ground memorycellh
X2wirel83_ref n2_bl2_83 n2_bl2_84 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer83_ref n2_br2_83 n2_br2_84 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj83_ref ground ground n2_bl2_84 ground n2_br2_84 ground vdd_readh ground memorycellh
X2wirel84_ref n2_bl2_84 n2_bl2_85 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer84_ref n2_br2_84 n2_br2_85 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj84_ref ground ground n2_bl2_85 ground n2_br2_85 ground vdd_readh ground memorycellh
X2wirel85_ref n2_bl2_85 n2_bl2_86 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer85_ref n2_br2_85 n2_br2_86 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj85_ref ground ground n2_bl2_86 ground n2_br2_86 ground vdd_readh ground memorycellh
X2wirel86_ref n2_bl2_86 n2_bl2_87 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer86_ref n2_br2_86 n2_br2_87 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj86_ref ground ground n2_bl2_87 ground n2_br2_87 ground vdd_readh ground memorycellh
X2wirel87_ref n2_bl2_87 n2_bl2_88 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer87_ref n2_br2_87 n2_br2_88 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj87_ref ground ground n2_bl2_88 ground n2_br2_88 ground vdd_readh ground memorycellh
X2wirel88_ref n2_bl2_88 n2_bl2_89 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer88_ref n2_br2_88 n2_br2_89 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj88_ref ground ground n2_bl2_89 ground n2_br2_89 ground vdd_readh ground memorycellh
X2wirel89_ref n2_bl2_89 n2_bl2_90 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer89_ref n2_br2_89 n2_br2_90 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj89_ref ground ground n2_bl2_90 ground n2_br2_90 ground vdd_readh ground memorycellh
X2wirel90_ref n2_bl2_90 n2_bl2_91 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer90_ref n2_br2_90 n2_br2_91 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj90_ref ground ground n2_bl2_91 ground n2_br2_91 ground vdd_readh ground memorycellh
X2wirel91_ref n2_bl2_91 n2_bl2_92 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer91_ref n2_br2_91 n2_br2_92 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj91_ref ground ground n2_bl2_92 ground n2_br2_92 ground vdd_readh ground memorycellh
X2wirel92_ref n2_bl2_92 n2_bl2_93 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer92_ref n2_br2_92 n2_br2_93 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj92_ref ground ground n2_bl2_93 ground n2_br2_93 ground vdd_readh ground memorycellh
X2wirel93_ref n2_bl2_93 n2_bl2_94 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer93_ref n2_br2_93 n2_br2_94 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj93_ref ground ground n2_bl2_94 ground n2_br2_94 ground vdd_readh ground memorycellh
X2wirel94_ref n2_bl2_94 n2_bl2_95 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer94_ref n2_br2_94 n2_br2_95 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj94_ref ground ground n2_bl2_95 ground n2_br2_95 ground vdd_readh ground memorycellh
X2wirel95_ref n2_bl2_95 n2_bl2_96 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer95_ref n2_br2_95 n2_br2_96 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj95_ref ground ground n2_bl2_96 ground n2_br2_96 ground vdd_readh ground memorycellh
X2wirel96_ref n2_bl2_96 n2_bl2_97 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer96_ref n2_br2_96 n2_br2_97 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj96_ref ground ground n2_bl2_97 ground n2_br2_97 ground vdd_readh ground memorycellh
X2wirel97_ref n2_bl2_97 n2_bl2_98 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer97_ref n2_br2_97 n2_br2_98 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj97_ref ground ground n2_bl2_98 ground n2_br2_98 ground vdd_readh ground memorycellh
X2wirel98_ref n2_bl2_98 n2_bl2_99 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer98_ref n2_br2_98 n2_br2_99 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj98_ref ground ground n2_bl2_99 ground n2_br2_99 ground vdd_readh ground memorycellh
X2wirel99_ref n2_bl2_99 n2_bl2_100 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer99_ref n2_br2_99 n2_br2_100 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj99_ref ground ground n2_bl2_100 ground n2_br2_100 ground vdd_readh ground memorycellh
X2wirel100_ref n2_bl2_100 n2_bl2_101 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer100_ref n2_br2_100 n2_br2_101 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj100_ref ground ground n2_bl2_101 ground n2_br2_101 ground vdd_readh ground memorycellh
X2wirel101_ref n2_bl2_101 n2_bl2_102 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer101_ref n2_br2_101 n2_br2_102 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj101_ref ground ground n2_bl2_102 ground n2_br2_102 ground vdd_readh ground memorycellh
X2wirel102_ref n2_bl2_102 n2_bl2_103 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer102_ref n2_br2_102 n2_br2_103 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj102_ref ground ground n2_bl2_103 ground n2_br2_103 ground vdd_readh ground memorycellh
X2wirel103_ref n2_bl2_103 n2_bl2_104 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer103_ref n2_br2_103 n2_br2_104 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj103_ref ground ground n2_bl2_104 ground n2_br2_104 ground vdd_readh ground memorycellh
X2wirel104_ref n2_bl2_104 n2_bl2_105 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer104_ref n2_br2_104 n2_br2_105 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj104_ref ground ground n2_bl2_105 ground n2_br2_105 ground vdd_readh ground memorycellh
X2wirel105_ref n2_bl2_105 n2_bl2_106 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer105_ref n2_br2_105 n2_br2_106 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj105_ref ground ground n2_bl2_106 ground n2_br2_106 ground vdd_readh ground memorycellh
X2wirel106_ref n2_bl2_106 n2_bl2_107 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer106_ref n2_br2_106 n2_br2_107 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj106_ref ground ground n2_bl2_107 ground n2_br2_107 ground vdd_readh ground memorycellh
X2wirel107_ref n2_bl2_107 n2_bl2_108 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer107_ref n2_br2_107 n2_br2_108 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj107_ref ground ground n2_bl2_108 ground n2_br2_108 ground vdd_readh ground memorycellh
X2wirel108_ref n2_bl2_108 n2_bl2_109 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer108_ref n2_br2_108 n2_br2_109 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj108_ref ground ground n2_bl2_109 ground n2_br2_109 ground vdd_readh ground memorycellh
X2wirel109_ref n2_bl2_109 n2_bl2_110 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer109_ref n2_br2_109 n2_br2_110 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj109_ref ground ground n2_bl2_110 ground n2_br2_110 ground vdd_readh ground memorycellh
X2wirel110_ref n2_bl2_110 n2_bl2_111 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer110_ref n2_br2_110 n2_br2_111 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj110_ref ground ground n2_bl2_111 ground n2_br2_111 ground vdd_readh ground memorycellh
X2wirel111_ref n2_bl2_111 n2_bl2_112 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer111_ref n2_br2_111 n2_br2_112 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj111_ref ground ground n2_bl2_112 ground n2_br2_112 ground vdd_readh ground memorycellh
X2wirel112_ref n2_bl2_112 n2_bl2_113 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer112_ref n2_br2_112 n2_br2_113 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj112_ref ground ground n2_bl2_113 ground n2_br2_113 ground vdd_readh ground memorycellh
X2wirel113_ref n2_bl2_113 n2_bl2_114 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer113_ref n2_br2_113 n2_br2_114 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj113_ref ground ground n2_bl2_114 ground n2_br2_114 ground vdd_readh ground memorycellh
X2wirel114_ref n2_bl2_114 n2_bl2_115 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer114_ref n2_br2_114 n2_br2_115 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj114_ref ground ground n2_bl2_115 ground n2_br2_115 ground vdd_readh ground memorycellh
X2wirel115_ref n2_bl2_115 n2_bl2_116 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer115_ref n2_br2_115 n2_br2_116 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj115_ref ground ground n2_bl2_116 ground n2_br2_116 ground vdd_readh ground memorycellh
X2wirel116_ref n2_bl2_116 n2_bl2_117 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer116_ref n2_br2_116 n2_br2_117 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj116_ref ground ground n2_bl2_117 ground n2_br2_117 ground vdd_readh ground memorycellh
X2wirel117_ref n2_bl2_117 n2_bl2_118 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer117_ref n2_br2_117 n2_br2_118 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj117_ref ground ground n2_bl2_118 ground n2_br2_118 ground vdd_readh ground memorycellh
X2wirel118_ref n2_bl2_118 n2_bl2_119 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer118_ref n2_br2_118 n2_br2_119 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj118_ref ground ground n2_bl2_119 ground n2_br2_119 ground vdd_readh ground memorycellh
X2wirel119_ref n2_bl2_119 n2_bl2_120 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer119_ref n2_br2_119 n2_br2_120 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj119_ref ground ground n2_bl2_120 ground n2_br2_120 ground vdd_readh ground memorycellh
X2wirel120_ref n2_bl2_120 n2_bl2_121 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer120_ref n2_br2_120 n2_br2_121 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj120_ref ground ground n2_bl2_121 ground n2_br2_121 ground vdd_readh ground memorycellh
X2wirel121_ref n2_bl2_121 n2_bl2_122 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer121_ref n2_br2_121 n2_br2_122 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj121_ref ground ground n2_bl2_122 ground n2_br2_122 ground vdd_readh ground memorycellh
X2wirel122_ref n2_bl2_122 n2_bl2_123 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer122_ref n2_br2_122 n2_br2_123 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj122_ref ground ground n2_bl2_123 ground n2_br2_123 ground vdd_readh ground memorycellh
X2wirel123_ref n2_bl2_123 n2_bl2_124 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer123_ref n2_br2_123 n2_br2_124 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj123_ref ground ground n2_bl2_124 ground n2_br2_124 ground vdd_readh ground memorycellh
X2wirel124_ref n2_bl2_124 n2_bl2_125 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer124_ref n2_br2_124 n2_br2_125 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj124_ref ground ground n2_bl2_125 ground n2_br2_125 ground vdd_readh ground memorycellh
X2wirel125_ref n2_bl2_125 n2_bl2_126 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer125_ref n2_br2_125 n2_br2_126 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj125_ref ground ground n2_bl2_126 ground n2_br2_126 ground vdd_readh ground memorycellh
X2wirel126_ref n2_bl2_126 n2_bl2_127 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer126_ref n2_br2_126 n2_br2_127 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj126_ref ground ground n2_bl2_127 ground n2_br2_127 ground vdd_readh ground memorycellh
X2wirel127_ref n2_bl2_127 n2_bl2_128 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer127_ref n2_br2_127 n2_br2_128 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj127_ref ground ground n2_bl2_128 ground n2_br2_128 ground vdd_readh ground memorycellh
X2wirel128_ref n2_bl2_128 n2_bl2_129 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer128_ref n2_br2_128 n2_br2_129 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj128_ref ground ground n2_bl2_129 ground n2_br2_129 ground vdd_readh ground memorycellh
X2wirel129_ref n2_bl2_129 n2_bl2_130 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer129_ref n2_br2_129 n2_br2_130 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj129_ref ground ground n2_bl2_130 ground n2_br2_130 ground vdd_readh ground memorycellh
X2wirel130_ref n2_bl2_130 n2_bl2_131 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer130_ref n2_br2_130 n2_br2_131 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj130_ref ground ground n2_bl2_131 ground n2_br2_131 ground vdd_readh ground memorycellh
X2wirel131_ref n2_bl2_131 n2_bl2_132 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer131_ref n2_br2_131 n2_br2_132 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj131_ref ground ground n2_bl2_132 ground n2_br2_132 ground vdd_readh ground memorycellh
X2wirel132_ref n2_bl2_132 n2_bl2_133 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer132_ref n2_br2_132 n2_br2_133 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj132_ref ground ground n2_bl2_133 ground n2_br2_133 ground vdd_readh ground memorycellh
X2wirel133_ref n2_bl2_133 n2_bl2_134 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer133_ref n2_br2_133 n2_br2_134 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj133_ref ground ground n2_bl2_134 ground n2_br2_134 ground vdd_readh ground memorycellh
X2wirel134_ref n2_bl2_134 n2_bl2_135 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer134_ref n2_br2_134 n2_br2_135 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj134_ref ground ground n2_bl2_135 ground n2_br2_135 ground vdd_readh ground memorycellh
X2wirel135_ref n2_bl2_135 n2_bl2_136 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer135_ref n2_br2_135 n2_br2_136 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj135_ref ground ground n2_bl2_136 ground n2_br2_136 ground vdd_readh ground memorycellh
X2wirel136_ref n2_bl2_136 n2_bl2_137 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer136_ref n2_br2_136 n2_br2_137 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj136_ref ground ground n2_bl2_137 ground n2_br2_137 ground vdd_readh ground memorycellh
X2wirel137_ref n2_bl2_137 n2_bl2_138 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer137_ref n2_br2_137 n2_br2_138 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj137_ref ground ground n2_bl2_138 ground n2_br2_138 ground vdd_readh ground memorycellh
X2wirel138_ref n2_bl2_138 n2_bl2_139 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer138_ref n2_br2_138 n2_br2_139 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj138_ref ground ground n2_bl2_139 ground n2_br2_139 ground vdd_readh ground memorycellh
X2wirel139_ref n2_bl2_139 n2_bl2_140 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer139_ref n2_br2_139 n2_br2_140 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj139_ref ground ground n2_bl2_140 ground n2_br2_140 ground vdd_readh ground memorycellh
X2wirel140_ref n2_bl2_140 n2_bl2_141 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer140_ref n2_br2_140 n2_br2_141 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj140_ref ground ground n2_bl2_141 ground n2_br2_141 ground vdd_readh ground memorycellh
X2wirel141_ref n2_bl2_141 n2_bl2_142 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer141_ref n2_br2_141 n2_br2_142 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj141_ref ground ground n2_bl2_142 ground n2_br2_142 ground vdd_readh ground memorycellh
X2wirel142_ref n2_bl2_142 n2_bl2_143 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer142_ref n2_br2_142 n2_br2_143 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj142_ref ground ground n2_bl2_143 ground n2_br2_143 ground vdd_readh ground memorycellh
X2wirel143_ref n2_bl2_143 n2_bl2_144 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer143_ref n2_br2_143 n2_br2_144 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj143_ref ground ground n2_bl2_144 ground n2_br2_144 ground vdd_readh ground memorycellh
X2wirel144_ref n2_bl2_144 n2_bl2_145 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer144_ref n2_br2_144 n2_br2_145 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj144_ref ground ground n2_bl2_145 ground n2_br2_145 ground vdd_readh ground memorycellh
X2wirel145_ref n2_bl2_145 n2_bl2_146 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer145_ref n2_br2_145 n2_br2_146 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj145_ref ground ground n2_bl2_146 ground n2_br2_146 ground vdd_readh ground memorycellh
X2wirel146_ref n2_bl2_146 n2_bl2_147 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer146_ref n2_br2_146 n2_br2_147 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj146_ref ground ground n2_bl2_147 ground n2_br2_147 ground vdd_readh ground memorycellh
X2wirel147_ref n2_bl2_147 n2_bl2_148 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer147_ref n2_br2_147 n2_br2_148 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj147_ref ground ground n2_bl2_148 ground n2_br2_148 ground vdd_readh ground memorycellh
X2wirel148_ref n2_bl2_148 n2_bl2_149 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer148_ref n2_br2_148 n2_br2_149 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj148_ref ground ground n2_bl2_149 ground n2_br2_149 ground vdd_readh ground memorycellh
X2wirel149_ref n2_bl2_149 n2_bl2_150 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer149_ref n2_br2_149 n2_br2_150 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj149_ref ground ground n2_bl2_150 ground n2_br2_150 ground vdd_readh ground memorycellh
X2wirel150_ref n2_bl2_150 n2_bl2_151 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer150_ref n2_br2_150 n2_br2_151 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj150_ref ground ground n2_bl2_151 ground n2_br2_151 ground vdd_readh ground memorycellh
X2wirel151_ref n2_bl2_151 n2_bl2_152 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer151_ref n2_br2_151 n2_br2_152 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj151_ref ground ground n2_bl2_152 ground n2_br2_152 ground vdd_readh ground memorycellh
X2wirel152_ref n2_bl2_152 n2_bl2_153 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer152_ref n2_br2_152 n2_br2_153 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj152_ref ground ground n2_bl2_153 ground n2_br2_153 ground vdd_readh ground memorycellh
X2wirel153_ref n2_bl2_153 n2_bl2_154 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer153_ref n2_br2_153 n2_br2_154 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj153_ref ground ground n2_bl2_154 ground n2_br2_154 ground vdd_readh ground memorycellh
X2wirel154_ref n2_bl2_154 n2_bl2_155 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer154_ref n2_br2_154 n2_br2_155 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj154_ref ground ground n2_bl2_155 ground n2_br2_155 ground vdd_readh ground memorycellh
X2wirel155_ref n2_bl2_155 n2_bl2_156 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer155_ref n2_br2_155 n2_br2_156 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj155_ref ground ground n2_bl2_156 ground n2_br2_156 ground vdd_readh ground memorycellh
X2wirel156_ref n2_bl2_156 n2_bl2_157 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer156_ref n2_br2_156 n2_br2_157 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj156_ref ground ground n2_bl2_157 ground n2_br2_157 ground vdd_readh ground memorycellh
X2wirel157_ref n2_bl2_157 n2_bl2_158 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer157_ref n2_br2_157 n2_br2_158 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj157_ref ground ground n2_bl2_158 ground n2_br2_158 ground vdd_readh ground memorycellh
X2wirel158_ref n2_bl2_158 n2_bl2_159 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer158_ref n2_br2_158 n2_br2_159 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj158_ref ground ground n2_bl2_159 ground n2_br2_159 ground vdd_readh ground memorycellh
X2wirel159_ref n2_bl2_159 n2_bl2_160 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer159_ref n2_br2_159 n2_br2_160 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj159_ref ground ground n2_bl2_160 ground n2_br2_160 ground vdd_readh ground memorycellh
X2wirel160_ref n2_bl2_160 n2_bl2_161 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer160_ref n2_br2_160 n2_br2_161 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj160_ref ground ground n2_bl2_161 ground n2_br2_161 ground vdd_readh ground memorycellh
X2wirel161_ref n2_bl2_161 n2_bl2_162 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer161_ref n2_br2_161 n2_br2_162 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj161_ref ground ground n2_bl2_162 ground n2_br2_162 ground vdd_readh ground memorycellh
X2wirel162_ref n2_bl2_162 n2_bl2_163 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer162_ref n2_br2_162 n2_br2_163 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj162_ref ground ground n2_bl2_163 ground n2_br2_163 ground vdd_readh ground memorycellh
X2wirel163_ref n2_bl2_163 n2_bl2_164 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer163_ref n2_br2_163 n2_br2_164 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj163_ref ground ground n2_bl2_164 ground n2_br2_164 ground vdd_readh ground memorycellh
X2wirel164_ref n2_bl2_164 n2_bl2_165 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer164_ref n2_br2_164 n2_br2_165 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj164_ref ground ground n2_bl2_165 ground n2_br2_165 ground vdd_readh ground memorycellh
X2wirel165_ref n2_bl2_165 n2_bl2_166 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer165_ref n2_br2_165 n2_br2_166 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj165_ref ground ground n2_bl2_166 ground n2_br2_166 ground vdd_readh ground memorycellh
X2wirel166_ref n2_bl2_166 n2_bl2_167 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer166_ref n2_br2_166 n2_br2_167 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj166_ref ground ground n2_bl2_167 ground n2_br2_167 ground vdd_readh ground memorycellh
X2wirel167_ref n2_bl2_167 n2_bl2_168 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer167_ref n2_br2_167 n2_br2_168 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj167_ref ground ground n2_bl2_168 ground n2_br2_168 ground vdd_readh ground memorycellh
X2wirel168_ref n2_bl2_168 n2_bl2_169 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer168_ref n2_br2_168 n2_br2_169 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj168_ref ground ground n2_bl2_169 ground n2_br2_169 ground vdd_readh ground memorycellh
X2wirel169_ref n2_bl2_169 n2_bl2_170 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer169_ref n2_br2_169 n2_br2_170 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj169_ref ground ground n2_bl2_170 ground n2_br2_170 ground vdd_readh ground memorycellh
X2wirel170_ref n2_bl2_170 n2_bl2_171 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer170_ref n2_br2_170 n2_br2_171 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj170_ref ground ground n2_bl2_171 ground n2_br2_171 ground vdd_readh ground memorycellh
X2wirel171_ref n2_bl2_171 n2_bl2_172 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer171_ref n2_br2_171 n2_br2_172 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj171_ref ground ground n2_bl2_172 ground n2_br2_172 ground vdd_readh ground memorycellh
X2wirel172_ref n2_bl2_172 n2_bl2_173 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer172_ref n2_br2_172 n2_br2_173 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj172_ref ground ground n2_bl2_173 ground n2_br2_173 ground vdd_readh ground memorycellh
X2wirel173_ref n2_bl2_173 n2_bl2_174 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer173_ref n2_br2_173 n2_br2_174 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj173_ref ground ground n2_bl2_174 ground n2_br2_174 ground vdd_readh ground memorycellh
X2wirel174_ref n2_bl2_174 n2_bl2_175 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer174_ref n2_br2_174 n2_br2_175 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj174_ref ground ground n2_bl2_175 ground n2_br2_175 ground vdd_readh ground memorycellh
X2wirel175_ref n2_bl2_175 n2_bl2_176 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer175_ref n2_br2_175 n2_br2_176 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj175_ref ground ground n2_bl2_176 ground n2_br2_176 ground vdd_readh ground memorycellh
X2wirel176_ref n2_bl2_176 n2_bl2_177 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer176_ref n2_br2_176 n2_br2_177 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj176_ref ground ground n2_bl2_177 ground n2_br2_177 ground vdd_readh ground memorycellh
X2wirel177_ref n2_bl2_177 n2_bl2_178 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer177_ref n2_br2_177 n2_br2_178 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj177_ref ground ground n2_bl2_178 ground n2_br2_178 ground vdd_readh ground memorycellh
X2wirel178_ref n2_bl2_178 n2_bl2_179 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer178_ref n2_br2_178 n2_br2_179 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj178_ref ground ground n2_bl2_179 ground n2_br2_179 ground vdd_readh ground memorycellh
X2wirel179_ref n2_bl2_179 n2_bl2_180 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer179_ref n2_br2_179 n2_br2_180 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj179_ref ground ground n2_bl2_180 ground n2_br2_180 ground vdd_readh ground memorycellh
X2wirel180_ref n2_bl2_180 n2_bl2_181 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer180_ref n2_br2_180 n2_br2_181 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj180_ref ground ground n2_bl2_181 ground n2_br2_181 ground vdd_readh ground memorycellh
X2wirel181_ref n2_bl2_181 n2_bl2_182 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer181_ref n2_br2_181 n2_br2_182 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj181_ref ground ground n2_bl2_182 ground n2_br2_182 ground vdd_readh ground memorycellh
X2wirel182_ref n2_bl2_182 n2_bl2_183 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer182_ref n2_br2_182 n2_br2_183 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj182_ref ground ground n2_bl2_183 ground n2_br2_183 ground vdd_readh ground memorycellh
X2wirel183_ref n2_bl2_183 n2_bl2_184 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer183_ref n2_br2_183 n2_br2_184 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj183_ref ground ground n2_bl2_184 ground n2_br2_184 ground vdd_readh ground memorycellh
X2wirel184_ref n2_bl2_184 n2_bl2_185 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer184_ref n2_br2_184 n2_br2_185 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj184_ref ground ground n2_bl2_185 ground n2_br2_185 ground vdd_readh ground memorycellh
X2wirel185_ref n2_bl2_185 n2_bl2_186 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer185_ref n2_br2_185 n2_br2_186 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj185_ref ground ground n2_bl2_186 ground n2_br2_186 ground vdd_readh ground memorycellh
X2wirel186_ref n2_bl2_186 n2_bl2_187 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer186_ref n2_br2_186 n2_br2_187 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj186_ref ground ground n2_bl2_187 ground n2_br2_187 ground vdd_readh ground memorycellh
X2wirel187_ref n2_bl2_187 n2_bl2_188 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer187_ref n2_br2_187 n2_br2_188 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj187_ref ground ground n2_bl2_188 ground n2_br2_188 ground vdd_readh ground memorycellh
X2wirel188_ref n2_bl2_188 n2_bl2_189 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer188_ref n2_br2_188 n2_br2_189 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj188_ref ground ground n2_bl2_189 ground n2_br2_189 ground vdd_readh ground memorycellh
X2wirel189_ref n2_bl2_189 n2_bl2_190 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer189_ref n2_br2_189 n2_br2_190 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj189_ref ground ground n2_bl2_190 ground n2_br2_190 ground vdd_readh ground memorycellh
X2wirel190_ref n2_bl2_190 n2_bl2_191 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer190_ref n2_br2_190 n2_br2_191 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj190_ref ground ground n2_bl2_191 ground n2_br2_191 ground vdd_readh ground memorycellh
X2wirel191_ref n2_bl2_191 n2_bl2_192 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer191_ref n2_br2_191 n2_br2_192 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj191_ref ground ground n2_bl2_192 ground n2_br2_192 ground vdd_readh ground memorycellh
X2wirel192_ref n2_bl2_192 n2_bl2_193 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer192_ref n2_br2_192 n2_br2_193 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj192_ref ground ground n2_bl2_193 ground n2_br2_193 ground vdd_readh ground memorycellh
X2wirel193_ref n2_bl2_193 n2_bl2_194 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer193_ref n2_br2_193 n2_br2_194 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj193_ref ground ground n2_bl2_194 ground n2_br2_194 ground vdd_readh ground memorycellh
X2wirel194_ref n2_bl2_194 n2_bl2_195 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer194_ref n2_br2_194 n2_br2_195 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj194_ref ground ground n2_bl2_195 ground n2_br2_195 ground vdd_readh ground memorycellh
X2wirel195_ref n2_bl2_195 n2_bl2_196 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer195_ref n2_br2_195 n2_br2_196 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj195_ref ground ground n2_bl2_196 ground n2_br2_196 ground vdd_readh ground memorycellh
X2wirel196_ref n2_bl2_196 n2_bl2_197 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer196_ref n2_br2_196 n2_br2_197 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj196_ref ground ground n2_bl2_197 ground n2_br2_197 ground vdd_readh ground memorycellh
X2wirel197_ref n2_bl2_197 n2_bl2_198 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer197_ref n2_br2_197 n2_br2_198 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj197_ref ground ground n2_bl2_198 ground n2_br2_198 ground vdd_readh ground memorycellh
X2wirel198_ref n2_bl2_198 n2_bl2_199 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer198_ref n2_br2_198 n2_br2_199 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj198_ref ground ground n2_bl2_199 ground n2_br2_199 ground vdd_readh ground memorycellh
X2wirel199_ref n2_bl2_199 n2_bl2_200 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer199_ref n2_br2_199 n2_br2_200 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj199_ref ground ground n2_bl2_200 ground n2_br2_200 ground vdd_readh ground memorycellh
X2wirel200_ref n2_bl2_200 n2_bl2_201 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer200_ref n2_br2_200 n2_br2_201 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj200_ref ground ground n2_bl2_201 ground n2_br2_201 ground vdd_readh ground memorycellh
X2wirel201_ref n2_bl2_201 n2_bl2_202 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer201_ref n2_br2_201 n2_br2_202 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj201_ref ground ground n2_bl2_202 ground n2_br2_202 ground vdd_readh ground memorycellh
X2wirel202_ref n2_bl2_202 n2_bl2_203 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer202_ref n2_br2_202 n2_br2_203 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj202_ref ground ground n2_bl2_203 ground n2_br2_203 ground vdd_readh ground memorycellh
X2wirel203_ref n2_bl2_203 n2_bl2_204 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer203_ref n2_br2_203 n2_br2_204 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj203_ref ground ground n2_bl2_204 ground n2_br2_204 ground vdd_readh ground memorycellh
X2wirel204_ref n2_bl2_204 n2_bl2_205 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer204_ref n2_br2_204 n2_br2_205 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj204_ref ground ground n2_bl2_205 ground n2_br2_205 ground vdd_readh ground memorycellh
X2wirel205_ref n2_bl2_205 n2_bl2_206 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer205_ref n2_br2_205 n2_br2_206 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj205_ref ground ground n2_bl2_206 ground n2_br2_206 ground vdd_readh ground memorycellh
X2wirel206_ref n2_bl2_206 n2_bl2_207 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer206_ref n2_br2_206 n2_br2_207 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj206_ref ground ground n2_bl2_207 ground n2_br2_207 ground vdd_readh ground memorycellh
X2wirel207_ref n2_bl2_207 n2_bl2_208 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer207_ref n2_br2_207 n2_br2_208 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj207_ref ground ground n2_bl2_208 ground n2_br2_208 ground vdd_readh ground memorycellh
X2wirel208_ref n2_bl2_208 n2_bl2_209 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer208_ref n2_br2_208 n2_br2_209 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj208_ref ground ground n2_bl2_209 ground n2_br2_209 ground vdd_readh ground memorycellh
X2wirel209_ref n2_bl2_209 n2_bl2_210 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer209_ref n2_br2_209 n2_br2_210 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj209_ref ground ground n2_bl2_210 ground n2_br2_210 ground vdd_readh ground memorycellh
X2wirel210_ref n2_bl2_210 n2_bl2_211 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer210_ref n2_br2_210 n2_br2_211 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj210_ref ground ground n2_bl2_211 ground n2_br2_211 ground vdd_readh ground memorycellh
X2wirel211_ref n2_bl2_211 n2_bl2_212 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer211_ref n2_br2_211 n2_br2_212 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj211_ref ground ground n2_bl2_212 ground n2_br2_212 ground vdd_readh ground memorycellh
X2wirel212_ref n2_bl2_212 n2_bl2_213 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer212_ref n2_br2_212 n2_br2_213 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj212_ref ground ground n2_bl2_213 ground n2_br2_213 ground vdd_readh ground memorycellh
X2wirel213_ref n2_bl2_213 n2_bl2_214 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer213_ref n2_br2_213 n2_br2_214 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj213_ref ground ground n2_bl2_214 ground n2_br2_214 ground vdd_readh ground memorycellh
X2wirel214_ref n2_bl2_214 n2_bl2_215 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer214_ref n2_br2_214 n2_br2_215 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj214_ref ground ground n2_bl2_215 ground n2_br2_215 ground vdd_readh ground memorycellh
X2wirel215_ref n2_bl2_215 n2_bl2_216 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer215_ref n2_br2_215 n2_br2_216 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj215_ref ground ground n2_bl2_216 ground n2_br2_216 ground vdd_readh ground memorycellh
X2wirel216_ref n2_bl2_216 n2_bl2_217 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer216_ref n2_br2_216 n2_br2_217 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj216_ref ground ground n2_bl2_217 ground n2_br2_217 ground vdd_readh ground memorycellh
X2wirel217_ref n2_bl2_217 n2_bl2_218 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer217_ref n2_br2_217 n2_br2_218 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj217_ref ground ground n2_bl2_218 ground n2_br2_218 ground vdd_readh ground memorycellh
X2wirel218_ref n2_bl2_218 n2_bl2_219 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer218_ref n2_br2_218 n2_br2_219 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj218_ref ground ground n2_bl2_219 ground n2_br2_219 ground vdd_readh ground memorycellh
X2wirel219_ref n2_bl2_219 n2_bl2_220 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer219_ref n2_br2_219 n2_br2_220 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj219_ref ground ground n2_bl2_220 ground n2_br2_220 ground vdd_readh ground memorycellh
X2wirel220_ref n2_bl2_220 n2_bl2_221 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer220_ref n2_br2_220 n2_br2_221 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj220_ref ground ground n2_bl2_221 ground n2_br2_221 ground vdd_readh ground memorycellh
X2wirel221_ref n2_bl2_221 n2_bl2_222 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer221_ref n2_br2_221 n2_br2_222 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj221_ref ground ground n2_bl2_222 ground n2_br2_222 ground vdd_readh ground memorycellh
X2wirel222_ref n2_bl2_222 n2_bl2_223 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer222_ref n2_br2_222 n2_br2_223 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj222_ref ground ground n2_bl2_223 ground n2_br2_223 ground vdd_readh ground memorycellh
X2wirel223_ref n2_bl2_223 n2_bl2_224 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer223_ref n2_br2_223 n2_br2_224 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj223_ref ground ground n2_bl2_224 ground n2_br2_224 ground vdd_readh ground memorycellh
X2wirel224_ref n2_bl2_224 n2_bl2_225 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer224_ref n2_br2_224 n2_br2_225 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj224_ref ground ground n2_bl2_225 ground n2_br2_225 ground vdd_readh ground memorycellh
X2wirel225_ref n2_bl2_225 n2_bl2_226 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer225_ref n2_br2_225 n2_br2_226 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj225_ref ground ground n2_bl2_226 ground n2_br2_226 ground vdd_readh ground memorycellh
X2wirel226_ref n2_bl2_226 n2_bl2_227 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer226_ref n2_br2_226 n2_br2_227 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj226_ref ground ground n2_bl2_227 ground n2_br2_227 ground vdd_readh ground memorycellh
X2wirel227_ref n2_bl2_227 n2_bl2_228 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer227_ref n2_br2_227 n2_br2_228 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj227_ref ground ground n2_bl2_228 ground n2_br2_228 ground vdd_readh ground memorycellh
X2wirel228_ref n2_bl2_228 n2_bl2_229 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer228_ref n2_br2_228 n2_br2_229 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj228_ref ground ground n2_bl2_229 ground n2_br2_229 ground vdd_readh ground memorycellh
X2wirel229_ref n2_bl2_229 n2_bl2_230 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer229_ref n2_br2_229 n2_br2_230 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj229_ref ground ground n2_bl2_230 ground n2_br2_230 ground vdd_readh ground memorycellh
X2wirel230_ref n2_bl2_230 n2_bl2_231 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer230_ref n2_br2_230 n2_br2_231 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj230_ref ground ground n2_bl2_231 ground n2_br2_231 ground vdd_readh ground memorycellh
X2wirel231_ref n2_bl2_231 n2_bl2_232 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer231_ref n2_br2_231 n2_br2_232 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj231_ref ground ground n2_bl2_232 ground n2_br2_232 ground vdd_readh ground memorycellh
X2wirel232_ref n2_bl2_232 n2_bl2_233 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer232_ref n2_br2_232 n2_br2_233 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj232_ref ground ground n2_bl2_233 ground n2_br2_233 ground vdd_readh ground memorycellh
X2wirel233_ref n2_bl2_233 n2_bl2_234 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer233_ref n2_br2_233 n2_br2_234 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj233_ref ground ground n2_bl2_234 ground n2_br2_234 ground vdd_readh ground memorycellh
X2wirel234_ref n2_bl2_234 n2_bl2_235 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer234_ref n2_br2_234 n2_br2_235 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj234_ref ground ground n2_bl2_235 ground n2_br2_235 ground vdd_readh ground memorycellh
X2wirel235_ref n2_bl2_235 n2_bl2_236 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer235_ref n2_br2_235 n2_br2_236 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj235_ref ground ground n2_bl2_236 ground n2_br2_236 ground vdd_readh ground memorycellh
X2wirel236_ref n2_bl2_236 n2_bl2_237 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer236_ref n2_br2_236 n2_br2_237 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj236_ref ground ground n2_bl2_237 ground n2_br2_237 ground vdd_readh ground memorycellh
X2wirel237_ref n2_bl2_237 n2_bl2_238 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer237_ref n2_br2_237 n2_br2_238 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj237_ref ground ground n2_bl2_238 ground n2_br2_238 ground vdd_readh ground memorycellh
X2wirel238_ref n2_bl2_238 n2_bl2_239 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer238_ref n2_br2_238 n2_br2_239 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj238_ref ground ground n2_bl2_239 ground n2_br2_239 ground vdd_readh ground memorycellh
X2wirel239_ref n2_bl2_239 n2_bl2_240 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer239_ref n2_br2_239 n2_br2_240 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj239_ref ground ground n2_bl2_240 ground n2_br2_240 ground vdd_readh ground memorycellh
X2wirel240_ref n2_bl2_240 n2_bl2_241 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer240_ref n2_br2_240 n2_br2_241 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj240_ref ground ground n2_bl2_241 ground n2_br2_241 ground vdd_readh ground memorycellh
X2wirel241_ref n2_bl2_241 n2_bl2_242 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer241_ref n2_br2_241 n2_br2_242 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj241_ref ground ground n2_bl2_242 ground n2_br2_242 ground vdd_readh ground memorycellh
X2wirel242_ref n2_bl2_242 n2_bl2_243 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer242_ref n2_br2_242 n2_br2_243 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj242_ref ground ground n2_bl2_243 ground n2_br2_243 ground vdd_readh ground memorycellh
X2wirel243_ref n2_bl2_243 n2_bl2_244 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer243_ref n2_br2_243 n2_br2_244 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj243_ref ground ground n2_bl2_244 ground n2_br2_244 ground vdd_readh ground memorycellh
X2wirel244_ref n2_bl2_244 n2_bl2_245 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer244_ref n2_br2_244 n2_br2_245 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj244_ref ground ground n2_bl2_245 ground n2_br2_245 ground vdd_readh ground memorycellh
X2wirel245_ref n2_bl2_245 n2_bl2_246 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer245_ref n2_br2_245 n2_br2_246 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj245_ref ground ground n2_bl2_246 ground n2_br2_246 ground vdd_readh ground memorycellh
X2wirel246_ref n2_bl2_246 n2_bl2_247 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer246_ref n2_br2_246 n2_br2_247 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj246_ref ground ground n2_bl2_247 ground n2_br2_247 ground vdd_readh ground memorycellh
X2wirel247_ref n2_bl2_247 n2_bl2_248 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer247_ref n2_br2_247 n2_br2_248 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj247_ref ground ground n2_bl2_248 ground n2_br2_248 ground vdd_readh ground memorycellh
X2wirel248_ref n2_bl2_248 n2_bl2_249 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer248_ref n2_br2_248 n2_br2_249 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj248_ref ground ground n2_bl2_249 ground n2_br2_249 ground vdd_readh ground memorycellh
X2wirel249_ref n2_bl2_249 n2_bl2_250 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer249_ref n2_br2_249 n2_br2_250 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj249_ref ground ground n2_bl2_250 ground n2_br2_250 ground vdd_readh ground memorycellh
X2wirel250_ref n2_bl2_250 n2_bl2_251 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer250_ref n2_br2_250 n2_br2_251 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj250_ref ground ground n2_bl2_251 ground n2_br2_251 ground vdd_readh ground memorycellh
X2wirel251_ref n2_bl2_251 n2_bl2_252 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer251_ref n2_br2_251 n2_br2_252 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj251_ref ground ground n2_bl2_252 ground n2_br2_252 ground vdd_readh ground memorycellh
X2wirel252_ref n2_bl2_252 n2_bl2_253 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer252_ref n2_br2_252 n2_br2_253 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj252_ref ground ground n2_bl2_253 ground n2_br2_253 ground vdd_readh ground memorycellh
X2wirel253_ref n2_bl2_253 n2_bl2_254 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer253_ref n2_br2_253 n2_br2_254 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj253_ref ground ground n2_bl2_254 ground n2_br2_254 ground vdd_readh ground memorycellh
X2wirel254_ref n2_bl2_254 n2_bl2_255 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer254_ref n2_br2_254 n2_br2_255 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj254_ref ground ground n2_bl2_255 ground n2_br2_255 ground vdd_readh ground memorycellh
X2wirel255_ref n2_bl2_255 n2_bl2_256 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer255_ref n2_br2_255 n2_br2_256 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj255_ref ground ground n2_bl2_256 ground n2_br2_256 ground vdd_readh ground memorycellh
X2wirel256_ref n2_bl2_256 n2_bl2_257 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer256_ref n2_br2_256 n2_br2_257 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj256_ref ground ground n2_bl2_257 ground n2_br2_257 ground vdd_readh ground memorycellh
X2wirel257_ref n2_bl2_257 n2_bl2_258 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer257_ref n2_br2_257 n2_br2_258 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj257_ref ground ground n2_bl2_258 ground n2_br2_258 ground vdd_readh ground memorycellh
X2wirel258_ref n2_bl2_258 n2_bl2_259 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer258_ref n2_br2_258 n2_br2_259 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj258_ref ground ground n2_bl2_259 ground n2_br2_259 ground vdd_readh ground memorycellh
X2wirel259_ref n2_bl2_259 n2_bl2_260 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer259_ref n2_br2_259 n2_br2_260 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj259_ref ground ground n2_bl2_260 ground n2_br2_260 ground vdd_readh ground memorycellh
X2wirel260_ref n2_bl2_260 n2_bl2_261 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer260_ref n2_br2_260 n2_br2_261 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj260_ref ground ground n2_bl2_261 ground n2_br2_261 ground vdd_readh ground memorycellh
X2wirel261_ref n2_bl2_261 n2_bl2_262 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer261_ref n2_br2_261 n2_br2_262 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj261_ref ground ground n2_bl2_262 ground n2_br2_262 ground vdd_readh ground memorycellh
X2wirel262_ref n2_bl2_262 n2_bl2_263 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer262_ref n2_br2_262 n2_br2_263 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj262_ref ground ground n2_bl2_263 ground n2_br2_263 ground vdd_readh ground memorycellh
X2wirel263_ref n2_bl2_263 n2_bl2_264 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer263_ref n2_br2_263 n2_br2_264 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj263_ref ground ground n2_bl2_264 ground n2_br2_264 ground vdd_readh ground memorycellh
X2wirel264_ref n2_bl2_264 n2_bl2_265 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer264_ref n2_br2_264 n2_br2_265 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj264_ref ground ground n2_bl2_265 ground n2_br2_265 ground vdd_readh ground memorycellh
X2wirel265_ref n2_bl2_265 n2_bl2_266 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer265_ref n2_br2_265 n2_br2_266 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj265_ref ground ground n2_bl2_266 ground n2_br2_266 ground vdd_readh ground memorycellh
X2wirel266_ref n2_bl2_266 n2_bl2_267 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer266_ref n2_br2_266 n2_br2_267 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj266_ref ground ground n2_bl2_267 ground n2_br2_267 ground vdd_readh ground memorycellh
X2wirel267_ref n2_bl2_267 n2_bl2_268 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer267_ref n2_br2_267 n2_br2_268 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj267_ref ground ground n2_bl2_268 ground n2_br2_268 ground vdd_readh ground memorycellh
X2wirel268_ref n2_bl2_268 n2_bl2_269 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer268_ref n2_br2_268 n2_br2_269 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj268_ref ground ground n2_bl2_269 ground n2_br2_269 ground vdd_readh ground memorycellh
X2wirel269_ref n2_bl2_269 n2_bl2_270 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer269_ref n2_br2_269 n2_br2_270 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj269_ref ground ground n2_bl2_270 ground n2_br2_270 ground vdd_readh ground memorycellh
X2wirel270_ref n2_bl2_270 n2_bl2_271 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer270_ref n2_br2_270 n2_br2_271 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj270_ref ground ground n2_bl2_271 ground n2_br2_271 ground vdd_readh ground memorycellh
X2wirel271_ref n2_bl2_271 n2_bl2_272 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer271_ref n2_br2_271 n2_br2_272 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj271_ref ground ground n2_bl2_272 ground n2_br2_272 ground vdd_readh ground memorycellh
X2wirel272_ref n2_bl2_272 n2_bl2_273 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer272_ref n2_br2_272 n2_br2_273 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj272_ref ground ground n2_bl2_273 ground n2_br2_273 ground vdd_readh ground memorycellh
X2wirel273_ref n2_bl2_273 n2_bl2_274 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer273_ref n2_br2_273 n2_br2_274 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj273_ref ground ground n2_bl2_274 ground n2_br2_274 ground vdd_readh ground memorycellh
X2wirel274_ref n2_bl2_274 n2_bl2_275 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer274_ref n2_br2_274 n2_br2_275 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj274_ref ground ground n2_bl2_275 ground n2_br2_275 ground vdd_readh ground memorycellh
X2wirel275_ref n2_bl2_275 n2_bl2_276 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer275_ref n2_br2_275 n2_br2_276 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj275_ref ground ground n2_bl2_276 ground n2_br2_276 ground vdd_readh ground memorycellh
X2wirel276_ref n2_bl2_276 n2_bl2_277 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer276_ref n2_br2_276 n2_br2_277 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj276_ref ground ground n2_bl2_277 ground n2_br2_277 ground vdd_readh ground memorycellh
X2wirel277_ref n2_bl2_277 n2_bl2_278 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer277_ref n2_br2_277 n2_br2_278 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj277_ref ground ground n2_bl2_278 ground n2_br2_278 ground vdd_readh ground memorycellh
X2wirel278_ref n2_bl2_278 n2_bl2_279 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer278_ref n2_br2_278 n2_br2_279 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj278_ref ground ground n2_bl2_279 ground n2_br2_279 ground vdd_readh ground memorycellh
X2wirel279_ref n2_bl2_279 n2_bl2_280 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer279_ref n2_br2_279 n2_br2_280 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj279_ref ground ground n2_bl2_280 ground n2_br2_280 ground vdd_readh ground memorycellh
X2wirel280_ref n2_bl2_280 n2_bl2_281 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer280_ref n2_br2_280 n2_br2_281 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj280_ref ground ground n2_bl2_281 ground n2_br2_281 ground vdd_readh ground memorycellh
X2wirel281_ref n2_bl2_281 n2_bl2_282 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer281_ref n2_br2_281 n2_br2_282 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj281_ref ground ground n2_bl2_282 ground n2_br2_282 ground vdd_readh ground memorycellh
X2wirel282_ref n2_bl2_282 n2_bl2_283 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer282_ref n2_br2_282 n2_br2_283 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj282_ref ground ground n2_bl2_283 ground n2_br2_283 ground vdd_readh ground memorycellh
X2wirel283_ref n2_bl2_283 n2_bl2_284 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer283_ref n2_br2_283 n2_br2_284 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj283_ref ground ground n2_bl2_284 ground n2_br2_284 ground vdd_readh ground memorycellh
X2wirel284_ref n2_bl2_284 n2_bl2_285 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer284_ref n2_br2_284 n2_br2_285 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj284_ref ground ground n2_bl2_285 ground n2_br2_285 ground vdd_readh ground memorycellh
X2wirel285_ref n2_bl2_285 n2_bl2_286 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer285_ref n2_br2_285 n2_br2_286 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj285_ref ground ground n2_bl2_286 ground n2_br2_286 ground vdd_readh ground memorycellh
X2wirel286_ref n2_bl2_286 n2_bl2_287 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer286_ref n2_br2_286 n2_br2_287 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj286_ref ground ground n2_bl2_287 ground n2_br2_287 ground vdd_readh ground memorycellh
X2wirel287_ref n2_bl2_287 n2_bl2_288 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer287_ref n2_br2_287 n2_br2_288 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj287_ref ground ground n2_bl2_288 ground n2_br2_288 ground vdd_readh ground memorycellh
X2wirel288_ref n2_bl2_288 n2_bl2_289 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer288_ref n2_br2_288 n2_br2_289 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj288_ref ground ground n2_bl2_289 ground n2_br2_289 ground vdd_readh ground memorycellh
X2wirel289_ref n2_bl2_289 n2_bl2_290 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer289_ref n2_br2_289 n2_br2_290 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj289_ref ground ground n2_bl2_290 ground n2_br2_290 ground vdd_readh ground memorycellh
X2wirel290_ref n2_bl2_290 n2_bl2_291 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer290_ref n2_br2_290 n2_br2_291 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj290_ref ground ground n2_bl2_291 ground n2_br2_291 ground vdd_readh ground memorycellh
X2wirel291_ref n2_bl2_291 n2_bl2_292 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer291_ref n2_br2_291 n2_br2_292 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj291_ref ground ground n2_bl2_292 ground n2_br2_292 ground vdd_readh ground memorycellh
X2wirel292_ref n2_bl2_292 n2_bl2_293 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer292_ref n2_br2_292 n2_br2_293 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj292_ref ground ground n2_bl2_293 ground n2_br2_293 ground vdd_readh ground memorycellh
X2wirel293_ref n2_bl2_293 n2_bl2_294 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer293_ref n2_br2_293 n2_br2_294 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj293_ref ground ground n2_bl2_294 ground n2_br2_294 ground vdd_readh ground memorycellh
X2wirel294_ref n2_bl2_294 n2_bl2_295 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer294_ref n2_br2_294 n2_br2_295 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj294_ref ground ground n2_bl2_295 ground n2_br2_295 ground vdd_readh ground memorycellh
X2wirel295_ref n2_bl2_295 n2_bl2_296 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer295_ref n2_br2_295 n2_br2_296 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj295_ref ground ground n2_bl2_296 ground n2_br2_296 ground vdd_readh ground memorycellh
X2wirel296_ref n2_bl2_296 n2_bl2_297 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer296_ref n2_br2_296 n2_br2_297 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj296_ref ground ground n2_bl2_297 ground n2_br2_297 ground vdd_readh ground memorycellh
X2wirel297_ref n2_bl2_297 n2_bl2_298 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer297_ref n2_br2_297 n2_br2_298 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj297_ref ground ground n2_bl2_298 ground n2_br2_298 ground vdd_readh ground memorycellh
X2wirel298_ref n2_bl2_298 n2_bl2_299 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer298_ref n2_br2_298 n2_br2_299 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj298_ref ground ground n2_bl2_299 ground n2_br2_299 ground vdd_readh ground memorycellh
X2wirel299_ref n2_bl2_299 n2_bl2_300 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer299_ref n2_br2_299 n2_br2_300 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj299_ref ground ground n2_bl2_300 ground n2_br2_300 ground vdd_readh ground memorycellh
X2wirel300_ref n2_bl2_300 n2_bl2_301 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer300_ref n2_br2_300 n2_br2_301 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj300_ref ground ground n2_bl2_301 ground n2_br2_301 ground vdd_readh ground memorycellh
X2wirel301_ref n2_bl2_301 n2_bl2_302 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer301_ref n2_br2_301 n2_br2_302 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj301_ref ground ground n2_bl2_302 ground n2_br2_302 ground vdd_readh ground memorycellh
X2wirel302_ref n2_bl2_302 n2_bl2_303 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer302_ref n2_br2_302 n2_br2_303 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj302_ref ground ground n2_bl2_303 ground n2_br2_303 ground vdd_readh ground memorycellh
X2wirel303_ref n2_bl2_303 n2_bl2_304 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer303_ref n2_br2_303 n2_br2_304 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj303_ref ground ground n2_bl2_304 ground n2_br2_304 ground vdd_readh ground memorycellh
X2wirel304_ref n2_bl2_304 n2_bl2_305 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer304_ref n2_br2_304 n2_br2_305 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj304_ref ground ground n2_bl2_305 ground n2_br2_305 ground vdd_readh ground memorycellh
X2wirel305_ref n2_bl2_305 n2_bl2_306 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer305_ref n2_br2_305 n2_br2_306 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj305_ref ground ground n2_bl2_306 ground n2_br2_306 ground vdd_readh ground memorycellh
X2wirel306_ref n2_bl2_306 n2_bl2_307 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer306_ref n2_br2_306 n2_br2_307 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj306_ref ground ground n2_bl2_307 ground n2_br2_307 ground vdd_readh ground memorycellh
X2wirel307_ref n2_bl2_307 n2_bl2_308 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer307_ref n2_br2_307 n2_br2_308 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj307_ref ground ground n2_bl2_308 ground n2_br2_308 ground vdd_readh ground memorycellh
X2wirel308_ref n2_bl2_308 n2_bl2_309 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer308_ref n2_br2_308 n2_br2_309 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj308_ref ground ground n2_bl2_309 ground n2_br2_309 ground vdd_readh ground memorycellh
X2wirel309_ref n2_bl2_309 n2_bl2_310 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer309_ref n2_br2_309 n2_br2_310 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj309_ref ground ground n2_bl2_310 ground n2_br2_310 ground vdd_readh ground memorycellh
X2wirel310_ref n2_bl2_310 n2_bl2_311 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer310_ref n2_br2_310 n2_br2_311 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj310_ref ground ground n2_bl2_311 ground n2_br2_311 ground vdd_readh ground memorycellh
X2wirel311_ref n2_bl2_311 n2_bl2_312 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer311_ref n2_br2_311 n2_br2_312 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj311_ref ground ground n2_bl2_312 ground n2_br2_312 ground vdd_readh ground memorycellh
X2wirel312_ref n2_bl2_312 n2_bl2_313 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer312_ref n2_br2_312 n2_br2_313 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj312_ref ground ground n2_bl2_313 ground n2_br2_313 ground vdd_readh ground memorycellh
X2wirel313_ref n2_bl2_313 n2_bl2_314 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer313_ref n2_br2_313 n2_br2_314 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj313_ref ground ground n2_bl2_314 ground n2_br2_314 ground vdd_readh ground memorycellh
X2wirel314_ref n2_bl2_314 n2_bl2_315 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer314_ref n2_br2_314 n2_br2_315 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj314_ref ground ground n2_bl2_315 ground n2_br2_315 ground vdd_readh ground memorycellh
X2wirel315_ref n2_bl2_315 n2_bl2_316 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer315_ref n2_br2_315 n2_br2_316 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj315_ref ground ground n2_bl2_316 ground n2_br2_316 ground vdd_readh ground memorycellh
X2wirel316_ref n2_bl2_316 n2_bl2_317 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer316_ref n2_br2_316 n2_br2_317 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj316_ref ground ground n2_bl2_317 ground n2_br2_317 ground vdd_readh ground memorycellh
X2wirel317_ref n2_bl2_317 n2_bl2_318 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer317_ref n2_br2_317 n2_br2_318 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj317_ref ground ground n2_bl2_318 ground n2_br2_318 ground vdd_readh ground memorycellh
X2wirel318_ref n2_bl2_318 n2_bl2_319 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer318_ref n2_br2_318 n2_br2_319 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj318_ref ground ground n2_bl2_319 ground n2_br2_319 ground vdd_readh ground memorycellh
X2wirel319_ref n2_bl2_319 n2_bl2_320 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer319_ref n2_br2_319 n2_br2_320 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj319_ref ground ground n2_bl2_320 ground n2_br2_320 ground vdd_readh ground memorycellh
X2wirel320_ref n2_bl2_320 n2_bl2_321 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer320_ref n2_br2_320 n2_br2_321 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj320_ref ground ground n2_bl2_321 ground n2_br2_321 ground vdd_readh ground memorycellh
X2wirel321_ref n2_bl2_321 n2_bl2_322 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer321_ref n2_br2_321 n2_br2_322 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj321_ref ground ground n2_bl2_322 ground n2_br2_322 ground vdd_readh ground memorycellh
X2wirel322_ref n2_bl2_322 n2_bl2_323 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer322_ref n2_br2_322 n2_br2_323 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj322_ref ground ground n2_bl2_323 ground n2_br2_323 ground vdd_readh ground memorycellh
X2wirel323_ref n2_bl2_323 n2_bl2_324 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer323_ref n2_br2_323 n2_br2_324 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj323_ref ground ground n2_bl2_324 ground n2_br2_324 ground vdd_readh ground memorycellh
X2wirel324_ref n2_bl2_324 n2_bl2_325 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer324_ref n2_br2_324 n2_br2_325 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj324_ref ground ground n2_bl2_325 ground n2_br2_325 ground vdd_readh ground memorycellh
X2wirel325_ref n2_bl2_325 n2_bl2_326 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer325_ref n2_br2_325 n2_br2_326 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj325_ref ground ground n2_bl2_326 ground n2_br2_326 ground vdd_readh ground memorycellh
X2wirel326_ref n2_bl2_326 n2_bl2_327 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer326_ref n2_br2_326 n2_br2_327 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj326_ref ground ground n2_bl2_327 ground n2_br2_327 ground vdd_readh ground memorycellh
X2wirel327_ref n2_bl2_327 n2_bl2_328 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer327_ref n2_br2_327 n2_br2_328 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj327_ref ground ground n2_bl2_328 ground n2_br2_328 ground vdd_readh ground memorycellh
X2wirel328_ref n2_bl2_328 n2_bl2_329 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer328_ref n2_br2_328 n2_br2_329 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj328_ref ground ground n2_bl2_329 ground n2_br2_329 ground vdd_readh ground memorycellh
X2wirel329_ref n2_bl2_329 n2_bl2_330 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer329_ref n2_br2_329 n2_br2_330 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj329_ref ground ground n2_bl2_330 ground n2_br2_330 ground vdd_readh ground memorycellh
X2wirel330_ref n2_bl2_330 n2_bl2_331 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer330_ref n2_br2_330 n2_br2_331 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj330_ref ground ground n2_bl2_331 ground n2_br2_331 ground vdd_readh ground memorycellh
X2wirel331_ref n2_bl2_331 n2_bl2_332 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer331_ref n2_br2_331 n2_br2_332 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj331_ref ground ground n2_bl2_332 ground n2_br2_332 ground vdd_readh ground memorycellh
X2wirel332_ref n2_bl2_332 n2_bl2_333 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer332_ref n2_br2_332 n2_br2_333 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj332_ref ground ground n2_bl2_333 ground n2_br2_333 ground vdd_readh ground memorycellh
X2wirel333_ref n2_bl2_333 n2_bl2_334 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer333_ref n2_br2_333 n2_br2_334 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj333_ref ground ground n2_bl2_334 ground n2_br2_334 ground vdd_readh ground memorycellh
X2wirel334_ref n2_bl2_334 n2_bl2_335 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer334_ref n2_br2_334 n2_br2_335 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj334_ref ground ground n2_bl2_335 ground n2_br2_335 ground vdd_readh ground memorycellh
X2wirel335_ref n2_bl2_335 n2_bl2_336 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer335_ref n2_br2_335 n2_br2_336 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj335_ref ground ground n2_bl2_336 ground n2_br2_336 ground vdd_readh ground memorycellh
X2wirel336_ref n2_bl2_336 n2_bl2_337 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer336_ref n2_br2_336 n2_br2_337 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj336_ref ground ground n2_bl2_337 ground n2_br2_337 ground vdd_readh ground memorycellh
X2wirel337_ref n2_bl2_337 n2_bl2_338 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer337_ref n2_br2_337 n2_br2_338 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj337_ref ground ground n2_bl2_338 ground n2_br2_338 ground vdd_readh ground memorycellh
X2wirel338_ref n2_bl2_338 n2_bl2_339 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer338_ref n2_br2_338 n2_br2_339 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj338_ref ground ground n2_bl2_339 ground n2_br2_339 ground vdd_readh ground memorycellh
X2wirel339_ref n2_bl2_339 n2_bl2_340 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer339_ref n2_br2_339 n2_br2_340 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj339_ref ground ground n2_bl2_340 ground n2_br2_340 ground vdd_readh ground memorycellh
X2wirel340_ref n2_bl2_340 n2_bl2_341 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer340_ref n2_br2_340 n2_br2_341 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj340_ref ground ground n2_bl2_341 ground n2_br2_341 ground vdd_readh ground memorycellh
X2wirel341_ref n2_bl2_341 n2_bl2_342 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer341_ref n2_br2_341 n2_br2_342 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj341_ref ground ground n2_bl2_342 ground n2_br2_342 ground vdd_readh ground memorycellh
X2wirel342_ref n2_bl2_342 n2_bl2_343 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer342_ref n2_br2_342 n2_br2_343 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj342_ref ground ground n2_bl2_343 ground n2_br2_343 ground vdd_readh ground memorycellh
X2wirel343_ref n2_bl2_343 n2_bl2_344 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer343_ref n2_br2_343 n2_br2_344 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj343_ref ground ground n2_bl2_344 ground n2_br2_344 ground vdd_readh ground memorycellh
X2wirel344_ref n2_bl2_344 n2_bl2_345 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer344_ref n2_br2_344 n2_br2_345 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj344_ref ground ground n2_bl2_345 ground n2_br2_345 ground vdd_readh ground memorycellh
X2wirel345_ref n2_bl2_345 n2_bl2_346 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer345_ref n2_br2_345 n2_br2_346 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj345_ref ground ground n2_bl2_346 ground n2_br2_346 ground vdd_readh ground memorycellh
X2wirel346_ref n2_bl2_346 n2_bl2_347 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer346_ref n2_br2_346 n2_br2_347 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj346_ref ground ground n2_bl2_347 ground n2_br2_347 ground vdd_readh ground memorycellh
X2wirel347_ref n2_bl2_347 n2_bl2_348 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer347_ref n2_br2_347 n2_br2_348 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj347_ref ground ground n2_bl2_348 ground n2_br2_348 ground vdd_readh ground memorycellh
X2wirel348_ref n2_bl2_348 n2_bl2_349 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer348_ref n2_br2_348 n2_br2_349 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj348_ref ground ground n2_bl2_349 ground n2_br2_349 ground vdd_readh ground memorycellh
X2wirel349_ref n2_bl2_349 n2_bl2_350 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer349_ref n2_br2_349 n2_br2_350 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj349_ref ground ground n2_bl2_350 ground n2_br2_350 ground vdd_readh ground memorycellh
X2wirel350_ref n2_bl2_350 n2_bl2_351 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer350_ref n2_br2_350 n2_br2_351 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj350_ref ground ground n2_bl2_351 ground n2_br2_351 ground vdd_readh ground memorycellh
X2wirel351_ref n2_bl2_351 n2_bl2_352 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer351_ref n2_br2_351 n2_br2_352 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj351_ref ground ground n2_bl2_352 ground n2_br2_352 ground vdd_readh ground memorycellh
X2wirel352_ref n2_bl2_352 n2_bl2_353 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer352_ref n2_br2_352 n2_br2_353 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj352_ref ground ground n2_bl2_353 ground n2_br2_353 ground vdd_readh ground memorycellh
X2wirel353_ref n2_bl2_353 n2_bl2_354 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer353_ref n2_br2_353 n2_br2_354 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj353_ref ground ground n2_bl2_354 ground n2_br2_354 ground vdd_readh ground memorycellh
X2wirel354_ref n2_bl2_354 n2_bl2_355 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer354_ref n2_br2_354 n2_br2_355 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj354_ref ground ground n2_bl2_355 ground n2_br2_355 ground vdd_readh ground memorycellh
X2wirel355_ref n2_bl2_355 n2_bl2_356 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer355_ref n2_br2_355 n2_br2_356 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj355_ref ground ground n2_bl2_356 ground n2_br2_356 ground vdd_readh ground memorycellh
X2wirel356_ref n2_bl2_356 n2_bl2_357 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer356_ref n2_br2_356 n2_br2_357 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj356_ref ground ground n2_bl2_357 ground n2_br2_357 ground vdd_readh ground memorycellh
X2wirel357_ref n2_bl2_357 n2_bl2_358 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer357_ref n2_br2_357 n2_br2_358 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj357_ref ground ground n2_bl2_358 ground n2_br2_358 ground vdd_readh ground memorycellh
X2wirel358_ref n2_bl2_358 n2_bl2_359 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer358_ref n2_br2_358 n2_br2_359 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj358_ref ground ground n2_bl2_359 ground n2_br2_359 ground vdd_readh ground memorycellh
X2wirel359_ref n2_bl2_359 n2_bl2_360 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer359_ref n2_br2_359 n2_br2_360 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj359_ref ground ground n2_bl2_360 ground n2_br2_360 ground vdd_readh ground memorycellh
X2wirel360_ref n2_bl2_360 n2_bl2_361 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer360_ref n2_br2_360 n2_br2_361 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj360_ref ground ground n2_bl2_361 ground n2_br2_361 ground vdd_readh ground memorycellh
X2wirel361_ref n2_bl2_361 n2_bl2_362 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer361_ref n2_br2_361 n2_br2_362 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj361_ref ground ground n2_bl2_362 ground n2_br2_362 ground vdd_readh ground memorycellh
X2wirel362_ref n2_bl2_362 n2_bl2_363 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer362_ref n2_br2_362 n2_br2_363 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj362_ref ground ground n2_bl2_363 ground n2_br2_363 ground vdd_readh ground memorycellh
X2wirel363_ref n2_bl2_363 n2_bl2_364 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer363_ref n2_br2_363 n2_br2_364 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj363_ref ground ground n2_bl2_364 ground n2_br2_364 ground vdd_readh ground memorycellh
X2wirel364_ref n2_bl2_364 n2_bl2_365 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer364_ref n2_br2_364 n2_br2_365 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj364_ref ground ground n2_bl2_365 ground n2_br2_365 ground vdd_readh ground memorycellh
X2wirel365_ref n2_bl2_365 n2_bl2_366 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer365_ref n2_br2_365 n2_br2_366 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj365_ref ground ground n2_bl2_366 ground n2_br2_366 ground vdd_readh ground memorycellh
X2wirel366_ref n2_bl2_366 n2_bl2_367 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer366_ref n2_br2_366 n2_br2_367 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj366_ref ground ground n2_bl2_367 ground n2_br2_367 ground vdd_readh ground memorycellh
X2wirel367_ref n2_bl2_367 n2_bl2_368 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer367_ref n2_br2_367 n2_br2_368 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj367_ref ground ground n2_bl2_368 ground n2_br2_368 ground vdd_readh ground memorycellh
X2wirel368_ref n2_bl2_368 n2_bl2_369 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer368_ref n2_br2_368 n2_br2_369 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj368_ref ground ground n2_bl2_369 ground n2_br2_369 ground vdd_readh ground memorycellh
X2wirel369_ref n2_bl2_369 n2_bl2_370 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer369_ref n2_br2_369 n2_br2_370 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj369_ref ground ground n2_bl2_370 ground n2_br2_370 ground vdd_readh ground memorycellh
X2wirel370_ref n2_bl2_370 n2_bl2_371 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer370_ref n2_br2_370 n2_br2_371 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj370_ref ground ground n2_bl2_371 ground n2_br2_371 ground vdd_readh ground memorycellh
X2wirel371_ref n2_bl2_371 n2_bl2_372 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer371_ref n2_br2_371 n2_br2_372 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj371_ref ground ground n2_bl2_372 ground n2_br2_372 ground vdd_readh ground memorycellh
X2wirel372_ref n2_bl2_372 n2_bl2_373 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer372_ref n2_br2_372 n2_br2_373 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj372_ref ground ground n2_bl2_373 ground n2_br2_373 ground vdd_readh ground memorycellh
X2wirel373_ref n2_bl2_373 n2_bl2_374 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer373_ref n2_br2_373 n2_br2_374 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj373_ref ground ground n2_bl2_374 ground n2_br2_374 ground vdd_readh ground memorycellh
X2wirel374_ref n2_bl2_374 n2_bl2_375 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer374_ref n2_br2_374 n2_br2_375 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj374_ref ground ground n2_bl2_375 ground n2_br2_375 ground vdd_readh ground memorycellh
X2wirel375_ref n2_bl2_375 n2_bl2_376 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer375_ref n2_br2_375 n2_br2_376 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj375_ref ground ground n2_bl2_376 ground n2_br2_376 ground vdd_readh ground memorycellh
X2wirel376_ref n2_bl2_376 n2_bl2_377 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer376_ref n2_br2_376 n2_br2_377 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj376_ref ground ground n2_bl2_377 ground n2_br2_377 ground vdd_readh ground memorycellh
X2wirel377_ref n2_bl2_377 n2_bl2_378 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer377_ref n2_br2_377 n2_br2_378 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj377_ref ground ground n2_bl2_378 ground n2_br2_378 ground vdd_readh ground memorycellh
X2wirel378_ref n2_bl2_378 n2_bl2_379 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer378_ref n2_br2_378 n2_br2_379 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj378_ref ground ground n2_bl2_379 ground n2_br2_379 ground vdd_readh ground memorycellh
X2wirel379_ref n2_bl2_379 n2_bl2_380 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer379_ref n2_br2_379 n2_br2_380 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj379_ref ground ground n2_bl2_380 ground n2_br2_380 ground vdd_readh ground memorycellh
X2wirel380_ref n2_bl2_380 n2_bl2_381 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer380_ref n2_br2_380 n2_br2_381 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj380_ref ground ground n2_bl2_381 ground n2_br2_381 ground vdd_readh ground memorycellh
X2wirel381_ref n2_bl2_381 n2_bl2_382 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer381_ref n2_br2_381 n2_br2_382 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj381_ref ground ground n2_bl2_382 ground n2_br2_382 ground vdd_readh ground memorycellh
X2wirel382_ref n2_bl2_382 n2_bl2_383 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer382_ref n2_br2_382 n2_br2_383 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj382_ref ground ground n2_bl2_383 ground n2_br2_383 ground vdd_readh ground memorycellh
X2wirel383_ref n2_bl2_383 n2_bl2_384 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer383_ref n2_br2_383 n2_br2_384 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj383_ref ground ground n2_bl2_384 ground n2_br2_384 ground vdd_readh ground memorycellh
X2wirel384_ref n2_bl2_384 n2_bl2_385 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer384_ref n2_br2_384 n2_br2_385 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj384_ref ground ground n2_bl2_385 ground n2_br2_385 ground vdd_readh ground memorycellh
X2wirel385_ref n2_bl2_385 n2_bl2_386 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer385_ref n2_br2_385 n2_br2_386 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj385_ref ground ground n2_bl2_386 ground n2_br2_386 ground vdd_readh ground memorycellh
X2wirel386_ref n2_bl2_386 n2_bl2_387 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer386_ref n2_br2_386 n2_br2_387 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj386_ref ground ground n2_bl2_387 ground n2_br2_387 ground vdd_readh ground memorycellh
X2wirel387_ref n2_bl2_387 n2_bl2_388 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer387_ref n2_br2_387 n2_br2_388 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj387_ref ground ground n2_bl2_388 ground n2_br2_388 ground vdd_readh ground memorycellh
X2wirel388_ref n2_bl2_388 n2_bl2_389 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer388_ref n2_br2_388 n2_br2_389 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj388_ref ground ground n2_bl2_389 ground n2_br2_389 ground vdd_readh ground memorycellh
X2wirel389_ref n2_bl2_389 n2_bl2_390 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer389_ref n2_br2_389 n2_br2_390 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj389_ref ground ground n2_bl2_390 ground n2_br2_390 ground vdd_readh ground memorycellh
X2wirel390_ref n2_bl2_390 n2_bl2_391 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer390_ref n2_br2_390 n2_br2_391 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj390_ref ground ground n2_bl2_391 ground n2_br2_391 ground vdd_readh ground memorycellh
X2wirel391_ref n2_bl2_391 n2_bl2_392 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer391_ref n2_br2_391 n2_br2_392 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj391_ref ground ground n2_bl2_392 ground n2_br2_392 ground vdd_readh ground memorycellh
X2wirel392_ref n2_bl2_392 n2_bl2_393 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer392_ref n2_br2_392 n2_br2_393 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj392_ref ground ground n2_bl2_393 ground n2_br2_393 ground vdd_readh ground memorycellh
X2wirel393_ref n2_bl2_393 n2_bl2_394 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer393_ref n2_br2_393 n2_br2_394 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj393_ref ground ground n2_bl2_394 ground n2_br2_394 ground vdd_readh ground memorycellh
X2wirel394_ref n2_bl2_394 n2_bl2_395 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer394_ref n2_br2_394 n2_br2_395 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj394_ref ground ground n2_bl2_395 ground n2_br2_395 ground vdd_readh ground memorycellh
X2wirel395_ref n2_bl2_395 n2_bl2_396 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer395_ref n2_br2_395 n2_br2_396 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj395_ref ground ground n2_bl2_396 ground n2_br2_396 ground vdd_readh ground memorycellh
X2wirel396_ref n2_bl2_396 n2_bl2_397 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer396_ref n2_br2_396 n2_br2_397 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj396_ref ground ground n2_bl2_397 ground n2_br2_397 ground vdd_readh ground memorycellh
X2wirel397_ref n2_bl2_397 n2_bl2_398 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer397_ref n2_br2_397 n2_br2_398 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj397_ref ground ground n2_bl2_398 ground n2_br2_398 ground vdd_readh ground memorycellh
X2wirel398_ref n2_bl2_398 n2_bl2_399 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer398_ref n2_br2_398 n2_br2_399 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj398_ref ground ground n2_bl2_399 ground n2_br2_399 ground vdd_readh ground memorycellh
X2wirel399_ref n2_bl2_399 n2_bl2_400 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer399_ref n2_br2_399 n2_br2_400 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj399_ref ground ground n2_bl2_400 ground n2_br2_400 ground vdd_readh ground memorycellh
X2wirel400_ref n2_bl2_400 n2_bl2_401 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer400_ref n2_br2_400 n2_br2_401 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj400_ref ground ground n2_bl2_401 ground n2_br2_401 ground vdd_readh ground memorycellh
X2wirel401_ref n2_bl2_401 n2_bl2_402 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer401_ref n2_br2_401 n2_br2_402 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj401_ref ground ground n2_bl2_402 ground n2_br2_402 ground vdd_readh ground memorycellh
X2wirel402_ref n2_bl2_402 n2_bl2_403 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer402_ref n2_br2_402 n2_br2_403 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj402_ref ground ground n2_bl2_403 ground n2_br2_403 ground vdd_readh ground memorycellh
X2wirel403_ref n2_bl2_403 n2_bl2_404 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer403_ref n2_br2_403 n2_br2_404 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj403_ref ground ground n2_bl2_404 ground n2_br2_404 ground vdd_readh ground memorycellh
X2wirel404_ref n2_bl2_404 n2_bl2_405 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer404_ref n2_br2_404 n2_br2_405 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj404_ref ground ground n2_bl2_405 ground n2_br2_405 ground vdd_readh ground memorycellh
X2wirel405_ref n2_bl2_405 n2_bl2_406 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer405_ref n2_br2_405 n2_br2_406 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj405_ref ground ground n2_bl2_406 ground n2_br2_406 ground vdd_readh ground memorycellh
X2wirel406_ref n2_bl2_406 n2_bl2_407 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer406_ref n2_br2_406 n2_br2_407 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj406_ref ground ground n2_bl2_407 ground n2_br2_407 ground vdd_readh ground memorycellh
X2wirel407_ref n2_bl2_407 n2_bl2_408 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer407_ref n2_br2_407 n2_br2_408 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj407_ref ground ground n2_bl2_408 ground n2_br2_408 ground vdd_readh ground memorycellh
X2wirel408_ref n2_bl2_408 n2_bl2_409 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer408_ref n2_br2_408 n2_br2_409 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj408_ref ground ground n2_bl2_409 ground n2_br2_409 ground vdd_readh ground memorycellh
X2wirel409_ref n2_bl2_409 n2_bl2_410 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer409_ref n2_br2_409 n2_br2_410 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj409_ref ground ground n2_bl2_410 ground n2_br2_410 ground vdd_readh ground memorycellh
X2wirel410_ref n2_bl2_410 n2_bl2_411 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer410_ref n2_br2_410 n2_br2_411 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj410_ref ground ground n2_bl2_411 ground n2_br2_411 ground vdd_readh ground memorycellh
X2wirel411_ref n2_bl2_411 n2_bl2_412 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer411_ref n2_br2_411 n2_br2_412 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj411_ref ground ground n2_bl2_412 ground n2_br2_412 ground vdd_readh ground memorycellh
X2wirel412_ref n2_bl2_412 n2_bl2_413 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer412_ref n2_br2_412 n2_br2_413 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj412_ref ground ground n2_bl2_413 ground n2_br2_413 ground vdd_readh ground memorycellh
X2wirel413_ref n2_bl2_413 n2_bl2_414 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer413_ref n2_br2_413 n2_br2_414 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj413_ref ground ground n2_bl2_414 ground n2_br2_414 ground vdd_readh ground memorycellh
X2wirel414_ref n2_bl2_414 n2_bl2_415 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer414_ref n2_br2_414 n2_br2_415 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj414_ref ground ground n2_bl2_415 ground n2_br2_415 ground vdd_readh ground memorycellh
X2wirel415_ref n2_bl2_415 n2_bl2_416 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer415_ref n2_br2_415 n2_br2_416 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj415_ref ground ground n2_bl2_416 ground n2_br2_416 ground vdd_readh ground memorycellh
X2wirel416_ref n2_bl2_416 n2_bl2_417 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer416_ref n2_br2_416 n2_br2_417 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj416_ref ground ground n2_bl2_417 ground n2_br2_417 ground vdd_readh ground memorycellh
X2wirel417_ref n2_bl2_417 n2_bl2_418 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer417_ref n2_br2_417 n2_br2_418 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj417_ref ground ground n2_bl2_418 ground n2_br2_418 ground vdd_readh ground memorycellh
X2wirel418_ref n2_bl2_418 n2_bl2_419 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer418_ref n2_br2_418 n2_br2_419 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj418_ref ground ground n2_bl2_419 ground n2_br2_419 ground vdd_readh ground memorycellh
X2wirel419_ref n2_bl2_419 n2_bl2_420 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer419_ref n2_br2_419 n2_br2_420 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj419_ref ground ground n2_bl2_420 ground n2_br2_420 ground vdd_readh ground memorycellh
X2wirel420_ref n2_bl2_420 n2_bl2_421 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer420_ref n2_br2_420 n2_br2_421 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj420_ref ground ground n2_bl2_421 ground n2_br2_421 ground vdd_readh ground memorycellh
X2wirel421_ref n2_bl2_421 n2_bl2_422 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer421_ref n2_br2_421 n2_br2_422 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj421_ref ground ground n2_bl2_422 ground n2_br2_422 ground vdd_readh ground memorycellh
X2wirel422_ref n2_bl2_422 n2_bl2_423 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer422_ref n2_br2_422 n2_br2_423 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj422_ref ground ground n2_bl2_423 ground n2_br2_423 ground vdd_readh ground memorycellh
X2wirel423_ref n2_bl2_423 n2_bl2_424 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer423_ref n2_br2_423 n2_br2_424 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj423_ref ground ground n2_bl2_424 ground n2_br2_424 ground vdd_readh ground memorycellh
X2wirel424_ref n2_bl2_424 n2_bl2_425 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer424_ref n2_br2_424 n2_br2_425 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj424_ref ground ground n2_bl2_425 ground n2_br2_425 ground vdd_readh ground memorycellh
X2wirel425_ref n2_bl2_425 n2_bl2_426 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer425_ref n2_br2_425 n2_br2_426 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj425_ref ground ground n2_bl2_426 ground n2_br2_426 ground vdd_readh ground memorycellh
X2wirel426_ref n2_bl2_426 n2_bl2_427 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer426_ref n2_br2_426 n2_br2_427 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj426_ref ground ground n2_bl2_427 ground n2_br2_427 ground vdd_readh ground memorycellh
X2wirel427_ref n2_bl2_427 n2_bl2_428 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer427_ref n2_br2_427 n2_br2_428 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj427_ref ground ground n2_bl2_428 ground n2_br2_428 ground vdd_readh ground memorycellh
X2wirel428_ref n2_bl2_428 n2_bl2_429 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer428_ref n2_br2_428 n2_br2_429 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj428_ref ground ground n2_bl2_429 ground n2_br2_429 ground vdd_readh ground memorycellh
X2wirel429_ref n2_bl2_429 n2_bl2_430 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer429_ref n2_br2_429 n2_br2_430 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj429_ref ground ground n2_bl2_430 ground n2_br2_430 ground vdd_readh ground memorycellh
X2wirel430_ref n2_bl2_430 n2_bl2_431 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer430_ref n2_br2_430 n2_br2_431 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj430_ref ground ground n2_bl2_431 ground n2_br2_431 ground vdd_readh ground memorycellh
X2wirel431_ref n2_bl2_431 n2_bl2_432 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer431_ref n2_br2_431 n2_br2_432 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj431_ref ground ground n2_bl2_432 ground n2_br2_432 ground vdd_readh ground memorycellh
X2wirel432_ref n2_bl2_432 n2_bl2_433 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer432_ref n2_br2_432 n2_br2_433 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj432_ref ground ground n2_bl2_433 ground n2_br2_433 ground vdd_readh ground memorycellh
X2wirel433_ref n2_bl2_433 n2_bl2_434 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer433_ref n2_br2_433 n2_br2_434 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj433_ref ground ground n2_bl2_434 ground n2_br2_434 ground vdd_readh ground memorycellh
X2wirel434_ref n2_bl2_434 n2_bl2_435 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer434_ref n2_br2_434 n2_br2_435 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj434_ref ground ground n2_bl2_435 ground n2_br2_435 ground vdd_readh ground memorycellh
X2wirel435_ref n2_bl2_435 n2_bl2_436 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer435_ref n2_br2_435 n2_br2_436 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj435_ref ground ground n2_bl2_436 ground n2_br2_436 ground vdd_readh ground memorycellh
X2wirel436_ref n2_bl2_436 n2_bl2_437 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer436_ref n2_br2_436 n2_br2_437 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj436_ref ground ground n2_bl2_437 ground n2_br2_437 ground vdd_readh ground memorycellh
X2wirel437_ref n2_bl2_437 n2_bl2_438 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer437_ref n2_br2_437 n2_br2_438 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj437_ref ground ground n2_bl2_438 ground n2_br2_438 ground vdd_readh ground memorycellh
X2wirel438_ref n2_bl2_438 n2_bl2_439 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer438_ref n2_br2_438 n2_br2_439 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj438_ref ground ground n2_bl2_439 ground n2_br2_439 ground vdd_readh ground memorycellh
X2wirel439_ref n2_bl2_439 n2_bl2_440 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer439_ref n2_br2_439 n2_br2_440 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj439_ref ground ground n2_bl2_440 ground n2_br2_440 ground vdd_readh ground memorycellh
X2wirel440_ref n2_bl2_440 n2_bl2_441 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer440_ref n2_br2_440 n2_br2_441 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj440_ref ground ground n2_bl2_441 ground n2_br2_441 ground vdd_readh ground memorycellh
X2wirel441_ref n2_bl2_441 n2_bl2_442 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer441_ref n2_br2_441 n2_br2_442 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj441_ref ground ground n2_bl2_442 ground n2_br2_442 ground vdd_readh ground memorycellh
X2wirel442_ref n2_bl2_442 n2_bl2_443 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer442_ref n2_br2_442 n2_br2_443 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj442_ref ground ground n2_bl2_443 ground n2_br2_443 ground vdd_readh ground memorycellh
X2wirel443_ref n2_bl2_443 n2_bl2_444 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer443_ref n2_br2_443 n2_br2_444 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj443_ref ground ground n2_bl2_444 ground n2_br2_444 ground vdd_readh ground memorycellh
X2wirel444_ref n2_bl2_444 n2_bl2_445 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer444_ref n2_br2_444 n2_br2_445 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj444_ref ground ground n2_bl2_445 ground n2_br2_445 ground vdd_readh ground memorycellh
X2wirel445_ref n2_bl2_445 n2_bl2_446 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer445_ref n2_br2_445 n2_br2_446 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj445_ref ground ground n2_bl2_446 ground n2_br2_446 ground vdd_readh ground memorycellh
X2wirel446_ref n2_bl2_446 n2_bl2_447 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer446_ref n2_br2_446 n2_br2_447 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj446_ref ground ground n2_bl2_447 ground n2_br2_447 ground vdd_readh ground memorycellh
X2wirel447_ref n2_bl2_447 n2_bl2_448 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer447_ref n2_br2_447 n2_br2_448 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj447_ref ground ground n2_bl2_448 ground n2_br2_448 ground vdd_readh ground memorycellh
X2wirel448_ref n2_bl2_448 n2_bl2_449 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer448_ref n2_br2_448 n2_br2_449 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj448_ref ground ground n2_bl2_449 ground n2_br2_449 ground vdd_readh ground memorycellh
X2wirel449_ref n2_bl2_449 n2_bl2_450 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer449_ref n2_br2_449 n2_br2_450 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj449_ref ground ground n2_bl2_450 ground n2_br2_450 ground vdd_readh ground memorycellh
X2wirel450_ref n2_bl2_450 n2_bl2_451 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer450_ref n2_br2_450 n2_br2_451 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj450_ref ground ground n2_bl2_451 ground n2_br2_451 ground vdd_readh ground memorycellh
X2wirel451_ref n2_bl2_451 n2_bl2_452 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer451_ref n2_br2_451 n2_br2_452 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj451_ref ground ground n2_bl2_452 ground n2_br2_452 ground vdd_readh ground memorycellh
X2wirel452_ref n2_bl2_452 n2_bl2_453 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer452_ref n2_br2_452 n2_br2_453 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj452_ref ground ground n2_bl2_453 ground n2_br2_453 ground vdd_readh ground memorycellh
X2wirel453_ref n2_bl2_453 n2_bl2_454 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer453_ref n2_br2_453 n2_br2_454 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj453_ref ground ground n2_bl2_454 ground n2_br2_454 ground vdd_readh ground memorycellh
X2wirel454_ref n2_bl2_454 n2_bl2_455 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer454_ref n2_br2_454 n2_br2_455 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj454_ref ground ground n2_bl2_455 ground n2_br2_455 ground vdd_readh ground memorycellh
X2wirel455_ref n2_bl2_455 n2_bl2_456 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer455_ref n2_br2_455 n2_br2_456 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj455_ref ground ground n2_bl2_456 ground n2_br2_456 ground vdd_readh ground memorycellh
X2wirel456_ref n2_bl2_456 n2_bl2_457 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer456_ref n2_br2_456 n2_br2_457 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj456_ref ground ground n2_bl2_457 ground n2_br2_457 ground vdd_readh ground memorycellh
X2wirel457_ref n2_bl2_457 n2_bl2_458 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer457_ref n2_br2_457 n2_br2_458 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj457_ref ground ground n2_bl2_458 ground n2_br2_458 ground vdd_readh ground memorycellh
X2wirel458_ref n2_bl2_458 n2_bl2_459 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer458_ref n2_br2_458 n2_br2_459 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj458_ref ground ground n2_bl2_459 ground n2_br2_459 ground vdd_readh ground memorycellh
X2wirel459_ref n2_bl2_459 n2_bl2_460 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer459_ref n2_br2_459 n2_br2_460 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj459_ref ground ground n2_bl2_460 ground n2_br2_460 ground vdd_readh ground memorycellh
X2wirel460_ref n2_bl2_460 n2_bl2_461 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer460_ref n2_br2_460 n2_br2_461 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj460_ref ground ground n2_bl2_461 ground n2_br2_461 ground vdd_readh ground memorycellh
X2wirel461_ref n2_bl2_461 n2_bl2_462 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer461_ref n2_br2_461 n2_br2_462 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj461_ref ground ground n2_bl2_462 ground n2_br2_462 ground vdd_readh ground memorycellh
X2wirel462_ref n2_bl2_462 n2_bl2_463 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer462_ref n2_br2_462 n2_br2_463 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj462_ref ground ground n2_bl2_463 ground n2_br2_463 ground vdd_readh ground memorycellh
X2wirel463_ref n2_bl2_463 n2_bl2_464 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer463_ref n2_br2_463 n2_br2_464 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj463_ref ground ground n2_bl2_464 ground n2_br2_464 ground vdd_readh ground memorycellh
X2wirel464_ref n2_bl2_464 n2_bl2_465 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer464_ref n2_br2_464 n2_br2_465 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj464_ref ground ground n2_bl2_465 ground n2_br2_465 ground vdd_readh ground memorycellh
X2wirel465_ref n2_bl2_465 n2_bl2_466 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer465_ref n2_br2_465 n2_br2_466 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj465_ref ground ground n2_bl2_466 ground n2_br2_466 ground vdd_readh ground memorycellh
X2wirel466_ref n2_bl2_466 n2_bl2_467 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer466_ref n2_br2_466 n2_br2_467 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj466_ref ground ground n2_bl2_467 ground n2_br2_467 ground vdd_readh ground memorycellh
X2wirel467_ref n2_bl2_467 n2_bl2_468 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer467_ref n2_br2_467 n2_br2_468 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj467_ref ground ground n2_bl2_468 ground n2_br2_468 ground vdd_readh ground memorycellh
X2wirel468_ref n2_bl2_468 n2_bl2_469 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer468_ref n2_br2_468 n2_br2_469 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj468_ref ground ground n2_bl2_469 ground n2_br2_469 ground vdd_readh ground memorycellh
X2wirel469_ref n2_bl2_469 n2_bl2_470 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer469_ref n2_br2_469 n2_br2_470 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj469_ref ground ground n2_bl2_470 ground n2_br2_470 ground vdd_readh ground memorycellh
X2wirel470_ref n2_bl2_470 n2_bl2_471 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer470_ref n2_br2_470 n2_br2_471 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj470_ref ground ground n2_bl2_471 ground n2_br2_471 ground vdd_readh ground memorycellh
X2wirel471_ref n2_bl2_471 n2_bl2_472 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer471_ref n2_br2_471 n2_br2_472 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj471_ref ground ground n2_bl2_472 ground n2_br2_472 ground vdd_readh ground memorycellh
X2wirel472_ref n2_bl2_472 n2_bl2_473 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer472_ref n2_br2_472 n2_br2_473 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj472_ref ground ground n2_bl2_473 ground n2_br2_473 ground vdd_readh ground memorycellh
X2wirel473_ref n2_bl2_473 n2_bl2_474 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer473_ref n2_br2_473 n2_br2_474 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj473_ref ground ground n2_bl2_474 ground n2_br2_474 ground vdd_readh ground memorycellh
X2wirel474_ref n2_bl2_474 n2_bl2_475 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer474_ref n2_br2_474 n2_br2_475 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj474_ref ground ground n2_bl2_475 ground n2_br2_475 ground vdd_readh ground memorycellh
X2wirel475_ref n2_bl2_475 n2_bl2_476 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer475_ref n2_br2_475 n2_br2_476 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj475_ref ground ground n2_bl2_476 ground n2_br2_476 ground vdd_readh ground memorycellh
X2wirel476_ref n2_bl2_476 n2_bl2_477 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer476_ref n2_br2_476 n2_br2_477 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj476_ref ground ground n2_bl2_477 ground n2_br2_477 ground vdd_readh ground memorycellh
X2wirel477_ref n2_bl2_477 n2_bl2_478 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer477_ref n2_br2_477 n2_br2_478 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj477_ref ground ground n2_bl2_478 ground n2_br2_478 ground vdd_readh ground memorycellh
X2wirel478_ref n2_bl2_478 n2_bl2_479 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer478_ref n2_br2_478 n2_br2_479 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj478_ref ground ground n2_bl2_479 ground n2_br2_479 ground vdd_readh ground memorycellh
X2wirel479_ref n2_bl2_479 n2_bl2_480 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer479_ref n2_br2_479 n2_br2_480 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj479_ref ground ground n2_bl2_480 ground n2_br2_480 ground vdd_readh ground memorycellh
X2wirel480_ref n2_bl2_480 n2_bl2_481 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer480_ref n2_br2_480 n2_br2_481 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj480_ref ground ground n2_bl2_481 ground n2_br2_481 ground vdd_readh ground memorycellh
X2wirel481_ref n2_bl2_481 n2_bl2_482 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer481_ref n2_br2_481 n2_br2_482 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj481_ref ground ground n2_bl2_482 ground n2_br2_482 ground vdd_readh ground memorycellh
X2wirel482_ref n2_bl2_482 n2_bl2_483 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer482_ref n2_br2_482 n2_br2_483 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj482_ref ground ground n2_bl2_483 ground n2_br2_483 ground vdd_readh ground memorycellh
X2wirel483_ref n2_bl2_483 n2_bl2_484 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer483_ref n2_br2_483 n2_br2_484 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj483_ref ground ground n2_bl2_484 ground n2_br2_484 ground vdd_readh ground memorycellh
X2wirel484_ref n2_bl2_484 n2_bl2_485 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer484_ref n2_br2_484 n2_br2_485 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj484_ref ground ground n2_bl2_485 ground n2_br2_485 ground vdd_readh ground memorycellh
X2wirel485_ref n2_bl2_485 n2_bl2_486 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer485_ref n2_br2_485 n2_br2_486 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj485_ref ground ground n2_bl2_486 ground n2_br2_486 ground vdd_readh ground memorycellh
X2wirel486_ref n2_bl2_486 n2_bl2_487 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer486_ref n2_br2_486 n2_br2_487 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj486_ref ground ground n2_bl2_487 ground n2_br2_487 ground vdd_readh ground memorycellh
X2wirel487_ref n2_bl2_487 n2_bl2_488 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer487_ref n2_br2_487 n2_br2_488 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj487_ref ground ground n2_bl2_488 ground n2_br2_488 ground vdd_readh ground memorycellh
X2wirel488_ref n2_bl2_488 n2_bl2_489 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer488_ref n2_br2_488 n2_br2_489 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj488_ref ground ground n2_bl2_489 ground n2_br2_489 ground vdd_readh ground memorycellh
X2wirel489_ref n2_bl2_489 n2_bl2_490 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer489_ref n2_br2_489 n2_br2_490 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj489_ref ground ground n2_bl2_490 ground n2_br2_490 ground vdd_readh ground memorycellh
X2wirel490_ref n2_bl2_490 n2_bl2_491 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer490_ref n2_br2_490 n2_br2_491 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj490_ref ground ground n2_bl2_491 ground n2_br2_491 ground vdd_readh ground memorycellh
X2wirel491_ref n2_bl2_491 n2_bl2_492 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer491_ref n2_br2_491 n2_br2_492 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj491_ref ground ground n2_bl2_492 ground n2_br2_492 ground vdd_readh ground memorycellh
X2wirel492_ref n2_bl2_492 n2_bl2_493 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer492_ref n2_br2_492 n2_br2_493 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj492_ref ground ground n2_bl2_493 ground n2_br2_493 ground vdd_readh ground memorycellh
X2wirel493_ref n2_bl2_493 n2_bl2_494 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer493_ref n2_br2_493 n2_br2_494 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj493_ref ground ground n2_bl2_494 ground n2_br2_494 ground vdd_readh ground memorycellh
X2wirel494_ref n2_bl2_494 n2_bl2_495 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer494_ref n2_br2_494 n2_br2_495 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj494_ref ground ground n2_bl2_495 ground n2_br2_495 ground vdd_readh ground memorycellh
X2wirel495_ref n2_bl2_495 n2_bl2_496 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer495_ref n2_br2_495 n2_br2_496 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj495_ref ground ground n2_bl2_496 ground n2_br2_496 ground vdd_readh ground memorycellh
X2wirel496_ref n2_bl2_496 n2_bl2_497 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer496_ref n2_br2_496 n2_br2_497 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj496_ref ground ground n2_bl2_497 ground n2_br2_497 ground vdd_readh ground memorycellh
X2wirel497_ref n2_bl2_497 n2_bl2_498 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer497_ref n2_br2_497 n2_br2_498 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj497_ref ground ground n2_bl2_498 ground n2_br2_498 ground vdd_readh ground memorycellh
X2wirel498_ref n2_bl2_498 n2_bl2_499 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer498_ref n2_br2_498 n2_br2_499 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj498_ref ground ground n2_bl2_499 ground n2_br2_499 ground vdd_readh ground memorycellh
X2wirel499_ref n2_bl2_499 n2_bl2_500 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer499_ref n2_br2_499 n2_br2_500 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj499_ref ground ground n2_bl2_500 ground n2_br2_500 ground vdd_readh ground memorycellh
X2wirel500_ref n2_bl2_500 n2_bl2_501 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer500_ref n2_br2_500 n2_br2_501 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj500_ref ground ground n2_bl2_501 ground n2_br2_501 ground vdd_readh ground memorycellh
X2wirel501_ref n2_bl2_501 n2_bl2_502 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer501_ref n2_br2_501 n2_br2_502 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj501_ref ground ground n2_bl2_502 ground n2_br2_502 ground vdd_readh ground memorycellh
X2wirel502_ref n2_bl2_502 n2_bl2_503 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer502_ref n2_br2_502 n2_br2_503 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj502_ref ground ground n2_bl2_503 ground n2_br2_503 ground vdd_readh ground memorycellh
X2wirel503_ref n2_bl2_503 n2_bl2_504 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer503_ref n2_br2_503 n2_br2_504 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj503_ref ground ground n2_bl2_504 ground n2_br2_504 ground vdd_readh ground memorycellh
X2wirel504_ref n2_bl2_504 n2_bl2_505 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer504_ref n2_br2_504 n2_br2_505 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj504_ref ground ground n2_bl2_505 ground n2_br2_505 ground vdd_readh ground memorycellh
X2wirel505_ref n2_bl2_505 n2_bl2_506 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer505_ref n2_br2_505 n2_br2_506 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj505_ref ground ground n2_bl2_506 ground n2_br2_506 ground vdd_readh ground memorycellh
X2wirel506_ref n2_bl2_506 n2_bl2_507 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer506_ref n2_br2_506 n2_br2_507 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj506_ref ground ground n2_bl2_507 ground n2_br2_507 ground vdd_readh ground memorycellh
X2wirel507_ref n2_bl2_507 n2_bl2_508 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer507_ref n2_br2_507 n2_br2_508 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj507_ref ground ground n2_bl2_508 ground n2_br2_508 ground vdd_readh ground memorycellh
X2wirel508_ref n2_bl2_508 n2_bl2_509 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer508_ref n2_br2_508 n2_br2_509 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj508_ref ground ground n2_bl2_509 ground n2_br2_509 ground vdd_readh ground memorycellh
X2wirel509_ref n2_bl2_509 n2_bl2_510 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer509_ref n2_br2_509 n2_br2_510 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj509_ref ground ground n2_bl2_510 ground n2_br2_510 ground vdd_readh ground memorycellh
X2wirel510_ref n2_bl2_510 n2_bl2_511 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer510_ref n2_br2_510 n2_br2_511 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj510_ref ground ground n2_bl2_511 ground n2_br2_511 ground vdd_readh ground memorycellh
X2wirel511_ref n2_bl2_511 n2_bl2_512 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer511_ref n2_br2_511 n2_br2_512 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj511_ref ground ground n2_bl2_512 ground n2_br2_512 ground vdd_readh ground memorycellh
X2wirel0_ref n2_bl2_0 n2_bl2_1 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2wirer0_ref n2_br2_0 n2_br2_1 wire Rw=wire_memorycell_vertical_res/512 Cw=wire_memorycell_vertical_cap/512
X2mtj0_ref n_precharge ground n2_bl2_1 ground n2_br2_1 ground vdd_readh ground memorycell
.IC V(n2_bl_0) = 0 
.IC V(n2_br_0) = 0 
.IC V(X2prechargesa.n_1_5) = 0 
.IC V(X2prechargesa.n_1_6) = 0 
.IC V(X2prechargesa.n_1_1) = 0.95 
.IC V(X2prechargesa.n_1_2) = 0.95 
.END