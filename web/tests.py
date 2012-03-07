#!/usr/bin/python

import re

emailre = re.compile('^[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$', re.I)
sqlre = re.compile("'")

def validEmail( string ):
	matches = emailre.match( string )
	return ( matches != None )

def escapeSqlInput( string ):
	sub = sqlre.sub( "''", string );
	return sub;

# test emails:
emails = [ "a@b.c", "test@test.test", "@test.test", "nothing", "ard_what.who@dod.cob.blob.bob" ]

for email in emails:
	print email, validEmail( email )

# test sql:
sqls = [ "bob's cat", "insert 'bob's cat'", "what's; delete *;", "drop yo momma" ]

for sql in sqls:
	print sql, escapeSqlInput( sql )
