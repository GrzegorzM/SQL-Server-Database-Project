select * from tblEmployeeSelfJoin;

select e.Name as Employee, m.Name as Manager from tblEmployeeSelfJoin e left join tblEmployeeSelfJoin m on e.ManagerId = m.EmployeeId;
select e.Name as Employee, IsNull(m.Name, 'The employee has no manager') as Manager from tblEmployeeSelfJoin e left join tblEmployeeSelfJoin m on e.ManagerId = m.EmployeeId;
select e.Name as Employee, m.Name as Manager from tblEmployeeSelfJoin e inner join tblEmployeeSelfJoin m on e.ManagerId = m.EmployeeId;
select e.Name as Employee, m.Name as Manager from tblEmployeeSelfJoin e cross join tblEmployeeSelfJoin m;