-- returns a table
CREATE FUNCTION fnEmployeeByGender(@Gender nvarchar(10)) RETURNS TABLE
AS
	RETURN (Select Id, Name, DateOfBirth, Gender, DeptId from tblEmployee where Gender = @Gender);

Select * from dbo.fnEmployeeByGender('Male') where DeptId = 3;

SELECT Name, Gender, dept.DeptName FROM fnEmployeeByGender('Male') emp
JOIN tblDepartment dept on emp.DeptID = dept.DeptID;

-- Can be used to achieve the functionality of parameterized views.