set sh_enable_page_mode true 
set search_path /home/projects/ljohn/aarora1/cadence_gpdk/gsclib045_all_v4.4/lan/flow/t1u1/reference_libs/GPDK045/gsclib045_all_v4.4/gsclib045/timing/ 
set link_path "* fast_vdd1v0_basicCells.modif.db" 
read_verilog /home/projects/ljohn/aarora1/coffe2_aman/COFFE/output_files/matmul_4x4_int8_45nm/matmul_pnr/netlist.v 
link 
create_clock -period 1.67 clk 
set power_enable_analysis TRUE 
set power_analysis_mode "averaged"
set_switching_activity -static_probability 0.5 -toggle_rate 25 [get_nets] 
read_parasitics -increment /home/projects/ljohn/aarora1/coffe2_aman/COFFE/output_files/matmul_4x4_int8_45nm/matmul_pnr/spef.spef
report_power > /home/projects/ljohn/aarora1/coffe2_aman/COFFE/output_files/matmul_4x4_int8_45nm/matmul_pt/power.rpt 
quit
