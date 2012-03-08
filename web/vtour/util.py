#!/usr/bin/python

import sys,os
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

def autolink():
	return "http://" + os.environ["HTTP_HOST"] + "/" + os.environ["SCRIPT_NAME"].split(".")[0]

def authsecret():
	if ( os.environ.has_key("HTTP_VTAUTH") ):
		return os.environ["HTTP_VTAUTH"]
	else:
		return ""
