set sh_enable_page_mode true 
set search_path /home/projects/ljohn/aarora1/cadence_gpdk/gsclib045_all_v4.4/lan/flow/t1u1/reference_libs/GPDK045/gsclib045_all_v4.4/gsclib045/timing/ 
set link_path "* fast_vdd1v0_basicCells.modif.db" 
read_verilog /home/projects/ljohn/aarora1/coffe2_aman/COFFE/output_files/matmul_4x4_int8_45nm/matmul_pnr/netlist.v 
link 
create_clock -period 3.0 clk 
read_parasitics -increment /home/projects/ljohn/aarora1/coffe2_aman/COFFE/output_files/matmul_4x4_int8_45nm/matmul_pnr/spef.spef 
report_timing > /home/projects/ljohn/aarora1/coffe2_aman/COFFE/output_files/matmul_4x4_int8_45nm/matmul_pt/timing.rpt 
quit 
