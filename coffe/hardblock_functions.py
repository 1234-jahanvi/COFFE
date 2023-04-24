# Hard block script for COFFE flow.
# Created by: Sadegh Yazdanshenas
# Email: sadegh.yazdanshenas@mail.utoronto.ca
# University of Toronto, 2017

import os
import sys
import subprocess
import re
import shutil
import math
from abc import ABCMeta, abstractmethod

class HardBlockFlow:

	__metaclass__ = ABCMeta

	@abstractmethod
	def hardblock_flow(self,flow_settings):
	    pass
