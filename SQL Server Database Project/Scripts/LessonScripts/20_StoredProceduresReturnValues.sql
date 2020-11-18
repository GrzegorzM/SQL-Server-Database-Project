Create Proc spGetTotalCount1
	@TotalCount int out
As Begin
	Select @TotalCount = Count(Id) from tblEmployee;
End;

Declare @EmployeeTotal int
Execute spGetTotalCount1 @EmployeeTotal Output
Print @EmployeeTotal;

Create Proc spGetTotalCount2
As Begin
	Return (Select Count(Id) from tblEmployee);
End;

Declare @EmployeeTotal int
Execute @EmployeeTotal = spGetTotalCount2
Print @EmployeeTotal;

Create Proc spGetNameById1
	@id int,
	@name nvarchar(50) output
as begin
	Select @name = Name from tblEmployee Where Id = @id;
end;

Declare @Name nvarchar(50)
Execute spGetNameById1 1, @Name Out
Print 'Name = ' + @Name;
-- This procedure is INVALID!!! START
Create Proc spGetNameById2
	@id int
as begin
	Return (Select Name from tblEmployee where Id = @id); -- Procedure cannot return string values(only int and only single int)
	-- We can only return the expected values from query above to the output parameter
end;

Declare @Name nvarchar(50)
Execute @Name = spGetNameById2 1
Print 'Name = ' + @Name;
-- This procedure is INVALID!!! END