#!/usr/bin/python

import cgi
import cgitb; cgitb.enable()

import simplejson

from vtour import db, util, dataobjects, dao, encoders

form = cgi.FieldStorage()

resp = encoders.Response()

if (form.has_key("op")):
	op = form["op"].value
	if ( op == "get" ):
		if ( form.has_key( "user" ) and form.has_key( "name" ) and form.has_key( "secret" ) ):
			theUser = dao.getuser( int(form["user"].value) )
			theSetting = dataobjects.Setting( form["name"].value )
			theSetting.user = theUser.ident
			secret = form["secret"].value

			if ( theUser.secret() == secret ):
				item = dao.getsetting( theSetting )

				if ( item != None ):
					resp.message = "ok"
					resp.item = item
				else:
					resp.message = "No setting by that name is saved."
			else:
				resp.message = "Secrets do not match."
		else:
			resp.message = "Get operations require a 'user', 'name', and 'secret' parameter"
	elif ( op == "update" ):
		if ( form.has_key( "user" ) and form.has_key( "name" ) and form.has_key( "value" ) and form.has_key( "secret" ) ):
			theUser = dao.getuser( int(form["user"].value) )
			theSetting = dataobjects.Setting( form["name"].value, form["value"].value )
			theSetting.user = theUser.ident
			secret = form["secret"].value

			if ( theUser.secret() == secret ):
				item = dao.getsetting( theSetting );
				
				if ( item == None ):
					dao.savesetting( theSetting );
					resp.message = "ok"
				else:
					dao.updatesetting( theSetting );
					resp.message = "ok"
			else:
				resp.message = "Update secrets don't match."
		else:
			resp.message = "Update requires a 'user', 'name', 'value', and 'secret' parameter."
	else:
		resp.message = "'%s' is not a supported operation." % op
else:
	resp.message = "No operation specified."

print "Content-Type: text/plain\n\n"
print encoders.SettingResponseEncoder().encode( resp )
