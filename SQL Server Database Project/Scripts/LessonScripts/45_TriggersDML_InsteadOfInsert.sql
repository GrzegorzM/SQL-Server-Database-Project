CREATE VIEW vEmployeeDetails
AS
	Select Id, Name, Gender, DeptName from tblEmployee e
	join tblDepartment d on e.DeptID = d.DeptID;
Select * from vEmployeeDetails;

INSERT INTO vEmployeeDetails VALUES(14, 'Katarina', 'Female', 'Payroll'); -- Error - View or function 'vEmployeeDetails' is not updatable because the modification affects multiple base tables.

CREATE TRIGGER TR_vEmployeeDetails_InsteadOfInsert
ON vEmployeeDetails INSTEAD OF INSERT
AS BEGIN
	Select * from inserted; -- Displays the inserted row.
	Select * from deleted; -- Empty result - no rows were deleted due to an error.
END;

ALTER TRIGGER TR_vEmployeeDetails_InsteadOfInsert
ON vEmployeeDetails INSTEAD OF INSERT
AS BEGIN
	DECLARE @DeptId INT;

	SELECT @DeptId = DeptId from tblDepartment d
	join inserted i on d.DeptName = i.DeptName;

	IF(@DeptId IS NULL)
	BEGIN
		RAISERROR('Invalid Department Name. Statement terminated.', 16, 1);
		RETURN;
	END

	INSERT INTO tblEmployee (Name, Gender, DeptID)
	SELECT Name, Gender, @DeptId from inserted;
END;


INSERT INTO vEmployeeDetails VALUES('Katarina', 'Female', 'Payroll'); -- Error - Specify a value for all columns in view, even if it is an identity column(the value will not be used but is required). Column name or number of supplied values does not match table definition.
