Create Procedure spGetEmployeeCountByGender
	@gender nvarchar(50),
	@employeeCount int output
as begin
	Select @employeeCount = Count(*) from tblEmployee where Gender = @gender
end;

Declare @EmployeeTotal int
Execute spGetEmployeeCountByGender 'Male', @EmployeeTotal Output
Print @EmployeeTotal;

Declare @TotalCount int
Execute spGetEmployeeCountByGender @employeeCount = @TotalCount Out, @gender ='Male'
Print @TotalCount;

sp_help spGetEmployeeCountByGender; -- Alternatively highlight object name and use Alt + F1
sp_helptext spGetEmployeeCountByGender;
sp_depends spGetEmployeeCountByGender;
sp_depends tblEmployee;