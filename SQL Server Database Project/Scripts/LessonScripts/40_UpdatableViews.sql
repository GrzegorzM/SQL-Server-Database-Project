-- Non-updatable view(multiple base tables)
Create View vEmployeesHideSalary
AS
	Select Id, Name, Gender, Email, DateOfBirth, DeptName from tblEmployee e
	join tblDepartment d on e.DeptID = d.DeptID;
Select * from vEmployeesHideSalary;

Update vEmployeesHideSalary Set Name = 'Michael' where Id = 2; -- Simple update works as expected
Update vEmployeesHideSalary Set DeptName = 'Admin' where Name = 'Mike'; -- Updated DeptName from Payroll to Admin in tblDepartment table, instead of upadting DepartmentId column in tblEmployee table. So, the conclusion - If a view is based on multiple tables, and if you update the view, it may not update the underlying base tables correctly. To correctly update a view, that is based on multiple table, INSTEAD OF triggers are used.
Select * from tblDepartment;
Update tblDepartment set DeptName = 'Payroll' where DeptID = 2;
Select * from tblEmployee;
Delete from vEmployeesHideSalary where Id = 11; -- View or function 'vEmployeesHideSalary' is not updatable because the modification affects multiple base tables.
Insert into vEmployeesHideSalary Values('Mike', 'Male', 'Mike@mail.com', GETDATE(), 'IT'); -- View or function 'vEmployeesHideSalary' is not updatable because the modification affects multiple base tables.

-- Updatable view(single base table)
Create View vEmployeesHideSalaryUpdatable
AS
	Select Id, Name, Gender, Email, DateOfBirth from tblEmployee;
Select * from vEmployeesHideSalaryUpdatable;

Update vEmployeesHideSalary Set Name = 'Mike' where Id = 2; 
Delete from vEmployeesHideSalaryUpdatable where Id = 10;
Insert into vEmployeesHideSalaryUpdatable Values('Mike', 'Male', 'Mike@mail.com', GETDATE());

