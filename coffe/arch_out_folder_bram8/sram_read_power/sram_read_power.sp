.TITLE SRAM read power measurement circuit 

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
Vprecharge2 n_precharge2 ground PULSE (0.8_lp 0 0 50p 50p 'precharge_max' 'ram_frequency')
Vwl n_wl_eva ground PULSE (0.8_lp 0 0 50p 50p 'wl_eva' 'ram_frequency')
* Power rail for the circuit under test.
* This allows us to measure power of a circuit under test without measuring the power of wave shaping and load circuitry.
V_selected vdd_selected ground 0.8_lp

V_unselected vdd_unselected ground 0.8_lp

********************************************************************************
** Measurement
********************************************************************************

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current_selected  INTEG I(V_selected) FROM=0ns TO='4 * ram_frequency'
.MEASURE TRAN meas_avg_power_selected PARAM = '-(meas_current_selected/(4 * ram_frequency)) * 0.8_lp'

.MEASURE TRAN meas_current_unselected  INTEG I(V_unselected) FROM=0ns TO='4 * ram_frequency'
.MEASURE TRAN meas_avg_power_unselected PARAM = '-(meas_current_unselected/(4 * ram_frequency)) * 0.8_lp'

********************************************************************************
** Circuit
********************************************************************************

xsamp1 n_wl_eva tgate_l tgate_r n_hang_samp vdd_selected ground samp1
xwrite ground ground tgate_l tgate_r vdd_selected ground writedriver
xtgate1 n_bl_0 tgate_l vdd_lp ground vdd_selected ground RAM_tgate
xtgater n_br_0 tgate_r vdd_lp ground vdd_selected ground RAM_tgate
xprecharge n_precharge n_bl_0 n_br_0 vdd_selected ground precharge
xtgatel_0 n_bl0_0 tgate_l ground vdd_lp vdd_unselected ground RAM_tgate
xtgater_0 n_br0_0 tgate_r ground vdd_lp vdd_unselected ground RAM_tgate
xprecharge0 n_precharge n_bl0_0 n_br0_0 vdd_unselected ground precharge
Xwirel0 n_bl_0 n_bl_1 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer0 n_br_0 n_br_1 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram0 ground ground n_bl_1 ground n_br_1 ground vdd_selected ground memorycell
Xwirel1 n_bl_1 n_bl_2 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer1 n_br_1 n_br_2 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram1 ground ground n_bl_2 ground n_br_2 ground vdd_selected ground memorycell
Xwirel2 n_bl_2 n_bl_3 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer2 n_br_2 n_br_3 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram2 ground ground n_bl_3 ground n_br_3 ground vdd_selected ground memorycell
Xwirel3 n_bl_3 n_bl_4 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer3 n_br_3 n_br_4 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram3 ground ground n_bl_4 ground n_br_4 ground vdd_selected ground memorycell
Xwirel4 n_bl_4 n_bl_5 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer4 n_br_4 n_br_5 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram4 ground ground n_bl_5 ground n_br_5 ground vdd_selected ground memorycell
Xwirel5 n_bl_5 n_bl_6 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer5 n_br_5 n_br_6 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram5 ground ground n_bl_6 ground n_br_6 ground vdd_selected ground memorycell
Xwirel6 n_bl_6 n_bl_7 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer6 n_br_6 n_br_7 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram6 ground ground n_bl_7 ground n_br_7 ground vdd_selected ground memorycell
Xwirel7 n_bl_7 n_bl_8 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer7 n_br_7 n_br_8 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram7 ground ground n_bl_8 ground n_br_8 ground vdd_selected ground memorycell
Xwirel8 n_bl_8 n_bl_9 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer8 n_br_8 n_br_9 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram8 ground ground n_bl_9 ground n_br_9 ground vdd_selected ground memorycell
Xwirel9 n_bl_9 n_bl_10 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer9 n_br_9 n_br_10 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram9 ground ground n_bl_10 ground n_br_10 ground vdd_selected ground memorycell
Xwirel10 n_bl_10 n_bl_11 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer10 n_br_10 n_br_11 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram10 ground ground n_bl_11 ground n_br_11 ground vdd_selected ground memorycell
Xwirel11 n_bl_11 n_bl_12 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer11 n_br_11 n_br_12 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram11 ground ground n_bl_12 ground n_br_12 ground vdd_selected ground memorycell
Xwirel12 n_bl_12 n_bl_13 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer12 n_br_12 n_br_13 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram12 ground ground n_bl_13 ground n_br_13 ground vdd_selected ground memorycell
Xwirel13 n_bl_13 n_bl_14 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer13 n_br_13 n_br_14 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram13 ground ground n_bl_14 ground n_br_14 ground vdd_selected ground memorycell
Xwirel14 n_bl_14 n_bl_15 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer14 n_br_14 n_br_15 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram14 ground ground n_bl_15 ground n_br_15 ground vdd_selected ground memorycell
Xwirel15 n_bl_15 n_bl_16 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer15 n_br_15 n_br_16 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram15 ground ground n_bl_16 ground n_br_16 ground vdd_selected ground memorycell
Xwirel16 n_bl_16 n_bl_17 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer16 n_br_16 n_br_17 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram16 ground ground n_bl_17 ground n_br_17 ground vdd_selected ground memorycell
Xwirel17 n_bl_17 n_bl_18 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer17 n_br_17 n_br_18 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram17 ground ground n_bl_18 ground n_br_18 ground vdd_selected ground memorycell
Xwirel18 n_bl_18 n_bl_19 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer18 n_br_18 n_br_19 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram18 ground ground n_bl_19 ground n_br_19 ground vdd_selected ground memorycell
Xwirel19 n_bl_19 n_bl_20 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer19 n_br_19 n_br_20 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram19 ground ground n_bl_20 ground n_br_20 ground vdd_selected ground memorycell
Xwirel20 n_bl_20 n_bl_21 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer20 n_br_20 n_br_21 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram20 ground ground n_bl_21 ground n_br_21 ground vdd_selected ground memorycell
Xwirel21 n_bl_21 n_bl_22 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer21 n_br_21 n_br_22 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram21 ground ground n_bl_22 ground n_br_22 ground vdd_selected ground memorycell
Xwirel22 n_bl_22 n_bl_23 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer22 n_br_22 n_br_23 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram22 ground ground n_bl_23 ground n_br_23 ground vdd_selected ground memorycell
Xwirel23 n_bl_23 n_bl_24 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer23 n_br_23 n_br_24 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram23 ground ground n_bl_24 ground n_br_24 ground vdd_selected ground memorycell
Xwirel24 n_bl_24 n_bl_25 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer24 n_br_24 n_br_25 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram24 ground ground n_bl_25 ground n_br_25 ground vdd_selected ground memorycell
Xwirel25 n_bl_25 n_bl_26 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer25 n_br_25 n_br_26 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram25 ground ground n_bl_26 ground n_br_26 ground vdd_selected ground memorycell
Xwirel26 n_bl_26 n_bl_27 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer26 n_br_26 n_br_27 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram26 ground ground n_bl_27 ground n_br_27 ground vdd_selected ground memorycell
Xwirel27 n_bl_27 n_bl_28 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer27 n_br_27 n_br_28 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram27 ground ground n_bl_28 ground n_br_28 ground vdd_selected ground memorycell
Xwirel28 n_bl_28 n_bl_29 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer28 n_br_28 n_br_29 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram28 ground ground n_bl_29 ground n_br_29 ground vdd_selected ground memorycell
Xwirel29 n_bl_29 n_bl_30 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer29 n_br_29 n_br_30 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram29 ground ground n_bl_30 ground n_br_30 ground vdd_selected ground memorycell
Xwirel30 n_bl_30 n_bl_31 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer30 n_br_30 n_br_31 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram30 ground ground n_bl_31 ground n_br_31 ground vdd_selected ground memorycell
Xwirel31 n_bl_31 n_bl_32 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer31 n_br_31 n_br_32 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram31 ground ground n_bl_32 ground n_br_32 ground vdd_selected ground memorycell
Xwirel32 n_bl_32 n_bl_33 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer32 n_br_32 n_br_33 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram32 ground ground n_bl_33 ground n_br_33 ground vdd_selected ground memorycell
Xwirel33 n_bl_33 n_bl_34 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer33 n_br_33 n_br_34 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram33 ground ground n_bl_34 ground n_br_34 ground vdd_selected ground memorycell
Xwirel34 n_bl_34 n_bl_35 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer34 n_br_34 n_br_35 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram34 ground ground n_bl_35 ground n_br_35 ground vdd_selected ground memorycell
Xwirel35 n_bl_35 n_bl_36 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer35 n_br_35 n_br_36 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram35 ground ground n_bl_36 ground n_br_36 ground vdd_selected ground memorycell
Xwirel36 n_bl_36 n_bl_37 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer36 n_br_36 n_br_37 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram36 ground ground n_bl_37 ground n_br_37 ground vdd_selected ground memorycell
Xwirel37 n_bl_37 n_bl_38 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer37 n_br_37 n_br_38 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram37 ground ground n_bl_38 ground n_br_38 ground vdd_selected ground memorycell
Xwirel38 n_bl_38 n_bl_39 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer38 n_br_38 n_br_39 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram38 ground ground n_bl_39 ground n_br_39 ground vdd_selected ground memorycell
Xwirel39 n_bl_39 n_bl_40 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer39 n_br_39 n_br_40 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram39 ground ground n_bl_40 ground n_br_40 ground vdd_selected ground memorycell
Xwirel40 n_bl_40 n_bl_41 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer40 n_br_40 n_br_41 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram40 ground ground n_bl_41 ground n_br_41 ground vdd_selected ground memorycell
Xwirel41 n_bl_41 n_bl_42 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer41 n_br_41 n_br_42 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram41 ground ground n_bl_42 ground n_br_42 ground vdd_selected ground memorycell
Xwirel42 n_bl_42 n_bl_43 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer42 n_br_42 n_br_43 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram42 ground ground n_bl_43 ground n_br_43 ground vdd_selected ground memorycell
Xwirel43 n_bl_43 n_bl_44 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer43 n_br_43 n_br_44 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram43 ground ground n_bl_44 ground n_br_44 ground vdd_selected ground memorycell
Xwirel44 n_bl_44 n_bl_45 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer44 n_br_44 n_br_45 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram44 ground ground n_bl_45 ground n_br_45 ground vdd_selected ground memorycell
Xwirel45 n_bl_45 n_bl_46 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer45 n_br_45 n_br_46 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram45 ground ground n_bl_46 ground n_br_46 ground vdd_selected ground memorycell
Xwirel46 n_bl_46 n_bl_47 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer46 n_br_46 n_br_47 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram46 ground ground n_bl_47 ground n_br_47 ground vdd_selected ground memorycell
Xwirel47 n_bl_47 n_bl_48 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer47 n_br_47 n_br_48 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram47 ground ground n_bl_48 ground n_br_48 ground vdd_selected ground memorycell
Xwirel48 n_bl_48 n_bl_49 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer48 n_br_48 n_br_49 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram48 ground ground n_bl_49 ground n_br_49 ground vdd_selected ground memorycell
Xwirel49 n_bl_49 n_bl_50 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer49 n_br_49 n_br_50 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram49 ground ground n_bl_50 ground n_br_50 ground vdd_selected ground memorycell
Xwirel50 n_bl_50 n_bl_51 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer50 n_br_50 n_br_51 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram50 ground ground n_bl_51 ground n_br_51 ground vdd_selected ground memorycell
Xwirel51 n_bl_51 n_bl_52 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer51 n_br_51 n_br_52 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram51 ground ground n_bl_52 ground n_br_52 ground vdd_selected ground memorycell
Xwirel52 n_bl_52 n_bl_53 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer52 n_br_52 n_br_53 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram52 ground ground n_bl_53 ground n_br_53 ground vdd_selected ground memorycell
Xwirel53 n_bl_53 n_bl_54 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer53 n_br_53 n_br_54 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram53 ground ground n_bl_54 ground n_br_54 ground vdd_selected ground memorycell
Xwirel54 n_bl_54 n_bl_55 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer54 n_br_54 n_br_55 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram54 ground ground n_bl_55 ground n_br_55 ground vdd_selected ground memorycell
Xwirel55 n_bl_55 n_bl_56 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer55 n_br_55 n_br_56 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram55 ground ground n_bl_56 ground n_br_56 ground vdd_selected ground memorycell
Xwirel56 n_bl_56 n_bl_57 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer56 n_br_56 n_br_57 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram56 ground ground n_bl_57 ground n_br_57 ground vdd_selected ground memorycell
Xwirel57 n_bl_57 n_bl_58 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer57 n_br_57 n_br_58 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram57 ground ground n_bl_58 ground n_br_58 ground vdd_selected ground memorycell
Xwirel58 n_bl_58 n_bl_59 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer58 n_br_58 n_br_59 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram58 ground ground n_bl_59 ground n_br_59 ground vdd_selected ground memorycell
Xwirel59 n_bl_59 n_bl_60 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer59 n_br_59 n_br_60 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram59 ground ground n_bl_60 ground n_br_60 ground vdd_selected ground memorycell
Xwirel60 n_bl_60 n_bl_61 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer60 n_br_60 n_br_61 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram60 ground ground n_bl_61 ground n_br_61 ground vdd_selected ground memorycell
Xwirel61 n_bl_61 n_bl_62 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer61 n_br_61 n_br_62 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram61 ground ground n_bl_62 ground n_br_62 ground vdd_selected ground memorycell
Xwirel62 n_bl_62 n_bl_63 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer62 n_br_62 n_br_63 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram62 ground ground n_bl_63 ground n_br_63 ground vdd_selected ground memorycell
Xwirel63 n_bl_63 n_bl_64 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer63 n_br_63 n_br_64 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram63 n_precharge2 ground n_bl_64 ground n_br_64 ground vdd_selected ground memorycell
Xwire0l0 n_bl0_0 n_bl0_1 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r0 n_br0_0 n_br0_1 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_0 ground ground n_bl0_1 ground n_br0_1 ground vdd_unselected ground memorycell
Xwire0l1 n_bl0_1 n_bl0_2 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r1 n_br0_1 n_br0_2 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_1 ground ground n_bl0_2 ground n_br0_2 ground vdd_unselected ground memorycell
Xwire0l2 n_bl0_2 n_bl0_3 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r2 n_br0_2 n_br0_3 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_2 ground ground n_bl0_3 ground n_br0_3 ground vdd_unselected ground memorycell
Xwire0l3 n_bl0_3 n_bl0_4 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r3 n_br0_3 n_br0_4 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_3 ground ground n_bl0_4 ground n_br0_4 ground vdd_unselected ground memorycell
Xwire0l4 n_bl0_4 n_bl0_5 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r4 n_br0_4 n_br0_5 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_4 ground ground n_bl0_5 ground n_br0_5 ground vdd_unselected ground memorycell
Xwire0l5 n_bl0_5 n_bl0_6 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r5 n_br0_5 n_br0_6 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_5 ground ground n_bl0_6 ground n_br0_6 ground vdd_unselected ground memorycell
Xwire0l6 n_bl0_6 n_bl0_7 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r6 n_br0_6 n_br0_7 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_6 ground ground n_bl0_7 ground n_br0_7 ground vdd_unselected ground memorycell
Xwire0l7 n_bl0_7 n_bl0_8 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r7 n_br0_7 n_br0_8 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_7 ground ground n_bl0_8 ground n_br0_8 ground vdd_unselected ground memorycell
Xwire0l8 n_bl0_8 n_bl0_9 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r8 n_br0_8 n_br0_9 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_8 ground ground n_bl0_9 ground n_br0_9 ground vdd_unselected ground memorycell
Xwire0l9 n_bl0_9 n_bl0_10 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r9 n_br0_9 n_br0_10 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_9 ground ground n_bl0_10 ground n_br0_10 ground vdd_unselected ground memorycell
Xwire0l10 n_bl0_10 n_bl0_11 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r10 n_br0_10 n_br0_11 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_10 ground ground n_bl0_11 ground n_br0_11 ground vdd_unselected ground memorycell
Xwire0l11 n_bl0_11 n_bl0_12 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r11 n_br0_11 n_br0_12 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_11 ground ground n_bl0_12 ground n_br0_12 ground vdd_unselected ground memorycell
Xwire0l12 n_bl0_12 n_bl0_13 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r12 n_br0_12 n_br0_13 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_12 ground ground n_bl0_13 ground n_br0_13 ground vdd_unselected ground memorycell
Xwire0l13 n_bl0_13 n_bl0_14 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r13 n_br0_13 n_br0_14 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_13 ground ground n_bl0_14 ground n_br0_14 ground vdd_unselected ground memorycell
Xwire0l14 n_bl0_14 n_bl0_15 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r14 n_br0_14 n_br0_15 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_14 ground ground n_bl0_15 ground n_br0_15 ground vdd_unselected ground memorycell
Xwire0l15 n_bl0_15 n_bl0_16 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r15 n_br0_15 n_br0_16 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_15 ground ground n_bl0_16 ground n_br0_16 ground vdd_unselected ground memorycell
Xwire0l16 n_bl0_16 n_bl0_17 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r16 n_br0_16 n_br0_17 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_16 ground ground n_bl0_17 ground n_br0_17 ground vdd_unselected ground memorycell
Xwire0l17 n_bl0_17 n_bl0_18 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r17 n_br0_17 n_br0_18 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_17 ground ground n_bl0_18 ground n_br0_18 ground vdd_unselected ground memorycell
Xwire0l18 n_bl0_18 n_bl0_19 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r18 n_br0_18 n_br0_19 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_18 ground ground n_bl0_19 ground n_br0_19 ground vdd_unselected ground memorycell
Xwire0l19 n_bl0_19 n_bl0_20 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r19 n_br0_19 n_br0_20 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_19 ground ground n_bl0_20 ground n_br0_20 ground vdd_unselected ground memorycell
Xwire0l20 n_bl0_20 n_bl0_21 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r20 n_br0_20 n_br0_21 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_20 ground ground n_bl0_21 ground n_br0_21 ground vdd_unselected ground memorycell
Xwire0l21 n_bl0_21 n_bl0_22 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r21 n_br0_21 n_br0_22 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_21 ground ground n_bl0_22 ground n_br0_22 ground vdd_unselected ground memorycell
Xwire0l22 n_bl0_22 n_bl0_23 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r22 n_br0_22 n_br0_23 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_22 ground ground n_bl0_23 ground n_br0_23 ground vdd_unselected ground memorycell
Xwire0l23 n_bl0_23 n_bl0_24 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r23 n_br0_23 n_br0_24 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_23 ground ground n_bl0_24 ground n_br0_24 ground vdd_unselected ground memorycell
Xwire0l24 n_bl0_24 n_bl0_25 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r24 n_br0_24 n_br0_25 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_24 ground ground n_bl0_25 ground n_br0_25 ground vdd_unselected ground memorycell
Xwire0l25 n_bl0_25 n_bl0_26 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r25 n_br0_25 n_br0_26 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_25 ground ground n_bl0_26 ground n_br0_26 ground vdd_unselected ground memorycell
Xwire0l26 n_bl0_26 n_bl0_27 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r26 n_br0_26 n_br0_27 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_26 ground ground n_bl0_27 ground n_br0_27 ground vdd_unselected ground memorycell
Xwire0l27 n_bl0_27 n_bl0_28 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r27 n_br0_27 n_br0_28 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_27 ground ground n_bl0_28 ground n_br0_28 ground vdd_unselected ground memorycell
Xwire0l28 n_bl0_28 n_bl0_29 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r28 n_br0_28 n_br0_29 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_28 ground ground n_bl0_29 ground n_br0_29 ground vdd_unselected ground memorycell
Xwire0l29 n_bl0_29 n_bl0_30 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r29 n_br0_29 n_br0_30 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_29 ground ground n_bl0_30 ground n_br0_30 ground vdd_unselected ground memorycell
Xwire0l30 n_bl0_30 n_bl0_31 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r30 n_br0_30 n_br0_31 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_30 ground ground n_bl0_31 ground n_br0_31 ground vdd_unselected ground memorycell
Xwire0l31 n_bl0_31 n_bl0_32 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r31 n_br0_31 n_br0_32 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_31 ground ground n_bl0_32 ground n_br0_32 ground vdd_unselected ground memorycell
Xwire0l32 n_bl0_32 n_bl0_33 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r32 n_br0_32 n_br0_33 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_32 ground ground n_bl0_33 ground n_br0_33 ground vdd_unselected ground memorycell
Xwire0l33 n_bl0_33 n_bl0_34 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r33 n_br0_33 n_br0_34 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_33 ground ground n_bl0_34 ground n_br0_34 ground vdd_unselected ground memorycell
Xwire0l34 n_bl0_34 n_bl0_35 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r34 n_br0_34 n_br0_35 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_34 ground ground n_bl0_35 ground n_br0_35 ground vdd_unselected ground memorycell
Xwire0l35 n_bl0_35 n_bl0_36 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r35 n_br0_35 n_br0_36 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_35 ground ground n_bl0_36 ground n_br0_36 ground vdd_unselected ground memorycell
Xwire0l36 n_bl0_36 n_bl0_37 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r36 n_br0_36 n_br0_37 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_36 ground ground n_bl0_37 ground n_br0_37 ground vdd_unselected ground memorycell
Xwire0l37 n_bl0_37 n_bl0_38 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r37 n_br0_37 n_br0_38 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_37 ground ground n_bl0_38 ground n_br0_38 ground vdd_unselected ground memorycell
Xwire0l38 n_bl0_38 n_bl0_39 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r38 n_br0_38 n_br0_39 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_38 ground ground n_bl0_39 ground n_br0_39 ground vdd_unselected ground memorycell
Xwire0l39 n_bl0_39 n_bl0_40 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r39 n_br0_39 n_br0_40 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_39 ground ground n_bl0_40 ground n_br0_40 ground vdd_unselected ground memorycell
Xwire0l40 n_bl0_40 n_bl0_41 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r40 n_br0_40 n_br0_41 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_40 ground ground n_bl0_41 ground n_br0_41 ground vdd_unselected ground memorycell
Xwire0l41 n_bl0_41 n_bl0_42 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r41 n_br0_41 n_br0_42 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_41 ground ground n_bl0_42 ground n_br0_42 ground vdd_unselected ground memorycell
Xwire0l42 n_bl0_42 n_bl0_43 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r42 n_br0_42 n_br0_43 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_42 ground ground n_bl0_43 ground n_br0_43 ground vdd_unselected ground memorycell
Xwire0l43 n_bl0_43 n_bl0_44 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r43 n_br0_43 n_br0_44 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_43 ground ground n_bl0_44 ground n_br0_44 ground vdd_unselected ground memorycell
Xwire0l44 n_bl0_44 n_bl0_45 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r44 n_br0_44 n_br0_45 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_44 ground ground n_bl0_45 ground n_br0_45 ground vdd_unselected ground memorycell
Xwire0l45 n_bl0_45 n_bl0_46 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r45 n_br0_45 n_br0_46 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_45 ground ground n_bl0_46 ground n_br0_46 ground vdd_unselected ground memorycell
Xwire0l46 n_bl0_46 n_bl0_47 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r46 n_br0_46 n_br0_47 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_46 ground ground n_bl0_47 ground n_br0_47 ground vdd_unselected ground memorycell
Xwire0l47 n_bl0_47 n_bl0_48 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r47 n_br0_47 n_br0_48 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_47 ground ground n_bl0_48 ground n_br0_48 ground vdd_unselected ground memorycell
Xwire0l48 n_bl0_48 n_bl0_49 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r48 n_br0_48 n_br0_49 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_48 ground ground n_bl0_49 ground n_br0_49 ground vdd_unselected ground memorycell
Xwire0l49 n_bl0_49 n_bl0_50 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r49 n_br0_49 n_br0_50 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_49 ground ground n_bl0_50 ground n_br0_50 ground vdd_unselected ground memorycell
Xwire0l50 n_bl0_50 n_bl0_51 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r50 n_br0_50 n_br0_51 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_50 ground ground n_bl0_51 ground n_br0_51 ground vdd_unselected ground memorycell
Xwire0l51 n_bl0_51 n_bl0_52 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r51 n_br0_51 n_br0_52 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_51 ground ground n_bl0_52 ground n_br0_52 ground vdd_unselected ground memorycell
Xwire0l52 n_bl0_52 n_bl0_53 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r52 n_br0_52 n_br0_53 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_52 ground ground n_bl0_53 ground n_br0_53 ground vdd_unselected ground memorycell
Xwire0l53 n_bl0_53 n_bl0_54 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r53 n_br0_53 n_br0_54 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_53 ground ground n_bl0_54 ground n_br0_54 ground vdd_unselected ground memorycell
Xwire0l54 n_bl0_54 n_bl0_55 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r54 n_br0_54 n_br0_55 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_54 ground ground n_bl0_55 ground n_br0_55 ground vdd_unselected ground memorycell
Xwire0l55 n_bl0_55 n_bl0_56 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r55 n_br0_55 n_br0_56 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_55 ground ground n_bl0_56 ground n_br0_56 ground vdd_unselected ground memorycell
Xwire0l56 n_bl0_56 n_bl0_57 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r56 n_br0_56 n_br0_57 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_56 ground ground n_bl0_57 ground n_br0_57 ground vdd_unselected ground memorycell
Xwire0l57 n_bl0_57 n_bl0_58 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r57 n_br0_57 n_br0_58 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_57 ground ground n_bl0_58 ground n_br0_58 ground vdd_unselected ground memorycell
Xwire0l58 n_bl0_58 n_bl0_59 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r58 n_br0_58 n_br0_59 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_58 ground ground n_bl0_59 ground n_br0_59 ground vdd_unselected ground memorycell
Xwire0l59 n_bl0_59 n_bl0_60 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r59 n_br0_59 n_br0_60 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_59 ground ground n_bl0_60 ground n_br0_60 ground vdd_unselected ground memorycell
Xwire0l60 n_bl0_60 n_bl0_61 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r60 n_br0_60 n_br0_61 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_60 ground ground n_bl0_61 ground n_br0_61 ground vdd_unselected ground memorycell
Xwire0l61 n_bl0_61 n_bl0_62 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r61 n_br0_61 n_br0_62 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_61 ground ground n_bl0_62 ground n_br0_62 ground vdd_unselected ground memorycell
Xwire0l62 n_bl0_62 n_bl0_63 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r62 n_br0_62 n_br0_63 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_62 ground ground n_bl0_63 ground n_br0_63 ground vdd_unselected ground memorycell
Xwire0l63 n_bl0_63 n_bl0_64 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwire0r63 n_br0_63 n_br0_64 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram_0_63 n_precharge2 ground n_bl0_64 ground n_br0_64 ground vdd_unselected ground memorycell
.IC V(n_bl_0) = '0.8_lp' 
.IC V(n_br_0) = 0 
.IC V(Xsram0.n_1_1) = '0.8_lp' 
.IC V(Xsram0.n_1_2) = 0 
.IC V(Xsram1.n_1_1) = '0.8_lp' 
.IC V(Xsram1.n_1_2) = 0 
.IC V(Xsram2.n_1_1) = '0.8_lp' 
.IC V(Xsram2.n_1_2) = 0 
.IC V(Xsram3.n_1_1) = '0.8_lp' 
.IC V(Xsram3.n_1_2) = 0 
.IC V(Xsram4.n_1_1) = '0.8_lp' 
.IC V(Xsram4.n_1_2) = 0 
.IC V(Xsram5.n_1_1) = '0.8_lp' 
.IC V(Xsram5.n_1_2) = 0 
.IC V(Xsram6.n_1_1) = '0.8_lp' 
.IC V(Xsram6.n_1_2) = 0 
.IC V(Xsram7.n_1_1) = '0.8_lp' 
.IC V(Xsram7.n_1_2) = 0 
.IC V(Xsram8.n_1_1) = '0.8_lp' 
.IC V(Xsram8.n_1_2) = 0 
.IC V(Xsram9.n_1_1) = '0.8_lp' 
.IC V(Xsram9.n_1_2) = 0 
.IC V(Xsram10.n_1_1) = '0.8_lp' 
.IC V(Xsram10.n_1_2) = 0 
.IC V(Xsram11.n_1_1) = '0.8_lp' 
.IC V(Xsram11.n_1_2) = 0 
.IC V(Xsram12.n_1_1) = '0.8_lp' 
.IC V(Xsram12.n_1_2) = 0 
.IC V(Xsram13.n_1_1) = '0.8_lp' 
.IC V(Xsram13.n_1_2) = 0 
.IC V(Xsram14.n_1_1) = '0.8_lp' 
.IC V(Xsram14.n_1_2) = 0 
.IC V(Xsram15.n_1_1) = '0.8_lp' 
.IC V(Xsram15.n_1_2) = 0 
.IC V(Xsram16.n_1_1) = '0.8_lp' 
.IC V(Xsram16.n_1_2) = 0 
.IC V(Xsram17.n_1_1) = '0.8_lp' 
.IC V(Xsram17.n_1_2) = 0 
.IC V(Xsram18.n_1_1) = '0.8_lp' 
.IC V(Xsram18.n_1_2) = 0 
.IC V(Xsram19.n_1_1) = '0.8_lp' 
.IC V(Xsram19.n_1_2) = 0 
.IC V(Xsram20.n_1_1) = '0.8_lp' 
.IC V(Xsram20.n_1_2) = 0 
.IC V(Xsram21.n_1_1) = '0.8_lp' 
.IC V(Xsram21.n_1_2) = 0 
.IC V(Xsram22.n_1_1) = '0.8_lp' 
.IC V(Xsram22.n_1_2) = 0 
.IC V(Xsram23.n_1_1) = '0.8_lp' 
.IC V(Xsram23.n_1_2) = 0 
.IC V(Xsram24.n_1_1) = '0.8_lp' 
.IC V(Xsram24.n_1_2) = 0 
.IC V(Xsram25.n_1_1) = '0.8_lp' 
.IC V(Xsram25.n_1_2) = 0 
.IC V(Xsram26.n_1_1) = '0.8_lp' 
.IC V(Xsram26.n_1_2) = 0 
.IC V(Xsram27.n_1_1) = '0.8_lp' 
.IC V(Xsram27.n_1_2) = 0 
.IC V(Xsram28.n_1_1) = '0.8_lp' 
.IC V(Xsram28.n_1_2) = 0 
.IC V(Xsram29.n_1_1) = '0.8_lp' 
.IC V(Xsram29.n_1_2) = 0 
.IC V(Xsram30.n_1_1) = '0.8_lp' 
.IC V(Xsram30.n_1_2) = 0 
.IC V(Xsram31.n_1_1) = '0.8_lp' 
.IC V(Xsram31.n_1_2) = 0 
.IC V(Xsram32.n_1_1) = '0.8_lp' 
.IC V(Xsram32.n_1_2) = 0 
.IC V(Xsram33.n_1_1) = '0.8_lp' 
.IC V(Xsram33.n_1_2) = 0 
.IC V(Xsram34.n_1_1) = '0.8_lp' 
.IC V(Xsram34.n_1_2) = 0 
.IC V(Xsram35.n_1_1) = '0.8_lp' 
.IC V(Xsram35.n_1_2) = 0 
.IC V(Xsram36.n_1_1) = '0.8_lp' 
.IC V(Xsram36.n_1_2) = 0 
.IC V(Xsram37.n_1_1) = '0.8_lp' 
.IC V(Xsram37.n_1_2) = 0 
.IC V(Xsram38.n_1_1) = '0.8_lp' 
.IC V(Xsram38.n_1_2) = 0 
.IC V(Xsram39.n_1_1) = '0.8_lp' 
.IC V(Xsram39.n_1_2) = 0 
.IC V(Xsram40.n_1_1) = '0.8_lp' 
.IC V(Xsram40.n_1_2) = 0 
.IC V(Xsram41.n_1_1) = '0.8_lp' 
.IC V(Xsram41.n_1_2) = 0 
.IC V(Xsram42.n_1_1) = '0.8_lp' 
.IC V(Xsram42.n_1_2) = 0 
.IC V(Xsram43.n_1_1) = '0.8_lp' 
.IC V(Xsram43.n_1_2) = 0 
.IC V(Xsram44.n_1_1) = '0.8_lp' 
.IC V(Xsram44.n_1_2) = 0 
.IC V(Xsram45.n_1_1) = '0.8_lp' 
.IC V(Xsram45.n_1_2) = 0 
.IC V(Xsram46.n_1_1) = '0.8_lp' 
.IC V(Xsram46.n_1_2) = 0 
.IC V(Xsram47.n_1_1) = '0.8_lp' 
.IC V(Xsram47.n_1_2) = 0 
.IC V(Xsram48.n_1_1) = '0.8_lp' 
.IC V(Xsram48.n_1_2) = 0 
.IC V(Xsram49.n_1_1) = '0.8_lp' 
.IC V(Xsram49.n_1_2) = 0 
.IC V(Xsram50.n_1_1) = '0.8_lp' 
.IC V(Xsram50.n_1_2) = 0 
.IC V(Xsram51.n_1_1) = '0.8_lp' 
.IC V(Xsram51.n_1_2) = 0 
.IC V(Xsram52.n_1_1) = '0.8_lp' 
.IC V(Xsram52.n_1_2) = 0 
.IC V(Xsram53.n_1_1) = '0.8_lp' 
.IC V(Xsram53.n_1_2) = 0 
.IC V(Xsram54.n_1_1) = '0.8_lp' 
.IC V(Xsram54.n_1_2) = 0 
.IC V(Xsram55.n_1_1) = '0.8_lp' 
.IC V(Xsram55.n_1_2) = 0 
.IC V(Xsram56.n_1_1) = '0.8_lp' 
.IC V(Xsram56.n_1_2) = 0 
.IC V(Xsram57.n_1_1) = '0.8_lp' 
.IC V(Xsram57.n_1_2) = 0 
.IC V(Xsram58.n_1_1) = '0.8_lp' 
.IC V(Xsram58.n_1_2) = 0 
.IC V(Xsram59.n_1_1) = '0.8_lp' 
.IC V(Xsram59.n_1_2) = 0 
.IC V(Xsram60.n_1_1) = '0.8_lp' 
.IC V(Xsram60.n_1_2) = 0 
.IC V(Xsram61.n_1_1) = '0.8_lp' 
.IC V(Xsram61.n_1_2) = 0 
.IC V(Xsram62.n_1_1) = '0.8_lp' 
.IC V(Xsram62.n_1_2) = 0 
.IC V(Xsram63.n_1_1) = '0.8_lp' 
.IC V(Xsram63.n_1_2) = 0 
.IC V(n_bl0_0) = '0.8_lp' 
.IC V(n_br0_0) = 0 
.IC V(Xsram_0_0.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_0.n_1_2) = 0 
.IC V(n_bl0_1) = '0.8_lp' 
.IC V(n_br0_1) = 0 
.IC V(Xsram_0_1.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_1.n_1_2) = 0 
.IC V(n_bl0_2) = '0.8_lp' 
.IC V(n_br0_2) = 0 
.IC V(Xsram_0_2.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_2.n_1_2) = 0 
.IC V(n_bl0_3) = '0.8_lp' 
.IC V(n_br0_3) = 0 
.IC V(Xsram_0_3.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_3.n_1_2) = 0 
.IC V(n_bl0_4) = '0.8_lp' 
.IC V(n_br0_4) = 0 
.IC V(Xsram_0_4.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_4.n_1_2) = 0 
.IC V(n_bl0_5) = '0.8_lp' 
.IC V(n_br0_5) = 0 
.IC V(Xsram_0_5.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_5.n_1_2) = 0 
.IC V(n_bl0_6) = '0.8_lp' 
.IC V(n_br0_6) = 0 
.IC V(Xsram_0_6.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_6.n_1_2) = 0 
.IC V(n_bl0_7) = '0.8_lp' 
.IC V(n_br0_7) = 0 
.IC V(Xsram_0_7.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_7.n_1_2) = 0 
.IC V(n_bl0_8) = '0.8_lp' 
.IC V(n_br0_8) = 0 
.IC V(Xsram_0_8.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_8.n_1_2) = 0 
.IC V(n_bl0_9) = '0.8_lp' 
.IC V(n_br0_9) = 0 
.IC V(Xsram_0_9.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_9.n_1_2) = 0 
.IC V(n_bl0_10) = '0.8_lp' 
.IC V(n_br0_10) = 0 
.IC V(Xsram_0_10.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_10.n_1_2) = 0 
.IC V(n_bl0_11) = '0.8_lp' 
.IC V(n_br0_11) = 0 
.IC V(Xsram_0_11.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_11.n_1_2) = 0 
.IC V(n_bl0_12) = '0.8_lp' 
.IC V(n_br0_12) = 0 
.IC V(Xsram_0_12.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_12.n_1_2) = 0 
.IC V(n_bl0_13) = '0.8_lp' 
.IC V(n_br0_13) = 0 
.IC V(Xsram_0_13.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_13.n_1_2) = 0 
.IC V(n_bl0_14) = '0.8_lp' 
.IC V(n_br0_14) = 0 
.IC V(Xsram_0_14.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_14.n_1_2) = 0 
.IC V(n_bl0_15) = '0.8_lp' 
.IC V(n_br0_15) = 0 
.IC V(Xsram_0_15.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_15.n_1_2) = 0 
.IC V(n_bl0_16) = '0.8_lp' 
.IC V(n_br0_16) = 0 
.IC V(Xsram_0_16.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_16.n_1_2) = 0 
.IC V(n_bl0_17) = '0.8_lp' 
.IC V(n_br0_17) = 0 
.IC V(Xsram_0_17.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_17.n_1_2) = 0 
.IC V(n_bl0_18) = '0.8_lp' 
.IC V(n_br0_18) = 0 
.IC V(Xsram_0_18.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_18.n_1_2) = 0 
.IC V(n_bl0_19) = '0.8_lp' 
.IC V(n_br0_19) = 0 
.IC V(Xsram_0_19.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_19.n_1_2) = 0 
.IC V(n_bl0_20) = '0.8_lp' 
.IC V(n_br0_20) = 0 
.IC V(Xsram_0_20.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_20.n_1_2) = 0 
.IC V(n_bl0_21) = '0.8_lp' 
.IC V(n_br0_21) = 0 
.IC V(Xsram_0_21.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_21.n_1_2) = 0 
.IC V(n_bl0_22) = '0.8_lp' 
.IC V(n_br0_22) = 0 
.IC V(Xsram_0_22.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_22.n_1_2) = 0 
.IC V(n_bl0_23) = '0.8_lp' 
.IC V(n_br0_23) = 0 
.IC V(Xsram_0_23.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_23.n_1_2) = 0 
.IC V(n_bl0_24) = '0.8_lp' 
.IC V(n_br0_24) = 0 
.IC V(Xsram_0_24.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_24.n_1_2) = 0 
.IC V(n_bl0_25) = '0.8_lp' 
.IC V(n_br0_25) = 0 
.IC V(Xsram_0_25.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_25.n_1_2) = 0 
.IC V(n_bl0_26) = '0.8_lp' 
.IC V(n_br0_26) = 0 
.IC V(Xsram_0_26.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_26.n_1_2) = 0 
.IC V(n_bl0_27) = '0.8_lp' 
.IC V(n_br0_27) = 0 
.IC V(Xsram_0_27.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_27.n_1_2) = 0 
.IC V(n_bl0_28) = '0.8_lp' 
.IC V(n_br0_28) = 0 
.IC V(Xsram_0_28.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_28.n_1_2) = 0 
.IC V(n_bl0_29) = '0.8_lp' 
.IC V(n_br0_29) = 0 
.IC V(Xsram_0_29.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_29.n_1_2) = 0 
.IC V(n_bl0_30) = '0.8_lp' 
.IC V(n_br0_30) = 0 
.IC V(Xsram_0_30.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_30.n_1_2) = 0 
.IC V(n_bl0_31) = '0.8_lp' 
.IC V(n_br0_31) = 0 
.IC V(Xsram_0_31.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_31.n_1_2) = 0 
.IC V(n_bl0_32) = '0.8_lp' 
.IC V(n_br0_32) = 0 
.IC V(Xsram_0_32.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_32.n_1_2) = 0 
.IC V(n_bl0_33) = '0.8_lp' 
.IC V(n_br0_33) = 0 
.IC V(Xsram_0_33.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_33.n_1_2) = 0 
.IC V(n_bl0_34) = '0.8_lp' 
.IC V(n_br0_34) = 0 
.IC V(Xsram_0_34.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_34.n_1_2) = 0 
.IC V(n_bl0_35) = '0.8_lp' 
.IC V(n_br0_35) = 0 
.IC V(Xsram_0_35.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_35.n_1_2) = 0 
.IC V(n_bl0_36) = '0.8_lp' 
.IC V(n_br0_36) = 0 
.IC V(Xsram_0_36.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_36.n_1_2) = 0 
.IC V(n_bl0_37) = '0.8_lp' 
.IC V(n_br0_37) = 0 
.IC V(Xsram_0_37.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_37.n_1_2) = 0 
.IC V(n_bl0_38) = '0.8_lp' 
.IC V(n_br0_38) = 0 
.IC V(Xsram_0_38.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_38.n_1_2) = 0 
.IC V(n_bl0_39) = '0.8_lp' 
.IC V(n_br0_39) = 0 
.IC V(Xsram_0_39.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_39.n_1_2) = 0 
.IC V(n_bl0_40) = '0.8_lp' 
.IC V(n_br0_40) = 0 
.IC V(Xsram_0_40.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_40.n_1_2) = 0 
.IC V(n_bl0_41) = '0.8_lp' 
.IC V(n_br0_41) = 0 
.IC V(Xsram_0_41.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_41.n_1_2) = 0 
.IC V(n_bl0_42) = '0.8_lp' 
.IC V(n_br0_42) = 0 
.IC V(Xsram_0_42.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_42.n_1_2) = 0 
.IC V(n_bl0_43) = '0.8_lp' 
.IC V(n_br0_43) = 0 
.IC V(Xsram_0_43.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_43.n_1_2) = 0 
.IC V(n_bl0_44) = '0.8_lp' 
.IC V(n_br0_44) = 0 
.IC V(Xsram_0_44.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_44.n_1_2) = 0 
.IC V(n_bl0_45) = '0.8_lp' 
.IC V(n_br0_45) = 0 
.IC V(Xsram_0_45.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_45.n_1_2) = 0 
.IC V(n_bl0_46) = '0.8_lp' 
.IC V(n_br0_46) = 0 
.IC V(Xsram_0_46.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_46.n_1_2) = 0 
.IC V(n_bl0_47) = '0.8_lp' 
.IC V(n_br0_47) = 0 
.IC V(Xsram_0_47.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_47.n_1_2) = 0 
.IC V(n_bl0_48) = '0.8_lp' 
.IC V(n_br0_48) = 0 
.IC V(Xsram_0_48.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_48.n_1_2) = 0 
.IC V(n_bl0_49) = '0.8_lp' 
.IC V(n_br0_49) = 0 
.IC V(Xsram_0_49.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_49.n_1_2) = 0 
.IC V(n_bl0_50) = '0.8_lp' 
.IC V(n_br0_50) = 0 
.IC V(Xsram_0_50.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_50.n_1_2) = 0 
.IC V(n_bl0_51) = '0.8_lp' 
.IC V(n_br0_51) = 0 
.IC V(Xsram_0_51.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_51.n_1_2) = 0 
.IC V(n_bl0_52) = '0.8_lp' 
.IC V(n_br0_52) = 0 
.IC V(Xsram_0_52.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_52.n_1_2) = 0 
.IC V(n_bl0_53) = '0.8_lp' 
.IC V(n_br0_53) = 0 
.IC V(Xsram_0_53.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_53.n_1_2) = 0 
.IC V(n_bl0_54) = '0.8_lp' 
.IC V(n_br0_54) = 0 
.IC V(Xsram_0_54.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_54.n_1_2) = 0 
.IC V(n_bl0_55) = '0.8_lp' 
.IC V(n_br0_55) = 0 
.IC V(Xsram_0_55.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_55.n_1_2) = 0 
.IC V(n_bl0_56) = '0.8_lp' 
.IC V(n_br0_56) = 0 
.IC V(Xsram_0_56.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_56.n_1_2) = 0 
.IC V(n_bl0_57) = '0.8_lp' 
.IC V(n_br0_57) = 0 
.IC V(Xsram_0_57.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_57.n_1_2) = 0 
.IC V(n_bl0_58) = '0.8_lp' 
.IC V(n_br0_58) = 0 
.IC V(Xsram_0_58.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_58.n_1_2) = 0 
.IC V(n_bl0_59) = '0.8_lp' 
.IC V(n_br0_59) = 0 
.IC V(Xsram_0_59.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_59.n_1_2) = 0 
.IC V(n_bl0_60) = '0.8_lp' 
.IC V(n_br0_60) = 0 
.IC V(Xsram_0_60.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_60.n_1_2) = 0 
.IC V(n_bl0_61) = '0.8_lp' 
.IC V(n_br0_61) = 0 
.IC V(Xsram_0_61.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_61.n_1_2) = 0 
.IC V(n_bl0_62) = '0.8_lp' 
.IC V(n_br0_62) = 0 
.IC V(Xsram_0_62.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_62.n_1_2) = 0 
.IC V(n_bl0_63) = '0.8_lp' 
.IC V(n_br0_63) = 0 
.IC V(Xsram_0_63.n_1_1) = '0.8_lp' 
.IC V(Xsram_0_63.n_1_2) = 0 
.END