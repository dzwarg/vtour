#!/usr/bin/python

import simplejson
import dataobjects

#
# User encoder
#
class Response(object):
	def __init__(self, item=None, msg=''):
		self.message = msg
		self.item = item
		self.listkey = None

class ResponseEncoder( simplejson.JSONEncoder ):
	def default(self, obj):
		if ( obj.item == None ):
			objDict = { 'message': obj.message }
		elif ( str(type(obj.item)) == "<class 'vtour.dataobjects.User'>" ):
			objDict = { 'message': obj.message, 'user':obj.item.todict(), 'secret':obj.item.secret() }
		elif ( str(type(obj.item)) == "<class 'vtour.dataobjects.Setting'>" ):
			objDict = { 'message': obj.message, 'setting':obj.item.todict() }
		elif ( type(obj.item) == type([]) ):
			dicts = []
			for item in obj.item:
				dicts.append( item.todict() )

			objDict = { 'message': obj.message, obj.listkey: dicts }
		else:
			objDict = { 'message': obj.message, obj.listkey:[ obj.item.todict() ] }
		return objDict

#
# Setting encoder
#
#class SettingResponseEncoder( simplejson.JSONEncoder ):
#	def default(self, obj):
#		if ( obj.item == None ):
#			objDict = { 'message': obj.message, 'setting':None }
#		else:
#
#		return simplejson.dumps( objDict )

#
# List encoder
#
#class ListResponseEncoder( simplejson.JSONEncoder ):
#	def setlistkey(self,key):
#		self.key = key
#	def default(self, obj):
#		if ( obj.item == None ):
#			objDict = { 'message': obj.message, self.key:None }
#		elif ( type(obj.item) == type([]) ):
#			dicts = []
#			for item in obj.item:
#				dicts.append( item.todict() )
#
#			objDict = { 'message': obj.message, self.key: dicts }
#		else:
#			objDict = { 'message': obj.message, self.key:[ obj.item.todict() ] }
#
#		return simplejson.dumps( objDict )
