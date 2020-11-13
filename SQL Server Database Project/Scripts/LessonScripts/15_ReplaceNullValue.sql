select e.Name as Employee, IsNull(m.Name, 'No manager') as Manager from tblEmployeeSelfJoin e left join tblEmployeeSelfJoin m on e.ManagerId = m.EmployeeId;
select IsNull('Random Value', 'No Manager') as Manager;
select IsNull(NULL, 'No Manager') as Manager;

select e.Name as Employee, Coalesce(m.Name, 'No manager') as Manager from tblEmployeeSelfJoin e left join tblEmployeeSelfJoin m on e.ManagerId = m.EmployeeId;
select Coalesce('Random Value', 'No Manager') as Manager;
select Coalesce(NULL, 'No Manager') as Manager;

CASE WHEN Expression THEN '' ELSE '' END;
select e.Name as Employee, CASE WHEN m.Name is null THEN 'No manager' ELSE m.Name END as Manager from tblEmployeeSelfJoin e left join tblEmployeeSelfJoin m on e.ManagerId = m.EmployeeId;