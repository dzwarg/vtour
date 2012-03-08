--
-- PostgreSQL database dump
--

-- Started on 2008-06-02 23:37:20 EDT

SET client_encoding = 'UTF8';
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 2307 (class 1262 OID 21266)
-- Name: vtour; Type: DATABASE; Schema: -; Owner: vtourUser
--

CREATE DATABASE vtour WITH TEMPLATE = template0 ENCODING = 'UTF8';


ALTER DATABASE vtour OWNER TO "vtourUser";

\connect vtour

SET client_encoding = 'UTF8';
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 2308 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'Standard public schema';


--
-- TOC entry 947 (class 2612 OID 21269)
-- Name: plpgsql; Type: PROCEDURAL LANGUAGE; Schema: -; Owner: 
--

CREATE PROCEDURAL LANGUAGE plpgsql;


SET search_path = public, pg_catalog;

--
-- TOC entry 80 (class 1255 OID 21344)
-- Dependencies: 4
-- Name: st_box2d_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_box2d_in(cstring) RETURNS box2d
    AS '$libdir/liblwgeom.so.1.3', 'BOX2DFLOAT4_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_box2d_in(cstring) OWNER TO postgres;

--
-- TOC entry 82 (class 1255 OID 21346)
-- Dependencies: 4 80
-- Name: st_box2d_out(box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_box2d_out(box2d) RETURNS cstring
    AS '$libdir/liblwgeom.so.1.3', 'BOX2DFLOAT4_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_box2d_out(box2d) OWNER TO postgres;

--
-- TOC entry 925 (class 1247 OID 21342)
-- Dependencies: 80 82 4 80 82
-- Name: box2d; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE box2d (
    INTERNALLENGTH = 16,
    INPUT = st_box2d_in,
    OUTPUT = st_box2d_out,
    ALIGNMENT = int4,
    STORAGE = plain
);


ALTER TYPE public.box2d OWNER TO postgres;

--
-- TOC entry 61 (class 1255 OID 21321)
-- Dependencies: 4
-- Name: st_box3d_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_box3d_in(cstring) RETURNS box3d
    AS '$libdir/liblwgeom.so.1.3', 'BOX3D_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_box3d_in(cstring) OWNER TO postgres;

--
-- TOC entry 62 (class 1255 OID 21322)
-- Dependencies: 4 61
-- Name: st_box3d_out(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_box3d_out(box3d) RETURNS cstring
    AS '$libdir/liblwgeom.so.1.3', 'BOX3D_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_box3d_out(box3d) OWNER TO postgres;

--
-- TOC entry 921 (class 1247 OID 21318)
-- Dependencies: 61 62 4 61 62
-- Name: box3d; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE box3d (
    INTERNALLENGTH = 48,
    INPUT = st_box3d_in,
    OUTPUT = st_box3d_out,
    ALIGNMENT = double,
    STORAGE = plain
);


ALTER TYPE public.box3d OWNER TO postgres;

--
-- TOC entry 76 (class 1255 OID 21338)
-- Dependencies: 4
-- Name: st_chip_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_chip_in(cstring) RETURNS chip
    AS '$libdir/liblwgeom.so.1.3', 'CHIP_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_chip_in(cstring) OWNER TO postgres;

--
-- TOC entry 78 (class 1255 OID 21340)
-- Dependencies: 4 76
-- Name: st_chip_out(chip); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_chip_out(chip) RETURNS cstring
    AS '$libdir/liblwgeom.so.1.3', 'CHIP_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_chip_out(chip) OWNER TO postgres;

--
-- TOC entry 923 (class 1247 OID 21336)
-- Dependencies: 76 78 4 76 78
-- Name: chip; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE chip (
    INTERNALLENGTH = variable,
    INPUT = st_chip_in,
    OUTPUT = st_chip_out,
    ALIGNMENT = double,
    STORAGE = extended
);


ALTER TYPE public.chip OWNER TO postgres;

--
-- TOC entry 24 (class 1255 OID 21288)
-- Dependencies: 4
-- Name: st_geometry_analyze(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometry_analyze(internal) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_analyze'
    LANGUAGE c STRICT;


ALTER FUNCTION public.st_geometry_analyze(internal) OWNER TO postgres;

--
-- TOC entry 20 (class 1255 OID 21284)
-- Dependencies: 4
-- Name: st_geometry_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometry_in(cstring) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geometry_in(cstring) OWNER TO postgres;

--
-- TOC entry 22 (class 1255 OID 21286)
-- Dependencies: 4 20
-- Name: st_geometry_out(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometry_out(geometry) RETURNS cstring
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geometry_out(geometry) OWNER TO postgres;

--
-- TOC entry 26 (class 1255 OID 21290)
-- Dependencies: 4 20
-- Name: st_geometry_recv(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometry_recv(internal) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_recv'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geometry_recv(internal) OWNER TO postgres;

--
-- TOC entry 28 (class 1255 OID 21292)
-- Dependencies: 4 20
-- Name: st_geometry_send(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometry_send(geometry) RETURNS bytea
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_send'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geometry_send(geometry) OWNER TO postgres;

--
-- TOC entry 919 (class 1247 OID 21282)
-- Dependencies: 20 22 4 20 22 26 28 24
-- Name: geometry; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE geometry (
    INTERNALLENGTH = variable,
    INPUT = st_geometry_in,
    OUTPUT = st_geometry_out,
    RECEIVE = st_geometry_recv,
    SEND = st_geometry_send,
    ANALYZE = st_geometry_analyze,
    DELIMITER = ':',
    ALIGNMENT = int4,
    STORAGE = main
);


ALTER TYPE public.geometry OWNER TO postgres;

--
-- TOC entry 12 (class 1255 OID 21272)
-- Dependencies: 4
-- Name: st_histogram2d_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_histogram2d_in(cstring) RETURNS histogram2d
    AS '$libdir/liblwgeom.so.1.3', 'lwhistogram2d_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_histogram2d_in(cstring) OWNER TO postgres;

--
-- TOC entry 14 (class 1255 OID 21274)
-- Dependencies: 4 12
-- Name: st_histogram2d_out(histogram2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_histogram2d_out(histogram2d) RETURNS cstring
    AS '$libdir/liblwgeom.so.1.3', 'lwhistogram2d_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_histogram2d_out(histogram2d) OWNER TO postgres;

--
-- TOC entry 878 (class 1247 OID 21270)
-- Dependencies: 12 14 4 12 14
-- Name: histogram2d; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE histogram2d (
    INTERNALLENGTH = variable,
    INPUT = st_histogram2d_in,
    OUTPUT = st_histogram2d_out,
    ALIGNMENT = double,
    STORAGE = main
);


ALTER TYPE public.histogram2d OWNER TO postgres;

--
-- TOC entry 16 (class 1255 OID 21278)
-- Dependencies: 4
-- Name: st_spheroid_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_spheroid_in(cstring) RETURNS spheroid
    AS '$libdir/liblwgeom.so.1.3', 'ellipsoid_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_spheroid_in(cstring) OWNER TO postgres;

--
-- TOC entry 18 (class 1255 OID 21280)
-- Dependencies: 4 16
-- Name: st_spheroid_out(spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_spheroid_out(spheroid) RETURNS cstring
    AS '$libdir/liblwgeom.so.1.3', 'ellipsoid_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_spheroid_out(spheroid) OWNER TO postgres;

--
-- TOC entry 917 (class 1247 OID 21276)
-- Dependencies: 16 18 4 16 18
-- Name: spheroid; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE spheroid (
    INTERNALLENGTH = 65,
    INPUT = st_spheroid_in,
    OUTPUT = st_spheroid_out,
    ALIGNMENT = double,
    STORAGE = plain
);


ALTER TYPE public.spheroid OWNER TO postgres;

--
-- TOC entry 927 (class 1247 OID 21599)
-- Dependencies: 1918
-- Name: geometry_dump; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE geometry_dump AS (
	path integer[],
	geom geometry
);


ALTER TYPE public.geometry_dump OWNER TO postgres;

--
-- TOC entry 454 (class 1255 OID 21785)
-- Dependencies: 4 919 919
-- Name: _st_contains(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_contains(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'contains'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._st_contains(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 456 (class 1255 OID 21787)
-- Dependencies: 4 919 919
-- Name: _st_coveredby(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_coveredby(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'coveredby'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._st_coveredby(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 458 (class 1255 OID 21789)
-- Dependencies: 4 919 919
-- Name: _st_covers(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_covers(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'covers'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._st_covers(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 448 (class 1255 OID 21779)
-- Dependencies: 4 919 919
-- Name: _st_crosses(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_crosses(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'crosses'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._st_crosses(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 445 (class 1255 OID 21776)
-- Dependencies: 4 919 919
-- Name: _st_intersects(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_intersects(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'intersects'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._st_intersects(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 461 (class 1255 OID 21792)
-- Dependencies: 4 919 919
-- Name: _st_overlaps(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_overlaps(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'overlaps'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._st_overlaps(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 441 (class 1255 OID 21772)
-- Dependencies: 4 919 919
-- Name: _st_touches(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_touches(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'touches'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._st_touches(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 451 (class 1255 OID 21782)
-- Dependencies: 4 919 919
-- Name: _st_within(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION _st_within(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'within'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public._st_within(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 660 (class 1255 OID 21992)
-- Dependencies: 4 947
-- Name: addauth(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION addauth(text) RETURNS boolean
    AS $_$
DECLARE
	lockid alias for $1;
	okay boolean;
	myrec record;
BEGIN
	-- check to see if table exists
	--  if not, CREATE TEMP TABLE mylock (transid xid, lockcode text)
	okay := 'f';
	FOR myrec IN SELECT * FROM pg_class WHERE relname = 'temp_lock_have_table' LOOP
		okay := 't';
	END LOOP; 
	IF (okay <> 't') THEN 
		CREATE TEMP TABLE temp_lock_have_table (transid xid, lockcode text);
			-- this will only work from pgsql7.4 up
			-- ON COMMIT DELETE ROWS;
	END IF;

	--  INSERT INTO mylock VALUES ( $1)
--	EXECUTE 'INSERT INTO temp_lock_have_table VALUES ( '||
--		quote_literal(getTransactionID()) || ',' ||
--		quote_literal(lockid) ||')';

	INSERT INTO temp_lock_have_table VALUES (getTransactionID(), lockid);

	RETURN true::boolean;
END;
$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.addauth(text) OWNER TO postgres;

--
-- TOC entry 148 (class 1255 OID 21432)
-- Dependencies: 4 919 919
-- Name: addbbox(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION addbbox(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_addBBOX'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.addbbox(geometry) OWNER TO postgres;

--
-- TOC entry 333 (class 1255 OID 21647)
-- Dependencies: 4 947
-- Name: addgeometrycolumn(character varying, character varying, character varying, character varying, integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION addgeometrycolumn(character varying, character varying, character varying, character varying, integer, character varying, integer) RETURNS text
    AS $_$
DECLARE
	catalog_name alias for $1;
	schema_name alias for $2;
	table_name alias for $3;
	column_name alias for $4;
	new_srid alias for $5;
	new_type alias for $6;
	new_dim alias for $7;
	rec RECORD;
	schema_ok bool;
	real_schema name;

BEGIN

	IF ( not ( (new_type ='GEOMETRY') or
		   (new_type ='GEOMETRYCOLLECTION') or
		   (new_type ='POINT') or 
		   (new_type ='MULTIPOINT') or
		   (new_type ='POLYGON') or
		   (new_type ='MULTIPOLYGON') or
		   (new_type ='LINESTRING') or
		   (new_type ='MULTILINESTRING') or
		   (new_type ='GEOMETRYCOLLECTIONM') or
		   (new_type ='POINTM') or 
		   (new_type ='MULTIPOINTM') or
		   (new_type ='POLYGONM') or
		   (new_type ='MULTIPOLYGONM') or
		   (new_type ='LINESTRINGM') or
		   (new_type ='MULTILINESTRINGM') or
                   (new_type = 'CIRCULARSTRING') or
                   (new_type = 'CIRCULARSTRINGM') or
                   (new_type = 'COMPOUNDCURVE') or
                   (new_type = 'COMPOUNDCURVEM') or
                   (new_type = 'CURVEPOLYGON') or
                   (new_type = 'CURVEPOLYGONM') or
                   (new_type = 'MULTICURVE') or
                   (new_type = 'MULTICURVEM') or
                   (new_type = 'MULTISURFACE') or
                   (new_type = 'MULTISURFACEM')) )
	THEN
		RAISE EXCEPTION 'Invalid type name - valid ones are: 
			GEOMETRY, GEOMETRYCOLLECTION, POINT, 
			MULTIPOINT, POLYGON, MULTIPOLYGON, 
			LINESTRING, MULTILINESTRING,
                        CIRCULARSTRING, COMPOUNDCURVE,
                        CURVEPOLYGON, MULTICURVE, MULTISURFACE,
			GEOMETRYCOLLECTIONM, POINTM, 
			MULTIPOINTM, POLYGONM, MULTIPOLYGONM, 
			LINESTRINGM, MULTILINESTRINGM 
                        CIRCULARSTRINGM, COMPOUNDCURVEM,
                        CURVEPOLYGONM, MULTICURVEM or MULTISURFACEM';
		return 'fail';
	END IF;

	IF ( (new_dim >4) or (new_dim <0) ) THEN
		RAISE EXCEPTION 'invalid dimension';
		return 'fail';
	END IF;

	IF ( (new_type LIKE '%M') and (new_dim!=3) ) THEN

		RAISE EXCEPTION 'TypeM needs 3 dimensions';
		return 'fail';
	END IF;

	IF ( schema_name != '' ) THEN
		schema_ok = 'f';
		FOR rec IN SELECT nspname FROM pg_namespace WHERE text(nspname) = schema_name LOOP
			schema_ok := 't';
		END LOOP;

		if ( schema_ok <> 't' ) THEN
			RAISE NOTICE 'Invalid schema name - using current_schema()';
			SELECT current_schema() into real_schema;
		ELSE
			real_schema = schema_name;
		END IF;

	ELSE
		SELECT current_schema() into real_schema;
	END IF;


	-- Add geometry column

	EXECUTE 'ALTER TABLE ' ||
		quote_ident(real_schema) || '.' || quote_ident(table_name)
		|| ' ADD COLUMN ' || quote_ident(column_name) || 
		' geometry ';


	-- Delete stale record in geometry_column (if any)

	EXECUTE 'DELETE FROM geometry_columns WHERE
		f_table_catalog = ' || quote_literal('') || 
		' AND f_table_schema = ' ||
		quote_literal(real_schema) || 
		' AND f_table_name = ' || quote_literal(table_name) ||
		' AND f_geometry_column = ' || quote_literal(column_name);


	-- Add record in geometry_column 

	EXECUTE 'INSERT INTO geometry_columns VALUES (' ||
		quote_literal('') || ',' ||
		quote_literal(real_schema) || ',' ||
		quote_literal(table_name) || ',' ||
		quote_literal(column_name) || ',' ||
		new_dim::text || ',' || new_srid::text || ',' ||
		quote_literal(new_type) || ')';

	-- Add table checks

	EXECUTE 'ALTER TABLE ' || 
		quote_ident(real_schema) || '.' || quote_ident(table_name)
		|| ' ADD CONSTRAINT ' 
		|| quote_ident('enforce_srid_' || column_name)
		|| ' CHECK (SRID(' || quote_ident(column_name) ||
		') = ' || new_srid::text || ')' ;

	EXECUTE 'ALTER TABLE ' || 
		quote_ident(real_schema) || '.' || quote_ident(table_name)
		|| ' ADD CONSTRAINT '
		|| quote_ident('enforce_dims_' || column_name)
		|| ' CHECK (ndims(' || quote_ident(column_name) ||
		') = ' || new_dim::text || ')' ;

	IF (not(new_type = 'GEOMETRY')) THEN
		EXECUTE 'ALTER TABLE ' || 
		quote_ident(real_schema) || '.' || quote_ident(table_name)
		|| ' ADD CONSTRAINT '
		|| quote_ident('enforce_geotype_' || column_name)
		|| ' CHECK (geometrytype(' ||
		quote_ident(column_name) || ')=' ||
		quote_literal(new_type) || ' OR (' ||
		quote_ident(column_name) || ') is null)';
	END IF;

	return 
		real_schema || '.' || 
		table_name || '.' || column_name ||
		' SRID:' || new_srid::text ||
		' TYPE:' || new_type || 
		' DIMS:' || new_dim::text || chr(10) || ' '; 
END;
$_$
    LANGUAGE plpgsql STRICT;


ALTER FUNCTION public.addgeometrycolumn(character varying, character varying, character varying, character varying, integer, character varying, integer) OWNER TO postgres;

--
-- TOC entry 334 (class 1255 OID 21648)
-- Dependencies: 4 947
-- Name: addgeometrycolumn(character varying, character varying, character varying, integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION addgeometrycolumn(character varying, character varying, character varying, integer, character varying, integer) RETURNS text
    AS $_$
DECLARE
	ret  text;
BEGIN
	SELECT AddGeometryColumn('',$1,$2,$3,$4,$5,$6) into ret;
	RETURN ret;
END;
$_$
    LANGUAGE plpgsql STABLE STRICT;


ALTER FUNCTION public.addgeometrycolumn(character varying, character varying, character varying, integer, character varying, integer) OWNER TO postgres;

--
-- TOC entry 335 (class 1255 OID 21649)
-- Dependencies: 4 947
-- Name: addgeometrycolumn(character varying, character varying, integer, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION addgeometrycolumn(character varying, character varying, integer, character varying, integer) RETURNS text
    AS $_$
DECLARE
	ret  text;
BEGIN
	SELECT AddGeometryColumn('','',$1,$2,$3,$4,$5) into ret;
	RETURN ret;
END;
$_$
    LANGUAGE plpgsql STRICT;


ALTER FUNCTION public.addgeometrycolumn(character varying, character varying, integer, character varying, integer) OWNER TO postgres;

--
-- TOC entry 286 (class 1255 OID 21576)
-- Dependencies: 4 919 919 919
-- Name: addpoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION addpoint(geometry, geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_addpoint'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.addpoint(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 288 (class 1255 OID 21578)
-- Dependencies: 4 919 919 919
-- Name: addpoint(geometry, geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION addpoint(geometry, geometry, integer) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_addpoint'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.addpoint(geometry, geometry, integer) OWNER TO postgres;

--
-- TOC entry 29 (class 1255 OID 21294)
-- Dependencies: 4 919 919
-- Name: affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_affine'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 37 (class 1255 OID 21296)
-- Dependencies: 4 919 919
-- Name: affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS geometry
    AS $_$SELECT affine($1,  $2, $3, 0,  $4, $5, 0,  0, 0, 1,  $6, $7, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 197 (class 1255 OID 21481)
-- Dependencies: 4 919
-- Name: area(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION area(geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_area_polygon'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.area(geometry) OWNER TO postgres;

--
-- TOC entry 195 (class 1255 OID 21479)
-- Dependencies: 4 919
-- Name: area2d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION area2d(geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_area_polygon'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.area2d(geometry) OWNER TO postgres;

--
-- TOC entry 541 (class 1255 OID 21873)
-- Dependencies: 4 919
-- Name: asbinary(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION asbinary(geometry) RETURNS bytea
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_asBinary'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.asbinary(geometry) OWNER TO postgres;

--
-- TOC entry 543 (class 1255 OID 21875)
-- Dependencies: 4 919
-- Name: asbinary(geometry, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION asbinary(geometry, text) RETURNS bytea
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_asBinary'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.asbinary(geometry, text) OWNER TO postgres;

--
-- TOC entry 255 (class 1255 OID 21545)
-- Dependencies: 4 919
-- Name: asewkb(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION asewkb(geometry) RETURNS bytea
    AS '$libdir/liblwgeom.so.1.3', 'WKBFromLWGEOM'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.asewkb(geometry) OWNER TO postgres;

--
-- TOC entry 261 (class 1255 OID 21551)
-- Dependencies: 4 919
-- Name: asewkb(geometry, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION asewkb(geometry, text) RETURNS bytea
    AS '$libdir/liblwgeom.so.1.3', 'WKBFromLWGEOM'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.asewkb(geometry, text) OWNER TO postgres;

--
-- TOC entry 253 (class 1255 OID 21543)
-- Dependencies: 4 919
-- Name: asewkt(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION asewkt(geometry) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_asEWKT'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.asewkt(geometry) OWNER TO postgres;

--
-- TOC entry 483 (class 1255 OID 21814)
-- Dependencies: 4 919
-- Name: asgml(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION asgml(geometry, integer, integer) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_asGML'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.asgml(geometry, integer, integer) OWNER TO postgres;

--
-- TOC entry 485 (class 1255 OID 21816)
-- Dependencies: 4 919
-- Name: asgml(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION asgml(geometry, integer) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_asGML'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.asgml(geometry, integer) OWNER TO postgres;

--
-- TOC entry 487 (class 1255 OID 21818)
-- Dependencies: 4 919
-- Name: asgml(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION asgml(geometry) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_asGML'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.asgml(geometry) OWNER TO postgres;

--
-- TOC entry 257 (class 1255 OID 21547)
-- Dependencies: 4 919
-- Name: ashexewkb(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ashexewkb(geometry) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_asHEXEWKB'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ashexewkb(geometry) OWNER TO postgres;

--
-- TOC entry 259 (class 1255 OID 21549)
-- Dependencies: 4 919
-- Name: ashexewkb(geometry, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ashexewkb(geometry, text) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_asHEXEWKB'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ashexewkb(geometry, text) OWNER TO postgres;

--
-- TOC entry 495 (class 1255 OID 21826)
-- Dependencies: 4 919
-- Name: askml(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION askml(geometry, integer, integer) RETURNS text
    AS $_$SELECT AsUKML(transform($1,4326),$2,$3)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.askml(geometry, integer, integer) OWNER TO postgres;

--
-- TOC entry 497 (class 1255 OID 21828)
-- Dependencies: 4 919
-- Name: askml(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION askml(geometry, integer) RETURNS text
    AS $_$SELECT AsUKML(transform($1,4326),$2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.askml(geometry, integer) OWNER TO postgres;

--
-- TOC entry 499 (class 1255 OID 21830)
-- Dependencies: 4 919
-- Name: askml(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION askml(geometry) RETURNS text
    AS $_$SELECT AsUKML(transform($1,4326))$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.askml(geometry) OWNER TO postgres;

--
-- TOC entry 477 (class 1255 OID 21808)
-- Dependencies: 4 919
-- Name: assvg(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION assvg(geometry, integer, integer) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'assvg_geometry'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.assvg(geometry, integer, integer) OWNER TO postgres;

--
-- TOC entry 479 (class 1255 OID 21810)
-- Dependencies: 4 919
-- Name: assvg(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION assvg(geometry, integer) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'assvg_geometry'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.assvg(geometry, integer) OWNER TO postgres;

--
-- TOC entry 481 (class 1255 OID 21812)
-- Dependencies: 4 919
-- Name: assvg(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION assvg(geometry) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'assvg_geometry'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.assvg(geometry) OWNER TO postgres;

--
-- TOC entry 545 (class 1255 OID 21877)
-- Dependencies: 4 919
-- Name: astext(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION astext(geometry) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_asText'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.astext(geometry) OWNER TO postgres;

--
-- TOC entry 489 (class 1255 OID 21820)
-- Dependencies: 4 919
-- Name: asukml(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION asukml(geometry, integer, integer) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_asKML'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.asukml(geometry, integer, integer) OWNER TO postgres;

--
-- TOC entry 491 (class 1255 OID 21822)
-- Dependencies: 4 919
-- Name: asukml(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION asukml(geometry, integer) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_asKML'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.asukml(geometry, integer) OWNER TO postgres;

--
-- TOC entry 493 (class 1255 OID 21824)
-- Dependencies: 4 919
-- Name: asukml(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION asukml(geometry) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_asKML'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.asukml(geometry) OWNER TO postgres;

--
-- TOC entry 209 (class 1255 OID 21493)
-- Dependencies: 4 919 919
-- Name: azimuth(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION azimuth(geometry, geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_azimuth'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.azimuth(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 653 (class 1255 OID 21985)
-- Dependencies: 4 947 919
-- Name: bdmpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION bdmpolyfromtext(text, integer) RETURNS geometry
    AS $_$
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline geometry;
	geom geometry;
BEGIN
	mline := MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := multi(BuildArea(mline));

	RETURN geom;
END;
$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


ALTER FUNCTION public.bdmpolyfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 651 (class 1255 OID 21983)
-- Dependencies: 4 947 919
-- Name: bdpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION bdpolyfromtext(text, integer) RETURNS geometry
    AS $_$
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline geometry;
	geom geometry;
BEGIN
	mline := MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := BuildArea(mline);

	IF GeometryType(geom) != 'POLYGON'
	THEN
		RAISE EXCEPTION 'Input returns more then a single polygon, try using BdMPolyFromText instead';
	END IF;

	RETURN geom;
END;
$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


ALTER FUNCTION public.bdpolyfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 424 (class 1255 OID 21751)
-- Dependencies: 4 919 919
-- Name: boundary(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION boundary(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'boundary'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.boundary(geometry) OWNER TO postgres;

--
-- TOC entry 367 (class 1255 OID 21681)
-- Dependencies: 4 919
-- Name: box(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box(geometry) RETURNS box
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_to_BOX'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.box(geometry) OWNER TO postgres;

--
-- TOC entry 373 (class 1255 OID 21687)
-- Dependencies: 4 921
-- Name: box(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box(box3d) RETURNS box
    AS '$libdir/liblwgeom.so.1.3', 'BOX3D_to_BOX'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.box(box3d) OWNER TO postgres;

--
-- TOC entry 363 (class 1255 OID 21677)
-- Dependencies: 4 925 919
-- Name: box2d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box2d(geometry) RETURNS box2d
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_to_BOX2DFLOAT4'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.box2d(geometry) OWNER TO postgres;

--
-- TOC entry 369 (class 1255 OID 21683)
-- Dependencies: 4 925 921
-- Name: box2d(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box2d(box3d) RETURNS box2d
    AS '$libdir/liblwgeom.so.1.3', 'BOX3D_to_BOX2DFLOAT4'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.box2d(box3d) OWNER TO postgres;

--
-- TOC entry 91 (class 1255 OID 21356)
-- Dependencies: 4 925 925
-- Name: box2d_contain(box2d, box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box2d_contain(box2d, box2d) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'BOX2D_contain'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.box2d_contain(box2d, box2d) OWNER TO postgres;

--
-- TOC entry 93 (class 1255 OID 21358)
-- Dependencies: 4 925 925
-- Name: box2d_contained(box2d, box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box2d_contained(box2d, box2d) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'BOX2D_contained'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.box2d_contained(box2d, box2d) OWNER TO postgres;

--
-- TOC entry 79 (class 1255 OID 21343)
-- Dependencies: 4 925
-- Name: box2d_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box2d_in(cstring) RETURNS box2d
    AS '$libdir/liblwgeom.so.1.3', 'BOX2DFLOAT4_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.box2d_in(cstring) OWNER TO postgres;

--
-- TOC entry 99 (class 1255 OID 21364)
-- Dependencies: 4 925 925
-- Name: box2d_intersects(box2d, box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box2d_intersects(box2d, box2d) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'BOX2D_intersects'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.box2d_intersects(box2d, box2d) OWNER TO postgres;

--
-- TOC entry 87 (class 1255 OID 21352)
-- Dependencies: 4 925 925
-- Name: box2d_left(box2d, box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box2d_left(box2d, box2d) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'BOX2D_left'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.box2d_left(box2d, box2d) OWNER TO postgres;

--
-- TOC entry 81 (class 1255 OID 21345)
-- Dependencies: 4 925
-- Name: box2d_out(box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box2d_out(box2d) RETURNS cstring
    AS '$libdir/liblwgeom.so.1.3', 'BOX2DFLOAT4_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.box2d_out(box2d) OWNER TO postgres;

--
-- TOC entry 95 (class 1255 OID 21360)
-- Dependencies: 4 925 925
-- Name: box2d_overlap(box2d, box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box2d_overlap(box2d, box2d) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'BOX2D_overlap'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.box2d_overlap(box2d, box2d) OWNER TO postgres;

--
-- TOC entry 83 (class 1255 OID 21348)
-- Dependencies: 4 925 925
-- Name: box2d_overleft(box2d, box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box2d_overleft(box2d, box2d) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'BOX2D_overleft'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.box2d_overleft(box2d, box2d) OWNER TO postgres;

--
-- TOC entry 85 (class 1255 OID 21350)
-- Dependencies: 4 925 925
-- Name: box2d_overright(box2d, box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box2d_overright(box2d, box2d) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'BOX2D_overright'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.box2d_overright(box2d, box2d) OWNER TO postgres;

--
-- TOC entry 89 (class 1255 OID 21354)
-- Dependencies: 4 925 925
-- Name: box2d_right(box2d, box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box2d_right(box2d, box2d) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'BOX2D_right'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.box2d_right(box2d, box2d) OWNER TO postgres;

--
-- TOC entry 97 (class 1255 OID 21362)
-- Dependencies: 4 925 925
-- Name: box2d_same(box2d, box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box2d_same(box2d, box2d) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'BOX2D_same'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.box2d_same(box2d, box2d) OWNER TO postgres;

--
-- TOC entry 365 (class 1255 OID 21679)
-- Dependencies: 4 921 919
-- Name: box3d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box3d(geometry) RETURNS box3d
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_to_BOX3D'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.box3d(geometry) OWNER TO postgres;

--
-- TOC entry 371 (class 1255 OID 21685)
-- Dependencies: 4 921 925
-- Name: box3d(box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box3d(box2d) RETURNS box3d
    AS '$libdir/liblwgeom.so.1.3', 'BOX2DFLOAT4_to_BOX3D'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.box3d(box2d) OWNER TO postgres;

--
-- TOC entry 59 (class 1255 OID 21319)
-- Dependencies: 4 921
-- Name: box3d_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box3d_in(cstring) RETURNS box3d
    AS '$libdir/liblwgeom.so.1.3', 'BOX3D_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.box3d_in(cstring) OWNER TO postgres;

--
-- TOC entry 60 (class 1255 OID 21320)
-- Dependencies: 4 921
-- Name: box3d_out(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box3d_out(box3d) RETURNS cstring
    AS '$libdir/liblwgeom.so.1.3', 'BOX3D_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.box3d_out(box3d) OWNER TO postgres;

--
-- TOC entry 377 (class 1255 OID 21691)
-- Dependencies: 4 921
-- Name: box3dtobox(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION box3dtobox(box3d) RETURNS box
    AS $_$SELECT box($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.box3dtobox(box3d) OWNER TO postgres;

--
-- TOC entry 416 (class 1255 OID 21743)
-- Dependencies: 4 919 919
-- Name: buffer(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION buffer(geometry, double precision) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'buffer'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.buffer(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 418 (class 1255 OID 21745)
-- Dependencies: 4 919 919
-- Name: buffer(geometry, double precision, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION buffer(geometry, double precision, integer) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'buffer'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.buffer(geometry, double precision, integer) OWNER TO postgres;

--
-- TOC entry 314 (class 1255 OID 21614)
-- Dependencies: 4 878 878
-- Name: build_histogram2d(histogram2d, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION build_histogram2d(histogram2d, text, text) RETURNS histogram2d
    AS '$libdir/liblwgeom.so.1.3', 'build_lwhistogram2d'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.build_histogram2d(histogram2d, text, text) OWNER TO postgres;

--
-- TOC entry 316 (class 1255 OID 21616)
-- Dependencies: 4 947 878 878
-- Name: build_histogram2d(histogram2d, text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION build_histogram2d(histogram2d, text, text, text) RETURNS histogram2d
    AS $_$
BEGIN
	EXECUTE 'SET local search_path = '||$2||',public';
	RETURN public.build_histogram2d($1,$3,$4);
END
$_$
    LANGUAGE plpgsql STABLE STRICT;


ALTER FUNCTION public.build_histogram2d(histogram2d, text, text, text) OWNER TO postgres;

--
-- TOC entry 298 (class 1255 OID 21590)
-- Dependencies: 4 919 919
-- Name: buildarea(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION buildarea(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_buildarea'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.buildarea(geometry) OWNER TO postgres;

--
-- TOC entry 388 (class 1255 OID 21702)
-- Dependencies: 4 919
-- Name: bytea(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION bytea(geometry) RETURNS bytea
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_to_bytea'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.bytea(geometry) OWNER TO postgres;

--
-- TOC entry 267 (class 1255 OID 21557)
-- Dependencies: 4
-- Name: cache_bbox(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION cache_bbox() RETURNS "trigger"
    AS '$libdir/liblwgeom.so.1.3', 'cache_bbox'
    LANGUAGE c;


ALTER FUNCTION public.cache_bbox() OWNER TO postgres;

--
-- TOC entry 467 (class 1255 OID 21798)
-- Dependencies: 4 919 919
-- Name: centroid(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION centroid(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'centroid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.centroid(geometry) OWNER TO postgres;

--
-- TOC entry 661 (class 1255 OID 21993)
-- Dependencies: 4 947
-- Name: checkauth(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION checkauth(text, text, text) RETURNS integer
    AS $_$
DECLARE
	schema text;
BEGIN
	IF NOT LongTransactionsEnabled() THEN
		RAISE EXCEPTION 'Long transaction support disabled, use EnableLongTransaction() to enable.';
	END IF;

	if ( $1 != '' ) THEN
		schema = $1;
	ELSE
		SELECT current_schema() into schema;
	END IF;

	-- TODO: check for an already existing trigger ?

	EXECUTE 'CREATE TRIGGER check_auth BEFORE UPDATE OR DELETE ON ' 
		|| quote_ident(schema) || '.' || quote_ident($2)
		||' FOR EACH ROW EXECUTE PROCEDURE CheckAuthTrigger('
		|| quote_literal($3) || ')';

	RETURN 0;
END;
$_$
    LANGUAGE plpgsql;


ALTER FUNCTION public.checkauth(text, text, text) OWNER TO postgres;

--
-- TOC entry 662 (class 1255 OID 21994)
-- Dependencies: 4
-- Name: checkauth(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION checkauth(text, text) RETURNS integer
    AS $_$SELECT CheckAuth('', $1, $2)$_$
    LANGUAGE sql;


ALTER FUNCTION public.checkauth(text, text) OWNER TO postgres;

--
-- TOC entry 663 (class 1255 OID 21995)
-- Dependencies: 4
-- Name: checkauthtrigger(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION checkauthtrigger() RETURNS "trigger"
    AS '$libdir/liblwgeom.so.1.3', 'check_authorization'
    LANGUAGE c;


ALTER FUNCTION public.checkauthtrigger() OWNER TO postgres;

--
-- TOC entry 75 (class 1255 OID 21337)
-- Dependencies: 4 923
-- Name: chip_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION chip_in(cstring) RETURNS chip
    AS '$libdir/liblwgeom.so.1.3', 'CHIP_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.chip_in(cstring) OWNER TO postgres;

--
-- TOC entry 77 (class 1255 OID 21339)
-- Dependencies: 4 923
-- Name: chip_out(chip); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION chip_out(chip) RETURNS cstring
    AS '$libdir/liblwgeom.so.1.3', 'CHIP_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.chip_out(chip) OWNER TO postgres;

--
-- TOC entry 227 (class 1255 OID 21511)
-- Dependencies: 4 919 919 919
-- Name: collect(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION collect(geometry, geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_collect'
    LANGUAGE c IMMUTABLE;


ALTER FUNCTION public.collect(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 231 (class 1255 OID 21519)
-- Dependencies: 4 919 920
-- Name: collect_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION collect_garray(geometry[]) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_collect_garray'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.collect_garray(geometry[]) OWNER TO postgres;

--
-- TOC entry 225 (class 1255 OID 21509)
-- Dependencies: 4 919 919 919
-- Name: collector(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION collector(geometry, geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_collect'
    LANGUAGE c IMMUTABLE;


ALTER FUNCTION public.collector(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 308 (class 1255 OID 21604)
-- Dependencies: 4 925 925 919
-- Name: combine_bbox(box2d, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION combine_bbox(box2d, geometry) RETURNS box2d
    AS '$libdir/liblwgeom.so.1.3', 'BOX2DFLOAT4_combine'
    LANGUAGE c IMMUTABLE;


ALTER FUNCTION public.combine_bbox(box2d, geometry) OWNER TO postgres;

--
-- TOC entry 310 (class 1255 OID 21608)
-- Dependencies: 4 921 921 919
-- Name: combine_bbox(box3d, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION combine_bbox(box3d, geometry) RETURNS box3d
    AS '$libdir/liblwgeom.so.1.3', 'BOX3D_combine'
    LANGUAGE c IMMUTABLE;


ALTER FUNCTION public.combine_bbox(box3d, geometry) OWNER TO postgres;

--
-- TOC entry 164 (class 1255 OID 21448)
-- Dependencies: 4 923
-- Name: compression(chip); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION compression(chip) RETURNS integer
    AS '$libdir/liblwgeom.so.1.3', 'CHIP_getCompression'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.compression(chip) OWNER TO postgres;

--
-- TOC entry 453 (class 1255 OID 21784)
-- Dependencies: 4 919 919
-- Name: contains(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION contains(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'contains'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.contains(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 420 (class 1255 OID 21747)
-- Dependencies: 4 919 919
-- Name: convexhull(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION convexhull(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'convexhull'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.convexhull(geometry) OWNER TO postgres;

--
-- TOC entry 312 (class 1255 OID 21612)
-- Dependencies: 4 878 925
-- Name: create_histogram2d(box2d, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION create_histogram2d(box2d, integer) RETURNS histogram2d
    AS '$libdir/liblwgeom.so.1.3', 'create_lwhistogram2d'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.create_histogram2d(box2d, integer) OWNER TO postgres;

--
-- TOC entry 447 (class 1255 OID 21778)
-- Dependencies: 4 919 919
-- Name: crosses(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION crosses(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'crosses'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.crosses(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 162 (class 1255 OID 21446)
-- Dependencies: 4 923
-- Name: datatype(chip); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION datatype(chip) RETURNS integer
    AS '$libdir/liblwgeom.so.1.3', 'CHIP_getDatatype'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.datatype(chip) OWNER TO postgres;

--
-- TOC entry 422 (class 1255 OID 21749)
-- Dependencies: 4 919 919 919
-- Name: difference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION difference(geometry, geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'difference'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.difference(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 507 (class 1255 OID 21838)
-- Dependencies: 4 919
-- Name: dimension(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dimension(geometry) RETURNS integer
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_dimension'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.dimension(geometry) OWNER TO postgres;

--
-- TOC entry 667 (class 1255 OID 21999)
-- Dependencies: 4 947
-- Name: disablelongtransactions(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION disablelongtransactions() RETURNS text
    AS $$
DECLARE
	rec RECORD;

BEGIN

	--
	-- Drop all triggers applied by CheckAuth()
	--
	FOR rec IN
		SELECT c.relname, t.tgname, t.tgargs FROM pg_trigger t, pg_class c, pg_proc p
		WHERE p.proname = 'checkauthtrigger' and t.tgfoid = p.oid and t.tgrelid = c.oid
	LOOP
		EXECUTE 'DROP TRIGGER ' || quote_ident(rec.tgname) ||
			' ON ' || quote_ident(rec.relname);
	END LOOP;

	--
	-- Drop the authorization_table table
	--
	FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorization_table' LOOP
		DROP TABLE authorization_table;
	END LOOP;

	--
	-- Drop the authorized_tables view
	--
	FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorized_tables' LOOP
		DROP VIEW authorized_tables;
	END LOOP;

	RETURN 'Long transactions support disabled';
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.disablelongtransactions() OWNER TO postgres;

--
-- TOC entry 438 (class 1255 OID 21769)
-- Dependencies: 4 919 919
-- Name: disjoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION disjoint(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'disjoint'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.disjoint(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 203 (class 1255 OID 21487)
-- Dependencies: 4 919 919
-- Name: distance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION distance(geometry, geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_mindistance2d'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.distance(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 201 (class 1255 OID 21485)
-- Dependencies: 4 919 919
-- Name: distance_sphere(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION distance_sphere(geometry, geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_distance_sphere'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.distance_sphere(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 199 (class 1255 OID 21483)
-- Dependencies: 4 919 919 917
-- Name: distance_spheroid(geometry, geometry, spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION distance_spheroid(geometry, geometry, spheroid) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_distance_ellipsoid_point'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.distance_spheroid(geometry, geometry, spheroid) OWNER TO postgres;

--
-- TOC entry 150 (class 1255 OID 21434)
-- Dependencies: 4 919 919
-- Name: dropbbox(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dropbbox(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_dropBBOX'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.dropbbox(geometry) OWNER TO postgres;

--
-- TOC entry 336 (class 1255 OID 21650)
-- Dependencies: 4 947
-- Name: dropgeometrycolumn(character varying, character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dropgeometrycolumn(character varying, character varying, character varying, character varying) RETURNS text
    AS $_$
DECLARE
	catalog_name alias for $1; 
	schema_name alias for $2;
	table_name alias for $3;
	column_name alias for $4;
	myrec RECORD;
	okay boolean;
	real_schema name;

BEGIN


	-- Find, check or fix schema_name
	IF ( schema_name != '' ) THEN
		okay = 'f';

		FOR myrec IN SELECT nspname FROM pg_namespace WHERE text(nspname) = schema_name LOOP
			okay := 't';
		END LOOP;

		IF ( okay <> 't' ) THEN
			RAISE NOTICE 'Invalid schema name - using current_schema()';
			SELECT current_schema() into real_schema;
		ELSE
			real_schema = schema_name;
		END IF;
	ELSE
		SELECT current_schema() into real_schema;
	END IF;

 	-- Find out if the column is in the geometry_columns table
	okay = 'f';
	FOR myrec IN SELECT * from geometry_columns where f_table_schema = text(real_schema) and f_table_name = table_name and f_geometry_column = column_name LOOP
		okay := 't';
	END LOOP; 
	IF (okay <> 't') THEN 
		RAISE EXCEPTION 'column not found in geometry_columns table';
		RETURN 'f';
	END IF;

	-- Remove ref from geometry_columns table
	EXECUTE 'delete from geometry_columns where f_table_schema = ' ||
		quote_literal(real_schema) || ' and f_table_name = ' ||
		quote_literal(table_name)  || ' and f_geometry_column = ' ||
		quote_literal(column_name);
	
	-- Remove table column
	EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) || '.' ||
		quote_ident(table_name) || ' DROP COLUMN ' ||
		quote_ident(column_name);


	RETURN real_schema || '.' || table_name || '.' || column_name ||' effectively removed.';
	
END;
$_$
    LANGUAGE plpgsql STRICT;


ALTER FUNCTION public.dropgeometrycolumn(character varying, character varying, character varying, character varying) OWNER TO postgres;

--
-- TOC entry 337 (class 1255 OID 21651)
-- Dependencies: 4 947
-- Name: dropgeometrycolumn(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dropgeometrycolumn(character varying, character varying, character varying) RETURNS text
    AS $_$
DECLARE
	ret text;
BEGIN
	SELECT DropGeometryColumn('',$1,$2,$3) into ret;
	RETURN ret;
END;
$_$
    LANGUAGE plpgsql STRICT;


ALTER FUNCTION public.dropgeometrycolumn(character varying, character varying, character varying) OWNER TO postgres;

--
-- TOC entry 338 (class 1255 OID 21652)
-- Dependencies: 4 947
-- Name: dropgeometrycolumn(character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dropgeometrycolumn(character varying, character varying) RETURNS text
    AS $_$
DECLARE
	ret text;
BEGIN
	SELECT DropGeometryColumn('','',$1,$2) into ret;
	RETURN ret;
END;
$_$
    LANGUAGE plpgsql STRICT;


ALTER FUNCTION public.dropgeometrycolumn(character varying, character varying) OWNER TO postgres;

--
-- TOC entry 339 (class 1255 OID 21653)
-- Dependencies: 4 947
-- Name: dropgeometrytable(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dropgeometrytable(character varying, character varying, character varying) RETURNS text
    AS $_$
DECLARE
	catalog_name alias for $1; 
	schema_name alias for $2;
	table_name alias for $3;
	real_schema name;

BEGIN

	IF ( schema_name = '' ) THEN
		SELECT current_schema() into real_schema;
	ELSE
		real_schema = schema_name;
	END IF;

	-- Remove refs from geometry_columns table
	EXECUTE 'DELETE FROM geometry_columns WHERE ' ||
		'f_table_schema = ' || quote_literal(real_schema) ||
		' AND ' ||
		' f_table_name = ' || quote_literal(table_name);
	
	-- Remove table 
	EXECUTE 'DROP TABLE '
		|| quote_ident(real_schema) || '.' ||
		quote_ident(table_name);

	RETURN
		real_schema || '.' ||
		table_name ||' dropped.';
	
END;
$_$
    LANGUAGE plpgsql STRICT;


ALTER FUNCTION public.dropgeometrytable(character varying, character varying, character varying) OWNER TO postgres;

--
-- TOC entry 340 (class 1255 OID 21654)
-- Dependencies: 4
-- Name: dropgeometrytable(character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dropgeometrytable(character varying, character varying) RETURNS text
    AS $_$SELECT DropGeometryTable('',$1,$2)$_$
    LANGUAGE sql STRICT;


ALTER FUNCTION public.dropgeometrytable(character varying, character varying) OWNER TO postgres;

--
-- TOC entry 341 (class 1255 OID 21655)
-- Dependencies: 4
-- Name: dropgeometrytable(character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dropgeometrytable(character varying) RETURNS text
    AS $_$SELECT DropGeometryTable('','',$1)$_$
    LANGUAGE sql STRICT;


ALTER FUNCTION public.dropgeometrytable(character varying) OWNER TO postgres;

--
-- TOC entry 304 (class 1255 OID 21600)
-- Dependencies: 4 927 919
-- Name: dump(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dump(geometry) RETURNS SETOF geometry_dump
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_dump'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.dump(geometry) OWNER TO postgres;

--
-- TOC entry 306 (class 1255 OID 21602)
-- Dependencies: 4 927 919
-- Name: dumprings(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION dumprings(geometry) RETURNS SETOF geometry_dump
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_dump_rings'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.dumprings(geometry) OWNER TO postgres;

--
-- TOC entry 665 (class 1255 OID 21997)
-- Dependencies: 4 947
-- Name: enablelongtransactions(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION enablelongtransactions() RETURNS text
    AS $$
DECLARE
	"query" text;
	exists bool;
	rec RECORD;

BEGIN

	exists = 'f';
	FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorization_table'
	LOOP
		exists = 't';
	END LOOP;

	IF NOT exists
	THEN
		"query" = 'CREATE TABLE authorization_table (
			toid oid, -- table oid
			rid text, -- row id
			expires timestamp,
			authid text
		)';
		EXECUTE "query";
	END IF;

	exists = 'f';
	FOR rec IN SELECT * FROM pg_class WHERE relname = 'authorized_tables'
	LOOP
		exists = 't';
	END LOOP;

	IF NOT exists THEN
		"query" = 'CREATE VIEW authorized_tables AS ' ||
			'SELECT ' ||
			'n.nspname as schema, ' ||
			'c.relname as table, trim(' ||
			quote_literal(chr(92) || '000') ||
			' from t.tgargs) as id_column ' ||
			'FROM pg_trigger t, pg_class c, pg_proc p ' ||
			', pg_namespace n ' ||
			'WHERE p.proname = ' || quote_literal('checkauthtrigger') ||
			' AND c.relnamespace = n.oid' ||
			' AND t.tgfoid = p.oid and t.tgrelid = c.oid';
		EXECUTE "query";
	END IF;

	RETURN 'Long transactions support enabled';
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.enablelongtransactions() OWNER TO postgres;

--
-- TOC entry 531 (class 1255 OID 21863)
-- Dependencies: 4 919 919
-- Name: endpoint(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION endpoint(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_endpoint_linestring'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.endpoint(geometry) OWNER TO postgres;

--
-- TOC entry 239 (class 1255 OID 21529)
-- Dependencies: 4 919 919
-- Name: envelope(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION envelope(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_envelope'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.envelope(geometry) OWNER TO postgres;

--
-- TOC entry 475 (class 1255 OID 21806)
-- Dependencies: 4 919 919
-- Name: equals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION equals(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'geomequals'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.equals(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 320 (class 1255 OID 21620)
-- Dependencies: 4 878 925
-- Name: estimate_histogram2d(histogram2d, box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION estimate_histogram2d(histogram2d, box2d) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'estimate_lwhistogram2d'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.estimate_histogram2d(histogram2d, box2d) OWNER TO postgres;

--
-- TOC entry 322 (class 1255 OID 21622)
-- Dependencies: 4 925
-- Name: estimated_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION estimated_extent(text, text, text) RETURNS box2d
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_estimated_extent'
    LANGUAGE c IMMUTABLE STRICT SECURITY DEFINER;


ALTER FUNCTION public.estimated_extent(text, text, text) OWNER TO postgres;

--
-- TOC entry 324 (class 1255 OID 21624)
-- Dependencies: 4 925
-- Name: estimated_extent(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION estimated_extent(text, text) RETURNS box2d
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_estimated_extent'
    LANGUAGE c IMMUTABLE STRICT SECURITY DEFINER;


ALTER FUNCTION public.estimated_extent(text, text) OWNER TO postgres;

--
-- TOC entry 233 (class 1255 OID 21523)
-- Dependencies: 4 921 921
-- Name: expand(box3d, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION expand(box3d, double precision) RETURNS box3d
    AS '$libdir/liblwgeom.so.1.3', 'BOX3D_expand'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.expand(box3d, double precision) OWNER TO postgres;

--
-- TOC entry 235 (class 1255 OID 21525)
-- Dependencies: 4 925 925
-- Name: expand(box2d, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION expand(box2d, double precision) RETURNS box2d
    AS '$libdir/liblwgeom.so.1.3', 'BOX2DFLOAT4_expand'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.expand(box2d, double precision) OWNER TO postgres;

--
-- TOC entry 237 (class 1255 OID 21527)
-- Dependencies: 4 919 919
-- Name: expand(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION expand(geometry, double precision) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_expand'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.expand(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 318 (class 1255 OID 21618)
-- Dependencies: 4 878 878
-- Name: explode_histogram2d(histogram2d, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION explode_histogram2d(histogram2d, text) RETURNS histogram2d
    AS '$libdir/liblwgeom.so.1.3', 'explode_lwhistogram2d'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.explode_histogram2d(histogram2d, text) OWNER TO postgres;

--
-- TOC entry 509 (class 1255 OID 21840)
-- Dependencies: 4 919 919
-- Name: exteriorring(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION exteriorring(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_exteriorring_polygon'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.exteriorring(geometry) OWNER TO postgres;

--
-- TOC entry 158 (class 1255 OID 21442)
-- Dependencies: 4 923
-- Name: factor(chip); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION factor(chip) RETURNS real
    AS '$libdir/liblwgeom.so.1.3', 'CHIP_getFactor'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.factor(chip) OWNER TO postgres;

--
-- TOC entry 326 (class 1255 OID 21626)
-- Dependencies: 4 947 925
-- Name: find_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION find_extent(text, text, text) RETURNS box2d
    AS $_$
DECLARE
	schemaname alias for $1;
	tablename alias for $2;
	columnname alias for $3;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT extent("'||columnname||'") FROM "'||schemaname||'"."'||tablename||'"' LOOP
		return myrec.extent;
	END LOOP; 
END;
$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


ALTER FUNCTION public.find_extent(text, text, text) OWNER TO postgres;

--
-- TOC entry 328 (class 1255 OID 21628)
-- Dependencies: 4 947 925
-- Name: find_extent(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION find_extent(text, text) RETURNS box2d
    AS $_$
DECLARE
	tablename alias for $1;
	columnname alias for $2;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT extent("'||columnname||'") FROM "'||tablename||'"' LOOP
		return myrec.extent;
	END LOOP; 
END;
$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


ALTER FUNCTION public.find_extent(text, text) OWNER TO postgres;

--
-- TOC entry 347 (class 1255 OID 21661)
-- Dependencies: 4 947
-- Name: find_srid(character varying, character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION find_srid(character varying, character varying, character varying) RETURNS integer
    AS $_$DECLARE
   schem text;
   tabl text;
   sr int4;
BEGIN
   IF $1 IS NULL THEN
      RAISE EXCEPTION 'find_srid() - schema is NULL!';
   END IF;
   IF $2 IS NULL THEN
      RAISE EXCEPTION 'find_srid() - table name is NULL!';
   END IF;
   IF $3 IS NULL THEN
      RAISE EXCEPTION 'find_srid() - column name is NULL!';
   END IF;
   schem = $1;
   tabl = $2;
-- if the table contains a . and the schema is empty
-- split the table into a schema and a table
-- otherwise drop through to default behavior
   IF ( schem = '' and tabl LIKE '%.%' ) THEN
     schem = substr(tabl,1,strpos(tabl,'.')-1);
     tabl = substr(tabl,length(schem)+2);
   ELSE
     schem = schem || '%';
   END IF;

   select SRID into sr from geometry_columns where f_table_schema like schem and f_table_name = tabl and f_geometry_column = $3;
   IF NOT FOUND THEN
       RAISE EXCEPTION 'find_srid() - couldnt find the corresponding SRID - is the geometry registered in the GEOMETRY_COLUMNS table?  Is there an uppercase/lowercase missmatch?';
   END IF;
  return sr;
END;
$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


ALTER FUNCTION public.find_srid(character varying, character varying, character varying) OWNER TO postgres;

--
-- TOC entry 331 (class 1255 OID 21645)
-- Dependencies: 4 947
-- Name: fix_geometry_columns(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION fix_geometry_columns() RETURNS text
    AS $$
DECLARE
	mislinked record;
	result text;
	linked integer;
	deleted integer;
	foundschema integer;
BEGIN

	-- Since 7.3 schema support has been added.
	-- Previous postgis versions used to put the database name in
	-- the schema column. This needs to be fixed, so we try to 
	-- set the correct schema for each geometry_colums record
	-- looking at table, column, type and srid.
	UPDATE geometry_columns SET f_table_schema = n.nspname
		FROM pg_namespace n, pg_class c, pg_attribute a,
			pg_constraint sridcheck, pg_constraint typecheck
                WHERE ( f_table_schema is NULL
		OR f_table_schema = ''
                OR f_table_schema NOT IN (
                        SELECT nspname::varchar
                        FROM pg_namespace nn, pg_class cc, pg_attribute aa
                        WHERE cc.relnamespace = nn.oid
                        AND cc.relname = f_table_name::name
                        AND aa.attrelid = cc.oid
                        AND aa.attname = f_geometry_column::name))
                AND f_table_name::name = c.relname
                AND c.oid = a.attrelid
                AND c.relnamespace = n.oid
                AND f_geometry_column::name = a.attname

                AND sridcheck.conrelid = c.oid
		AND sridcheck.consrc LIKE '(srid(% = %)'
                AND sridcheck.consrc ~ textcat(' = ', srid::text)

                AND typecheck.conrelid = c.oid
		AND typecheck.consrc LIKE
	'((geometrytype(%) = ''%''::text) OR (% IS NULL))'
                AND typecheck.consrc ~ textcat(' = ''', type::text)

                AND NOT EXISTS (
                        SELECT oid FROM geometry_columns gc
                        WHERE c.relname::varchar = gc.f_table_name
                        AND n.nspname::varchar = gc.f_table_schema
                        AND a.attname::varchar = gc.f_geometry_column
                );

	GET DIAGNOSTICS foundschema = ROW_COUNT;

	-- no linkage to system table needed
	return 'fixed:'||foundschema::text;

	-- fix linking to system tables
	SELECT 0 INTO linked;
	FOR mislinked in
		SELECT gc.oid as gcrec,
			a.attrelid as attrelid, a.attnum as attnum
                FROM geometry_columns gc, pg_class c,
		pg_namespace n, pg_attribute a
                WHERE ( gc.attrelid IS NULL OR gc.attrelid != a.attrelid 
			OR gc.varattnum IS NULL OR gc.varattnum != a.attnum)
                AND n.nspname = gc.f_table_schema::name
                AND c.relnamespace = n.oid
                AND c.relname = gc.f_table_name::name
                AND a.attname = f_geometry_column::name
                AND a.attrelid = c.oid
	LOOP
		UPDATE geometry_columns SET
			attrelid = mislinked.attrelid,
			varattnum = mislinked.attnum,
			stats = NULL
			WHERE geometry_columns.oid = mislinked.gcrec;
		SELECT linked+1 INTO linked;
	END LOOP; 

	-- remove stale records
	DELETE FROM geometry_columns WHERE attrelid IS NULL;

	GET DIAGNOSTICS deleted = ROW_COUNT;

	result = 
		'fixed:' || foundschema::text ||
		' linked:' || linked::text || 
		' deleted:' || deleted::text;

	return result;

END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.fix_geometry_columns() OWNER TO postgres;

--
-- TOC entry 211 (class 1255 OID 21495)
-- Dependencies: 4 919 919
-- Name: force_2d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION force_2d(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_force_2d'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.force_2d(geometry) OWNER TO postgres;

--
-- TOC entry 215 (class 1255 OID 21499)
-- Dependencies: 4 919 919
-- Name: force_3d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION force_3d(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_force_3dz'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.force_3d(geometry) OWNER TO postgres;

--
-- TOC entry 217 (class 1255 OID 21501)
-- Dependencies: 4 919 919
-- Name: force_3dm(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION force_3dm(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_force_3dm'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.force_3dm(geometry) OWNER TO postgres;

--
-- TOC entry 213 (class 1255 OID 21497)
-- Dependencies: 4 919 919
-- Name: force_3dz(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION force_3dz(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_force_3dz'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.force_3dz(geometry) OWNER TO postgres;

--
-- TOC entry 219 (class 1255 OID 21503)
-- Dependencies: 4 919 919
-- Name: force_4d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION force_4d(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_force_4d'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.force_4d(geometry) OWNER TO postgres;

--
-- TOC entry 221 (class 1255 OID 21505)
-- Dependencies: 4 919 919
-- Name: force_collection(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION force_collection(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_force_collection'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.force_collection(geometry) OWNER TO postgres;

--
-- TOC entry 243 (class 1255 OID 21533)
-- Dependencies: 4 919 919
-- Name: forcerhr(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION forcerhr(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_forceRHR_poly'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.forcerhr(geometry) OWNER TO postgres;

--
-- TOC entry 229 (class 1255 OID 21515)
-- Dependencies: 4 920 920 919
-- Name: geom_accum(geometry[], geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geom_accum(geometry[], geometry) RETURNS geometry[]
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_accum'
    LANGUAGE c IMMUTABLE;


ALTER FUNCTION public.geom_accum(geometry[], geometry) OWNER TO postgres;

--
-- TOC entry 596 (class 1255 OID 21928)
-- Dependencies: 4 919
-- Name: geomcollfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geomcollfromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.geomcollfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 598 (class 1255 OID 21930)
-- Dependencies: 4 919
-- Name: geomcollfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geomcollfromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.geomcollfromtext(text) OWNER TO postgres;

--
-- TOC entry 647 (class 1255 OID 21979)
-- Dependencies: 4 919
-- Name: geomcollfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geomcollfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromWKB($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.geomcollfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 649 (class 1255 OID 21981)
-- Dependencies: 4 919
-- Name: geomcollfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geomcollfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromWKB($1)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.geomcollfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 378 (class 1255 OID 21692)
-- Dependencies: 4 919 925
-- Name: geometry(box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry(box2d) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'BOX2DFLOAT4_to_LWGEOM'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometry(box2d) OWNER TO postgres;

--
-- TOC entry 380 (class 1255 OID 21694)
-- Dependencies: 4 919 921
-- Name: geometry(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry(box3d) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'BOX3D_to_LWGEOM'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometry(box3d) OWNER TO postgres;

--
-- TOC entry 382 (class 1255 OID 21696)
-- Dependencies: 4 919
-- Name: geometry(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry(text) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'parse_WKT_lwgeom'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometry(text) OWNER TO postgres;

--
-- TOC entry 384 (class 1255 OID 21698)
-- Dependencies: 4 919 923
-- Name: geometry(chip); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry(chip) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'CHIP_to_LWGEOM'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometry(chip) OWNER TO postgres;

--
-- TOC entry 386 (class 1255 OID 21700)
-- Dependencies: 4 919
-- Name: geometry(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry(bytea) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_from_bytea'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometry(bytea) OWNER TO postgres;

--
-- TOC entry 129 (class 1255 OID 21400)
-- Dependencies: 4 919 919
-- Name: geometry_above(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_above(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_above'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometry_above(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 23 (class 1255 OID 21287)
-- Dependencies: 4
-- Name: geometry_analyze(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_analyze(internal) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_analyze'
    LANGUAGE c STRICT;


ALTER FUNCTION public.geometry_analyze(internal) OWNER TO postgres;

--
-- TOC entry 131 (class 1255 OID 21402)
-- Dependencies: 4 919 919
-- Name: geometry_below(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_below(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_below'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometry_below(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 111 (class 1255 OID 21376)
-- Dependencies: 4 919 919
-- Name: geometry_cmp(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_cmp(geometry, geometry) RETURNS integer
    AS '$libdir/liblwgeom.so.1.3', 'lwgeom_cmp'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometry_cmp(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 133 (class 1255 OID 21404)
-- Dependencies: 4 919 919
-- Name: geometry_contain(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_contain(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_contain'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometry_contain(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 135 (class 1255 OID 21406)
-- Dependencies: 4 919 919
-- Name: geometry_contained(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_contained(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_contained'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometry_contained(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 109 (class 1255 OID 21374)
-- Dependencies: 4 919 919
-- Name: geometry_eq(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_eq(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'lwgeom_eq'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometry_eq(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 107 (class 1255 OID 21372)
-- Dependencies: 4 919 919
-- Name: geometry_ge(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_ge(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'lwgeom_ge'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometry_ge(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 105 (class 1255 OID 21370)
-- Dependencies: 4 919 919
-- Name: geometry_gt(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_gt(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'lwgeom_gt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometry_gt(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 19 (class 1255 OID 21283)
-- Dependencies: 4 919
-- Name: geometry_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_in(cstring) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometry_in(cstring) OWNER TO postgres;

--
-- TOC entry 103 (class 1255 OID 21368)
-- Dependencies: 4 919 919
-- Name: geometry_le(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_le(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'lwgeom_le'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometry_le(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 125 (class 1255 OID 21396)
-- Dependencies: 4 919 919
-- Name: geometry_left(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_left(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_left'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometry_left(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 101 (class 1255 OID 21366)
-- Dependencies: 4 919 919
-- Name: geometry_lt(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_lt(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'lwgeom_lt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometry_lt(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 21 (class 1255 OID 21285)
-- Dependencies: 4 919
-- Name: geometry_out(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_out(geometry) RETURNS cstring
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometry_out(geometry) OWNER TO postgres;

--
-- TOC entry 121 (class 1255 OID 21392)
-- Dependencies: 4 919 919
-- Name: geometry_overabove(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_overabove(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_overabove'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometry_overabove(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 123 (class 1255 OID 21394)
-- Dependencies: 4 919 919
-- Name: geometry_overbelow(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_overbelow(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_overbelow'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometry_overbelow(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 137 (class 1255 OID 21408)
-- Dependencies: 4 919 919
-- Name: geometry_overlap(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_overlap(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_overlap'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometry_overlap(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 117 (class 1255 OID 21388)
-- Dependencies: 4 919 919
-- Name: geometry_overleft(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_overleft(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_overleft'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometry_overleft(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 119 (class 1255 OID 21390)
-- Dependencies: 4 919 919
-- Name: geometry_overright(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_overright(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_overright'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometry_overright(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 25 (class 1255 OID 21289)
-- Dependencies: 4 919
-- Name: geometry_recv(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_recv(internal) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_recv'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometry_recv(internal) OWNER TO postgres;

--
-- TOC entry 127 (class 1255 OID 21398)
-- Dependencies: 4 919 919
-- Name: geometry_right(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_right(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_right'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometry_right(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 139 (class 1255 OID 21410)
-- Dependencies: 4 919 919
-- Name: geometry_same(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_same(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_same'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometry_same(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 27 (class 1255 OID 21291)
-- Dependencies: 4 919
-- Name: geometry_send(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometry_send(geometry) RETURNS bytea
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_send'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometry_send(geometry) OWNER TO postgres;

--
-- TOC entry 547 (class 1255 OID 21879)
-- Dependencies: 4 919
-- Name: geometryfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometryfromtext(text) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_from_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometryfromtext(text) OWNER TO postgres;

--
-- TOC entry 549 (class 1255 OID 21881)
-- Dependencies: 4 919
-- Name: geometryfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometryfromtext(text, integer) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_from_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometryfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 505 (class 1255 OID 21836)
-- Dependencies: 4 919 919
-- Name: geometryn(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometryn(geometry, integer) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_geometryn_collection'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometryn(geometry, integer) OWNER TO postgres;

--
-- TOC entry 517 (class 1255 OID 21848)
-- Dependencies: 4 919
-- Name: geometrytype(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geometrytype(geometry) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_getTYPE'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geometrytype(geometry) OWNER TO postgres;

--
-- TOC entry 263 (class 1255 OID 21553)
-- Dependencies: 4 919
-- Name: geomfromewkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geomfromewkb(bytea) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOMFromWKB'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geomfromewkb(bytea) OWNER TO postgres;

--
-- TOC entry 265 (class 1255 OID 21555)
-- Dependencies: 4 919
-- Name: geomfromewkt(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geomfromewkt(text) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'parse_WKT_lwgeom'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geomfromewkt(text) OWNER TO postgres;

--
-- TOC entry 551 (class 1255 OID 21883)
-- Dependencies: 4 919
-- Name: geomfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geomfromtext(text) RETURNS geometry
    AS $_$SELECT geometryfromtext($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.geomfromtext(text) OWNER TO postgres;

--
-- TOC entry 553 (class 1255 OID 21885)
-- Dependencies: 4 919
-- Name: geomfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geomfromtext(text, integer) RETURNS geometry
    AS $_$SELECT geometryfromtext($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.geomfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 600 (class 1255 OID 21932)
-- Dependencies: 4 919
-- Name: geomfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geomfromwkb(bytea) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_from_WKB'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geomfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 602 (class 1255 OID 21934)
-- Dependencies: 4 919
-- Name: geomfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geomfromwkb(bytea, integer) RETURNS geometry
    AS $_$SELECT setSRID(GeomFromWKB($1), $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.geomfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 430 (class 1255 OID 21757)
-- Dependencies: 4 919 919 919
-- Name: geomunion(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geomunion(geometry, geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'geomunion'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.geomunion(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 465 (class 1255 OID 21796)
-- Dependencies: 4 919 919
-- Name: geosnoop(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION geosnoop(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'GEOSnoop'
    LANGUAGE c STRICT;


ALTER FUNCTION public.geosnoop(geometry) OWNER TO postgres;

--
-- TOC entry 348 (class 1255 OID 21662)
-- Dependencies: 4 947
-- Name: get_proj4_from_srid(integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION get_proj4_from_srid(integer) RETURNS text
    AS $_$
BEGIN
	RETURN proj4text::text FROM spatial_ref_sys WHERE srid= $1;
END;
$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


ALTER FUNCTION public.get_proj4_from_srid(integer) OWNER TO postgres;

--
-- TOC entry 153 (class 1255 OID 21437)
-- Dependencies: 4 925 919
-- Name: getbbox(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION getbbox(geometry) RETURNS box2d
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_to_BOX2DFLOAT4'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.getbbox(geometry) OWNER TO postgres;

--
-- TOC entry 152 (class 1255 OID 21436)
-- Dependencies: 4 919
-- Name: getsrid(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION getsrid(geometry) RETURNS integer
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_getSRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.getsrid(geometry) OWNER TO postgres;

--
-- TOC entry 664 (class 1255 OID 21996)
-- Dependencies: 4
-- Name: gettransactionid(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION gettransactionid() RETURNS xid
    AS '$libdir/liblwgeom.so.1.3', 'getTransactionID'
    LANGUAGE c;


ALTER FUNCTION public.gettransactionid() OWNER TO postgres;

--
-- TOC entry 249 (class 1255 OID 21539)
-- Dependencies: 4 919
-- Name: hasbbox(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION hasbbox(geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_hasBBOX'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.hasbbox(geometry) OWNER TO postgres;

--
-- TOC entry 156 (class 1255 OID 21440)
-- Dependencies: 4 923
-- Name: height(chip); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION height(chip) RETURNS integer
    AS '$libdir/liblwgeom.so.1.3', 'CHIP_getHeight'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.height(chip) OWNER TO postgres;

--
-- TOC entry 11 (class 1255 OID 21271)
-- Dependencies: 4 878
-- Name: histogram2d_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION histogram2d_in(cstring) RETURNS histogram2d
    AS '$libdir/liblwgeom.so.1.3', 'lwhistogram2d_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.histogram2d_in(cstring) OWNER TO postgres;

--
-- TOC entry 13 (class 1255 OID 21273)
-- Dependencies: 4 878
-- Name: histogram2d_out(histogram2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION histogram2d_out(histogram2d) RETURNS cstring
    AS '$libdir/liblwgeom.so.1.3', 'lwhistogram2d_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.histogram2d_out(histogram2d) OWNER TO postgres;

--
-- TOC entry 515 (class 1255 OID 21846)
-- Dependencies: 4 919 919
-- Name: interiorringn(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION interiorringn(geometry, integer) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_interiorringn_polygon'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.interiorringn(geometry, integer) OWNER TO postgres;

--
-- TOC entry 414 (class 1255 OID 21741)
-- Dependencies: 4 919 919 919
-- Name: intersection(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION intersection(geometry, geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'intersection'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.intersection(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 444 (class 1255 OID 21775)
-- Dependencies: 4 919 919
-- Name: intersects(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION intersects(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'intersects'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.intersects(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 533 (class 1255 OID 21865)
-- Dependencies: 4 919
-- Name: isclosed(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isclosed(geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_isclosed_linestring'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.isclosed(geometry) OWNER TO postgres;

--
-- TOC entry 535 (class 1255 OID 21867)
-- Dependencies: 4 919
-- Name: isempty(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isempty(geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_isempty'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.isempty(geometry) OWNER TO postgres;

--
-- TOC entry 469 (class 1255 OID 21800)
-- Dependencies: 4 919
-- Name: isring(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isring(geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'isring'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.isring(geometry) OWNER TO postgres;

--
-- TOC entry 473 (class 1255 OID 21804)
-- Dependencies: 4 919
-- Name: issimple(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION issimple(geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'issimple'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.issimple(geometry) OWNER TO postgres;

--
-- TOC entry 463 (class 1255 OID 21794)
-- Dependencies: 4 919
-- Name: isvalid(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION isvalid(geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'isvalid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.isvalid(geometry) OWNER TO postgres;

--
-- TOC entry 466 (class 1255 OID 21797)
-- Dependencies: 4 919 919
-- Name: jtsnoop(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION jtsnoop(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'JTSnoop'
    LANGUAGE c STRICT;


ALTER FUNCTION public.jtsnoop(geometry) OWNER TO postgres;

--
-- TOC entry 181 (class 1255 OID 21465)
-- Dependencies: 4 919
-- Name: length(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION length(geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_length_linestring'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.length(geometry) OWNER TO postgres;

--
-- TOC entry 179 (class 1255 OID 21463)
-- Dependencies: 4 919
-- Name: length2d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION length2d(geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_length2d_linestring'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.length2d(geometry) OWNER TO postgres;

--
-- TOC entry 187 (class 1255 OID 21471)
-- Dependencies: 4 919 917
-- Name: length2d_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION length2d_spheroid(geometry, spheroid) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_length2d_ellipsoid_linestring'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.length2d_spheroid(geometry, spheroid) OWNER TO postgres;

--
-- TOC entry 177 (class 1255 OID 21461)
-- Dependencies: 4 919
-- Name: length3d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION length3d(geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_length_linestring'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.length3d(geometry) OWNER TO postgres;

--
-- TOC entry 183 (class 1255 OID 21467)
-- Dependencies: 4 919 917
-- Name: length3d_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION length3d_spheroid(geometry, spheroid) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_length_ellipsoid_linestring'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.length3d_spheroid(geometry, spheroid) OWNER TO postgres;

--
-- TOC entry 185 (class 1255 OID 21469)
-- Dependencies: 4 919 917
-- Name: length_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION length_spheroid(geometry, spheroid) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_length_ellipsoid_linestring'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.length_spheroid(geometry, spheroid) OWNER TO postgres;

--
-- TOC entry 404 (class 1255 OID 21731)
-- Dependencies: 4 919 919
-- Name: line_interpolate_point(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION line_interpolate_point(geometry, double precision) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_line_interpolate_point'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.line_interpolate_point(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 408 (class 1255 OID 21735)
-- Dependencies: 4 919 919
-- Name: line_locate_point(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION line_locate_point(geometry, geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_line_locate_point'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.line_locate_point(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 406 (class 1255 OID 21733)
-- Dependencies: 4 919 919
-- Name: line_substring(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION line_substring(geometry, double precision, double precision) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_line_substring'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.line_substring(geometry, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 282 (class 1255 OID 21572)
-- Dependencies: 4 919 919
-- Name: linefrommultipoint(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION linefrommultipoint(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_line_from_mpoint'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.linefrommultipoint(geometry) OWNER TO postgres;

--
-- TOC entry 559 (class 1255 OID 21891)
-- Dependencies: 4 919
-- Name: linefromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION linefromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'LINESTRING'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.linefromtext(text) OWNER TO postgres;

--
-- TOC entry 561 (class 1255 OID 21893)
-- Dependencies: 4 919
-- Name: linefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION linefromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'LINESTRING'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.linefromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 608 (class 1255 OID 21940)
-- Dependencies: 4 919
-- Name: linefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION linefromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.linefromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 610 (class 1255 OID 21942)
-- Dependencies: 4 919
-- Name: linefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION linefromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'LINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.linefromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 302 (class 1255 OID 21594)
-- Dependencies: 4 919 919
-- Name: linemerge(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION linemerge(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'linemerge'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.linemerge(geometry) OWNER TO postgres;

--
-- TOC entry 563 (class 1255 OID 21895)
-- Dependencies: 4 919
-- Name: linestringfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION linestringfromtext(text) RETURNS geometry
    AS $_$SELECT LineFromText($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.linestringfromtext(text) OWNER TO postgres;

--
-- TOC entry 564 (class 1255 OID 21896)
-- Dependencies: 4 919
-- Name: linestringfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION linestringfromtext(text, integer) RETURNS geometry
    AS $_$SELECT LineFromText($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.linestringfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 612 (class 1255 OID 21944)
-- Dependencies: 4 919
-- Name: linestringfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION linestringfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.linestringfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 614 (class 1255 OID 21946)
-- Dependencies: 4 919
-- Name: linestringfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION linestringfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'LINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.linestringfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 412 (class 1255 OID 21739)
-- Dependencies: 4 919 919
-- Name: locate_along_measure(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION locate_along_measure(geometry, double precision) RETURNS geometry
    AS $_$SELECT locate_between_measures($1, $2, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.locate_along_measure(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 410 (class 1255 OID 21737)
-- Dependencies: 4 919 919
-- Name: locate_between_measures(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION locate_between_measures(geometry, double precision, double precision) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_locate_between_m'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.locate_between_measures(geometry, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 656 (class 1255 OID 21988)
-- Dependencies: 4 947
-- Name: lockrow(text, text, text, text, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lockrow(text, text, text, text, timestamp without time zone) RETURNS integer
    AS $_$
DECLARE
	myschema alias for $1;
	mytable alias for $2;
	myrid   alias for $3;
	authid alias for $4;
	expires alias for $5;
	ret int;
	mytoid oid;
	myrec RECORD;
	
BEGIN

	IF NOT LongTransactionsEnabled() THEN
		RAISE EXCEPTION 'Long transaction support disabled, use EnableLongTransaction() to enable.';
	END IF;

	EXECUTE 'DELETE FROM authorization_table WHERE expires < now()'; 

	SELECT c.oid INTO mytoid FROM pg_class c, pg_namespace n
		WHERE c.relname = mytable
		AND c.relnamespace = n.oid
		AND n.nspname = myschema;

	-- RAISE NOTICE 'toid: %', mytoid;

	FOR myrec IN SELECT * FROM authorization_table WHERE 
		toid = mytoid AND rid = myrid
	LOOP
		IF myrec.authid != authid THEN
			RETURN 0;
		ELSE
			RETURN 1;
		END IF;
	END LOOP;

	EXECUTE 'INSERT INTO authorization_table VALUES ('||
		quote_literal(mytoid::text)||','||quote_literal(myrid)||
		','||quote_literal(expires::text)||
		','||quote_literal(authid) ||')';

	GET DIAGNOSTICS ret = ROW_COUNT;

	RETURN ret;
END;$_$
    LANGUAGE plpgsql STRICT;


ALTER FUNCTION public.lockrow(text, text, text, text, timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 657 (class 1255 OID 21989)
-- Dependencies: 4
-- Name: lockrow(text, text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lockrow(text, text, text, text) RETURNS integer
    AS $_$SELECT LockRow($1, $2, $3, $4, now()::timestamp+'1:00');$_$
    LANGUAGE sql STRICT;


ALTER FUNCTION public.lockrow(text, text, text, text) OWNER TO postgres;

--
-- TOC entry 658 (class 1255 OID 21990)
-- Dependencies: 4
-- Name: lockrow(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lockrow(text, text, text) RETURNS integer
    AS $_$SELECT LockRow(current_schema(), $1, $2, $3, now()::timestamp+'1:00');$_$
    LANGUAGE sql STRICT;


ALTER FUNCTION public.lockrow(text, text, text) OWNER TO postgres;

--
-- TOC entry 659 (class 1255 OID 21991)
-- Dependencies: 4
-- Name: lockrow(text, text, text, timestamp without time zone); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lockrow(text, text, text, timestamp without time zone) RETURNS integer
    AS $_$SELECT LockRow(current_schema(), $1, $2, $3, $4);$_$
    LANGUAGE sql STRICT;


ALTER FUNCTION public.lockrow(text, text, text, timestamp without time zone) OWNER TO postgres;

--
-- TOC entry 666 (class 1255 OID 21998)
-- Dependencies: 4 947
-- Name: longtransactionsenabled(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION longtransactionsenabled() RETURNS boolean
    AS $$
DECLARE
	rec RECORD;
BEGIN
	FOR rec IN SELECT oid FROM pg_class WHERE relname = 'authorized_tables'
	LOOP
		return 't';
	END LOOP;
	return 'f';
END;
$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.longtransactionsenabled() OWNER TO postgres;

--
-- TOC entry 142 (class 1255 OID 21425)
-- Dependencies: 4
-- Name: lwgeom_gist_compress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lwgeom_gist_compress(internal) RETURNS internal
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_gist_compress'
    LANGUAGE c;


ALTER FUNCTION public.lwgeom_gist_compress(internal) OWNER TO postgres;

--
-- TOC entry 141 (class 1255 OID 21424)
-- Dependencies: 4 919
-- Name: lwgeom_gist_consistent(internal, geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lwgeom_gist_consistent(internal, geometry, integer) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_gist_consistent'
    LANGUAGE c;


ALTER FUNCTION public.lwgeom_gist_consistent(internal, geometry, integer) OWNER TO postgres;

--
-- TOC entry 147 (class 1255 OID 21430)
-- Dependencies: 4
-- Name: lwgeom_gist_decompress(internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lwgeom_gist_decompress(internal) RETURNS internal
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_gist_decompress'
    LANGUAGE c;


ALTER FUNCTION public.lwgeom_gist_decompress(internal) OWNER TO postgres;

--
-- TOC entry 143 (class 1255 OID 21426)
-- Dependencies: 4
-- Name: lwgeom_gist_penalty(internal, internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lwgeom_gist_penalty(internal, internal, internal) RETURNS internal
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_gist_penalty'
    LANGUAGE c;


ALTER FUNCTION public.lwgeom_gist_penalty(internal, internal, internal) OWNER TO postgres;

--
-- TOC entry 144 (class 1255 OID 21427)
-- Dependencies: 4
-- Name: lwgeom_gist_picksplit(internal, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lwgeom_gist_picksplit(internal, internal) RETURNS internal
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_gist_picksplit'
    LANGUAGE c;


ALTER FUNCTION public.lwgeom_gist_picksplit(internal, internal) OWNER TO postgres;

--
-- TOC entry 146 (class 1255 OID 21429)
-- Dependencies: 4 925 925
-- Name: lwgeom_gist_same(box2d, box2d, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lwgeom_gist_same(box2d, box2d, internal) RETURNS internal
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_gist_same'
    LANGUAGE c;


ALTER FUNCTION public.lwgeom_gist_same(box2d, box2d, internal) OWNER TO postgres;

--
-- TOC entry 145 (class 1255 OID 21428)
-- Dependencies: 4
-- Name: lwgeom_gist_union(bytea, internal); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION lwgeom_gist_union(bytea, internal) RETURNS internal
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_gist_union'
    LANGUAGE c;


ALTER FUNCTION public.lwgeom_gist_union(bytea, internal) OWNER TO postgres;

--
-- TOC entry 527 (class 1255 OID 21859)
-- Dependencies: 4 919
-- Name: m(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION m(geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_m_point'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.m(geometry) OWNER TO postgres;

--
-- TOC entry 276 (class 1255 OID 21566)
-- Dependencies: 4 925 919 919
-- Name: makebox2d(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION makebox2d(geometry, geometry) RETURNS box2d
    AS '$libdir/liblwgeom.so.1.3', 'BOX2DFLOAT4_construct'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.makebox2d(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 278 (class 1255 OID 21568)
-- Dependencies: 4 921 919 919
-- Name: makebox3d(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION makebox3d(geometry, geometry) RETURNS box3d
    AS '$libdir/liblwgeom.so.1.3', 'BOX3D_construct'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.makebox3d(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 284 (class 1255 OID 21574)
-- Dependencies: 4 919 919 919
-- Name: makeline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION makeline(geometry, geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_makeline'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.makeline(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 280 (class 1255 OID 21570)
-- Dependencies: 4 919 920
-- Name: makeline_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION makeline_garray(geometry[]) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_makeline_garray'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.makeline_garray(geometry[]) OWNER TO postgres;

--
-- TOC entry 269 (class 1255 OID 21559)
-- Dependencies: 4 919
-- Name: makepoint(double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION makepoint(double precision, double precision) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_makepoint'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.makepoint(double precision, double precision) OWNER TO postgres;

--
-- TOC entry 271 (class 1255 OID 21561)
-- Dependencies: 4 919
-- Name: makepoint(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION makepoint(double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_makepoint'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.makepoint(double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 273 (class 1255 OID 21563)
-- Dependencies: 4 919
-- Name: makepoint(double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION makepoint(double precision, double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_makepoint'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.makepoint(double precision, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 275 (class 1255 OID 21565)
-- Dependencies: 4 919
-- Name: makepointm(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION makepointm(double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_makepoint3dm'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.makepointm(double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 294 (class 1255 OID 21586)
-- Dependencies: 4 919 919 920
-- Name: makepolygon(geometry, geometry[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION makepolygon(geometry, geometry[]) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_makepoly'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.makepolygon(geometry, geometry[]) OWNER TO postgres;

--
-- TOC entry 296 (class 1255 OID 21588)
-- Dependencies: 4 919 919
-- Name: makepolygon(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION makepolygon(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_makepoly'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.makepolygon(geometry) OWNER TO postgres;

--
-- TOC entry 205 (class 1255 OID 21489)
-- Dependencies: 4 919 919
-- Name: max_distance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION max_distance(geometry, geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_maxdistance2d_linestring'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.max_distance(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 169 (class 1255 OID 21453)
-- Dependencies: 4 919
-- Name: mem_size(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION mem_size(geometry) RETURNS integer
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_mem_size'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.mem_size(geometry) OWNER TO postgres;

--
-- TOC entry 573 (class 1255 OID 21905)
-- Dependencies: 4 919
-- Name: mlinefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION mlinefromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.mlinefromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 575 (class 1255 OID 21907)
-- Dependencies: 4 919
-- Name: mlinefromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION mlinefromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTILINESTRING'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.mlinefromtext(text) OWNER TO postgres;

--
-- TOC entry 635 (class 1255 OID 21967)
-- Dependencies: 4 919
-- Name: mlinefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION mlinefromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.mlinefromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 637 (class 1255 OID 21969)
-- Dependencies: 4 919
-- Name: mlinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION mlinefromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.mlinefromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 581 (class 1255 OID 21913)
-- Dependencies: 4 919
-- Name: mpointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION mpointfromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1,$2)) = 'MULTIPOINT'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.mpointfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 583 (class 1255 OID 21915)
-- Dependencies: 4 919
-- Name: mpointfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION mpointfromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTIPOINT'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.mpointfromtext(text) OWNER TO postgres;

--
-- TOC entry 624 (class 1255 OID 21956)
-- Dependencies: 4 919
-- Name: mpointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION mpointfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1,$2)) = 'MULTIPOINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.mpointfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 626 (class 1255 OID 21958)
-- Dependencies: 4 919
-- Name: mpointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION mpointfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOINT'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.mpointfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 588 (class 1255 OID 21920)
-- Dependencies: 4 919
-- Name: mpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION mpolyfromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'MULTIPOLYGON'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.mpolyfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 590 (class 1255 OID 21922)
-- Dependencies: 4 919
-- Name: mpolyfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION mpolyfromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTIPOLYGON'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.mpolyfromtext(text) OWNER TO postgres;

--
-- TOC entry 639 (class 1255 OID 21971)
-- Dependencies: 4 919
-- Name: mpolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION mpolyfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.mpolyfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 641 (class 1255 OID 21973)
-- Dependencies: 4 919
-- Name: mpolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION mpolyfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.mpolyfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 223 (class 1255 OID 21507)
-- Dependencies: 4 919 919
-- Name: multi(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION multi(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_force_multi'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.multi(geometry) OWNER TO postgres;

--
-- TOC entry 632 (class 1255 OID 21964)
-- Dependencies: 4 919
-- Name: multilinefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION multilinefromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.multilinefromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 633 (class 1255 OID 21965)
-- Dependencies: 4 919
-- Name: multilinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION multilinefromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.multilinefromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 577 (class 1255 OID 21909)
-- Dependencies: 4 919
-- Name: multilinestringfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION multilinestringfromtext(text) RETURNS geometry
    AS $_$SELECT MLineFromText($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.multilinestringfromtext(text) OWNER TO postgres;

--
-- TOC entry 579 (class 1255 OID 21911)
-- Dependencies: 4 919
-- Name: multilinestringfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION multilinestringfromtext(text, integer) RETURNS geometry
    AS $_$SELECT MLineFromText($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.multilinestringfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 585 (class 1255 OID 21917)
-- Dependencies: 4 919
-- Name: multipointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION multipointfromtext(text, integer) RETURNS geometry
    AS $_$SELECT MPointFromText($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.multipointfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 586 (class 1255 OID 21918)
-- Dependencies: 4 919
-- Name: multipointfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION multipointfromtext(text) RETURNS geometry
    AS $_$SELECT MPointFromText($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.multipointfromtext(text) OWNER TO postgres;

--
-- TOC entry 628 (class 1255 OID 21960)
-- Dependencies: 4 919
-- Name: multipointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION multipointfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1,$2)) = 'MULTIPOINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.multipointfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 630 (class 1255 OID 21962)
-- Dependencies: 4 919
-- Name: multipointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION multipointfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOINT'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.multipointfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 643 (class 1255 OID 21975)
-- Dependencies: 4 919
-- Name: multipolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION multipolyfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.multipolyfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 645 (class 1255 OID 21977)
-- Dependencies: 4 919
-- Name: multipolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION multipolyfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.multipolyfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 592 (class 1255 OID 21924)
-- Dependencies: 4 919
-- Name: multipolygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION multipolygonfromtext(text, integer) RETURNS geometry
    AS $_$SELECT MPolyFromText($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.multipolygonfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 594 (class 1255 OID 21926)
-- Dependencies: 4 919
-- Name: multipolygonfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION multipolygonfromtext(text) RETURNS geometry
    AS $_$SELECT MPolyFromText($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.multipolygonfromtext(text) OWNER TO postgres;

--
-- TOC entry 251 (class 1255 OID 21541)
-- Dependencies: 4 919
-- Name: ndims(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ndims(geometry) RETURNS smallint
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_ndims'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ndims(geometry) OWNER TO postgres;

--
-- TOC entry 245 (class 1255 OID 21535)
-- Dependencies: 4 919 919
-- Name: noop(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION noop(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_noop'
    LANGUAGE c STRICT;


ALTER FUNCTION public.noop(geometry) OWNER TO postgres;

--
-- TOC entry 173 (class 1255 OID 21457)
-- Dependencies: 4 919
-- Name: npoints(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION npoints(geometry) RETURNS integer
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_npoints'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.npoints(geometry) OWNER TO postgres;

--
-- TOC entry 175 (class 1255 OID 21459)
-- Dependencies: 4 919
-- Name: nrings(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION nrings(geometry) RETURNS integer
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_nrings'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.nrings(geometry) OWNER TO postgres;

--
-- TOC entry 503 (class 1255 OID 21834)
-- Dependencies: 4 919
-- Name: numgeometries(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION numgeometries(geometry) RETURNS integer
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_numgeometries_collection'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.numgeometries(geometry) OWNER TO postgres;

--
-- TOC entry 513 (class 1255 OID 21844)
-- Dependencies: 4 919
-- Name: numinteriorring(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION numinteriorring(geometry) RETURNS integer
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_numinteriorrings_polygon'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.numinteriorring(geometry) OWNER TO postgres;

--
-- TOC entry 511 (class 1255 OID 21842)
-- Dependencies: 4 919
-- Name: numinteriorrings(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION numinteriorrings(geometry) RETURNS integer
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_numinteriorrings_polygon'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.numinteriorrings(geometry) OWNER TO postgres;

--
-- TOC entry 501 (class 1255 OID 21832)
-- Dependencies: 4 919
-- Name: numpoints(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION numpoints(geometry) RETURNS integer
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_numpoints_linestring'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.numpoints(geometry) OWNER TO postgres;

--
-- TOC entry 460 (class 1255 OID 21791)
-- Dependencies: 4 919 919
-- Name: overlaps(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION "overlaps"(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'overlaps'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public."overlaps"(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 193 (class 1255 OID 21477)
-- Dependencies: 4 919
-- Name: perimeter(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION perimeter(geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_perimeter_poly'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.perimeter(geometry) OWNER TO postgres;

--
-- TOC entry 191 (class 1255 OID 21475)
-- Dependencies: 4 919
-- Name: perimeter2d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION perimeter2d(geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_perimeter2d_poly'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.perimeter2d(geometry) OWNER TO postgres;

--
-- TOC entry 189 (class 1255 OID 21473)
-- Dependencies: 4 919
-- Name: perimeter3d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION perimeter3d(geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_perimeter_poly'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.perimeter3d(geometry) OWNER TO postgres;

--
-- TOC entry 207 (class 1255 OID 21491)
-- Dependencies: 4 919
-- Name: point_inside_circle(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION point_inside_circle(geometry, double precision, double precision, double precision) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_inside_circle_point'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.point_inside_circle(geometry, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 555 (class 1255 OID 21887)
-- Dependencies: 4 919
-- Name: pointfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pointfromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'POINT'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.pointfromtext(text) OWNER TO postgres;

--
-- TOC entry 557 (class 1255 OID 21889)
-- Dependencies: 4 919
-- Name: pointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pointfromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'POINT'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.pointfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 604 (class 1255 OID 21936)
-- Dependencies: 4 919
-- Name: pointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pointfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'POINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.pointfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 606 (class 1255 OID 21938)
-- Dependencies: 4 919
-- Name: pointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pointfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POINT'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.pointfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 519 (class 1255 OID 21850)
-- Dependencies: 4 919 919
-- Name: pointn(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pointn(geometry, integer) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_pointn_linestring'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.pointn(geometry, integer) OWNER TO postgres;

--
-- TOC entry 471 (class 1255 OID 21802)
-- Dependencies: 4 919 919
-- Name: pointonsurface(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION pointonsurface(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'pointonsurface'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.pointonsurface(geometry) OWNER TO postgres;

--
-- TOC entry 565 (class 1255 OID 21897)
-- Dependencies: 4 919
-- Name: polyfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION polyfromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'POLYGON'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.polyfromtext(text) OWNER TO postgres;

--
-- TOC entry 567 (class 1255 OID 21899)
-- Dependencies: 4 919
-- Name: polyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION polyfromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'POLYGON'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.polyfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 616 (class 1255 OID 21948)
-- Dependencies: 4 919
-- Name: polyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION polyfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'POLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.polyfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 618 (class 1255 OID 21950)
-- Dependencies: 4 919
-- Name: polyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION polyfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.polyfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 569 (class 1255 OID 21901)
-- Dependencies: 4 919
-- Name: polygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION polygonfromtext(text, integer) RETURNS geometry
    AS $_$SELECT PolyFromText($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.polygonfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 571 (class 1255 OID 21903)
-- Dependencies: 4 919
-- Name: polygonfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION polygonfromtext(text) RETURNS geometry
    AS $_$SELECT PolyFromText($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.polygonfromtext(text) OWNER TO postgres;

--
-- TOC entry 620 (class 1255 OID 21952)
-- Dependencies: 4 919
-- Name: polygonfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION polygonfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1,$2)) = 'POLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.polygonfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 622 (class 1255 OID 21954)
-- Dependencies: 4 919
-- Name: polygonfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION polygonfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.polygonfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 300 (class 1255 OID 21592)
-- Dependencies: 4 919 920
-- Name: polygonize_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION polygonize_garray(geometry[]) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'polygonize_garray'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.polygonize_garray(geometry[]) OWNER TO postgres;

--
-- TOC entry 362 (class 1255 OID 21676)
-- Dependencies: 4 947
-- Name: postgis_full_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_full_version() RETURNS text
    AS $$
DECLARE
	libver text;
	projver text;
	geosver text;
	jtsver text;
	usestats bool;
	dbproc text;
	relproc text;
	fullver text;
BEGIN
	SELECT postgis_lib_version() INTO libver;
	SELECT postgis_proj_version() INTO projver;
	SELECT postgis_geos_version() INTO geosver;
	SELECT postgis_jts_version() INTO jtsver;
	SELECT postgis_uses_stats() INTO usestats;
	SELECT postgis_scripts_installed() INTO dbproc;
	SELECT postgis_scripts_released() INTO relproc;

	fullver = 'POSTGIS="' || libver || '"';

	IF  geosver IS NOT NULL THEN
		fullver = fullver || ' GEOS="' || geosver || '"';
	END IF;

	IF  jtsver IS NOT NULL THEN
		fullver = fullver || ' JTS="' || jtsver || '"';
	END IF;

	IF  projver IS NOT NULL THEN
		fullver = fullver || ' PROJ="' || projver || '"';
	END IF;

	IF usestats THEN
		fullver = fullver || ' USE_STATS';
	END IF;

	-- fullver = fullver || ' DBPROC="' || dbproc || '"';
	-- fullver = fullver || ' RELPROC="' || relproc || '"';

	IF dbproc != relproc THEN
		fullver = fullver || ' (procs from ' || dbproc || ' need upgrade)';
	END IF;

	RETURN fullver;
END
$$
    LANGUAGE plpgsql IMMUTABLE;


ALTER FUNCTION public.postgis_full_version() OWNER TO postgres;

--
-- TOC entry 358 (class 1255 OID 21672)
-- Dependencies: 4
-- Name: postgis_geos_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_geos_version() RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'postgis_geos_version'
    LANGUAGE c IMMUTABLE;


ALTER FUNCTION public.postgis_geos_version() OWNER TO postgres;

--
-- TOC entry 115 (class 1255 OID 21386)
-- Dependencies: 4
-- Name: postgis_gist_joinsel(internal, oid, internal, smallint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_gist_joinsel(internal, oid, internal, smallint) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_gist_joinsel'
    LANGUAGE c;


ALTER FUNCTION public.postgis_gist_joinsel(internal, oid, internal, smallint) OWNER TO postgres;

--
-- TOC entry 113 (class 1255 OID 21384)
-- Dependencies: 4
-- Name: postgis_gist_sel(internal, oid, internal, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_gist_sel(internal, oid, internal, integer) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_gist_sel'
    LANGUAGE c;


ALTER FUNCTION public.postgis_gist_sel(internal, oid, internal, integer) OWNER TO postgres;

--
-- TOC entry 359 (class 1255 OID 21673)
-- Dependencies: 4
-- Name: postgis_jts_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_jts_version() RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'postgis_jts_version'
    LANGUAGE c IMMUTABLE;


ALTER FUNCTION public.postgis_jts_version() OWNER TO postgres;

--
-- TOC entry 361 (class 1255 OID 21675)
-- Dependencies: 4
-- Name: postgis_lib_build_date(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_lib_build_date() RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'postgis_lib_build_date'
    LANGUAGE c IMMUTABLE;


ALTER FUNCTION public.postgis_lib_build_date() OWNER TO postgres;

--
-- TOC entry 355 (class 1255 OID 21669)
-- Dependencies: 4
-- Name: postgis_lib_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_lib_version() RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'postgis_lib_version'
    LANGUAGE c IMMUTABLE;


ALTER FUNCTION public.postgis_lib_version() OWNER TO postgres;

--
-- TOC entry 353 (class 1255 OID 21667)
-- Dependencies: 4
-- Name: postgis_proj_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_proj_version() RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'postgis_proj_version'
    LANGUAGE c IMMUTABLE;


ALTER FUNCTION public.postgis_proj_version() OWNER TO postgres;

--
-- TOC entry 360 (class 1255 OID 21674)
-- Dependencies: 4
-- Name: postgis_scripts_build_date(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_scripts_build_date() RETURNS text
    AS $$SELECT '2007-10-05 02:45:50'::text AS version$$
    LANGUAGE sql IMMUTABLE;


ALTER FUNCTION public.postgis_scripts_build_date() OWNER TO postgres;

--
-- TOC entry 354 (class 1255 OID 21668)
-- Dependencies: 4
-- Name: postgis_scripts_installed(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_scripts_installed() RETURNS text
    AS $$SELECT '1.3.1'::text AS version$$
    LANGUAGE sql IMMUTABLE;


ALTER FUNCTION public.postgis_scripts_installed() OWNER TO postgres;

--
-- TOC entry 356 (class 1255 OID 21670)
-- Dependencies: 4
-- Name: postgis_scripts_released(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_scripts_released() RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'postgis_scripts_released'
    LANGUAGE c IMMUTABLE;


ALTER FUNCTION public.postgis_scripts_released() OWNER TO postgres;

--
-- TOC entry 357 (class 1255 OID 21671)
-- Dependencies: 4
-- Name: postgis_uses_stats(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_uses_stats() RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'postgis_uses_stats'
    LANGUAGE c IMMUTABLE;


ALTER FUNCTION public.postgis_uses_stats() OWNER TO postgres;

--
-- TOC entry 352 (class 1255 OID 21666)
-- Dependencies: 4
-- Name: postgis_version(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION postgis_version() RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'postgis_version'
    LANGUAGE c IMMUTABLE;


ALTER FUNCTION public.postgis_version() OWNER TO postgres;

--
-- TOC entry 332 (class 1255 OID 21646)
-- Dependencies: 4 947
-- Name: probe_geometry_columns(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION probe_geometry_columns() RETURNS text
    AS $$
DECLARE
	inserted integer;
	oldcount integer;
	probed integer;
	stale integer;
BEGIN

	SELECT count(*) INTO oldcount FROM geometry_columns;

	SELECT count(*) INTO probed
		FROM pg_class c, pg_attribute a, pg_type t, 
			pg_namespace n,
			pg_constraint sridcheck, pg_constraint typecheck

		WHERE t.typname = 'geometry'
		AND a.atttypid = t.oid
		AND a.attrelid = c.oid
		AND c.relnamespace = n.oid
		AND sridcheck.connamespace = n.oid
		AND typecheck.connamespace = n.oid

		AND sridcheck.conrelid = c.oid
		AND sridcheck.consrc LIKE '(srid('||a.attname||') = %)'
		AND typecheck.conrelid = c.oid
		AND typecheck.consrc LIKE
	'((geometrytype('||a.attname||') = ''%''::text) OR (% IS NULL))'
		;

	INSERT INTO geometry_columns SELECT
		''::varchar as f_table_catalogue,
		n.nspname::varchar as f_table_schema,
		c.relname::varchar as f_table_name,
		a.attname::varchar as f_geometry_column,
		2 as coord_dimension,
		trim(both  ' =)' from substr(sridcheck.consrc,
			strpos(sridcheck.consrc, '=')))::integer as srid,
		trim(both ' =)''' from substr(typecheck.consrc, 
			strpos(typecheck.consrc, '='),
			strpos(typecheck.consrc, '::')-
			strpos(typecheck.consrc, '=')
			))::varchar as type

		FROM pg_class c, pg_attribute a, pg_type t, 
			pg_namespace n,
			pg_constraint sridcheck, pg_constraint typecheck
		WHERE t.typname = 'geometry'
		AND a.atttypid = t.oid
		AND a.attrelid = c.oid
		AND c.relnamespace = n.oid
		AND sridcheck.connamespace = n.oid
		AND typecheck.connamespace = n.oid
		AND sridcheck.conrelid = c.oid
		AND sridcheck.consrc LIKE '(srid('||a.attname||') = %)'
		AND typecheck.conrelid = c.oid
		AND typecheck.consrc LIKE
	'((geometrytype('||a.attname||') = ''%''::text) OR (% IS NULL))'

                AND NOT EXISTS (
                        SELECT oid FROM geometry_columns gc
                        WHERE c.relname::varchar = gc.f_table_name
                        AND n.nspname::varchar = gc.f_table_schema
                        AND a.attname::varchar = gc.f_geometry_column
                );

	GET DIAGNOSTICS inserted = ROW_COUNT;

	IF oldcount > probed THEN
		stale = oldcount-probed;
	ELSE
		stale = 0;
	END IF;

        RETURN 'probed:'||probed::text||
		' inserted:'||inserted::text||
		' conflicts:'||(probed-inserted)::text||
		' stale:'||stale::text;
END

$$
    LANGUAGE plpgsql;


ALTER FUNCTION public.probe_geometry_columns() OWNER TO postgres;

--
-- TOC entry 434 (class 1255 OID 21765)
-- Dependencies: 4 919 919
-- Name: relate(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION relate(geometry, geometry) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'relate_full'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.relate(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 436 (class 1255 OID 21767)
-- Dependencies: 4 919 919
-- Name: relate(geometry, geometry, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION relate(geometry, geometry, text) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'relate_pattern'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.relate(geometry, geometry, text) OWNER TO postgres;

--
-- TOC entry 290 (class 1255 OID 21580)
-- Dependencies: 4 919 919
-- Name: removepoint(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION removepoint(geometry, integer) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_removepoint'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.removepoint(geometry, integer) OWNER TO postgres;

--
-- TOC entry 330 (class 1255 OID 21644)
-- Dependencies: 4
-- Name: rename_geometry_table_constraints(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rename_geometry_table_constraints() RETURNS text
    AS $$
SELECT 'rename_geometry_table_constraint() is obsoleted'::text
$$
    LANGUAGE sql IMMUTABLE;


ALTER FUNCTION public.rename_geometry_table_constraints() OWNER TO postgres;

--
-- TOC entry 241 (class 1255 OID 21531)
-- Dependencies: 4 919 919
-- Name: reverse(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION reverse(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_reverse'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.reverse(geometry) OWNER TO postgres;

--
-- TOC entry 41 (class 1255 OID 21300)
-- Dependencies: 4 919 919
-- Name: rotate(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rotate(geometry, double precision) RETURNS geometry
    AS $_$SELECT rotateZ($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.rotate(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 43 (class 1255 OID 21302)
-- Dependencies: 4 919 919
-- Name: rotatex(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rotatex(geometry, double precision) RETURNS geometry
    AS $_$SELECT affine($1, 1, 0, 0, 0, cos($2), -sin($2), 0, sin($2), cos($2), 0, 0, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.rotatex(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 45 (class 1255 OID 21304)
-- Dependencies: 4 919 919
-- Name: rotatey(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rotatey(geometry, double precision) RETURNS geometry
    AS $_$SELECT affine($1,  cos($2), 0, sin($2),  0, 1, 0,  -sin($2), 0, cos($2), 0,  0, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.rotatey(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 39 (class 1255 OID 21298)
-- Dependencies: 4 919 919
-- Name: rotatez(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION rotatez(geometry, double precision) RETURNS geometry
    AS $_$SELECT affine($1,  cos($2), -sin($2), 0,  sin($2), cos($2), 0,  0, 0, 1,  0, 0, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.rotatez(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 51 (class 1255 OID 21310)
-- Dependencies: 4 919 919
-- Name: scale(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION scale(geometry, double precision, double precision, double precision) RETURNS geometry
    AS $_$SELECT affine($1,  $2, 0, 0,  0, $3, 0,  0, 0, $4,  0, 0, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.scale(geometry, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 53 (class 1255 OID 21312)
-- Dependencies: 4 919 919
-- Name: scale(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION scale(geometry, double precision, double precision) RETURNS geometry
    AS $_$SELECT scale($1, $2, $3, 1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.scale(geometry, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 678 (class 1255 OID 22009)
-- Dependencies: 4 919 919
-- Name: se_envelopesintersect(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION se_envelopesintersect(geometry, geometry) RETURNS boolean
    AS $_$
	SELECT $1 && $2
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.se_envelopesintersect(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 672 (class 1255 OID 22004)
-- Dependencies: 4 919
-- Name: se_is3d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION se_is3d(geometry) RETURNS boolean
    AS $_$
    SELECT CASE ST_zmflag($1)
               WHEN 0 THEN false
               WHEN 1 THEN false
               WHEN 2 THEN true
               WHEN 3 THEN true
               ELSE false
           END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.se_is3d(geometry) OWNER TO postgres;

--
-- TOC entry 673 (class 1255 OID 22005)
-- Dependencies: 4 919
-- Name: se_ismeasured(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION se_ismeasured(geometry) RETURNS boolean
    AS $_$
    SELECT CASE ST_zmflag($1)
               WHEN 0 THEN false
               WHEN 1 THEN true
               WHEN 2 THEN false
               WHEN 3 THEN true
               ELSE false
           END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.se_ismeasured(geometry) OWNER TO postgres;

--
-- TOC entry 679 (class 1255 OID 22010)
-- Dependencies: 4 919 919
-- Name: se_locatealong(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION se_locatealong(geometry, double precision) RETURNS geometry
    AS $_$SELECT locate_between_measures($1, $2, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.se_locatealong(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 680 (class 1255 OID 22011)
-- Dependencies: 4 919 919
-- Name: se_locatebetween(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION se_locatebetween(geometry, double precision, double precision) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_locate_between_m'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.se_locatebetween(geometry, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 676 (class 1255 OID 22007)
-- Dependencies: 4 919
-- Name: se_m(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION se_m(geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_m_point'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.se_m(geometry) OWNER TO postgres;

--
-- TOC entry 675 (class 1255 OID 21857)
-- Dependencies: 4 919
-- Name: se_z(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION se_z(geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_z_point'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.se_z(geometry) OWNER TO postgres;

--
-- TOC entry 402 (class 1255 OID 21729)
-- Dependencies: 4 919 919
-- Name: segmentize(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION segmentize(geometry, double precision) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_segmentize2d'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.segmentize(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 167 (class 1255 OID 21451)
-- Dependencies: 4 923 923
-- Name: setfactor(chip, real); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION setfactor(chip, real) RETURNS chip
    AS '$libdir/liblwgeom.so.1.3', 'CHIP_setFactor'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.setfactor(chip, real) OWNER TO postgres;

--
-- TOC entry 292 (class 1255 OID 21582)
-- Dependencies: 4 919 919 919
-- Name: setpoint(geometry, integer, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION setpoint(geometry, integer, geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_setpoint_linestring'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.setpoint(geometry, integer, geometry) OWNER TO postgres;

--
-- TOC entry 166 (class 1255 OID 21450)
-- Dependencies: 4 923 923
-- Name: setsrid(chip, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION setsrid(chip, integer) RETURNS chip
    AS '$libdir/liblwgeom.so.1.3', 'CHIP_setSRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.setsrid(chip, integer) OWNER TO postgres;

--
-- TOC entry 539 (class 1255 OID 21871)
-- Dependencies: 4 919 919
-- Name: setsrid(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION setsrid(geometry, integer) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_setSRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.setsrid(geometry, integer) OWNER TO postgres;

--
-- TOC entry 57 (class 1255 OID 21316)
-- Dependencies: 4 919 919
-- Name: shift_longitude(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION shift_longitude(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_longitude_shift'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.shift_longitude(geometry) OWNER TO postgres;

--
-- TOC entry 392 (class 1255 OID 21719)
-- Dependencies: 4 919 919
-- Name: simplify(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION simplify(geometry, double precision) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_simplify2d'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.simplify(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 394 (class 1255 OID 21721)
-- Dependencies: 4 919 919
-- Name: snaptogrid(geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION snaptogrid(geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_snaptogrid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.snaptogrid(geometry, double precision, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 396 (class 1255 OID 21723)
-- Dependencies: 4 919 919
-- Name: snaptogrid(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION snaptogrid(geometry, double precision, double precision) RETURNS geometry
    AS $_$SELECT SnapToGrid($1, 0, 0, $2, $3)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.snaptogrid(geometry, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 398 (class 1255 OID 21725)
-- Dependencies: 4 919 919
-- Name: snaptogrid(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION snaptogrid(geometry, double precision) RETURNS geometry
    AS $_$SELECT SnapToGrid($1, 0, 0, $2, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.snaptogrid(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 400 (class 1255 OID 21727)
-- Dependencies: 4 919 919 919
-- Name: snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_snaptogrid_pointoff'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 15 (class 1255 OID 21277)
-- Dependencies: 4 917
-- Name: spheroid_in(cstring); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION spheroid_in(cstring) RETURNS spheroid
    AS '$libdir/liblwgeom.so.1.3', 'ellipsoid_in'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.spheroid_in(cstring) OWNER TO postgres;

--
-- TOC entry 17 (class 1255 OID 21279)
-- Dependencies: 4 917
-- Name: spheroid_out(spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION spheroid_out(spheroid) RETURNS cstring
    AS '$libdir/liblwgeom.so.1.3', 'ellipsoid_out'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.spheroid_out(spheroid) OWNER TO postgres;

--
-- TOC entry 154 (class 1255 OID 21438)
-- Dependencies: 4 923
-- Name: srid(chip); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION srid(chip) RETURNS integer
    AS '$libdir/liblwgeom.so.1.3', 'CHIP_getSRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.srid(chip) OWNER TO postgres;

--
-- TOC entry 537 (class 1255 OID 21869)
-- Dependencies: 4 919
-- Name: srid(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION srid(geometry) RETURNS integer
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_getSRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.srid(geometry) OWNER TO postgres;

--
-- TOC entry 149 (class 1255 OID 21433)
-- Dependencies: 4 919 919
-- Name: st_addbbox(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_addbbox(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_addBBOX'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_addbbox(geometry) OWNER TO postgres;

--
-- TOC entry 287 (class 1255 OID 21577)
-- Dependencies: 4 919 919 919
-- Name: st_addpoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_addpoint(geometry, geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_addpoint'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_addpoint(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 289 (class 1255 OID 21579)
-- Dependencies: 4 919 919 919
-- Name: st_addpoint(geometry, geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_addpoint(geometry, geometry, integer) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_addpoint'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_addpoint(geometry, geometry, integer) OWNER TO postgres;

--
-- TOC entry 36 (class 1255 OID 21295)
-- Dependencies: 4 919 919
-- Name: st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_affine'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 38 (class 1255 OID 21297)
-- Dependencies: 4 919 919
-- Name: st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS geometry
    AS $_$SELECT affine($1,  $2, $3, 0,  $4, $5, 0,  0, 0, 1,  $6, $7, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_affine(geometry, double precision, double precision, double precision, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 198 (class 1255 OID 21482)
-- Dependencies: 4 919
-- Name: st_area(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_area(geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_area_polygon'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_area(geometry) OWNER TO postgres;

--
-- TOC entry 196 (class 1255 OID 21480)
-- Dependencies: 4 919
-- Name: st_area2d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_area2d(geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_area_polygon'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_area2d(geometry) OWNER TO postgres;

--
-- TOC entry 542 (class 1255 OID 21874)
-- Dependencies: 4 919
-- Name: st_asbinary(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asbinary(geometry) RETURNS bytea
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_asBinary'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_asbinary(geometry) OWNER TO postgres;

--
-- TOC entry 544 (class 1255 OID 21876)
-- Dependencies: 4 919
-- Name: st_asbinary(geometry, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asbinary(geometry, text) RETURNS bytea
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_asBinary'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_asbinary(geometry, text) OWNER TO postgres;

--
-- TOC entry 256 (class 1255 OID 21546)
-- Dependencies: 4 919
-- Name: st_asewkb(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asewkb(geometry) RETURNS bytea
    AS '$libdir/liblwgeom.so.1.3', 'WKBFromLWGEOM'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_asewkb(geometry) OWNER TO postgres;

--
-- TOC entry 262 (class 1255 OID 21552)
-- Dependencies: 4 919
-- Name: st_asewkb(geometry, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asewkb(geometry, text) RETURNS bytea
    AS '$libdir/liblwgeom.so.1.3', 'WKBFromLWGEOM'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_asewkb(geometry, text) OWNER TO postgres;

--
-- TOC entry 254 (class 1255 OID 21544)
-- Dependencies: 4 919
-- Name: st_asewkt(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asewkt(geometry) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_asEWKT'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_asewkt(geometry) OWNER TO postgres;

--
-- TOC entry 484 (class 1255 OID 21815)
-- Dependencies: 4 919
-- Name: st_asgml(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asgml(geometry, integer, integer) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_asGML'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_asgml(geometry, integer, integer) OWNER TO postgres;

--
-- TOC entry 486 (class 1255 OID 21817)
-- Dependencies: 4 919
-- Name: st_asgml(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asgml(geometry, integer) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_asGML'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_asgml(geometry, integer) OWNER TO postgres;

--
-- TOC entry 488 (class 1255 OID 21819)
-- Dependencies: 4 919
-- Name: st_asgml(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asgml(geometry) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_asGML'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_asgml(geometry) OWNER TO postgres;

--
-- TOC entry 258 (class 1255 OID 21548)
-- Dependencies: 4 919
-- Name: st_ashexewkb(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_ashexewkb(geometry) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_asHEXEWKB'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_ashexewkb(geometry) OWNER TO postgres;

--
-- TOC entry 260 (class 1255 OID 21550)
-- Dependencies: 4 919
-- Name: st_ashexewkb(geometry, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_ashexewkb(geometry, text) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_asHEXEWKB'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_ashexewkb(geometry, text) OWNER TO postgres;

--
-- TOC entry 496 (class 1255 OID 21827)
-- Dependencies: 4 919
-- Name: st_askml(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_askml(geometry, integer, integer) RETURNS text
    AS $_$SELECT AsUKML(transform($1,4326),$2,$3)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_askml(geometry, integer, integer) OWNER TO postgres;

--
-- TOC entry 498 (class 1255 OID 21829)
-- Dependencies: 4 919
-- Name: st_askml(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_askml(geometry, integer) RETURNS text
    AS $_$SELECT AsUKML(transform($1,4326),$2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_askml(geometry, integer) OWNER TO postgres;

--
-- TOC entry 500 (class 1255 OID 21831)
-- Dependencies: 4 919
-- Name: st_askml(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_askml(geometry) RETURNS text
    AS $_$SELECT AsUKML(transform($1,4326))$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_askml(geometry) OWNER TO postgres;

--
-- TOC entry 478 (class 1255 OID 21809)
-- Dependencies: 4 919
-- Name: st_assvg(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_assvg(geometry, integer, integer) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'assvg_geometry'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_assvg(geometry, integer, integer) OWNER TO postgres;

--
-- TOC entry 480 (class 1255 OID 21811)
-- Dependencies: 4 919
-- Name: st_assvg(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_assvg(geometry, integer) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'assvg_geometry'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_assvg(geometry, integer) OWNER TO postgres;

--
-- TOC entry 482 (class 1255 OID 21813)
-- Dependencies: 4 919
-- Name: st_assvg(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_assvg(geometry) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'assvg_geometry'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_assvg(geometry) OWNER TO postgres;

--
-- TOC entry 546 (class 1255 OID 21878)
-- Dependencies: 4 919
-- Name: st_astext(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_astext(geometry) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_asText'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_astext(geometry) OWNER TO postgres;

--
-- TOC entry 490 (class 1255 OID 21821)
-- Dependencies: 4 919
-- Name: st_asukml(geometry, integer, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asukml(geometry, integer, integer) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_asKML'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_asukml(geometry, integer, integer) OWNER TO postgres;

--
-- TOC entry 492 (class 1255 OID 21823)
-- Dependencies: 4 919
-- Name: st_asukml(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asukml(geometry, integer) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_asKML'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_asukml(geometry, integer) OWNER TO postgres;

--
-- TOC entry 494 (class 1255 OID 21825)
-- Dependencies: 4 919
-- Name: st_asukml(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_asukml(geometry) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_asKML'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_asukml(geometry) OWNER TO postgres;

--
-- TOC entry 210 (class 1255 OID 21494)
-- Dependencies: 4 919 919
-- Name: st_azimuth(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_azimuth(geometry, geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_azimuth'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_azimuth(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 654 (class 1255 OID 21986)
-- Dependencies: 4 947 919
-- Name: st_bdmpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_bdmpolyfromtext(text, integer) RETURNS geometry
    AS $_$
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline geometry;
	geom geometry;
BEGIN
	mline := MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := multi(BuildArea(mline));

	RETURN geom;
END;
$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


ALTER FUNCTION public.st_bdmpolyfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 652 (class 1255 OID 21984)
-- Dependencies: 4 947 919
-- Name: st_bdpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_bdpolyfromtext(text, integer) RETURNS geometry
    AS $_$
DECLARE
	geomtext alias for $1;
	srid alias for $2;
	mline geometry;
	geom geometry;
BEGIN
	mline := MultiLineStringFromText(geomtext, srid);

	IF mline IS NULL
	THEN
		RAISE EXCEPTION 'Input is not a MultiLinestring';
	END IF;

	geom := BuildArea(mline);

	IF GeometryType(geom) != 'POLYGON'
	THEN
		RAISE EXCEPTION 'Input returns more then a single polygon, try using BdMPolyFromText instead';
	END IF;

	RETURN geom;
END;
$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


ALTER FUNCTION public.st_bdpolyfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 425 (class 1255 OID 21752)
-- Dependencies: 4 919 919
-- Name: st_boundary(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_boundary(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'boundary'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_boundary(geometry) OWNER TO postgres;

--
-- TOC entry 368 (class 1255 OID 21682)
-- Dependencies: 4 919
-- Name: st_box(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_box(geometry) RETURNS box
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_to_BOX'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_box(geometry) OWNER TO postgres;

--
-- TOC entry 374 (class 1255 OID 21688)
-- Dependencies: 4 921
-- Name: st_box(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_box(box3d) RETURNS box
    AS '$libdir/liblwgeom.so.1.3', 'BOX3D_to_BOX'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_box(box3d) OWNER TO postgres;

--
-- TOC entry 364 (class 1255 OID 21678)
-- Dependencies: 4 925 919
-- Name: st_box2d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_box2d(geometry) RETURNS box2d
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_to_BOX2DFLOAT4'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_box2d(geometry) OWNER TO postgres;

--
-- TOC entry 370 (class 1255 OID 21684)
-- Dependencies: 4 925 921
-- Name: st_box2d(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_box2d(box3d) RETURNS box2d
    AS '$libdir/liblwgeom.so.1.3', 'BOX3D_to_BOX2DFLOAT4'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_box2d(box3d) OWNER TO postgres;

--
-- TOC entry 92 (class 1255 OID 21357)
-- Dependencies: 4 925 925
-- Name: st_box2d_contain(box2d, box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_box2d_contain(box2d, box2d) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'BOX2D_contain'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_box2d_contain(box2d, box2d) OWNER TO postgres;

--
-- TOC entry 94 (class 1255 OID 21359)
-- Dependencies: 4 925 925
-- Name: st_box2d_contained(box2d, box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_box2d_contained(box2d, box2d) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'BOX2D_contained'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_box2d_contained(box2d, box2d) OWNER TO postgres;

--
-- TOC entry 100 (class 1255 OID 21365)
-- Dependencies: 4 925 925
-- Name: st_box2d_intersects(box2d, box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_box2d_intersects(box2d, box2d) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'BOX2D_intersects'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_box2d_intersects(box2d, box2d) OWNER TO postgres;

--
-- TOC entry 88 (class 1255 OID 21353)
-- Dependencies: 4 925 925
-- Name: st_box2d_left(box2d, box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_box2d_left(box2d, box2d) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'BOX2D_left'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_box2d_left(box2d, box2d) OWNER TO postgres;

--
-- TOC entry 96 (class 1255 OID 21361)
-- Dependencies: 4 925 925
-- Name: st_box2d_overlap(box2d, box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_box2d_overlap(box2d, box2d) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'BOX2D_overlap'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_box2d_overlap(box2d, box2d) OWNER TO postgres;

--
-- TOC entry 84 (class 1255 OID 21349)
-- Dependencies: 4 925 925
-- Name: st_box2d_overleft(box2d, box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_box2d_overleft(box2d, box2d) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'BOX2D_overleft'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_box2d_overleft(box2d, box2d) OWNER TO postgres;

--
-- TOC entry 86 (class 1255 OID 21351)
-- Dependencies: 4 925 925
-- Name: st_box2d_overright(box2d, box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_box2d_overright(box2d, box2d) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'BOX2D_overright'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_box2d_overright(box2d, box2d) OWNER TO postgres;

--
-- TOC entry 90 (class 1255 OID 21355)
-- Dependencies: 4 925 925
-- Name: st_box2d_right(box2d, box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_box2d_right(box2d, box2d) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'BOX2D_right'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_box2d_right(box2d, box2d) OWNER TO postgres;

--
-- TOC entry 98 (class 1255 OID 21363)
-- Dependencies: 4 925 925
-- Name: st_box2d_same(box2d, box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_box2d_same(box2d, box2d) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'BOX2D_same'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_box2d_same(box2d, box2d) OWNER TO postgres;

--
-- TOC entry 366 (class 1255 OID 21680)
-- Dependencies: 4 921 919
-- Name: st_box3d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_box3d(geometry) RETURNS box3d
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_to_BOX3D'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_box3d(geometry) OWNER TO postgres;

--
-- TOC entry 372 (class 1255 OID 21686)
-- Dependencies: 4 921 925
-- Name: st_box3d(box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_box3d(box2d) RETURNS box3d
    AS '$libdir/liblwgeom.so.1.3', 'BOX2DFLOAT4_to_BOX3D'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_box3d(box2d) OWNER TO postgres;

--
-- TOC entry 417 (class 1255 OID 21744)
-- Dependencies: 4 919 919
-- Name: st_buffer(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_buffer(geometry, double precision) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'buffer'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_buffer(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 419 (class 1255 OID 21746)
-- Dependencies: 4 919 919
-- Name: st_buffer(geometry, double precision, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_buffer(geometry, double precision, integer) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'buffer'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_buffer(geometry, double precision, integer) OWNER TO postgres;

--
-- TOC entry 315 (class 1255 OID 21615)
-- Dependencies: 4 878 878
-- Name: st_build_histogram2d(histogram2d, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_build_histogram2d(histogram2d, text, text) RETURNS histogram2d
    AS '$libdir/liblwgeom.so.1.3', 'build_lwhistogram2d'
    LANGUAGE c STABLE STRICT;


ALTER FUNCTION public.st_build_histogram2d(histogram2d, text, text) OWNER TO postgres;

--
-- TOC entry 317 (class 1255 OID 21617)
-- Dependencies: 4 947 878 878
-- Name: st_build_histogram2d(histogram2d, text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_build_histogram2d(histogram2d, text, text, text) RETURNS histogram2d
    AS $_$
BEGIN
	EXECUTE 'SET local search_path = '||$2||',public';
	RETURN public.build_histogram2d($1,$3,$4);
END
$_$
    LANGUAGE plpgsql STABLE STRICT;


ALTER FUNCTION public.st_build_histogram2d(histogram2d, text, text, text) OWNER TO postgres;

--
-- TOC entry 299 (class 1255 OID 21591)
-- Dependencies: 4 919 919
-- Name: st_buildarea(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_buildarea(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_buildarea'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_buildarea(geometry) OWNER TO postgres;

--
-- TOC entry 389 (class 1255 OID 21703)
-- Dependencies: 4 919
-- Name: st_bytea(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_bytea(geometry) RETURNS bytea
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_to_bytea'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_bytea(geometry) OWNER TO postgres;

--
-- TOC entry 268 (class 1255 OID 21558)
-- Dependencies: 4
-- Name: st_cache_bbox(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_cache_bbox() RETURNS "trigger"
    AS '$libdir/liblwgeom.so.1.3', 'cache_bbox'
    LANGUAGE c;


ALTER FUNCTION public.st_cache_bbox() OWNER TO postgres;

--
-- TOC entry 468 (class 1255 OID 21799)
-- Dependencies: 4 919 919
-- Name: st_centroid(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_centroid(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'centroid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_centroid(geometry) OWNER TO postgres;

--
-- TOC entry 228 (class 1255 OID 21512)
-- Dependencies: 4 919 919 919
-- Name: st_collect(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_collect(geometry, geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_collect'
    LANGUAGE c IMMUTABLE;


ALTER FUNCTION public.st_collect(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 232 (class 1255 OID 21520)
-- Dependencies: 4 919 920
-- Name: st_collect_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_collect_garray(geometry[]) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_collect_garray'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_collect_garray(geometry[]) OWNER TO postgres;

--
-- TOC entry 226 (class 1255 OID 21510)
-- Dependencies: 4 919 919 919
-- Name: st_collector(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_collector(geometry, geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_collect'
    LANGUAGE c IMMUTABLE;


ALTER FUNCTION public.st_collector(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 309 (class 1255 OID 21605)
-- Dependencies: 4 925 925 919
-- Name: st_combine_bbox(box2d, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_combine_bbox(box2d, geometry) RETURNS box2d
    AS '$libdir/liblwgeom.so.1.3', 'BOX2DFLOAT4_combine'
    LANGUAGE c IMMUTABLE;


ALTER FUNCTION public.st_combine_bbox(box2d, geometry) OWNER TO postgres;

--
-- TOC entry 311 (class 1255 OID 21609)
-- Dependencies: 4 921 921 919
-- Name: st_combine_bbox(box3d, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_combine_bbox(box3d, geometry) RETURNS box3d
    AS '$libdir/liblwgeom.so.1.3', 'BOX3D_combine'
    LANGUAGE c IMMUTABLE;


ALTER FUNCTION public.st_combine_bbox(box3d, geometry) OWNER TO postgres;

--
-- TOC entry 165 (class 1255 OID 21449)
-- Dependencies: 4 923
-- Name: st_compression(chip); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_compression(chip) RETURNS integer
    AS '$libdir/liblwgeom.so.1.3', 'CHIP_getCompression'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_compression(chip) OWNER TO postgres;

--
-- TOC entry 455 (class 1255 OID 21786)
-- Dependencies: 4 919 919
-- Name: st_contains(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_contains(geometry, geometry) RETURNS boolean
    AS $_$SELECT $1 && $2 AND _ST_Contains($1,$2)$_$
    LANGUAGE sql IMMUTABLE;


ALTER FUNCTION public.st_contains(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 421 (class 1255 OID 21748)
-- Dependencies: 4 919 919
-- Name: st_convexhull(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_convexhull(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'convexhull'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_convexhull(geometry) OWNER TO postgres;

--
-- TOC entry 670 (class 1255 OID 22002)
-- Dependencies: 4 919
-- Name: st_coorddim(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_coorddim(geometry) RETURNS smallint
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_ndims'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_coorddim(geometry) OWNER TO postgres;

--
-- TOC entry 457 (class 1255 OID 21788)
-- Dependencies: 4 919 919
-- Name: st_coveredby(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_coveredby(geometry, geometry) RETURNS boolean
    AS $_$SELECT $1 && $2 AND _ST_CoveredBy($1,$2)$_$
    LANGUAGE sql IMMUTABLE;


ALTER FUNCTION public.st_coveredby(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 459 (class 1255 OID 21790)
-- Dependencies: 4 919 919
-- Name: st_covers(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_covers(geometry, geometry) RETURNS boolean
    AS $_$SELECT $1 && $2 AND _ST_Covers($1,$2)$_$
    LANGUAGE sql IMMUTABLE;


ALTER FUNCTION public.st_covers(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 313 (class 1255 OID 21613)
-- Dependencies: 4 878 925
-- Name: st_create_histogram2d(box2d, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_create_histogram2d(box2d, integer) RETURNS histogram2d
    AS '$libdir/liblwgeom.so.1.3', 'create_lwhistogram2d'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_create_histogram2d(box2d, integer) OWNER TO postgres;

--
-- TOC entry 449 (class 1255 OID 21780)
-- Dependencies: 4 919 919
-- Name: st_crosses(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_crosses(geometry, geometry) RETURNS boolean
    AS $_$SELECT $1 && $2 AND _ST_Crosses($1,$2)$_$
    LANGUAGE sql IMMUTABLE;


ALTER FUNCTION public.st_crosses(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 681 (class 1255 OID 22012)
-- Dependencies: 4 919 919
-- Name: st_curvetoline(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_curvetoline(geometry, integer) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_curve_segmentize'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_curvetoline(geometry, integer) OWNER TO postgres;

--
-- TOC entry 682 (class 1255 OID 22013)
-- Dependencies: 4 919 919
-- Name: st_curvetoline(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_curvetoline(geometry) RETURNS geometry
    AS $_$SELECT ST_CurveToLine($1, 32)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_curvetoline(geometry) OWNER TO postgres;

--
-- TOC entry 163 (class 1255 OID 21447)
-- Dependencies: 4 923
-- Name: st_datatype(chip); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_datatype(chip) RETURNS integer
    AS '$libdir/liblwgeom.so.1.3', 'CHIP_getDatatype'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_datatype(chip) OWNER TO postgres;

--
-- TOC entry 423 (class 1255 OID 21750)
-- Dependencies: 4 919 919 919
-- Name: st_difference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_difference(geometry, geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'difference'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_difference(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 508 (class 1255 OID 21839)
-- Dependencies: 4 919
-- Name: st_dimension(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_dimension(geometry) RETURNS integer
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_dimension'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_dimension(geometry) OWNER TO postgres;

--
-- TOC entry 439 (class 1255 OID 21770)
-- Dependencies: 4 919 919
-- Name: st_disjoint(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_disjoint(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'disjoint'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_disjoint(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 204 (class 1255 OID 21488)
-- Dependencies: 4 919 919
-- Name: st_distance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_distance(geometry, geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_mindistance2d'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_distance(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 202 (class 1255 OID 21486)
-- Dependencies: 4 919 919
-- Name: st_distance_sphere(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_distance_sphere(geometry, geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_distance_sphere'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_distance_sphere(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 200 (class 1255 OID 21484)
-- Dependencies: 4 919 919 917
-- Name: st_distance_spheroid(geometry, geometry, spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_distance_spheroid(geometry, geometry, spheroid) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_distance_ellipsoid_point'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_distance_spheroid(geometry, geometry, spheroid) OWNER TO postgres;

--
-- TOC entry 151 (class 1255 OID 21435)
-- Dependencies: 4 919 919
-- Name: st_dropbbox(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_dropbbox(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_dropBBOX'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_dropbbox(geometry) OWNER TO postgres;

--
-- TOC entry 305 (class 1255 OID 21601)
-- Dependencies: 4 927 919
-- Name: st_dump(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_dump(geometry) RETURNS SETOF geometry_dump
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_dump'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_dump(geometry) OWNER TO postgres;

--
-- TOC entry 307 (class 1255 OID 21603)
-- Dependencies: 4 927 919
-- Name: st_dumprings(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_dumprings(geometry) RETURNS SETOF geometry_dump
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_dump_rings'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_dumprings(geometry) OWNER TO postgres;

--
-- TOC entry 443 (class 1255 OID 21774)
-- Dependencies: 4 919 919
-- Name: st_dwithin(geometry, geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_dwithin(geometry, geometry, double precision) RETURNS boolean
    AS $_$SELECT $1 && ST_Expand($2,$3) AND $2 && ST_Expand($1,$3) AND ST_Distance($1, $2) < $3$_$
    LANGUAGE sql IMMUTABLE;


ALTER FUNCTION public.st_dwithin(geometry, geometry, double precision) OWNER TO postgres;

--
-- TOC entry 532 (class 1255 OID 21864)
-- Dependencies: 4 919 919
-- Name: st_endpoint(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_endpoint(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_endpoint_linestring'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_endpoint(geometry) OWNER TO postgres;

--
-- TOC entry 240 (class 1255 OID 21530)
-- Dependencies: 4 919 919
-- Name: st_envelope(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_envelope(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_envelope'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_envelope(geometry) OWNER TO postgres;

--
-- TOC entry 476 (class 1255 OID 21807)
-- Dependencies: 4 919 919
-- Name: st_equals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_equals(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'geomequals'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_equals(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 321 (class 1255 OID 21621)
-- Dependencies: 4 878 925
-- Name: st_estimate_histogram2d(histogram2d, box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_estimate_histogram2d(histogram2d, box2d) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'estimate_lwhistogram2d'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_estimate_histogram2d(histogram2d, box2d) OWNER TO postgres;

--
-- TOC entry 323 (class 1255 OID 21623)
-- Dependencies: 4 925
-- Name: st_estimated_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_estimated_extent(text, text, text) RETURNS box2d
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_estimated_extent'
    LANGUAGE c IMMUTABLE STRICT SECURITY DEFINER;


ALTER FUNCTION public.st_estimated_extent(text, text, text) OWNER TO postgres;

--
-- TOC entry 325 (class 1255 OID 21625)
-- Dependencies: 4 925
-- Name: st_estimated_extent(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_estimated_extent(text, text) RETURNS box2d
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_estimated_extent'
    LANGUAGE c IMMUTABLE STRICT SECURITY DEFINER;


ALTER FUNCTION public.st_estimated_extent(text, text) OWNER TO postgres;

--
-- TOC entry 234 (class 1255 OID 21524)
-- Dependencies: 4 921 921
-- Name: st_expand(box3d, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_expand(box3d, double precision) RETURNS box3d
    AS '$libdir/liblwgeom.so.1.3', 'BOX3D_expand'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_expand(box3d, double precision) OWNER TO postgres;

--
-- TOC entry 236 (class 1255 OID 21526)
-- Dependencies: 4 925 925
-- Name: st_expand(box2d, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_expand(box2d, double precision) RETURNS box2d
    AS '$libdir/liblwgeom.so.1.3', 'BOX2DFLOAT4_expand'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_expand(box2d, double precision) OWNER TO postgres;

--
-- TOC entry 238 (class 1255 OID 21528)
-- Dependencies: 4 919 919
-- Name: st_expand(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_expand(geometry, double precision) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_expand'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_expand(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 319 (class 1255 OID 21619)
-- Dependencies: 4 878 878
-- Name: st_explode_histogram2d(histogram2d, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_explode_histogram2d(histogram2d, text) RETURNS histogram2d
    AS '$libdir/liblwgeom.so.1.3', 'explode_lwhistogram2d'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_explode_histogram2d(histogram2d, text) OWNER TO postgres;

--
-- TOC entry 510 (class 1255 OID 21841)
-- Dependencies: 4 919 919
-- Name: st_exteriorring(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_exteriorring(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_exteriorring_polygon'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_exteriorring(geometry) OWNER TO postgres;

--
-- TOC entry 159 (class 1255 OID 21443)
-- Dependencies: 4 923
-- Name: st_factor(chip); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_factor(chip) RETURNS real
    AS '$libdir/liblwgeom.so.1.3', 'CHIP_getFactor'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_factor(chip) OWNER TO postgres;

--
-- TOC entry 327 (class 1255 OID 21627)
-- Dependencies: 4 947 925
-- Name: st_find_extent(text, text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_find_extent(text, text, text) RETURNS box2d
    AS $_$
DECLARE
	schemaname alias for $1;
	tablename alias for $2;
	columnname alias for $3;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT extent("'||columnname||'") FROM "'||schemaname||'"."'||tablename||'"' LOOP
		return myrec.extent;
	END LOOP; 
END;
$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


ALTER FUNCTION public.st_find_extent(text, text, text) OWNER TO postgres;

--
-- TOC entry 329 (class 1255 OID 21629)
-- Dependencies: 4 947 925
-- Name: st_find_extent(text, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_find_extent(text, text) RETURNS box2d
    AS $_$
DECLARE
	tablename alias for $1;
	columnname alias for $2;
	myrec RECORD;

BEGIN
	FOR myrec IN EXECUTE 'SELECT extent("'||columnname||'") FROM "'||tablename||'"' LOOP
		return myrec.extent;
	END LOOP; 
END;
$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


ALTER FUNCTION public.st_find_extent(text, text) OWNER TO postgres;

--
-- TOC entry 212 (class 1255 OID 21496)
-- Dependencies: 4 919 919
-- Name: st_force_2d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_force_2d(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_force_2d'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_force_2d(geometry) OWNER TO postgres;

--
-- TOC entry 216 (class 1255 OID 21500)
-- Dependencies: 4 919 919
-- Name: st_force_3d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_force_3d(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_force_3dz'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_force_3d(geometry) OWNER TO postgres;

--
-- TOC entry 218 (class 1255 OID 21502)
-- Dependencies: 4 919 919
-- Name: st_force_3dm(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_force_3dm(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_force_3dm'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_force_3dm(geometry) OWNER TO postgres;

--
-- TOC entry 214 (class 1255 OID 21498)
-- Dependencies: 4 919 919
-- Name: st_force_3dz(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_force_3dz(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_force_3dz'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_force_3dz(geometry) OWNER TO postgres;

--
-- TOC entry 220 (class 1255 OID 21504)
-- Dependencies: 4 919 919
-- Name: st_force_4d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_force_4d(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_force_4d'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_force_4d(geometry) OWNER TO postgres;

--
-- TOC entry 222 (class 1255 OID 21506)
-- Dependencies: 4 919 919
-- Name: st_force_collection(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_force_collection(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_force_collection'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_force_collection(geometry) OWNER TO postgres;

--
-- TOC entry 244 (class 1255 OID 21534)
-- Dependencies: 4 919 919
-- Name: st_forcerhr(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_forcerhr(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_forceRHR_poly'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_forcerhr(geometry) OWNER TO postgres;

--
-- TOC entry 230 (class 1255 OID 21516)
-- Dependencies: 4 920 920 919
-- Name: st_geom_accum(geometry[], geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geom_accum(geometry[], geometry) RETURNS geometry[]
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_accum'
    LANGUAGE c IMMUTABLE;


ALTER FUNCTION public.st_geom_accum(geometry[], geometry) OWNER TO postgres;

--
-- TOC entry 597 (class 1255 OID 21929)
-- Dependencies: 4 919
-- Name: st_geomcollfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomcollfromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_geomcollfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 599 (class 1255 OID 21931)
-- Dependencies: 4 919
-- Name: st_geomcollfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomcollfromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_geomcollfromtext(text) OWNER TO postgres;

--
-- TOC entry 648 (class 1255 OID 21980)
-- Dependencies: 4 919
-- Name: st_geomcollfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomcollfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromWKB($1, $2)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_geomcollfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 650 (class 1255 OID 21982)
-- Dependencies: 4 919
-- Name: st_geomcollfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomcollfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromWKB($1)) = 'GEOMETRYCOLLECTION'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_geomcollfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 379 (class 1255 OID 21693)
-- Dependencies: 4 919 925
-- Name: st_geometry(box2d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometry(box2d) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'BOX2DFLOAT4_to_LWGEOM'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geometry(box2d) OWNER TO postgres;

--
-- TOC entry 381 (class 1255 OID 21695)
-- Dependencies: 4 919 921
-- Name: st_geometry(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometry(box3d) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'BOX3D_to_LWGEOM'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geometry(box3d) OWNER TO postgres;

--
-- TOC entry 383 (class 1255 OID 21697)
-- Dependencies: 4 919
-- Name: st_geometry(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometry(text) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'parse_WKT_lwgeom'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geometry(text) OWNER TO postgres;

--
-- TOC entry 385 (class 1255 OID 21699)
-- Dependencies: 4 919 923
-- Name: st_geometry(chip); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometry(chip) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'CHIP_to_LWGEOM'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geometry(chip) OWNER TO postgres;

--
-- TOC entry 387 (class 1255 OID 21701)
-- Dependencies: 4 919
-- Name: st_geometry(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometry(bytea) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_from_bytea'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geometry(bytea) OWNER TO postgres;

--
-- TOC entry 130 (class 1255 OID 21401)
-- Dependencies: 4 919 919
-- Name: st_geometry_above(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometry_above(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_above'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geometry_above(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 132 (class 1255 OID 21403)
-- Dependencies: 4 919 919
-- Name: st_geometry_below(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometry_below(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_below'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geometry_below(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 112 (class 1255 OID 21377)
-- Dependencies: 4 919 919
-- Name: st_geometry_cmp(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometry_cmp(geometry, geometry) RETURNS integer
    AS '$libdir/liblwgeom.so.1.3', 'lwgeom_cmp'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geometry_cmp(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 134 (class 1255 OID 21405)
-- Dependencies: 4 919 919
-- Name: st_geometry_contain(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometry_contain(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_contain'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geometry_contain(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 136 (class 1255 OID 21407)
-- Dependencies: 4 919 919
-- Name: st_geometry_contained(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometry_contained(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_contained'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geometry_contained(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 110 (class 1255 OID 21375)
-- Dependencies: 4 919 919
-- Name: st_geometry_eq(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometry_eq(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'lwgeom_eq'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geometry_eq(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 108 (class 1255 OID 21373)
-- Dependencies: 4 919 919
-- Name: st_geometry_ge(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometry_ge(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'lwgeom_ge'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geometry_ge(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 106 (class 1255 OID 21371)
-- Dependencies: 4 919 919
-- Name: st_geometry_gt(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometry_gt(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'lwgeom_gt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geometry_gt(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 104 (class 1255 OID 21369)
-- Dependencies: 4 919 919
-- Name: st_geometry_le(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometry_le(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'lwgeom_le'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geometry_le(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 126 (class 1255 OID 21397)
-- Dependencies: 4 919 919
-- Name: st_geometry_left(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometry_left(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_left'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geometry_left(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 102 (class 1255 OID 21367)
-- Dependencies: 4 919 919
-- Name: st_geometry_lt(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometry_lt(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'lwgeom_lt'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geometry_lt(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 122 (class 1255 OID 21393)
-- Dependencies: 4 919 919
-- Name: st_geometry_overabove(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometry_overabove(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_overabove'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geometry_overabove(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 124 (class 1255 OID 21395)
-- Dependencies: 4 919 919
-- Name: st_geometry_overbelow(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometry_overbelow(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_overbelow'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geometry_overbelow(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 138 (class 1255 OID 21409)
-- Dependencies: 4 919 919
-- Name: st_geometry_overlap(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometry_overlap(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_overlap'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geometry_overlap(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 118 (class 1255 OID 21389)
-- Dependencies: 4 919 919
-- Name: st_geometry_overleft(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometry_overleft(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_overleft'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geometry_overleft(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 120 (class 1255 OID 21391)
-- Dependencies: 4 919 919
-- Name: st_geometry_overright(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometry_overright(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_overright'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geometry_overright(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 128 (class 1255 OID 21399)
-- Dependencies: 4 919 919
-- Name: st_geometry_right(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometry_right(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_right'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geometry_right(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 140 (class 1255 OID 21411)
-- Dependencies: 4 919 919
-- Name: st_geometry_same(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometry_same(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_same'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geometry_same(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 548 (class 1255 OID 21880)
-- Dependencies: 4 919
-- Name: st_geometryfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometryfromtext(text) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_from_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geometryfromtext(text) OWNER TO postgres;

--
-- TOC entry 550 (class 1255 OID 21882)
-- Dependencies: 4 919
-- Name: st_geometryfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometryfromtext(text, integer) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_from_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geometryfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 506 (class 1255 OID 21837)
-- Dependencies: 4 919 919
-- Name: st_geometryn(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometryn(geometry, integer) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_geometryn_collection'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geometryn(geometry, integer) OWNER TO postgres;

--
-- TOC entry 518 (class 1255 OID 21849)
-- Dependencies: 4 947 919
-- Name: st_geometrytype(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geometrytype(geometry) RETURNS text
    AS $_$
    DECLARE
        gtype text := geometrytype($1);
    BEGIN
        IF (gtype IN ('POINT', 'POINTM')) THEN
            gtype := 'Point';
        ELSIF (gtype IN ('LINESTRING', 'LINESTRINGM')) THEN
            gtype := 'LineString';
        ELSIF (gtype IN ('POLYGON', 'POLYGONM')) THEN
            gtype := 'Polygon';
        ELSIF (gtype IN ('MULTIPOINT', 'MULTIPOINTM')) THEN
            gtype := 'MultiPoint';
        ELSIF (gtype IN ('MULTILINESTRING', 'MULTILINESTRINGM')) THEN
            gtype := 'MultiLineString';
        ELSIF (gtype IN ('MULTIPOLYGON', 'MULTIPOLYGONM')) THEN
            gtype := 'MultiPolygon';
        ELSE
            gtype := 'Geometry';
        END IF;
        RETURN 'ST_' || gtype;
    END
	$_$
    LANGUAGE plpgsql IMMUTABLE STRICT;


ALTER FUNCTION public.st_geometrytype(geometry) OWNER TO postgres;

--
-- TOC entry 264 (class 1255 OID 21554)
-- Dependencies: 4 919
-- Name: st_geomfromewkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomfromewkb(bytea) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOMFromWKB'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geomfromewkb(bytea) OWNER TO postgres;

--
-- TOC entry 266 (class 1255 OID 21556)
-- Dependencies: 4 919
-- Name: st_geomfromewkt(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomfromewkt(text) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'parse_WKT_lwgeom'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geomfromewkt(text) OWNER TO postgres;

--
-- TOC entry 552 (class 1255 OID 21884)
-- Dependencies: 4 919
-- Name: st_geomfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomfromtext(text) RETURNS geometry
    AS $_$SELECT geometryfromtext($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_geomfromtext(text) OWNER TO postgres;

--
-- TOC entry 554 (class 1255 OID 21886)
-- Dependencies: 4 919
-- Name: st_geomfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomfromtext(text, integer) RETURNS geometry
    AS $_$SELECT geometryfromtext($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_geomfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 601 (class 1255 OID 21933)
-- Dependencies: 4 919
-- Name: st_geomfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomfromwkb(bytea) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_from_WKB'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_geomfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 603 (class 1255 OID 21935)
-- Dependencies: 4 919
-- Name: st_geomfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_geomfromwkb(bytea, integer) RETURNS geometry
    AS $_$SELECT setSRID(GeomFromWKB($1), $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_geomfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 683 (class 1255 OID 22014)
-- Dependencies: 4 919
-- Name: st_hasarc(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_hasarc(geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_has_arc'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_hasarc(geometry) OWNER TO postgres;

--
-- TOC entry 250 (class 1255 OID 21540)
-- Dependencies: 4 919
-- Name: st_hasbbox(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_hasbbox(geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_hasBBOX'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_hasbbox(geometry) OWNER TO postgres;

--
-- TOC entry 157 (class 1255 OID 21441)
-- Dependencies: 4 923
-- Name: st_height(chip); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_height(chip) RETURNS integer
    AS '$libdir/liblwgeom.so.1.3', 'CHIP_getHeight'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_height(chip) OWNER TO postgres;

--
-- TOC entry 516 (class 1255 OID 21847)
-- Dependencies: 4 919 919
-- Name: st_interiorringn(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_interiorringn(geometry, integer) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_interiorringn_polygon'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_interiorringn(geometry, integer) OWNER TO postgres;

--
-- TOC entry 415 (class 1255 OID 21742)
-- Dependencies: 4 919 919 919
-- Name: st_intersection(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_intersection(geometry, geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'intersection'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_intersection(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 446 (class 1255 OID 21777)
-- Dependencies: 4 919 919
-- Name: st_intersects(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_intersects(geometry, geometry) RETURNS boolean
    AS $_$SELECT $1 && $2 AND _ST_Intersects($1,$2)$_$
    LANGUAGE sql IMMUTABLE;


ALTER FUNCTION public.st_intersects(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 534 (class 1255 OID 21866)
-- Dependencies: 4 919
-- Name: st_isclosed(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_isclosed(geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_isclosed_linestring'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_isclosed(geometry) OWNER TO postgres;

--
-- TOC entry 536 (class 1255 OID 21868)
-- Dependencies: 4 919
-- Name: st_isempty(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_isempty(geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_isempty'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_isempty(geometry) OWNER TO postgres;

--
-- TOC entry 470 (class 1255 OID 21801)
-- Dependencies: 4 919
-- Name: st_isring(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_isring(geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'isring'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_isring(geometry) OWNER TO postgres;

--
-- TOC entry 474 (class 1255 OID 21805)
-- Dependencies: 4 919
-- Name: st_issimple(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_issimple(geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'issimple'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_issimple(geometry) OWNER TO postgres;

--
-- TOC entry 464 (class 1255 OID 21795)
-- Dependencies: 4 919
-- Name: st_isvalid(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_isvalid(geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'isvalid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_isvalid(geometry) OWNER TO postgres;

--
-- TOC entry 182 (class 1255 OID 21466)
-- Dependencies: 4 919
-- Name: st_length(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_length(geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_length2d_linestring'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_length(geometry) OWNER TO postgres;

--
-- TOC entry 180 (class 1255 OID 21464)
-- Dependencies: 4 919
-- Name: st_length2d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_length2d(geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_length2d_linestring'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_length2d(geometry) OWNER TO postgres;

--
-- TOC entry 188 (class 1255 OID 21472)
-- Dependencies: 4 919 917
-- Name: st_length2d_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_length2d_spheroid(geometry, spheroid) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_length2d_ellipsoid_linestring'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_length2d_spheroid(geometry, spheroid) OWNER TO postgres;

--
-- TOC entry 178 (class 1255 OID 21462)
-- Dependencies: 4 919
-- Name: st_length3d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_length3d(geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_length_linestring'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_length3d(geometry) OWNER TO postgres;

--
-- TOC entry 184 (class 1255 OID 21468)
-- Dependencies: 4 919 917
-- Name: st_length3d_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_length3d_spheroid(geometry, spheroid) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_length_ellipsoid_linestring'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_length3d_spheroid(geometry, spheroid) OWNER TO postgres;

--
-- TOC entry 186 (class 1255 OID 21470)
-- Dependencies: 4 919 917
-- Name: st_length_spheroid(geometry, spheroid); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_length_spheroid(geometry, spheroid) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_length_ellipsoid_linestring'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_length_spheroid(geometry, spheroid) OWNER TO postgres;

--
-- TOC entry 405 (class 1255 OID 21732)
-- Dependencies: 4 919 919
-- Name: st_line_interpolate_point(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_line_interpolate_point(geometry, double precision) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_line_interpolate_point'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_line_interpolate_point(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 409 (class 1255 OID 21736)
-- Dependencies: 4 919 919
-- Name: st_line_locate_point(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_line_locate_point(geometry, geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_line_locate_point'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_line_locate_point(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 407 (class 1255 OID 21734)
-- Dependencies: 4 919 919
-- Name: st_line_substring(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_line_substring(geometry, double precision, double precision) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_line_substring'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_line_substring(geometry, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 283 (class 1255 OID 21573)
-- Dependencies: 4 919 919
-- Name: st_linefrommultipoint(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_linefrommultipoint(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_line_from_mpoint'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_linefrommultipoint(geometry) OWNER TO postgres;

--
-- TOC entry 560 (class 1255 OID 21892)
-- Dependencies: 4 919
-- Name: st_linefromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_linefromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'LINESTRING'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_linefromtext(text) OWNER TO postgres;

--
-- TOC entry 562 (class 1255 OID 21894)
-- Dependencies: 4 919
-- Name: st_linefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_linefromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'LINESTRING'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_linefromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 609 (class 1255 OID 21941)
-- Dependencies: 4 919
-- Name: st_linefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_linefromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_linefromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 611 (class 1255 OID 21943)
-- Dependencies: 4 919
-- Name: st_linefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_linefromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'LINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_linefromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 303 (class 1255 OID 21595)
-- Dependencies: 4 919 919
-- Name: st_linemerge(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_linemerge(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'linemerge'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_linemerge(geometry) OWNER TO postgres;

--
-- TOC entry 613 (class 1255 OID 21945)
-- Dependencies: 4 919
-- Name: st_linestringfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_linestringfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'LINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_linestringfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 615 (class 1255 OID 21947)
-- Dependencies: 4 919
-- Name: st_linestringfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_linestringfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'LINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_linestringfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 684 (class 1255 OID 22015)
-- Dependencies: 4 919 919
-- Name: st_linetocurve(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_linetocurve(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_line_desegmentize'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_linetocurve(geometry) OWNER TO postgres;

--
-- TOC entry 413 (class 1255 OID 21740)
-- Dependencies: 4 919 919
-- Name: st_locate_along_measure(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_locate_along_measure(geometry, double precision) RETURNS geometry
    AS $_$SELECT locate_between_measures($1, $2, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_locate_along_measure(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 411 (class 1255 OID 21738)
-- Dependencies: 4 919 919
-- Name: st_locate_between_measures(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_locate_between_measures(geometry, double precision, double precision) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_locate_between_m'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_locate_between_measures(geometry, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 528 (class 1255 OID 21860)
-- Dependencies: 4 919
-- Name: st_m(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_m(geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_m_point'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_m(geometry) OWNER TO postgres;

--
-- TOC entry 277 (class 1255 OID 21567)
-- Dependencies: 4 925 919 919
-- Name: st_makebox2d(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makebox2d(geometry, geometry) RETURNS box2d
    AS '$libdir/liblwgeom.so.1.3', 'BOX2DFLOAT4_construct'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_makebox2d(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 279 (class 1255 OID 21569)
-- Dependencies: 4 921 919 919
-- Name: st_makebox3d(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makebox3d(geometry, geometry) RETURNS box3d
    AS '$libdir/liblwgeom.so.1.3', 'BOX3D_construct'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_makebox3d(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 285 (class 1255 OID 21575)
-- Dependencies: 4 919 919 919
-- Name: st_makeline(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makeline(geometry, geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_makeline'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_makeline(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 281 (class 1255 OID 21571)
-- Dependencies: 4 919 920
-- Name: st_makeline_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makeline_garray(geometry[]) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_makeline_garray'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_makeline_garray(geometry[]) OWNER TO postgres;

--
-- TOC entry 270 (class 1255 OID 21560)
-- Dependencies: 4 919
-- Name: st_makepoint(double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makepoint(double precision, double precision) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_makepoint'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_makepoint(double precision, double precision) OWNER TO postgres;

--
-- TOC entry 272 (class 1255 OID 21562)
-- Dependencies: 4 919
-- Name: st_makepoint(double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makepoint(double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_makepoint'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_makepoint(double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 274 (class 1255 OID 21564)
-- Dependencies: 4 919
-- Name: st_makepoint(double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makepoint(double precision, double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_makepoint'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_makepoint(double precision, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 295 (class 1255 OID 21587)
-- Dependencies: 4 919 919 920
-- Name: st_makepolygon(geometry, geometry[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makepolygon(geometry, geometry[]) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_makepoly'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_makepolygon(geometry, geometry[]) OWNER TO postgres;

--
-- TOC entry 297 (class 1255 OID 21589)
-- Dependencies: 4 919 919
-- Name: st_makepolygon(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_makepolygon(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_makepoly'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_makepolygon(geometry) OWNER TO postgres;

--
-- TOC entry 206 (class 1255 OID 21490)
-- Dependencies: 4 919 919
-- Name: st_max_distance(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_max_distance(geometry, geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_maxdistance2d_linestring'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_max_distance(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 170 (class 1255 OID 21454)
-- Dependencies: 4 919
-- Name: st_mem_size(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mem_size(geometry) RETURNS integer
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_mem_size'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_mem_size(geometry) OWNER TO postgres;

--
-- TOC entry 574 (class 1255 OID 21906)
-- Dependencies: 4 919
-- Name: st_mlinefromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mlinefromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE
	WHEN geometrytype(GeomFromText($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_mlinefromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 576 (class 1255 OID 21908)
-- Dependencies: 4 919
-- Name: st_mlinefromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mlinefromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTILINESTRING'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_mlinefromtext(text) OWNER TO postgres;

--
-- TOC entry 636 (class 1255 OID 21968)
-- Dependencies: 4 919
-- Name: st_mlinefromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mlinefromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_mlinefromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 638 (class 1255 OID 21970)
-- Dependencies: 4 919
-- Name: st_mlinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mlinefromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_mlinefromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 582 (class 1255 OID 21914)
-- Dependencies: 4 919
-- Name: st_mpointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mpointfromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'MULTIPOINT'
	THEN GeomFromText($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_mpointfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 584 (class 1255 OID 21916)
-- Dependencies: 4 919
-- Name: st_mpointfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mpointfromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTIPOINT'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_mpointfromtext(text) OWNER TO postgres;

--
-- TOC entry 625 (class 1255 OID 21957)
-- Dependencies: 4 919
-- Name: st_mpointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mpointfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTIPOINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_mpointfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 627 (class 1255 OID 21959)
-- Dependencies: 4 919
-- Name: st_mpointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mpointfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOINT'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_mpointfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 589 (class 1255 OID 21921)
-- Dependencies: 4 919
-- Name: st_mpolyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mpolyfromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'MULTIPOLYGON'
	THEN GeomFromText($1,$2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_mpolyfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 591 (class 1255 OID 21923)
-- Dependencies: 4 919
-- Name: st_mpolyfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mpolyfromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'MULTIPOLYGON'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_mpolyfromtext(text) OWNER TO postgres;

--
-- TOC entry 640 (class 1255 OID 21972)
-- Dependencies: 4 919
-- Name: st_mpolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mpolyfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_mpolyfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 642 (class 1255 OID 21974)
-- Dependencies: 4 919
-- Name: st_mpolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_mpolyfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_mpolyfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 224 (class 1255 OID 21508)
-- Dependencies: 4 919 919
-- Name: st_multi(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multi(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_force_multi'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_multi(geometry) OWNER TO postgres;

--
-- TOC entry 634 (class 1255 OID 21966)
-- Dependencies: 4 919
-- Name: st_multilinefromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multilinefromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTILINESTRING'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_multilinefromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 578 (class 1255 OID 21910)
-- Dependencies: 4 919
-- Name: st_multilinestringfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multilinestringfromtext(text) RETURNS geometry
    AS $_$SELECT MLineFromText($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_multilinestringfromtext(text) OWNER TO postgres;

--
-- TOC entry 580 (class 1255 OID 21912)
-- Dependencies: 4 919
-- Name: st_multilinestringfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multilinestringfromtext(text, integer) RETURNS geometry
    AS $_$SELECT MLineFromText($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_multilinestringfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 587 (class 1255 OID 21919)
-- Dependencies: 4 919
-- Name: st_multipointfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multipointfromtext(text) RETURNS geometry
    AS $_$SELECT MPointFromText($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_multipointfromtext(text) OWNER TO postgres;

--
-- TOC entry 629 (class 1255 OID 21961)
-- Dependencies: 4 919
-- Name: st_multipointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multipointfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1,$2)) = 'MULTIPOINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_multipointfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 631 (class 1255 OID 21963)
-- Dependencies: 4 919
-- Name: st_multipointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multipointfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOINT'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_multipointfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 644 (class 1255 OID 21976)
-- Dependencies: 4 919
-- Name: st_multipolyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multipolyfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_multipolyfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 646 (class 1255 OID 21978)
-- Dependencies: 4 919
-- Name: st_multipolyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multipolyfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'MULTIPOLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_multipolyfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 593 (class 1255 OID 21925)
-- Dependencies: 4 919
-- Name: st_multipolygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multipolygonfromtext(text, integer) RETURNS geometry
    AS $_$SELECT MPolyFromText($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_multipolygonfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 595 (class 1255 OID 21927)
-- Dependencies: 4 919
-- Name: st_multipolygonfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_multipolygonfromtext(text) RETURNS geometry
    AS $_$SELECT MPolyFromText($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_multipolygonfromtext(text) OWNER TO postgres;

--
-- TOC entry 252 (class 1255 OID 21542)
-- Dependencies: 4 919
-- Name: st_ndims(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_ndims(geometry) RETURNS smallint
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_ndims'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_ndims(geometry) OWNER TO postgres;

--
-- TOC entry 246 (class 1255 OID 21536)
-- Dependencies: 4 919 919
-- Name: st_noop(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_noop(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_noop'
    LANGUAGE c STRICT;


ALTER FUNCTION public.st_noop(geometry) OWNER TO postgres;

--
-- TOC entry 174 (class 1255 OID 21458)
-- Dependencies: 4 919
-- Name: st_npoints(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_npoints(geometry) RETURNS integer
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_npoints'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_npoints(geometry) OWNER TO postgres;

--
-- TOC entry 176 (class 1255 OID 21460)
-- Dependencies: 4 919
-- Name: st_nrings(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_nrings(geometry) RETURNS integer
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_nrings'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_nrings(geometry) OWNER TO postgres;

--
-- TOC entry 504 (class 1255 OID 21835)
-- Dependencies: 4 919
-- Name: st_numgeometries(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_numgeometries(geometry) RETURNS integer
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_numgeometries_collection'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_numgeometries(geometry) OWNER TO postgres;

--
-- TOC entry 514 (class 1255 OID 21845)
-- Dependencies: 4 919
-- Name: st_numinteriorring(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_numinteriorring(geometry) RETURNS integer
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_numinteriorrings_polygon'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_numinteriorring(geometry) OWNER TO postgres;

--
-- TOC entry 512 (class 1255 OID 21843)
-- Dependencies: 4 919
-- Name: st_numinteriorrings(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_numinteriorrings(geometry) RETURNS integer
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_numinteriorrings_polygon'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_numinteriorrings(geometry) OWNER TO postgres;

--
-- TOC entry 502 (class 1255 OID 21833)
-- Dependencies: 4 919
-- Name: st_numpoints(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_numpoints(geometry) RETURNS integer
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_numpoints_linestring'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_numpoints(geometry) OWNER TO postgres;

--
-- TOC entry 671 (class 1255 OID 22003)
-- Dependencies: 4 919 919
-- Name: st_orderingequals(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_orderingequals(geometry, geometry) RETURNS boolean
    AS $_$
    SELECT $1 && $2 AND $1 ~= $2
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_orderingequals(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 462 (class 1255 OID 21793)
-- Dependencies: 4 919 919
-- Name: st_overlaps(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_overlaps(geometry, geometry) RETURNS boolean
    AS $_$SELECT $1 && $2 AND _ST_Overlaps($1,$2)$_$
    LANGUAGE sql IMMUTABLE;


ALTER FUNCTION public.st_overlaps(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 194 (class 1255 OID 21478)
-- Dependencies: 4 919
-- Name: st_perimeter(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_perimeter(geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_perimeter2d_poly'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_perimeter(geometry) OWNER TO postgres;

--
-- TOC entry 192 (class 1255 OID 21476)
-- Dependencies: 4 919
-- Name: st_perimeter2d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_perimeter2d(geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_perimeter2d_poly'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_perimeter2d(geometry) OWNER TO postgres;

--
-- TOC entry 190 (class 1255 OID 21474)
-- Dependencies: 4 919
-- Name: st_perimeter3d(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_perimeter3d(geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_perimeter_poly'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_perimeter3d(geometry) OWNER TO postgres;

--
-- TOC entry 674 (class 1255 OID 22006)
-- Dependencies: 4 919
-- Name: st_point(double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_point(double precision, double precision) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_makepoint'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_point(double precision, double precision) OWNER TO postgres;

--
-- TOC entry 208 (class 1255 OID 21492)
-- Dependencies: 4 919
-- Name: st_point_inside_circle(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_point_inside_circle(geometry, double precision, double precision, double precision) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_inside_circle_point'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_point_inside_circle(geometry, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 556 (class 1255 OID 21888)
-- Dependencies: 4 919
-- Name: st_pointfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_pointfromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'POINT'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_pointfromtext(text) OWNER TO postgres;

--
-- TOC entry 558 (class 1255 OID 21890)
-- Dependencies: 4 919
-- Name: st_pointfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_pointfromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'POINT'
	THEN GeomFromText($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_pointfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 605 (class 1255 OID 21937)
-- Dependencies: 4 919
-- Name: st_pointfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_pointfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'POINT'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_pointfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 607 (class 1255 OID 21939)
-- Dependencies: 4 919
-- Name: st_pointfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_pointfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POINT'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_pointfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 520 (class 1255 OID 21851)
-- Dependencies: 4 919 919
-- Name: st_pointn(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_pointn(geometry, integer) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_pointn_linestring'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_pointn(geometry, integer) OWNER TO postgres;

--
-- TOC entry 472 (class 1255 OID 21803)
-- Dependencies: 4 919 919
-- Name: st_pointonsurface(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_pointonsurface(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'pointonsurface'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_pointonsurface(geometry) OWNER TO postgres;

--
-- TOC entry 566 (class 1255 OID 21898)
-- Dependencies: 4 919
-- Name: st_polyfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_polyfromtext(text) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1)) = 'POLYGON'
	THEN GeomFromText($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_polyfromtext(text) OWNER TO postgres;

--
-- TOC entry 568 (class 1255 OID 21900)
-- Dependencies: 4 919
-- Name: st_polyfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_polyfromtext(text, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromText($1, $2)) = 'POLYGON'
	THEN GeomFromText($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_polyfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 617 (class 1255 OID 21949)
-- Dependencies: 4 919
-- Name: st_polyfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_polyfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1, $2)) = 'POLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_polyfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 619 (class 1255 OID 21951)
-- Dependencies: 4 919
-- Name: st_polyfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_polyfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_polyfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 677 (class 1255 OID 22008)
-- Dependencies: 4 919 919
-- Name: st_polygon(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_polygon(geometry, integer) RETURNS geometry
    AS $_$
	SELECT setSRID(makepolygon($1), $2)
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_polygon(geometry, integer) OWNER TO postgres;

--
-- TOC entry 570 (class 1255 OID 21902)
-- Dependencies: 4 919
-- Name: st_polygonfromtext(text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_polygonfromtext(text, integer) RETURNS geometry
    AS $_$SELECT PolyFromText($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_polygonfromtext(text, integer) OWNER TO postgres;

--
-- TOC entry 572 (class 1255 OID 21904)
-- Dependencies: 4 919
-- Name: st_polygonfromtext(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_polygonfromtext(text) RETURNS geometry
    AS $_$SELECT PolyFromText($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_polygonfromtext(text) OWNER TO postgres;

--
-- TOC entry 621 (class 1255 OID 21953)
-- Dependencies: 4 919
-- Name: st_polygonfromwkb(bytea, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_polygonfromwkb(bytea, integer) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1,$2)) = 'POLYGON'
	THEN GeomFromWKB($1, $2)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_polygonfromwkb(bytea, integer) OWNER TO postgres;

--
-- TOC entry 623 (class 1255 OID 21955)
-- Dependencies: 4 919
-- Name: st_polygonfromwkb(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_polygonfromwkb(bytea) RETURNS geometry
    AS $_$
	SELECT CASE WHEN geometrytype(GeomFromWKB($1)) = 'POLYGON'
	THEN GeomFromWKB($1)
	ELSE NULL END
	$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_polygonfromwkb(bytea) OWNER TO postgres;

--
-- TOC entry 301 (class 1255 OID 21593)
-- Dependencies: 4 919 920
-- Name: st_polygonize_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_polygonize_garray(geometry[]) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'polygonize_garray'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_polygonize_garray(geometry[]) OWNER TO postgres;

--
-- TOC entry 116 (class 1255 OID 21387)
-- Dependencies: 4
-- Name: st_postgis_gist_joinsel(internal, oid, internal, smallint); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_postgis_gist_joinsel(internal, oid, internal, smallint) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_gist_joinsel'
    LANGUAGE c;


ALTER FUNCTION public.st_postgis_gist_joinsel(internal, oid, internal, smallint) OWNER TO postgres;

--
-- TOC entry 114 (class 1255 OID 21385)
-- Dependencies: 4
-- Name: st_postgis_gist_sel(internal, oid, internal, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_postgis_gist_sel(internal, oid, internal, integer) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_gist_sel'
    LANGUAGE c;


ALTER FUNCTION public.st_postgis_gist_sel(internal, oid, internal, integer) OWNER TO postgres;

--
-- TOC entry 435 (class 1255 OID 21766)
-- Dependencies: 4 919 919
-- Name: st_relate(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_relate(geometry, geometry) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'relate_full'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_relate(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 437 (class 1255 OID 21768)
-- Dependencies: 4 919 919
-- Name: st_relate(geometry, geometry, text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_relate(geometry, geometry, text) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'relate_pattern'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_relate(geometry, geometry, text) OWNER TO postgres;

--
-- TOC entry 291 (class 1255 OID 21581)
-- Dependencies: 4 919 919
-- Name: st_removepoint(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_removepoint(geometry, integer) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_removepoint'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_removepoint(geometry, integer) OWNER TO postgres;

--
-- TOC entry 242 (class 1255 OID 21532)
-- Dependencies: 4 919 919
-- Name: st_reverse(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_reverse(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_reverse'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_reverse(geometry) OWNER TO postgres;

--
-- TOC entry 42 (class 1255 OID 21301)
-- Dependencies: 4 919 919
-- Name: st_rotate(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_rotate(geometry, double precision) RETURNS geometry
    AS $_$SELECT rotateZ($1, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_rotate(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 44 (class 1255 OID 21303)
-- Dependencies: 4 919 919
-- Name: st_rotatex(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_rotatex(geometry, double precision) RETURNS geometry
    AS $_$SELECT affine($1, 1, 0, 0, 0, cos($2), -sin($2), 0, sin($2), cos($2), 0, 0, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_rotatex(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 46 (class 1255 OID 21305)
-- Dependencies: 4 919 919
-- Name: st_rotatey(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_rotatey(geometry, double precision) RETURNS geometry
    AS $_$SELECT affine($1,  cos($2), 0, sin($2),  0, 1, 0,  -sin($2), 0, cos($2), 0,  0, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_rotatey(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 40 (class 1255 OID 21299)
-- Dependencies: 4 919 919
-- Name: st_rotatez(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_rotatez(geometry, double precision) RETURNS geometry
    AS $_$SELECT affine($1,  cos($2), -sin($2), 0,  sin($2), cos($2), 0,  0, 0, 1,  0, 0, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_rotatez(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 52 (class 1255 OID 21311)
-- Dependencies: 4 919 919
-- Name: st_scale(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_scale(geometry, double precision, double precision, double precision) RETURNS geometry
    AS $_$SELECT affine($1,  $2, 0, 0,  0, $3, 0,  0, 0, $4,  0, 0, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_scale(geometry, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 54 (class 1255 OID 21313)
-- Dependencies: 4 919 919
-- Name: st_scale(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_scale(geometry, double precision, double precision) RETURNS geometry
    AS $_$SELECT scale($1, $2, $3, 1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_scale(geometry, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 403 (class 1255 OID 21730)
-- Dependencies: 4 919 919
-- Name: st_segmentize(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_segmentize(geometry, double precision) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_segmentize2d'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_segmentize(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 168 (class 1255 OID 21452)
-- Dependencies: 4 923 923
-- Name: st_setfactor(chip, real); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_setfactor(chip, real) RETURNS chip
    AS '$libdir/liblwgeom.so.1.3', 'CHIP_setFactor'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_setfactor(chip, real) OWNER TO postgres;

--
-- TOC entry 293 (class 1255 OID 21583)
-- Dependencies: 4 919 919 919
-- Name: st_setpoint(geometry, integer, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_setpoint(geometry, integer, geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_setpoint_linestring'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_setpoint(geometry, integer, geometry) OWNER TO postgres;

--
-- TOC entry 540 (class 1255 OID 21872)
-- Dependencies: 4 919 919
-- Name: st_setsrid(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_setsrid(geometry, integer) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_setSRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_setsrid(geometry, integer) OWNER TO postgres;

--
-- TOC entry 58 (class 1255 OID 21317)
-- Dependencies: 4 919 919
-- Name: st_shift_longitude(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_shift_longitude(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_longitude_shift'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_shift_longitude(geometry) OWNER TO postgres;

--
-- TOC entry 393 (class 1255 OID 21720)
-- Dependencies: 4 919 919
-- Name: st_simplify(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_simplify(geometry, double precision) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_simplify2d'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_simplify(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 395 (class 1255 OID 21722)
-- Dependencies: 4 919 919
-- Name: st_snaptogrid(geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_snaptogrid(geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_snaptogrid'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_snaptogrid(geometry, double precision, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 397 (class 1255 OID 21724)
-- Dependencies: 4 919 919
-- Name: st_snaptogrid(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_snaptogrid(geometry, double precision, double precision) RETURNS geometry
    AS $_$SELECT SnapToGrid($1, 0, 0, $2, $3)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_snaptogrid(geometry, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 399 (class 1255 OID 21726)
-- Dependencies: 4 919 919
-- Name: st_snaptogrid(geometry, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_snaptogrid(geometry, double precision) RETURNS geometry
    AS $_$SELECT SnapToGrid($1, 0, 0, $2, $2)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_snaptogrid(geometry, double precision) OWNER TO postgres;

--
-- TOC entry 401 (class 1255 OID 21728)
-- Dependencies: 4 919 919 919
-- Name: st_snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_snaptogrid_pointoff'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_snaptogrid(geometry, geometry, double precision, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 155 (class 1255 OID 21439)
-- Dependencies: 4 923
-- Name: st_srid(chip); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_srid(chip) RETURNS integer
    AS '$libdir/liblwgeom.so.1.3', 'CHIP_getSRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_srid(chip) OWNER TO postgres;

--
-- TOC entry 538 (class 1255 OID 21870)
-- Dependencies: 4 919
-- Name: st_srid(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_srid(geometry) RETURNS integer
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_getSRID'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_srid(geometry) OWNER TO postgres;

--
-- TOC entry 530 (class 1255 OID 21862)
-- Dependencies: 4 919 919
-- Name: st_startpoint(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_startpoint(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_startpoint_linestring'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_startpoint(geometry) OWNER TO postgres;

--
-- TOC entry 172 (class 1255 OID 21456)
-- Dependencies: 4 919
-- Name: st_summary(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_summary(geometry) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_summary'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_summary(geometry) OWNER TO postgres;

--
-- TOC entry 427 (class 1255 OID 21754)
-- Dependencies: 4 919 919 919
-- Name: st_symdifference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_symdifference(geometry, geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'symdifference'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_symdifference(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 429 (class 1255 OID 21756)
-- Dependencies: 4 919 919 919
-- Name: st_symmetricdifference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_symmetricdifference(geometry, geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'symdifference'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_symmetricdifference(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 376 (class 1255 OID 21690)
-- Dependencies: 4 919
-- Name: st_text(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_text(geometry) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_to_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_text(geometry) OWNER TO postgres;

--
-- TOC entry 391 (class 1255 OID 21705)
-- Dependencies: 4
-- Name: st_text(boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_text(boolean) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'BOOL_to_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_text(boolean) OWNER TO postgres;

--
-- TOC entry 442 (class 1255 OID 21773)
-- Dependencies: 4 919 919
-- Name: st_touches(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_touches(geometry, geometry) RETURNS boolean
    AS $_$SELECT $1 && $2 AND _ST_Touches($1,$2)$_$
    LANGUAGE sql IMMUTABLE;


ALTER FUNCTION public.st_touches(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 351 (class 1255 OID 21665)
-- Dependencies: 4 919 919
-- Name: st_transform(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_transform(geometry, integer) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'transform'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_transform(geometry, integer) OWNER TO postgres;

--
-- TOC entry 48 (class 1255 OID 21307)
-- Dependencies: 4 919 919
-- Name: st_translate(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_translate(geometry, double precision, double precision, double precision) RETURNS geometry
    AS $_$SELECT affine($1, 1, 0, 0, 0, 1, 0, 0, 0, 1, $2, $3, $4)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_translate(geometry, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 50 (class 1255 OID 21309)
-- Dependencies: 4 919 919
-- Name: st_translate(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_translate(geometry, double precision, double precision) RETURNS geometry
    AS $_$SELECT translate($1, $2, $3, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_translate(geometry, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 56 (class 1255 OID 21315)
-- Dependencies: 4 919 919
-- Name: st_transscale(geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_transscale(geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    AS $_$SELECT affine($1,  $4, 0, 0,  0, $5, 0, 
		0, 0, 1,  $2 * $4, $3 * $5, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_transscale(geometry, double precision, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 431 (class 1255 OID 21758)
-- Dependencies: 4 919 919 919
-- Name: st_union(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_union(geometry, geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'geomunion'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_union(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 433 (class 1255 OID 21762)
-- Dependencies: 4 919 920
-- Name: st_unite_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_unite_garray(geometry[]) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'unite_garray'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_unite_garray(geometry[]) OWNER TO postgres;

--
-- TOC entry 161 (class 1255 OID 21445)
-- Dependencies: 4 923
-- Name: st_width(chip); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_width(chip) RETURNS integer
    AS '$libdir/liblwgeom.so.1.3', 'CHIP_getWidth'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_width(chip) OWNER TO postgres;

--
-- TOC entry 452 (class 1255 OID 21783)
-- Dependencies: 4 919 919
-- Name: st_within(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_within(geometry, geometry) RETURNS boolean
    AS $_$SELECT $1 && $2 AND _ST_Within($1,$2)$_$
    LANGUAGE sql IMMUTABLE;


ALTER FUNCTION public.st_within(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 669 (class 1255 OID 22001)
-- Dependencies: 4 919
-- Name: st_wkbtosql(bytea); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_wkbtosql(bytea) RETURNS geometry
    AS $_$SELECT GeomFromWKB($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_wkbtosql(bytea) OWNER TO postgres;

--
-- TOC entry 668 (class 1255 OID 22000)
-- Dependencies: 4 919
-- Name: st_wkttosql(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_wkttosql(text) RETURNS geometry
    AS $_$SELECT geometryfromtext($1)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.st_wkttosql(text) OWNER TO postgres;

--
-- TOC entry 522 (class 1255 OID 21853)
-- Dependencies: 4 919
-- Name: st_x(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_x(geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_x_point'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_x(geometry) OWNER TO postgres;

--
-- TOC entry 70 (class 1255 OID 21331)
-- Dependencies: 4 921
-- Name: st_xmax(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_xmax(box3d) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'BOX3D_xmax'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_xmax(box3d) OWNER TO postgres;

--
-- TOC entry 64 (class 1255 OID 21325)
-- Dependencies: 4 921
-- Name: st_xmin(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_xmin(box3d) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'BOX3D_xmin'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_xmin(box3d) OWNER TO postgres;

--
-- TOC entry 524 (class 1255 OID 21855)
-- Dependencies: 4 919
-- Name: st_y(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_y(geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_y_point'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_y(geometry) OWNER TO postgres;

--
-- TOC entry 72 (class 1255 OID 21333)
-- Dependencies: 4 921
-- Name: st_ymax(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_ymax(box3d) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'BOX3D_ymax'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_ymax(box3d) OWNER TO postgres;

--
-- TOC entry 66 (class 1255 OID 21327)
-- Dependencies: 4 921
-- Name: st_ymin(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_ymin(box3d) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'BOX3D_ymin'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_ymin(box3d) OWNER TO postgres;

--
-- TOC entry 526 (class 1255 OID 21858)
-- Dependencies: 4 919
-- Name: st_z(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_z(geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_z_point'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_z(geometry) OWNER TO postgres;

--
-- TOC entry 74 (class 1255 OID 21335)
-- Dependencies: 4 921
-- Name: st_zmax(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_zmax(box3d) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'BOX3D_zmax'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_zmax(box3d) OWNER TO postgres;

--
-- TOC entry 248 (class 1255 OID 21538)
-- Dependencies: 4 919
-- Name: st_zmflag(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_zmflag(geometry) RETURNS smallint
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_zmflag'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_zmflag(geometry) OWNER TO postgres;

--
-- TOC entry 68 (class 1255 OID 21329)
-- Dependencies: 4 921
-- Name: st_zmin(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION st_zmin(box3d) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'BOX3D_zmin'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.st_zmin(box3d) OWNER TO postgres;

--
-- TOC entry 529 (class 1255 OID 21861)
-- Dependencies: 4 919 919
-- Name: startpoint(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION startpoint(geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_startpoint_linestring'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.startpoint(geometry) OWNER TO postgres;

--
-- TOC entry 171 (class 1255 OID 21455)
-- Dependencies: 4 919
-- Name: summary(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION summary(geometry) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_summary'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.summary(geometry) OWNER TO postgres;

--
-- TOC entry 426 (class 1255 OID 21753)
-- Dependencies: 4 919 919 919
-- Name: symdifference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION symdifference(geometry, geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'symdifference'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.symdifference(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 428 (class 1255 OID 21755)
-- Dependencies: 4 919 919 919
-- Name: symmetricdifference(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION symmetricdifference(geometry, geometry) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'symdifference'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.symmetricdifference(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 375 (class 1255 OID 21689)
-- Dependencies: 4 919
-- Name: text(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION text(geometry) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_to_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.text(geometry) OWNER TO postgres;

--
-- TOC entry 390 (class 1255 OID 21704)
-- Dependencies: 4
-- Name: text(boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION text(boolean) RETURNS text
    AS '$libdir/liblwgeom.so.1.3', 'BOOL_to_text'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.text(boolean) OWNER TO postgres;

--
-- TOC entry 440 (class 1255 OID 21771)
-- Dependencies: 4 919 919
-- Name: touches(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION touches(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'touches'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.touches(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 350 (class 1255 OID 21664)
-- Dependencies: 4 919 919
-- Name: transform(geometry, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION transform(geometry, integer) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'transform'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.transform(geometry, integer) OWNER TO postgres;

--
-- TOC entry 349 (class 1255 OID 21663)
-- Dependencies: 4 919 919
-- Name: transform_geometry(geometry, text, text, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION transform_geometry(geometry, text, text, integer) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'transform_geom'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.transform_geometry(geometry, text, text, integer) OWNER TO postgres;

--
-- TOC entry 47 (class 1255 OID 21306)
-- Dependencies: 4 919 919
-- Name: translate(geometry, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION translate(geometry, double precision, double precision, double precision) RETURNS geometry
    AS $_$SELECT affine($1, 1, 0, 0, 0, 1, 0, 0, 0, 1, $2, $3, $4)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.translate(geometry, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 49 (class 1255 OID 21308)
-- Dependencies: 4 919 919
-- Name: translate(geometry, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION translate(geometry, double precision, double precision) RETURNS geometry
    AS $_$SELECT translate($1, $2, $3, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.translate(geometry, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 55 (class 1255 OID 21314)
-- Dependencies: 4 919 919
-- Name: transscale(geometry, double precision, double precision, double precision, double precision); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION transscale(geometry, double precision, double precision, double precision, double precision) RETURNS geometry
    AS $_$SELECT affine($1,  $4, 0, 0,  0, $5, 0, 
		0, 0, 1,  $2 * $4, $3 * $5, 0)$_$
    LANGUAGE sql IMMUTABLE STRICT;


ALTER FUNCTION public.transscale(geometry, double precision, double precision, double precision, double precision) OWNER TO postgres;

--
-- TOC entry 432 (class 1255 OID 21761)
-- Dependencies: 4 919 920
-- Name: unite_garray(geometry[]); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION unite_garray(geometry[]) RETURNS geometry
    AS '$libdir/liblwgeom.so.1.3', 'unite_garray'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.unite_garray(geometry[]) OWNER TO postgres;

--
-- TOC entry 655 (class 1255 OID 21987)
-- Dependencies: 4 947
-- Name: unlockrows(text); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION unlockrows(text) RETURNS integer
    AS $_$
DECLARE
	ret int;
BEGIN

	IF NOT LongTransactionsEnabled() THEN
		RAISE EXCEPTION 'Long transaction support disabled, use EnableLongTransaction() to enable.';
	END IF;

	EXECUTE 'DELETE FROM authorization_table where authid = ' ||
		quote_literal($1);

	GET DIAGNOSTICS ret = ROW_COUNT;

	RETURN ret;
END;
$_$
    LANGUAGE plpgsql STRICT;


ALTER FUNCTION public.unlockrows(text) OWNER TO postgres;

--
-- TOC entry 345 (class 1255 OID 21659)
-- Dependencies: 4
-- Name: update_geometry_stats(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION update_geometry_stats() RETURNS text
    AS $$ SELECT 'update_geometry_stats() has been obsoleted. Statistics are automatically built running the ANALYZE command'::text$$
    LANGUAGE sql;


ALTER FUNCTION public.update_geometry_stats() OWNER TO postgres;

--
-- TOC entry 346 (class 1255 OID 21660)
-- Dependencies: 4
-- Name: update_geometry_stats(character varying, character varying); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION update_geometry_stats(character varying, character varying) RETURNS text
    AS $$SELECT update_geometry_stats();$$
    LANGUAGE sql;


ALTER FUNCTION public.update_geometry_stats(character varying, character varying) OWNER TO postgres;

--
-- TOC entry 342 (class 1255 OID 21656)
-- Dependencies: 4 947
-- Name: updategeometrysrid(character varying, character varying, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION updategeometrysrid(character varying, character varying, character varying, character varying, integer) RETURNS text
    AS $_$
DECLARE
	catalog_name alias for $1; 
	schema_name alias for $2;
	table_name alias for $3;
	column_name alias for $4;
	new_srid alias for $5;
	myrec RECORD;
	okay boolean;
	cname varchar;
	real_schema name;

BEGIN


	-- Find, check or fix schema_name
	IF ( schema_name != '' ) THEN
		okay = 'f';

		FOR myrec IN SELECT nspname FROM pg_namespace WHERE text(nspname) = schema_name LOOP
			okay := 't';
		END LOOP;

		IF ( okay <> 't' ) THEN
			RAISE EXCEPTION 'Invalid schema name';
		ELSE
			real_schema = schema_name;
		END IF;
	ELSE
		SELECT INTO real_schema current_schema()::text;
	END IF;

 	-- Find out if the column is in the geometry_columns table
	okay = 'f';
	FOR myrec IN SELECT * from geometry_columns where f_table_schema = text(real_schema) and f_table_name = table_name and f_geometry_column = column_name LOOP
		okay := 't';
	END LOOP; 
	IF (okay <> 't') THEN 
		RAISE EXCEPTION 'column not found in geometry_columns table';
		RETURN 'f';
	END IF;

	-- Update ref from geometry_columns table
	EXECUTE 'UPDATE geometry_columns SET SRID = ' || new_srid::text || 
		' where f_table_schema = ' ||
		quote_literal(real_schema) || ' and f_table_name = ' ||
		quote_literal(table_name)  || ' and f_geometry_column = ' ||
		quote_literal(column_name);
	
	-- Make up constraint name
	cname = 'enforce_srid_'  || column_name;

	-- Drop enforce_srid constraint
	EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) ||
		'.' || quote_ident(table_name) ||
		' DROP constraint ' || quote_ident(cname);

	-- Update geometries SRID
	EXECUTE 'UPDATE ' || quote_ident(real_schema) ||
		'.' || quote_ident(table_name) ||
		' SET ' || quote_ident(column_name) ||
		' = setSRID(' || quote_ident(column_name) ||
		', ' || new_srid::text || ')';

	-- Reset enforce_srid constraint
	EXECUTE 'ALTER TABLE ' || quote_ident(real_schema) ||
		'.' || quote_ident(table_name) ||
		' ADD constraint ' || quote_ident(cname) ||
		' CHECK (srid(' || quote_ident(column_name) ||
		') = ' || new_srid::text || ')';

	RETURN real_schema || '.' || table_name || '.' || column_name ||' SRID changed to ' || new_srid::text;
	
END;
$_$
    LANGUAGE plpgsql STRICT;


ALTER FUNCTION public.updategeometrysrid(character varying, character varying, character varying, character varying, integer) OWNER TO postgres;

--
-- TOC entry 343 (class 1255 OID 21657)
-- Dependencies: 4 947
-- Name: updategeometrysrid(character varying, character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION updategeometrysrid(character varying, character varying, character varying, integer) RETURNS text
    AS $_$
DECLARE
	ret  text;
BEGIN
	SELECT UpdateGeometrySRID('',$1,$2,$3,$4) into ret;
	RETURN ret;
END;
$_$
    LANGUAGE plpgsql STRICT;


ALTER FUNCTION public.updategeometrysrid(character varying, character varying, character varying, integer) OWNER TO postgres;

--
-- TOC entry 344 (class 1255 OID 21658)
-- Dependencies: 4 947
-- Name: updategeometrysrid(character varying, character varying, integer); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION updategeometrysrid(character varying, character varying, integer) RETURNS text
    AS $_$
DECLARE
	ret  text;
BEGIN
	SELECT UpdateGeometrySRID('','',$1,$2,$3) into ret;
	RETURN ret;
END;
$_$
    LANGUAGE plpgsql STRICT;


ALTER FUNCTION public.updategeometrysrid(character varying, character varying, integer) OWNER TO postgres;

--
-- TOC entry 160 (class 1255 OID 21444)
-- Dependencies: 4 923
-- Name: width(chip); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION width(chip) RETURNS integer
    AS '$libdir/liblwgeom.so.1.3', 'CHIP_getWidth'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.width(chip) OWNER TO postgres;

--
-- TOC entry 450 (class 1255 OID 21781)
-- Dependencies: 4 919 919
-- Name: within(geometry, geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION within(geometry, geometry) RETURNS boolean
    AS '$libdir/liblwgeom.so.1.3', 'within'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.within(geometry, geometry) OWNER TO postgres;

--
-- TOC entry 521 (class 1255 OID 21852)
-- Dependencies: 4 919
-- Name: x(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION x(geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_x_point'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.x(geometry) OWNER TO postgres;

--
-- TOC entry 69 (class 1255 OID 21330)
-- Dependencies: 4 921
-- Name: xmax(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xmax(box3d) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'BOX3D_xmax'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.xmax(box3d) OWNER TO postgres;

--
-- TOC entry 63 (class 1255 OID 21324)
-- Dependencies: 4 921
-- Name: xmin(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION xmin(box3d) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'BOX3D_xmin'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.xmin(box3d) OWNER TO postgres;

--
-- TOC entry 523 (class 1255 OID 21854)
-- Dependencies: 4 919
-- Name: y(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION y(geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_y_point'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.y(geometry) OWNER TO postgres;

--
-- TOC entry 71 (class 1255 OID 21332)
-- Dependencies: 4 921
-- Name: ymax(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ymax(box3d) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'BOX3D_ymax'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ymax(box3d) OWNER TO postgres;

--
-- TOC entry 65 (class 1255 OID 21326)
-- Dependencies: 4 921
-- Name: ymin(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION ymin(box3d) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'BOX3D_ymin'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.ymin(box3d) OWNER TO postgres;

--
-- TOC entry 525 (class 1255 OID 21856)
-- Dependencies: 4 919
-- Name: z(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION z(geometry) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_z_point'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.z(geometry) OWNER TO postgres;

--
-- TOC entry 73 (class 1255 OID 21334)
-- Dependencies: 4 921
-- Name: zmax(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION zmax(box3d) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'BOX3D_zmax'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.zmax(box3d) OWNER TO postgres;

--
-- TOC entry 247 (class 1255 OID 21537)
-- Dependencies: 4 919
-- Name: zmflag(geometry); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION zmflag(geometry) RETURNS smallint
    AS '$libdir/liblwgeom.so.1.3', 'LWGEOM_zmflag'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.zmflag(geometry) OWNER TO postgres;

--
-- TOC entry 67 (class 1255 OID 21328)
-- Dependencies: 4 921
-- Name: zmin(box3d); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION zmin(box3d) RETURNS double precision
    AS '$libdir/liblwgeom.so.1.3', 'BOX3D_zmin'
    LANGUAGE c IMMUTABLE STRICT;


ALTER FUNCTION public.zmin(box3d) OWNER TO postgres;

--
-- TOC entry 950 (class 1255 OID 21517)
-- Dependencies: 4 920 919 230
-- Name: accum(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE accum (
    BASETYPE = geometry,
    SFUNC = st_geom_accum,
    STYPE = geometry[]
);


ALTER AGGREGATE public.accum(geometry) OWNER TO postgres;

--
-- TOC entry 952 (class 1255 OID 21521)
-- Dependencies: 4 919 919 230 232
-- Name: collect(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE collect (
    BASETYPE = geometry,
    SFUNC = st_geom_accum,
    STYPE = geometry[],
    FINALFUNC = st_collect_garray
);


ALTER AGGREGATE public.collect(geometry) OWNER TO postgres;

--
-- TOC entry 958 (class 1255 OID 21606)
-- Dependencies: 4 925 919 309
-- Name: extent(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE extent (
    BASETYPE = geometry,
    SFUNC = public.st_combine_bbox,
    STYPE = box2d
);


ALTER AGGREGATE public.extent(geometry) OWNER TO postgres;

--
-- TOC entry 960 (class 1255 OID 21610)
-- Dependencies: 4 921 919 310
-- Name: extent3d(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE extent3d (
    BASETYPE = geometry,
    SFUNC = public.combine_bbox,
    STYPE = box3d
);


ALTER AGGREGATE public.extent3d(geometry) OWNER TO postgres;

--
-- TOC entry 964 (class 1255 OID 21763)
-- Dependencies: 4 919 919 229 433
-- Name: geomunion(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE geomunion (
    BASETYPE = geometry,
    SFUNC = geom_accum,
    STYPE = geometry[],
    FINALFUNC = st_unite_garray
);


ALTER AGGREGATE public.geomunion(geometry) OWNER TO postgres;

--
-- TOC entry 954 (class 1255 OID 21584)
-- Dependencies: 4 919 919 229 280
-- Name: makeline(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE makeline (
    BASETYPE = geometry,
    SFUNC = geom_accum,
    STYPE = geometry[],
    FINALFUNC = makeline_garray
);


ALTER AGGREGATE public.makeline(geometry) OWNER TO postgres;

--
-- TOC entry 948 (class 1255 OID 21513)
-- Dependencies: 4 919 919 228
-- Name: memcollect(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE memcollect (
    BASETYPE = geometry,
    SFUNC = public.st_collect,
    STYPE = geometry
);


ALTER AGGREGATE public.memcollect(geometry) OWNER TO postgres;

--
-- TOC entry 962 (class 1255 OID 21759)
-- Dependencies: 4 919 919 430
-- Name: memgeomunion(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE memgeomunion (
    BASETYPE = geometry,
    SFUNC = public.geomunion,
    STYPE = geometry
);


ALTER AGGREGATE public.memgeomunion(geometry) OWNER TO postgres;

--
-- TOC entry 956 (class 1255 OID 21596)
-- Dependencies: 4 919 919 229 300
-- Name: polygonize(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE polygonize (
    BASETYPE = geometry,
    SFUNC = geom_accum,
    STYPE = geometry[],
    FINALFUNC = polygonize_garray
);


ALTER AGGREGATE public.polygonize(geometry) OWNER TO postgres;

--
-- TOC entry 951 (class 1255 OID 21518)
-- Dependencies: 4 920 919 230
-- Name: st_accum(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE st_accum (
    BASETYPE = geometry,
    SFUNC = st_geom_accum,
    STYPE = geometry[]
);


ALTER AGGREGATE public.st_accum(geometry) OWNER TO postgres;

--
-- TOC entry 953 (class 1255 OID 21522)
-- Dependencies: 4 919 919 230 232
-- Name: st_collect(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE st_collect (
    BASETYPE = geometry,
    SFUNC = st_geom_accum,
    STYPE = geometry[],
    FINALFUNC = st_collect_garray
);


ALTER AGGREGATE public.st_collect(geometry) OWNER TO postgres;

--
-- TOC entry 959 (class 1255 OID 21607)
-- Dependencies: 4 925 919 309
-- Name: st_extent(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE st_extent (
    BASETYPE = geometry,
    SFUNC = public.st_combine_bbox,
    STYPE = box2d
);


ALTER AGGREGATE public.st_extent(geometry) OWNER TO postgres;

--
-- TOC entry 961 (class 1255 OID 21611)
-- Dependencies: 4 921 919 311
-- Name: st_extent3d(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE st_extent3d (
    BASETYPE = geometry,
    SFUNC = public.st_combine_bbox,
    STYPE = box3d
);


ALTER AGGREGATE public.st_extent3d(geometry) OWNER TO postgres;

--
-- TOC entry 955 (class 1255 OID 21585)
-- Dependencies: 4 919 919 229 281
-- Name: st_makeline(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE st_makeline (
    BASETYPE = geometry,
    SFUNC = geom_accum,
    STYPE = geometry[],
    FINALFUNC = st_makeline_garray
);


ALTER AGGREGATE public.st_makeline(geometry) OWNER TO postgres;

--
-- TOC entry 949 (class 1255 OID 21514)
-- Dependencies: 4 919 919 228
-- Name: st_memcollect(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE st_memcollect (
    BASETYPE = geometry,
    SFUNC = public.st_collect,
    STYPE = geometry
);


ALTER AGGREGATE public.st_memcollect(geometry) OWNER TO postgres;

--
-- TOC entry 963 (class 1255 OID 21760)
-- Dependencies: 4 919 919 431
-- Name: st_memgeomunion(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE st_memgeomunion (
    BASETYPE = geometry,
    SFUNC = public.st_union,
    STYPE = geometry
);


ALTER AGGREGATE public.st_memgeomunion(geometry) OWNER TO postgres;

--
-- TOC entry 957 (class 1255 OID 21597)
-- Dependencies: 4 919 919 230 301
-- Name: st_polygonize(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE st_polygonize (
    BASETYPE = geometry,
    SFUNC = st_geom_accum,
    STYPE = geometry[],
    FINALFUNC = st_polygonize_garray
);


ALTER AGGREGATE public.st_polygonize(geometry) OWNER TO postgres;

--
-- TOC entry 965 (class 1255 OID 21764)
-- Dependencies: 4 919 919 230 433
-- Name: st_union(geometry); Type: AGGREGATE; Schema: public; Owner: postgres
--

CREATE AGGREGATE st_union (
    BASETYPE = geometry,
    SFUNC = st_geom_accum,
    STYPE = geometry[],
    FINALFUNC = st_unite_garray
);


ALTER AGGREGATE public.st_union(geometry) OWNER TO postgres;

--
-- TOC entry 1618 (class 2617 OID 21420)
-- Dependencies: 4 919 919 138 114 116
-- Name: &&; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR && (
    PROCEDURE = st_geometry_overlap,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &&,
    RESTRICT = st_postgis_gist_sel,
    JOIN = st_postgis_gist_joinsel
);


ALTER OPERATOR public.&& (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 1615 (class 2617 OID 21415)
-- Dependencies: 4 919 919 118
-- Name: &<; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR &< (
    PROCEDURE = st_geometry_overleft,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.&< (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 1617 (class 2617 OID 21419)
-- Dependencies: 4 919 919 124
-- Name: &<|; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR &<| (
    PROCEDURE = st_geometry_overbelow,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = |&>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.&<| (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 1619 (class 2617 OID 21414)
-- Dependencies: 4 919 919 120
-- Name: &>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR &> (
    PROCEDURE = st_geometry_overright,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &<,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.&> (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 1609 (class 2617 OID 21380)
-- Dependencies: 4 919 919 102
-- Name: <; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR < (
    PROCEDURE = st_geometry_lt,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = >,
    NEGATOR = >=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.< (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 1614 (class 2617 OID 21413)
-- Dependencies: 4 919 919 126
-- Name: <<; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR << (
    PROCEDURE = st_geometry_left,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = >>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.<< (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 1616 (class 2617 OID 21417)
-- Dependencies: 4 919 919 132
-- Name: <<|; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <<| (
    PROCEDURE = st_geometry_below,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = |>>,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.<<| (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 1610 (class 2617 OID 21381)
-- Dependencies: 4 919 919 104
-- Name: <=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR <= (
    PROCEDURE = st_geometry_le,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = >=,
    NEGATOR = >,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.<= (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 1611 (class 2617 OID 21382)
-- Dependencies: 4 919 919 110
-- Name: =; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR = (
    PROCEDURE = st_geometry_eq,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = =,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.= (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 1613 (class 2617 OID 21378)
-- Dependencies: 4 919 919 106
-- Name: >; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR > (
    PROCEDURE = st_geometry_gt,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <,
    NEGATOR = <=,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.> (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 1612 (class 2617 OID 21379)
-- Dependencies: 4 919 919 108
-- Name: >=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >= (
    PROCEDURE = st_geometry_ge,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <=,
    NEGATOR = <,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.>= (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 1620 (class 2617 OID 21412)
-- Dependencies: 4 919 919 128
-- Name: >>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR >> (
    PROCEDURE = st_geometry_right,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <<,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.>> (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 1624 (class 2617 OID 21423)
-- Dependencies: 4 919 919 136
-- Name: @; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR @ (
    PROCEDURE = st_geometry_contained,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = ~,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.@ (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 1621 (class 2617 OID 21418)
-- Dependencies: 4 919 919 122
-- Name: |&>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR |&> (
    PROCEDURE = st_geometry_overabove,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = &<|,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.|&> (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 1622 (class 2617 OID 21416)
-- Dependencies: 4 919 919 130
-- Name: |>>; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR |>> (
    PROCEDURE = st_geometry_above,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = <<|,
    RESTRICT = positionsel,
    JOIN = positionjoinsel
);


ALTER OPERATOR public.|>> (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 1625 (class 2617 OID 21422)
-- Dependencies: 4 919 919 134
-- Name: ~; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ~ (
    PROCEDURE = st_geometry_contain,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = @,
    RESTRICT = contsel,
    JOIN = contjoinsel
);


ALTER OPERATOR public.~ (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 1623 (class 2617 OID 21421)
-- Dependencies: 4 919 919 140
-- Name: ~=; Type: OPERATOR; Schema: public; Owner: postgres
--

CREATE OPERATOR ~= (
    PROCEDURE = st_geometry_same,
    LEFTARG = geometry,
    RIGHTARG = geometry,
    COMMUTATOR = ~=,
    RESTRICT = eqsel,
    JOIN = eqjoinsel
);


ALTER OPERATOR public.~= (geometry, geometry) OWNER TO postgres;

--
-- TOC entry 1699 (class 2616 OID 21383)
-- Dependencies: 4 919 1609 1610 1611 1612 1613 111
-- Name: btree_geometry_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS btree_geometry_ops
    DEFAULT FOR TYPE geometry USING btree AS
    OPERATOR 1 <(geometry,geometry) ,
    OPERATOR 2 <=(geometry,geometry) ,
    OPERATOR 3 =(geometry,geometry) ,
    OPERATOR 4 >=(geometry,geometry) ,
    OPERATOR 5 >(geometry,geometry) ,
    FUNCTION 1 geometry_cmp(geometry,geometry);


ALTER OPERATOR CLASS public.btree_geometry_ops USING btree OWNER TO postgres;

--
-- TOC entry 1700 (class 2616 OID 21431)
-- Dependencies: 4 919 1614 1615 1618 1619 1620 1623 1625 1624 1617 1616 1622 1621 141 145 142 147 143 144 146
-- Name: gist_geometry_ops; Type: OPERATOR CLASS; Schema: public; Owner: postgres
--

CREATE OPERATOR CLASS gist_geometry_ops
    DEFAULT FOR TYPE geometry USING gist AS
    STORAGE box2d ,
    OPERATOR 1 <<(geometry,geometry) RECHECK ,
    OPERATOR 2 &<(geometry,geometry) RECHECK ,
    OPERATOR 3 &&(geometry,geometry) RECHECK ,
    OPERATOR 4 &>(geometry,geometry) RECHECK ,
    OPERATOR 5 >>(geometry,geometry) RECHECK ,
    OPERATOR 6 ~=(geometry,geometry) RECHECK ,
    OPERATOR 7 ~(geometry,geometry) RECHECK ,
    OPERATOR 8 @(geometry,geometry) RECHECK ,
    OPERATOR 9 &<|(geometry,geometry) RECHECK ,
    OPERATOR 10 <<|(geometry,geometry) RECHECK ,
    OPERATOR 11 |>>(geometry,geometry) RECHECK ,
    OPERATOR 12 |&>(geometry,geometry) RECHECK ,
    FUNCTION 1 lwgeom_gist_consistent(internal,geometry,integer) ,
    FUNCTION 2 lwgeom_gist_union(bytea,internal) ,
    FUNCTION 3 lwgeom_gist_compress(internal) ,
    FUNCTION 4 lwgeom_gist_decompress(internal) ,
    FUNCTION 5 lwgeom_gist_penalty(internal,internal,internal) ,
    FUNCTION 6 lwgeom_gist_picksplit(internal,internal) ,
    FUNCTION 7 lwgeom_gist_same(box2d,box2d,internal);


ALTER OPERATOR CLASS public.gist_geometry_ops USING gist OWNER TO postgres;

SET search_path = pg_catalog;

--
-- TOC entry 2264 (class 2605 OID 21710)
-- Dependencies: 372 925 921 372
-- Name: CAST (public.box2d AS public.box3d); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.box2d AS public.box3d) WITH FUNCTION public.st_box3d(public.box2d) AS IMPLICIT;


--
-- TOC entry 2263 (class 2605 OID 21711)
-- Dependencies: 379 925 919 379
-- Name: CAST (public.box2d AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.box2d AS public.geometry) WITH FUNCTION public.st_geometry(public.box2d) AS IMPLICIT;


--
-- TOC entry 2259 (class 2605 OID 21712)
-- Dependencies: 374 921 374
-- Name: CAST (public.box3d AS box); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.box3d AS box) WITH FUNCTION public.st_box(public.box3d) AS IMPLICIT;


--
-- TOC entry 2261 (class 2605 OID 21709)
-- Dependencies: 370 921 925 370
-- Name: CAST (public.box3d AS public.box2d); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.box3d AS public.box2d) WITH FUNCTION public.st_box2d(public.box3d) AS IMPLICIT;


--
-- TOC entry 2260 (class 2605 OID 21713)
-- Dependencies: 381 921 919 381
-- Name: CAST (public.box3d AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.box3d AS public.geometry) WITH FUNCTION public.st_geometry(public.box3d) AS IMPLICIT;


--
-- TOC entry 1997 (class 2605 OID 21717)
-- Dependencies: 387 919 387
-- Name: CAST (bytea AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (bytea AS public.geometry) WITH FUNCTION public.st_geometry(bytea) AS IMPLICIT;


--
-- TOC entry 2262 (class 2605 OID 21716)
-- Dependencies: 385 923 919 385
-- Name: CAST (public.chip AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.chip AS public.geometry) WITH FUNCTION public.st_geometry(public.chip) AS IMPLICIT;


--
-- TOC entry 2256 (class 2605 OID 21708)
-- Dependencies: 368 919 368
-- Name: CAST (public.geometry AS box); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.geometry AS box) WITH FUNCTION public.st_box(public.geometry) AS IMPLICIT;


--
-- TOC entry 2258 (class 2605 OID 21706)
-- Dependencies: 364 919 925 364
-- Name: CAST (public.geometry AS public.box2d); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.geometry AS public.box2d) WITH FUNCTION public.st_box2d(public.geometry) AS IMPLICIT;


--
-- TOC entry 2257 (class 2605 OID 21707)
-- Dependencies: 366 919 921 366
-- Name: CAST (public.geometry AS public.box3d); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.geometry AS public.box3d) WITH FUNCTION public.st_box3d(public.geometry) AS IMPLICIT;


--
-- TOC entry 2254 (class 2605 OID 21718)
-- Dependencies: 389 919 389
-- Name: CAST (public.geometry AS bytea); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.geometry AS bytea) WITH FUNCTION public.st_bytea(public.geometry) AS IMPLICIT;


--
-- TOC entry 2255 (class 2605 OID 21715)
-- Dependencies: 376 919 376
-- Name: CAST (public.geometry AS text); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (public.geometry AS text) WITH FUNCTION public.st_text(public.geometry) AS IMPLICIT;


--
-- TOC entry 2081 (class 2605 OID 21714)
-- Dependencies: 383 919 383
-- Name: CAST (text AS public.geometry); Type: CAST; Schema: pg_catalog; Owner: 
--

CREATE CAST (text AS public.geometry) WITH FUNCTION public.st_geometry(text) AS IMPLICIT;


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = true;

--
-- TOC entry 1920 (class 1259 OID 21637)
-- Dependencies: 4
-- Name: geometry_columns; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE geometry_columns (
    f_table_catalog character varying(256) NOT NULL,
    f_table_schema character varying(256) NOT NULL,
    f_table_name character varying(256) NOT NULL,
    f_geometry_column character varying(256) NOT NULL,
    coord_dimension integer NOT NULL,
    srid integer NOT NULL,
    "type" character varying(30) NOT NULL
);


ALTER TABLE public.geometry_columns OWNER TO postgres;

--
-- TOC entry 1928 (class 1259 OID 22082)
-- Dependencies: 2272 2273 2274 4 919
-- Name: results; Type: TABLE; Schema: public; Owner: vtourUser; Tablespace: 
--

CREATE TABLE results (
    id serial NOT NULL,
    thumb_url character varying(1024) NOT NULL,
    page_url character varying(1024) NOT NULL,
    name character varying(255) NOT NULL,
    user_id integer NOT NULL,
    search integer NOT NULL,
    geom geometry,
    CONSTRAINT enforce_dims_geom CHECK ((ndims(geom) = 2)),
    CONSTRAINT enforce_geotype_geom CHECK (((geometrytype(geom) = 'POINT'::text) OR (geom IS NULL))),
    CONSTRAINT enforce_srid_geom CHECK ((srid(geom) = 4326))
);


ALTER TABLE public.results OWNER TO "vtourUser";

--
-- TOC entry 1926 (class 1259 OID 22060)
-- Dependencies: 2268 2269 2270 4 919
-- Name: searches; Type: TABLE; Schema: public; Owner: vtourUser; Tablespace: 
--

CREATE TABLE searches (
    id serial NOT NULL,
    user_id integer NOT NULL,
    geom geometry,
    tour integer NOT NULL,
    CONSTRAINT enforce_dims_geom CHECK ((ndims(geom) = 2)),
    CONSTRAINT enforce_geotype_geom CHECK (((geometrytype(geom) = 'LINESTRING'::text) OR (geom IS NULL))),
    CONSTRAINT enforce_srid_geom CHECK ((srid(geom) = 4326))
);


ALTER TABLE public.searches OWNER TO "vtourUser";

--
-- TOC entry 1924 (class 1259 OID 22043)
-- Dependencies: 4
-- Name: settings; Type: TABLE; Schema: public; Owner: vtourUser; Tablespace: 
--

CREATE TABLE settings (
    id serial NOT NULL,
    user_id integer NOT NULL,
    name character varying(1024) NOT NULL,
    value character varying(1024)
);


ALTER TABLE public.settings OWNER TO "vtourUser";

SET default_with_oids = false;

--
-- TOC entry 1919 (class 1259 OID 21630)
-- Dependencies: 4
-- Name: spatial_ref_sys; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE spatial_ref_sys (
    srid integer NOT NULL,
    auth_name character varying(256),
    auth_srid integer,
    srtext character varying(2048),
    proj4text character varying(2048)
);


ALTER TABLE public.spatial_ref_sys OWNER TO postgres;

SET default_with_oids = true;

--
-- TOC entry 1930 (class 1259 OID 22113)
-- Dependencies: 2276 2277 2278 2279 4 919
-- Name: tours; Type: TABLE; Schema: public; Owner: vtourUser; Tablespace: 
--

CREATE TABLE tours (
    id serial NOT NULL,
    user_id integer NOT NULL,
    name character varying(1024) NOT NULL,
    date character varying NOT NULL,
    public boolean DEFAULT false NOT NULL,
    geom geometry,
    CONSTRAINT enforce_dims_geom CHECK ((ndims(geom) = 2)),
    CONSTRAINT enforce_geotype_geom CHECK (((geometrytype(geom) = 'LINESTRING'::text) OR (geom IS NULL))),
    CONSTRAINT enforce_srid_geom CHECK ((srid(geom) = 4326))
);


ALTER TABLE public.tours OWNER TO "vtourUser";

--
-- TOC entry 1922 (class 1259 OID 22031)
-- Dependencies: 4
-- Name: users; Type: TABLE; Schema: public; Owner: vtourUser; Tablespace: 
--

CREATE TABLE users (
    id serial NOT NULL,
    login_name character varying(255) NOT NULL,
    passcode character varying(255) NOT NULL,
    email character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO "vtourUser";

--
-- TOC entry 2283 (class 2606 OID 21643)
-- Dependencies: 1920 1920 1920 1920 1920
-- Name: geometry_columns_pk; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY geometry_columns
    ADD CONSTRAINT geometry_columns_pk PRIMARY KEY (f_table_catalog, f_table_schema, f_table_name, f_geometry_column);


--
-- TOC entry 2295 (class 2606 OID 22089)
-- Dependencies: 1928 1928
-- Name: results_pk; Type: CONSTRAINT; Schema: public; Owner: vtourUser; Tablespace: 
--

ALTER TABLE ONLY results
    ADD CONSTRAINT results_pk PRIMARY KEY (id);


--
-- TOC entry 2293 (class 2606 OID 22065)
-- Dependencies: 1926 1926
-- Name: searches_pk; Type: CONSTRAINT; Schema: public; Owner: vtourUser; Tablespace: 
--

ALTER TABLE ONLY searches
    ADD CONSTRAINT searches_pk PRIMARY KEY (id);


--
-- TOC entry 2289 (class 2606 OID 22050)
-- Dependencies: 1924 1924
-- Name: settings_pk; Type: CONSTRAINT; Schema: public; Owner: vtourUser; Tablespace: 
--

ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_pk PRIMARY KEY (id);


--
-- TOC entry 2291 (class 2606 OID 22052)
-- Dependencies: 1924 1924 1924
-- Name: settings_user_uniq; Type: CONSTRAINT; Schema: public; Owner: vtourUser; Tablespace: 
--

ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_user_uniq UNIQUE (user_id, name);


--
-- TOC entry 2281 (class 2606 OID 21636)
-- Dependencies: 1919 1919
-- Name: spatial_ref_sys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY spatial_ref_sys
    ADD CONSTRAINT spatial_ref_sys_pkey PRIMARY KEY (srid);


--
-- TOC entry 2297 (class 2606 OID 22123)
-- Dependencies: 1930 1930 1930
-- Name: tour_user_name_uniq; Type: CONSTRAINT; Schema: public; Owner: vtourUser; Tablespace: 
--

ALTER TABLE ONLY tours
    ADD CONSTRAINT tour_user_name_uniq UNIQUE (user_id, name);


--
-- TOC entry 2299 (class 2606 OID 22121)
-- Dependencies: 1930 1930
-- Name: tours_pk; Type: CONSTRAINT; Schema: public; Owner: vtourUser; Tablespace: 
--

ALTER TABLE ONLY tours
    ADD CONSTRAINT tours_pk PRIMARY KEY (id);


--
-- TOC entry 2285 (class 2606 OID 22040)
-- Dependencies: 1922 1922
-- Name: users_login_uniq; Type: CONSTRAINT; Schema: public; Owner: vtourUser; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_login_uniq UNIQUE (login_name);


--
-- TOC entry 2287 (class 2606 OID 22038)
-- Dependencies: 1922 1922
-- Name: users_pk; Type: CONSTRAINT; Schema: public; Owner: vtourUser; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pk PRIMARY KEY (id);


--
-- TOC entry 2303 (class 2606 OID 22090)
-- Dependencies: 1928 1926 2292
-- Name: results_searches_fk; Type: FK CONSTRAINT; Schema: public; Owner: vtourUser
--

ALTER TABLE ONLY results
    ADD CONSTRAINT results_searches_fk FOREIGN KEY (search) REFERENCES searches(id);


--
-- TOC entry 2304 (class 2606 OID 22095)
-- Dependencies: 1928 1922 2286
-- Name: results_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: vtourUser
--

ALTER TABLE ONLY results
    ADD CONSTRAINT results_users_fk FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 2302 (class 2606 OID 22129)
-- Dependencies: 1926 1930 2298
-- Name: search_tour_fk; Type: FK CONSTRAINT; Schema: public; Owner: vtourUser
--

ALTER TABLE ONLY searches
    ADD CONSTRAINT search_tour_fk FOREIGN KEY (tour) REFERENCES tours(id);


--
-- TOC entry 2301 (class 2606 OID 22068)
-- Dependencies: 1926 1922 2286
-- Name: searches_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: vtourUser
--

ALTER TABLE ONLY searches
    ADD CONSTRAINT searches_users_fk FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 2300 (class 2606 OID 22053)
-- Dependencies: 1924 1922 2286
-- Name: settings_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: vtourUser
--

ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_users_fk FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 2305 (class 2606 OID 22124)
-- Dependencies: 1930 1922 2286
-- Name: tour_users_fk; Type: FK CONSTRAINT; Schema: public; Owner: vtourUser
--

ALTER TABLE ONLY tours
    ADD CONSTRAINT tour_users_fk FOREIGN KEY (user_id) REFERENCES users(id);


--
-- TOC entry 2309 (class 0 OID 0)
-- Dependencies: 4
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2008-06-02 23:37:23 EDT

--
-- PostgreSQL database dump complete
--

