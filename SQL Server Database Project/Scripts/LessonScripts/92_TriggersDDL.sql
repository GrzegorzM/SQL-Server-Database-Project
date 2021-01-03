CREATE TRIGGER trCreateTableMessage
ON DATABASE FOR CREATE_TABLE
AS BEGIN
	PRINT 'New table created.';
END;

CREATE TRIGGER trCreateTableMessage2
ON DATABASE FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS BEGIN
	PRINT 'Created, altered or dropped a table.';
END;

-- Prevent users from creating, altering or dropping tables.
CREATE TRIGGER trRollbackAllDDL -- To be able to create, alter or drop a table, disable or delete this trigger.
ON DATABASE FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS BEGIN
	ROLLBACK; 
	PRINT 'Cannot create, alter or drop a table.';
END;

CREATE TABLE FOO(Id INT);
DROP TABLE FOO;

DISABLE TRIGGER trRollbackAllDDL ON DATABASE;
ENABLE TRIGGER trRollbackAllDDL ON DATABASE;
DROP TRIGGER trRollbackAllDDL ON DATABASE;

CREATE TRIGGER trRenameMessage
ON DATABASE FOR RENAME
AS BEGIN
	PRINT 'Table or column name has been changed.';
END;

sp_rename 'FOO', 'BAR';
sp_rename 'BAR.Id', 'NewId', 'column';