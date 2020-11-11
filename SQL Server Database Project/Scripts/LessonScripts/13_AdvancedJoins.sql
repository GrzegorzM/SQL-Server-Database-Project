select * from tblEmployee;
select * from tblDepartment;

select Name, Gender, Salary, d.DepartmentName
from tblEmployee e left join tblDepartment d on e.DeptID = d.Id where e.DeptID is null; -- No matching rows from the left table
select Name, Gender, Salary, d.DepartmentName
from tblEmployee e left join tblDepartment d on e.DeptID = d.Id where d.Id is null; -- Same us above

select Name, Gender, Salary, d.DepartmentName
from tblEmployee e right join tblDepartment d on e.DeptID = d.Id where e.DeptID is null; -- No matching rows from the right table

select Name, Gender, Salary, d.DepartmentName
from tblEmployee e full join tblDepartment d on e.DeptID = d.Id where e.DeptID is null or d.Id is null; -- No matching rows from both tables