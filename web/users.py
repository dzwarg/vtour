#!/usr/bin/python

import cgi
import cgitb; cgitb.enable()

import simplejson

from vtour import db, util, dataobjects, dao, encoders

form = cgi.FieldStorage()

resp = encoders.Response()

if (form.has_key("op")):
	op = form["op"].value
	if ( op == "login" ):
		if ( form.has_key( "user" ) and form.has_key( "password" ) ):
			theUser = dataobjects.User( form["user"].value, util.encrypt( form["password"].value ) )

			num = dao.loginuser( theUser );

			if ( num == None ):
				resp.message = 'Invalid login'
			else:
				theUser.ident = num[0]
				resp.message = 'ok'
				resp.item = theUser

		else:
			resp.message = "No user and password specified."

	elif ( op == "register" or op == "update" ):
		if ( form.has_key( "user" ) and form.has_key( "password" ) and form.has_key( "email" ) ):
			theUser = dataobjects.User( form["user"].value, util.encrypt( form["password"].value ) )
			theUser.email = form["email"].value

			# todo: validate input of input strings

			if ( op == "register" ):
				num = dao.loginuser( theUser )
				
				if ( num == 0 ):
					dao.adduser( theUser )
					resp.message = "ok"
					resp.item = theUser
				else:
					resp.message = "A user with that name already exists."
			else:
				if ( form.has_key( "id" ) and form.has_key( "secret" ) ):
					theUser.ident = int(form["id"].value)
					secret = form["secret"].value

					if ( theUser.secret() == secret ):
						dao.updateuser( theUser )
						resp.message = "ok"
						resp.item = theUser
					else:
						resp.message = "Update secrets don't match."
				else:
					resp.message = "Update requires an 'id' and 'secret' parameter."

		else:
			resp.message = "Registration/update requires a 'user', 'password', and 'email' parameter."
	elif ( op == "get" ):
		if ( form.has_key( "user" ) and form.has_key( "secret" ) ):
			usr = form["user"].value
			secret = form["secret"].value

			theUser = dao.getuser( usr, secret )
			if ( theUser != None ):
				resp.message = "ok"
				resp.item = theUser
			else:
				resp.message = "'%s' is not a valid user." % usr
	else:
		resp.message = "'%s' is not a supported operation." % op
else:
	resp.message = "No operation specified."

print "Content-Type: text/plain\n\n"
print encoders.UserResponseEncoder().encode( resp )
