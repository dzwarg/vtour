#!/usr/bin/python

import cgi
import cgitb; cgitb.enable()

import simplejson

from vtour import db, util, dataobjects, dao, encoders

form = cgi.FieldStorage()

resp = encoders.Response()

if (form.has_key("op")):
	op = form["op"].value
	if ( op == "getnamed" ):
		if ( form.has_key( "user" ) and form.has_key( "secret" ) and form.has_key( "name" ) ):
			usr = int(form["user"].value)
			secret = form["secret"].value

			theUser = dao.getuser( usr, secret )
			if ( theUser != None ):
				theTour = dataobjects.Tour( form["name"].value )
				theTour.user = theUser.ident

				item = dao.gettourbyname( theTour )

				resp.message = "ok"
				resp.item = item
			else:
				resp.message = "%d is not a valid user, or the secret is incorrect." % usr
		else:
			resp.message = "To get a tour by name, use the 'user', 'secret', and 'name' parameters."
	elif ( op == "getowned" ):
		if ( form.has_key( "user" ) and form.has_key( "secret" ) ):
			usr = int(form["user"].value)
			secret = form["secret"].value

			theUser = dao.getuser( usr, secret )
			if ( theUser != None ):
				theTours = dao.gettoursbyuser( usr )

				resp.message = "ok"
				resp.item = theTours
			else:
				resp.message = "%d is not a valid user, or the secret is incorrect." % usr
		else:
			resp.message = "To get a tour by owner, use the 'user' and 'secret' parameters."
	else:
		resp.message = "'%s' is not a supported operation." % op
else:
	resp.message = "No operation specified."

enc = encoders.ListResponseEncoder()
enc.setlistkey('tours')

print "Content-Type: text/plain\n\n"
print enc.encode( resp )
