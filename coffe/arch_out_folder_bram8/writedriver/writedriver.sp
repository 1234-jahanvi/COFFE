.TITLE RAM write driver

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
VIwe we ground PULSE (0 0.8_lp 0 0 0 4n 8n)
* Power rail for the circuit under test.
* This allows us to measure power of a circuit under test without measuring the power of wave shaping and load circuitry.
V_write vdd_wr ground 0.8_lp

********************************************************************************
** Measurement
********************************************************************************

* inv_writedriver_1 delay
.MEASURE TRAN meas_inv_writedriver_1_tfall TRIG V(xwrite.n_din) VAL='0.8_lp/2' RISE=1
+    TARG V(xwrite.n_dinb) VAL='0.8_lp/2' FALL=1
.MEASURE TRAN meas_inv_writedriver_1_trise TRIG V(xwrite.n_din) VAL='0.8_lp/2' FALL=1
+    TARG V(xwrite.n_dinb) VAL='0.8_lp/2' RISE=1

* inv_writedriver_2 delay
.MEASURE TRAN meas_inv_writedriver_2_tfall TRIG V(xwrite.n_we) VAL='0.8_lp/2' RISE=1
+    TARG V(xwrite.n_web) VAL='0.8_lp/2' FALL=1
.MEASURE TRAN meas_inv_writedriver_2_trise TRIG V(xwrite.n_we) VAL='0.8_lp/2' FALL=1
+    TARG V(xwrite.n_web) VAL='0.8_lp/2' RISE=1

* Total delays
.MEASURE TRAN meas_total_tfall TRIG V(n_in) VAL='0.8_lp/2' RISE=1
+    TARG V(Xsram1.n_1_2) VAL='0.8_lp/2' FALL=1
.MEASURE TRAN meas_total_trise TRIG V(n_in) VAL='0.8_lp/2' FALL=1
+    TARG V(Xsram1.n_1_2) VAL='0.8_lp/2' RISE=1

.MEASURE TRAN meas_logic_low_voltage FIND V(n_in) AT=3n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current  INTEG I(V_write) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-(meas_current/4n)*0.8_lp'

********************************************************************************
** Circuit
********************************************************************************

X_inv_shape_0 n_in n_in1 vdd_lp ground inv Wn=90n Wp=90n
X_inv_shape_1 n_in1 n_in_shaped vdd_lp ground inv Wn=90n Wp=90n
X_inv_shape_2 we n_we vdd_lp ground inv Wn=90n Wp=90n
X_inv_shape_3 n_we n_we_shaped vdd_lp ground inv Wn=90n Wp=90n
xprecharge vdd_lp n_bl_0 n_br_0 vdd_lp ground precharge
Xwire2 n_bl_1 n_bl_2 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer2 n_br_1 n_br_2 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram2 ground ground n_bl_2 ground n_br_2 ground vdd_lp ground memorycell
Xwire3 n_bl_2 n_bl_3 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer3 n_br_2 n_br_3 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram3 ground ground n_bl_3 ground n_br_3 ground vdd_lp ground memorycell
Xwire4 n_bl_3 n_bl_4 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer4 n_br_3 n_br_4 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram4 ground ground n_bl_4 ground n_br_4 ground vdd_lp ground memorycell
Xwire5 n_bl_4 n_bl_5 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer5 n_br_4 n_br_5 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram5 ground ground n_bl_5 ground n_br_5 ground vdd_lp ground memorycell
Xwire6 n_bl_5 n_bl_6 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer6 n_br_5 n_br_6 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram6 ground ground n_bl_6 ground n_br_6 ground vdd_lp ground memorycell
Xwire7 n_bl_6 n_bl_7 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer7 n_br_6 n_br_7 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram7 ground ground n_bl_7 ground n_br_7 ground vdd_lp ground memorycell
Xwire8 n_bl_7 n_bl_8 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer8 n_br_7 n_br_8 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram8 ground ground n_bl_8 ground n_br_8 ground vdd_lp ground memorycell
Xwire9 n_bl_8 n_bl_9 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer9 n_br_8 n_br_9 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram9 ground ground n_bl_9 ground n_br_9 ground vdd_lp ground memorycell
Xwire10 n_bl_9 n_bl_10 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer10 n_br_9 n_br_10 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram10 ground ground n_bl_10 ground n_br_10 ground vdd_lp ground memorycell
Xwire11 n_bl_10 n_bl_11 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer11 n_br_10 n_br_11 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram11 ground ground n_bl_11 ground n_br_11 ground vdd_lp ground memorycell
Xwire12 n_bl_11 n_bl_12 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer12 n_br_11 n_br_12 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram12 ground ground n_bl_12 ground n_br_12 ground vdd_lp ground memorycell
Xwire13 n_bl_12 n_bl_13 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer13 n_br_12 n_br_13 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram13 ground ground n_bl_13 ground n_br_13 ground vdd_lp ground memorycell
Xwire14 n_bl_13 n_bl_14 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer14 n_br_13 n_br_14 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram14 ground ground n_bl_14 ground n_br_14 ground vdd_lp ground memorycell
Xwire15 n_bl_14 n_bl_15 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer15 n_br_14 n_br_15 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram15 ground ground n_bl_15 ground n_br_15 ground vdd_lp ground memorycell
Xwire16 n_bl_15 n_bl_16 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer16 n_br_15 n_br_16 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram16 ground ground n_bl_16 ground n_br_16 ground vdd_lp ground memorycell
Xwire17 n_bl_16 n_bl_17 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer17 n_br_16 n_br_17 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram17 ground ground n_bl_17 ground n_br_17 ground vdd_lp ground memorycell
Xwire18 n_bl_17 n_bl_18 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer18 n_br_17 n_br_18 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram18 ground ground n_bl_18 ground n_br_18 ground vdd_lp ground memorycell
Xwire19 n_bl_18 n_bl_19 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer19 n_br_18 n_br_19 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram19 ground ground n_bl_19 ground n_br_19 ground vdd_lp ground memorycell
Xwire20 n_bl_19 n_bl_20 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer20 n_br_19 n_br_20 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram20 ground ground n_bl_20 ground n_br_20 ground vdd_lp ground memorycell
Xwire21 n_bl_20 n_bl_21 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer21 n_br_20 n_br_21 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram21 ground ground n_bl_21 ground n_br_21 ground vdd_lp ground memorycell
Xwire22 n_bl_21 n_bl_22 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer22 n_br_21 n_br_22 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram22 ground ground n_bl_22 ground n_br_22 ground vdd_lp ground memorycell
Xwire23 n_bl_22 n_bl_23 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer23 n_br_22 n_br_23 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram23 ground ground n_bl_23 ground n_br_23 ground vdd_lp ground memorycell
Xwire24 n_bl_23 n_bl_24 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer24 n_br_23 n_br_24 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram24 ground ground n_bl_24 ground n_br_24 ground vdd_lp ground memorycell
Xwire25 n_bl_24 n_bl_25 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer25 n_br_24 n_br_25 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram25 ground ground n_bl_25 ground n_br_25 ground vdd_lp ground memorycell
Xwire26 n_bl_25 n_bl_26 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer26 n_br_25 n_br_26 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram26 ground ground n_bl_26 ground n_br_26 ground vdd_lp ground memorycell
Xwire27 n_bl_26 n_bl_27 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer27 n_br_26 n_br_27 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram27 ground ground n_bl_27 ground n_br_27 ground vdd_lp ground memorycell
Xwire28 n_bl_27 n_bl_28 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer28 n_br_27 n_br_28 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram28 ground ground n_bl_28 ground n_br_28 ground vdd_lp ground memorycell
Xwire29 n_bl_28 n_bl_29 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer29 n_br_28 n_br_29 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram29 ground ground n_bl_29 ground n_br_29 ground vdd_lp ground memorycell
Xwire30 n_bl_29 n_bl_30 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer30 n_br_29 n_br_30 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram30 ground ground n_bl_30 ground n_br_30 ground vdd_lp ground memorycell
Xwire31 n_bl_30 n_bl_31 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer31 n_br_30 n_br_31 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram31 ground ground n_bl_31 ground n_br_31 ground vdd_lp ground memorycell
Xwire32 n_bl_31 n_bl_32 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer32 n_br_31 n_br_32 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram32 ground ground n_bl_32 ground n_br_32 ground vdd_lp ground memorycell
Xwire33 n_bl_32 n_bl_33 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer33 n_br_32 n_br_33 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram33 ground ground n_bl_33 ground n_br_33 ground vdd_lp ground memorycell
Xwire34 n_bl_33 n_bl_34 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer34 n_br_33 n_br_34 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram34 ground ground n_bl_34 ground n_br_34 ground vdd_lp ground memorycell
Xwire35 n_bl_34 n_bl_35 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer35 n_br_34 n_br_35 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram35 ground ground n_bl_35 ground n_br_35 ground vdd_lp ground memorycell
Xwire36 n_bl_35 n_bl_36 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer36 n_br_35 n_br_36 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram36 ground ground n_bl_36 ground n_br_36 ground vdd_lp ground memorycell
Xwire37 n_bl_36 n_bl_37 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer37 n_br_36 n_br_37 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram37 ground ground n_bl_37 ground n_br_37 ground vdd_lp ground memorycell
Xwire38 n_bl_37 n_bl_38 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer38 n_br_37 n_br_38 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram38 ground ground n_bl_38 ground n_br_38 ground vdd_lp ground memorycell
Xwire39 n_bl_38 n_bl_39 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer39 n_br_38 n_br_39 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram39 ground ground n_bl_39 ground n_br_39 ground vdd_lp ground memorycell
Xwire40 n_bl_39 n_bl_40 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer40 n_br_39 n_br_40 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram40 ground ground n_bl_40 ground n_br_40 ground vdd_lp ground memorycell
Xwire41 n_bl_40 n_bl_41 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer41 n_br_40 n_br_41 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram41 ground ground n_bl_41 ground n_br_41 ground vdd_lp ground memorycell
Xwire42 n_bl_41 n_bl_42 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer42 n_br_41 n_br_42 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram42 ground ground n_bl_42 ground n_br_42 ground vdd_lp ground memorycell
Xwire43 n_bl_42 n_bl_43 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer43 n_br_42 n_br_43 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram43 ground ground n_bl_43 ground n_br_43 ground vdd_lp ground memorycell
Xwire44 n_bl_43 n_bl_44 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer44 n_br_43 n_br_44 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram44 ground ground n_bl_44 ground n_br_44 ground vdd_lp ground memorycell
Xwire45 n_bl_44 n_bl_45 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer45 n_br_44 n_br_45 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram45 ground ground n_bl_45 ground n_br_45 ground vdd_lp ground memorycell
Xwire46 n_bl_45 n_bl_46 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer46 n_br_45 n_br_46 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram46 ground ground n_bl_46 ground n_br_46 ground vdd_lp ground memorycell
Xwire47 n_bl_46 n_bl_47 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer47 n_br_46 n_br_47 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram47 ground ground n_bl_47 ground n_br_47 ground vdd_lp ground memorycell
Xwire48 n_bl_47 n_bl_48 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer48 n_br_47 n_br_48 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram48 ground ground n_bl_48 ground n_br_48 ground vdd_lp ground memorycell
Xwire49 n_bl_48 n_bl_49 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer49 n_br_48 n_br_49 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram49 ground ground n_bl_49 ground n_br_49 ground vdd_lp ground memorycell
Xwire50 n_bl_49 n_bl_50 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer50 n_br_49 n_br_50 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram50 ground ground n_bl_50 ground n_br_50 ground vdd_lp ground memorycell
Xwire51 n_bl_50 n_bl_51 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer51 n_br_50 n_br_51 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram51 ground ground n_bl_51 ground n_br_51 ground vdd_lp ground memorycell
Xwire52 n_bl_51 n_bl_52 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer52 n_br_51 n_br_52 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram52 ground ground n_bl_52 ground n_br_52 ground vdd_lp ground memorycell
Xwire53 n_bl_52 n_bl_53 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer53 n_br_52 n_br_53 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram53 ground ground n_bl_53 ground n_br_53 ground vdd_lp ground memorycell
Xwire54 n_bl_53 n_bl_54 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer54 n_br_53 n_br_54 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram54 ground ground n_bl_54 ground n_br_54 ground vdd_lp ground memorycell
Xwire55 n_bl_54 n_bl_55 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer55 n_br_54 n_br_55 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram55 ground ground n_bl_55 ground n_br_55 ground vdd_lp ground memorycell
Xwire56 n_bl_55 n_bl_56 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer56 n_br_55 n_br_56 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram56 ground ground n_bl_56 ground n_br_56 ground vdd_lp ground memorycell
Xwire57 n_bl_56 n_bl_57 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer57 n_br_56 n_br_57 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram57 ground ground n_bl_57 ground n_br_57 ground vdd_lp ground memorycell
Xwire58 n_bl_57 n_bl_58 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer58 n_br_57 n_br_58 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram58 ground ground n_bl_58 ground n_br_58 ground vdd_lp ground memorycell
Xwire59 n_bl_58 n_bl_59 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer59 n_br_58 n_br_59 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram59 ground ground n_bl_59 ground n_br_59 ground vdd_lp ground memorycell
Xwire60 n_bl_59 n_bl_60 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer60 n_br_59 n_br_60 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram60 ground ground n_bl_60 ground n_br_60 ground vdd_lp ground memorycell
Xwire61 n_bl_60 n_bl_61 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer61 n_br_60 n_br_61 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram61 ground ground n_bl_61 ground n_br_61 ground vdd_lp ground memorycell
Xwire62 n_bl_61 n_bl_62 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer62 n_br_61 n_br_62 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram62 ground ground n_bl_62 ground n_br_62 ground vdd_lp ground memorycell
Xwire63 n_bl_62 n_bl_63 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer63 n_br_62 n_br_63 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram63 ground ground n_bl_63 ground n_br_63 ground vdd_lp ground memorycell
Xwire64 n_bl_63 n_bl_64 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer64 n_br_63 n_br_64 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram64 ground ground n_bl_64 ground n_br_64 ground vdd_lp ground memorycell
Xwire1 n_bl_0 n_bl_1 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xwirer1 n_br_0 n_br_1 wire Rw=wire_memorycell_vertical_res/64 Cw=wire_memorycell_vertical_cap/64
Xsram1 vdd_lp ground n_bl_0 ground n_br_0 ground vdd_lp ground memorycell
.IC V(Xsram1.n_1_2) = '0.8_lp'
.IC V(Xsram1.n_1_1) = 0
.IC V(xsamp1.n_1_2) = 0
.IC V(xsamp1.n_1_1) = '0.8_lp'
xtgate1 n_bl_64 tgate_l vdd_lp ground vdd_lp ground RAM_tgate_lp
xtgater n_br_64 tgate_r vdd_lp ground vdd_lp ground RAM_tgate_lp
.IC V(tgate_r) = '0.8_lp'
.IC V(tgate_l) = '0.8_lp'
.IC V(n_br_-1) = '0.8_lp'
.IC V(n_br_-1) = '0.8_lp'
.IC V(n_br_0) = '0.8_lp'
.IC V(n_br_0) = '0.8_lp'
.IC V(n_br_1) = '0.8_lp'
.IC V(n_br_1) = '0.8_lp'
.IC V(n_br_2) = '0.8_lp'
.IC V(n_br_2) = '0.8_lp'
.IC V(n_br_3) = '0.8_lp'
.IC V(n_br_3) = '0.8_lp'
.IC V(n_br_4) = '0.8_lp'
.IC V(n_br_4) = '0.8_lp'
.IC V(n_br_5) = '0.8_lp'
.IC V(n_br_5) = '0.8_lp'
.IC V(n_br_6) = '0.8_lp'
.IC V(n_br_6) = '0.8_lp'
.IC V(n_br_7) = '0.8_lp'
.IC V(n_br_7) = '0.8_lp'
.IC V(n_br_8) = '0.8_lp'
.IC V(n_br_8) = '0.8_lp'
.IC V(n_br_9) = '0.8_lp'
.IC V(n_br_9) = '0.8_lp'
.IC V(n_br_10) = '0.8_lp'
.IC V(n_br_10) = '0.8_lp'
.IC V(n_br_11) = '0.8_lp'
.IC V(n_br_11) = '0.8_lp'
.IC V(n_br_12) = '0.8_lp'
.IC V(n_br_12) = '0.8_lp'
.IC V(n_br_13) = '0.8_lp'
.IC V(n_br_13) = '0.8_lp'
.IC V(n_br_14) = '0.8_lp'
.IC V(n_br_14) = '0.8_lp'
.IC V(n_br_15) = '0.8_lp'
.IC V(n_br_15) = '0.8_lp'
.IC V(n_br_16) = '0.8_lp'
.IC V(n_br_16) = '0.8_lp'
.IC V(n_br_17) = '0.8_lp'
.IC V(n_br_17) = '0.8_lp'
.IC V(n_br_18) = '0.8_lp'
.IC V(n_br_18) = '0.8_lp'
.IC V(n_br_19) = '0.8_lp'
.IC V(n_br_19) = '0.8_lp'
.IC V(n_br_20) = '0.8_lp'
.IC V(n_br_20) = '0.8_lp'
.IC V(n_br_21) = '0.8_lp'
.IC V(n_br_21) = '0.8_lp'
.IC V(n_br_22) = '0.8_lp'
.IC V(n_br_22) = '0.8_lp'
.IC V(n_br_23) = '0.8_lp'
.IC V(n_br_23) = '0.8_lp'
.IC V(n_br_24) = '0.8_lp'
.IC V(n_br_24) = '0.8_lp'
.IC V(n_br_25) = '0.8_lp'
.IC V(n_br_25) = '0.8_lp'
.IC V(n_br_26) = '0.8_lp'
.IC V(n_br_26) = '0.8_lp'
.IC V(n_br_27) = '0.8_lp'
.IC V(n_br_27) = '0.8_lp'
.IC V(n_br_28) = '0.8_lp'
.IC V(n_br_28) = '0.8_lp'
.IC V(n_br_29) = '0.8_lp'
.IC V(n_br_29) = '0.8_lp'
.IC V(n_br_30) = '0.8_lp'
.IC V(n_br_30) = '0.8_lp'
.IC V(n_br_31) = '0.8_lp'
.IC V(n_br_31) = '0.8_lp'
.IC V(n_br_32) = '0.8_lp'
.IC V(n_br_32) = '0.8_lp'
.IC V(n_br_33) = '0.8_lp'
.IC V(n_br_33) = '0.8_lp'
.IC V(n_br_34) = '0.8_lp'
.IC V(n_br_34) = '0.8_lp'
.IC V(n_br_35) = '0.8_lp'
.IC V(n_br_35) = '0.8_lp'
.IC V(n_br_36) = '0.8_lp'
.IC V(n_br_36) = '0.8_lp'
.IC V(n_br_37) = '0.8_lp'
.IC V(n_br_37) = '0.8_lp'
.IC V(n_br_38) = '0.8_lp'
.IC V(n_br_38) = '0.8_lp'
.IC V(n_br_39) = '0.8_lp'
.IC V(n_br_39) = '0.8_lp'
.IC V(n_br_40) = '0.8_lp'
.IC V(n_br_40) = '0.8_lp'
.IC V(n_br_41) = '0.8_lp'
.IC V(n_br_41) = '0.8_lp'
.IC V(n_br_42) = '0.8_lp'
.IC V(n_br_42) = '0.8_lp'
.IC V(n_br_43) = '0.8_lp'
.IC V(n_br_43) = '0.8_lp'
.IC V(n_br_44) = '0.8_lp'
.IC V(n_br_44) = '0.8_lp'
.IC V(n_br_45) = '0.8_lp'
.IC V(n_br_45) = '0.8_lp'
.IC V(n_br_46) = '0.8_lp'
.IC V(n_br_46) = '0.8_lp'
.IC V(n_br_47) = '0.8_lp'
.IC V(n_br_47) = '0.8_lp'
.IC V(n_br_48) = '0.8_lp'
.IC V(n_br_48) = '0.8_lp'
.IC V(n_br_49) = '0.8_lp'
.IC V(n_br_49) = '0.8_lp'
.IC V(n_br_50) = '0.8_lp'
.IC V(n_br_50) = '0.8_lp'
.IC V(n_br_51) = '0.8_lp'
.IC V(n_br_51) = '0.8_lp'
.IC V(n_br_52) = '0.8_lp'
.IC V(n_br_52) = '0.8_lp'
.IC V(n_br_53) = '0.8_lp'
.IC V(n_br_53) = '0.8_lp'
.IC V(n_br_54) = '0.8_lp'
.IC V(n_br_54) = '0.8_lp'
.IC V(n_br_55) = '0.8_lp'
.IC V(n_br_55) = '0.8_lp'
.IC V(n_br_56) = '0.8_lp'
.IC V(n_br_56) = '0.8_lp'
.IC V(n_br_57) = '0.8_lp'
.IC V(n_br_57) = '0.8_lp'
.IC V(n_br_58) = '0.8_lp'
.IC V(n_br_58) = '0.8_lp'
.IC V(n_br_59) = '0.8_lp'
.IC V(n_br_59) = '0.8_lp'
.IC V(n_br_60) = '0.8_lp'
.IC V(n_br_60) = '0.8_lp'
.IC V(n_br_61) = '0.8_lp'
.IC V(n_br_61) = '0.8_lp'
.IC V(n_br_62) = '0.8_lp'
.IC V(n_br_62) = '0.8_lp'
.IC V(n_br_63) = '0.8_lp'
.IC V(n_br_63) = '0.8_lp'
xwrite n_we_shaped n_in_shaped tgate_l tgate_r vdd_wr ground writedriver
xsamp1 vdd_lp tgate_l tgate_r n_hang_samp vdd_lp ground samp1
.END