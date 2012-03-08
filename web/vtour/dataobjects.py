#!/usr/bin/python

from datetime import datetime
import simplejson
import util

class User(object):
	def __init__(self, loginorrow, password='', ident=0, email=''):
		if ( type(loginorrow) == type('') ):
			login = loginorrow
			self.ident = ident
			self.login = login
			self.password = password
			self.email = email
		else:
			row = loginorrow
			self.ident = row[0]
			self.login = row[1]
			self.password = row[2]
			self.email = row[3]
		self.uri = util.autolink() + "/%d" % self.ident
	def tostring(self):
		print "User:{id:%d,login:'%s',password:'%s',email:'%s',uri:'%s'}" % (self.ident, self.login, self.password, self.email, self.uri)
	def todict(self):
		return { 'id':self.ident, 'login':self.login, 'password':self.password, 'email':self.email, 'uri':self.uri }
	def secret(self):
		return util.encrypt( self.login )

class Setting(object):
	def __init__(self, nameorrow, value=None):
		if ( type(nameorrow) == type('') ):
			name = nameorrow
			self.ident = 0
			self.user = 0
			self.name = name
			self.value = value
		else:
			row = nameorrow
			self.ident = row[0]
			self.user = row[1]
			self.name = row[2]
			self.value = row[3]
		self.uri = util.autolink() + "/%d" % self.ident
	def tostring(self):
		print "Setting:{id:%d,user:%d,name:'%s',value:'%s',uri:'%s'}" % ( self.ident, self.user, self.name, self.value, self.uri )
	def todict(self):
		return { 'id':self.ident, 'user':self.user, 'name':self.name, 'value':self.value, 'uri':self.uri }

class Tour(object):
	def __init__(self, nameorrow):
		if ( type(nameorrow) == type('') ):
			name = nameorrow
			self.ident = 0
			self.user = 0
			self.name = name
			self.public = False
			self.date = datetime.now()
		else:
			row = nameorrow
			self.ident = row[0]
			self.user = row[1]
			self.public = bool(row[2])
			self.name = row[3]
			self.date = row[4]
		self.uri = util.autolink() + "/%d" % self.ident
	def tostring(self):
		print "Tour:{id:%d,user:%d,name:'%s',public:'%s',date:'%s',uri:'%s'}" % ( self.ident, self.user, self.name, self.public, self.date, self.uri )
	def todict(self):
		return { 'id':self.ident, 'user':self.user, 'name':self.name, 'public':self.public, 'date':self.date, 'uri':self.uri }

class Search(object):
	def __init__(self, tourorrow):
		if ( type(tourorrow) == type('') ):
			tour = tourorrow
			self.ident = 0
			self.user = 0
			self.tour = tour
		else:
			row = tourorrow
			self.ident = row[0]
			self.user = row[1]
			self.tour = row[2]
		self.uri = util.autolink() + "/%d" % self.ident
	def tostring(self):
		print "Search:{id:%d,user:%d,tour:%d,uri:'%s'}" % ( self.ident, self.user, self.tour, self.uri )
	def todict(self):
		return { 'id':self.ident, 'user':self.user, 'tour':self.tour, 'uri':self.uri }

class Result(object):
	def __init__(self, searchorrow):
		if ( type(searchorrow) == type(0) ):
			search = searchorrow
			self.ident = 0
			self.thumb_url = ''
			self.page_url = ''
			self.name = ''
			self.user = 0
			self.search = search
		else:
			row = searchorrow
			self.ident = row[0]
			self.thumb_url = row[1]
			self.page_url = row[2]
			self.name = row[3]
			self.user = row[4]
			self.search = row[5]
		self.uri = util.autolink() + "/%d" % self.ident
	def tostring(self):
		print "Result:{id:%d,thumb_url:'%s',page_url:'%s',name:'%s',user:%d,search:%d,uri:'%s'}" % ( self.ident, self.thumb_url, self.page_url, self.name, self.user, self.search, self.uri )
	def todict(self):
		return { 'id':self.ident, 'thumb_url':self.thumb_url, 'page_url':self.page_url, 'name':self.name, 'user':self.user, 'search':self.search, 'uri':self.uri }
