CREATE TABLE tblEmployeeAudit(
	ID INT PRIMARY KEY IDENTITY,
	AUDITDATE nvarchar(200) NOT NULL
);

CREATE TRIGGER TR_tblEmployee_ForInsert
ON tblEmployee FOR INSERT
AS BEGIN
	Select * from inserted;
	Select * from tblEmployee;
END;

Insert INTO tblEmployee values('Sara', 'Female', 4, 'Sara@mail.com', GETDATE(), 3456);

ALTER TRIGGER TR_tblEmployee_ForInsert
ON tblEmployee FOR INSERT
AS BEGIN
	DECLARE @Id INT;
	Select @Id = Id from inserted;

	INSERT INTO tblEmployeeAudit values('New employee with Id = ' + Cast(@Id as nvarchar(10)) + ' is added at ' + Cast(GETDATE() as nvarchar(20)));
END;

Select * from tblEmployeeAudit;

CREATE TRIGGER TR_tblEmployee_ForDelete
ON tblEmployee FOR DELETE
AS BEGIN
	DECLARE @Id INT;
	Select @Id = Id from deleted;

	INSERT INTO tblEmployeeAudit values('An existing employee with Id = ' + Cast(@Id as nvarchar(10)) + ' is deleted at ' + Cast(GETDATE() as nvarchar(20)));
END;

Delete from tblEmployee Where Id In(15, 16); -- Trigger doesn't work on multiple lines(Only the first row is logged).
Delete from tblEmployee Where Id = 14;