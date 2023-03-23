.TITLE RAM Local routing multiplexer

********************************************************************************
** Include libraries, parameters and other
********************************************************************************

.LIB "../includes.l" INCLUDES

********************************************************************************
** Setup and input
********************************************************************************

.TRAN 1p 4n SWEEP DATA=sweep_data
.OPTIONS BRIEF=1

* Input signal
VIN n_in gnd PULSE (0 supply_v 0 0 0 2n 4n)

* Power rail for the circuit under test.
* This allows us to measure power of a circuit under test without measuring the power of wave shaping and load circuitry.
V_LOCAL_MUX vdd_local_mux gnd supply_v

********************************************************************************
** Measurement
********************************************************************************

* inv_RAM_local_mux_1 delay
.MEASURE TRAN meas_inv_hard_block_local_mux_1_tfall TRIG V(Xlocal_routing_wire_load_1.Xlocal_mux_on_1.n_in) VAL='supply_v/2' FALL=1
+    TARG V(Xlocal_routing_wire_load_1.Xlocal_mux_on_1.n_1_1) VAL='supply_v/2' FALL=1
.MEASURE TRAN meas_inv_hard_block_local_mux_1_trise TRIG V(Xlocal_routing_wire_load_1.Xlocal_mux_on_1.n_in) VAL='supply_v/2' RISE=1
+    TARG V(Xlocal_routing_wire_load_1.Xlocal_mux_on_1.n_1_1) VAL='supply_v/2' RISE=1

* inv_RAM_local_mux_2 delay
.MEASURE TRAN meas_inv_hard_block_local_mux_2_tfall TRIG V(Xlocal_routing_wire_load_1.Xlocal_mux_on_1.n_in) VAL='supply_v/2' FALL=1
+    TARG V(n_1_5) VAL='supply_v/2' FALL=1
.MEASURE TRAN meas_inv_hard_block_local_mux_2_trise TRIG V(Xlocal_routing_wire_load_1.Xlocal_mux_on_1.n_in) VAL='supply_v/2' RISE=1
+    TARG V(n_1_5) VAL='supply_v/2' RISE=1

* Total delays
.MEASURE TRAN meas_total_tfall TRIG V(Xlocal_routing_wire_load_1.Xlocal_mux_on_1.n_in) VAL='supply_v/2' FALL=1
+    TARG V(n_1_5) VAL='supply_v/2' FALL=1
.MEASURE TRAN meas_total_trise TRIG V(Xlocal_routing_wire_load_1.Xlocal_mux_on_1.n_in) VAL='supply_v/2' RISE=1
+    TARG V(n_1_5) VAL='supply_v/2' RISE=1

.MEASURE TRAN meas_logic_low_voltage FIND V(n_in) AT=3n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current INTEGRAL I(V_LOCAL_MUX) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-(meas_current/4n)*supply_v'

********************************************************************************
** Circuit
********************************************************************************

Xsb_mux_on_1 n_in n_1_1 vsram vsram_n vdd gnd sb_mux_on
Xrouting_wire_load_1 n_1_1 n_1_2 n_1_3 vsram vsram_n vdd gnd vdd vdd routing_wire_load
Xlocal_routing_wire_load_1 n_1_3 n_1_4 vsram vsram_n vdd gnd vdd_local_mux hard_block_local_routing_wire_load
Xwirer_edi n_1_4 n_1_5 wire Rw=wire_hard_block_1_res Cw=wire_hard_block_1_cap 
Xff n_1_5 n_hang1 vsram vsram_n vdd gnd gnd vdd gnd vdd vdd gnd ff

.END