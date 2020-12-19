-- Using Views
CREATE VIEW vEmployeeByDepartmentCount
AS
	Select DeptName, e.DeptID, Count(Id) as TotalEmployees from tblEmployee e join tblDepartment d on e.DeptID = d.DeptID
	group by DeptName, e.DeptID;

Select DeptName, TotalEmployees from vEmployeeByDepartmentCount
Where TotalEmployees >= 2;

Select * from tblEmployee;
Select * from tblDepartment;

-- Using Temporary Tables(local temp table - #)
Select DeptName, e.DeptID, Count(Id) as TotalEmployees
into #TempEmployeeCount
from tblEmployee e join tblDepartment d on e.DeptID = d.DeptID
group by DeptName, e.DeptID;

Select DeptName, TotalEmployees from #TempEmployeeCount
Where TotalEmployees >= 2;

Drop Table #TempEmployeeCount; -- Good practice

-- Using Table Variable
Declare @tblEmployeeCount table
(DeptName nvarchar(20),DepartmentId int, TotalEmployees int)

Insert @tblEmployeeCount
Select DeptName, e.DeptID, COUNT(*) as TotalEmployees from tblEmployee e
join tblDepartment d on e.DeptID = d.DeptID
group by DeptName, e.DeptID

Select DeptName, TotalEmployees from @tblEmployeeCount
where  TotalEmployees >= 2

-- Using Derived Tables
Select DeptName, TotalEmployees from 
 (Select DeptName, e.DeptID, COUNT(*) as TotalEmployees from tblEmployee e join tblDepartment d on e.DeptID = d.DeptID
  group by DeptName, e.DeptID) as EmployeeCount
where TotalEmployees > 2;

-- Using CTE
With EmployeeCount(DeptName, DepartmentId, TotalEmployees)
as
(Select DeptName, e.DeptID, COUNT(*) as TotalEmployees from tblEmployee e join tblDepartment d on e.DeptID = d.DeptID
 group by DeptName, e.DeptID)

Select DeptName, TotalEmployees from EmployeeCount
where TotalEmployees >= 2;