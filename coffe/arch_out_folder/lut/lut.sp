.TITLE 5-LUT

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

VIN n_in ground PULSE (0 0.8 0 0 0 2n 4n)

********************************************************************************
** Measurement
********************************************************************************

* inv_lut_0sram_driver_1 delay
.MEASURE TRAN meas_inv_lut_0sram_driver_1_tfall TRIG V(n_in) VAL='0.8/2' RISE=1
+    TARG V(Xlut.n_1_1) VAL='0.8/2' FALL=1
.MEASURE TRAN meas_inv_lut_0sram_driver_1_trise TRIG V(n_in) VAL='0.8/2' FALL=1
+    TARG V(Xlut.n_1_1) VAL='0.8/2' RISE=1

* inv_lut_sram_driver_2 delay
.MEASURE TRAN meas_inv_lut_0sram_driver_2_tfall TRIG V(n_in) VAL='0.8/2' FALL=1
+    TARG V(Xlut.n_2_1) VAL='0.8/2' FALL=1
.MEASURE TRAN meas_inv_lut_0sram_driver_2_trise TRIG V(n_in) VAL='0.8/2' RISE=1
+    TARG V(Xlut.n_2_1) VAL='0.8/2' RISE=1

* Xinv_lut_int_buffer_1 delay
.MEASURE TRAN meas_inv_lut_int_buffer_1_tfall TRIG V(n_in) VAL='0.8/2' RISE=1
+    TARG V(Xlut.n_6_1) VAL='0.8/2' FALL=1
.MEASURE TRAN meas_inv_lut_int_buffer_1_trise TRIG V(n_in) VAL='0.8/2' FALL=1
+    TARG V(Xlut.n_6_1) VAL='0.8/2' RISE=1

* Xinv_lut_int_buffer_2 delay
.MEASURE TRAN meas_inv_lut_int_buffer_2_tfall TRIG V(n_in) VAL='0.8/2' FALL=1
+    TARG V(Xlut.n_7_1) VAL='0.8/2' FALL=1
.MEASURE TRAN meas_inv_lut_int_buffer_2_trise TRIG V(n_in) VAL='0.8/2' RISE=1
+    TARG V(Xlut.n_7_1) VAL='0.8/2' RISE=1

* Xinv_lut_out_buffer_1 delay
.MEASURE TRAN meas_inv_lut_out_buffer_1_tfall TRIG V(n_in) VAL='0.8/2' RISE=1
+    TARG V(Xlut.n_11_1) VAL='0.8/2' FALL=1
.MEASURE TRAN meas_inv_lut_out_buffer_1_trise TRIG V(n_in) VAL='0.8/2' FALL=1
+    TARG V(Xlut.n_11_1) VAL='0.8/2' RISE=1

* Xinv_lut_out_buffer_2 delay
.MEASURE TRAN meas_inv_lut_out_buffer_2_tfall TRIG V(n_in) VAL='0.8/2' FALL=1
+    TARG V(n_out) VAL='0.8/2' FALL=1
.MEASURE TRAN meas_inv_lut_out_buffer_2_trise TRIG V(n_in) VAL='0.8/2' RISE=1
+    TARG V(n_out) VAL='0.8/2' RISE=1

* Total delays
.MEASURE TRAN meas_total_tfall TRIG V(n_in) VAL='0.8/2' FALL=1
+    TARG V(n_out) VAL='0.8/2' FALL=1
.MEASURE TRAN meas_total_trise TRIG V(n_in) VAL='0.8/2' RISE=1
+    TARG V(n_out) VAL='0.8/2' RISE=1

.MEASURE TRAN meas_logic_low_voltage FIND V(n_out) AT=3n

********************************************************************************
** Circuit
********************************************************************************

Xlut n_in n_out vdd vdd vdd vdd vdd vdd vdd ground lut

Xlut_output_load n_out n_local_out n_general_out vsram vsram_n vdd ground vdd vdd lut_output_load

.END