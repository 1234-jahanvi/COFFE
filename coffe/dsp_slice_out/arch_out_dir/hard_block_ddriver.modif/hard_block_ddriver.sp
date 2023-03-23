.TITLE Dedicated Routing Driver

********************************************************************************
** Include libraries, parameters and other
********************************************************************************

.LIB "../includes.l" INCLUDES

********************************************************************************
** Setup and input
********************************************************************************

.PARAM inv_rowdecoderstage0_1_pmos = 4.05e-07
.PARAM inv_columndecoder_2_pmos = 4.5e-08
.PARAM wire_sb_load_partial_res = 981.036918277
.PARAM inv_hard_block_ddriver_4_pmos = 9e-08
.PARAM wire_lut_d_driver_cap = 3.4476960796e-17
.PARAM ptran_hard_block_local_mux_L1_nmos = 9e-08
.PARAM wire_lut_L5_cap = 2.88725163366e-16
.PARAM inv_lut_c_driver_1_nmos = 4.5e-08
.PARAM wire_ff_tgate_2_out_res = 7.47330364461
.PARAM wire_lut_e_driver_load_cap = 8.48903216048e-16
.PARAM inv_general_ble_output_1_nmos = 4.5e-08
.PARAM inv_nand2_rowdecoderstage12_1_pmos = 4.5e-08
.PARAM wire_hard_block_2_cap = 3.539427313e-16
.PARAM ptran_level_shifter_2_nmos = 4.5e-08
.PARAM rest_ram_local_mux_pmos = 4.5e-08
.PARAM inv_sb_mux_2_nmos = 4.5e-07
.PARAM tran_ff_set_nmos = 4.5e-08
.PARAM inv_samp_output_1_pmos = 4.5e-08
.PARAM inv_xconfigurabledecoder3ii_2_nmos = 4.5e-08
.PARAM inv_ram_local_mux_1_pmos = 9e-08
.PARAM wire_lut_e_driver_not_cap = 1.25780490005e-17
.PARAM wire_gen_routing_res = 1125.45915206
.PARAM wire_local_mux_L2_res = 110.330504262
.PARAM wire_hard_block_2_res = 25.8855604975
.PARAM wire_lut_f_driver_load_cap = 8.48903216048e-16
.PARAM rest_lut_int_buffer_pmos = 4.5e-08
.PARAM wire_lut_c_driver_res = 7.88104613089
.PARAM inv_nand3_xconfigurabledecoder3ii_1_nmos = 4.5e-08
.PARAM wire_ff_cc2_out_cap = 1.49998701861e-17
.PARAM inv_sb_mux_1_pmos = 1.8e-07
.PARAM wire_lut_L2_res = 22.6133672593
.PARAM wire_local_mux_L2_cap = 1.76086076113e-16
.PARAM wire_lut_c_driver_0_rsel_res = 304.174138042
.PARAM inv_lut_int_buffer_1_pmos = 9e-08
.PARAM inv_wordline_driver_4_pmos = 2.25e-07
.PARAM inv_rowdecoderstage3_6_pmos = 2.25e-07
.PARAM inv_ram_local_mux_1_nmos = 4.5e-08
.PARAM wire_lut_L3_cap = 7.21812908414e-17
.PARAM wire_local_routing_cap = 2.81682309873e-15
.PARAM wire_flut_mux_res = 11.3066836297
.PARAM wire_sb_mux_driver_cap = 2.01248466479e-17
.PARAM wire_general_ble_output_cap = 1.80453227103e-17
.PARAM wire_ff_input_out_cap = 1.43651848409e-17
.PARAM inv_lut_a_driver_not_2_nmos = 9e-08
.PARAM wire_cb_load_on_cap = 3.13144479158e-15
.PARAM inv_wordline_driver_2_pmos = 4.5e-08
.PARAM inv_ff_cc1_1_pmos = 1.8e-07
.PARAM rest_ff_input_select_pmos = 4.5e-08
.PARAM wire_ram_local_mux_L2_cap = 1.03221868905e-16
.PARAM inv_rowdecoderstage3_2_nmos = 4.5e-08
.PARAM inv_pgateoutputcrossbar_2_pmos = 4.05e-07
.PARAM inv_lut_f_driver_not_1_nmos = 4.5e-08
.PARAM wire_lut_b_driver_not_res = 7.88104613089
.PARAM wire_cb_mux_L1_res = 148.949049374
.PARAM wire_local_mux_L1_cap = 1.76086076113e-16
.PARAM inv_xconfigurabledecoderi_1_nmos = 4.5e-08
.PARAM inv_hard_block_ddriver_2_pmos = 9e-08
.PARAM wire_local_ble_output_driver_cap = 1.17940249968e-17
.PARAM ptran_ff_input_select_nmos = 1.8e-07
.PARAM inv_lut_a_driver_2_nmos = 9e-08
.PARAM inv_lut_d_driver_2_nmos = 9e-08
.PARAM inv_general_ble_output_2_pmos = 2.25e-07
.PARAM wire_lut_a_driver_load_res = 531.898500798
.PARAM inv_local_mux_1_nmos = 9e-08
.PARAM ptran_ram_local_mux_L2_nmos = 9e-08
.PARAM inv_writedriver_2_nmos = 5.499e-08
.PARAM wire_lut_c_driver_load_cap = 8.48903216048e-16
.PARAM wire_lut_out_buffer_res = 9.36160122808
.PARAM inv_lut_c_driver_1_pmos = 4.5e-08
.PARAM wire_ff_cc2_out_res = 9.39849009089
.PARAM wire_ram_local_mux_L1_res = 64.6758738598
.PARAM wire_pgateoutputcrossbar_cap = 9.31802548923e-16
.PARAM wire_cb_mux_L1_cap = 2.37720781035e-16
.PARAM wire_flut_mux_driver_cap = 1.17940249968e-17
.PARAM wire_lut_a_driver_load_cap = 8.48903216048e-16
.PARAM inv_lut_c_driver_not_2_pmos = 9e-08
.PARAM inv_lut_0sram_driver_2_nmos = 1.8e-07
.PARAM inv_ff_cc1_2_pmos = 5.85e-08
.PARAM wire_memorycell_vertical_res = 763.51488
.PARAM ptran_ram_local_mux_L1_nmos = 9e-08
.PARAM inv_lut_b_driver_2_nmos = 9e-08
.PARAM inv_columndecoder_3_pmos = 9e-08
.PARAM wire_lut_a_driver_not_res = 7.88104613089
.PARAM inv_rowdecoderstage3_4_pmos = 4.5e-08
.PARAM wire_lut_L5_res = 180.906938074
.PARAM inv_local_mux_1_pmos = 9e-08
.PARAM inv_nand3_wordline_driver_1_nmos = 4.5e-08
.PARAM rest_lut_out_buffer_pmos = 4.5e-08
.PARAM wire_sb_load_off_cap = 1.56572239579e-15
.PARAM wire_ff_tgate_1_out_res = 8.42861383777
.PARAM wire_lut_sram_driver_res = 10.3509092852
.PARAM wire_general_ble_output_driver_res = 7.38979909085
.PARAM inv_lut_out_buffer_1_nmos = 9e-08
.PARAM wire_hard_block_local_routing_wire_load_cap = 1.32707038272e-15
.PARAM wire_cb_load_off_cap = 3.13144479158e-15
.PARAM ptran_lut_L1_nmos = 9e-08
.PARAM inv_lut_0sram_driver_2_pmos = 2.7e-07
.PARAM inv_columndecoder_1_nmos = 4.5e-08
.PARAM ptran_precharge_side_nmos = 6.75e-07
.PARAM ptran_equalization_nmos = 4.5e-08
.PARAM ptran_local_ble_output_nmos = 9e-08
.PARAM inv_lut_out_buffer_2_pmos = 2.7e-07
.PARAM wire_lut_c_driver_not_res = 7.88104613089
.PARAM wire_ff_tgate_1_out_cap = 1.34519600694e-17
.PARAM inv_cb_mux_1_nmos = 9e-08
.PARAM ptran_pgateoutputcrossbar_4_nmos = 4.5e-08
.PARAM wire_hard_block_local_mux_L1_cap = 7.64796775829e-17
.PARAM inv_flut_mux_1_pmos = 4.5e-08
.PARAM wire_cb_load_on_res = 1962.07383655
.PARAM wire_ram_local_routing_res = 735.003954122
.PARAM inv_xconfigurabledecoderi_1_pmos = 4.5e-08
.PARAM inv_lut_e_driver_not_1_nmos = 4.5e-08
.PARAM wire_lut_L2_cap = 3.60906454207e-17
.PARAM wire_cb_mux_driver_res = 10.2882234409
.PARAM wire_lut_c_driver_0_res = 11.3066836297
.PARAM inv_hard_block_local_mux_2_pmos = 5.4e-07
.PARAM wire_lut_b_driver_not_cap = 1.25780490005e-17
.PARAM wire_lut_output_load_1_cap = 7.00238658508e-17
.PARAM inv_xconfigurabledecoder2ii_2_nmos = 4.5e-08
.PARAM wire_lut_out_buffer_cap = 1.4940996032e-17
.PARAM wire_ram_local_routing_cap = 1.17305692632e-15
.PARAM inv_columndecoder_3_nmos = 9e-08
.PARAM inv_rowdecoderstage12_2_nmos = 4.5e-08
.PARAM inv_flut_mux_2_pmos = 2.25e-07
.PARAM tgate_writedriver_3_nmos = 2.49975e-07
.PARAM inv_lut_b_driver_not_1_nmos = 4.5e-08
.PARAM tgate_xconfigurabledecoderi_2_nmos = 4.5e-08
.PARAM inv_lut_f_driver_2_pmos = 9e-08
.PARAM inv_wordline_driver_4_nmos = 2.25e-07
.PARAM inv_ff_cc1_2_nmos = 4.5e-08
.PARAM wire_lut_c_driver_0_cap = 1.80453227103e-17
.PARAM inv_xconfigurabledecoderiii_2_pmos = 2.25e-07
.PARAM inv_pgateoutputcrossbar_3_nmos = 9e-07
.PARAM inv_xconfigurabledecoder3ii_2_pmos = 4.5e-08
.PARAM wire_cb_load_partial_cap = 3.13144479158e-15
.PARAM wire_ff_input_select_cap = 2.12459701179e-17
.PARAM wire_lut_sram_driver_out_cap = 1.27712902075e-17
.PARAM inv_nand2_rowdecoderstage3_3_pmos = 4.5e-08
.PARAM inv_ff_cc2_2_nmos = 4.5e-08
.PARAM inv_lut_f_driver_not_2_pmos = 9e-08
.PARAM wire_local_ble_output_driver_res = 7.38979909085
.PARAM inv_lut_c_driver_not_2_nmos = 9e-08
.PARAM inv_samp_output_1_nmos = 4.5e-08
.PARAM ptran_lut_L2_nmos = 9e-08
.PARAM wire_sb_load_on_cap = 1.56572239579e-15
.PARAM inv_hard_block_ddriver_3_pmos = 9e-08
.PARAM inv_xconfigurabledecoderiii_2_nmos = 2.25e-07
.PARAM inv_wordline_driver_2_nmos = 4.5e-08
.PARAM wire_lut_to_flut_mux_cap = 4.24451608024e-16
.PARAM inv_ff_input_1_pmos = 3.69e-07
.PARAM inv_lut_int_buffer_1_nmos = 9e-08
.PARAM wire_ff_input_select_res = 13.3121178481
.PARAM wire_gen_routing_cap = 1.53888144043e-14
.PARAM inv_rowdecoderstage3_6_nmos = 2.25e-07
.PARAM wire_ff_input_out_res = 9.00081438743
.PARAM inv_nand3_rowdecoderstage3_1_pmos = 4.5e-08
.PARAM wire_ff_cc1_out_res = 8.42861383777
.PARAM inv_hard_block_ddriver_1_nmos = 9e-08
.PARAM wire_sb_load_off_res = 981.036918277
.PARAM inv_lut_b_driver_not_2_nmos = 9e-08
.PARAM inv_lut_d_driver_2_pmos = 9e-08
.PARAM tgate_ff_2_pmos = 4.5e-08
.PARAM inv_hard_block_ddriver_3_nmos = 9e-08
.PARAM inv_cb_mux_2_nmos = 2.7e-07
.PARAM inv_ff_cc2_2_pmos = 5.85e-08
.PARAM inv_writedriver_1_nmos = 5.499e-08
.PARAM wire_xconfigurabledecoderi_cap = 2.21677055866e-16
.PARAM wire_pgateoutputcrossbar_res = 583.840854225
.PARAM wire_general_ble_output_res = 11.3066836297
.PARAM inv_hard_block_local_mux_1_nmos = 9e-08
.PARAM ptran_local_mux_L1_nmos = 9e-08
.PARAM wire_ram_local_mux_L1_cap = 1.03221868905e-16
.PARAM ptran_cb_mux_L2_nmos = 9e-08
.PARAM inv_ff_input_1_nmos = 1.35e-07
.PARAM ptran_lut_L4_nmos = 1.35e-07
.PARAM wire_lut_c_driver_not_cap = 1.25780490005e-17
.PARAM inv_flut_mux_2_nmos = 2.25e-07
.PARAM ptran_lut_c_driver_0_nmos = 9e-08
.PARAM inv_rowdecoderstage13_2_nmos = 4.5e-08
.PARAM wire_lut_e_driver_not_res = 7.88104613089
.PARAM wire_lut_b_driver_load_res = 531.898500798
.PARAM inv_columndecoder_2_nmos = 4.5e-08
.PARAM inv_ff_output_driver_nmos = 1.8e-07
.PARAM wire_local_ble_output_res = 11.3066836297
.PARAM inv_lut_c_driver_0_pmos = 9e-08
.PARAM inv_lut_a_driver_2_pmos = 9e-08
.PARAM inv_lut_e_driver_not_2_nmos = 9e-08
.PARAM rest_flut_mux_pmos = 4.5e-08
.PARAM inv_rowdecoderstage12_2_pmos = 4.5e-08
.PARAM wire_ff_cc1_out_cap = 1.34519600694e-17
.PARAM ptran_lut_L5_nmos = 1.35e-07
.PARAM tgate_xconfigurabledecoderi_2_pmos = 4.5e-08
.PARAM inv_lut_c_driver_0_nmos = 9e-08
.PARAM wire_wordline_driver_res = 3106.4576
.PARAM ptran_samp_output_1_pmos = 2.49975e-07
.PARAM inv_lut_a_driver_not_1_nmos = 4.5e-08
.PARAM wire_lut_L6_cap = 5.77450326731e-16
.PARAM tgate_ff_1_nmos = 4.5e-08
.PARAM wire_memorycell_vertical_cap = 1.814784e-15
.PARAM inv_nand2_rowdecoderstage12_1_nmos = 4.5e-08
.PARAM wire_lut_a_driver_not_cap = 1.25780490005e-17
.PARAM wire_lut_output_load_1_res = 43.8749536602
.PARAM inv_lut_out_buffer_2_nmos = 1.8e-07
.PARAM wire_xconfigurabledecoderi_res = 138.896509576
.PARAM ptran_flut_mux_nmos = 9e-08
.PARAM wire_wordline_driver_cap = 7.38368e-15
.PARAM inv_nand3_xconfigurabledecoder3ii_1_pmos = 4.5e-08
.PARAM inv_lut_b_driver_not_1_pmos = 4.5e-08
.PARAM wire_lut_b_driver_load_cap = 8.48903216048e-16
.PARAM wire_xconfigurabledecoderiii_cap = 4.69780386458e-17
.PARAM inv_lut_d_driver_not_2_pmos = 9e-08
.PARAM wire_lut_f_driver_not_res = 7.88104613089
.PARAM wire_local_ble_output_cap = 1.80453227103e-17
.PARAM inv_lut_int_buffer_2_pmos = 2.7e-07
.PARAM rest_hard_block_local_mux_pmos = 4.5e-08
.PARAM inv_lut_e_driver_2_pmos = 9e-08
.PARAM inv_local_ble_output_1_pmos = 4.5e-08
.PARAM ptran_hard_block_local_mux_L2_nmos = 9e-08
.PARAM ptran_sb_mux_L2_nmos = 1.8e-07
.PARAM wire_hard_block_local_mux_driver_res = 10.2882234409
.PARAM inv_flut_mux_1_nmos = 4.5e-08
.PARAM wire_rowdecoderstage0_cap = 1.26021621489e-15
.PARAM ptran_samp_output_2_nmos = 9.999e-08
.PARAM rest_lut_c_driver_pmos = 4.5e-08
.PARAM ptran_samp_output_3_nmos = 9e-07
.PARAM inv_cb_mux_1_pmos = 9e-08
.PARAM inv_hard_block_ddriver_1_pmos = 9e-08
.PARAM wire_lut_e_driver_cap = 3.4476960796e-17
.PARAM ptran_local_mux_L2_nmos = 9e-08
.PARAM wire_flut_mux_driver_res = 7.38979909085
.PARAM inv_ff_cc2_1_nmos = 4.5e-08
.PARAM tgate_ff_2_nmos = 4.5e-08
.PARAM wire_hard_block_local_mux_driver_cap = 1.64198732528e-17
.PARAM inv_lut_a_driver_not_1_pmos = 4.5e-08
.PARAM rest_sb_mux_pmos = 4.5e-08
.PARAM wire_lut_to_flut_mux_res = 265.949250399
.PARAM wire_lut_output_load_2_cap = 9.69447166001e-17
.PARAM wire_lut_int_buffer_out_res = 8.27302965949
.PARAM inv_lut_c_driver_2_nmos = 9e-08
.PARAM rest_local_ble_output_pmos = 4.5e-08
.PARAM inv_hard_block_ddriver_4_nmos = 9e-08
.PARAM inv_lut_f_driver_2_nmos = 9e-08
.PARAM wire_hard_block_local_mux_L2_cap = 7.64796775829e-17
.PARAM inv_level_shifter_1_pmos = 7.50015e-08
.PARAM inv_ff_output_driver_pmos = 4.365e-07
.PARAM wire_ram_local_mux_L2_res = 64.6758738598
.PARAM wire_cb_mux_driver_cap = 1.64198732528e-17
.PARAM rest_general_ble_output_pmos = 4.5e-08
.PARAM wire_sb_mux_L1_res = 134.237706773
.PARAM wire_lut_L4_res = 90.4534690372
.PARAM inv_rowdecoderstage3_5_nmos = 4.5e-08
.PARAM inv_lut_e_driver_not_2_pmos = 9e-08
.PARAM tran_ff_reset_nmos = 4.5e-08
.PARAM wire_lut_a_driver_res = 21.6022785787
.PARAM inv_lut_c_driver_not_1_nmos = 4.5e-08
.PARAM wire_cb_load_off_res = 1962.07383655
.PARAM wire_lut_int_buffer_out_cap = 1.32036497074e-17
.PARAM inv_nand2_xconfigurabledecoderiii_1_nmos = 4.5e-08
.PARAM inv_local_ble_output_2_nmos = 1.8e-07
.PARAM inv_nand2_rowdecoderstage3_3_nmos = 4.5e-08
.PARAM wire_lut_c_driver_0_out_res = 7.01281749288
.PARAM wire_lut_d_driver_load_res = 531.898500798
.PARAM inv_wordline_driver_3_nmos = 4.5e-08
.PARAM wire_lut_int_buffer_cap = 1.4940996032e-17
.PARAM wire_cb_load_partial_res = 1962.07383655
.PARAM rest_cb_mux_pmos = 4.5e-08
.PARAM inv_writedriver_1_pmos = 1.0998e-07
.PARAM wire_sb_load_on_res = 981.036918277
.PARAM inv_lut_int_buffer_2_nmos = 1.8e-07
.PARAM wire_lut_sram_driver_cap = 1.65199190599e-17
.PARAM wire_lut_c_driver_0_out_cap = 1.11923671797e-17
.PARAM wire_lut_d_driver_load_cap = 8.48903216048e-16
.PARAM wire_hard_block_local_routing_wire_load_res = 831.504385516
.PARAM wire_hard_block_local_mux_L2_res = 47.9199808398
.PARAM inv_pgateoutputcrossbar_1_pmos = 1.35e-07
.PARAM wire_local_ble_output_feedback_res = 41.9143175598
.PARAM wire_lut_d_driver_res = 21.6022785787
.PARAM inv_columndecoder_1_pmos = 4.5e-08
.PARAM rest_local_mux_pmos = 4.5e-08
.PARAM tran_ff_set_n_pmos = 4.5e-08
.PARAM wire_lut_b_driver_res = 21.6022785787
.PARAM wire_lut_c_driver_load_res = 531.898500798
.PARAM ptran_general_ble_output_nmos = 9e-08
.PARAM inv_wordline_driver_3_pmos = 4.5e-08
.PARAM tgate_writedriver_3_pmos = 1.49985e-07
.PARAM wire_local_routing_res = 1764.940873
.PARAM wire_lut_c_driver_cap = 1.25780490005e-17
.PARAM wire_lut_f_driver_res = 21.6022785787
.PARAM wire_xconfigurabledecoderiii_res = 29.4350967858
.PARAM inv_ff_cc2_1_pmos = 5.85e-08
.PARAM wire_lut_f_driver_not_cap = 1.25780490005e-17
.PARAM inv_general_ble_output_1_pmos = 4.5e-08
.PARAM wire_lut_d_driver_not_res = 7.88104613089
.PARAM ptran_level_shifter_3_pmos = 4.5e-08
.PARAM wire_local_ble_output_feedback_cap = 6.68947156676e-17
.PARAM wire_hard_block_local_mux_L1_res = 47.9199808398
.PARAM inv_nand3_rowdecoderstage13_1_nmos = 4.5e-08
.PARAM ptran_lut_L3_nmos = 9e-08
.PARAM ptran_samp_output_4_nmos = 2.49975e-07
.PARAM tgate_ff_1_pmos = 4.5e-08
.PARAM wire_sb_mux_L2_cap = 2.14241666077e-16
.PARAM inv_nand2_xconfigurabledecoder2ii_1_pmos = 4.5e-08
.PARAM wire_lut_f_driver_cap = 3.4476960796e-17
.PARAM inv_lut_c_driver_2_pmos = 9e-08
.PARAM wire_ble_outputs_cap = 2.37654450218e-16
.PARAM wire_lut_b_driver_cap = 3.4476960796e-17
.PARAM wire_ff_tgate_2_out_cap = 1.19272971984e-17
.PARAM inv_writedriver_2_pmos = 1.0998e-07
.PARAM inv_sb_mux_1_nmos = 3.6e-07
.PARAM wire_memorycell_horizontal_cap = 7.38368e-15
.PARAM inv_nand3_wordline_driver_1_pmos = 4.5e-08
.PARAM wire_sb_mux_L2_res = 134.237706773
.PARAM inv_lut_e_driver_2_nmos = 9e-08
.PARAM ptran_sb_mux_L1_nmos = 1.35e-07
.PARAM wire_lut_c_driver_0_rsel_cap = 4.85458040651e-16
.PARAM wire_lut_L4_cap = 1.44362581683e-16
.PARAM wire_lut_sram_driver_out_res = 8.00212555003
.PARAM wire_lut_d_driver_not_cap = 1.25780490005e-17
.PARAM inv_local_ble_output_2_pmos = 1.8e-07
.PARAM inv_rowdecoderstage0_1_nmos = 4.05e-07
.PARAM inv_nand2_xconfigurabledecoder2ii_1_nmos = 4.5e-08
.PARAM inv_general_ble_output_2_nmos = 2.25e-07
.PARAM inv_lut_d_driver_not_1_nmos = 4.5e-08
.PARAM inv_lut_a_driver_not_2_pmos = 9e-08
.PARAM inv_rowdecoderstage3_2_pmos = 4.5e-08
.PARAM wire_lut_a_driver_cap = 3.4476960796e-17
.PARAM inv_pgateoutputcrossbar_1_nmos = 1.35e-07
.PARAM wire_lut_L1_res = 11.3066836297
.PARAM wire_lut_e_driver_load_res = 531.898500798
.PARAM wire_cb_mux_L2_res = 148.949049374
.PARAM inv_ff_cc1_1_nmos = 1.35e-07
.PARAM wire_lut_f_driver_load_res = 531.898500798
.PARAM inv_lut_e_driver_not_1_pmos = 4.5e-08
.PARAM wire_ble_outputs_res = 148.907488379
.PARAM inv_hard_block_local_mux_1_pmos = 9e-08
.PARAM wire_rowdecoderstage0_res = 789.615474075
.PARAM wire_lut_L1_cap = 1.80453227103e-17
.PARAM inv_lut_out_buffer_1_pmos = 9e-08
.PARAM wire_lut_output_load_2_res = 60.7427895726
.PARAM wire_hard_block_1_cap = 1.32707038272e-15
.PARAM inv_pgateoutputcrossbar_2_nmos = 2.7e-07
.PARAM inv_level_shifter_1_nmos = 4.5e-08
.PARAM inv_hard_block_local_mux_2_nmos = 2.7e-07
.PARAM wire_sb_mux_L1_cap = 2.14241666077e-16
.PARAM inv_pgateoutputcrossbar_3_pmos = 2.52e-06
.PARAM inv_lut_b_driver_2_pmos = 9e-08
.PARAM tran_ff_reset_n_pmos = 4.5e-08
.PARAM inv_nand3_rowdecoderstage3_1_nmos = 4.5e-08
.PARAM inv_xconfigurabledecoder2ii_2_pmos = 4.5e-08
.PARAM wire_sb_load_partial_cap = 1.56572239579e-15
.PARAM inv_lut_d_driver_not_2_nmos = 9e-08
.PARAM wire_cb_mux_L2_cap = 2.37720781035e-16
.PARAM inv_rowdecoderstage3_4_nmos = 4.5e-08
.PARAM wire_lut_L6_res = 361.813876149
.PARAM inv_lut_c_driver_not_1_pmos = 4.5e-08
.PARAM inv_nand2_xconfigurabledecoderiii_1_pmos = 4.5e-08
.PARAM wire_hard_block_1_res = 831.504385516
.PARAM wire_general_ble_output_driver_cap = 1.17940249968e-17
.PARAM wire_local_mux_L1_res = 110.330504262
.PARAM inv_lut_f_driver_not_1_pmos = 4.5e-08
.PARAM inv_nand3_rowdecoderstage13_1_pmos = 4.5e-08
.PARAM wire_lut_L3_res = 45.2267345186
.PARAM wire_flut_mux_cap = 1.80453227103e-17
.PARAM inv_cb_mux_2_pmos = 5.4e-07
.PARAM inv_lut_d_driver_not_1_pmos = 4.5e-08
.PARAM wire_sb_mux_driver_res = 12.609653914
.PARAM inv_rowdecoderstage3_5_pmos = 4.5e-08
.PARAM inv_hard_block_ddriver_2_nmos = 9e-08
.PARAM inv_rowdecoderstage13_2_pmos = 4.5e-08
.PARAM wire_lut_int_buffer_res = 9.36160122808
.PARAM ptran_cb_mux_L1_nmos = 9e-08
.PARAM inv_sb_mux_2_pmos = 9e-07
.PARAM inv_lut_b_driver_not_2_pmos = 9e-08
.PARAM wire_lut_e_driver_res = 21.6022785787
.PARAM inv_lut_f_driver_not_2_nmos = 9e-08
.PARAM inv_local_ble_output_1_nmos = 4.5e-08
.PARAM wire_memorycell_horizontal_res = 3106.4576

.TRAN 1p 4n 
.OPTIONS BRIEF=1
.option post
.probe v(*)

* Input signal
VIN n_in gnd PULSE (0 supply_v 0 0 0 2n 4n)

* Power rail for the circuit under test.
* This allows us to measure power of a circuit under test without measuring the power of wave shaping and load circuitry.
V_TEST vdd_test gnd supply_v

********************************************************************************
** Measurement
********************************************************************************

* inv_hard_block_ddriver_1 delay
.MEASURE TRAN meas_inv_hard_block_ddriver_1_tfall TRIG V(n_1_1) VAL='supply_v/2' RISE=1
+    TARG V(Xdriver.n_1_2) VAL='supply_v/2' FALL=1
.MEASURE TRAN meas_inv_hard_block_ddriver_1_trise TRIG V(n_1_1) VAL='supply_v/2' FALL=1
+    TARG V(Xdriver.n_1_2) VAL='supply_v/2' RISE=1

* inv_hard_block_ddriver_2 delays
.MEASURE TRAN meas_inv_hard_block_ddriver_2_tfall TRIG V(n_1_1) VAL='supply_v/2' FALL=1
+    TARG V(Xdriver.n_1_4) VAL='supply_v/2' FALL=1
.MEASURE TRAN meas_inv_hard_block_ddriver_2_trise TRIG V(n_1_1) VAL='supply_v/2' RISE=1
+    TARG V(Xdriver.n_1_4) VAL='supply_v/2' RISE=1

* inv_hard_block_ddriver_3 delay
.MEASURE TRAN meas_inv_hard_block_ddriver_3_tfall TRIG V(n_1_1) VAL='supply_v/2' RISE=1
+    TARG V(Xdriver.n_1_6) VAL='supply_v/2' FALL=1
.MEASURE TRAN meas_inv_hard_block_ddriver_3_trise TRIG V(n_1_1) VAL='supply_v/2' FALL=1
+    TARG V(Xdriver.n_1_6) VAL='supply_v/2' RISE=1

* inv_hard_block_ddriver_4 delays
.MEASURE TRAN meas_inv_hard_block_ddriver_4_tfall TRIG V(n_1_1) VAL='supply_v/2' FALL=1
+    TARG V(Xdriver.n_out) VAL='supply_v/2' FALL=1
.MEASURE TRAN meas_inv_hard_block_ddriver_4_trise TRIG V(n_1_1) VAL='supply_v/2' RISE=1
+    TARG V(Xdriver.n_out) VAL='supply_v/2' RISE=1

* Total delays
.MEASURE TRAN meas_total_tfall TRIG V(n_1_1) VAL='supply_v/2' FALL=1
+    TARG V(n_1_3) VAL='supply_v/2' FALL=1
.MEASURE TRAN meas_total_trise TRIG V(n_1_1) VAL='supply_v/2' RISE=1
+    TARG V(n_1_3) VAL='supply_v/2' RISE=1

.MEASURE TRAN meas_logic_low_voltage FIND V(gnd) AT=3n

* Measure the power required to propagate a rise and a fall transition through the subcircuit at 250MHz.
.MEASURE TRAN meas_current INTEGRAL I(V_TEST) FROM=0ns TO=4ns
.MEASURE TRAN meas_avg_power PARAM = '-((meas_current)/4n)*supply_v'

********************************************************************************
** Circuit
********************************************************************************

Xinv_ff_output_driver_0 n_in n_1_0 vdd gnd inv Wn=inv_ff_output_driver_nmos Wp=inv_ff_output_driver_pmos
Xinv_ff_output_driver n_1_0 n_1_1 vdd gnd inv Wn=inv_ff_output_driver_nmos Wp=inv_ff_output_driver_pmos
Xdriver n_1_1 n_1_2 vdd_test gnd hard_block_ddriver
Xwirer_edi n_1_2 n_1_3 wire Rw=wire_hard_block_2_res Cw=wire_hard_block_2_cap 
Xff n_1_3 n_hang2 vdd gnd vdd nnd gnd vdd gnd vdd vdd gnd ff
.END
