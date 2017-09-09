#!/usr/bin/python

import sys, os
sys.path.insert (0,'/srv/qwc2-server')
os.chdir("/srv/qwc2-server")
from qwc2demo import app as application
