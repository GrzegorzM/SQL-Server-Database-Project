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
			SET @AuditString = @AuditString + ' Gender from ' + @OldGender + ' to ' + @NewGender;
		IF(@OldSalary <> @NewSalary)
			SET @AuditString = @AuditString + ' Salary from ' + CAST(@OldSalary as nvarchar(10)) + ' to ' + CAST(@NewSalary as nvarchar(10));
		IF(@OldDeptId <> @NewDeptId)
			SET @AuditString = @AuditString + ' DeptId from ' + CAST(@OldDeptId as nvarchar(10)) + ' to ' + CAST(@NewDeptId as nvarchar(10));

		INSERT INTO tblEmployeeAudit VALUES(@AuditString);
		DELETE FROM #TempTable WHERE ID = @Id;
	END;
END;

UPDATE tblEmployee SET Salary = 4000 WHERE Id IN(5, 6); -- Does not work when updating multiple rows.
UPDATE tblEmployee SET Name = 'Sara' Where Name = 'Sarah';
Select * from tblEmployeeAudit;