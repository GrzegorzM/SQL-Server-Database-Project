-- CTE with one base table - Update possible
WITH EmployeeNameGenderCTE
AS (
	SELECT Id, Name, Gender from tblEmployee
)
Select * from EmployeeNameGenderCTE;

WITH EmployeeNameGenderCTE
AS (
	SELECT Id, Name, Gender from tblEmployee
)
UPDATE EmployeeNameGenderCTE SET Gender = 'Female' Where Id = 17;

-- CTE with multiple base tables - Update inpossible when affects multiple tables
WITH EmployeesByDepartment
AS (
	Select Id, Name, Gender, DeptName from tblEmployee e
	join tblDepartment d on e.DeptID = d.DeptID
)
Select * from EmployeesByDepartment;

WITH EmployeesByDepartment
AS (
	Select Id, Name, Gender, DeptName from tblEmployee e
	join tblDepartment d on e.DeptID = d.DeptID
)
UPDATE EmployeesByDepartment SET Gender = 'Female' Where Id = 17; -- Update allowed, affects only one base table

WITH EmployeesByDepartment
AS (
	Select Id, Name, Gender, DeptName from tblEmployee e
	join tblDepartment d on e.DeptID = d.DeptID
)
UPDATE EmployeesByDepartment SET Gender = 'Female', DeptName = 'HR' Where Id = 17; -- Update disallowed, affects multiple base tables