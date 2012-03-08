#!/usr/bin/python

import os, sys
import cgi
import cgitb; cgitb.enable()

import simplejson

from vtour import db, util, dataobjects, dao, encoders

form = cgi.FieldStorage()

resp = encoders.Response()

method = os.environ["REQUEST_METHOD"]

def usertoursearchresult( resp, searchid, tourid, usrid, pathinfo ):
	if ( len(pathinfo) < 2 ):
		resp.message = "Not enough path to go on."
	else:
		op = pathinfo.pop()

		if ( op == "result" ):
			op = pathinfo.pop()
			if ( op == "all" ):
				theUser = dao.getuser( usrid, util.authsecret() )

				if ( theUser != None ):
					theResults = dao.getresultsbysearch( usrid, searchid )
					resp.item = theResults
					resp.listkey = "results"
					resp.message = "ok"
				else:
					resp.message = "%d is not a valid user, or the authorization is incorrect." % usrid
			else:
				resultid = 0
				try:
					resultid = int(op)
				except ValueError:
					pass

				if ( resultid != 0 ):
					# op on the result itself
					theUser = dao.getuser( usrid, util.authsecret() )
					if ( theUser != None ):
						theResult = dao.getresultbyid( usrid, searchid, resultid )

						resp.item = theResult
						resp.listkey = "results"
						resp.message = "ok"
					else:
						resp.message = "%d is not a valid user, or the authorization is incorrect." % usrid
				else:
					resp.message = "'%s' is not a supported operation." % op
		else:
			resp.message = "'%s' is not a supported operation on a search." % op

def usertoursearch( resp, usrid, tourid, pathinfo ):
	if ( len(pathinfo) < 2 ):
		resp.message = "Not enough path to go on."
	else:
		op = pathinfo.pop()

		if ( op == "search" ):
			op = pathinfo.pop()
			if ( op == "all" ):
				theUser = dao.getuser( usrid, util.authsecret() )

				if ( theUser != None ):
					theSearches = dao.getsearchesintour( usrid, tourid )
					resp.item = theSearches
					resp.listkey = "searches"
					resp.message = "ok"
				else:
					resp.message = "%d is not a valid user, or the authorization is incorrect." % usrid
			else:
				searchid = 0
				try:
					searchid = int(op)
				except ValueError:
					pass

				if ( searchid != 0 ):
					if ( len(pathinfo) > 0 ): # op on the search's items
						usertoursearchresult( resp, searchid, tourid, usrid, pathinfo )
					else:
						# op on the search itself
						theUser = dao.getuser( usrid, util.authsecret() )
						if ( theUser != None ):
							theSearch = dao.getsearchbyid( usrid, tourid, searchid )

							resp.item = theSearch
							resp.listkey = "searches"
							resp.message = "ok"
						else:
							resp.message = "%d is not a valid user, or the authorization is incorrect." % usrid
				else:
					resp.message = "'%s' is not a supported operation." % op
		else:
			resp.message = "'%s' is not a supported operation on a tour." % op

def usertour( resp, usrid, pathinfo ):
	if ( os.environ["REQUEST_METHOD"] != "GET" ):
		resp.message = "Method not supported."
	elif ( len(pathinfo) == 0 ):
		resp.message = "Not enough path to go on."
	else:
		op = pathinfo.pop()
		if ( op == "name" ):
			if ( len(pathinfo) > 0 ):
				name = pathinfo.pop()

				theUser = dao.getuser( usrid, util.authsecret() )
				if ( theUser != None ):
					theTour = dataobjects.Tour( name )
					theTour.user = theUser.ident

					item = dao.gettourbyname( theTour )

					resp.message = "ok"
					resp.item = item
					resp.link = util.autolink() + "/%d" % theTour.ident
				else:
					resp.message = "%s is not a valid user, or authorization is incorrect." % usrid
			else:
				resp.message = "To get a tour by name, please supply the name."
		elif ( op == "all" ):
			theUser = dao.getuser( usrid, util.authsecret() )
			if ( theUser != None ):
				theTours = dao.gettoursbyuser( usrid )

				resp.message = "ok"
				resp.listkey = "tours"
				resp.item = theTours
			else:
				resp.message = "%d is not a valid user, or the authorization is incorrect." % usrid
		else:
			tourid = 0
			try:
				tourid = int(op)
			except ValueError:
				pass

			if ( tourid != 0 ):
				if ( len(pathinfo) > 0 ): # op on the tour's items
					usertoursearch( resp, usrid, tourid, pathinfo )
				else:
					# op on the tour itself
					theUser = dao.getuser( usrid, util.authsecret() )
					if ( theUser != None ):
						theTour = dao.gettourbyid( usrid, tourid )

						resp.item = theTour
						resp.message = "ok"
					else:
						resp.message = "%d is not a valid user, or the authorization is incorrect." % usrid
			else:
				resp.message = "'%s' is not a supported operation." % op


def usersetting( resp, usrid, pathinfo, form ):
	if ( len(pathinfo) > 0 ):
		theUser = dao.getuser( usrid, util.authsecret() )
		if ( theUser != None ):
			name = pathinfo.pop()
			method = os.environ["REQUEST_METHOD"]

			if ( method == "GET" ):
				theSetting = dataobjects.Setting( name )
				theSetting.user = usrid
				theSetting = dao.getsetting( theSetting )

				resp.item = theSetting
				resp.message = "ok"
			elif ( method == "POST" ):
				try:
					if ( form.has_key( "value" ) ):
						value = form["value"].value
						theSetting = dataobjects.Setting( name )
						theSetting.user = usrid
						theSetting = dao.getsetting( theSetting )

						if ( theSetting == None ):
							# create the setting
							theSetting = dataobjects.Setting( name, value )
							theSetting.user = usrid

							dao.savesetting( theSetting )

							resp.message = "ok"
							resp.item = theSetting
							resp.listkey = "setting"
						else:
							# edit the setting
							theSetting = dataobjects.Setting( name, value )
							theSetting.user = usrid

							dao.updatesetting( theSetting )

							resp.message = "ok"
							resp.item = theSetting
							resp.listkey = "setting"
					else:
						resp.message = "'value' not found, and required for creating or editing a setting."
				except:
					resp.message = "'value' not found, and required for creating or editing a setting."
			elif ( method == "DELETE" ):
				theSetting = dataobjects.Setting( name )
				theSetting.user = usrid
				theSetting = dao.getsetting( theSetting )

				dao.deletesetting( theSetting )

				resp.message = "ok"
			else:
				resp.message = "HTTP Method not supported."
		else:
			resp.message = "%d is not a valid user, or the authorization is incorrect." % usrid
	else:
		resp.message = "Not enough path to go on."

if ( os.environ.has_key("PATH_INFO") ):
	pathinfo = os.environ["PATH_INFO"].split("/")
	pathinfo.reverse()
	pathinfo.pop() # ''

	op = pathinfo.pop()
	if ( op == "login" ):
		if ( form.has_key( "user" ) and form.has_key( "password" ) ):
			theUser = dataobjects.User( form["user"].value, util.encrypt( form["password"].value ) )

			num = dao.loginuser( theUser );

			if ( num != None ):
				theUser.ident = num[0]
				resp.message = 'ok'
				resp.item = theUser
				resp.item.uri = util.autolink() + '/%d' % theUser.ident
			else:
				resp.message = 'Invalid login'
		else:
			resp.message = "No user or password specified."
	elif ( op == "register" ):
		if ( method == "POST" ):
			try:
				if ( form.has_key( "user" ) and form.has_key( "password" ) and form.has_key( "email" ) ):
					theUser = dataobjects.User( form["user"].value, util.encrypt( form["password"].value ) )
					theUser.email = form["email"].value

					# todo: validate input of input strings

					num = dao.loginuser( theUser )

					if ( num == None ):
						dao.adduser( theUser )
						resp.message = "ok"
						resp.item = theUser
						resp.item.uri = util.autolink() + "/%d" % theUser.ident
					else:
						resp.message = "A user with that name already exists."
				else:
					resp.message = "Incomplete user data.  'user', 'password', and 'email' required."
			except Exception, ex:
				resp.message = "Incomplete user data.  'user', 'password', and 'email' required."				
		else:
			resp.message = "Nothing to do."
	else:
		usrid = 0
		try:
			usrid = int(op)
		except ValueError:
			pass

		if ( usrid > 0 ):
			if ( len(pathinfo) > 0 ): # op on the user's items
				userop = pathinfo.pop()

				if ( userop == "setting" ): # do some setting stuff
					usersetting( resp, usrid, pathinfo, form )
				elif ( userop == "tour" ): # do some tour stuff
					usertour( resp, usrid, pathinfo )
				else:
					resp.message = "'%s' is an unknown operation." % userop
			else: # op on the user id
				if ( method == "DELETE" ): # delete
					theUser = dao.getuser( usrid, util.authsecret() )
					if ( theUser != None ):
						dao.deleteuser( usrid )

						resp.message = "ok"
					else:
						resp.message = "User secret is invalid."
				elif ( method == "POST" ):
					try:
						if ( form.has_key("user") and form.has_key("password") and form.has_key("email") ):
							theUser = dataobjects.User( form["user"].value, util.encrypt( form["password"].value ), usrid, form["email"].value )

							if ( theUser.secret() == util.authsecret() ):
								dao.updateuser( theUser )
								resp.message = "ok"
								resp.item = theUser
								resp.item.uri = util.autolink() + "/%d" % theUser.ident
							else:
								resp.message = "Update secrets don't match."
						else:
							resp.message = "Incomplete user data. 'user', 'password', 'email', and 'secret' required."
					except Exception, ex:
						sys.stderr.write( "Exception: '%s'" % ex )
						resp.message = "Incomplete user data. 'user', 'password', 'email', and 'secret' required."
				else: #get user
					theUser = dao.getuser( usrid, util.authsecret() )

					if ( theUser != None ):
						resp.message = "ok"
						resp.item = theUser
						resp.item.uri = util.autolink() + "/%d" % usrid
					else:
						resp.message = "Invalid user or secret."
		else:
			resp.message = "Nothing to do. %s" % op
else:
	resp.message = "Nothing to do. No path info." 

print "Content-Type: application/json\n\n"
print encoders.ResponseEncoder().encode( resp )
