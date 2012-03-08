#!/usr/bin/python

import db, dataobjects

#
# User section
#
def adduser( usr ):
	qstring = "INSERT INTO users( login_name, passcode, email) VALUES ('%s', '%s', '%s');" % ( usr.login, usr.password, usr.email )
	db.insert( qstring )

	qstring = "SELECT id FROM users WHERE login_name = '%s' AND passcode = '%s' AND email = '%s'" % ( usr.login, usr.password, usr.email )
	item = db.select( qstring )
	if ( not item == None ):
		usr.ident = item[0]
	else:
		usr.ident = 0

def updateuser( usr ):
	qstring = "UPDATE users SET login_name='%s', passcode='%s', email='%s' WHERE id=%d" % ( usr.login, usr.password, usr.email, usr.ident );
	db.update( qstring )

def deleteuser( usr ):
	qstring = "DELETE FROM users WHERE id=%d" % usr
	db.update( qstring )

def loginuser( usr ):
	qstring = "SELECT id FROM users WHERE login_name = '%s' AND passcode = '%s'" % ( usr.login, usr.password )
	return db.select( qstring )

def getuser( loginorid, secret='' ):
	if ( type(loginorid) == type('') ):
		login = loginorid
		theUser = dataobjects.User( login, '' )
		if ( theUser.secret() == secret ):
			qstring = "SELECT * FROM users WHERE login_name='%s'" % theUser.login
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
			theUser = dataobjects.User( item )

			if ( theUser.secret() == secret ):
				return theUser
			else:
				return None

#
# Setting section
#
def savesetting( sng ):
	qstring = "INSERT INTO settings( user_id, name, value ) VALUES (%d, '%s', '%s');" % ( sng.user, sng.name, sng.value )
	db.insert( qstring )

	qstring = "SELECT id FROM settings WHERE user_id = %d AND name = '%s'" % (sng.user, sng.name)
	item = db.select( qstring )
	if ( not item == None ):
		sng.ident = item[0]
	else:
		sng.ident = 0

def updatesetting( sng ):
	qstring = "UPDATE settings SET value='%s' WHERE user_id=%d AND name='%s'" % ( sng.value, sng.user, sng.name )
	db.update( qstring )

def deletesetting( sng ):
	qstring = "DELETE FROM settings WHERE id=%d" % sng.ident
	db.update( qstring )

def getsetting( sng ):
	qstring = "SELECT * FROM settings WHERE user_id = %d AND name = '%s'" % ( sng.user, sng.name )

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

	qstring = "SELECT id, user_id, public, name, date FROM tours WHERE user_id = %d" % ident
	items = db.getlist( qstring )

	if ( items == None ):
		return None
	else:
		tours = []

		for item in items:
			tours.append( dataobjects.Tour( item ) )

		return tours

def gettourbyname(srch):
	qstring = "SELECT id, user_id, public, name, date FROM tours WHERE user_id = %d AND name='%s'" % ( srch.user, srch.name )
	item = db.select( qstring )
	if ( item == None ):
		return None
	else:
		return dataobjects.Tour( item )

def gettourbyid(usrid,tourid):
	qstring = "SELECT id, user_id, public, name, date FROM tours WHERE id = %d AND user_id = %d" % ( tourid, usrid )
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
	qstring = "SELECT id, user_id, tour FROM searches WHERE user_id = %d AND tour = %d" % (usr, tour)
	items = db.getlist( qstring )

	if ( items == None ):
		return None
	else:
		searches = []
		for item in items:
			searches.append( dataobjects.Search( item ) )

		return searches

def getsearchbyid( usrid, tourid, searchid ):
	qstring = "SELECT id, user_id, tour FROM searches WHERE user_id = %d AND tour = %d AND id = %d" % (usrid, tourid, searchid)
	item = db.select( qstring )

	if ( item == None ):
		return None
	else:
		return dataobjects.Search( item )

#
# Result section
#
# saving and editing is done by featureserver -- these should be getters only
def getresultsbysearch( usr, search ):
	qstring = "SELECT id, thumb_url, page_url, name, user_id, search FROM results WHERE user_id = %d AND search = %d" % (usr, search)
	items = db.getlist( qstring )

	if ( items == None ):
		return None
	else:
		results = []
		for item in items:
			results.append( dataobjects.Result( item ) )

		return results

def getresultbyid( usrid, searchid, resultid ):
	qstring = "SELECT id, thumb_url, page_url, name, user_id, search FROM results WHERE user_id = %d AND search = %d AND id = %d" % (usrid, searchid, resultid)
	item = db.select( qstring )

	if ( item == None ):
		return None
	else:
		return dataobjects.Result( item )
