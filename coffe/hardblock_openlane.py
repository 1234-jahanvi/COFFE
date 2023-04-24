import os
import sys
import subprocess
import re
import shutil
import math
from abc import ABCMeta, abstractmethod

from hardblock_functions import HardBlockFlow

class HardBlockOpenLane(HardBlockFlow):

	# wire loads in the library are WireAreaLowkCon WireAreaLowkAgr WireAreaForZero
	def hardblock_flow(self,flow_settings):

	  # Enter all the signals that change modes
	  lowest_cost = sys.float_info.max
	  lowest_cost_area = 1.0
	  lowest_cost_delay = 1.0
	  lowest_cost_power = 1.0

	  ###########################################
	  # Running OpenLane
	  ###########################################
	  design_files = []
	  if flow_settings['design_language'] == 'verilog':
	    for file in os.listdir(os.path.expanduser(flow_settings['design_folder'])):
	      if file.endswith(".v"):
		design_files.append(file)
	  elif flow_settings['design_language'] == 'vhdl':
	    for file in os.listdir(os.path.expanduser(flow_settings['design_folder'])):
	      if file.endswith(".vhdl"):
		design_files.append(file)
	  elif flow_settings['design_language'] == 'sverilog':
	    for file in os.listdir(os.path.expanduser(flow_settings['design_folder'])):
	      if file.endswith(".sv"):
		design_files.append(file) 
		   
	  #subprocess.call("mkdir -p " + os.path.expanduser(flow_settings['synth_folder']) + "\n", shell=True)
	  # Make sure we managed to read the design files
	  print(os.listdir(os.path.expanduser(flow_settings['design_folder'])))
	  assert len(design_files) >= 1
	  for clock_period in flow_settings['clock_period']:
	    for wire_selection in flow_settings['wire_selection']:

	      # Run the script in design compiler shell
	      #subprocess.call('dc_shell-t -f dc_script.tcl', shell=True, executable='/bin/tcsh')
	      
	      # Change working dir so that SPICE output files are created in circuit subdirectory
	      open_lane_designs_path = flow_settings['open_lane_path'] + "/designs"
	      saved_cwd = os.getcwd()
	      os.chdir(open_lane_designs_path)
	      
	      design_name = flow_settings['name']
	      print("DESIGN NAME = " + design_name)
	      designs_folder_path = open_lane_designs_path + "/" + design_name
	      subprocess.call("mkdir -p " + os.path.expanduser(designs_folder_path) + "\n", shell=True) 
	      
	      os.chdir(designs_folder_path)
	      
	      src_folder_path = designs_folder_path + "/src"
	      subprocess.call("mkdir -p " + os.path.expanduser(src_folder_path) + "\n", shell=True)
	      
	      
	      clk_port_name = flow_settings['clock_pin_name']
	      clk_period = flow_settings['clock_period'][0]
	      top_level = flow_settings['top_level']
	      #core_utilization = str(float(flow_settings['core_utilization'][0])*100)
	      core_utilization = "95"
	      #rest_core_utilization = str(100.0 - float(flow_settings['core_utilization'][0])*100)
	      rest_core_utilization = "5"
	      open_lane_path = flow_settings['open_lane_path']
	      open_lane_lib_path = open_lane_path + "/designs/" + design_name + "/src/"
	      
	      
	      file = open("config.json","w")
	      file.write("{" + "\n")
	      file.write("\"DESIGN_NAME\": \"" + design_name + "\"," + "\n")
	      file.write("\"VERILOG_FILES\": \"dir::src/dsp_slice.v\"," + "\n")
	      file.write("\"CLOCK_PORT\": \"" + clk_port_name + "\"," + "\n")
	      file.write("\"CLOCK_NET\": \"clk\"," + "\n")
	      file.write("\"GLB_RESIZER_TIMING_OPTIMIZATIONS\": true," + "\n")
	      file.write("\"CLOCK_PERIOD\": " + clk_period + "," + "\n")
	      file.write("\"PL_TARGET_DENSITY\": 0.7," + "\n")
	      file.write("\"FP_SIZING\" : \"relative\"," + "\n")
	      file.write("\"pdk::sky130*\": {" + "\n")
	      file.write("\"FP_CORE_UTIL\": " + core_utilization + "," + "\n")
	      file.write("\"scl::sky130_fd_sc_hd\": {" + "\n")
	      file.write("\"FP_CORE_UTIL\": " + rest_core_utilization + "\n")
	      file.write("}" + "\n")
	      file.write("}," + "\n")

	      file.write("\"LIB_SYNTH\": \"dir::src/sky130_fd_sc_hd__typical.lib\"," + "\n")
	      file.write("\"LIB_FASTEST\": \"dir::src/sky130_fd_sc_hd__fast.lib\"," + "\n")
	      file.write("\"LIB_SLOWEST\": \"dir::src/sky130_fd_sc_hd__slow.lib\"," + "\n")
	      file.write("\"LIB_TYPICAL\": \"dir::src/sky130_fd_sc_hd__typical.lib\"," + "\n")
	      file.write("\"TEST_EXTERNAL_GLOB\": \"dir::../dsp_slice/src/*\"" + "\n")
	      file.write("}" + "\n")
	      file.close()
	
	      os.chdir(src_folder_path)
	      
	      subprocess.call("cp " + os.path.expanduser(flow_settings['design_folder']) + "/" + design_name + ".v " + os.path.expanduser(src_folder_path) + "/" + "\n", shell=True)
	      
	      os.chdir(flow_settings['open_lane_path'])
	      
	      subprocess.call("make quick_run QUICK_RUN_DESIGN="+design_name+ "\n", shell=True)
	      
	    
	      # Make sure it worked properly
	      # Open the timing report and make sure the critical path is non-zero:
	     
	      latest_run_folder_path = open_lane_path + "/designs/" + design_name + "/runs"
	      os.chdir(latest_run_folder_path)
	      latest_run_folder = subprocess.check_output("ls -td -- */ | head -n 1 | cut -d'/' -f1", shell=True)
	      latest_run_folder = latest_run_folder.replace("\n", "")
	      print(latest_run_folder)
	      
	      check_file = open(os.path.expanduser(latest_run_folder) + "/openlane.log", "r")
	      for line in check_file:
		if "[ERROR]" in line:
		  print ("Your design has errors. Refer to Openlane.log file in the latest run folder.")
		  exit(-1)
		elif "[WARNING]" in line and flow_settings['show_warnings']:
		  print ("Your design has warnings. Refer to Openlane.log file in the latest run folder.")
		  print ("In spite of the warnings, the rest of the flow will continue to execute.")
	      check_file.close()
	     
	      
	      #if the user doesn't want to perform place and route, extract the results from DC reports and end
	      
	      # read total area from the report file:
	      file = open(os.path.expanduser(latest_run_folder) + "/reports/synthesis/1-synthesis.AREA_0.stat.rpt" ,"r")
	      for line in file:
	      	if line.startswith('   Chip area for module'):
	      		total_area = re.findall(r'\d+\.{0,1}\d*', line)
	      file.close()

	      # Read timing parameters
	      file = open(os.path.expanduser(latest_run_folder) + "/reports/synthesis/2-syn_sta.rpt" ,"r")
	      for line in file:
		  	if 'data arrival time' in line:
		    		data_arrival_time = re.findall(r'\d+\.{0,1}\d*', line)
				break
	      total_delay =  float(data_arrival_time[0])
	      file.close()    

		  # Read dynamic power
	      file = open(os.path.expanduser(latest_run_folder) + "/reports/synthesis/2-syn_sta.power.rpt" ,"r")
	      for line in file:
		if 'Total ' in line:
			total_dynamic_power_list = re.findall(r'\d+\.\d*e-\d*', line)
			total_dynamic_power = float(total_dynamic_power_list[3])
	      file.close()    

		# write the final report file:
	      file = open(os.path.expanduser(latest_run_folder) + "/report_synthesis.txt" ,"w")
              file.write("total area = "  + str(total_area[0]) +  "\n")
              file.write("total delay = " + str(total_delay) + " ns\n")
              file.write("total power = " + str(total_dynamic_power) + " W\n")
	      file.close()
	      
	      
	      ###########################################
	      # Place and Route
	      ###########################################
		 
	      # read total area from the report file:
	      file = open(os.path.expanduser(latest_run_folder) + "/reports/routing/12-rt_rsz_sta.area.rpt" ,"r")
	      for line in file:
	        if line.startswith('Design area'):
		  total_area = re.findall(r'\d+\.{0,1}\d*', line)
	      file.close()
		  
	      if len(flow_settings['mode_signal']) > 0:
	      	mode_enabled = True
	      else:
	      	mode_enabled = False
	      the_power = 0.0
		  

	      ###########################################
	      # Primetime
	      ###########################################

	      # Read timing parameters
	      file = open(os.path.expanduser(latest_run_folder) + "/reports/signoff/24-rcx_sta.min.rpt" ,"r")
	      for line in file:
		  	if 'data arrival time' in line:
		    		data_arrival_time = re.findall(r'\d+\.{0,1}\d*', line)
				break
	      total_delay = float(data_arrival_time[0])
	      file.close()


	      # Read dynamic power
	      file = open(os.path.expanduser(latest_run_folder) + "/reports/signoff/24-rcx_sta.power.rpt" ,"r")
	      for line in file:
		if 'Total ' in line:
			total_dynamic_power_list = re.findall(r'\d+\.\d*e-\d*', line)
			total_dynamic_power = float(total_dynamic_power_list[3])
			if 'mW' in line:
                  	  total_dynamic_power *= 0.001
                	elif 'uw' in line:
                  	  total_dynamic_power *= 0.000001
                	else:
                  	  total_dynamic_power = 0
	      file.close()
	          

	      # write the final report file:
	      file = open(os.path.expanduser(latest_run_folder) + "/report_final_" + str(flow_settings['top_level']) + ".txt" ,"w")
	      file.write("total area = "  + str(total_area[0]) +  " um^2 \n")
	      file.write("total delay = " + str(total_delay) + " ns \n")
	      file.write("total power = " + str(total_dynamic_power) + " W \n")
	      file.close()
	      if total_dynamic_power > the_power:
	        the_power = total_dynamic_power
	      
	      if lowest_cost > math.pow(float(total_area[0]), float(flow_settings['area_cost_exp'])) * math.pow(float(total_delay), float(flow_settings['delay_cost_exp'])):
	        lowest_cost = math.pow(float(total_area[0]), float(flow_settings['area_cost_exp'])) * math.pow(float(total_delay), float(flow_settings['delay_cost_exp']))
	        lowest_cost_area = float(total_area[0])
	        lowest_cost_delay = float(total_delay)
	        lowest_cost_power = float(the_power)
	      
	      del total_dynamic_power_list[:]
	      del data_arrival_time[:]
	      print(lowest_cost_area)
	      print(lowest_cost_delay)
	      print(lowest_cost_power)
	    
	  return (float(lowest_cost_area), float(lowest_cost_delay), float(lowest_cost_power))

