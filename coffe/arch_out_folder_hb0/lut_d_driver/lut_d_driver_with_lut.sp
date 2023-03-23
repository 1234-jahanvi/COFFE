.TITLE lut_d_driver 

********************************************************************************
** Include libraries, parameters and other
********************************************************************************

.LIB "../includes.l" INCLUDES

********************************************************************************
** Setup and input
********************************************************************************

.control 
 TRAN 1p 16n  
OPTIONS BRIEF=1

quit 
 .endc 
 * Input signal 
 Vground ground 0 0 

VIN_SRAM n_in_sram ground PULSE (0 0.8 4n 0 0 4n 8n)
VIN_GATE n_in_gate ground PULSE (0.8 0 3n 0 0 2n 4n)

* Power rail for the circuit under test.
* This allows us to measure power of a circuit under test without measuring the power of wave shaping and load circuitry.
V_LUT vdd_lut ground 0.8

********************************************************************************
** Measurement
********************************************************************************

* Total delays
.MEASURE TRAN meas_total_tfall TRIG V(n_3_1) VAL='0.8/2' RISE=2
+    TARG V(n_out) VAL='0.8/2' FALL=1
.MEASURE TRAN meas_total_trise TRIG V(n_3_1) VAL='0.8/2' RISE=1
+    TARG V(n_out) VAL='0.8/2' RISE=1

.MEASURE TRAN meas_logic_low_voltage FIND V(n_out) AT=3n

* Measure the power required to propagate a rise and a fall transition through the lut at 250MHz.
.MEASURE TRAN meas_current1  INTEG I(V_LUT) FROM=5ns TO=7ns
.MEASURE TRAN meas_current2  INTEG I(V_LUT) FROM=9ns TO=11ns
.MEASURE TRAN meas_avg_power PARAM = '-((meas_current1 + meas_current2)/4n)*0.8'

********************************************************************************
** Circuit
********************************************************************************

Xcb_mux_on_1 n_in_gate n_1_1 vsram vsram_n vdd ground cb_mux_on
Xlocal_routing_wire_load_1 n_1_1 n_1_2 vsram vsram_n vdd ground vdd local_routing_wire_load
Xlut_d_driver_1 n_1_2 n_3_1 vsram vsram_n n_rsel n_2_1 vdd ground lut_d_driver
Xlut_d_driver_not_1 n_2_1 n_1_4 vdd ground lut_d_driver_not
Xlut n_in_sram n_out vdd vdd vdd n_3_1 vdd vdd vdd_lut ground lut
Xlut_output_load n_out n_local_out n_general_out vsram vsram_n vdd ground vdd vdd lut_output_load

.END