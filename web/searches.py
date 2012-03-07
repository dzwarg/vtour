#!/usr/bin/python

import cgi
import cgitb; cgitb.enable()

import simplejson

from vtour import db, util, dataobjects, dao, encoders

form = cgi.FieldStorage()

resp = encoders.Response()

if (form.has_key("op")):
	op = form["op"].value
	if ( op == "getintour" ):
		if ( form.has_key( "user" ) and form.has_key( "secret" ) and form.has_key( "tour" ) ):
			usr = int(form["user"].value)
			secret = form["secret"].value

			theUser = dao.getuser( usr, secret )
			if ( theUser != None ):
				tour = int(form["tour"].value)
				theSearches = dao.getsearchesintour( usr, tour )

				resp.message = "ok"
				resp.item = theSearches
			else:
				resp.message = "%d is not a valid user, or the secret is incorrect." % usr
		else:
			resp.message = "To get searches by tour, use the 'user', 'secret', and 'tour' parameters."
	else:
		resp.message = "'%s' is not a supported operation." % op
else:
	resp.message = "No operation specified."

enc = encoders.ListResponseEncoder()
enc.setlistkey('searches')

print "Content-Type: text/plain\n\n"
print enc.encode( resp )
