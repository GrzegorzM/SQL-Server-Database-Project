CREATE TRIGGER trAuditTableChanges
ON ALL SERVER FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS BEGIN
	SELECT EventData();
END;

CREATE TABLE TableRemove(Id INT);
DROP TABLE TableRemove;

CREATE TABLE TableChanges(
	Id INT PRIMARY KEY IDENTITY(1,1),
	DatabaseName Nvarchar(250) NOT NULL,
	TableName Nvarchar(250) NOT NULL,
	EventType Nvarchar(250) NOT NULL,
	LoginName Nvarchar(250) NOT NULL,
	SQLCommand Nvarchar(2500) NOT NULL,
	AuditDateTime DATETIME NOT NULL,
);

ALTER TRIGGER trAuditTableChanges
ON  ALL SERVER FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS BEGIN
	DECLARE @EventData XML;
	SELECT @EventData = EventData();

	INSERT INTO Sample.dbo.TableChanges VALUES( -- Server-scoped trigger, fully qualified table name required.
		@EventData.value('(/EVENT_INSTANCE/DatabaseName)[1]', 'Nvarchar(250)'),
		@EventData.value('(/EVENT_INSTANCE/ObjectName)[1]', 'Nvarchar(250)'),
		@EventData.value('(/EVENT_INSTANCE/EventType)[1]', 'Nvarchar(250)'),
		@EventData.value('(/EVENT_INSTANCE/LoginName)[1]', 'Nvarchar(250)'),
		@EventData.value('(/EVENT_INSTANCE/TSQLCommand)[1]', 'Nvarchar(2500)'),
		GETDATE()
	);
END;

Select * from Sample.dbo.TableChanges;
Select * from TableChanges;
DROP TRIGGER trAuditTableChanges ON ALL SERVER;