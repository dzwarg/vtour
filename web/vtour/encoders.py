#!/usr/bin/python

import simplejson
import dataobjects

#
# User encoder
#
class Response(object):
	def __init__(self, item=None, msg=''):
		self.message = msg;
		self.item = item;

class UserResponseEncoder( simplejson.JSONEncoder ):
	def default(self, obj):
		if ( obj.item == None ):
			objDict = { 'message': obj.message, 'user':None, 'secret':'' }
		else:
			objDict = { 'message': obj.message, 'user':obj.item.todict(), 'secret':obj.item.secret() }

		return simplejson.dumps( objDict )

#
# Setting encoder
#
class SettingResponseEncoder( simplejson.JSONEncoder ):
	def default(self, obj):
		if ( obj.item == None ):
			objDict = { 'message': obj.message, 'setting':None }
		else:
			objDict = { 'message': obj.message, 'setting':obj.item.todict() }

		return simplejson.dumps( objDict )

#
# List encoder
#
class ListResponseEncoder( simplejson.JSONEncoder ):
	def setlistkey(self,key):
		self.key = key
	def default(self, obj):
		if ( obj.item == None ):
			objDict = { 'message': obj.message, self.key:None }
		elif ( type(obj.item) == type([]) ):
			dicts = []
			for item in obj.item:
				dicts.append( item.todict() )

			objDict = { 'message': obj.message, self.key: dicts }
		else:
			objDict = { 'message': obj.message, self.key:[ obj.item.todict() ] }

		return simplejson.dumps( objDict )
