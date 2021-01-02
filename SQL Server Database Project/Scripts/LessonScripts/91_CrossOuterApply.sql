-- The APPLY operator is used to join a table to a table-valued function.
-- The Table Valued Function on the right hand side of the APPLY operator gets called for each row from the left (also called outer table) table.
-- Cross Apply returns only matching rows (semantically equivalent to Inner Join)
-- Outer Apply returns matching + non-matching rows (semantically equivalent to Left Outer Join). The unmatched columns of the table valued function will be set to NULL.

INSERT INTO tblDepartment VALUES('Sales');
SELECT * FROM tblEmployee;
SELECT * FROM tblDepartment;

SELECT d.DeptName, Name, Gender, Salary from tblEmployee e
JOIN tblDepartment d on e.DeptID = d.DeptID;

SELECT d.DeptName, Name, Gender, Salary from tblEmployee e
INNER JOIN tblDepartment d on e.DeptID = d.DeptID;

SELECT d.DeptName, Name, Gender, Salary from tblEmployee e
LEFT JOIN tblDepartment d on e.DeptID = d.DeptID;

CREATE FUNCTION fnGetEmployeesBydepartmentId(@DepartmentId INT)
RETURNS TABLE AS
RETURN (
	SELECT * from tblEmployee WHERE DeptID = @DepartmentId
);

SELECT * FROM fnGetEmployeesBydepartmentId(1);

SELECT d.DeptName, e.Name, e.Gender, e.Salary from tblDepartment d -- Error - The multi-part identifier "d.DeptID" could not be bound. Impossible to join table with table valued functions.
INNER JOIN fnGetEmployeesBydepartmentId(d.DeptID) e on e.DeptID = d.DeptID;

SELECT d.DeptName, e.Name, e.Gender, e.Salary from tblDepartment as d -- INNER JOIN
CROSS APPLY fnGetEmployeesBydepartmentId(d.DeptID) as e;

SELECT d.DeptName, e.Name, e.Gender, e.Salary from tblDepartment as d -- LEFT JOIN
OUTER APPLY fnGetEmployeesBydepartmentId(d.DeptID) as e;