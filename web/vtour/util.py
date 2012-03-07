#!/usr/bin/python

import sys
import simplejson

import hashlib

#
# utility functions
#
def error( message ):
	print simplejson.dumps( { "stat": "error", "message": message } )
	sys.exit(0)

def encrypt( original ):
	hsh = hashlib.md5( original )
	return hsh.hexdigest()
