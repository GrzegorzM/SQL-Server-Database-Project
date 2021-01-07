CREATE TRIGGER trDatabase
ON DATABASE FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS BEGIN
	PRINT 'Database scoped trigger.';
END;

CREATE TRIGGER trServer
ON ALL SERVER FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS BEGIN
	PRINT 'Server scoped trigger.';
END;

-- Server scoped triggers will always fire before any of the database scoped triggers. This execution order cannot be changed.
CREATE TABLE FOO(Id INT);
DROP TABLE FOO;

CREATE TRIGGER trDatabase3
ON DATABASE FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS BEGIN
	PRINT 'Database scoped trigger - 3.';
END;

CREATE TRIGGER trDatabase2
ON DATABASE FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS BEGIN
	PRINT 'Database scoped trigger - 2.';
END;

CREATE TRIGGER trDatabase1
ON DATABASE FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS BEGIN
	PRINT 'Database scoped trigger - 1.';
END;

CREATE TABLE FOO(Id INT);
DROP TABLE FOO;
-- Use the sp_settriggerorder stored procedure to set the execution order of server-scoped or database-scoped triggers.
EXEC sp_settriggerorder
	@triggername = 'trDatabase1',
	@order = 'first', -- Value can be First, Last or None. When set to None, trigger is fired in random order
	@stmttype = 'CREATE_TABLE', -- SQL statement that fires the trigger. Can be INSERT, UPDATE, DELETE or any DDL 
	@namespace = 'DATABASE' -- Scope of the trigger. Value can be DATABASE, SERVER, or NULL.
GO

EXEC sp_settriggerorder
	@triggername = 'trDatabase3',
	@order = 'last',
	@stmttype = 'CREATE_TABLE',
	@namespace = 'DATABASE'
GO

EXEC sp_settriggerorder
	@triggername = 'trDatabase1',
	@order = 'first',
	@stmttype = 'DROP_TABLE',
	@namespace = 'DATABASE'
GO