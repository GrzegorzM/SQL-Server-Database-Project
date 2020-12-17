Select * from vEmployeeDetails;

-- Update affecting multiple base tables
Update vEmployeeDetails Set Name = 'Sarah', DeptName = 'IT' Where Id = 13; -- ERROR - View or function 'vEmployeeDetails' is not updatable because the modification affects multiple base tables.

-- Update affecting one base tables
Update vEmployeeDetails Set DeptName = 'IT' Where Id = 3; -- Works but unexpected update(Updating DeptName in tblDepartment insted of DeptId in tblEmployee)

CREATE TRIGGER TR_vEmployeeDetails_InsteadOfUpdate
ON vEmployeeDetails INSTEAD OF UPDATE
AS BEGIN
	
	-- IF EmployeeId is updated
	IF(UPDATE(ID))
	BEGIN
		RAISERROR('Id cannot be changed', 16, 1);
		RETURN;
	END

	-- IF DeptName is updated
	IF(UPDATE(DeptName))
	BEGIN
		DECLARE @DeptId INT;

		SELECT @DeptId = DeptId from tblDepartment d join inserted i on d.DeptName = i.DeptName;
		IF(@DeptId IS NULL)
		BEGIN
			RAISERROR('Invalid Department Name', 16, 1);
			RETURN;
		END

		UPDATE tblEmployee SET DeptId = @DeptId FROM inserted i join tblEmployee e on i.Id = e.Id;
	END

		-- IF Gender is updated
	IF(UPDATE(Gender))
	BEGIN
		UPDATE tblEmployee SET Gender = i.Gender FROM inserted i join tblEmployee e on i.Id = e.Id;
	END

		-- IF Name is updated
	IF(UPDATE(Name))
	BEGIN
		UPDATE tblEmployee SET Name = i.Name FROM inserted i join tblEmployee e on i.Id = e.Id;
	END
END;

Update vEmployeeDetails Set DeptName = 'NotExistingDepartment' Where Id = 3; -- Invalid Department Name
Update vEmployeeDetails Set DeptName = 'IT' Where Id = 13;
Update vEmployeeDetails Set Name = 'Sarah', Gender = 'Female', DeptName = 'Admin' Where Id = 13;