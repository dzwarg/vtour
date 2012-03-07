#!/usr/bin/python

import cgi
import cgitb; cgitb.enable()

import simplejson

from vtour import db, util, dataobjects, dao, encoders

form = cgi.FieldStorage()

resp = encoders.Response()

if (form.has_key("op")):
	op = form["op"].value
	if ( op == "getsearched" ):
		if ( form.has_key( "user" ) and form.has_key( "secret" ) and form.has_key( "search" ) ):
			usr = int(form["user"].value)
			secret = form["secret"].value

			theUser = dao.getuser( usr, secret )
			if ( theUser != None ):
				search = int(form["search"].value)
				theResults = dao.getresultsbysearch( usr, search )

				resp.message = "ok"
				resp.item = theResults
			else:
				resp.message = "%d is not a valid user, or the secret is incorrect." % usr
		else:
			resp.message = "To get results by search, use the 'user', 'secret', and 'search' parameters."
	else:
		resp.message = "'%s' is not a supported operation." % op
else:
	resp.message = "No operation specified."

enc = encoders.ListResponseEncoder()
enc.setlistkey('results')

print "Content-Type: text/plain\n\n"
print enc.encode( resp )
