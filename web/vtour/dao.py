#!/usr/bin/python

import db, dataobjects

#
# User section
#
def adduser( usr ):
	qstring = "INSERT INTO users( \"login\", \"password\", email) VALUES ('%s', '%s', '%s');" % ( usr.login, usr.password, usr.email )
	db.insert( qstring )

def updateuser( usr ):
	qstring = "UPDATE users SET \"login\"='%s', \"password\"='%s', email='%s' WHERE id=%d" % ( usr.login, usr.password, usr.email, usr.ident );
	db.update( qstring );

def loginuser( usr ):
	qstring = "SELECT id FROM users WHERE login = '%s' AND password = '%s'" % ( usr.login, usr.password )
	return db.select( qstring )

def getuser( loginorid, secret='' ):
	if ( type(loginorid) == type('') ):
		login = loginorid
		theUser = dataobjects.User( login, '' )
		if ( theUser.secret() == secret ):
			qstring = "SELECT * FROM users WHERE \"login\"='%s'" % theUser.login
			item = db.select( qstring )

			if ( item == None ):
				return None
			else:
				return dataobjects.User( item )
		else:
			return None
	else:
		ident = loginorid
		qstring = "SELECT * FROM users WHERE id=%d" % ident

		item = db.select( qstring )
		if ( item == None ):
			return None
		else:
			return dataobjects.User( item )

#
# Setting section
#
def savesetting( sng ):
	qstring = "INSERT INTO settings( \"user\", name, value ) VALUES (%d, '%s', '%s');" % ( sng.user, sng.name, sng.value )
	db.insert( qstring )

def updatesetting( sng ):
	qstring = "UPDATE settings SET value='%s' WHERE \"user\"=%d AND name='%s'" % ( sng.value, sng.user, sng.name )
	db.update( qstring )

def getsetting( sng ):
	qstring = "SELECT * FROM settings WHERE \"user\" = %d AND name = '%s'" % ( sng.user, sng.name )

	item = db.select( qstring )
	if ( item == None ):
		return None
	else:
		return dataobjects.Setting( item )

#
# Tour section
#
# saving and editing is done by feature server -- these should be getters only
def gettoursbyuser(usrorid):
	if (type(usrorid) == type(0)):
		ident = usrorid
	else:
		ident = usrorid.ident

	qstring = "SELECT id, \"user\", public, name, date FROM tours WHERE \"user\"=%d" % ident
	items = db.getlist( qstring )

	if ( items == None ):
		return None
	else:
		tours = []

		for item in items:
			searches.append( Tour( item ) )

		return tours

def gettourbyname(srch):
	qstring = "SELECT id, \"user\", public, name, date FROM tours WHERE \"user\" = %d AND name='%s'" % ( srch.user, srch.name )
	item = db.select( qstring )
	if ( item == None ):
		return None
	else:
		return dataobjects.Tour( item )

#
# Search section
#
# saving and editing is done by featureserver -- these should be getters only
def getsearchesintour( usr, tour ):
	qstring = "SELECT id, \"user\", tour FROM searches WHERE \"user\" = %d AND tour = %d" % (usr, tour)
	items = db.getlist( qstring )

	if ( items == None ):
		return None
	else:
		searches = []
		for item in items:
			searches.append( Search( item ) )

		return searches

#
# Result section
#
# saving and editing is done by featureserver -- these should be getters only
def getresultsbysearch( usr, search ):
	qstring = "SELECT id, thumb_url, page_url, name, \"user\", search FROM results WHERE \"user\" = %d AND search = %d" % (usr, search)
	items = db.getlist( qstring )

	if ( items == None ):
		return None
	else:
		results = []
		for item in items:
			results.append( Result( item ) )

		return results
