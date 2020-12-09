Select Id, Name, Salary, Gender, DeptName from tblEmployee e
join tblDepartment d on e.DeptID = d.DeptID

Create View vEmployeesByDepartment
AS
	Select Id, Name, Salary, Gender, DeptName from tblEmployee e
	join tblDepartment d on e.DeptID = d.DeptID;

Select * from vEmployeesByDepartment;
sp_helptext vEmployeesByDepartment;

-- Granting access to resources needed and hiding resources that shouldnt be visible
-- Views can be used as a mechanism to implement row and column level security.
-- Row Level Security: For example, the end user should only have access to IT department employees(employees who work in IT). If access to the underlying tblEmployees and tblDepartments tables is granted, all employees in the department will be visible. To achieve this, create a view that returns only IT Department employees, and grant the user access to the view, not to the underlying table.
Create View vEmployeesIT
AS
	Select e.*, d.DeptName from tblEmployee e
	join tblDepartment d on e.DeptID = d.DeptID
	where d.DeptName = 'IT';

Select * from vEmployeesIT;

-- Hide Salary
Create View vEmployeesHideSalary
AS
	Select Id, Name, Gender, Email, DateOfBirth, DeptName from tblEmployee e
	join tblDepartment d on e.DeptID = d.DeptID;
Select * from vEmployeesHideSalary;

Create View vSummerizedData
AS
	Select DeptName, Count(Id) as TotalEmployees from tblEmployee e
	join tblDepartment d on e.DeptId = d.DeptID
	group by DeptName;