select * from tblEmployee;
select * from tblDepartment;

select Name, Gender, Salary, DepartmentName
from tblEmployee e join tblDepartment d on e.DeptID = d.Id; -- 'join' same as 'inner join'
select Name, Gender, Salary, DepartmentName
from tblEmployee e inner join tblDepartment d on e.DeptID = d.Id;

select Name, Gender, Salary, d.DepartmentName
from tblEmployee e left join tblDepartment d on e.DeptID = d.Id; -- 'left join' same as 'left outer join'

select Name, Gender, Salary, d.DepartmentName
from tblEmployee e right join tblDepartment d on e.DeptID = d.Id; -- 'right join' same as 'right outer join'

select Name, Gender, Salary, d.DepartmentName
from tblEmployee e full join tblDepartment d on e.DeptID = d.Id; -- 'full join' same as 'full outer join'

select Name, Gender, Salary, d.DepartmentName
from tblEmployee e cross join tblDepartment d;