SELECT employee.Name as Employee, ISNULL(manager.Name, 'SUPER BOSS') as Manager from tblEmployeeSelfJoin employee
left join tblEmployeeSelfJoin manager on employee.ManagerId = manager.EmployeeId;

Select * from tblEmployeeSelfJoin;

-- Hierarchy
WITH HierarchyEmployeesCTE (EmployeeId, Name, ManagerId, [Level])
AS (
	SELECT EmployeeId, Name, ManagerId, 1 from tblEmployeeSelfJoin WHERE ManagerId IS NULL
	UNION ALL
	SELECT e.EmployeeId, e.Name, e.ManagerId, cte.[Level] + 1 from tblEmployeeSelfJoin e  JOIN HierarchyEmployeesCTE cte ON e.ManagerId = cte.EmployeeId
)
SELECT cte.Name as Employee, ISNULL(e.Name, 'SUPER BOSS') as Manager FROM HierarchyEmployeesCTE cte
LEFT JOIN tblEmployeeSelfJoin e ON cte.ManagerId = e.EmployeeId; -- CTE join with base table

WITH HierarchyEmployeesCTE (EmployeeId, Name, ManagerId, [Level])
AS (
	SELECT EmployeeId, Name, ManagerId, 1 from tblEmployeeSelfJoin WHERE ManagerId IS NULL
	UNION ALL
	SELECT e.EmployeeId, e.Name, e.ManagerId, cte.[Level] + 1 from tblEmployeeSelfJoin e  JOIN HierarchyEmployeesCTE cte ON e.ManagerId = cte.EmployeeId
)
SELECT employeeCTE.Name as Employee, ISNULL(managerCTE.Name, 'SUPER BOSS') as Manager, employeeCTE.Level FROM HierarchyEmployeesCTE employeeCTE
LEFT JOIN HierarchyEmployeesCTE managerCTE ON employeeCTE.ManagerId = managerCTE.EmployeeId; -- CTE self join