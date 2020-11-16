Select Name, Gender from tblEmployee;

Create Procedure spGetEmployees
As
Begin
	Select Name, Gender from tblEmployee
End;

spGetEmployees;
exec spGetEmployees;
execute spGetEmployees;


Create Proc spGetEmployeesByGenderAndDepartment
	@Gender nvarchar(20),
	@DepartmentId int
As
Begin
	Select Name, Gender, DeptID from tblEmployee
	Where Gender = @Gender and DeptID = @DepartmentId
End;

exec spGetEmployeesByGenderAndDepartment 'Male', 2;
exec spGetEmployeesByGenderAndDepartment @DepartmentId = 2, @Gender = 'Male';

sp_helptext spGetEmployeesByGenderAndDepartment;

Alter Procedure spGetEmployees
As
Begin
	Select Name, Gender from tblEmployee 
	Order by Name
End;

Drop Procedure spGetEmployees;

Alter Proc spGetEmployeesByGenderAndDepartment
	@Gender nvarchar(20),
	@DepartmentId int
	With Encryption
As
Begin
	Select Name, Gender, DeptID from tblEmployee
	Where Gender = @Gender and DeptID = @DepartmentId
End;

sp_helptext spGetEmployeesByGenderAndDepartment;