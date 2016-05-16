\c pljava_test pljava_test

set search_path = javatest, public;

-- org.postgresql.pljava.example.Parameters

CREATE FUNCTION javatest.java_getTimestamp()
	RETURNS timestamp
	AS 'org.postgresql.pljava.example.Parameters.getTimestamp'
	LANGUAGE java;

CREATE FUNCTION javatest.java_getTimestamptz()
	RETURNS timestamptz
	AS 'org.postgresql.pljava.example.Parameters.getTimestamp'
	LANGUAGE java;

CREATE FUNCTION javatest.print(date)
	RETURNS varchar
	AS 'org.postgresql.pljava.example.Parameters.print'
	LANGUAGE java;

CREATE FUNCTION javatest.print(timetz)
	RETURNS varchar
	AS 'org.postgresql.pljava.example.Parameters.print'
	LANGUAGE java;

CREATE FUNCTION javatest.print(timestamptz)
	RETURNS varchar
	AS 'org.postgresql.pljava.example.Parameters.print'
	LANGUAGE java;

CREATE FUNCTION javatest.print(varchar)
	RETURNS varchar
	AS 'org.postgresql.pljava.example.Parameters.print'
	LANGUAGE java;

CREATE FUNCTION javatest.print(bytea)
	RETURNS bytea
	AS 'org.postgresql.pljava.example.Parameters.print'
	LANGUAGE java;

CREATE FUNCTION javatest.print(int2)
	RETURNS int2
	AS 'org.postgresql.pljava.example.Parameters.print'
	LANGUAGE java;

CREATE FUNCTION javatest.print(int2[])
	RETURNS int2[]
	AS 'org.postgresql.pljava.example.Parameters.print'
	LANGUAGE java;

CREATE FUNCTION javatest.print(int4)
	RETURNS int4
	AS 'org.postgresql.pljava.example.Parameters.print'
	LANGUAGE java;

CREATE FUNCTION javatest.print(int4[])
	RETURNS int4[]
	AS 'org.postgresql.pljava.example.Parameters.print'
	LANGUAGE java;

CREATE FUNCTION javatest.print(int8)
	RETURNS int8
	AS 'org.postgresql.pljava.example.Parameters.print'
	LANGUAGE java;

CREATE FUNCTION javatest.print(int8[])
	RETURNS int8[]
	AS 'org.postgresql.pljava.example.Parameters.print'
	LANGUAGE java;

CREATE FUNCTION javatest.print(float4)
	RETURNS float4
	AS 'org.postgresql.pljava.example.Parameters.print'
	LANGUAGE java;

CREATE FUNCTION javatest.print(float4[])
	RETURNS float4[]
	AS 'org.postgresql.pljava.example.Parameters.print'
	LANGUAGE java;

CREATE FUNCTION javatest.print(float8)
	RETURNS float8
	AS 'org.postgresql.pljava.example.Parameters.print'
	LANGUAGE java;

CREATE FUNCTION javatest.print(float8[])
	RETURNS float8[]
	AS 'org.postgresql.pljava.example.Parameters.print'
	LANGUAGE java;

CREATE FUNCTION javatest.printObj(int[])
	RETURNS int[]
	AS 'org.postgresql.pljava.example.Parameters.print(java.lang.Integer[])'
	LANGUAGE java;

CREATE FUNCTION javatest.java_addOne(int)
	RETURNS int
	AS 'org.postgresql.pljava.example.Parameters.addOne(java.lang.Integer)'
	IMMUTABLE LANGUAGE java;

CREATE FUNCTION javatest.nullOnEven(int)
	RETURNS int
	AS 'org.postgresql.pljava.example.Parameters.nullOnEven'
	IMMUTABLE LANGUAGE java;

CREATE FUNCTION javatest.addNumbers(int2, int4, int8, numeric, numeric, float4, float8)
	RETURNS float8
	AS 'org.postgresql.pljava.example.Parameters.addNumbers'
	IMMUTABLE LANGUAGE java;

CREATE FUNCTION javatest.countNulls(record)
	RETURNS int
	AS 'org.postgresql.pljava.example.Parameters.countNulls'
	LANGUAGE java;

CREATE FUNCTION javatest.countNulls(int[])
	RETURNS int
	AS 'org.postgresql.pljava.example.Parameters.countNulls(java.lang.Integer[])'
	LANGUAGE java;

-- Functions over system calls

CREATE FUNCTION javatest.java_getSystemProperty(varchar)
	RETURNS varchar
	AS 'java.lang.System.getProperty'
	LANGUAGE java;

-- org.postgresql.pljava.example.Security

CREATE FUNCTION javatest.create_temp_file_trusted()
	RETURNS varchar
	AS 'org.postgresql.pljava.example.Security.createTempFile'
	LANGUAGE java;

/* Not executed on top of GPDB due to lack of interest in triggers

-- org.postgresql.pljava.example.Triggers

CREATE TABLE javatest.username_test
	(
		name		text,
		username	text not null
	) DISTRIBUTED RANDOMLY;

CREATE FUNCTION javatest.insert_username()
	RETURNS trigger
	AS 'org.postgresql.pljava.example.Triggers.insertUsername'
	LANGUAGE java;

CREATE FUNCTION javatest.after_username_insert()
	RETURNS trigger
	AS 'org.postgresql.pljava.example.Triggers.afterUsernameInsert'
	LANGUAGE java;

CREATE FUNCTION javatest.after_username_update()
	RETURNS trigger
	AS 'org.postgresql.pljava.example.Triggers.afterUsernameUpdate'
	LANGUAGE java;

CREATE FUNCTION javatest.leak_statements()
	RETURNS trigger
	AS 'org.postgresql.pljava.example.Triggers.leakStatements'
	LANGUAGE java;

CREATE TRIGGER insert_usernames
	BEFORE INSERT OR UPDATE ON username_test
	FOR EACH ROW
	EXECUTE PROCEDURE insert_username (username);

CREATE TRIGGER after_insert_usernames
	AFTER INSERT ON username_test
	FOR EACH ROW
	EXECUTE PROCEDURE after_username_insert (username);

CREATE TRIGGER after_username_updates
	AFTER UPDATE ON username_test
	FOR EACH ROW
	EXECUTE PROCEDURE after_username_update (username);

CREATE TRIGGER username_leak
	BEFORE UPDATE ON username_test
	FOR EACH ROW
	EXECUTE PROCEDURE leak_statements();

CREATE TABLE javatest.mdt
	(
		id		int4,
		idesc	text,
		moddate	timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL
	) DISTRIBUTED RANDOMLY;

CREATE FUNCTION javatest.moddatetime()
	RETURNS trigger
	AS 'org.postgresql.pljava.example.Triggers.moddatetime'
	LANGUAGE java;

CREATE TRIGGER mdt_moddatetime
	BEFORE UPDATE ON mdt
	FOR EACH ROW
	EXECUTE PROCEDURE moddatetime (moddate);
*/

-- org.postgresql.pljava.example.TupleReturn

CREATE TYPE javatest._testSetReturn
	AS (base integer, incbase integer, ctime timestamptz);

CREATE FUNCTION javatest.tupleReturnExample(int, int)
	RETURNS _testSetReturn
	AS 'org.postgresql.pljava.example.TupleReturn.tupleReturn'
	IMMUTABLE LANGUAGE java;

CREATE FUNCTION javatest.tupleReturnExample2(int, int)
	RETURNS _testSetReturn
	AS 'org.postgresql.pljava.example.TupleReturn.tupleReturn(java.lang.Integer, java.lang.Integer, java.sql.ResultSet)'
	IMMUTABLE LANGUAGE java;

CREATE FUNCTION javatest.tupleReturnToString(_testSetReturn)
	RETURNS VARCHAR
	AS 'org.postgresql.pljava.example.TupleReturn.makeString'
	IMMUTABLE LANGUAGE java;

CREATE FUNCTION javatest.setReturnExample(int, int)
	RETURNS SETOF javatest._testSetReturn
	AS 'org.postgresql.pljava.example.TupleReturn.setReturn'
	IMMUTABLE LANGUAGE java;

-- org.postgresql.pljava.example.HugeResultSet

CREATE FUNCTION javatest.hugeResult(int)
	RETURNS SETOF javatest._testSetReturn
	AS 'org.postgresql.pljava.example.HugeResultSet.executeSelect'
	IMMUTABLE LANGUAGE java;

CREATE FUNCTION javatest.hugeNonImmutableResult(int)
	RETURNS SETOF javatest._testSetReturn
	AS 'org.postgresql.pljava.example.HugeResultSet.executeSelect'
	LANGUAGE java;

-- org.postgresql.pljava.example.Users

CREATE FUNCTION javatest.listSupers()
	RETURNS SETOF pg_user
	AS 'org.postgresql.pljava.example.Users.listSupers'
	LANGUAGE java;

CREATE FUNCTION javatest.listNonSupers()
	RETURNS SETOF pg_user
	AS 'org.postgresql.pljava.example.Users.listNonSupers'
	LANGUAGE java;

-- org.postgresql.pljava.example.UsingProperties

CREATE TYPE javatest._properties
	AS (name varchar(200), value varchar(200));

CREATE FUNCTION javatest.propertyExample()
	RETURNS SETOF javatest._properties
	AS 'org.postgresql.pljava.example.UsingProperties.getProperties'
	IMMUTABLE LANGUAGE java;

-- org.postgresql.pljava.example.UsingPropertiesAsResultSet

CREATE FUNCTION javatest.resultSetPropertyExample()
	RETURNS SETOF javatest._properties
	AS 'org.postgresql.pljava.example.UsingPropertiesAsResultSet.getProperties'
	IMMUTABLE LANGUAGE java;

CREATE FUNCTION javatest.scalarPropertyExample()
	RETURNS SETOF varchar
	AS 'org.postgresql.pljava.example.UsingPropertiesAsScalarSet.getProperties'
	IMMUTABLE LANGUAGE java;

-- org.postgresql.pljava.example.RandomInts

CREATE FUNCTION javatest.randomInts(int)
	RETURNS SETOF int
	AS 'org.postgresql.pljava.example.RandomInts.createIterator'
	IMMUTABLE LANGUAGE java;

-- org.postgresql.pljava.example.LoggerTest

CREATE FUNCTION javatest.logMessage(varchar, varchar)
	RETURNS void
	AS 'org.postgresql.pljava.example.LoggerTest.logMessage'
	LANGUAGE java;

-- org.postgresql.pljava.example.BinaryColumnTest

CREATE TYPE javatest.BinaryColumnPair
	AS (col1 bytea, col2 bytea);

CREATE FUNCTION javatest.binaryColumnTest()
	RETURNS SETOF javatest.BinaryColumnPair
	AS 'org.postgresql.pljava.example.BinaryColumnTest.getBinaryPairs'
	IMMUTABLE LANGUAGE java;

-- org.postgresql.pljava.example.MetaDataBooleans

CREATE TYPE javatest.MetaDataBooleans
	AS (method_name varchar(200), result boolean);

CREATE FUNCTION javatest.getMetaDataBooleans()
	RETURNS SETOF javatest.MetaDataBooleans
	AS 'org.postgresql.pljava.example.MetaDataBooleans.getDatabaseMetaDataBooleans'
	LANGUAGE java;

-- org.postgresql.pljava.example.MetaDataStrings

CREATE TYPE javatest.MetaDataStrings
	AS (method_name varchar(200), result varchar);

CREATE FUNCTION javatest.getMetaDataStrings()
	RETURNS SETOF javatest.MetaDataStrings
	AS 'org.postgresql.pljava.example.MetaDataStrings.getDatabaseMetaDataStrings'
	LANGUAGE java;

-- org.postgresql.pljava.example.MetaDataInts

CREATE TYPE javatest.MetaDataInts
	AS (method_name varchar(200), result int);

CREATE FUNCTION javatest.getMetaDataInts()
	RETURNS SETOF javatest.MetaDataInts
	AS 'org.postgresql.pljava.example.MetaDataInts.getDatabaseMetaDataInts'
	LANGUAGE java;

-- org.postgresql.pljava.example.MetaDataTest

CREATE FUNCTION javatest.callMetaDataMethod(varchar)
	RETURNS SETOF varchar
	AS 'org.postgresql.pljava.example.MetaDataTest.callMetaDataMethod'
	LANGUAGE java;

-- org.postgresql.pljava.example.ResultSetTest

CREATE FUNCTION javatest.executeSelect(varchar)
	RETURNS SETOF VARCHAR
	AS 'org.postgresql.pljava.example.ResultSetTest.executeSelect'
	LANGUAGE java;

-- org.postgresql.pljava.example.SetOfRecordTest

CREATE FUNCTION javatest.executeSelectToRecords(varchar)
	RETURNS SETOF RECORD
	AS 'org.postgresql.pljava.example.SetOfRecordTest.executeSelect'
	LANGUAGE java;

-- org.postgresql.pljava.example.AnyTest

CREATE FUNCTION javatest.loganyelement(anyelement)
	RETURNS anyelement
	AS 'org.postgresql.pljava.example.AnyTest.logAnyElement'
	LANGUAGE java IMMUTABLE STRICT;

CREATE FUNCTION javatest.logany("any")
	RETURNS void
	AS 'org.postgresql.pljava.example.AnyTest.logAny'
	LANGUAGE java IMMUTABLE STRICT;

CREATE FUNCTION javatest.makearray(anyelement)
	RETURNS anyarray
	AS 'org.postgresql.pljava.example.AnyTest.makeArray'
	LANGUAGE java IMMUTABLE STRICT;

-- org.postgresql.pljava.example.SPIActions

CREATE TABLE javatest.employees1
	(
		id		int,
		name	varchar(200),	
		salary	int
	) DISTRIBUTED BY (id);

CREATE TABLE javatest.employees2
	(
		id		int,
		name	varchar(200),
		salary	int,
		transferDay date,
		transferTime time
	)  DISTRIBUTED BY (id);

insert into javatest.employees1 values (1, 'Adam', 100);
insert into javatest.employees1 values (2, 'Brian', 200);
insert into javatest.employees1 values (3, 'Caleb', 300);
insert into javatest.employees1 values (4, 'David', 400);

CREATE FUNCTION javatest.transferPeople(int)
	RETURNS int
	AS 'org.postgresql.pljava.example.SPIActions.transferPeopleWithSalary'
	LANGUAGE java;

CREATE FUNCTION javatest.maxFromSetReturnExample(int, int)
	RETURNS int
	AS 'org.postgresql.pljava.example.SPIActions.maxFromSetReturnExample'
	IMMUTABLE LANGUAGE java;

CREATE FUNCTION javatest.nestedStatements(int)
	RETURNS void
	AS 'org.postgresql.pljava.example.SPIActions.nestedStatements'
	LANGUAGE java;

CREATE FUNCTION javatest.testSavepointSanity()
	RETURNS int
	AS 'org.postgresql.pljava.example.SPIActions.testSavepointSanity'
	IMMUTABLE LANGUAGE java;

CREATE FUNCTION javatest.testTransactionRecovery()
	RETURNS int
	AS 'org.postgresql.pljava.example.SPIActions.testTransactionRecovery'
	IMMUTABLE LANGUAGE java;

CREATE FUNCTION javatest.getDateAsString()
	RETURNS varchar
	AS 'org.postgresql.pljava.example.SPIActions.getDateAsString'
	STABLE LANGUAGE java;

CREATE FUNCTION javatest.getTimeAsString()
	RETURNS varchar
	AS 'org.postgresql.pljava.example.SPIActions.getTimeAsString'
	STABLE LANGUAGE java;

-- Misc for GPDB

CREATE TABLE javatest.test AS
    SELECT 1 as i
    distributed by (i);
