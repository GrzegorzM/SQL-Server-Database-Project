-- CTE - Common Table Expressions
WITH EmployeeCountCTE(DeptId, TotalEmployees) -- Optional Column Names
AS (
	Select DeptId, Count(Id) as TotalEmployees FROM tblEmployee
	GROUP BY DeptId
)

Select DeptName, TotalEmployees FROM EmployeeCountCTE e
join tblDepartment d on e.DeptId = d.DeptId
ORDER BY DeptName;

WITH EmployeeCountCTE
AS (
	Select DeptId, Count(Id) as TotalEmployees FROM tblEmployee
	GROUP BY DeptId
)

Select DeptName, TotalEmployees FROM EmployeeCountCTE e
join tblDepartment d on e.DeptId = d.DeptId
ORDER BY DeptName;

WITH EmployeeCountCTE(DId, Total) -- Renamed Column Names
AS (
	Select DeptId, Count(Id) as TotalEmployees FROM tblEmployee
	GROUP BY DeptId
)

Select DeptName, Total FROM EmployeeCountCTE e
join tblDepartment d on e.DId = d.DeptId
ORDER BY DeptName;

-- Error - The CTE does not immediately followed by a (DELETE,SELECT,INSERT,UPDATE)statement.
WITH EmployeeCountCTE(DeptId, TotalEmployees)
AS (
	Select DeptId, Count(Id) as TotalEmployees FROM tblEmployee
	GROUP BY DeptId
)
Select 'Hello World'; -- After this line, CTE is gone.
Select DeptName, TotalEmployees FROM EmployeeCountCTE e
join tblDepartment d on e.DeptId = d.DeptId
ORDER BY DeptName;

-- CTE Chaining
WITH EmployeeCountBy_IT_Department_CTE(DeptId, TotalEmployees)
AS (
	Select d.DeptName, Count(Id) as TotalEmployees FROM tblEmployee e
	join tblDepartment d on e.DeptID = d.DeptID
	WHERE DeptName IN('IT')
	GROUP BY d.DeptName
),
EmployeeCountBy_HR_Department_CTE(DeptId, TotalEmployees)
AS (
	Select d.DeptName, Count(Id) as TotalEmployees FROM tblEmployee e
	join tblDepartment d on e.DeptID = d.DeptID
	WHERE DeptName IN('HR')
	GROUP BY d.DeptName
)
Select * from EmployeeCountBy_IT_Department_CTE
UNION
Select * from EmployeeCountBy_HR_Department_CTE;