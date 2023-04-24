import os
import utils
from abc import ABCMeta, abstractmethod

class TopLevel:

	__metaclass__ = ABCMeta

        @abstractmethod
	def generate_switch_block_top(self,mux_name):
            pass
            
        @abstractmethod
	def generate_connection_block_top(self,mux_name):
            pass
            
        @abstractmethod
	def generate_local_mux_top(self,mux_name):
            pass

        @abstractmethod
	def generate_sram_read_power_top(self,name, sram_per_column, unselected_column_count):
            pass

        @abstractmethod
	def generate_sram_writelh_power_top_lp(self,name, sram_per_column, unselected_column_count):
            pass

        @abstractmethod
	def generate_mtj_read_power_top_lp(self,name, mtj_per_column):
            pass

        @abstractmethod
	def generate_mtj_write_power_top_lp(self,name, mtj_per_column):
            pass

        @abstractmethod
	def generate_sram_writehh_power_top_lp(self,name, sram_per_column, unselected_column_count):
            pass

        @abstractmethod
	def generate_sram_writep_power_top_lp(self,name, sram_per_column, unselected_column_count):
            pass

        @abstractmethod
	def generate_sram_read_power_top_lp(self,name, sram_per_column, unselected_column_count):
            pass

        @abstractmethod
	def generate_pgateoutputcrossbar_top(self,name, maxwidth, def_use_tgate):
            pass

        @abstractmethod
	def generate_configurabledecoderiii_top(self,name, fanin1,fanin2, required_size, tgatecount):
            pass

        @abstractmethod
	def generate_mtj_charge(self,name, colsize):
            pass

        @abstractmethod
	def generate_mtj_sa_top(self,name, colsize):
            pass

        @abstractmethod
	def generate_mtj_discharge(self,name, colsize):
            pass

        @abstractmethod
	def generate_configurabledecoderiii_top_lp(self,name, fanin1,fanin2, required_size, tgatecount):
            pass

        @abstractmethod
	def generate_rowdecoderstage3_top_lp(self,name, fanin1,fanin2, sramcount, number_of_banks, gate_type):
            pass

        @abstractmethod
	def generate_wordline_driver_top_lp(self,name, sramcount, nandsize, smallrow, repeater):
            pass

        @abstractmethod
	def generate_rowdecoderstage3_top(self,name, fanin1,fanin2, sramcount, number_of_banks, gate_type):
            pass

        @abstractmethod
	def generate_rowdecoderstage1_top(self,name, fanout, size):
            pass

        @abstractmethod
	def generate_rowdecoderstage1_top_lp(self,name, fanout, size):
            pass

        @abstractmethod
	def generate_configurabledecoder2ii_top(self,name, fanout, size):
            pass

        @abstractmethod
	def generate_configurabledecoder2ii_top_lp(self,name, fanout, size):
            pass

        @abstractmethod
	def generate_rowdecoderstage0_top(self,name,numberofgates2,numberofgates3, decodersize, label2, label3):
            pass

        @abstractmethod
	def generate_rowdecoderstage0_top_lp(self,name,numberofgates2,numberofgates3, decodersize, label2, label3):
            pass

        @abstractmethod
	def generate_configurabledecoderi_top(self,name,numberofgates2,numberofgates3, ConfiDecodersize):
            pass

        @abstractmethod
	def generate_configurabledecoderi_top_lp(self,name,numberofgates2,numberofgates3, ConfiDecodersize):
            pass

        @abstractmethod
	def generate_columndecoder_top(self,name, numberoftgates, decsize):
            pass

        @abstractmethod
	def generate_columndecoder_top_lp(self,name, numberoftgates, decsize):
            pass

        @abstractmethod
	def generate_writedriver_top(self,name, numberofsrams):
            pass

        @abstractmethod
	def generate_writedriver_top_lp(self,name, numberofsrams):
            pass

        @abstractmethod
	def generate_samp_top_part2(self,name, numberofsrams, difference):
            pass

        @abstractmethod
	def generate_samp_top_part2_lp(self,name, numberofsrams, difference):
            pass

        @abstractmethod
	def generate_samp_top_part1(self,name, numberofsrams, difference):
            pass

        @abstractmethod
	def generate_samp_top_part1_lp(self,name, numberofsrams, difference):
            pass

        @abstractmethod
	def generate_samp_top(self,name, numberofsrams):
            pass

        @abstractmethod
	def generate_precharge_top(self,name, numberofsrams):
            pass

        @abstractmethod
	def generate_precharge_top_lp(self,name, numberofsrams):
            pass

        @abstractmethod
	def generate_HB_local_mux_top(self,mux_name, name):
            pass

        @abstractmethod
	def generate_RAM_local_mux_top(self,mux_name):
            pass

        @abstractmethod
	def generate_RAM_local_mux_top_lp(self,mux_name):
            pass

        @abstractmethod
	def generate_lut6_top(self,lut_name, use_tgate):
            pass

        @abstractmethod
	def generate_lut5_top(self,lut_name, use_tgate):
            pass

        @abstractmethod
	def generate_lut4_top(self,lut_name, use_tgate):
            pass

        @abstractmethod
	def generate_lut_driver_top(self,input_driver_name, input_driver_type):
            pass

        @abstractmethod
	def generate_lut_driver_not_top(self,input_driver_name, input_driver_type):
            pass

        @abstractmethod
	def generate_lut_and_driver_top(self,input_driver_name, input_driver_type, use_tgate, use_fluts):
            pass

        @abstractmethod
	def generate_local_ble_output_top(self,name, use_tgate):
            pass

        @abstractmethod
	def generate_general_ble_output_top(self,name, use_tgate):
            pass

        @abstractmethod
	def generate_flut_mux_top(self,name, use_tgate, enable_carry_chain):
            pass

        @abstractmethod
	def generate_cc_mux_top(self,name, use_tgate):
            pass

        @abstractmethod
	def generate_carrychain_top(self,name, architecture):
            pass

        @abstractmethod
	def generate_carry_chain_ripple_top(self,name):
            pass

        @abstractmethod
	def generate_carry_chain_skip_top(self,name, use_tgate):
            pass

        @abstractmethod
	def generate_carrychain_top(self,name):
            pass

        @abstractmethod
	def generate_carry_inter_top(self,name):
            pass

        @abstractmethod
	def generate_carrychainand_top(self,name, use_tgate, nand1_size, nand2_size):
            pass
            
        @abstractmethod
	def generate_skip_mux_top(self,name, use_tgate):
            pass
            
        @abstractmethod
	def generate_dedicated_driver_top (self,name, top_name, num_bufs):
            pass

