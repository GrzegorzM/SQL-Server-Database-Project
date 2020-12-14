CREATE TRIGGER TR_tblEmployee_ForUpdate
ON tblEmployee FOR UPDATE
AS BEGIN
	SELECT * FROM deleted; -- Data before update
	SELECT * FROM inserted; -- Data after update
END;

Select * from tblEmployee;
UPDATE tblEmployee SET Name = 'Sarah' Where Name = 'Sara';

ALTER TRIGGER TR_tblEmployee_ForUpdate
ON tblEmployee FOR UPDATE
AS BEGIN
	DECLARE @Id INT, @OldSalary INT, @NewSalary INT, @OldDeptId INT, @NewDeptId INT;
	DECLARE @OldName nvarchar(20), @NewName nvarchar(20), @OldGender nvarchar(20), @NewGender nvarchar(20);
	DECLARE @AuditString nvarchar(1000);

	Select * into #TempTable from inserted;

	WHILE(EXISTS(Select Id from #TempTable))
	BEGIN
		SET @AuditString = '';

		SELECT TOP 1 @Id = Id, @NewName = Name, @NewGender = Gender, @NewSalary = Salary, @NewDeptId = DeptId FROM #TempTable;
		SELECT @OldName = Name, @OldGender = Gender, @OldSalary = Salary, @OldDeptId = DeptId FROM deleted WHERE Id = @Id;

		SET @AuditString = 'Employee with Id = ' + CAST(@Id as nvarchar(4)) + ' changed:';
		IF(@OldName <> @NewName)
			SET @AuditString = @AuditString + ' Name from ' + @OldName + ' to ' + @NewName;
		IF(@OldGender <> @NewGender)
			SET @AuditString = @AuditString + ' Name from ' + @OldGender + ' to ' + @NewGender;
		IF(@OldSalary <> @NewSalary)
			SET @AuditString = @AuditString + ' Name from ' + @OldSalary + ' to ' + @NewSalary;
		IF(@OldDeptId <> @NewDeptId)
			SET @AuditString = @AuditString + ' Name from ' + @OldDeptId + ' to ' + @NewDeptId;

		INSERT INTO tblEmployeeAudit VALUES(@AuditString);
		DELETE FROM #TempTable WHERE ID = @Id;
	END;
END;

UPDATE tblEmployee SET Name = 'Sara' Where Name = 'Sarah';
Select * from tblEmployeeAudit;