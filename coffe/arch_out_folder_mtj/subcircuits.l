*** SUBCIRCUITS

.LIB SUBCIRCUITS

******************************************************************************************
* sb_mux driver subcircuit (12:1)
******************************************************************************************
.SUBCKT sb_mux_driver n_in n_out n_vdd n_gnd
Xrest_sb_mux n_in n_1_1 n_vdd n_gnd rest Wp=rest_sb_mux_pmos
Xinv_sb_mux_1 n_in n_1_1 n_vdd n_gnd inv Wn=inv_sb_mux_1_nmos Wp=inv_sb_mux_1_pmos
Xwire_sb_mux_driver n_1_1 n_1_2 wire Rw=wire_sb_mux_driver_res Cw=wire_sb_mux_driver_cap
Xinv_sb_mux_2 n_1_2 n_out n_vdd n_gnd inv Wn=inv_sb_mux_2_nmos Wp=inv_sb_mux_2_pmos
.ENDS


******************************************************************************************
* sb_mux subcircuit (12:1), turned off 
******************************************************************************************
.SUBCKT sb_mux_off n_in n_gate n_gate_n n_vdd n_gnd
Xptran_sb_mux_L1 n_in n_gnd n_gnd n_gnd ptran Wn=ptran_sb_mux_L1_nmos
.ENDS


******************************************************************************************
* sb_mux subcircuit (12:1), partially turned on
******************************************************************************************
.SUBCKT sb_mux_partial n_in n_gate n_gate_n n_vdd n_gnd
Xptran_sb_mux_L1 n_in n_1 n_gate n_gnd ptran Wn=ptran_sb_mux_L1_nmos
Xwire_sb_mux_L1_1 n_1 n_1_1 wire Rw='wire_sb_mux_L1_res/4' Cw='wire_sb_mux_L1_cap/4'
Xptran_sb_mux_L1_1h n_gnd n_1_1 n_gnd n_gnd ptran Wn=ptran_sb_mux_L1_nmos
Xwire_sb_mux_L1_2 n_1_1 n_1_2 wire Rw='wire_sb_mux_L1_res/4' Cw='wire_sb_mux_L1_cap/4'
Xptran_sb_mux_L1_2h n_gnd n_1_2 n_gnd n_gnd ptran Wn=ptran_sb_mux_L1_nmos
Xwire_sb_mux_L1_3 n_1_2 n_1_3 wire Rw='wire_sb_mux_L1_res/4' Cw='wire_sb_mux_L1_cap/4'
Xptran_sb_mux_L1_3h n_gnd n_1_3 n_gnd n_gnd ptran Wn=ptran_sb_mux_L1_nmos
Xwire_sb_mux_L1_4 n_1_3 n_1_4 wire Rw='wire_sb_mux_L1_res/4' Cw='wire_sb_mux_L1_cap/4'
Xptran_sb_mux_L2 n_1_4 n_gnd n_gnd n_gnd ptran Wn=ptran_sb_mux_L2_nmos
.ENDS


******************************************************************************************
* sb_mux subcircuit (12:1), fully turned on (mux only)
******************************************************************************************
.SUBCKT sb_mux_on_mux_only n_in n_out n_gate n_gate_n n_vdd n_gnd
Xptran_sb_mux_L1 n_in n_1 n_gate n_gnd ptran Wn=ptran_sb_mux_L1_nmos
Xwire_sb_mux_L1_1 n_1 n_1_1 wire Rw='wire_sb_mux_L1_res/4' Cw='wire_sb_mux_L1_cap/4'
Xptran_sb_mux_L1_1h n_gnd n_1_1 n_gnd n_gnd ptran Wn=ptran_sb_mux_L1_nmos
Xwire_sb_mux_L1_2 n_1_1 n_1_2 wire Rw='wire_sb_mux_L1_res/4' Cw='wire_sb_mux_L1_cap/4'
Xptran_sb_mux_L1_2h n_gnd n_1_2 n_gnd n_gnd ptran Wn=ptran_sb_mux_L1_nmos
Xwire_sb_mux_L1_3 n_1_2 n_1_3 wire Rw='wire_sb_mux_L1_res/4' Cw='wire_sb_mux_L1_cap/4'
Xptran_sb_mux_L1_3h n_gnd n_1_3 n_gnd n_gnd ptran Wn=ptran_sb_mux_L1_nmos
Xwire_sb_mux_L1_4 n_1_3 n_1_4 wire Rw='wire_sb_mux_L1_res/4' Cw='wire_sb_mux_L1_cap/4'
Xptran_sb_mux_L2 n_1_4 n_2 n_gate n_gnd ptran Wn=ptran_sb_mux_L2_nmos
Xwire_sb_mux_L2_1 n_2 n_out wire Rw='wire_sb_mux_L2_res/2' Cw='wire_sb_mux_L2_cap/2'
Xptran_sb_mux_L2_1h n_gnd n_out n_gnd n_gnd ptran Wn=ptran_sb_mux_L2_nmos
Xwire_sb_mux_L2_2  n_out n_2_1 wire Rw='wire_sb_mux_L2_res/2' Cw='wire_sb_mux_L2_cap/2'
Xptran_sb_mux_L2_2h n_gnd n_2_1 n_gnd n_gnd ptran Wn=ptran_sb_mux_L2_nmos
.ENDS


******************************************************************************************
* sb_mux subcircuit (12:1), fully turned on 
******************************************************************************************
.SUBCKT sb_mux_on n_in n_out n_gate n_gate_n n_vdd n_gnd
Xsb_mux_on_mux_only n_in n_1_1 n_gate n_gate_n n_vdd n_gnd sb_mux_on_mux_only
Xsb_mux_driver n_1_1 n_out n_vdd n_gnd sb_mux_driver
.ENDS


******************************************************************************************
* cb_mux driver subcircuit (64:1)
******************************************************************************************
.SUBCKT cb_mux_driver n_in n_out n_vdd n_gnd
Xrest_cb_mux n_in n_1_1 n_vdd n_gnd rest Wp=rest_cb_mux_pmos
Xinv_cb_mux_1 n_in n_1_1 n_vdd n_gnd inv Wn=inv_cb_mux_1_nmos Wp=inv_cb_mux_1_pmos
Xwire_cb_mux_driver n_1_1 n_1_2 wire Rw=wire_cb_mux_driver_res Cw=wire_cb_mux_driver_cap
Xinv_cb_mux_2 n_1_2 n_out n_vdd n_gnd inv Wn=inv_cb_mux_2_nmos Wp=inv_cb_mux_2_pmos
.ENDS


******************************************************************************************
* cb_mux subcircuit (64:1), turned off 
******************************************************************************************
.SUBCKT cb_mux_off n_in n_gate n_gate_n n_vdd n_gnd
Xptran_cb_mux_L1 n_in n_gnd n_gnd n_gnd ptran Wn=ptran_cb_mux_L1_nmos
.ENDS


******************************************************************************************
* cb_mux subcircuit (64:1), partially turned on
******************************************************************************************
.SUBCKT cb_mux_partial n_in n_gate n_gate_n n_vdd n_gnd
Xptran_cb_mux_L1 n_in n_1 n_gate n_gnd ptran Wn=ptran_cb_mux_L1_nmos
Xwire_cb_mux_L1_1 n_1 n_1_1 wire Rw='wire_cb_mux_L1_res/8' Cw='wire_cb_mux_L1_cap/8'
Xptran_cb_mux_L1_1h n_gnd n_1_1 n_gnd n_gnd ptran Wn=ptran_cb_mux_L1_nmos
Xwire_cb_mux_L1_2 n_1_1 n_1_2 wire Rw='wire_cb_mux_L1_res/8' Cw='wire_cb_mux_L1_cap/8'
Xptran_cb_mux_L1_2h n_gnd n_1_2 n_gnd n_gnd ptran Wn=ptran_cb_mux_L1_nmos
Xwire_cb_mux_L1_3 n_1_2 n_1_3 wire Rw='wire_cb_mux_L1_res/8' Cw='wire_cb_mux_L1_cap/8'
Xptran_cb_mux_L1_3h n_gnd n_1_3 n_gnd n_gnd ptran Wn=ptran_cb_mux_L1_nmos
Xwire_cb_mux_L1_4 n_1_3 n_1_4 wire Rw='wire_cb_mux_L1_res/8' Cw='wire_cb_mux_L1_cap/8'
Xptran_cb_mux_L1_4h n_gnd n_1_4 n_gnd n_gnd ptran Wn=ptran_cb_mux_L1_nmos
Xwire_cb_mux_L1_5 n_1_4 n_1_5 wire Rw='wire_cb_mux_L1_res/8' Cw='wire_cb_mux_L1_cap/8'
Xptran_cb_mux_L1_5h n_gnd n_1_5 n_gnd n_gnd ptran Wn=ptran_cb_mux_L1_nmos
Xwire_cb_mux_L1_6 n_1_5 n_1_6 wire Rw='wire_cb_mux_L1_res/8' Cw='wire_cb_mux_L1_cap/8'
Xptran_cb_mux_L1_6h n_gnd n_1_6 n_gnd n_gnd ptran Wn=ptran_cb_mux_L1_nmos
Xwire_cb_mux_L1_7 n_1_6 n_1_7 wire Rw='wire_cb_mux_L1_res/8' Cw='wire_cb_mux_L1_cap/8'
Xptran_cb_mux_L1_7h n_gnd n_1_7 n_gnd n_gnd ptran Wn=ptran_cb_mux_L1_nmos
Xwire_cb_mux_L1_8 n_1_7 n_1_8 wire Rw='wire_cb_mux_L1_res/8' Cw='wire_cb_mux_L1_cap/8'
Xptran_cb_mux_L2 n_1_8 n_gnd n_gnd n_gnd ptran Wn=ptran_cb_mux_L2_nmos
.ENDS


******************************************************************************************
* cb_mux subcircuit (64:1), fully turned on (mux only)
******************************************************************************************
.SUBCKT cb_mux_on_mux_only n_in n_out n_gate n_gate_n n_vdd n_gnd
Xptran_cb_mux_L1 n_in n_1 n_gate n_gnd ptran Wn=ptran_cb_mux_L1_nmos
Xwire_cb_mux_L1_1 n_1 n_1_1 wire Rw='wire_cb_mux_L1_res/8' Cw='wire_cb_mux_L1_cap/8'
Xptran_cb_mux_L1_1h n_gnd n_1_1 n_gnd n_gnd ptran Wn=ptran_cb_mux_L1_nmos
Xwire_cb_mux_L1_2 n_1_1 n_1_2 wire Rw='wire_cb_mux_L1_res/8' Cw='wire_cb_mux_L1_cap/8'
Xptran_cb_mux_L1_2h n_gnd n_1_2 n_gnd n_gnd ptran Wn=ptran_cb_mux_L1_nmos
Xwire_cb_mux_L1_3 n_1_2 n_1_3 wire Rw='wire_cb_mux_L1_res/8' Cw='wire_cb_mux_L1_cap/8'
Xptran_cb_mux_L1_3h n_gnd n_1_3 n_gnd n_gnd ptran Wn=ptran_cb_mux_L1_nmos
Xwire_cb_mux_L1_4 n_1_3 n_1_4 wire Rw='wire_cb_mux_L1_res/8' Cw='wire_cb_mux_L1_cap/8'
Xptran_cb_mux_L1_4h n_gnd n_1_4 n_gnd n_gnd ptran Wn=ptran_cb_mux_L1_nmos
Xwire_cb_mux_L1_5 n_1_4 n_1_5 wire Rw='wire_cb_mux_L1_res/8' Cw='wire_cb_mux_L1_cap/8'
Xptran_cb_mux_L1_5h n_gnd n_1_5 n_gnd n_gnd ptran Wn=ptran_cb_mux_L1_nmos
Xwire_cb_mux_L1_6 n_1_5 n_1_6 wire Rw='wire_cb_mux_L1_res/8' Cw='wire_cb_mux_L1_cap/8'
Xptran_cb_mux_L1_6h n_gnd n_1_6 n_gnd n_gnd ptran Wn=ptran_cb_mux_L1_nmos
Xwire_cb_mux_L1_7 n_1_6 n_1_7 wire Rw='wire_cb_mux_L1_res/8' Cw='wire_cb_mux_L1_cap/8'
Xptran_cb_mux_L1_7h n_gnd n_1_7 n_gnd n_gnd ptran Wn=ptran_cb_mux_L1_nmos
Xwire_cb_mux_L1_8 n_1_7 n_1_8 wire Rw='wire_cb_mux_L1_res/8' Cw='wire_cb_mux_L1_cap/8'
Xptran_cb_mux_L2 n_1_8 n_2 n_gate n_gnd ptran Wn=ptran_cb_mux_L2_nmos
Xwire_cb_mux_L2_1 n_2 n_2_1 wire Rw='wire_cb_mux_L2_res/7' Cw='wire_cb_mux_L2_cap/7'
Xptran_cb_mux_L2_1h n_gnd n_2_1 n_gnd n_gnd ptran Wn=ptran_cb_mux_L2_nmos
Xwire_cb_mux_L2_2 n_2_1 n_2_2 wire Rw='wire_cb_mux_L2_res/7' Cw='wire_cb_mux_L2_cap/7'
Xptran_cb_mux_L2_2h n_gnd n_2_2 n_gnd n_gnd ptran Wn=ptran_cb_mux_L2_nmos
Xwire_cb_mux_L2_3 n_2_2 n_2_3 wire Rw='wire_cb_mux_L2_res/7' Cw='wire_cb_mux_L2_cap/7'
Xptran_cb_mux_L2_3h n_gnd n_2_3 n_gnd n_gnd ptran Wn=ptran_cb_mux_L2_nmos
Xwire_cb_mux_L2_4 n_2_3 n_out wire Rw='wire_cb_mux_L2_res/14' Cw='wire_cb_mux_L2_cap/14'
Xwire_cb_mux_L2_5  n_out n_2_4 wire Rw='wire_cb_mux_L2_res/14' Cw='wire_cb_mux_L2_cap/14'
Xptran_cb_mux_L2_4h n_gnd n_2_4 n_gnd n_gnd ptran Wn=ptran_cb_mux_L2_nmos
Xwire_cb_mux_L2_6 n_2_4 n_2_5 wire Rw='wire_cb_mux_L2_res/7' Cw='wire_cb_mux_L2_cap/7'
Xptran_cb_mux_L2_5h n_gnd n_2_5 n_gnd n_gnd ptran Wn=ptran_cb_mux_L2_nmos
Xwire_cb_mux_L2_7 n_2_5 n_2_6 wire Rw='wire_cb_mux_L2_res/7' Cw='wire_cb_mux_L2_cap/7'
Xptran_cb_mux_L2_6h n_gnd n_2_6 n_gnd n_gnd ptran Wn=ptran_cb_mux_L2_nmos
Xwire_cb_mux_L2_8 n_2_6 n_2_7 wire Rw='wire_cb_mux_L2_res/7' Cw='wire_cb_mux_L2_cap/7'
Xptran_cb_mux_L2_7h n_gnd n_2_7 n_gnd n_gnd ptran Wn=ptran_cb_mux_L2_nmos
.ENDS


******************************************************************************************
* cb_mux subcircuit (64:1), fully turned on 
******************************************************************************************
.SUBCKT cb_mux_on n_in n_out n_gate n_gate_n n_vdd n_gnd
Xcb_mux_on_mux_only n_in n_1_1 n_gate n_gate_n n_vdd n_gnd cb_mux_on_mux_only
Xcb_mux_driver n_1_1 n_out n_vdd n_gnd cb_mux_driver
.ENDS


******************************************************************************************
* 5-LUT subcircuit 
******************************************************************************************
.SUBCKT lut n_in n_out n_a n_b n_c n_d n_e n_f n_vdd n_gnd
Xinv_lut_sram_driver_1 n_in n_1_1 n_vdd n_gnd inv Wn=45n Wp=75.015n
Xwire_lut_sram_driver n_1_1 n_1_2 wire Rw=wire_lut_sram_driver_res Cw=wire_lut_sram_driver_cap
Xinv_lut_sram_driver_2 n_1_2 n_2_1 n_vdd n_gnd inv Wn=inv_lut_0sram_driver_2_nmos Wp=inv_lut_0sram_driver_2_pmos
Xwire_lut_sram_driver_out n_2_1 n_2_2 wire Rw=wire_lut_sram_driver_out_res Cw=wire_lut_sram_driver_out_cap

* First chain
Xptran_lut_L1 n_2_2 n_3_1 n_a n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_L1 n_3_1 n_3_2 wire Rw='wire_lut_L1_res/2' Cw='wire_lut_L1_cap/2'
Xwire_lut_L1h n_3_2 n_3_3 wire Rw='wire_lut_L1_res/2' Cw='wire_lut_L1_cap/2'
Xptran_lut_L1h n_gnd n_3_3 n_gnd n_gnd ptran Wn=ptran_lut_L1_nmos
Xptran_lut_L2 n_3_2 n_4_1 n_b n_gnd ptran Wn=ptran_lut_L2_nmos
Xwire_lut_L2 n_4_1 n_4_2 wire Rw='wire_lut_L2_res/2' Cw='wire_lut_L2_cap/2'
Xwire_lut_L2h n_4_2 n_4_3 wire Rw='wire_lut_L2_res/2' Cw='wire_lut_L2_cap/2'
Xptran_lut_L2h n_gnd n_4_3 n_gnd n_gnd ptran Wn=ptran_lut_L2_nmos
Xptran_lut_L3 n_4_2 n_5_1 n_c n_gnd ptran Wn=ptran_lut_L3_nmos
Xwire_lut_L3 n_5_1 n_5_2 wire Rw='wire_lut_L3_res/2' Cw='wire_lut_L3_cap/2'
Xwire_lut_L3h n_5_2 n_5_3 wire Rw='wire_lut_L3_res/2' Cw='wire_lut_L3_cap/2'
Xptran_lut_L3h n_gnd n_5_3 n_gnd n_gnd ptran Wn=ptran_lut_L3_nmos

* Internal buffer 
Xrest_lut_int_buffer n_5_2 n_6_1 n_vdd n_gnd rest Wp=rest_lut_int_buffer_pmos
Xinv_lut_int_buffer_1 n_5_2 n_6_1 n_vdd n_gnd inv Wn=inv_lut_int_buffer_1_nmos Wp=inv_lut_int_buffer_1_pmos
Xwire_lut_int_buffer n_6_1 n_6_2 wire Rw=wire_lut_int_buffer_res Cw=wire_lut_int_buffer_cap
Xinv_lut_int_buffer_2 n_6_2 n_7_1 n_vdd n_gnd inv Wn=inv_lut_int_buffer_2_nmos Wp=inv_lut_int_buffer_2_pmos
Xwire_lut_int_buffer_out n_7_1 n_7_2 wire Rw=wire_lut_int_buffer_out_res Cw=wire_lut_int_buffer_out_cap

* Second chain
Xptran_lut_L4 n_7_2 n_8_1 n_d n_gnd ptran Wn=ptran_lut_L4_nmos
Xwire_lut_L4 n_8_1 n_8_2 wire Rw='wire_lut_L4_res/2' Cw='wire_lut_L4_cap/2'
Xwire_lut_L4h n_8_2 n_8_3 wire Rw='wire_lut_L4_res/2' Cw='wire_lut_L4_cap/2'
Xptran_lut_L4h n_gnd n_8_3 n_gnd n_gnd ptran Wn=ptran_lut_L4_nmos
Xptran_lut_L5 n_8_2 n_9_1 n_e n_gnd ptran Wn=ptran_lut_L5_nmos
Xwire_lut_L5 n_9_1 n_9_2 wire Rw='wire_lut_L5_res/2' Cw='wire_lut_L5_cap/2'
Xwire_lut_L5h n_9_2 n_9_3 wire Rw='wire_lut_L5_res/2' Cw='wire_lut_L5_cap/2'
Xptran_lut_L5h n_gnd n_9_3 n_gnd n_gnd ptran Wn=ptran_lut_L5_nmos
* Output buffer 
Xrest_lut_out_buffer n_9_2 n_11_1 n_vdd n_gnd rest Wp=rest_lut_out_buffer_pmos
Xinv_lut_out_buffer_1 n_9_2 n_11_1 n_vdd n_gnd inv Wn=inv_lut_out_buffer_1_nmos Wp=inv_lut_out_buffer_1_pmos
Xwire_lut_out_buffer n_11_1 n_11_2 wire Rw=wire_lut_out_buffer_res Cw=wire_lut_out_buffer_cap
Xinv_lut_out_buffer_2 n_11_2 n_out n_vdd n_gnd inv Wn=inv_lut_out_buffer_2_nmos Wp=inv_lut_out_buffer_2_pmos

.ENDS


******************************************************************************************
* LUT lut_a_driver subcircuit 
******************************************************************************************
.SUBCKT lut_a_driver n_in n_out n_gate n_gate_n n_rsel n_not_input n_vdd n_gnd
Xwire_lut_a_driver n_in n_not_input wire Rw=wire_lut_a_driver_res Cw=wire_lut_a_driver_cap
Xinv_lut_a_driver_2 n_not_input n_out n_vdd n_gnd inv Wn=inv_lut_a_driver_2_nmos Wp=inv_lut_a_driver_2_pmos
.ENDS


******************************************************************************************
* LUT lut_a_driver_not subcircuit 
******************************************************************************************
.SUBCKT lut_a_driver_not n_in n_out n_vdd n_gnd
Xinv_lut_a_driver_not_1 n_in n_1_1 n_vdd n_gnd inv Wn=inv_lut_a_driver_not_1_nmos Wp=inv_lut_a_driver_not_1_pmos
Xwire_lut_a_driver_not n_1_1 n_1_2 wire Rw=wire_lut_a_driver_not_res Cw=wire_lut_a_driver_not_cap
Xinv_lut_a_driver_not_2 n_1_2 n_out n_vdd n_gnd inv Wn=inv_lut_a_driver_not_2_nmos Wp=inv_lut_a_driver_not_2_pmos
.ENDS


******************************************************************************************
* LUT lut_b_driver subcircuit 
******************************************************************************************
.SUBCKT lut_b_driver n_in n_out n_gate n_gate_n n_rsel n_not_input n_vdd n_gnd
Xwire_lut_b_driver n_in n_not_input wire Rw=wire_lut_b_driver_res Cw=wire_lut_b_driver_cap
Xinv_lut_b_driver_2 n_not_input n_out n_vdd n_gnd inv Wn=inv_lut_b_driver_2_nmos Wp=inv_lut_b_driver_2_pmos
.ENDS


******************************************************************************************
* LUT lut_b_driver_not subcircuit 
******************************************************************************************
.SUBCKT lut_b_driver_not n_in n_out n_vdd n_gnd
Xinv_lut_b_driver_not_1 n_in n_1_1 n_vdd n_gnd inv Wn=inv_lut_b_driver_not_1_nmos Wp=inv_lut_b_driver_not_1_pmos
Xwire_lut_b_driver_not n_1_1 n_1_2 wire Rw=wire_lut_b_driver_not_res Cw=wire_lut_b_driver_not_cap
Xinv_lut_b_driver_not_2 n_1_2 n_out n_vdd n_gnd inv Wn=inv_lut_b_driver_not_2_nmos Wp=inv_lut_b_driver_not_2_pmos
.ENDS


******************************************************************************************
* LUT lut_c_driver subcircuit 
******************************************************************************************
.SUBCKT lut_c_driver n_in n_out n_gate n_gate_n n_rsel n_not_input n_vdd n_gnd
Xinv_lut_c_driver_0 n_in n_1_1 n_vdd n_gnd inv Wn=inv_lut_c_driver_0_nmos Wp=inv_lut_c_driver_0_pmos
Xwire_lut_c_driver_0_rsel n_1_1 n_rsel wire Rw=wire_lut_c_driver_0_rsel_res Cw=wire_lut_c_driver_0_rsel_cap
Xwire_lut_c_driver_0_out n_1_1 n_1_2 wire Rw=wire_lut_c_driver_0_out_res Cw=wire_lut_c_driver_0_out_cap
Xptran_lut_c_driver_0 n_1_2 n_2_1 n_gate n_gnd ptran Wn=ptran_lut_c_driver_0_nmos
Xwire_lut_c_driver_0 n_2_1 n_2_2 wire Rw='wire_lut_c_driver_0_res/2' Cw='wire_lut_c_driver_0_cap/2'
Xwire_lut_c_driver_0h n_2_2 n_2_3 wire Rw='wire_lut_c_driver_0_res/2' Cw='wire_lut_c_driver_0_cap/2'
Xptran_lut_c_driver_0h n_gnd n_2_3 n_gate_n n_gnd ptran Wn=ptran_lut_c_driver_0_nmos
Xrest_lut_c_driver n_2_2 n_3_1 n_vdd n_gnd rest Wp=rest_lut_c_driver_pmos
Xinv_lut_c_driver_1 n_2_2 n_3_1 n_vdd n_gnd inv Wn=inv_lut_c_driver_1_nmos Wp=inv_lut_c_driver_1_pmos
Xwire_lut_c_driver n_3_1 n_not_input wire Rw=wire_lut_c_driver_res Cw=wire_lut_c_driver_cap
Xinv_lut_c_driver_2 n_not_input n_out n_vdd n_gnd inv Wn=inv_lut_c_driver_2_nmos Wp=inv_lut_c_driver_2_pmos
.ENDS


******************************************************************************************
* LUT lut_c_driver_not subcircuit 
******************************************************************************************
.SUBCKT lut_c_driver_not n_in n_out n_vdd n_gnd
Xinv_lut_c_driver_not_1 n_in n_1_1 n_vdd n_gnd inv Wn=inv_lut_c_driver_not_1_nmos Wp=inv_lut_c_driver_not_1_pmos
Xwire_lut_c_driver_not n_1_1 n_1_2 wire Rw=wire_lut_c_driver_not_res Cw=wire_lut_c_driver_not_cap
Xinv_lut_c_driver_not_2 n_1_2 n_out n_vdd n_gnd inv Wn=inv_lut_c_driver_not_2_nmos Wp=inv_lut_c_driver_not_2_pmos
.ENDS


******************************************************************************************
* LUT lut_d_driver subcircuit 
******************************************************************************************
.SUBCKT lut_d_driver n_in n_out n_gate n_gate_n n_rsel n_not_input n_vdd n_gnd
Xwire_lut_d_driver n_in n_not_input wire Rw=wire_lut_d_driver_res Cw=wire_lut_d_driver_cap
Xinv_lut_d_driver_2 n_not_input n_out n_vdd n_gnd inv Wn=inv_lut_d_driver_2_nmos Wp=inv_lut_d_driver_2_pmos
.ENDS


******************************************************************************************
* LUT lut_d_driver_not subcircuit 
******************************************************************************************
.SUBCKT lut_d_driver_not n_in n_out n_vdd n_gnd
Xinv_lut_d_driver_not_1 n_in n_1_1 n_vdd n_gnd inv Wn=inv_lut_d_driver_not_1_nmos Wp=inv_lut_d_driver_not_1_pmos
Xwire_lut_d_driver_not n_1_1 n_1_2 wire Rw=wire_lut_d_driver_not_res Cw=wire_lut_d_driver_not_cap
Xinv_lut_d_driver_not_2 n_1_2 n_out n_vdd n_gnd inv Wn=inv_lut_d_driver_not_2_nmos Wp=inv_lut_d_driver_not_2_pmos
.ENDS


******************************************************************************************
* LUT lut_e_driver subcircuit 
******************************************************************************************
.SUBCKT lut_e_driver n_in n_out n_gate n_gate_n n_rsel n_not_input n_vdd n_gnd
Xwire_lut_e_driver n_in n_not_input wire Rw=wire_lut_e_driver_res Cw=wire_lut_e_driver_cap
Xinv_lut_e_driver_2 n_not_input n_out n_vdd n_gnd inv Wn=inv_lut_e_driver_2_nmos Wp=inv_lut_e_driver_2_pmos
.ENDS


******************************************************************************************
* LUT lut_e_driver_not subcircuit 
******************************************************************************************
.SUBCKT lut_e_driver_not n_in n_out n_vdd n_gnd
Xinv_lut_e_driver_not_1 n_in n_1_1 n_vdd n_gnd inv Wn=inv_lut_e_driver_not_1_nmos Wp=inv_lut_e_driver_not_1_pmos
Xwire_lut_e_driver_not n_1_1 n_1_2 wire Rw=wire_lut_e_driver_not_res Cw=wire_lut_e_driver_not_cap
Xinv_lut_e_driver_not_2 n_1_2 n_out n_vdd n_gnd inv Wn=inv_lut_e_driver_not_2_nmos Wp=inv_lut_e_driver_not_2_pmos
.ENDS


******************************************************************************************
* LUT lut_f_driver subcircuit 
******************************************************************************************
.SUBCKT lut_f_driver n_in n_out n_gate n_gate_n n_rsel n_not_input n_vdd n_gnd
Xwire_lut_f_driver n_in n_not_input wire Rw=wire_lut_f_driver_res Cw=wire_lut_f_driver_cap
Xinv_lut_f_driver_2 n_not_input n_out n_vdd n_gnd inv Wn=inv_lut_f_driver_2_nmos Wp=inv_lut_f_driver_2_pmos
.ENDS


******************************************************************************************
* LUT lut_f_driver_not subcircuit 
******************************************************************************************
.SUBCKT lut_f_driver_not n_in n_out n_vdd n_gnd
Xinv_lut_f_driver_not_1 n_in n_1_1 n_vdd n_gnd inv Wn=inv_lut_f_driver_not_1_nmos Wp=inv_lut_f_driver_not_1_pmos
Xwire_lut_f_driver_not n_1_1 n_1_2 wire Rw=wire_lut_f_driver_not_res Cw=wire_lut_f_driver_not_cap
Xinv_lut_f_driver_not_2 n_1_2 n_out n_vdd n_gnd inv Wn=inv_lut_f_driver_not_2_nmos Wp=inv_lut_f_driver_not_2_pmos
.ENDS


******************************************************************************************
* LUT a-input load subcircuit 
******************************************************************************************
.SUBCKT lut_a_driver_load n_1 n_vdd n_gnd
Xwire_lut_a_driver_load_1 n_1 n_2 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_1 n_gnd n_gnd n_2 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_2 n_2 n_3 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_2 n_gnd n_gnd n_3 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_3 n_3 n_4 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_3 n_gnd n_gnd n_4 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_4 n_4 n_5 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_4 n_gnd n_gnd n_5 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_5 n_5 n_6 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_5 n_gnd n_gnd n_6 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_6 n_6 n_7 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_6 n_gnd n_gnd n_7 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_7 n_7 n_8 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_7 n_gnd n_gnd n_8 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_8 n_8 n_9 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_8 n_gnd n_gnd n_9 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_9 n_9 n_10 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_9 n_gnd n_gnd n_10 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_10 n_10 n_11 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_10 n_gnd n_gnd n_11 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_11 n_11 n_12 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_11 n_gnd n_gnd n_12 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_12 n_12 n_13 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_12 n_gnd n_gnd n_13 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_13 n_13 n_14 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_13 n_gnd n_gnd n_14 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_14 n_14 n_15 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_14 n_gnd n_gnd n_15 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_15 n_15 n_16 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_15 n_gnd n_gnd n_16 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_16 n_16 n_17 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_16 n_gnd n_gnd n_17 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_17 n_17 n_18 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_17 n_gnd n_gnd n_18 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_18 n_18 n_19 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_18 n_gnd n_gnd n_19 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_19 n_19 n_20 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_19 n_gnd n_gnd n_20 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_20 n_20 n_21 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_20 n_gnd n_gnd n_21 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_21 n_21 n_22 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_21 n_gnd n_gnd n_22 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_22 n_22 n_23 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_22 n_gnd n_gnd n_23 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_23 n_23 n_24 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_23 n_gnd n_gnd n_24 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_24 n_24 n_25 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_24 n_gnd n_gnd n_25 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_25 n_25 n_26 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_25 n_gnd n_gnd n_26 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_26 n_26 n_27 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_26 n_gnd n_gnd n_27 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_27 n_27 n_28 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_27 n_gnd n_gnd n_28 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_28 n_28 n_29 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_28 n_gnd n_gnd n_29 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_29 n_29 n_30 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_29 n_gnd n_gnd n_30 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_30 n_30 n_31 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_30 n_gnd n_gnd n_31 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_31 n_31 n_32 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_31 n_gnd n_gnd n_32 n_gnd ptran Wn=ptran_lut_L1_nmos
Xwire_lut_a_driver_load_32 n_32 n_33 wire Rw='wire_lut_a_driver_load_res/32' Cw='wire_lut_a_driver_load_cap/32'
Xptran_lut_a_driver_load_32 n_gnd n_gnd n_33 n_gnd ptran Wn=ptran_lut_L1_nmos
.ENDS


******************************************************************************************
* LUT b-input load subcircuit 
******************************************************************************************
.SUBCKT lut_b_driver_load n_1 n_vdd n_gnd
Xwire_lut_b_driver_load_1 n_1 n_2 wire Rw='wire_lut_b_driver_load_res/16' Cw='wire_lut_b_driver_load_cap/16'
Xptran_lut_b_driver_load_1 n_gnd n_gnd n_2 n_gnd ptran Wn=ptran_lut_L2_nmos
Xwire_lut_b_driver_load_2 n_2 n_3 wire Rw='wire_lut_b_driver_load_res/16' Cw='wire_lut_b_driver_load_cap/16'
Xptran_lut_b_driver_load_2 n_gnd n_gnd n_3 n_gnd ptran Wn=ptran_lut_L2_nmos
Xwire_lut_b_driver_load_3 n_3 n_4 wire Rw='wire_lut_b_driver_load_res/16' Cw='wire_lut_b_driver_load_cap/16'
Xptran_lut_b_driver_load_3 n_gnd n_gnd n_4 n_gnd ptran Wn=ptran_lut_L2_nmos
Xwire_lut_b_driver_load_4 n_4 n_5 wire Rw='wire_lut_b_driver_load_res/16' Cw='wire_lut_b_driver_load_cap/16'
Xptran_lut_b_driver_load_4 n_gnd n_gnd n_5 n_gnd ptran Wn=ptran_lut_L2_nmos
Xwire_lut_b_driver_load_5 n_5 n_6 wire Rw='wire_lut_b_driver_load_res/16' Cw='wire_lut_b_driver_load_cap/16'
Xptran_lut_b_driver_load_5 n_gnd n_gnd n_6 n_gnd ptran Wn=ptran_lut_L2_nmos
Xwire_lut_b_driver_load_6 n_6 n_7 wire Rw='wire_lut_b_driver_load_res/16' Cw='wire_lut_b_driver_load_cap/16'
Xptran_lut_b_driver_load_6 n_gnd n_gnd n_7 n_gnd ptran Wn=ptran_lut_L2_nmos
Xwire_lut_b_driver_load_7 n_7 n_8 wire Rw='wire_lut_b_driver_load_res/16' Cw='wire_lut_b_driver_load_cap/16'
Xptran_lut_b_driver_load_7 n_gnd n_gnd n_8 n_gnd ptran Wn=ptran_lut_L2_nmos
Xwire_lut_b_driver_load_8 n_8 n_9 wire Rw='wire_lut_b_driver_load_res/16' Cw='wire_lut_b_driver_load_cap/16'
Xptran_lut_b_driver_load_8 n_gnd n_gnd n_9 n_gnd ptran Wn=ptran_lut_L2_nmos
Xwire_lut_b_driver_load_9 n_9 n_10 wire Rw='wire_lut_b_driver_load_res/16' Cw='wire_lut_b_driver_load_cap/16'
Xptran_lut_b_driver_load_9 n_gnd n_gnd n_10 n_gnd ptran Wn=ptran_lut_L2_nmos
Xwire_lut_b_driver_load_10 n_10 n_11 wire Rw='wire_lut_b_driver_load_res/16' Cw='wire_lut_b_driver_load_cap/16'
Xptran_lut_b_driver_load_10 n_gnd n_gnd n_11 n_gnd ptran Wn=ptran_lut_L2_nmos
Xwire_lut_b_driver_load_11 n_11 n_12 wire Rw='wire_lut_b_driver_load_res/16' Cw='wire_lut_b_driver_load_cap/16'
Xptran_lut_b_driver_load_11 n_gnd n_gnd n_12 n_gnd ptran Wn=ptran_lut_L2_nmos
Xwire_lut_b_driver_load_12 n_12 n_13 wire Rw='wire_lut_b_driver_load_res/16' Cw='wire_lut_b_driver_load_cap/16'
Xptran_lut_b_driver_load_12 n_gnd n_gnd n_13 n_gnd ptran Wn=ptran_lut_L2_nmos
Xwire_lut_b_driver_load_13 n_13 n_14 wire Rw='wire_lut_b_driver_load_res/16' Cw='wire_lut_b_driver_load_cap/16'
Xptran_lut_b_driver_load_13 n_gnd n_gnd n_14 n_gnd ptran Wn=ptran_lut_L2_nmos
Xwire_lut_b_driver_load_14 n_14 n_15 wire Rw='wire_lut_b_driver_load_res/16' Cw='wire_lut_b_driver_load_cap/16'
Xptran_lut_b_driver_load_14 n_gnd n_gnd n_15 n_gnd ptran Wn=ptran_lut_L2_nmos
Xwire_lut_b_driver_load_15 n_15 n_16 wire Rw='wire_lut_b_driver_load_res/16' Cw='wire_lut_b_driver_load_cap/16'
Xptran_lut_b_driver_load_15 n_gnd n_gnd n_16 n_gnd ptran Wn=ptran_lut_L2_nmos
Xwire_lut_b_driver_load_16 n_16 n_17 wire Rw='wire_lut_b_driver_load_res/16' Cw='wire_lut_b_driver_load_cap/16'
Xptran_lut_b_driver_load_16 n_gnd n_gnd n_17 n_gnd ptran Wn=ptran_lut_L2_nmos
.ENDS


******************************************************************************************
* LUT c-input load subcircuit 
******************************************************************************************
.SUBCKT lut_c_driver_load n_1 n_vdd n_gnd
Xwire_lut_c_driver_load_1 n_1 n_2 wire Rw='wire_lut_c_driver_load_res/8' Cw='wire_lut_c_driver_load_cap/8'
Xptran_lut_c_driver_load_1 n_gnd n_gnd n_2 n_gnd ptran Wn=ptran_lut_L3_nmos
Xwire_lut_c_driver_load_2 n_2 n_3 wire Rw='wire_lut_c_driver_load_res/8' Cw='wire_lut_c_driver_load_cap/8'
Xptran_lut_c_driver_load_2 n_gnd n_gnd n_3 n_gnd ptran Wn=ptran_lut_L3_nmos
Xwire_lut_c_driver_load_3 n_3 n_4 wire Rw='wire_lut_c_driver_load_res/8' Cw='wire_lut_c_driver_load_cap/8'
Xptran_lut_c_driver_load_3 n_gnd n_gnd n_4 n_gnd ptran Wn=ptran_lut_L3_nmos
Xwire_lut_c_driver_load_4 n_4 n_5 wire Rw='wire_lut_c_driver_load_res/8' Cw='wire_lut_c_driver_load_cap/8'
Xptran_lut_c_driver_load_4 n_gnd n_gnd n_5 n_gnd ptran Wn=ptran_lut_L3_nmos
Xwire_lut_c_driver_load_5 n_5 n_6 wire Rw='wire_lut_c_driver_load_res/8' Cw='wire_lut_c_driver_load_cap/8'
Xptran_lut_c_driver_load_5 n_gnd n_gnd n_6 n_gnd ptran Wn=ptran_lut_L3_nmos
Xwire_lut_c_driver_load_6 n_6 n_7 wire Rw='wire_lut_c_driver_load_res/8' Cw='wire_lut_c_driver_load_cap/8'
Xptran_lut_c_driver_load_6 n_gnd n_gnd n_7 n_gnd ptran Wn=ptran_lut_L3_nmos
Xwire_lut_c_driver_load_7 n_7 n_8 wire Rw='wire_lut_c_driver_load_res/8' Cw='wire_lut_c_driver_load_cap/8'
Xptran_lut_c_driver_load_7 n_gnd n_gnd n_8 n_gnd ptran Wn=ptran_lut_L3_nmos
Xwire_lut_c_driver_load_8 n_8 n_9 wire Rw='wire_lut_c_driver_load_res/8' Cw='wire_lut_c_driver_load_cap/8'
Xptran_lut_c_driver_load_8 n_gnd n_gnd n_9 n_gnd ptran Wn=ptran_lut_L3_nmos
.ENDS


******************************************************************************************
* LUT d-input load subcircuit 
******************************************************************************************
.SUBCKT lut_d_driver_load n_1 n_vdd n_gnd
Xwire_lut_d_driver_load_1 n_1 n_2 wire Rw='wire_lut_d_driver_load_res/4' Cw='wire_lut_d_driver_load_cap/4'
Xptran_lut_d_driver_load_1 n_gnd n_gnd n_2 n_gnd ptran Wn=ptran_lut_L4_nmos
Xwire_lut_d_driver_load_2 n_2 n_3 wire Rw='wire_lut_d_driver_load_res/4' Cw='wire_lut_d_driver_load_cap/4'
Xptran_lut_d_driver_load_2 n_gnd n_gnd n_3 n_gnd ptran Wn=ptran_lut_L4_nmos
Xwire_lut_d_driver_load_3 n_3 n_4 wire Rw='wire_lut_d_driver_load_res/4' Cw='wire_lut_d_driver_load_cap/4'
Xptran_lut_d_driver_load_3 n_gnd n_gnd n_4 n_gnd ptran Wn=ptran_lut_L4_nmos
Xwire_lut_d_driver_load_4 n_4 n_5 wire Rw='wire_lut_d_driver_load_res/4' Cw='wire_lut_d_driver_load_cap/4'
Xptran_lut_d_driver_load_4 n_gnd n_gnd n_5 n_gnd ptran Wn=ptran_lut_L4_nmos
.ENDS


******************************************************************************************
* LUT e-input load subcircuit 
******************************************************************************************
.SUBCKT lut_e_driver_load n_1 n_vdd n_gnd
Xwire_lut_e_driver_load_1 n_1 n_2 wire Rw='wire_lut_e_driver_load_res/2' Cw='wire_lut_e_driver_load_cap/2'
Xptran_lut_e_driver_load_1 n_gnd n_gnd n_2 n_gnd ptran Wn=ptran_lut_L5_nmos
Xwire_lut_e_driver_load_2 n_2 n_3 wire Rw='wire_lut_e_driver_load_res/2' Cw='wire_lut_e_driver_load_cap/2'
Xptran_lut_e_driver_load_2 n_gnd n_gnd n_3 n_gnd ptran Wn=ptran_lut_L5_nmos
.ENDS


******************************************************************************************
* LUT f-input load subcircuit 
******************************************************************************************
.SUBCKT lut_f_driver_load n_1 n_vdd n_gnd
Xwire_lut_f_driver_load_1 n_1 n_2 wire Rw='wire_lut_f_driver_load_res/1' Cw='wire_lut_f_driver_load_cap/1'
Xptran_lut_f_driver_load_1 n_gnd n_gnd n_2 n_gnd ptran Wn=ptran_flut_mux_nmos
.ENDS


******************************************************************************************
* FF subcircuit 
******************************************************************************************
.SUBCKT ff n_in n_out n_gate n_gate_n n_clk n_clk_n n_set n_set_n n_reset n_reset_n n_vdd n_gnd
* Input selection MUX
Xptran_ff_input_select n_in n_1_1 n_gate n_gnd ptran Wn=ptran_ff_input_select_nmos
Xwire_ff_input_select n_1_1 n_1_2 wire Rw='wire_ff_input_select_res/2' Cw='wire_ff_input_select_cap/2'
Xwire_ff_input_select_h n_1_2 n_1_3 wire Rw='wire_ff_input_select_res/2' Cw='wire_ff_input_select_cap/2'
Xptran_ff_input_select_h n_gnd n_1_3 n_gate_n n_gnd ptran Wn=ptran_ff_input_select_nmos
Xrest_ff_input_select n_1_2 n_2_1 n_vdd n_gnd rest Wp=rest_ff_input_select_pmos
Xinv_ff_input_1 n_1_2 n_2_1 n_vdd n_gnd inv Wn=inv_ff_input_1_nmos Wp=inv_ff_input_1_pmos

* First T-gate and cross-coupled inverters
Xwire_ff_input_out n_2_1 n_2_2 wire Rw=wire_ff_input_out_res Cw=wire_ff_input_out_cap
Xtgate_ff_1 n_2_2 n_3_1 n_clk_n n_clk n_vdd n_gnd tgate Wn=tgate_ff_1_nmos Wp=tgate_ff_1_pmos
MPtran_ff_set_n n_3_1 n_set_n n_vdd n_vdd pmos L=gate_length W=tran_ff_set_n_pmos
MNtran_ff_reset n_3_1 n_reset n_gnd n_gnd nmos L=gate_length W=tran_ff_reset_nmos
Xwire_ff_tgate_1_out n_3_1 n_3_2 wire Rw=wire_ff_tgate_1_out_res Cw=wire_ff_tgate_1_out_cap
Xinv_ff_cc1_1 n_3_2 n_4_1 n_vdd n_gnd inv Wn=inv_ff_cc1_1_nmos Wp=inv_ff_cc1_1_pmos
Xinv_ff_cc1_2 n_4_1 n_3_2 n_vdd n_gnd inv Wn=inv_ff_cc1_2_nmos Wp=inv_ff_cc1_2_pmos
Xwire_ff_cc1_out n_4_1 n_4_2 wire Rw=wire_ff_cc1_out_res Cw=wire_ff_cc1_out_cap

* Second T-gate and cross-coupled inverters
Xtgate_ff_2 n_4_2 n_5_1 n_clk n_clk_n n_vdd n_gnd tgate Wn=tgate_ff_2_nmos Wp=tgate_ff_2_pmos
MPtran_ff_reset_n n_5_1 n_reset_n n_vdd n_vdd pmos L=gate_length W=tran_ff_reset_n_pmos
MNtran_ff_set n_5_1 n_set n_gnd n_gnd nmos L=gate_length W=tran_ff_set_nmos
Xwire_ff_tgate_2_out n_5_1 n_5_2 wire Rw=wire_ff_tgate_2_out_res Cw=wire_ff_tgate_2_out_cap
Xinv_ff_cc2_1 n_5_2 n_6_1 n_vdd n_gnd inv Wn=inv_ff_cc2_1_nmos Wp=inv_ff_cc2_1_pmos
Xinv_ff_cc2_2 n_6_1 n_5_2 n_vdd n_gnd inv Wn=inv_ff_cc2_2_nmos Wp=inv_ff_cc2_2_pmos
Xwire_ff_cc2_out n_6_1 n_6_2 wire Rw=wire_ff_cc2_out_res Cw=wire_ff_cc2_out_cap

* Output driver
Xinv_ff_output_driver n_6_2 n_out n_vdd n_gnd inv Wn=inv_ff_output_driver_nmos Wp=inv_ff_output_driver_pmos

.ENDS


******************************************************************************************
* local_ble_output subcircuit (2:1)
******************************************************************************************
.SUBCKT local_ble_output n_in n_out n_gate n_gate_n n_vdd n_gnd
Xptran_local_ble_output n_in n_1_1 n_gate n_gnd ptran Wn=ptran_local_ble_output_nmos
Xwire_local_ble_output n_1_1 n_1_2 wire Rw='wire_local_ble_output_res/2' Cw='wire_local_ble_output_cap/2'
Xwire_local_ble_output_h n_1_2 n_1_3 wire Rw='wire_local_ble_output_res/2' Cw='wire_local_ble_output_cap/2'
Xptran_local_ble_output_h n_gnd n_1_3 n_gnd n_gnd ptran Wn=ptran_local_ble_output_nmos
Xrest_local_ble_output n_1_2 n_2_1 n_vdd n_gnd rest Wp=rest_local_ble_output_pmos
Xinv_local_ble_output_1 n_1_2 n_2_1 n_vdd n_gnd inv Wn=inv_local_ble_output_1_nmos Wp=inv_local_ble_output_1_pmos
Xwire_local_ble_output_driver n_2_1 n_2_2 wire Rw=wire_local_ble_output_driver_res Cw=wire_local_ble_output_driver_cap
Xinv_local_ble_output_2 n_2_2 n_out n_vdd n_gnd inv Wn=inv_local_ble_output_2_nmos Wp=inv_local_ble_output_2_pmos
.ENDS


******************************************************************************************
* general_ble_output subcircuit (2:1)
******************************************************************************************
.SUBCKT general_ble_output n_in n_out n_gate n_gate_n n_vdd n_gnd
Xptran_general_ble_output n_in n_1_1 n_gate n_gnd ptran Wn=ptran_general_ble_output_nmos
Xwire_general_ble_output n_1_1 n_1_2 wire Rw='wire_general_ble_output_res/2' Cw='wire_general_ble_output_cap/2'
Xwire_general_ble_output_h n_1_2 n_1_3 wire Rw='wire_general_ble_output_res/2' Cw='wire_general_ble_output_cap/2'
Xptran_general_ble_output_h n_gnd n_1_3 n_gnd n_gnd ptran Wn=ptran_general_ble_output_nmos
Xrest_general_ble_output n_1_2 n_2_1 n_vdd n_gnd rest Wp=rest_general_ble_output_pmos
Xinv_general_ble_output_1 n_1_2 n_2_1 n_vdd n_gnd inv Wn=inv_general_ble_output_1_nmos Wp=inv_general_ble_output_1_pmos
Xwire_general_ble_output_driver n_2_1 n_2_2 wire Rw=wire_general_ble_output_driver_res Cw=wire_general_ble_output_driver_cap
Xinv_general_ble_output_2 n_2_2 n_out n_vdd n_gnd inv Wn=inv_general_ble_output_2_nmos Wp=inv_general_ble_output_2_pmos
.ENDS


******************************************************************************************
* BLE outputs
******************************************************************************************
.SUBCKT ble_outputs n_1_3 n_local_out n_general_out n_gate n_gate_n n_vdd n_gnd n_vdd_local_output_on n_vdd_general_output_on
Xlocal_ble_output_1 n_1_2 n_local_out n_gate n_gate_n n_vdd_local_output_on n_gnd local_ble_output
Xwire_ble_outputs_1 n_1_2 n_1_3 wire Rw='wire_ble_outputs_res/2' Cw='wire_ble_outputs_cap/2'
Xgeneral_ble_output_1 n_1_3 n_general_out n_gate n_gate_n n_vdd_general_output_on n_gnd general_ble_output
Xwire_ble_outputs_2 n_1_3 n_1_4 wire Rw='wire_ble_outputs_res/2' Cw='wire_ble_outputs_cap/2'
Xgeneral_ble_output_2 n_1_4 n_hang_4 n_gate n_gate_n n_vdd n_gnd general_ble_output
.ENDS


******************************************************************************************
* flut_mux subcircuit (2:1)
******************************************************************************************
.SUBCKT flut_mux n_in n_out n_gate n_gate_n n_vdd n_gnd
Xptran_flut_mux n_in n_1_1 n_gate n_gnd ptran Wn=ptran_flut_mux_nmos
Xwire_flut_mux n_1_1 n_1_2 wire Rw='wire_flut_mux_res/2' Cw='wire_flut_mux_cap/2'
Xwire_flut_mux_h n_1_2 n_1_3 wire Rw='wire_flut_mux_res/2' Cw='wire_flut_mux_cap/2'
Xptran_flut_mux_h n_gnd n_1_3 n_gnd n_gnd ptran Wn=ptran_flut_mux_nmos
Xrest_flut_mux n_1_2 n_2_1 n_vdd n_gnd rest Wp=rest_flut_mux_pmos
Xinv_flut_mux_1 n_1_2 n_2_1 n_vdd n_gnd inv Wn=inv_flut_mux_1_nmos Wp=inv_flut_mux_1_pmos
Xwire_flut_mux_driver n_2_1 n_2_2 wire Rw=wire_flut_mux_driver_res Cw=wire_flut_mux_driver_cap
Xinv_flut_mux_2 n_2_2 n_out n_vdd n_gnd inv Wn=inv_flut_mux_2_nmos Wp=inv_flut_mux_2_pmos
.ENDS


******************************************************************************************
* LUT output load
******************************************************************************************
.SUBCKT lut_output_load n_in n_local_out n_general_out n_gate n_gate_n n_vdd n_gnd n_vdd_local_output_on n_vdd_general_output_on
Xwire_lut_output_load_1 n_in n_1_1 wire Rw='wire_lut_output_load_1_res' Cw='wire_lut_output_load_1_cap'
Xff n_1_1 n_hang1 n_gate n_gate_n n_vdd n_gnd n_gnd n_vdd n_gnd n_vdd n_vdd n_gnd ff
Xwire_lut_output_load_2 n_1_1 n_1_2 wire Rw='wire_lut_output_load_2_res' Cw='wire_lut_output_load_2_cap'
Xble_outputs n_1_2 n_local_out n_general_out n_gate n_gate_n n_vdd n_gnd n_vdd_local_output_on n_vdd_general_output_on ble_outputs
.ENDS


******************************************************************************************
* local_mux sense inverter subcircuit (25:1)
******************************************************************************************
.SUBCKT local_mux_sense n_in n_out n_vdd n_gnd
Xrest_local_mux n_in n_out n_vdd n_gnd rest Wp=rest_local_mux_pmos
Xinv_local_mux_1 n_in n_out n_vdd n_gnd inv Wn=inv_local_mux_1_nmos Wp=inv_local_mux_1_pmos
.ENDS


******************************************************************************************
* local_mux subcircuit (25:1), turned off 
******************************************************************************************
.SUBCKT local_mux_off n_in n_gate n_gate_n n_vdd n_gnd
Xptran_local_mux_L1 n_in n_gnd n_gnd n_gnd ptran Wn=ptran_local_mux_L1_nmos
.ENDS


******************************************************************************************
* local_mux subcircuit (25:1), partially turned on
******************************************************************************************
.SUBCKT local_mux_partial n_in n_gate n_gate_n n_vdd n_gnd
Xptran_local_mux_L1 n_in n_1 n_gate n_gnd ptran Wn=ptran_local_mux_L1_nmos
Xwire_local_mux_L1_1 n_1 n_1_1 wire Rw='wire_local_mux_L1_res/5' Cw='wire_local_mux_L1_cap/5'
Xptran_local_mux_L1_1h n_gnd n_1_1 n_gnd n_gnd ptran Wn=ptran_local_mux_L1_nmos
Xwire_local_mux_L1_2 n_1_1 n_1_2 wire Rw='wire_local_mux_L1_res/5' Cw='wire_local_mux_L1_cap/5'
Xptran_local_mux_L1_2h n_gnd n_1_2 n_gnd n_gnd ptran Wn=ptran_local_mux_L1_nmos
Xwire_local_mux_L1_3 n_1_2 n_1_3 wire Rw='wire_local_mux_L1_res/5' Cw='wire_local_mux_L1_cap/5'
Xptran_local_mux_L1_3h n_gnd n_1_3 n_gnd n_gnd ptran Wn=ptran_local_mux_L1_nmos
Xwire_local_mux_L1_4 n_1_3 n_1_4 wire Rw='wire_local_mux_L1_res/5' Cw='wire_local_mux_L1_cap/5'
Xptran_local_mux_L1_4h n_gnd n_1_4 n_gnd n_gnd ptran Wn=ptran_local_mux_L1_nmos
Xwire_local_mux_L1_5 n_1_4 n_1_5 wire Rw='wire_local_mux_L1_res/5' Cw='wire_local_mux_L1_cap/5'
Xptran_local_mux_L2 n_1_5 n_gnd n_gnd n_gnd ptran Wn=ptran_local_mux_L2_nmos
.ENDS


******************************************************************************************
* local_mux subcircuit (25:1), fully turned on (mux only)
******************************************************************************************
.SUBCKT local_mux_on_mux_only n_in n_out n_gate n_gate_n n_vdd n_gnd
Xptran_local_mux_L1 n_in n_1 n_gate n_gnd ptran Wn=ptran_local_mux_L1_nmos
Xwire_local_mux_L1_1 n_1 n_1_1 wire Rw='wire_local_mux_L1_res/5' Cw='wire_local_mux_L1_cap/5'
Xptran_local_mux_L1_1h n_gnd n_1_1 n_gnd n_gnd ptran Wn=ptran_local_mux_L1_nmos
Xwire_local_mux_L1_2 n_1_1 n_1_2 wire Rw='wire_local_mux_L1_res/5' Cw='wire_local_mux_L1_cap/5'
Xptran_local_mux_L1_2h n_gnd n_1_2 n_gnd n_gnd ptran Wn=ptran_local_mux_L1_nmos
Xwire_local_mux_L1_3 n_1_2 n_1_3 wire Rw='wire_local_mux_L1_res/5' Cw='wire_local_mux_L1_cap/5'
Xptran_local_mux_L1_3h n_gnd n_1_3 n_gnd n_gnd ptran Wn=ptran_local_mux_L1_nmos
Xwire_local_mux_L1_4 n_1_3 n_1_4 wire Rw='wire_local_mux_L1_res/5' Cw='wire_local_mux_L1_cap/5'
Xptran_local_mux_L1_4h n_gnd n_1_4 n_gnd n_gnd ptran Wn=ptran_local_mux_L1_nmos
Xwire_local_mux_L1_5 n_1_4 n_1_5 wire Rw='wire_local_mux_L1_res/5' Cw='wire_local_mux_L1_cap/5'
Xptran_local_mux_L2 n_1_5 n_2 n_gate n_gnd ptran Wn=ptran_local_mux_L2_nmos
Xwire_local_mux_L2_1 n_2 n_2_1 wire Rw='wire_local_mux_L2_res/4' Cw='wire_local_mux_L2_cap/4'
Xptran_local_mux_L2_1h n_gnd n_2_1 n_gnd n_gnd ptran Wn=ptran_local_mux_L2_nmos
Xwire_local_mux_L2_2 n_2_1 n_out wire Rw='wire_local_mux_L2_res/4' Cw='wire_local_mux_L2_cap/4'
Xptran_local_mux_L2_2h n_gnd n_out n_gnd n_gnd ptran Wn=ptran_local_mux_L2_nmos
Xwire_local_mux_L2_3  n_out n_2_2 wire Rw='wire_local_mux_L2_res/4' Cw='wire_local_mux_L2_cap/4'
Xptran_local_mux_L2_3h n_gnd n_2_2 n_gnd n_gnd ptran Wn=ptran_local_mux_L2_nmos
Xwire_local_mux_L2_4 n_2_2 n_2_3 wire Rw='wire_local_mux_L2_res/4' Cw='wire_local_mux_L2_cap/4'
Xptran_local_mux_L2_4h n_gnd n_2_3 n_gnd n_gnd ptran Wn=ptran_local_mux_L2_nmos
.ENDS


******************************************************************************************
* local_mux subcircuit (25:1), fully turned on 
******************************************************************************************
.SUBCKT local_mux_on n_in n_out n_gate n_gate_n n_vdd n_gnd
Xlocal_mux_on_mux_only n_in n_1_1 n_gate n_gate_n n_vdd n_gnd local_mux_on_mux_only
Xlocal_mux_sense n_1_1 n_out n_vdd n_gnd local_mux_sense
.ENDS


******************************************************************************************
* Local routing wire load
******************************************************************************************
.SUBCKT local_routing_wire_load n_in n_out n_gate n_gate_n n_vdd n_gnd n_vdd_local_mux_on
Xwire_local_routing_1 n_in n_1 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_1 n_1 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_2 n_1 n_2 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_2 n_2 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_3 n_2 n_3 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_3 n_3 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_4 n_3 n_4 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_4 n_4 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_5 n_4 n_5 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_5 n_5 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_6 n_5 n_6 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_6 n_6 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_7 n_6 n_7 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_partial_1 n_7 n_gate n_gate_n n_vdd n_gnd local_mux_partial
Xwire_local_routing_8 n_7 n_8 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_7 n_8 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_9 n_8 n_9 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_8 n_9 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_10 n_9 n_10 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_9 n_10 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_11 n_10 n_11 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_10 n_11 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_12 n_11 n_12 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_11 n_12 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_13 n_12 n_13 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_12 n_13 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_14 n_13 n_14 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_partial_2 n_14 n_gate n_gate_n n_vdd n_gnd local_mux_partial
Xwire_local_routing_15 n_14 n_15 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_13 n_15 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_16 n_15 n_16 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_14 n_16 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_17 n_16 n_17 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_15 n_17 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_18 n_17 n_18 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_16 n_18 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_19 n_18 n_19 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_17 n_19 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_20 n_19 n_20 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_18 n_20 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_21 n_20 n_21 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_partial_3 n_21 n_gate n_gate_n n_vdd n_gnd local_mux_partial
Xwire_local_routing_22 n_21 n_22 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_19 n_22 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_23 n_22 n_23 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_20 n_23 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_24 n_23 n_24 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_21 n_24 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_25 n_24 n_25 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_22 n_25 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_26 n_25 n_26 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_23 n_26 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_27 n_26 n_27 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_24 n_27 n_gate n_gate_n n_vdd n_gnd local_mux_off
Xwire_local_routing_28 n_27 n_28 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_partial_4 n_28 n_gate n_gate_n n_vdd n_gnd local_mux_partial
Xwire_local_routing_29 n_28 n_29 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_on_1 n_29 n_out n_gate n_gate_n n_vdd_local_mux_on n_gnd local_mux_on
Xwire_local_routing_30 n_29 n_30 wire Rw='wire_local_routing_res/30' Cw='wire_local_routing_cap/30'
Xlocal_mux_off_25 n_30 n_gate n_gate_n n_vdd n_gnd local_mux_off
.ENDS


******************************************************************************************
* Local BLE output load
******************************************************************************************
.SUBCKT local_ble_output_load n_in n_gate n_gate_n n_vdd n_gnd
Xwire_local_ble_output_feedback n_in n_1_1 wire Rw='wire_local_ble_output_feedback_res' Cw='wire_local_ble_output_feedback_cap'
Xlocal_routing_wire_load_1 n_1_1 n_1_2 n_gate n_gate_n n_vdd n_gnd n_vdd local_routing_wire_load
Xlut_a_driver_1 n_1_2 n_hang1 vsram vsram_n n_hang2 n_hang3 n_vdd n_gnd lut_a_driver

.ENDS


******************************************************************************************
* General BLE output load
******************************************************************************************
.SUBCKT general_ble_output_load n_1_1 n_out n_gate n_gate_n n_vdd n_gnd
Xwire_general_ble_output_1 n_1_1 n_1_2 wire Rw='wire_general_ble_output_res/8' Cw='wire_general_ble_output_cap/8'
Xsb_mux_off_1 n_1_2 n_gate n_gate_n n_vdd n_gnd sb_mux_off
Xwire_general_ble_output_2 n_1_2 n_1_3 wire Rw='wire_general_ble_output_res/8' Cw='wire_general_ble_output_cap/8'
Xsb_mux_off_2 n_1_3 n_gate n_gate_n n_vdd n_gnd sb_mux_off
Xwire_general_ble_output_3 n_1_3 n_1_4 wire Rw='wire_general_ble_output_res/8' Cw='wire_general_ble_output_cap/8'
Xsb_mux_off_3 n_1_4 n_gate n_gate_n n_vdd n_gnd sb_mux_off
Xwire_general_ble_output_4 n_1_4 n_1_5 wire Rw='wire_general_ble_output_res/8' Cw='wire_general_ble_output_cap/8'
Xsb_mux_off_4 n_1_5 n_gate n_gate_n n_vdd n_gnd sb_mux_off
Xwire_general_ble_output_5 n_1_5 n_1_6 wire Rw='wire_general_ble_output_res/8' Cw='wire_general_ble_output_cap/8'
Xsb_mux_off_5 n_1_6 n_gate n_gate_n n_vdd n_gnd sb_mux_off
Xwire_general_ble_output_6 n_1_6 n_1_7 wire Rw='wire_general_ble_output_res/8' Cw='wire_general_ble_output_cap/8'
Xsb_mux_off_6 n_1_7 n_gate n_gate_n n_vdd n_gnd sb_mux_off
Xwire_general_ble_output_7 n_1_7 n_1_8 wire Rw='wire_general_ble_output_res/8' Cw='wire_general_ble_output_cap/8'
Xsb_mux_partial_1 n_1_8 n_gate n_gate_n n_vdd n_gnd sb_mux_partial
Xwire_general_ble_output_8 n_1_8 n_meas_point wire Rw='wire_general_ble_output_res/8' Cw='wire_general_ble_output_cap/8'
Xsb_mux_on_1 n_meas_point n_out n_gate n_gate_n n_vdd n_gnd sb_mux_on
.ENDS


******************************************************************************************
* Routing wire load tile 1
******************************************************************************************
.SUBCKT routing_wire_load_tile_1 n_in n_out n_cb_out n_gate n_gate_n n_vdd n_gnd n_vdd_sb_mux_on n_vdd_cb_mux_on
Xwire_gen_routing_1 n_in n_1_1 wire Rw='wire_gen_routing_res/8' Cw='wire_gen_routing_cap/8'

Xwire_sb_load_partial_1 n_1_1 n_1_sb_partial_1 wire Rw=wire_sb_load_partial_res Cw=wire_sb_load_partial_cap
Xsb_load_partial_1 n_1_sb_partial_1 n_gate n_gate_n n_vdd n_gnd sb_mux_partial

Xwire_sb_load_off_1 n_1_1 n_1_sb_off_1 wire Rw=wire_sb_load_off_res Cw=wire_sb_load_off_cap
Xsb_load_off_1 n_1_sb_off_1 n_gate n_gate_n n_vdd n_gnd sb_mux_off

Xwire_cb_load_on_1 n_1_1 n_1_cb_on_1 wire Rw=wire_cb_load_on_res Cw=wire_cb_load_on_cap
Xcb_load_on_1 n_1_cb_on_1 n_cb_out n_gate n_gate_n n_vdd_cb_mux_on n_gnd cb_mux_on

Xwire_cb_load_partial_1 n_1_1 n_1_cb_partial_1 wire Rw=wire_cb_load_partial_res Cw=wire_cb_load_partial_cap
Xcb_load_partial_1 n_1_cb_partial_1 n_gate n_gate_n n_vdd n_gnd cb_mux_partial

Xwire_cb_load_off_1 n_1_1 n_1_cb_off_1 wire Rw=wire_cb_load_off_res Cw=wire_cb_load_off_cap
Xcb_load_off_1 n_1_cb_off_1 n_gate n_gate_n n_vdd n_gnd cb_mux_off

Xwire_cb_load_off_2 n_1_1 n_1_cb_off_2 wire Rw=wire_cb_load_off_res Cw=wire_cb_load_off_cap
Xcb_load_off_2 n_1_cb_off_2 n_gate n_gate_n n_vdd n_gnd cb_mux_off

Xwire_gen_routing_2 n_1_1 n_1_2 wire Rw='wire_gen_routing_res/8' Cw='wire_gen_routing_cap/8'
Xsb_mux_on_out n_1_2 n_out n_gate n_gate_n n_vdd_sb_mux_on n_gnd sb_mux_on
.ENDS


******************************************************************************************
* Routing wire load tile 2
******************************************************************************************
.SUBCKT routing_wire_load_tile_2 n_in n_out n_cb_out n_gate n_gate_n n_vdd n_gnd
Xwire_gen_routing_1 n_in n_1_1 wire Rw='wire_gen_routing_res/8' Cw='wire_gen_routing_cap/8'

Xwire_sb_load_off_1 n_1_1 n_1_sb_off_1 wire Rw=wire_sb_load_off_res Cw=wire_sb_load_off_cap
Xsb_load_off_1 n_1_sb_off_1 n_gate n_gate_n n_vdd n_gnd sb_mux_off

Xwire_sb_load_off_2 n_1_1 n_1_sb_off_2 wire Rw=wire_sb_load_off_res Cw=wire_sb_load_off_cap
Xsb_load_off_2 n_1_sb_off_2 n_gate n_gate_n n_vdd n_gnd sb_mux_off

Xwire_cb_load_off_1 n_1_1 n_1_cb_off_1 wire Rw=wire_cb_load_off_res Cw=wire_cb_load_off_cap
Xcb_load_off_1 n_1_cb_off_1 n_gate n_gate_n n_vdd n_gnd cb_mux_off

Xwire_cb_load_off_2 n_1_1 n_1_cb_off_2 wire Rw=wire_cb_load_off_res Cw=wire_cb_load_off_cap
Xcb_load_off_2 n_1_cb_off_2 n_gate n_gate_n n_vdd n_gnd cb_mux_off

Xwire_cb_load_off_3 n_1_1 n_1_cb_off_3 wire Rw=wire_cb_load_off_res Cw=wire_cb_load_off_cap
Xcb_load_off_3 n_1_cb_off_3 n_gate n_gate_n n_vdd n_gnd cb_mux_off

Xwire_cb_load_off_4 n_1_1 n_1_cb_off_4 wire Rw=wire_cb_load_off_res Cw=wire_cb_load_off_cap
Xcb_load_off_4 n_1_cb_off_4 n_gate n_gate_n n_vdd n_gnd cb_mux_off

Xwire_gen_routing_2 n_1_1 n_out wire Rw='wire_gen_routing_res/8' Cw='wire_gen_routing_cap/8'
.ENDS


******************************************************************************************
* Routing wire load tile 3
******************************************************************************************
.SUBCKT routing_wire_load_tile_3 n_in n_out n_cb_out n_gate n_gate_n n_vdd n_gnd
Xwire_gen_routing_1 n_in n_1_1 wire Rw='wire_gen_routing_res/8' Cw='wire_gen_routing_cap/8'

Xwire_sb_load_off_1 n_1_1 n_1_sb_off_1 wire Rw=wire_sb_load_off_res Cw=wire_sb_load_off_cap
Xsb_load_off_1 n_1_sb_off_1 n_gate n_gate_n n_vdd n_gnd sb_mux_off

Xwire_sb_load_off_2 n_1_1 n_1_sb_off_2 wire Rw=wire_sb_load_off_res Cw=wire_sb_load_off_cap
Xsb_load_off_2 n_1_sb_off_2 n_gate n_gate_n n_vdd n_gnd sb_mux_off

Xwire_cb_load_off_1 n_1_1 n_1_cb_off_1 wire Rw=wire_cb_load_off_res Cw=wire_cb_load_off_cap
Xcb_load_off_1 n_1_cb_off_1 n_gate n_gate_n n_vdd n_gnd cb_mux_off

Xwire_cb_load_off_2 n_1_1 n_1_cb_off_2 wire Rw=wire_cb_load_off_res Cw=wire_cb_load_off_cap
Xcb_load_off_2 n_1_cb_off_2 n_gate n_gate_n n_vdd n_gnd cb_mux_off

Xwire_cb_load_off_3 n_1_1 n_1_cb_off_3 wire Rw=wire_cb_load_off_res Cw=wire_cb_load_off_cap
Xcb_load_off_3 n_1_cb_off_3 n_gate n_gate_n n_vdd n_gnd cb_mux_off

Xwire_cb_load_off_4 n_1_1 n_1_cb_off_4 wire Rw=wire_cb_load_off_res Cw=wire_cb_load_off_cap
Xcb_load_off_4 n_1_cb_off_4 n_gate n_gate_n n_vdd n_gnd cb_mux_off

Xwire_gen_routing_2 n_1_1 n_out wire Rw='wire_gen_routing_res/8' Cw='wire_gen_routing_cap/8'
.ENDS


******************************************************************************************
* Routing wire load tile 4
******************************************************************************************
.SUBCKT routing_wire_load_tile_4 n_in n_out n_cb_out n_gate n_gate_n n_vdd n_gnd
Xwire_gen_routing_1 n_in n_1_1 wire Rw='wire_gen_routing_res/8' Cw='wire_gen_routing_cap/8'

Xwire_sb_load_off_1 n_1_1 n_1_sb_off_1 wire Rw=wire_sb_load_off_res Cw=wire_sb_load_off_cap
Xsb_load_off_1 n_1_sb_off_1 n_gate n_gate_n n_vdd n_gnd sb_mux_off

Xwire_sb_load_off_2 n_1_1 n_1_sb_off_2 wire Rw=wire_sb_load_off_res Cw=wire_sb_load_off_cap
Xsb_load_off_2 n_1_sb_off_2 n_gate n_gate_n n_vdd n_gnd sb_mux_off

Xwire_cb_load_off_1 n_1_1 n_1_cb_off_1 wire Rw=wire_cb_load_off_res Cw=wire_cb_load_off_cap
Xcb_load_off_1 n_1_cb_off_1 n_gate n_gate_n n_vdd n_gnd cb_mux_off

Xwire_cb_load_off_2 n_1_1 n_1_cb_off_2 wire Rw=wire_cb_load_off_res Cw=wire_cb_load_off_cap
Xcb_load_off_2 n_1_cb_off_2 n_gate n_gate_n n_vdd n_gnd cb_mux_off

Xwire_cb_load_off_3 n_1_1 n_1_cb_off_3 wire Rw=wire_cb_load_off_res Cw=wire_cb_load_off_cap
Xcb_load_off_3 n_1_cb_off_3 n_gate n_gate_n n_vdd n_gnd cb_mux_off

Xwire_cb_load_off_4 n_1_1 n_1_cb_off_4 wire Rw=wire_cb_load_off_res Cw=wire_cb_load_off_cap
Xcb_load_off_4 n_1_cb_off_4 n_gate n_gate_n n_vdd n_gnd cb_mux_off

Xwire_gen_routing_2 n_1_1 n_out wire Rw='wire_gen_routing_res/8' Cw='wire_gen_routing_cap/8'
.ENDS


******************************************************************************************
* Routing wire load tile 4
******************************************************************************************
.SUBCKT routing_wire_load n_in n_out n_cb_out n_gate n_gate_n n_vdd n_gnd n_vdd_sb_mux_on n_vdd_cb_mux_on
Xrouting_wire_load_tile_4 n_in n_4 n_hang_4 n_gate n_gate_n n_vdd n_gnd routing_wire_load_tile_4
Xrouting_wire_load_tile_3 n_4 n_3 n_hang_3 n_gate n_gate_n n_vdd n_gnd routing_wire_load_tile_3
Xrouting_wire_load_tile_2 n_3 n_2 n_hang_2 n_gate n_gate_n n_vdd n_gnd routing_wire_load_tile_2
Xrouting_wire_load_tile_1 n_2 n_out n_cb_out n_gate n_gate_n n_vdd n_gnd n_vdd_sb_mux_on n_vdd_cb_mux_on routing_wire_load_tile_1
.ENDS


******************************************************************************************
* Full adder subcircuit 
******************************************************************************************
.SUBCKT FA_carry_chain n_a n_b n_cin n_cout n_sum_out n_p n_vdd n_gnd
Xinv_carry_chain_1 n_a_in n_a_in_bar n_vdd n_gnd inv Wn=inv_carry_chain_1_nmos Wp=inv_carry_chain_1_pmos
Xinv_carry_chain_2 n_cin_in n_cin_in_bar n_vdd n_gnd inv Wn=inv_carry_chain_2_nmos Wp=inv_carry_chain_1_pmos
Xtgate_carry_chain_1 n_cin_in n_sum_internal n_p n_p_bar n_vdd n_gnd tgate Wn=tgate_carry_chain_2_nmos Wp=tgate_carry_chain_2_pmos
Xtgate_carry_chain_2 n_cin_in_bar n_sum_internal n_p_bar n_p n_vdd n_gnd tgate Wn=tgate_carry_chain_2_nmos Wp=tgate_carry_chain_2_pmos
Xtgate_carry_chain_3 n_b_in n_p n_a_in_bar n_a_in n_vdd n_gnd tgate Wn=tgate_carry_chain_1_nmos Wp=tgate_carry_chain_1_pmos
Xtgate_carry_chain_4 n_b_in n_p_bar n_a_in n_a_in_bar n_vdd n_gnd tgate Wn=tgate_carry_chain_1_nmos Wp=tgate_carry_chain_1_pmos
Xtgate_carry_chain_5 n_a_in_bar n_cout_in n_p_bar n_p n_vdd n_gnd tgate Wn=tgate_carry_chain_2_nmos Wp=tgate_carry_chain_2_pmos
Xtgate_carry_chain_6 n_cin_in_bar n_cout_in n_p n_p_bar n_vdd n_gnd tgate Wn=tgate_carry_chain_2_nmos Wp=tgate_carry_chain_2_pmos
Xptran_carry_chain_1 n_p n_a_in_bar n_b_in n_gnd ptran Wn=tgate_carry_chain_1_nmos
Xptran_carry_chain_2 n_p_bar n_a_in n_b_in n_gnd ptran Wn=tgate_carry_chain_1_nmos
Xptran_carry_chain_3 n_p_bar n_a_in_bar n_b_in n_vdd ptranp Wn=tgate_carry_chain_1_pmos
Xptran_carry_chain_4 n_p n_a_in n_b_in n_vdd ptranp Wn=tgate_carry_chain_1_pmos
Xwire_carry_chain_1 n_a n_a_in wire Rw='wire_carry_chain_1_res' Cw='wire_carry_chain_1_cap' 
Xwire_carry_chain_2 n_b n_b_in wire Rw='wire_carry_chain_2_res' Cw='wire_carry_chain_2_cap' 
Xwire_carry_chain_3 n_cin n_cin_in wire Rw='wire_carry_chain_3_res' Cw='wire_carry_chain_3_cap' 
Xwire_carry_chain_4 n_cout n_cout_in wire Rw='wire_carry_chain_4_res' Cw='wire_carry_chain_4_cap' 
Xwire_carry_chain_5 n_sum_out n_sum_in wire Rw='wire_carry_chain_5_res' Cw='wire_carry_chain_5_cap' 
Xinv_carry_chain_3 n_sum_internal n_sum_in n_vdd n_gnd inv Wn=inv_carry_chain_2_nmos Wp=inv_carry_chain_2_pmos
.ENDS


******************************************************************************************
* carry chain periphery subcircuit 
******************************************************************************************
.SUBCKT carry_chain_perf n_in n_out n_vdd n_gnd
Xinv_lut_int_buffer_1 n_in n_out n_vdd n_gnd inv Wn=inv_carry_chain_perf_1_nmos Wp=inv_carry_chain_perf_1_pmos
.ENDS


******************************************************************************************
* carry_chain_mux subcircuit (2:1)
******************************************************************************************
.SUBCKT carry_chain_mux n_in n_out n_gate n_gate_n n_vdd n_gnd
Xptran_carry_chain_mux n_in n_1_1 n_gate n_gnd ptran Wn=ptran_carry_chain_mux_nmos
Xwire_carry_chain_mux n_1_1 n_1_2 wire Rw='wire_carry_chain_mux_res/2' Cw='wire_carry_chain_mux_cap/2'
Xwire_carry_chain_mux_h n_1_2 n_1_3 wire Rw='wire_carry_chain_mux_res/2' Cw='wire_carry_chain_mux_cap/2'
Xptran_carry_chain_mux_h n_gnd n_1_3 n_gnd n_gnd ptran Wn=ptran_carry_chain_mux_nmos
Xrest_carry_chain_mux n_1_2 n_2_1 n_vdd n_gnd rest Wp=rest_carry_chain_mux_pmos
Xinv_carry_chain_mux_1 n_1_2 n_2_1 n_vdd n_gnd inv Wn=inv_carry_chain_mux_1_nmos Wp=inv_carry_chain_mux_1_pmos
Xwire_carry_chain_mux_driver n_2_1 n_2_2 wire Rw=wire_carry_chain_mux_driver_res Cw=wire_carry_chain_mux_driver_cap
Xinv_carry_chain_mux_2 n_2_2 n_out n_vdd n_gnd inv Wn=inv_carry_chain_mux_2_nmos Wp=inv_carry_chain_mux_2_pmos
.ENDS


******************************************************************************************
* carry chain and tree subcircuit 
******************************************************************************************
.SUBCKT carry_chain_inter n_in n_out n_vdd n_gnd
Xinv1 n_in n_1_1 n_vdd n_gnd inv Wn=inv_carry_chain_inter_1_nmos Wp=inv_carry_chain_inter_1_pmos
Xinv2 n_1_1 n_1_2 n_vdd n_gnd inv Wn=inv_carry_chain_inter_2_nmos Wp=inv_carry_chain_inter_2_pmos
Xwire_carry_chain_inter_1 n_1_2 n_out wire Rw='wire_carry_chain_inter_1_res' Cw='wire_carry_chain_inter_1_cap' 
.ENDS


******************************************************************************************
* ram_local_mux sense inverter subcircuit (25:1)
******************************************************************************************
.SUBCKT ram_local_mux_sense n_in n_out n_vdd n_gnd
Xrest_ram_local_mux n_in n_out n_vdd n_gnd rest Wp=rest_ram_local_mux_pmos
Xinv_ram_local_mux_1 n_in n_out n_vdd n_gnd inv Wn=inv_ram_local_mux_1_nmos Wp=inv_ram_local_mux_1_pmos
.ENDS


******************************************************************************************
* ram_local_mux subcircuit (25:1), turned off 
******************************************************************************************
.SUBCKT ram_local_mux_off n_in n_gate n_gate_n n_vdd n_gnd
Xptran_ram_local_mux_L1 n_in n_gnd n_gnd n_gnd ptran Wn=ptran_ram_local_mux_L1_nmos
.ENDS


******************************************************************************************
* ram_local_mux subcircuit (25:1), partially turned on
******************************************************************************************
.SUBCKT ram_local_mux_partial n_in n_gate n_gate_n n_vdd n_gnd
Xptran_ram_local_mux_L1 n_in n_1 n_gate n_gnd ptran Wn=ptran_ram_local_mux_L1_nmos
Xwire_ram_local_mux_L1_1 n_1 n_1_1 wire Rw='wire_ram_local_mux_L1_res/5' Cw='wire_ram_local_mux_L1_cap/5'
Xptran_ram_local_mux_L1_1h n_gnd n_1_1 n_gnd n_gnd ptran Wn=ptran_ram_local_mux_L1_nmos
Xwire_ram_local_mux_L1_2 n_1_1 n_1_2 wire Rw='wire_ram_local_mux_L1_res/5' Cw='wire_ram_local_mux_L1_cap/5'
Xptran_ram_local_mux_L1_2h n_gnd n_1_2 n_gnd n_gnd ptran Wn=ptran_ram_local_mux_L1_nmos
Xwire_ram_local_mux_L1_3 n_1_2 n_1_3 wire Rw='wire_ram_local_mux_L1_res/5' Cw='wire_ram_local_mux_L1_cap/5'
Xptran_ram_local_mux_L1_3h n_gnd n_1_3 n_gnd n_gnd ptran Wn=ptran_ram_local_mux_L1_nmos
Xwire_ram_local_mux_L1_4 n_1_3 n_1_4 wire Rw='wire_ram_local_mux_L1_res/5' Cw='wire_ram_local_mux_L1_cap/5'
Xptran_ram_local_mux_L1_4h n_gnd n_1_4 n_gnd n_gnd ptran Wn=ptran_ram_local_mux_L1_nmos
Xwire_ram_local_mux_L1_5 n_1_4 n_1_5 wire Rw='wire_ram_local_mux_L1_res/5' Cw='wire_ram_local_mux_L1_cap/5'
Xptran_ram_local_mux_L2 n_1_5 n_gnd n_gnd n_gnd ptran Wn=ptran_ram_local_mux_L2_nmos
.ENDS


******************************************************************************************
* ram_local_mux subcircuit (25:1), fully turned on (mux only)
******************************************************************************************
.SUBCKT ram_local_mux_on_mux_only n_in n_out n_gate n_gate_n n_vdd n_gnd
Xptran_ram_local_mux_L1 n_in n_1 n_gate n_gnd ptran Wn=ptran_ram_local_mux_L1_nmos
Xwire_ram_local_mux_L1_1 n_1 n_1_1 wire Rw='wire_ram_local_mux_L1_res/5' Cw='wire_ram_local_mux_L1_cap/5'
Xptran_ram_local_mux_L1_1h n_gnd n_1_1 n_gnd n_gnd ptran Wn=ptran_ram_local_mux_L1_nmos
Xwire_ram_local_mux_L1_2 n_1_1 n_1_2 wire Rw='wire_ram_local_mux_L1_res/5' Cw='wire_ram_local_mux_L1_cap/5'
Xptran_ram_local_mux_L1_2h n_gnd n_1_2 n_gnd n_gnd ptran Wn=ptran_ram_local_mux_L1_nmos
Xwire_ram_local_mux_L1_3 n_1_2 n_1_3 wire Rw='wire_ram_local_mux_L1_res/5' Cw='wire_ram_local_mux_L1_cap/5'
Xptran_ram_local_mux_L1_3h n_gnd n_1_3 n_gnd n_gnd ptran Wn=ptran_ram_local_mux_L1_nmos
Xwire_ram_local_mux_L1_4 n_1_3 n_1_4 wire Rw='wire_ram_local_mux_L1_res/5' Cw='wire_ram_local_mux_L1_cap/5'
Xptran_ram_local_mux_L1_4h n_gnd n_1_4 n_gnd n_gnd ptran Wn=ptran_ram_local_mux_L1_nmos
Xwire_ram_local_mux_L1_5 n_1_4 n_1_5 wire Rw='wire_ram_local_mux_L1_res/5' Cw='wire_ram_local_mux_L1_cap/5'
Xptran_ram_local_mux_L2 n_1_5 n_2 n_gate n_gnd ptran Wn=ptran_ram_local_mux_L2_nmos
Xwire_ram_local_mux_L2_1 n_2 n_2_1 wire Rw='wire_ram_local_mux_L2_res/4' Cw='wire_ram_local_mux_L2_cap/4'
Xptran_ram_local_mux_L2_1h n_gnd n_2_1 n_gnd n_gnd ptran Wn=ptran_ram_local_mux_L2_nmos
Xwire_ram_local_mux_L2_2 n_2_1 n_out wire Rw='wire_ram_local_mux_L2_res/4' Cw='wire_ram_local_mux_L2_cap/4'
Xptran_ram_local_mux_L2_2h n_gnd n_out n_gnd n_gnd ptran Wn=ptran_ram_local_mux_L2_nmos
Xwire_ram_local_mux_L2_3  n_out n_2_2 wire Rw='wire_ram_local_mux_L2_res/4' Cw='wire_ram_local_mux_L2_cap/4'
Xptran_ram_local_mux_L2_3h n_gnd n_2_2 n_gnd n_gnd ptran Wn=ptran_ram_local_mux_L2_nmos
Xwire_ram_local_mux_L2_4 n_2_2 n_2_3 wire Rw='wire_ram_local_mux_L2_res/4' Cw='wire_ram_local_mux_L2_cap/4'
Xptran_ram_local_mux_L2_4h n_gnd n_2_3 n_gnd n_gnd ptran Wn=ptran_ram_local_mux_L2_nmos
.ENDS


******************************************************************************************
* ram_local_mux subcircuit (25:1), fully turned on 
******************************************************************************************
.SUBCKT ram_local_mux_on n_in n_out n_gate n_gate_n n_vdd n_gnd
Xram_local_mux_on_mux_only n_in n_1_1 n_gate n_gate_n n_vdd n_gnd ram_local_mux_on_mux_only
Xram_local_mux_sense n_1_1 n_out n_vdd n_gnd ram_local_mux_sense
.ENDS


******************************************************************************************
* rowdecoderstage13 low power stage 0 of row decoder
******************************************************************************************
.SUBCKT rowdecoderstage13 n_in n_out n_vdd n_gnd
Xrowdecoderstage13_nand n_in n_1_1 n_vdd n_gnd nand3_lp Wn=inv_nand3_rowdecoderstage13_1_nmos Wp=inv_nand3_rowdecoderstage13_1_pmos
Xrowdecoderstage13_inv n_1_1 n_out n_vdd n_gnd inv_lp Wn=inv_rowdecoderstage13_2_nmos Wp=inv_rowdecoderstage13_2_pmos
.ENDS


******************************************************************************************
* rowdecoderstage3 subcircuit row decoder last stage 
******************************************************************************************
.SUBCKT rowdecoderstage3 n_in n_out n_vdd n_gnd
X0rowdecoderstage3_nand3 n_in n_1_1 n_vdd n_gnd nand3 Wn=inv_nand3_rowdecoderstage3_1_nmos Wp=inv_nand3_rowdecoderstage3_1_pmos
X_invrowdecoderstage3_2 n_1_1 n_out n_vdd n_gnd inv Wn=inv_rowdecoderstage3_2_nmos Wp=inv_rowdecoderstage3_2_pmos
.ENDS


******************************************************************************************
* rowdecoderstage0 low power stage 0 of row decoder
******************************************************************************************
.SUBCKT rowdecoderstage0 n_in n_out n_vdd n_gnd
Xrowdecoderstage0 n_in n_out n_vdd n_gnd inv_lp Wn=inv_rowdecoderstage0_1_nmos Wp=inv_rowdecoderstage0_1_pmos
.ENDS


******************************************************************************************
* wordline_driver subcircuit predecoder stage 3 
******************************************************************************************
.SUBCKT wordline_driver n_in n_out n_vdd n_gnd
Xwordline_driver_nand3 n_in n_1_1 n_vdd n_gnd nand3_lp Wn=inv_nand3_wordline_driver_1_nmos Wp=inv_nand3_wordline_driver_1_pmos
X_invwordline_driver_2 n_1_1 n_1_2 n_vdd n_gnd inv_lp Wn=inv_wordline_driver_2_nmos Wp=inv_wordline_driver_2_pmos
Xwirelrepeat n_1_2 n_1_2_2 wire Rw=wire_memorycell_horizontal_res/2 Cw=wire_memorycell_horizontal_cap/2 
X_invwordline_driver_3 n_1_2_2 n_1_3 n_vdd n_gnd inv_lp Wn=inv_wordline_driver_3_nmos Wp=inv_wordline_driver_3_pmos
X_invwordline_driver_4 n_1_3 n_out n_vdd n_gnd inv_lp Wn=inv_wordline_driver_4_nmos Wp=inv_wordline_driver_4_pmos
.ENDS


******************************************************************************************
* RAM local routing wire load
******************************************************************************************
.SUBCKT RAM_local_routing_wire_load n_in n_out n_gate n_gate_n n_vdd n_gnd n_vdd_RAM_local_mux_on
Xwire_RAM_local_routing_1 n_in n_1 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_1 n_1 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_2 n_1 n_2 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_2 n_2 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_3 n_2 n_3 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_3 n_3 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_4 n_3 n_4 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_4 n_4 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_5 n_4 n_5 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_5 n_5 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_6 n_5 n_6 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_6 n_6 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_7 n_6 n_7 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_7 n_7 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_8 n_7 n_8 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_8 n_8 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_9 n_8 n_9 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_9 n_9 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_10 n_9 n_10 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_10 n_10 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_11 n_10 n_11 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_11 n_11 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_12 n_11 n_12 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_12 n_12 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_13 n_12 n_13 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_13 n_13 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_14 n_13 n_14 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_14 n_14 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_15 n_14 n_15 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_15 n_15 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_16 n_15 n_16 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_16 n_16 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_17 n_16 n_17 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_17 n_17 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_18 n_17 n_18 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_18 n_18 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_19 n_18 n_19 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_19 n_19 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_20 n_19 n_20 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_20 n_20 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_21 n_20 n_21 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_21 n_21 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_22 n_21 n_22 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_22 n_22 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_23 n_22 n_23 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_off_23 n_23 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_off
Xwire_RAM_local_routing_24 n_23 n_24 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_partial_1 n_24 n_gate n_gate_n n_vdd n_gnd RAM_local_mux_partial
Xwire_RAM_local_routing_25 n_24 n_25 wire Rw='wire_RAM_local_routing_res/25' Cw='wire_RAM_local_routing_cap/25'
XRAM_local_mux_on_1 n_25 n_out n_gate n_gate_n n_vdd_RAM_local_mux_on n_gnd RAM_local_mux_on
.ENDS


******************************************************************************************
* memorycell subcircuit MTJ coulmn selector and pull down 
******************************************************************************************
.SUBCKT mtjhigh n_wl1 n_wl2 n_bl1 n_bl2  n_vdd n_gnd
M0 n_bl1 n_wl1 n_1_1 n_gnd nmos_lp_mtj L=22n W=165n AS=6.6f AD=6.6f PS=245n PD=245n
M1 n_bl2 n_wl2 n_1_1 n_gnd nmos_lp_mtj L=22n W=165n AS=6.6f AD=6.6f PS=245n PD=245n
Rmtj n_1_1 n_gnd 'mtj_worst_high'
.ENDS


******************************************************************************************
* memorycell subcircuit MTJ coulmn selector and pull down 
******************************************************************************************
.SUBCKT mtjlow n_wl1 n_wl2 n_bl1 n_bl2  n_vdd n_gnd
M0 n_bl1 n_wl1 n_1_1 n_gnd nmos_lp_mtj L=22n W=165n AS=6.6f AD=6.6f PS=245n PD=245n
M1 n_bl2 n_wl2 n_1_1 n_gnd nmos_lp_mtj L=22n W=165n AS=6.6f AD=6.6f PS=245n PD=245n
Rmtj n_1_1 n_gnd 'mtj_worst_low' 
.ENDS


******************************************************************************************
* memorycell subcircuit MTJ coulmn selector and pull down 
******************************************************************************************
.SUBCKT memorycell n_wl1 n_wl2 n_bl1 n_bl2 n_dummy1 n_dummy2 n_vdd n_gnd
M0 n_bl1 n_wl1 n_1_1 n_gnd nmos_lp_mtj L=22n W=165n AS=6.6f AD=6.6f PS=245n PD=245n
M1 n_bl2 n_wl2 n_1_1 n_gnd nmos_lp_mtj L=22n W=165n AS=6.6f AD=6.6f PS=245n PD=245n
Rmtj n_1_1 n_gnd 'mtj_nominal_low' 
.ENDS


******************************************************************************************
* memorycell subcircuit MTJ coulmn selector and pull down 
******************************************************************************************
.SUBCKT memorycellh n_wl1 n_wl2 n_bl1 n_bl2 n_dummy1 n_dummy2 n_vdd n_gnd
M0 n_bl1 n_wl1 n_1_1 n_gnd nmos_lp_mtj L=22n W=165n AS=6.6f AD=6.6f PS=245n PD=245n
M1 n_bl2 n_wl2 n_1_1 n_gnd nmos_lp_mtj L=22n W=165n AS=6.6f AD=6.6f PS=245n PD=245n
Rmtj n_1_1 n_gnd 'mtj_nominal_high' 
.ENDS


******************************************************************************************
* memorycell subcircuit MTJ memory cell 
******************************************************************************************
.SUBCKT memory_cell_ref n_wl1 n_wl2 n_bl1 n_bl2 n_dummy1 n_dummy2 n_vdd n_gnd
M0 n_bl1 n_wl1 n_1_1 n_gnd nmos_lp_mtj L=22n W=165n AS=6.6f AD=6.6f PS=245n PD=245n
M1 n_bl2 n_wl2 n_1_1 n_gnd nmos_lp_mtj L=22n W=165n AS=6.6f AD=6.6f PS=245n PD=245n
Rmtj n_1_1 n_gnd 2118 
.ENDS


******************************************************************************************
* mtj_subcircuits subcircuit MTJ sense amp 
******************************************************************************************
.SUBCKT mtj_subcircuits_sa n_inp n_inp_ref n_se1 n_se2 n_out n_vclamp n_vref n_reb n_ref n_vdd n_gnd
M0 n_1_1 n_se1 n_vdd n_vdd pmos_lp_mtj L=22n W=300n AS=300n*trans_diffusion_length AD=300n*trans_diffusion_length PS=300n+2*trans_diffusion_length PD=300n+2*trans_diffusion_length
M1 n_1_2 n_se1 n_vdd n_vdd pmos_lp_mtj L=22n W=300n AS=300n*trans_diffusion_length AD=300n*trans_diffusion_length PS=300n+2*trans_diffusion_length PD=300n+2*trans_diffusion_length
X_invmtjsa_6 n_1_1 n_out n_vdd n_gnd inv_lp_mtj Wn=inv_mtj_subcircuits_mtjsa_6_nmos Wp=inv_mtj_subcircuits_mtjsa_6_pmos
X_invmtjsa_6d n_1_2 n_out2 n_vdd n_gnd inv_lp_mtj Wn=inv_mtj_subcircuits_mtjsa_6_nmos Wp=inv_mtj_subcircuits_mtjsa_6_pmos
M2 n_1_1 n_1_2 n_vdd n_vdd pmos_lp_mtj L=65n W=100n AS=100n*trans_diffusion_length AD=100n*trans_diffusion_length PS=100n+2*trans_diffusion_length PD=100n+2*trans_diffusion_length
M3 n_1_2 n_1_1 n_vdd n_vdd pmos_lp_mtj L=65n W=100n AS=100n*trans_diffusion_length AD=100n*trans_diffusion_length PS=100n+2*trans_diffusion_length PD=100n+2*trans_diffusion_length
M4 n_1_1 n_1_2 n_1_5 n_gnd nmos_lp_mtj L=65n W=800n AS=800n*trans_diffusion_length AD=800n*trans_diffusion_length PS=800n+2*trans_diffusion_length PD=800n+2*trans_diffusion_length
M5 n_1_2 n_1_1 n_1_6 n_gnd nmos_lp_mtj L=65n W=800n AS=800n*trans_diffusion_length AD=800n*trans_diffusion_length PS=800n+2*trans_diffusion_length PD=800m+2*trans_diffusion_length
M6 n_1_5 n_se2 n_gnd n_gnd nmos_lp_mtj L=65n W=250n AS=250n*trans_diffusion_length AD=250n*trans_diffusion_length PS=250n+2*trans_diffusion_length PD=250n+2*trans_diffusion_length
M7 n_1_6 n_se2 n_gnd n_gnd nmos_lp_mtj L=65n W=250n AS=250n*trans_diffusion_length AD=250n*trans_diffusion_length PS=250n+2*trans_diffusion_length PD=250n+2*trans_diffusion_length
M8 n_1_5 n_vref n_1_7 n_gnd nmos_lp_mtj L=22n W=165n AS=165n*trans_diffusion_length AD=165n*trans_diffusion_length PS=165n+2*trans_diffusion_length PD=165n+2*trans_diffusion_length
M9 n_1_6 n_vclamp n_1_8 n_gnd nmos_lp_mtj L=22n W=165n AS=165n*trans_diffusion_length AD=165n*trans_diffusion_length PS=165n+2*trans_diffusion_length PD=165n+2*trans_diffusion_length
M10 n_1_7 n_ref n_inp_ref n_gnd nmos_lp_mtj L=22n W=200n AS=200n*trans_diffusion_length AD=200n*trans_diffusion_length PS=200n+2*trans_diffusion_length PD=200n+2*trans_diffusion_length
M11 n_1_8 n_ref n_inp n_gnd nmos_lp_mtj L=22n W=200n AS=200n*trans_diffusion_length AD=200n*trans_diffusion_length PS=200n+2*trans_diffusion_length PD=200n+2*trans_diffusion_length
M12 n_1_7 n_reb n_inp n_gnd nmos_lp_mtj L=22n W=200n AS=200n*trans_diffusion_length AD=200n*trans_diffusion_length PS=200n+2*trans_diffusion_length PD=200n+2*trans_diffusion_length
M13 n_1_8 n_reb n_inp_ref n_gnd nmos_lp_mtj L=22n W=200n\ AS=200n*trans_diffusion_length AD=200n*trans_diffusion_length PS=200n+2*trans_diffusion_length PD=200n+2*trans_diffusion_length
.ENDS


******************************************************************************************
* mtj_subcircuits subcircuit MTJ write driver 
******************************************************************************************
.SUBCKT mtj_subcircuits_writedriver n_in n_we n_out n_vneg n_vdd n_gnd
M0 n_1_1 n_we_b n_vdd n_vdd pmos_lp_mtj L=22n W=600n AS=600n*trans_diffusion_length AD=600n*trans_diffusion_length PS=600n+2*trans_diffusion_length PD=600n+2*trans_diffusion_length
M1 n_out n_in n_1_1 n_vdd pmos_lp_mtj L=22n W=600n AS=600n*trans_diffusion_length AD=600n*trans_diffusion_length PS=600n+2*trans_diffusion_length PD=600n+2*trans_diffusion_length
M2 n_out n_in n_1_2 n_gnd nmos_lp_mtj L=22n W=600n AS=600n*trans_diffusion_length AD=600n*trans_diffusion_length PS=600n+2*trans_diffusion_length PD=600n+2*trans_diffusion_length
M3 n_1_2 n_we n_vneg n_gnd nmos_lp_mtj L=22n W=600n AS=600n*trans_diffusion_length AD=600n*trans_diffusion_length PS=600n+2*trans_diffusion_length PD=600n+2*trans_diffusion_length
X_invmtj_subcircuits_1 n_we n_we_b n_vdd n_gnd inv_lp_mtj Wn=45n Wp=90n
.ENDS


******************************************************************************************
* mtj_subcircuits subcircuit MTJ coulmn selector and pull down 
******************************************************************************************
.SUBCKT mtj_subcircuits_cs n_in n_out n_ctrl n_ctrl_b n_vdd n_gnd
M0 n_in n_ctrl n_out n_vdd pmos_lp_mtj L=22n W=600n AS=600n*trans_diffusion_length AD=600n*trans_diffusion_length PS=600n+2*trans_diffusion_length PD=600n+2*trans_diffusion_length
M1 n_out n_ctrl_b n_in n_gnd nmos_lp_mtj L=22n W=600n AS=600n*trans_diffusion_length AD=600n*trans_diffusion_length PS=600n+2*trans_diffusion_length PD=600n+2*trans_diffusion_length
M2 n_out n_ctrl n_gnd n_gnd nmos_lp_mtj L=22n W=ptran_mtj_subcircuits_mtjcs_0_nmos AS=ptran_mtj_subcircuits_mtjcs_0_nmos*trans_diffusion_length AD=ptran_mtj_subcircuits_mtjcs_0_nmos*trans_diffusion_length PS=ptran_mtj_subcircuits_mtjcs_0_nmos+2*trans_diffusion_length PD=ptran_mtj_subcircuits_mtjcs_0_nmos+2*trans_diffusion_length
.ENDS


******************************************************************************************
* level_shifter subcircuit level shifter 
******************************************************************************************
.SUBCKT level_shifter n_in n_out n_vdd n_vddlp n_gnd
X_invlevel_shifter_1 n_in n_1_1 n_vdd n_gnd inv Wn=inv_level_shifter_1_nmos Wp=inv_level_shifter_1_pmos
X_invlevel_shifter_2 n_1_1 n_1_2 n_vdd n_gnd inv Wn=inv_level_shifter_1_nmos Wp=inv_level_shifter_1_pmos
M0 n_gnd n_1_1 n_1_3 n_gnd nmos_lp L=22n W=ptran_level_shifter_2_nmos AS=ptran_level_shifter_2_nmos*trans_diffusion_length AD=ptran_level_shifter_2_nmos*trans_diffusion_length PS=ptran_level_shifter_2_nmos+2*trans_diffusion_length PD=ptran_level_shifter_2_nmos+2*trans_diffusion_length
M1 n_gnd n_1_2 n_1_4 n_gnd nmos_lp L=22n W=ptran_level_shifter_2_nmos AS=ptran_level_shifter_2_nmos*trans_diffusion_length AD=ptran_level_shifter_2_nmos*trans_diffusion_length PS=ptran_level_shifter_2_nmos+2*trans_diffusion_length PD=ptran_level_shifter_2_nmos+2*trans_diffusion_length
M2 n_1_3 n_1_4 n_vddlp n_vddlp pmos_lp L=22n W=ptran_level_shifter_2_nmos AS=ptran_level_shifter_3_pmos*trans_diffusion_length AD=ptran_level_shifter_3_pmos*trans_diffusion_length PS=ptran_level_shifter_3_pmos+2*trans_diffusion_length PD=ptran_level_shifter_3_pmos+2*trans_diffusion_length
M3 n_1_4 n_1_3 n_vddlp n_vddlp pmos_lp L=22n W=ptran_level_shifter_3_pmos AS=ptran_level_shifter_3_pmos*trans_diffusion_length AD=ptran_level_shifter_3_pmos*trans_diffusion_length PS=ptran_level_shifter_3_pmos+2*trans_diffusion_length PD=ptran_level_shifter_3_pmos+2*trans_diffusion_length
X_invlevel_shifter_3 n_1_4 n_out n_vddlp n_gnd inv_lp Wn=inv_level_shifter_1_nmos Wp=inv_level_shifter_1_pmos
.ENDS


******************************************************************************************
* columndecoder subcircuit write driver 
******************************************************************************************
.SUBCKT columndecoder n_in n_out n_vdd n_gnd
X_inv_columndecoder_1 n_in n_1_1 n_vdd n_gnd inv_lp Wn=inv_columndecoder_1_nmos Wp=inv_columndecoder_1_pmos
X_inv_columndecoder_2 n_1_1 n_1_2 n_vdd n_gnd nand2_lp Wn=inv_columndecoder_2_nmos Wp=inv_columndecoder_2_pmos
X_inv_columndecoder_3 n_1_2 n_out n_vdd n_gnd inv_lp Wn=inv_columndecoder_3_nmos Wp=inv_columndecoder_3_pmos
.ENDS


******************************************************************************************
* xconfigurabledecoderi part of the configurable decoder
******************************************************************************************
.SUBCKT xconfigurabledecoderi n_in n_out n_vdd n_gnd
Xxconfigurabledecoderi n_in n_1_1 n_vdd n_gnd inv_lp Wn=inv_xconfigurabledecoderi_1_nmos Wp=inv_xconfigurabledecoderi_1_pmos
Xtgatexconfigurabledecoderi_1 n_1_1 n_out n_vdd n_gnd n_vdd n_gnd tgate_lp Wn=tgate_xconfigurabledecoderi_2_nmos Wp=tgate_xconfigurabledecoderi_2_pmos
.ENDS


******************************************************************************************
* xconfigurabledecoderiii subcircuit configurable decoder 
******************************************************************************************
.SUBCKT xconfigurabledecoderiii n_in n_out n_vdd n_gnd
Xxconfigurabledecoderiii_nand2 n_in n_1_1 n_vdd n_gnd nand2_lp Wn=inv_nand2_xconfigurabledecoderiii_1_nmos Wp=inv_nand2_xconfigurabledecoderiii_1_pmos
X_invxconfigurabledecoderiii n_1_1 n_out n_vdd n_gnd inv_lp Wn=inv_xconfigurabledecoderiii_2_nmos Wp=inv_xconfigurabledecoderiii_2_pmos
.ENDS


******************************************************************************************
* xconfigurabledecoder3ii subcircuit configurable decoder 
******************************************************************************************
.SUBCKT xconfigurabledecoder3ii n_in n_out n_vdd n_gnd
Xxconfigurabledecoder3ii_nand3 n_in n_1_1 n_vdd n_gnd nand3_lp Wn=inv_nand3_xconfigurabledecoder3ii_1_nmos Wp=inv_nand3_xconfigurabledecoder3ii_1_pmos
X_invxconfigurabledecoder3ii n_1_1 n_out n_vdd n_gnd inv_lp Wn=inv_xconfigurabledecoder3ii_2_nmos Wp=inv_xconfigurabledecoder3ii_2_pmos
.ENDS


******************************************************************************************
* pgateoutputcrossbar subcircuit pgate output crossbar 
******************************************************************************************
.SUBCKT pgateoutputcrossbar n_in n_out n_vdd n_sram_v n_gnd
X_inv_pgateoutputcrossbar_1 n_in n_1_1 n_vdd n_gnd inv Wn=inv_pgateoutputcrossbar_1_nmos Wp=inv_pgateoutputcrossbar_1_pmos
X_inv_pgateoutputcrossbar_2 n_1_1 n_1_2 n_vdd n_gnd inv Wn=inv_pgateoutputcrossbar_2_nmos Wp=inv_pgateoutputcrossbar_2_pmos
M0 n_t_up n_gnd n_vdd n_vdd pmos L=22n W=inv_pgateoutputcrossbar_3_pmos AS=inv_pgateoutputcrossbar_3_pmos*trans_diffusion_length AD=inv_pgateoutputcrossbar_3_pmos*trans_diffusion_length PS=inv_pgateoutputcrossbar_3_pmos+2*trans_diffusion_length PD=inv_pgateoutputcrossbar_3_pmos+2*trans_diffusion_length
M1 n_0_0 n_1_2 n_t_up n_vdd pmos L=22n W=inv_pgateoutputcrossbar_3_pmos AS=inv_pgateoutputcrossbar_3_pmos*trans_diffusion_length AD=inv_pgateoutputcrossbar_3_pmos*trans_diffusion_length PS=inv_pgateoutputcrossbar_3_pmos+2*trans_diffusion_length PD=inv_pgateoutputcrossbar_3_pmos+2*trans_diffusion_length
M2 n_0_0 n_1_2 n_t_bot  n_gnd nmos L=22n W=inv_pgateoutputcrossbar_3_nmos AS=inv_pgateoutputcrossbar_3_nmos*trans_diffusion_length AD=inv_pgateoutputcrossbar_3_nmos*trans_diffusion_length PS=inv_pgateoutputcrossbar_3_nmos+2*trans_diffusion_length PD=inv_pgateoutputcrossbar_3_nmos+2*trans_diffusion_length
M3 n_t_bot n_vdd n_gnd n_gnd nmos L=22n W=inv_pgateoutputcrossbar_3_nmos AS=inv_pgateoutputcrossbar_3_nmos*trans_diffusion_length AD=inv_pgateoutputcrossbar_3_nmos*trans_diffusion_length PS=inv_pgateoutputcrossbar_3_nmos+2*trans_diffusion_length PD=inv_pgateoutputcrossbar_3_nmos+2*trans_diffusion_length
X_wire_0_0 n_0_0 n_0_1 wire Rw=wire_pgateoutputcrossbar_res/2 Cw=wire_pgateoutputcrossbar_cap/2 
X_ptran_0_1 n_0_1 n_hang_nbd n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos 
X_ptran_0_2 n_0_1 n_hang_nbd n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos 
X_ptran_0_3 n_0_1 n_hang_nbd n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos 
X_ptran_0_4 n_0_1 n_hang_nbd n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos 
X_ptran_0_5 n_0_1 n_hang_nbd n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos 
X_ptran_0_6 n_0_1 n_hang_nbd n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos 
X_wire_0_1 n_0_1 n_1_3 wire Rw=wire_pgateoutputcrossbar_res/2 Cw=wire_pgateoutputcrossbar_cap/2 
X_ptran_0 n_1_3 n_1_4 n_sram_v n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos 
X_wire_out n_1_4 n_out wire Rw=wire_pgateoutputcrossbar_res Cw=wire_pgateoutputcrossbar_cap 
X_wire_0 n_1_4 n_1_5 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64 
X_tgate1 n_x_1 n_hang_1 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_1 n_hang_1 n_1_5 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_1 n_1_5 n_1_6 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate2 n_x_2 n_hang_2 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_2 n_hang_2 n_1_6 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_2 n_1_6 n_1_7 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate3 n_x_3 n_hang_3 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_3 n_hang_3 n_1_7 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_3 n_1_7 n_1_8 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate4 n_x_4 n_hang_4 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_4 n_hang_4 n_1_8 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_4 n_1_8 n_1_9 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate5 n_x_5 n_hang_5 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_5 n_hang_5 n_1_9 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_5 n_1_9 n_1_10 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate6 n_x_6 n_hang_6 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_6 n_hang_6 n_1_10 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_6 n_1_10 n_1_11 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate7 n_x_7 n_hang_7 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_7 n_hang_7 n_1_11 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_7 n_1_11 n_1_12 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate8 n_x_8 n_hang_8 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_8 n_hang_8 n_1_12 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_8 n_1_12 n_1_13 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate9 n_x_9 n_hang_9 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_9 n_hang_9 n_1_13 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_9 n_1_13 n_1_14 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate10 n_x_10 n_hang_10 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_10 n_hang_10 n_1_14 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_10 n_1_14 n_1_15 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate11 n_x_11 n_hang_11 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_11 n_hang_11 n_1_15 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_11 n_1_15 n_1_16 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate12 n_x_12 n_hang_12 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_12 n_hang_12 n_1_16 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_12 n_1_16 n_1_17 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate13 n_x_13 n_hang_13 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_13 n_hang_13 n_1_17 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_13 n_1_17 n_1_18 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate14 n_x_14 n_hang_14 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_14 n_hang_14 n_1_18 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_14 n_1_18 n_1_19 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate15 n_x_15 n_hang_15 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_15 n_hang_15 n_1_19 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_15 n_1_19 n_1_20 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate16 n_x_16 n_hang_16 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_16 n_hang_16 n_1_20 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_16 n_1_20 n_1_21 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate17 n_x_17 n_hang_17 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_17 n_hang_17 n_1_21 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_17 n_1_21 n_1_22 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate18 n_x_18 n_hang_18 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_18 n_hang_18 n_1_22 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_18 n_1_22 n_1_23 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate19 n_x_19 n_hang_19 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_19 n_hang_19 n_1_23 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_19 n_1_23 n_1_24 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate20 n_x_20 n_hang_20 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_20 n_hang_20 n_1_24 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_20 n_1_24 n_1_25 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate21 n_x_21 n_hang_21 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_21 n_hang_21 n_1_25 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_21 n_1_25 n_1_26 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate22 n_x_22 n_hang_22 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_22 n_hang_22 n_1_26 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_22 n_1_26 n_1_27 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate23 n_x_23 n_hang_23 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_23 n_hang_23 n_1_27 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_23 n_1_27 n_1_28 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate24 n_x_24 n_hang_24 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_24 n_hang_24 n_1_28 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_24 n_1_28 n_1_29 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate25 n_x_25 n_hang_25 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_25 n_hang_25 n_1_29 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_25 n_1_29 n_1_30 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate26 n_x_26 n_hang_26 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_26 n_hang_26 n_1_30 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_26 n_1_30 n_1_31 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate27 n_x_27 n_hang_27 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_27 n_hang_27 n_1_31 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_27 n_1_31 n_1_32 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate28 n_x_28 n_hang_28 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_28 n_hang_28 n_1_32 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_28 n_1_32 n_1_33 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate29 n_x_29 n_hang_29 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_29 n_hang_29 n_1_33 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_29 n_1_33 n_1_34 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate30 n_x_30 n_hang_30 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_30 n_hang_30 n_1_34 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_30 n_1_34 n_1_35 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate31 n_x_31 n_hang_31 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_31 n_hang_31 n_1_35 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_31 n_1_35 n_1_36 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate32 n_x_32 n_hang_32 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_32 n_hang_32 n_1_36 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_32 n_1_36 n_1_37 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate33 n_x_33 n_hang_33 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_33 n_hang_33 n_1_37 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_33 n_1_37 n_1_38 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate34 n_x_34 n_hang_34 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_34 n_hang_34 n_1_38 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_34 n_1_38 n_1_39 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate35 n_x_35 n_hang_35 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_35 n_hang_35 n_1_39 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_35 n_1_39 n_1_40 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate36 n_x_36 n_hang_36 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_36 n_hang_36 n_1_40 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_36 n_1_40 n_1_41 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate37 n_x_37 n_hang_37 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_37 n_hang_37 n_1_41 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_37 n_1_41 n_1_42 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate38 n_x_38 n_hang_38 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_38 n_hang_38 n_1_42 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_38 n_1_42 n_1_43 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate39 n_x_39 n_hang_39 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_39 n_hang_39 n_1_43 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_39 n_1_43 n_1_44 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate40 n_x_40 n_hang_40 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_40 n_hang_40 n_1_44 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_40 n_1_44 n_1_45 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate41 n_x_41 n_hang_41 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_41 n_hang_41 n_1_45 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_41 n_1_45 n_1_46 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate42 n_x_42 n_hang_42 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_42 n_hang_42 n_1_46 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_42 n_1_46 n_1_47 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate43 n_x_43 n_hang_43 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_43 n_hang_43 n_1_47 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_43 n_1_47 n_1_48 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate44 n_x_44 n_hang_44 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_44 n_hang_44 n_1_48 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_44 n_1_48 n_1_49 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate45 n_x_45 n_hang_45 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_45 n_hang_45 n_1_49 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_45 n_1_49 n_1_50 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate46 n_x_46 n_hang_46 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_46 n_hang_46 n_1_50 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_46 n_1_50 n_1_51 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate47 n_x_47 n_hang_47 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_47 n_hang_47 n_1_51 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_47 n_1_51 n_1_52 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate48 n_x_48 n_hang_48 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_48 n_hang_48 n_1_52 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_48 n_1_52 n_1_53 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate49 n_x_49 n_hang_49 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_49 n_hang_49 n_1_53 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_49 n_1_53 n_1_54 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate50 n_x_50 n_hang_50 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_50 n_hang_50 n_1_54 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_50 n_1_54 n_1_55 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate51 n_x_51 n_hang_51 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_51 n_hang_51 n_1_55 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_51 n_1_55 n_1_56 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate52 n_x_52 n_hang_52 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_52 n_hang_52 n_1_56 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_52 n_1_56 n_1_57 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate53 n_x_53 n_hang_53 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_53 n_hang_53 n_1_57 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_53 n_1_57 n_1_58 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate54 n_x_54 n_hang_54 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_54 n_hang_54 n_1_58 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_54 n_1_58 n_1_59 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate55 n_x_55 n_hang_55 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_55 n_hang_55 n_1_59 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_55 n_1_59 n_1_60 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate56 n_x_56 n_hang_56 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_56 n_hang_56 n_1_60 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_56 n_1_60 n_1_61 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate57 n_x_57 n_hang_57 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_57 n_hang_57 n_1_61 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_57 n_1_61 n_1_62 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate58 n_x_58 n_hang_58 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_58 n_hang_58 n_1_62 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_58 n_1_62 n_1_63 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate59 n_x_59 n_hang_59 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_59 n_hang_59 n_1_63 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_59 n_1_63 n_1_64 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate60 n_x_60 n_hang_60 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_60 n_hang_60 n_1_64 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_60 n_1_64 n_1_65 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate61 n_x_61 n_hang_61 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_61 n_hang_61 n_1_65 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_61 n_1_65 n_1_66 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate62 n_x_62 n_hang_62 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_62 n_hang_62 n_1_66 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_62 n_1_66 n_1_67 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate63 n_x_63 n_hang_63 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_63 n_hang_63 n_1_67 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_63 n_1_67 n_1_68 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate64 n_x_64 n_hang_64 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_64 n_hang_64 n_1_68 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_64 n_1_68 n_1_69 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate65 n_x_65 n_hang_65 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_65 n_hang_65 n_1_69 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_65 n_1_69 n_1_70 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate66 n_x_66 n_hang_66 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_66 n_hang_66 n_1_70 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_66 n_1_70 n_1_71 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate67 n_x_67 n_hang_67 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_67 n_hang_67 n_1_71 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_67 n_1_71 n_1_72 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate68 n_x_68 n_hang_68 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_68 n_hang_68 n_1_72 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_68 n_1_72 n_1_73 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate69 n_x_69 n_hang_69 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_69 n_hang_69 n_1_73 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_69 n_1_73 n_1_74 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate70 n_x_70 n_hang_70 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_70 n_hang_70 n_1_74 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_70 n_1_74 n_1_75 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate71 n_x_71 n_hang_71 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_71 n_hang_71 n_1_75 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_71 n_1_75 n_1_76 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate72 n_x_72 n_hang_72 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_72 n_hang_72 n_1_76 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_72 n_1_76 n_1_77 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate73 n_x_73 n_hang_73 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_73 n_hang_73 n_1_77 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_73 n_1_77 n_1_78 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate74 n_x_74 n_hang_74 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_74 n_hang_74 n_1_78 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_74 n_1_78 n_1_79 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate75 n_x_75 n_hang_75 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_75 n_hang_75 n_1_79 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_75 n_1_79 n_1_80 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate76 n_x_76 n_hang_76 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_76 n_hang_76 n_1_80 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_76 n_1_80 n_1_81 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate77 n_x_77 n_hang_77 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_77 n_hang_77 n_1_81 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_77 n_1_81 n_1_82 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate78 n_x_78 n_hang_78 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_78 n_hang_78 n_1_82 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_78 n_1_82 n_1_83 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate79 n_x_79 n_hang_79 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_79 n_hang_79 n_1_83 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_79 n_1_83 n_1_84 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate80 n_x_80 n_hang_80 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_80 n_hang_80 n_1_84 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_80 n_1_84 n_1_85 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate81 n_x_81 n_hang_81 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_81 n_hang_81 n_1_85 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_81 n_1_85 n_1_86 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate82 n_x_82 n_hang_82 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_82 n_hang_82 n_1_86 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_82 n_1_86 n_1_87 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate83 n_x_83 n_hang_83 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_83 n_hang_83 n_1_87 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_83 n_1_87 n_1_88 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate84 n_x_84 n_hang_84 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_84 n_hang_84 n_1_88 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_84 n_1_88 n_1_89 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate85 n_x_85 n_hang_85 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_85 n_hang_85 n_1_89 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_85 n_1_89 n_1_90 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate86 n_x_86 n_hang_86 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_86 n_hang_86 n_1_90 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_86 n_1_90 n_1_91 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate87 n_x_87 n_hang_87 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_87 n_hang_87 n_1_91 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_87 n_1_91 n_1_92 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate88 n_x_88 n_hang_88 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_88 n_hang_88 n_1_92 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_88 n_1_92 n_1_93 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate89 n_x_89 n_hang_89 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_89 n_hang_89 n_1_93 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_89 n_1_93 n_1_94 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate90 n_x_90 n_hang_90 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_90 n_hang_90 n_1_94 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_90 n_1_94 n_1_95 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate91 n_x_91 n_hang_91 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_91 n_hang_91 n_1_95 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_91 n_1_95 n_1_96 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate92 n_x_92 n_hang_92 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_92 n_hang_92 n_1_96 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_92 n_1_96 n_1_97 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate93 n_x_93 n_hang_93 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_93 n_hang_93 n_1_97 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_93 n_1_97 n_1_98 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate94 n_x_94 n_hang_94 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_94 n_hang_94 n_1_98 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_94 n_1_98 n_1_99 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate95 n_x_95 n_hang_95 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_95 n_hang_95 n_1_99 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_95 n_1_99 n_1_100 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate96 n_x_96 n_hang_96 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_96 n_hang_96 n_1_100 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_96 n_1_100 n_1_101 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate97 n_x_97 n_hang_97 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_97 n_hang_97 n_1_101 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_97 n_1_101 n_1_102 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate98 n_x_98 n_hang_98 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_98 n_hang_98 n_1_102 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_98 n_1_102 n_1_103 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate99 n_x_99 n_hang_99 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_99 n_hang_99 n_1_103 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_99 n_1_103 n_1_104 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate100 n_x_100 n_hang_100 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_100 n_hang_100 n_1_104 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_100 n_1_104 n_1_105 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate101 n_x_101 n_hang_101 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_101 n_hang_101 n_1_105 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_101 n_1_105 n_1_106 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate102 n_x_102 n_hang_102 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_102 n_hang_102 n_1_106 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_102 n_1_106 n_1_107 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate103 n_x_103 n_hang_103 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_103 n_hang_103 n_1_107 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_103 n_1_107 n_1_108 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate104 n_x_104 n_hang_104 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_104 n_hang_104 n_1_108 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_104 n_1_108 n_1_109 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate105 n_x_105 n_hang_105 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_105 n_hang_105 n_1_109 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_105 n_1_109 n_1_110 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate106 n_x_106 n_hang_106 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_106 n_hang_106 n_1_110 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_106 n_1_110 n_1_111 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate107 n_x_107 n_hang_107 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_107 n_hang_107 n_1_111 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_107 n_1_111 n_1_112 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate108 n_x_108 n_hang_108 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_108 n_hang_108 n_1_112 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_108 n_1_112 n_1_113 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate109 n_x_109 n_hang_109 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_109 n_hang_109 n_1_113 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_109 n_1_113 n_1_114 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate110 n_x_110 n_hang_110 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_110 n_hang_110 n_1_114 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_110 n_1_114 n_1_115 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate111 n_x_111 n_hang_111 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_111 n_hang_111 n_1_115 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_111 n_1_115 n_1_116 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate112 n_x_112 n_hang_112 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_112 n_hang_112 n_1_116 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_112 n_1_116 n_1_117 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate113 n_x_113 n_hang_113 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_113 n_hang_113 n_1_117 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_113 n_1_117 n_1_118 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate114 n_x_114 n_hang_114 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_114 n_hang_114 n_1_118 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_114 n_1_118 n_1_119 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate115 n_x_115 n_hang_115 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_115 n_hang_115 n_1_119 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_115 n_1_119 n_1_120 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate116 n_x_116 n_hang_116 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_116 n_hang_116 n_1_120 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_116 n_1_120 n_1_121 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate117 n_x_117 n_hang_117 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_117 n_hang_117 n_1_121 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_117 n_1_121 n_1_122 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate118 n_x_118 n_hang_118 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_118 n_hang_118 n_1_122 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_118 n_1_122 n_1_123 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate119 n_x_119 n_hang_119 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_119 n_hang_119 n_1_123 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_119 n_1_123 n_1_124 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate120 n_x_120 n_hang_120 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_120 n_hang_120 n_1_124 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_120 n_1_124 n_1_125 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate121 n_x_121 n_hang_121 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_121 n_hang_121 n_1_125 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_121 n_1_125 n_1_126 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate122 n_x_122 n_hang_122 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_122 n_hang_122 n_1_126 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_122 n_1_126 n_1_127 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate123 n_x_123 n_hang_123 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_123 n_hang_123 n_1_127 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_123 n_1_127 n_1_128 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate124 n_x_124 n_hang_124 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_124 n_hang_124 n_1_128 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_124 n_1_128 n_1_129 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate125 n_x_125 n_hang_125 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_125 n_hang_125 n_1_129 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_125 n_1_129 n_1_130 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate126 n_x_126 n_hang_126 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_126 n_hang_126 n_1_130 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_126 n_1_130 n_1_131 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_tgate127 n_x_127 n_hang_127 n_gnd n_vdd n_vdd n_gnd RAM_tgate
X_ptran_127 n_hang_127 n_1_131 n_gnd n_gnd ptran Wn=ptran_pgateoutputcrossbar_4_nmos
X_wire_127 n_1_131 n_1_132 wire Rw=wire_pgateoutputcrossbar_res/64 Cw=wire_pgateoutputcrossbar_cap/64
X_inv_pgateoutputcrossbarp_1 n_in n_2_1 n_vdd n_gnd inv Wn=inv_pgateoutputcrossbar_1_nmos Wp=inv_pgateoutputcrossbar_1_pmos
X_inv_pgateoutputcrossbarp_2 n_2_1 n_2_2 n_vdd n_gnd inv Wn=inv_pgateoutputcrossbar_2_nmos Wp=inv_pgateoutputcrossbar_2_pmos
M02 n_2t_up n_gnd n_vdd n_vdd pmos L=22n W=inv_pgateoutputcrossbar_3_pmos AS=inv_pgateoutputcrossbar_3_pmos*trans_diffusion_length AD=inv_pgateoutputcrossbar_3_pmos*trans_diffusion_length PS=inv_pgateoutputcrossbar_3_pmos+2*trans_diffusion_length PD=inv_pgateoutputcrossbar_3_pmos+2*trans_diffusion_length
M12 n_20_0 n_2_2 n_2t_up n_vdd pmos L=22n W=inv_pgateoutputcrossbar_3_pmos AS=inv_pgateoutputcrossbar_3_pmos*trans_diffusion_length AD=inv_pgateoutputcrossbar_3_pmos*trans_diffusion_length PS=inv_pgateoutputcrossbar_3_pmos+2*trans_diffusion_length PD=inv_pgateoutputcrossbar_3_pmos+2*trans_diffusion_length
M22 n_20_0 n_2_2 n_2t_bot  n_gnd nmos L=22n W=inv_pgateoutputcrossbar_3_nmos AS=inv_pgateoutputcrossbar_3_nmos*trans_diffusion_length AD=inv_pgateoutputcrossbar_3_nmos*trans_diffusion_length PS=inv_pgateoutputcrossbar_3_nmos+2*trans_diffusion_length PD=inv_pgateoutputcrossbar_3_nmos+2*trans_diffusion_length
M32 n_2t_bot n_vdd n_gnd n_gnd nmos L=22n W=inv_pgateoutputcrossbar_3_nmos AS=inv_pgateoutputcrossbar_3_nmos*trans_diffusion_length AD=inv_pgateoutputcrossbar_3_nmos*trans_diffusion_length PS=inv_pgateoutputcrossbar_3_nmos+2*trans_diffusion_length PD=inv_pgateoutputcrossbar_3_nmos+2*trans_diffusion_length
X_wire2_0_0 n_20_0 n_hang wire Rw=wire_pgateoutputcrossbar_res Cw=wire_pgateoutputcrossbar_cap 
.ENDS


.ENDL SUBCIRCUITS