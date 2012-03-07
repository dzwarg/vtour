#!/usr/bin/python

import psycopg2

import util

def select( qstring ):
	return query( qstring, "one" )

def getlist( qstring ):
	return query( qstring, "list" )

def insert( qstring ):
	return query( qstring, "insert" )

def update( qstring ):
	return query( qstring, "update" )

def query( qstring, rtype ):
	ret = None
	conn = psycopg2.connect("dbname='vtour' user='vtourUser' host='localhost' password='lofjrli!!'")
	cur = conn.cursor()
	cur.execute( qstring )

	if ( rtype == "one" ):
		ret = cur.fetchone()
	elif ( rtype == "list" ):
		ret = cur.fetchall()

	if ( rtype == "insert" or rtype == "update" ):
		conn.commit();
	
	cur.close()
	conn.close()

	if ( ret != None ):
		return ret
