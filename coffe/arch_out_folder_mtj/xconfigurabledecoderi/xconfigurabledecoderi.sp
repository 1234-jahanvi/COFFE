.TITLE RAM configurable decoder

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
V_test vdd_test ground 0.8_lp

********************************************************************************
** Measurement
********************************************************************************

* inv_columndecoder_1 delay
.MEASURE TRAN meas_inv_xconfigurabledecoderi_1_tfall TRIG V(n_1_4) VAL='0.8_lp/2' RISE=1
+    TARG V(n_1_13) VAL='0.8_lp/2' FALL=1
.MEASURE TRAN meas_inv_xconfigurabledecoderi_1_trise TRIG V(n_1_4) VAL='0.8_lp/2' FALL=1
+    TARG V(n_1_13) VAL='0.8_lp/2' RISE=1

* Total delays
.MEASURE TRAN meas_total_tfall TRIG V(n_1_4) VAL='0.8_lp/2' RISE=1
+    TARG V(n_1_13) VAL='0.8_lp/2' FALL=1
.MEASURE TRAN meas_total_trise TRIG V(n_1_4) VAL='0.8_lp/2' FALL=1
+    TARG V(n_1_13) VAL='0.8_lp/2' RISE=1

.MEASURE TRAN meas_logic_low_voltage FIND V(n_in) AT=3n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current  INTEG I(V_test) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-(meas_current/4n)*0.8_lp'

********************************************************************************
** Circuit
********************************************************************************

Xrouting_wire_load_1 n_in n_1_1 n_1_2 vsram vsram_n vdd ground vdd vdd routing_wire_load
Xlocal_routing_wire_load_1 n_1_2 n_1_3 vsram vsram_n vdd ground vdd RAM_local_routing_wire_load
Xinv_ff_output_driver n_1_3 n_1_4 vdd_lp ground inv_lp Wn=inv_ff_output_driver_nmos Wp=inv_ff_output_driver_pmos
Xdconfi n_1_4 n_1_5 vdd_test ground xconfigurabledecoderi
Xwire35 n_1_5 n_1_6 wire Rw=wire_xconfigurabledecoderi_res/8 Cw=wire_xconfigurabledecoderi_cap/8
Xnand35 n_1_6 n_hang_5 vdd_lp ground nand3 Wn=inv_nand3_xconfigurabledecoder3ii_1_nmos Wp=inv_nand3_xconfigurabledecoder3ii_1_pmos
Xwire36 n_1_6 n_1_7 wire Rw=wire_xconfigurabledecoderi_res/8 Cw=wire_xconfigurabledecoderi_cap/8
Xnand36 n_1_7 n_hang_6 vdd_lp ground nand3 Wn=inv_nand3_xconfigurabledecoder3ii_1_nmos Wp=inv_nand3_xconfigurabledecoder3ii_1_pmos
Xwire37 n_1_7 n_1_8 wire Rw=wire_xconfigurabledecoderi_res/8 Cw=wire_xconfigurabledecoderi_cap/8
Xnand37 n_1_8 n_hang_7 vdd_lp ground nand3 Wn=inv_nand3_xconfigurabledecoder3ii_1_nmos Wp=inv_nand3_xconfigurabledecoder3ii_1_pmos
Xwire38 n_1_8 n_1_9 wire Rw=wire_xconfigurabledecoderi_res/8 Cw=wire_xconfigurabledecoderi_cap/8
Xnand38 n_1_9 n_hang_8 vdd_lp ground nand3 Wn=inv_nand3_xconfigurabledecoder3ii_1_nmos Wp=inv_nand3_xconfigurabledecoder3ii_1_pmos
Xwire39 n_1_9 n_1_10 wire Rw=wire_xconfigurabledecoderi_res/8 Cw=wire_xconfigurabledecoderi_cap/8
Xnand39 n_1_10 n_hang_9 vdd_lp ground nand3 Wn=inv_nand3_xconfigurabledecoder3ii_1_nmos Wp=inv_nand3_xconfigurabledecoder3ii_1_pmos
Xwire310 n_1_10 n_1_11 wire Rw=wire_xconfigurabledecoderi_res/8 Cw=wire_xconfigurabledecoderi_cap/8
Xnand310 n_1_11 n_hang_10 vdd_lp ground nand3 Wn=inv_nand3_xconfigurabledecoder3ii_1_nmos Wp=inv_nand3_xconfigurabledecoder3ii_1_pmos
Xwire311 n_1_11 n_1_12 wire Rw=wire_xconfigurabledecoderi_res/8 Cw=wire_xconfigurabledecoderi_cap/8
Xnand311 n_1_12 n_hang_11 vdd_lp ground nand3 Wn=inv_nand3_xconfigurabledecoder3ii_1_nmos Wp=inv_nand3_xconfigurabledecoder3ii_1_pmos
Xwire312 n_1_12 n_1_13 wire Rw=wire_xconfigurabledecoderi_res/8 Cw=wire_xconfigurabledecoderi_cap/8
Xnand312 n_1_13 n_hang_12 vdd_lp ground nand3 Wn=inv_nand3_xconfigurabledecoder3ii_1_nmos Wp=inv_nand3_xconfigurabledecoder3ii_1_pmos
.END